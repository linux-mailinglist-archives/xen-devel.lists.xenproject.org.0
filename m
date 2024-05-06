Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD68BC7C7
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 08:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717226.1119238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3s6f-0004Fq-8n; Mon, 06 May 2024 06:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717226.1119238; Mon, 06 May 2024 06:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3s6f-0004EB-63; Mon, 06 May 2024 06:45:49 +0000
Received: by outflank-mailman (input) for mailman id 717226;
 Mon, 06 May 2024 06:45:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNYQ=MJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s3s6e-0004E5-C1
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 06:45:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43d4e18f-0b74-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 08:45:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 52CBF4EE074D;
 Mon,  6 May 2024 08:45:45 +0200 (CEST)
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
X-Inumbo-ID: 43d4e18f-0b74-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Mon, 06 May 2024 08:45:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: Re: [REGRESSION] Re: [XEN PATCH 0/3] automation/eclair: do not allow
 failure for triggered analyses
In-Reply-To: <b2857b11-9ae6-4768-bd0d-8c93b9a3d604@citrix.com>
References: <cover.1714401209.git.federico.serafini@bugseng.com>
 <d24c9ef6-a7c8-4ee0-baff-b1585c788db1@citrix.com>
 <ecebd04a-1b95-4055-9f1c-a5468cc3bb1a@bugseng.com>
 <e4468587-318a-44f2-ba66-9a9c5e504052@citrix.com>
 <518e455a-4233-498c-b7b1-afa485508543@bugseng.com>
 <b2857b11-9ae6-4768-bd0d-8c93b9a3d604@citrix.com>
Message-ID: <8ddfbc0d6b20238cb902ccfccb2310fc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-05-03 22:06, Andrew Cooper wrote:
> On 03/05/2024 9:01 pm, Federico Serafini wrote:
>> On 03/05/24 21:46, Andrew Cooper wrote:
>>> On 03/05/2024 8:44 pm, Federico Serafini wrote:
>>>> On 03/05/24 21:14, Andrew Cooper wrote:
>>>>> On 29/04/2024 4:21 pm, Federico Serafini wrote:
>>>>>> Patch 1/3 does some preparation work.
>>>>>> 

Hi,

>>>>>> Patch 2/3, as the title says, removes allow_failure = true for
>>>>>> triggered
>>>>>> analyses.
>>>>>> 
>>>>>> Patch 3/3 makes explicit that initally no files are tagged as
>>>>>> adopted, this
>>>>>> is needed by the scheduled analysis.
>>>>> 
>>>>> I'm afraid that something in this series is broken.
>>>>> 
>>>>> Since these patches went in, all pipelines are now getting a status 
>>>>> of
>>>>> blocked rather than passed.
>>>>> 
>>>>> If I manually start the Eclair jobs, then eventually the pipeline 
>>>>> gets
>>>>> to Passed.
>>>> 
>>>> Can you provide us a link to those failures?
>>>> I am looking at gitlab xen-project/xen and xen-project/patchew
>>>> and everything seems ok.
>>>> 
>>> 
>>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1276081658
>>> is the first one I noticed as blocked, and I manually ran.  That 
>>> ended
>>> up working.
>>> 
>>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1277724847
>>> is still in the blocked state.  The build-each-commit failure is
>>> unrelated.
>> 
>> This is intentional and was introduced by
>> commit 7c1bf8661db5c00bd8c9a25015fe8678b2ff9ac6
>> 
>> The ECLAIR analysis under people/* need to be activated
>> manually.
> 
> Yes.  I know, and that matches the behaviour I saw.
> 
>> 
>> Is this causing some problems to the CI?
>> 
> 
> Yes.
> 
> See https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines
> 
> Prior to this series, the manual actions were not used but the pipeline
> was overall in the Passed state.  Specifically, they ended up being 
> skipped.
> 
> After this series, the manual actions are now blocking the pipeline, 
> not
> letting it complete, and not marking it as passed.

one way to fix this can be to set allow_failure when in the people/* 
branches, which will cause the stage to be skipped and thus mark the 
pipeline as Passed when all other steps have completed. See 
https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/1278550868


-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

