Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C11E7FDA
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:12:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jefk5-00064X-7S; Fri, 29 May 2020 14:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jefk3-00064R-QF
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:12:11 +0000
X-Inumbo-ID: 630c5a38-a1b6-11ea-a8c5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 630c5a38-a1b6-11ea-a8c5-12813bfff9fa;
 Fri, 29 May 2020 14:12:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED984AC24;
 Fri, 29 May 2020 14:12:09 +0000 (UTC)
Subject: Re: [PATCH v10 7/9] x86emul: support FNSTENV and FNSAVE
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <ec5d12df-dbef-af1a-7649-44a9a7d46de4@suse.com>
 <6851a948-e4a8-5caf-e87b-c4b361bdd950@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2031de6-d58f-1480-dd30-b9cdcb928db5@suse.com>
Date: Fri, 29 May 2020 16:12:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6851a948-e4a8-5caf-e87b-c4b361bdd950@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 16:08, Andrew Cooper wrote:
> On 25/05/2020 15:29, Jan Beulich wrote:
>> To avoid introducing another boolean into emulator state, the
>> rex_prefix field gets (ab)used to convey the real/VM86 vs protected mode
>> info (affecting structure layout, albeit not size) to x86_emul_blk().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,

Thanks.

> with one suggestion.
> 
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -856,6 +856,9 @@ struct x86_emulate_state {
>>      enum {
>>          blk_NONE,
>>          blk_enqcmd,
>> +#ifndef X86EMUL_NO_FPU
>> +        blk_fst, /* FNSTENV, FNSAVE */
>> +#endif
>>          blk_movdir,
>>      } blk;
>>      uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
>> @@ -897,6 +900,50 @@ struct x86_emulate_state {
>>  #define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
>>  #endif
>>  
>> +#ifndef X86EMUL_NO_FPU
>> +struct x87_env16 {
>> +    uint16_t fcw;
>> +    uint16_t fsw;
>> +    uint16_t ftw;
>> +    union {
>> +        struct {
>> +            uint16_t fip_lo;
>> +            uint16_t fop:11, :1, fip_hi:4;
>> +            uint16_t fdp_lo;
>> +            uint16_t :12, fdp_hi:4;
>> +        } real;
>> +        struct {
>> +            uint16_t fip;
>> +            uint16_t fcs;
>> +            uint16_t fdp;
>> +            uint16_t fds;
>> +        } prot;
>> +    } mode;
>> +};
>> +
>> +struct x87_env32 {
>> +    uint32_t fcw:16, :16;
>> +    uint32_t fsw:16, :16;
>> +    uint32_t ftw:16, :16;
> 
> uint16_t fcw, :16;
> uint16_t fsw, :16;
> uint16_t ftw, :16;
> 
> ?

You had suggested this before, and I did reply that my intention
was to have x87_env16 use uint16_t throughout, and x87_env32
uint32_t respectively for all its pieces. In the end it doesn't
make a difference, and hence this cosmetic aspect is what made
me pick one of the various possible options.

Jan

