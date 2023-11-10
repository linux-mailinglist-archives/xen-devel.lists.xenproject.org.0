Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C963F7E79E9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 08:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629952.982536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1MMm-00025t-JV; Fri, 10 Nov 2023 07:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629952.982536; Fri, 10 Nov 2023 07:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1MMm-00022f-Gk; Fri, 10 Nov 2023 07:55:48 +0000
Received: by outflank-mailman (input) for mailman id 629952;
 Fri, 10 Nov 2023 07:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgQD=GX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r1MMk-00021H-A6
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 07:55:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c54c834-7f9e-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 08:55:44 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BF3F04EE0744;
 Fri, 10 Nov 2023 08:55:37 +0100 (CET)
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
X-Inumbo-ID: 8c54c834-7f9e-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 10 Nov 2023 08:55:37 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper3
 <andrew.cooper3@citrix.com>
Cc: simone.ballarin@bugseng.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
Subject: Re: Failing eclair-ARM64 job
In-Reply-To: <alpine.DEB.2.22.394.2311091702530.3478774@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2310311443460.1795129@ubuntu-linux-20-04-desktop>
 <cedcc2c2dad9b0a75220d676ff6b646a@bugseng.com>
 <4be3de5cecb06a9fdd09fc530d3926f0@bugseng.com>
 <alpine.DEB.2.22.394.2311091702530.3478774@ubuntu-linux-20-04-desktop>
Message-ID: <6b99bd7f14d446ab071ef874e8fa9b73@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-10 02:04, Stefano Stabellini wrote:
> On Wed, 8 Nov 2023, Nicola Vetrini wrote:
>> On 2023-11-08 09:17, Nicola Vetrini wrote:
>> > Hi Stefano,
>> >
>> > sorry for the late reply; see my response below.
>> >
>> > On 2023-10-31 22:47, Stefano Stabellini wrote:
>> > > Hi Simone,
>> > >
>> > > As you might have noticed, all the eclair-ARM64 jobs have been failing
>> > > recently for the upstream Xen "staging" branch:
>> > >
>> > > https://gitlab.com/xen-project/xen/-/pipelines/1056527466
>> > > https://gitlab.com/xen-project/xen/-/pipelines/1056520898
>> > >
>> > > Although eclair-ARM64 is "allow_failure: true" still is the only job
>> > > currently failing and it would be nice to get it fixed, especially as we
>> > > are about to make gitlab-ci pipelines gating.
>> > >
>> > > Cheers,
>> > >
>> > > Stefano
>> >
>> > A patch that is meant to address the issue related to D4.11, which makes the
>> > Arm job always
>> > fail with a report on a clean guideline, has been submitted on the ML:
>> >
>> > https://lore.kernel.org/xen-devel/3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com/
>> >
>> 
>> This is about the semi-random failures mentioned to Roberto in 
>> yesterday's
>> MISRA C meeting.
>> Neither me nor Simone has seem a mail sent from Andrew about such 
>> semi-random
>> failures.
> 
> So you are saying there is  no problem with the ECLAIR arm64 job, it is
> just that it is failing on a false-positive violation and we already
> have a tentative fix for that currently under discussion [1]. Once we
> commit the fix, everything will pass?
> 
> [1]
> https://lore.kernel.org/xen-devel/3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com/

+Andrew

Yes, that's what we know. If someone found other intermittent issues we 
can investigate them,
but we received no notice of such issues.

Andrew, can you confirm receiving this email?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

