Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98B1DAD84
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 10:33:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbK8b-0008Og-7W; Wed, 20 May 2020 08:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbK8a-0008Ob-7F
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 08:31:40 +0000
X-Inumbo-ID: 5317d7ea-9a74-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5317d7ea-9a74-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 08:31:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1989FAE68;
 Wed, 20 May 2020 08:31:41 +0000 (UTC)
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <20200514140522.GD54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83534bf1-fa57-1d4a-c615-f656338a8457@suse.com>
Date: Wed, 20 May 2020 10:31:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514140522.GD54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 16:05, Roger Pau Monné wrote:
> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
>> @@ -251,6 +255,10 @@ boot/mkelf32: boot/mkelf32.c
>>   efi/mkreloc: efi/mkreloc.c
>>   	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
>>   
>> +nocov-y += hweight.o
>> +noubsan-y += hweight.o
>> +hweight.o: CFLAGS += $(foreach reg,cx dx si 8 9 10 11,-ffixed-r$(reg))
> 
> Why not use clobbers in the asm to list the scratch registers? Is it
> that much expensive?

The goal is to disturb the call sites as little as possible. There's
no point avoiding the scratch registers when no call is made (i.e.
when the POPCNT insn can be used). Taking away from the compiler 7
out of 15 registers (that it can hold live data in) seems quite a
lot to me.

>> --- a/xen/include/asm-x86/bitops.h
>> +++ b/xen/include/asm-x86/bitops.h
>> @@ -475,9 +475,36 @@ static inline int fls(unsigned int x)
>>    *
>>    * The Hamming Weight of a number is the total number of bits set in it.
>>    */
>> +#ifndef __clang__
>> +/* POPCNT encodings with %{r,e}di input and %{r,e}ax output: */
>> +#define POPCNT_64 ".byte 0xF3, 0x48, 0x0F, 0xB8, 0xC7"
>> +#define POPCNT_32 ".byte 0xF3, 0x0F, 0xB8, 0xC7"
>> +
>> +#define hweight_(n, x, insn, setup, cout, cin) ({                         \
>> +    unsigned int res_;                                                    \
>> +    /*                                                                    \
>> +     * For the function call the POPCNT input register needs to be marked \
>> +     * modified as well. Set up a local variable of appropriate type      \
>> +     * for this purpose.                                                  \
>> +     */                                                                   \
>> +    typeof((uint##n##_t)(x) + 0U) val_ = (x);                             \
>> +    alternative_io(setup "; call generic_hweight" #n,                     \
>> +                   insn, X86_FEATURE_POPCNT,                              \
>> +                   ASM_OUTPUT2([res] "=a" (res_), [val] cout (val_)),     \
>> +                   [src] cin (val_));                                     \
>> +    res_;                                                                 \
>> +})
>> +#define hweight64(x) hweight_(64, x, POPCNT_64, "", "+D", "g")
>> +#define hweight32(x) hweight_(32, x, POPCNT_32, "", "+D", "g")
>> +#define hweight16(x) hweight_(16, x, "movzwl %w[src], %[val]; " POPCNT_32, \
>> +                              "mov %[src], %[val]", "=&D", "rm")
>> +#define hweight8(x)  hweight_( 8, x, "movzbl %b[src], %[val]; " POPCNT_32, \
>> +                              "mov %[src], %[val]", "=&D", "rm")
> 
> Why not just convert types < 32bits into uint32_t and avoid the asm
> prefix? You are already converting them in hweight_ to an uintX_t.

I don't think I do - there's a conversion to the promoted type
when adding in an unsigned int value (which is there to retain
uint64_t for the 64-bit case, while using unsigned int for all
smaller sizes, as per the parameter types of generic_hweight*()).

> That would made the asm simpler as you would then only need to make
> sure the input is in %rdi and the output is fetched from %rax?

That's an option, yes, but I again wanted to limit the impact to
generated code (including code size) as much as possible.
generic_hweight{8,16}() take unsigned int arguments, not
uint{8,16}_t ones. Hence at the call site (when a function call
is needed) no zero extension is necessary. Therefore the MOVZ
above is to (mainly) overlay the MOV during patching, while the
POPCNT is to (mainly) overlay the CALL.

If the simpler asm()-s were considered more important than the
quality of the generated code, I think we could simply have

#define hweight16(x) hweight32((uint16_t)(x))
#define hweight8(x)  hweight32(( uint8_t)(x))

Jan

