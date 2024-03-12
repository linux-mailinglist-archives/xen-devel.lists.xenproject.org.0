Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47B8791AE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691729.1077979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjz3R-0001my-KZ; Tue, 12 Mar 2024 10:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691729.1077979; Tue, 12 Mar 2024 10:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjz3R-0001lF-Hh; Tue, 12 Mar 2024 10:08:17 +0000
Received: by outflank-mailman (input) for mailman id 691729;
 Tue, 12 Mar 2024 10:08:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hGJe=KS=bounce.vates.tech=bounce-md_30504962.65f0298b.v1-e0264480b4df41e9934ae9d6d774cbc8@srs-se1.protection.inumbo.net>)
 id 1rjz3P-0001l9-Dq
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:08:15 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f4147fa-e058-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 11:08:13 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4Tv8V33GY1zB5p4vG
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 10:08:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e0264480b4df41e9934ae9d6d774cbc8; Tue, 12 Mar 2024 10:08:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6f4147fa-e058-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710238091; x=1710498591;
	bh=F4s+Q7mYVMULGFUgbUAro53sgX2Q4nrhzoTwtJES9xA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l7kqq+PYylSEQ5e75EGCK7sbuQc79OwQedHMDMZsO400LeRAYod79mr9hvUeTytK4
	 eJUBUfH9so2SU5QnajkvZ7YpaZJdj2PAD6AyfKJkUZyTG3sjHnKk626UH57A7V54Mv
	 cnCjEUFDSegi8x62JqHG2ayFFKNSX2yTwpzjr4pXBh082YD5uPQ7XJX8LDQl8ftrDM
	 u4+QlkbKtgWyxlP8tcAYR0GaRd6CmfO1zVUQmLJfRJmRwIzog+0wXHQuY/uvEUFSoa
	 0wdJROFn2ZlXhAkUzNFzWYH+6iLxiO2i3zQRo7My7W5E++C2U+jtG48BUKGThFWta6
	 OqgEsELumIQeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710238091; x=1710498591; i=vaishali.thakkar@vates.tech;
	bh=F4s+Q7mYVMULGFUgbUAro53sgX2Q4nrhzoTwtJES9xA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=J2T/4UKefmEOX0pBRd2Qp+7GjAGmKH+iLM0WRz4KsP2mDs4wZSUh0KI5wiI4HOXdi
	 Tybxcf78YPnlWop3gUW2kGrCuxAkoOuQbyYSVFDDNWiW1VOMiZ7UnEEDafqQF1XPmN
	 LyQFz/VomasjKU+3ImNpOJ4HSV8ErrvDGtjcr0SRv2LBE5jPXm/L7pkbJjw57xihkU
	 qrHqdPwZ4sADHp8Ga9iJUMczVjgJXOeJfSojPC86xFZ3Kerq/l/3PzixXMJdIysQk9
	 NY3QOystv+BOjPRa/FbmLdmh7A1TIobhvkyjBWfgI/BWShOG1bzrawSiKHkOCygic1
	 zJBRxsukH3gAg==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=202/3]=20x86/svm:=20Drop=20the=20suffix=20=5Fguest=20from=20vmcb=20bit?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710238090188
Message-Id: <b0740f0b-0833-4d7b-959b-89a3cef051d5@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech> <b0e5dde517599e8af5aadbaff7dd4410e83fcf86.1710149462.git.vaishali.thakkar@vates.tech> <d2830e8e-6cf5-4266-a7ac-c5103fcae233@suse.com>
In-Reply-To: <d2830e8e-6cf5-4266-a7ac-c5103fcae233@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e0264480b4df41e9934ae9d6d774cbc8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240312:md
Date: Tue, 12 Mar 2024 10:08:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/24 08:59, Jan Beulich wrote:
> On 11.03.2024 13:40, Vaishali Thakkar wrote:
>> @@ -698,11 +698,11 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>       /* Convert explicitely to boolean. Deals with l1 guests
>>        * that use flush-by-asid w/o checking the cpuid bits */
>>       nv->nv_flushp2m = !!ns_vmcb->tlb_control;
>> -    if ( svm->ns_guest_asid != ns_vmcb->_guest_asid )
>> +    if ( svm->ns_asid != ns_vmcb->_asid )
>>       {
>>           nv->nv_flushp2m = 1;
>>           hvm_asid_flush_vcpu_asid(&vcpu_nestedhvm(v).nv_n2asid);
>> -        svm->ns_guest_asid = ns_vmcb->_guest_asid;
>> +        svm->ns_asid = ns_vmcb->_asid;
>>       }
>>   
>>       /* nested paging for the guest */
>> @@ -1046,7 +1046,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       /* Keep it. It's maintainted by the l1 guest. */
>>   
>>       /* ASID */
>> -    /* ns_vmcb->_guest_asid = n2vmcb->_guest_asid; */
>> +    /* ns_vmcb->_asid = n2vmcb->_asid; */
> 
> Unlike in the earlier patch, where I could accept the request to switch
> to using accessor functions as scope-creep-ish, here I'm pretty firm
> with my request to stop their open-coding at the same time. Unless of
> course there's a technical reason the accessors cannot be used here.

Yes, so as mentioned in the other patch's reply, I plan to tackle this 
instance too in the followup patchset along with others. So, if you're
fine with it, I'll leave this one here for now. Unless you prefer otherwise.

> Jan

