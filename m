Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FFCD08F0
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 16:42:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190776.1511045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccZ-0006lZ-Hz; Fri, 19 Dec 2025 15:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190776.1511045; Fri, 19 Dec 2025 15:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWccZ-0006iV-BD; Fri, 19 Dec 2025 15:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1190776;
 Fri, 19 Dec 2025 15:42:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKhq=6Z=bounce.vates.tech=bounce-md_30504962.69457259.v1-236ed50d70b14781a2be88b03c755e16@srs-se1.protection.inumbo.net>)
 id 1vWccY-0006gp-04
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 15:42:22 +0000
Received: from mail137-31.atl71.mandrillapp.com
 (mail137-31.atl71.mandrillapp.com [198.2.137.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ce89c10-dcf1-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 16:42:19 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-31.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dXsGx1fX7z7lmVWh
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 15:42:17 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 236ed50d70b14781a2be88b03c755e16; Fri, 19 Dec 2025 15:42:17 +0000
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
X-Inumbo-ID: 4ce89c10-dcf1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1766158937; x=1766428937;
	bh=rMGk7VgKAqCBAtbYbYA7r6RbALS0kbfzdXHv7qhvnIQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=i5REmgtKGkjywx93jpjlaRT6o0ohOEuyi4YvOYDmLFN3R9tESv6rnU8hVTzwPcIWx
	 EaxOxnvRzpcwQ/je7HpaNYlASwA5z9Z9TplnsET3yO5U9RZeFfB/iXXc0UwAQGO37t
	 6NpGBQtQNhh0nZC5aABUV6tX+iHouj+ncRDaVBqGXi121Ba8Yx/V5WFRBaSXb28hxH
	 qNvC7Gj0KIDONf8MmBJMcR5EsjGIww5KPFlDbtXIfvab3W484FvuGawjCNnnhnNtIi
	 ucjeveYSoqnT4l4NMAvUUqNWBrBZSC23YoOAwSRdixAZtQ4AjngUoRZ9dc+lOBhpy5
	 yb/iDXiSp28pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1766158937; x=1766419437; i=teddy.astie@vates.tech;
	bh=rMGk7VgKAqCBAtbYbYA7r6RbALS0kbfzdXHv7qhvnIQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=yh/7Q0yObO9oQiHK55HlvSoGZjofdpp74wl0tM3V1yKXst3A5zD8EfG0ArQcl8juS
	 kUhlc3vfcHHLRgtXPdo2Fkz9AdBkz3t+vDQnQAlR5k2Ayo3zYCYd1gaL3zbjlpVczd
	 YK3lh5+ihf06nixngJ6/UJ8IABeRkS/TPtQawlWvrG7z2ShsoAOddbYhLrMg6VTUJ8
	 yQHgiAgl9Exp2v1pWD0bUHzlE4oMt/GBPbIz6EwVjmSau976PmdF+tDOTgCH+xg7hL
	 5rz16CuI+2kdjatRs8sRLfs7s2z0HmYAEPLV1dOzfz7G1a/fVIBagRruv+UlejNLMt
	 tZwbGMTpRku2w==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v4=200/4]=20Support=20for=20Intel=20temperature=20sensors=20(DTS)?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1766158935717
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <cover.1766158766.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.236ed50d70b14781a2be88b03c755e16?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251219:md
Date: Fri, 19 Dec 2025 15:42:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The idea here is to expose the DTS sensors through XENPF_resource_op
and expose it for the user through xenpm.

v4:
 - reuse original cpu-policy patch
 - remove xenpm building on non-x86
 - add changelog notes
 - reviewed xc_resource_op return code handling
 - only print missing MSR_TEMPERATURE_TARGET message once
 - formatting changes

v3:
 - use msr-index.h instead of adding defines to MSRs in xenpm

v2:
 - moved userland part to xenpm
 - use cpu policy infrastructure instead of inline cpuid_*
 
Jan Beulich (1):
  x86/cpu-policy: define bits of leaf 6

Teddy Astie (3):
  xenpm: Don't build outside of x86
  x86/platform: Expose DTS sensors MSR
  xenpm: Add get-intel-temp subcommand

 CHANGELOG.md                         |   6 ++
 tools/misc/Makefile                  |   2 +-
 tools/misc/xenpm.c                   | 113 ++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/msr-index.h |   3 +
 xen/arch/x86/platform_hypercall.c    |   6 ++
 xen/include/xen/lib/x86/cpu-policy.h |  27 ++++++-
 6 files changed, 154 insertions(+), 3 deletions(-)

-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


