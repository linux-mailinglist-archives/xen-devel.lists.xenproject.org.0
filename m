Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4476C725
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 09:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574749.900315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Rz-00073N-Fa; Wed, 02 Aug 2023 07:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574749.900315; Wed, 02 Aug 2023 07:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR6Rz-00070u-Cj; Wed, 02 Aug 2023 07:39:19 +0000
Received: by outflank-mailman (input) for mailman id 574749;
 Wed, 02 Aug 2023 07:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4RV=DT=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qR6Ry-00070T-0I
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 07:39:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae6d6273-3107-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 09:39:15 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 502164EE0737;
 Wed,  2 Aug 2023 09:39:15 +0200 (CEST)
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
X-Inumbo-ID: ae6d6273-3107-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Wed, 02 Aug 2023 09:39:15 +0200
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/4] automation/eclair: add scheduled pipelines
Reply-To: simone.ballarin@bugseng.com
In-Reply-To: <alpine.DEB.2.22.394.2308011708240.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690881495.git.simone.ballarin@bugseng.com>
 <76f3cdddcba485e8124659566b2f992b3b14da17.1690881495.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308011545350.2127516@ubuntu-linux-20-04-desktop>
 <ZMmdvllVvfDz3T92@mail-itl>
 <alpine.DEB.2.22.394.2308011708240.2127516@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <3b62d7e9d7d630e2bc31f0579d3bdb1f@bugseng.com>
X-Sender: simone.ballarin@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Il 02/08/2023 02:08 Stefano Stabellini ha scritto:
> On Wed, 2 Aug 2023, Marek Marczykowski-Górecki wrote:
>> On Tue, Aug 01, 2023 at 03:55:20PM -0700, Stefano Stabellini wrote:
>> > On Tue, 1 Aug 2023, Simone Ballarin wrote:
>> > > This patch introduces six new ECLAIR jobs that run only
>> > > when triggered by a GitLab scheduled pipeline.
>> > >
>> > > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> > > ---
>> > > +.eclair-analysis:on-schedule:
>> > > +  extends: .eclair-analysis
>> > > +  rules:
>> > > +    - if: $CI_PIPELINE_SOURCE == "schedule"
>> >
>> > If I understand this right, the idea is that someone would schedule a
>> > pipeline (Build -> "Pipeline Schedules") and as part of that, they would
>> > also define the variable "CI_PIPELINE_SOURCE" to schedule.
>> 
>> No, this is pre-defined variable in gitlab:
>> https://docs.gitlab.com/ee/ci/variables/predefined_variables.html
> 
> Even better! Thanks! Then no need for a comment and the patch is OK as
> is.
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Here is a link with the instructions for creating scheduled pipelines:
https://docs.gitlab.com/ee/ci/pipelines/schedules.html

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)

