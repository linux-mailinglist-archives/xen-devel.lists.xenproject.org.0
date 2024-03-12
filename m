Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645D4879195
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691725.1077969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjyvf-0001Ar-0Y; Tue, 12 Mar 2024 10:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691725.1077969; Tue, 12 Mar 2024 10:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjyve-00018C-Sz; Tue, 12 Mar 2024 10:00:14 +0000
Received: by outflank-mailman (input) for mailman id 691725;
 Tue, 12 Mar 2024 10:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGKU=KS=bounce.vates.tech=bounce-md_30504962.65f027a6.v1-c951a183e47448219ca972096574c410@srs-se1.protection.inumbo.net>)
 id 1rjyvd-000186-4c
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:00:13 +0000
Received: from mail137-23.atl71.mandrillapp.com
 (mail137-23.atl71.mandrillapp.com [198.2.137.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fc65b14-e057-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 11:00:10 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-23.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4Tv8Jk3fQMz1XLJMM
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 10:00:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c951a183e47448219ca972096574c410; Tue, 12 Mar 2024 10:00:06 +0000
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
X-Inumbo-ID: 4fc65b14-e057-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1710237606; x=1710498106;
	bh=jamJqCRaVrxTDYTLaUvwcJ+2xZOIKW+B0yNDJy6preA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=T1D0lQ25kMuY9LkuIU+Zh+AMkhIZ2B82YTk2JIy2HumytcRfkqBIudeWd2He+YwEW
	 kjUQQdqpf8oTf55MLu91J1nkm/OY6LFMbmcJYHi2U2FfryhBZo3tJI9E79qBFoEUoD
	 EBNI13f2icIyne+NjgmccI+55CJklJh5j2if/QSSjrB5JTEZ2cvNbliacxxw+z2BS9
	 DtqC+3/yQrzcyvzUMRhIEJ88G1RaNU9KWM0pRyztHljcjXqAIuiPt/UbmAfTIgl/34
	 Aq9/GiK+tvhckpdMQa6REMo2HBPvsVK0fE+ID69V/Y6WjlfVfKO40PTIlo4bPFLr54
	 6l2yoXt6vni5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1710237606; x=1710498106; i=vaishali.thakkar@vates.tech;
	bh=jamJqCRaVrxTDYTLaUvwcJ+2xZOIKW+B0yNDJy6preA=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ts+0MkoKB/NyNOIPGbHbXAmgU6l1guYoSOFqowraCruPG3Dx5kbPI1wz+AuXEtJwy
	 0sAfC+9BDdcKdI2WV23pY5llG79IW9cFsHM7/G+Fg8pF7rElJ65fT3PeLiccFNAr6r
	 pvz+O2OGMPW8cp9WLQKn5ASK7L2naKDLaelSGXiEXaEFesqajIZSjVnri5xCL5ket3
	 SW7Qdp2OEYHyfTcqfmN8VVZ7JnzGgjwR0hT6/pSOAnQmRUsMytxjJcUEqhakKd2zBM
	 Tu+4YAbNWo75RXK+t16yO0HBxOM0FjFCulEiRCAdGWCIPYIXO/C0EytMIykJ0d0TJf
	 yAX6gT/lTF0UQ==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=201/3]=20x86/svm:=20Drop=20the=20=5Fenabled=20suffix=20from=20vmcb=20bits?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1710237605414
Message-Id: <5dd4007d-f273-4e43-add6-a77f0459fc33@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org, xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech> <8e6d8cac54ca05f1202580b574c548e08988d8f6.1710149462.git.vaishali.thakkar@vates.tech> <1c67a337-e9d5-4e4a-91d5-3c935c410cda@suse.com>
In-Reply-To: <1c67a337-e9d5-4e4a-91d5-3c935c410cda@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c951a183e47448219ca972096574c410?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240312:md
Date: Tue, 12 Mar 2024 10:00:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/24 08:54, Jan Beulich wrote:
> On 11.03.2024 13:40, Vaishali Thakkar wrote:
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>       if ( nestedhvm_paging_mode_hap(v) )
>>       {
>>           /* host nested paging + guest nested paging. */
>> -        n2vmcb->_np_enable = 1;
>> +        n2vmcb->_np = true;
>>   
>>           nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
>>   
>> @@ -585,7 +585,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>       else if ( paging_mode_hap(v->domain) )
>>       {
>>           /* host nested paging + guest shadow paging. */
>> -        n2vmcb->_np_enable = 1;
>> +        n2vmcb->_np = true;
>>           /* Keep h_cr3 as it is. */
>>           n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
>>           /* When l1 guest does shadow paging
>> @@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>       else
>>       {
>>           /* host shadow paging + guest shadow paging. */
>> -        n2vmcb->_np_enable = 0;
>> +        n2vmcb->_np = false;
>>           n2vmcb->_h_cr3 = 0x0;
>>   
>>           /* TODO: Once shadow-shadow paging is in place come back to here
>> @@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>       }
>>   
>>       /* nested paging for the guest */
>> -    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
>> +    svm->ns_hap_enabled = ns_vmcb->_np;
>>   
>>       /* Remember the V_INTR_MASK in hostflags */
>>       svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
>> @@ -1084,7 +1084,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       if ( nestedhvm_paging_mode_hap(v) )
>>       {
>>           /* host nested paging + guest nested paging. */
>> -        ns_vmcb->_np_enable = n2vmcb->_np_enable;
>> +        ns_vmcb->_np = n2vmcb->_np;
>>           ns_vmcb->_cr3 = n2vmcb->_cr3;
>>           /* The vmcb->h_cr3 is the shadowed h_cr3. The original
>>            * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
>> @@ -1093,7 +1093,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       else if ( paging_mode_hap(v->domain) )
>>       {
>>           /* host nested paging + guest shadow paging. */
>> -        ns_vmcb->_np_enable = 0;
>> +        ns_vmcb->_np = false;
>>           /* Throw h_cr3 away. Guest is not allowed to set it or
>>            * it can break out, otherwise (security hole!) */
>>           ns_vmcb->_h_cr3 = 0x0;
>> @@ -1104,7 +1104,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>       else
>>       {
>>           /* host shadow paging + guest shadow paging. */
>> -        ns_vmcb->_np_enable = 0;
>> +        ns_vmcb->_np = false;
>>           ns_vmcb->_h_cr3 = 0x0;
>>           /* The vmcb->_cr3 is the shadowed cr3. The original
>>            * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
> 
> While spotting the small issue below it occurred to me: Why is it that
> vmcb_set_...() is open-coded everywhere here? I think this would be
> pretty nice to avoid at the same time (for lines touched anyway, or in
> a separate prereq patch, or alternatively [and only ideally] for all
> other instances in a follow-on patch). Thoughts?

Yes, I noticed this too. My plan was to send a followup patch for
fixing all the instances where vmcb_set/get_...() can be used.
There are bunch of other vmcb bits (apart from the ones being
handled in this patchset) in this file and in svm.c which can
benefit from using VMCB accessors.

>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -473,7 +473,7 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
>>   
>>       if ( paging_mode_hap(v->domain) )
>>       {
>> -        vmcb_set_np_enable(vmcb, 1);
>> +        vmcb_set_np(vmcb, 1);
> 
> No switching to "true" here? (If the answer to the other question is
> "No" for whatever reason, I'd nevertheless like to see this on adjusted,
> which could then be done while committing.)

Sorry, I missed this instance. I'll fix it if I'll need to send another
revised patchset for some other fixes (based on review comments), else
feel free to fix it while committing. Thanks.

> Jan

