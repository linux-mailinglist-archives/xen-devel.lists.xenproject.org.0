Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2502875DD6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 06:59:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690106.1075807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riTFh-0000R2-Vs; Fri, 08 Mar 2024 05:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690106.1075807; Fri, 08 Mar 2024 05:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riTFh-0000Ox-T0; Fri, 08 Mar 2024 05:58:41 +0000
Received: by outflank-mailman (input) for mailman id 690106;
 Fri, 08 Mar 2024 05:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gxa2=KO=bounce.vates.tech=bounce-md_30504962.65eaa90a.v1-2a27077793ac411e905485c792ecbb46@srs-se1.protection.inumbo.net>)
 id 1riTFf-0000Or-TF
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 05:58:40 +0000
Received: from mail133-16.atl131.mandrillapp.com
 (mail133-16.atl131.mandrillapp.com [198.2.133.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e75db6c1-dd10-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 06:58:37 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4Trb7t2KpYzB5pBbD
 for <xen-devel@lists.xenproject.org>; Fri,  8 Mar 2024 05:58:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2a27077793ac411e905485c792ecbb46; Fri, 08 Mar 2024 05:58:34 +0000
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
X-Inumbo-ID: e75db6c1-dd10-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1709877514; x=1710138014;
	bh=751vofDCA/vRhU97VqgC+qIbx9vn2FxcZ1jcFyYQs/I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tga6kFnepwpS+zcmdONa4PBVCoQk3V+7BIIcOMOcMZKriGTZD8M0uLcKGuYZ6b3rn
	 jB2/Dy+N8dD0ZBiOBBUjsEL12Cqn1N5+AByYp95lZtluItYBd5drdNDyQQmrMLOCU5
	 bsrxl5GC/GyGrsTgi3OYv7N21t0NCXI/U6gLddVX3YqABIJEwGDEZvJh2WSQmowOKW
	 /zmqdNTyvxS+0aP3Cw4V2BvhaVrgQ06jOl8g+3VB1eauK9XwlpueFzWbEgMthB7QlB
	 dEJzXpq8Qq6flqZQXQHJ0CW47Wb5ipOkuQGUy8QfN+sCpXwPUiXSESse/9YLYKVGW9
	 F7OU7xmRnc2vQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1709877514; x=1710138014; i=vaishali.thakkar@vates.tech;
	bh=751vofDCA/vRhU97VqgC+qIbx9vn2FxcZ1jcFyYQs/I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=kcLEAHF9E3L6msK4iBuS1Kvb/wqKiaC7x52BdOcsXeHrN3xKMGQz6vYikkHvRN1o+
	 s7zsl8AaTbTtuijj+BXdezbAB/VlDyGt5x2SK1CEm7n3srbjk4pi53qwX5KfUPbClW
	 B0hrTcBP1a4ofLHrM5I0GXPpKd3RDAuw+L52TRav9jS4AhZMYxVD8UNfG5PUpMyRrG
	 ybnv2L6J3UBLwysrr40y1VuT1zloGHCQ2HeH35bzwL5WgUx7zwvD/yqYJ3o/2uDx60
	 53m6qXJoUsqi8Kh9dMbXzOIp/wcCEX6DKPeF7mxWvJYhS6O76RUhuP41cuUqWMzF4f
	 X8nq1g1h1YySA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/2]=20x86/svm:=20Drop=20the=20=5Fenabled=20suffix=20from=20vmcb=20bits?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1709877512995
Message-Id: <12ed3de3-294b-4154-9a16-ca038dc85173@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com, wl@xen.org
References: <cover.1709846387.git.vaishali.thakkar@vates.tech> <3c419824febca229cedf2a3bd42cb68d3a3d56a8.1709846387.git.vaishali.thakkar@vates.tech> <b72f8767-b21c-4dab-8541-e45b1c2f9582@citrix.com>
In-Reply-To: <b72f8767-b21c-4dab-8541-e45b1c2f9582@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2a27077793ac411e905485c792ecbb46?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240308:md
Date: Fri, 08 Mar 2024 05:58:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/24 00:22, Andrew Cooper wrote:
> On 07/03/2024 9:40 pm, Vaishali Thakkar wrote:
>> The suffix is redundant for np/sev/sev-es bits. Drop it
>> to avoid adding extra code volume.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>i
> 
> Typo on the end of your email address?

Oops, thanks for catching it.

>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index e4e01add8c..7e285cf85a 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>       }
>>   
>>       /* nested paging for the guest */
>> -    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
>> +    svm->ns_hap_enabled = !!ns_vmcb->_np;
> 
> Because the type of is bool, the !! can be dropped too while changing
> this line.

Thanks for the review. As I'm sending the revised patchset anyway,
will fix both things in this patch too.

> It seems that this was missing cleanup from f57ae00635 "SVM: split
> _np_enable VMCB field".
> 
> Anyway, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> and I'm
> happy to fix on commit.

