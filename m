Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC618A6D9D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 16:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706997.1104455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjZU-00011F-OT; Tue, 16 Apr 2024 14:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706997.1104455; Tue, 16 Apr 2024 14:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwjZU-0000ym-Lg; Tue, 16 Apr 2024 14:14:04 +0000
Received: by outflank-mailman (input) for mailman id 706997;
 Tue, 16 Apr 2024 14:14:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DiLf=LV=bounce.vates.tech=bounce-md_30504962.661e87a6.v1-f182c6b77d944505b47577be21c18c11@srs-se1.protection.inumbo.net>)
 id 1rwjZT-0000yc-69
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 14:14:03 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 926ea3ba-fbfb-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 16:14:01 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJmHV6mWHz8XRqgw
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 14:13:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f182c6b77d944505b47577be21c18c11; Tue, 16 Apr 2024 14:13:58 +0000
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
X-Inumbo-ID: 926ea3ba-fbfb-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713276838; x=1713537338;
	bh=73L0mWBE3l6PRWlMSSeegN29eLilFCrXXPPjnA8i2jg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K0obmuiYUpxigy7W8ZfIGEDuKxa06zsRWuOfkQ+dXZ8AVh+EjotFeYfttLhnjLwy4
	 TNRQWBQLLyXc1Z93LnGzB5SqMj711rEPzQ695FdEWJ89mXlPaaACizkOjjuXgx6e5w
	 zWQjjJafCm4rozyQzPiNZKV6wO1+TSPdwQRjrZU/Zkf2pIkyryZvYC9FFOU+lY5i28
	 WqR6C4WPKoivcrvAQGy8ZfxKV6DG1gqz8HfSlaTlV/Sj4nso2Y4sLvK3P46ctwUKHM
	 xvcFmbWLOM9HoPzLImy6lSzwbdcHlVcMHLCqSDzYmObjmgetx1xykXd8WElH3QTfRY
	 j0yxU+auiYUYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713276838; x=1713537338; i=vaishali.thakkar@vates.tech;
	bh=73L0mWBE3l6PRWlMSSeegN29eLilFCrXXPPjnA8i2jg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bNMEkUg7AKxM4SrnJTf/Gfzb18k8hJkzLA4CoI7YSIEP6pITIJry48Af6vNqUOiH+
	 g1g46HKTDNKkcQe/RIYohKSnri0f390cIWJhcRyy8mHxrtVvQtnczaQVj5RZHGiiWc
	 QkseR9WiqwfNaj5iBNgzKex0xGL+wupCD2LPlnMBr3hbbjalXY9cV1yWWujDw/cbXo
	 1lMCjCcM3+1S7X3VmONvO3rHRFQZXm1CAfWqFC1tyepVq93nDshKo2jXEhneEworqD
	 69fbe0iFEy7vza3IHO3qpsbKNpZ+Jl7WldspkT2TKUVcbjwRw/aNhw0eReHk5foZpI
	 EHcnoDVJkoTvA==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/svm:=20Add=20flushbyasid=20in=20the=20supported=20features?=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713276837914
Message-Id: <57d202e4-261d-4c31-9392-88dfbfd86b7d@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, roger.pau@citrix.com
References: <b8541a3c70058a74c837352901f2e6a8b45e4fa2.1713258186.git.vaishali.thakkar@vates.tech> <10f811aa-0b18-4ef2-9185-3146df13a382@citrix.com>
In-Reply-To: <10f811aa-0b18-4ef2-9185-3146df13a382@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f182c6b77d944505b47577be21c18c11?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240416:md
Date: Tue, 16 Apr 2024 14:13:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/24 3:38 PM, Andrew Cooper wrote:
> On 16/04/2024 10:08 am, Vaishali Thakkar wrote:
>> TLB Flush by ASID is missing in the list of supported features
>> here. So, add it.
>>
>> Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
>> ---
>>   xen/arch/x86/hvm/svm/svm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index a745acd903..4719fffae5 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2510,6 +2510,7 @@ const struct hvm_function_table * __init start_svm(void)
>>       P(cpu_has_svm_lbrv, "Last Branch Record (LBR) Virtualisation");
>>       P(cpu_has_svm_nrips, "Next-RIP Saved on #VMEXIT");
>>       P(cpu_has_svm_cleanbits, "VMCB Clean Bits");
>> +    P(cpu_has_svm_flushbyasid, "TLB flush by ASID");
>>       P(cpu_has_svm_decode, "DecodeAssists");
>>       P(cpu_has_svm_vloadsave, "Virtual VMLOAD/VMSAVE");
>>       P(cpu_has_svm_vgif, "Virtual GIF");
> 
> This is consistent with pre-existing behaviour, so
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> However, an ever increasing list of lines like this is something I'm
> trying to push back against.
> 
> They don't match the configured state of VMs in the system, not least

Right, makes sense to not add more stuff to print here.

> because one of the things required to fix security vulnerabilities in
> nested virt is to break the (false) assumption that there is a single
> global state of how a VM is configured.
> 
> These ones in particular are just about to appear in CPU policies.

As part of nested virt work?

> ~Andrew

