Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DB31B2636
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 14:36:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQs7R-0001kG-QN; Tue, 21 Apr 2020 12:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wEXD=6F=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQs7Q-0001kB-Au
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 12:35:16 +0000
X-Inumbo-ID: 8d442c20-83cc-11ea-b58d-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d442c20-83cc-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 12:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3VZPPZt9qJm6OA2YKyrSvNJ6N8g0ZBmXvs7ZqLlBjKk=; b=1beMDBXnQdznL2PhaePEbNuZLT
 LOv+Vhkq2LmGWLRbvQCNgM7KWqdX9LqiACnfEaOR7aYf15PqMh72SC0pcFOtAxWI/bRy1nTY2Olz0
 gluf2oEH+PuQWsOKuxR1BH/4Rv0fR/plhAxQL5gBLCUN13XvmJTRK+gnX/02QvHaHGss=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQs7O-00076d-96; Tue, 21 Apr 2020 12:35:14 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQs7O-0004Db-1i; Tue, 21 Apr 2020 12:35:14 +0000
Subject: Re: [PATCH v2 1/2] x86/HVM: expose VM assist hypercall
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <51dfb592-2653-738f-6933-9521ffa4fecd@suse.com>
 <e5eb3508-141e-dd9d-5177-c08d51ebaaa0@suse.com>
 <1f463b9e-9629-4ba0-3b7f-373b4bcb5b64@xen.org>
 <5863d6d0-22cf-7237-a88b-a3a2c4809635@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a6474b12-05a2-925f-0d7f-eacc8b1406bd@xen.org>
Date: Tue, 21 Apr 2020 13:35:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5863d6d0-22cf-7237-a88b-a3a2c4809635@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 21/04/2020 06:54, Jan Beulich wrote:
> On 20.04.2020 19:53, Julien Grall wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1517,20 +1517,23 @@ long do_vcpu_op(int cmd, unsigned int vc
>>>        return rc;
>>>    }
>>>    -#ifdef VM_ASSIST_VALID
>>> -long vm_assist(struct domain *p, unsigned int cmd, unsigned int type,
>>> -               unsigned long valid)
>>> +#ifdef arch_vm_assist_valid
>>
>> How about naming the function arch_vm_assist_valid_mask?
> 
> Certainly a possibility, albeit to me the gain would be marginal
> and possibly not outweigh the growth in length. Andrew, any
> preference?

You have a point regarding the length of the function.

> 
>>> --- a/xen/include/asm-x86/domain.h
>>> +++ b/xen/include/asm-x86/domain.h
>>> @@ -700,6 +700,20 @@ static inline void pv_inject_sw_interrup
>>>       pv_inject_event(&event);
>>> }
>>> +#define PV_VM_ASSIST_VALID  ((1UL << VMASST_TYPE_4gb_segments)        | \
>>> +                             (1UL << VMASST_TYPE_4gb_segments_notify) | \
>>> +                             (1UL << VMASST_TYPE_writable_pagetables) | \
>>> +                             (1UL << VMASST_TYPE_pae_extended_cr3)    | \
>>> +                             (1UL << VMASST_TYPE_architectural_iopl)  | \
>>> +                             (1UL << VMASST_TYPE_runstate_update_flag)| \
>>> +                             (1UL << VMASST_TYPE_m2p_strict))
>>> +#define HVM_VM_ASSIST_VALID (1UL << VMASST_TYPE_runstate_update_flag)
>>> +
>>> +#define arch_vm_assist_valid(d) \
>>> +    (is_hvm_domain(d) ? HVM_VM_ASSIST_VALID \
>>> +                      : is_pv_32bit_domain(d) ? (uint32_t)PV_VM_ASSIST_VALID \
>>
>> I understand this is matching the current code, however without
>> looking at the rest of patch this is not clear why the cast. May
>> I suggest to add a comment explaining the rationale?
> 
> Hmm, I can state that the rationale is history. Many of the assists in
> the low 32 bits are for 32-bit guests only. But we can't start refusing
> a 64-bit kernel requesting them. The ones in the high 32 bits are, for
> now, applicable to 64-bit guests only, and have always been refused for
> 32-bit ones.
 >
> Imo if anything an explanation on where new bits should be put should
> go next to the VMASST_TYPE_* definitions in the public header, yet then
> again the public headers aren't (imo) a good place to put
> implementation detail comments.

How about splitting PV_VM_ASSIST_VALID in two? One would contain 64-bit 
PV specific flags and the other common PV flags?

This should make the code more obvious and easier to read for someone 
less familiar with the area.

It also means we could have a BUILD_BUG_ON() to check at build time that 
no flags are added above 32-bit.

Cheers,

-- 
Julien Grall

