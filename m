Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09789E664
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 01:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702885.1098530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruLCJ-0005N8-Cs; Tue, 09 Apr 2024 23:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702885.1098530; Tue, 09 Apr 2024 23:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruLCJ-0005Ku-AG; Tue, 09 Apr 2024 23:48:15 +0000
Received: by outflank-mailman (input) for mailman id 702885;
 Tue, 09 Apr 2024 23:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qKuC=LO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ruLCH-0005Ko-Kk
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 23:48:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f3005a8-f6cb-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 01:48:12 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1712706481623267.91561022500775;
 Tue, 9 Apr 2024 16:48:01 -0700 (PDT)
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
X-Inumbo-ID: 9f3005a8-f6cb-11ee-b907-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1712706483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kK8LMyjz/mcnhfst1Hr2dM7Ht+L4ylDanIYUu17Mi9Z2cbVB1Ix3uzSsK3W7Lda9fGf7We1hmRDUDt8ksLyLmE2ZQwpi3rxZARbZ/9juc6AphJKt/2pv666Z2uvtJTlZ5o0rblk7eRWFRCn4YabWzjVq7OAx2XwbbaVKNBLX6fQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1712706483; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=di/pighn2n0P/F1kEpnn48PgTA7yCfqZOBlmgKI/SLk=; 
	b=M0IGThozh6FBtScgxEyBOdHYNkwcAYq8MbkH1rDrRAXUVEo+W/NP3PKRMtue6Hqo4kgekw0d7cGNM2cq7efEAenyMwMwVtTbWIJDGEhpbNzJhgZHEguAblwitNZujNNhHbyDg7S3X1hGWaRmp5PMLLtZ/KMWL4yn9qsWjV+i81A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1712706483;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=di/pighn2n0P/F1kEpnn48PgTA7yCfqZOBlmgKI/SLk=;
	b=DohFnq7xDcWmE5Jyib9ixGXlV0KazJpe/o+RFPdbBOiwnc9dYvLc1v/WN9wvu8ap
	/8raeqIhnl6NF3Ck8+AXdCG9xbPM0gj+dQRrwSQsjjZmoT9MtB5JUIxegngxIKvY4NP
	kMbxxg0Ph/PtkAHBH7nB2OMdWNM2eKLJrfjOSGjQ=
Message-ID: <82d7a374-5b38-4d71-92a2-b2b0e1bbf0da@apertussolutions.com>
Date: Tue, 9 Apr 2024 19:48:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 7/9] xen/xsm: address violation of MISRA C Rule
 16.2
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <7fbb80bf62fc2e5f91a89375134622366c0b3891.1712305581.git.nicola.vetrini@bugseng.com>
 <543f34ed-48f3-4ce5-bd34-00c2cf176ba0@apertussolutions.com>
 <c364de9357b5f3419e592e7ad3bd307a@bugseng.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <c364de9357b5f3419e592e7ad3bd307a@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/9/24 16:00, Nicola Vetrini wrote:
> On 2024-04-09 16:02, Daniel P. Smith wrote:
>> On 4/5/24 05:14, Nicola Vetrini wrote:
>>> Refactor the switch so that a violation of
>>> MISRA C Rule 16.2 is resolved (A switch label shall only be used
>>> when the most closely-enclosing compound statement is the body of
>>> a switch statement).
>>> Note that the switch clause ending with the pseudo
>>> keyword "fallthrough" is an allowed exception to Rule 16.3.
>>>
>>
>> To give you a quick response, on cursory review, I do not believe the 
>> two are equivalent. I have never been a fan of the Duff's device in 
>> use here, as it makes reasoning about all the variations difficult. I 
>> unrolled all of this once before, and I recall it being a bit more 
>> intricate than this.
>>
>> v/r,
>> dps
> 
> Hi,
> 
> basically what I was trying to accomplish is this: XSM_TARGET will 
> either enter the if and return, or fallthrough to XSM_XS_PRIV, but then 
> it won't enter the if (as it did before because in order to reach this 
> second case's if statement it had to also satisfy the first condition 
> (evaluate_nospec(src == target)), which would then cause the XSM_TARGET 
> phase to return 0). And then if either the action != XSM_XS_PRIV or the 
> other condition is not satisfied we go down to XSM_DM_PRIV, just like 
> before. I may have made a logical mistake somewhere, of course, but it 
> seems the same thing semantically, by relying on the fact that
> 
> case XSM_TARGET:
> if (...) {
>    return 0;
> case XSM_XS_PRIV:
>     ...
> }
> 
> can be rewritten as
> 
> case XSM_TARGET:
>    if (...) { return 0; }
>    fallthrough;
> case XSM_XS_PRIV:
>    if (action == XSM_XS_PRIV && ...) { ... }
> case XSM_DM_PRIV:
> 
> because there wasn't other code after the closed bracket of the if in 
> the XSM_XS_PRIV case (only a fallthough that remained as is).

Yes, upon a closer look, you are correct. I just did a quick read 
earlier since this has been sitting for a few days. I missed that you 
did in fact have it falling all the way down through all the subsequent 
checks for each case "entry point" into the privilege hierarchy. 
Honestly, I probably should look into a comment to document the 
hierarchy of the checks that is buried in there.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

