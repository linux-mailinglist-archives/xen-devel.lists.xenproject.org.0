Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771A540102
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 16:13:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343320.568632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZwl-0002K2-Ag; Tue, 07 Jun 2022 14:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343320.568632; Tue, 07 Jun 2022 14:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyZwl-0002HE-6w; Tue, 07 Jun 2022 14:12:39 +0000
Received: by outflank-mailman (input) for mailman id 343320;
 Tue, 07 Jun 2022 14:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dSew=WO=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nyZwj-0002H8-81
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 14:12:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfb8bb6f-e66b-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 16:12:35 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1654611146830462.09408058299937;
 Tue, 7 Jun 2022 07:12:26 -0700 (PDT)
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
X-Inumbo-ID: dfb8bb6f-e66b-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; t=1654611150; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=a2CRATwAjNOIuHsk6YGsXQDUBbcrw+gl/yPAB5Qxq8L+m6gZxYa6xNZbOmDHtN7R/f4LE5eKxRKM4grtDzr9ZgfyJgwUpKpogP5iFznETNuCA+RWUzjNpocOQgFT4jeAwSdKKQwKEYJmt2BMPlZyD7+yATyrYthC6k23VLlQW7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1654611150; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=HZMQH+1lgVVAWilw6cNK/EVjdX4w8dLVlVF/UaMSMqE=; 
	b=HdBzgVZF+mHQP2W5wOP2qfEHGXxMK7aay0899xcviaiBFIKCiN59RVDT9oBLvxRLle4DcRGQoHW2gCr2CzF36R0iWqoSUhPl2hV0OfdNXEhaYowqOacjaj6QvJrpEWZD/zZxDHFk54f4ZR3T2nn5baf6cgfIw0TaFNxxUVH+tBY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654611150;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HZMQH+1lgVVAWilw6cNK/EVjdX4w8dLVlVF/UaMSMqE=;
	b=TdVQCqB4nsNbLuriPdiS+kTqWDQJuGok8gGwSHAViyK/nM36sJEGbAhLHiQrkY+v
	HoHXp3ZQ541mHxbTYAlwJMnzs6r/fRIl9sAgdMAYiru6ffl2XFhjiWuRHURzCpH1sYa
	FzmH03TUhf6HRTvFnFMBhXexourPBnwvBhOyelt4=
Message-ID: <523f3594-02d5-e762-27bf-9d48d4b8c6e1@apertussolutions.com>
Date: Tue, 7 Jun 2022 10:10:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io, jandryuk@gmail.com,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220531182041.10640-1-dpsmith@apertussolutions.com>
 <20220531182041.10640-3-dpsmith@apertussolutions.com>
 <17edde4a-0d00-0da7-5910-09874ab70838@suse.com>
 <6447f0ff-993c-9d39-52a8-40a434be9e52@apertussolutions.com>
 <054d4009-6042-c985-cc10-b133fc2341b1@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 2/3] xsm: consolidate loading the policy buffer
In-Reply-To: <054d4009-6042-c985-cc10-b133fc2341b1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 6/7/22 09:58, Jan Beulich wrote:
> On 07.06.2022 15:47, Daniel P. Smith wrote:
>>
>> On 6/2/22 05:47, Jan Beulich wrote:
>>> On 31.05.2022 20:20, Daniel P. Smith wrote:
>>>> Previously, initializing the policy buffer was split between two functions,
>>>> xsm_{multiboot,dt}_policy_init() and xsm_core_init(). The latter for loading
>>>> the policy from boot modules and the former for falling back to built-in
>>>> policy.
>>>>
>>>> This patch moves all policy buffer initialization logic under the
>>>> xsm_{multiboot,dt}_policy_init() functions. It then ensures that an error
>>>> message is printed for every error condition that may occur in the functions.
>>>> With all policy buffer init contained and only called when the policy buffer
>>>> must be populated, the respective xsm_{mb,dt}_init() functions will panic for
>>>> all errors except ENOENT. An ENOENT signifies that a policy file could not be
>>>> located. Since it is not possible to know if late loading of the policy file is
>>>> intended, a warning is reported and XSM initialization is continued.
>>>
>>> Is it really not possible to know? flask_init() panics in the one case
>>> where a policy is strictly required. And I'm not convinced it is
>>> appropriate to issue both an error and a warning in most (all?) of the
>>> other cases (and it should be at most one of the two anyway imo).
>>
>> With how XSM currently works, I do not see how without creating a
>> layering violation, as you had mentioned before. It is possible for
>> flask_init() to know because the flask= parameter belongs to the flask
>> policy module and can be directly checked.
>>
>> I think we view this differently. A call to
>> xsm_{multiboot,dt}_policy_init() is asking for a policy file to be
>> loaded. If it is not able to do so is an error. This error is reported
>> back to xsm_{multiboot,dt}_init() which is responsible for initializing
>> the XSM framework. If it encounters an error for which inhibits it from
>> initializing XSM would be an error whereas an error it encounters that
>> does not block initialization should warn the user as such. While it is
>> true that the only error for the xsm_multiboot_policy_init() currently
>> is a failure to locate a policy file, ENOENT, I don't see how that
>> changes the understanding.
> 
> Well, I think that to avoid the layering violation the decision whether
> an error is severe enough to warrant a warning (or is even fatal) needs
> to be left to the specific model (i.e. Flask in this case).

Except that it is not the policy module that loads the policy, where the
error could occur. As you pointed out for MISRA compliance, you cannot
have unhandled errors. So either, the errors must be ignored where they
occur and wait for a larger, non-specific panic, or a nesting of
handling/reporting the errors needs to be provided for a user to see in
the log as to why they ended up at the panic.

v/r,
dps

