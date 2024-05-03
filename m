Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2638BB477
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 22:02:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716658.1118808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2z6T-0004M7-Ry; Fri, 03 May 2024 20:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716658.1118808; Fri, 03 May 2024 20:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2z6T-0004Jo-On; Fri, 03 May 2024 20:01:57 +0000
Received: by outflank-mailman (input) for mailman id 716658;
 Fri, 03 May 2024 20:01:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IauD=MG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s2z6R-0004Ji-Fo
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 20:01:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcf84a8b-0987-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 22:01:54 +0200 (CEST)
Received: from [192.168.1.20] (host-79-36-52-167.retail.telecomitalia.it
 [79.36.52.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 602934EE0738;
 Fri,  3 May 2024 22:01:53 +0200 (CEST)
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
X-Inumbo-ID: fcf84a8b-0987-11ef-909c-e314d9c70b13
Message-ID: <518e455a-4233-498c-b7b1-afa485508543@bugseng.com>
Date: Fri, 3 May 2024 22:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [XEN PATCH 0/3] automation/eclair: do not allow
 failure for triggered analyses
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1714401209.git.federico.serafini@bugseng.com>
 <d24c9ef6-a7c8-4ee0-baff-b1585c788db1@citrix.com>
 <ecebd04a-1b95-4055-9f1c-a5468cc3bb1a@bugseng.com>
 <e4468587-318a-44f2-ba66-9a9c5e504052@citrix.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <e4468587-318a-44f2-ba66-9a9c5e504052@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/05/24 21:46, Andrew Cooper wrote:
> On 03/05/2024 8:44 pm, Federico Serafini wrote:
>> On 03/05/24 21:14, Andrew Cooper wrote:
>>> On 29/04/2024 4:21 pm, Federico Serafini wrote:
>>>> Patch 1/3 does some preparation work.
>>>>
>>>> Patch 2/3, as the title says, removes allow_failure = true for
>>>> triggered
>>>> analyses.
>>>>
>>>> Patch 3/3 makes explicit that initally no files are tagged as
>>>> adopted, this
>>>> is needed by the scheduled analysis.
>>>
>>> I'm afraid that something in this series is broken.
>>>
>>> Since these patches went in, all pipelines are now getting a status of
>>> blocked rather than passed.
>>>
>>> If I manually start the Eclair jobs, then eventually the pipeline gets
>>> to Passed.
>>
>> Can you provide us a link to those failures?
>> I am looking at gitlab xen-project/xen and xen-project/patchew
>> and everything seems ok.
>>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1276081658
> is the first one I noticed as blocked, and I manually ran.  That ended
> up working.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1277724847
> is still in the blocked state.  The build-each-commit failure is unrelated.

This is intentional and was introduced by
commit 7c1bf8661db5c00bd8c9a25015fe8678b2ff9ac6

The ECLAIR analysis under people/* need to be activated
manually.

Is this causing some problems to the CI?

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

