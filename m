Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB1A92E8EA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757459.1166389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtXv-00014j-Kt; Thu, 11 Jul 2024 13:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757459.1166389; Thu, 11 Jul 2024 13:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtXv-00011m-IH; Thu, 11 Jul 2024 13:09:15 +0000
Received: by outflank-mailman (input) for mailman id 757459;
 Thu, 11 Jul 2024 13:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz+P=OL=bounce.vates.tech=bounce-md_30504962.668fd976.v1-c90aca7fff924ee384a44b3008c39711@srs-se1.protection.inumbo.net>)
 id 1sRtXu-00011g-Av
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:09:14 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c40fa81d-3f86-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 15:09:12 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKZn24PN6zB5pTvF
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 13:09:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c90aca7fff924ee384a44b3008c39711; Thu, 11 Jul 2024 13:09:10 +0000
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
X-Inumbo-ID: c40fa81d-3f86-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720703350; x=1720963850;
	bh=KDoG5i0B0orQ4+VkAv5WRC6aoH3UeT46QzIC1C0zrHY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vNoTL6H3+MlfsQZM9VbCYgiYPZA7iTijBfGDEGVIVHJ6/FYdsFCoFO1XTZKzsvQyp
	 DEm/PI/KLg0aRofDaFW7dTRCjuCb7xQfQ9b/AuibtOH2ybcCJGwO8+9T38WAOaEC6O
	 LLXLALONbO6l7Cj9tvNmcLng0Ykot7jVaWprbKzBgHTh+UTGQOQHam1U7W9E/z/hon
	 PLL2rUoratjM2bH9F2t3fFDnvPNpp971pnW6UxWJzEWOyE5eJ60ab+6REnqWI+jfnL
	 Q37LLiRvXvbPZMXNn5qoRYjdKt3oamUAiy4QzsxAVDx2VHy1mUf4836WS23TGEsvod
	 lMB9UZ2tyBwcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720703350; x=1720963850; i=anthony.perard@vates.tech;
	bh=KDoG5i0B0orQ4+VkAv5WRC6aoH3UeT46QzIC1C0zrHY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=g5YVrQzOEMfcBvfJkIn6rGfxFnqxauXRe8gFQN9p8T1t+jeKNHwuf+u12Qz92rmZB
	 v1G7ILPYVny98fFOm/gTmx7FuU3TCoxqei9Hncky7pn3LdnijCVa3w2dQHxgwRfysx
	 uZn5UtWNv38Qun3tttg8Lf5QZ10vJK5PP+AhoXCfH55zWI06+EoEQyP/iB/JVez4pB
	 kwVsUBDX1ioiQw9GiniwlRtir4Pp5OLJ1Upt8BGsaqfNv++ZWO/BxPDGoqm2nXFDZ3
	 P2VfBz+CfS4X9arNDMySshxxny6TIw56W5QT3HwILxqt53LPemvu38lCvfJUp+gf4O
	 LI5MKkwWP4NSQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2002/12]=20CI:=20Remove=20useless/misleading=20randconfig=20jobs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720703349367
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo/ZdG8pt5FIledD@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-3-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-3-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c90aca7fff924ee384a44b3008c39711?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 13:09:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:07PM +0100, Andrew Cooper wrote:
> Randconfig builds pick CONFIG_DEBUG with 50% probability.  Therefore
> $foo{,-debug}-randconfig are two identical jobs with misleading names.
> 
> Furthermore, arm64 has a randconfig jobs for both the alpine and bookworm
> build environments.  Both use GCC 12.2, so we have 4 identical jobs.  Delete 3
> of them.
> 
> This leaves us with 4 primary randconfig jobs:
> 
>   gitlab-ci/build.yaml:381:debian-bookworm-gcc-arm32-randconfig:
>   gitlab-ci/build.yaml:429:alpine-3.18-gcc-arm64-randconfig:
>   gitlab-ci/build.yaml:495:archlinux-current-gcc-riscv64-randconfig:
>   gitlab-ci/build.yaml:640:debian-bookworm-gcc-randconfig:
> 
> as PPC64 doesn't want randconfig right now, and buster-gcc-ibt is a special
> job with a custom compiler.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

> If we want to run multiple identical randconfig jobs, that's spelt
> 
>   parallel: 5
> 
> in the configuration, and here is an example of what such a run looks like:
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1368824041
> 
> Notice the randconfig jobs have a 5 in place of a retry button, and show a
> submenu when clicked on.

We already have "parallel: 2" on the whole pipeline, give or take, but
those are quick jobs so it might be worth it to run them a few more time
on a pipeline.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

