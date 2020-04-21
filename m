Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A171B1E68
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 07:55:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQlrv-0006uQ-N8; Tue, 21 Apr 2020 05:54:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OiHr=6F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jQlru-0006uK-3U
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 05:54:50 +0000
X-Inumbo-ID: 9c5903b2-8394-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c5903b2-8394-11ea-b4f4-bc764e2007e4;
 Tue, 21 Apr 2020 05:54:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 30384AA55;
 Tue, 21 Apr 2020 05:54:47 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] x86/HVM: expose VM assist hypercall
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
 <e5eb3508-141e-dd9d-5177-c08d51ebaaa0@suse.com>
 <1f463b9e-9629-4ba0-3b7f-373b4bcb5b64@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5863d6d0-22cf-7237-a88b-a3a2c4809635@suse.com>
Date: Tue, 21 Apr 2020 07:54:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1f463b9e-9629-4ba0-3b7f-373b4bcb5b64@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.04.2020 19:53, Julien Grall wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1517,20 +1517,23 @@ long do_vcpu_op(int cmd, unsigned int vc
>>       return rc;
>>   }
>>   -#ifdef VM_ASSIST_VALID
>> -long vm_assist(struct domain *p, unsigned int cmd, unsigned int type,
>> -               unsigned long valid)
>> +#ifdef arch_vm_assist_valid
> 
> How about naming the function arch_vm_assist_valid_mask?

Certainly a possibility, albeit to me the gain would be marginal
and possibly not outweigh the growth in length. Andrew, any
preference?

>> --- a/xen/include/asm-x86/domain.h
>> +++ b/xen/include/asm-x86/domain.h
>> @@ -700,6 +700,20 @@ static inline void pv_inject_sw_interrup
>>     pv_inject_event(&event);
>> }
>> +#define PV_VM_ASSIST_VALID  ((1UL << VMASST_TYPE_4gb_segments)        | \
>> +                             (1UL << VMASST_TYPE_4gb_segments_notify) | \
>> +                             (1UL << VMASST_TYPE_writable_pagetables) | \
>> +                             (1UL << VMASST_TYPE_pae_extended_cr3)    | \
>> +                             (1UL << VMASST_TYPE_architectural_iopl)  | \
>> +                             (1UL << VMASST_TYPE_runstate_update_flag)| \
>> +                             (1UL << VMASST_TYPE_m2p_strict))
>> +#define HVM_VM_ASSIST_VALID (1UL << VMASST_TYPE_runstate_update_flag)
>> +
>> +#define arch_vm_assist_valid(d) \
>> +    (is_hvm_domain(d) ? HVM_VM_ASSIST_VALID \
>> +                      : is_pv_32bit_domain(d) ? (uint32_t)PV_VM_ASSIST_VALID \
> 
> I understand this is matching the current code, however without
> looking at the rest of patch this is not clear why the cast. May
> I suggest to add a comment explaining the rationale?

Hmm, I can state that the rationale is history. Many of the assists in
the low 32 bits are for 32-bit guests only. But we can't start refusing
a 64-bit kernel requesting them. The ones in the high 32 bits are, for
now, applicable to 64-bit guests only, and have always been refused for
32-bit ones.

Imo if anything an explanation on where new bits should be put should
go next to the VMASST_TYPE_* definitions in the public header, yet then
again the public headers aren't (imo) a good place to put
implementation detail comments.

Again, Andrew - since you've ack-ed the patch already, any thoughts
here either way?

Jan

