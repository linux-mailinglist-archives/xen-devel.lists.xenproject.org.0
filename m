Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CAA93B3DD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764373.1174810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe2q-0006UT-VB; Wed, 24 Jul 2024 15:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764373.1174810; Wed, 24 Jul 2024 15:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe2q-0006Rh-S6; Wed, 24 Jul 2024 15:36:48 +0000
Received: by outflank-mailman (input) for mailman id 764373;
 Wed, 24 Jul 2024 15:36:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZ/A=OY=bounce.vates.tech=bounce-md_30504962.66a11f8c.v1-511ba71050c64287a48492627d3b9298@srs-se1.protection.inumbo.net>)
 id 1sWe2p-0004li-As
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:36:47 +0000
Received: from mail135-10.atl141.mandrillapp.com
 (mail135-10.atl141.mandrillapp.com [198.2.135.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 887d549d-49d2-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 17:36:46 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-10.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WTdRJ2R7cz5QkLqL
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 15:36:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 511ba71050c64287a48492627d3b9298; Wed, 24 Jul 2024 15:36:44 +0000
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
X-Inumbo-ID: 887d549d-49d2-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721835404; x=1722095904;
	bh=mV9F0yhKfZ8w5MgZPO8xeYhTQIZZoqoj9ikwsTDEwnQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iacdkq26LMe3q7ed8aUtpFSiysSSAoauuf0gz6G1ovH15ENzXz8QVJvOU2bNab0dz
	 mXu4xeug4vbmXkakc9fVqfWSOa/LKskWtQ0VnXfGancsytgFexZhmp9R6CkEVn3kXg
	 537W+Fnt7FwH4/UX+FYVCni2G/VdY2XXGeUNdAKeeIcmlDs/jhzkWNuYLAUL6bmOla
	 A65p8Jgc9woQC0fyNDV5AOFIGniIAVNrdqRUuhzTY3Tu5Z/7+ZOEFGWhR0YF11Smh9
	 KA3QPdbKdIKggtvIilyRhuCH2lsts6QueIu16aIJXuokne2I2HbIkil0zqus2tNPTc
	 bprPwb5e9cuhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721835404; x=1722095904; i=anthony.perard@vates.tech;
	bh=mV9F0yhKfZ8w5MgZPO8xeYhTQIZZoqoj9ikwsTDEwnQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bCKnE1lPavt6MV/DforQx/iiiFvNk43Ru7xH4toygDk5g4Y9I2HV5bZzF1rcLhaVe
	 2ZNvLXefm6eDZl1SY9P3FabHc+q7SHcSC8dt2Yh9q4BcQsaNd3An2Yrmz69hoLZiS9
	 T7SMg6tSXN5MkGCpf0JBw3iJQW2tuYbXGk4In7DKW9LXIqVVGlCqZUDp9OKw8G7YNw
	 /fj4dovKkbyLnbGD4zNRIVthbJqZNwy4jVwIeJ+jaMOlxO57BkMNwhd1oCSJhfSkAS
	 JMNnY8vS6sdaqPYX7HqIla6DOpRfqBlSlSJw0ntiyfrAmqiVZiPSFeI+8R/+yD3bbC
	 nq+7dQIcezBeA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20xen=20|=20Failed=20pipeline=20for=20staging-4.19=20|=202d7b6170?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721835403611
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <ZqEfi3WkRTzDqRWi@l14>
References: <66a0fe638f16a_33beeb0103995@gitlab-sidekiq-catchall-v2-96b77f447-9jjmp.mail> <24be503c-7c8a-4db9-aee4-04b0c872c0dc@suse.com>
In-Reply-To: <24be503c-7c8a-4db9-aee4-04b0c872c0dc@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.511ba71050c64287a48492627d3b9298?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240724:md
Date: Wed, 24 Jul 2024 15:36:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 24, 2024 at 03:18:50PM +0200, Jan Beulich wrote:
> On 24.07.2024 15:15, GitLab wrote:
> > 
> > 
> > Pipeline #1385987377 has failed!
> > 
> > Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> > Branch: staging-4.19 ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging-4.19 )
> > 
> > Commit: 2d7b6170 ( https://gitlab.com/xen-project/hardware/xen/-/commit/2d7b6170cc69f8a1a60c52d87ba61f6b1f180132 )
> > Commit Message: hotplug: Restore block-tap phy compatibility (a...
> > Commit Author: Jason Andryuk ( https://gitlab.com/jandryuk-amd )
> > Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> > 
> > 
> > Pipeline #1385987377 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1385987377 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> > had 3 failed jobs.
> > 
> > Job #7415912260 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7415912260/raw )
> > 
> > Stage: test
> > Name: qemu-alpine-x86_64-gcc
> 
> This is the one known to fail more often than not, I think, but ...
> 
> > Job #7415912175 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7415912175/raw )
> > 
> > Stage: build
> > Name: ubuntu-24.04-x86_64-clang
> > Job #7415912173 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7415912173/raw )
> > 
> > Stage: build
> > Name: ubuntu-22.04-x86_64-gcc
> 
> ... for these two I can't spot any failure in the referenced logs. What's going on
> there?

They are crutial information missing in that email, the actual reason
given by gitlab for the failures: "There has been a timeout failure or
the job got stuck." (That message can be seen when going to the url,
removing "/raw" part, and scrolling to the top. Or looking at the side
bar and seen a duration that well above 1h)

Communication between gitlab and the runner might be broken in those
cases, or the runner stop working.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

