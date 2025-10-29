Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD35C1BE14
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152911.1483419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aJ-0007BL-OM; Wed, 29 Oct 2025 15:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152911.1483419; Wed, 29 Oct 2025 15:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8aJ-00079h-Ke; Wed, 29 Oct 2025 15:59:39 +0000
Received: by outflank-mailman (input) for mailman id 1152911;
 Wed, 29 Oct 2025 15:59:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xim6=5G=bounce.vates.tech=bounce-md_30504962.690239e5.v1-fe02f2e9af4d4541bd1d81cf85a5b1a0@srs-se1.protection.inumbo.net>)
 id 1vE8aH-0006vP-Mr
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:59:37 +0000
Received: from mail132-22.atl131.mandrillapp.com
 (mail132-22.atl131.mandrillapp.com [198.2.132.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4472e064-b4e0-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 16:59:37 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-22.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cxX4P0q0YzGltNRT
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 15:59:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 fe02f2e9af4d4541bd1d81cf85a5b1a0; Wed, 29 Oct 2025 15:59:33 +0000
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
X-Inumbo-ID: 4472e064-b4e0-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761753573; x=1762023573;
	bh=cGY02QTdXkqNenVo2hnr9vuOLwnNWC7i2l7xGy1g9nA=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=18bilP+Z0f3xLVajuhAd2aBJtZTJRECT0hD3EN8L5V6Ymu9XCPqlklWt2n6BgQZhX
	 PR06ZbXgkLh70hgmv+Fs4KVL6tOVh/6iZO2wSf9e/gCdNIlGf3EKoIXdwMTZX8laUD
	 bKBubh0DrFO+peYli8vrMBValbj4BRT2C7DPbYkTg3IjyHHFjhwTTbM6BmNMUOy2gb
	 zzBCWH8N75D7Vh9CluB8Y71XcCIdihDR9OFN6CXhxzBBAjK0c3ZIVny9+SLa6nNKZR
	 KUqnTtGpkp2rl4n4gBeJUhHonxr+OU7etbd36UVHLfU1AVsXGbyrUn9btUh4xLA0VD
	 MjozdB9EOXwng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761753573; x=1762014073; i=teddy.astie@vates.tech;
	bh=cGY02QTdXkqNenVo2hnr9vuOLwnNWC7i2l7xGy1g9nA=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Zs91FByIgl/9D/GbXLk2Pcmtrmrq7W2yXqY1Qt1p3lmseSjYy0u0TfHbzl3afBpSa
	 bWvQgwm8FVg204eu2akrzfW0UXPtU+r7/N8+d8Gi48JLToSkakvJlDtd/KbvUiuKxn
	 rUuXg+mvqmQ/EjduSjmQ19l0lrCQrHXvZjVQXX1jxnZ/OOCZ8X8dFYXnS3qQef35CH
	 LdAqSHM8htZ6uSYmzOTTkr9wX5l/OQKs2/5Ixkn8KgJe0/vThBQ/dFFvc36a3insXz
	 0xjOLtPciImPItBrLoLmh+1ikyOaGzvo3c9AYkMaHGId/nlHXcojhaxrbdaNfHq/AU
	 2Zwn1LN8pME1g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20for-4.22=20v2=200/3]=20Support=20for=20Intel=20temperature=20sensors=20(DTS)?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761753571773
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <cover.1761752801.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.fe02f2e9af4d4541bd1d81cf85a5b1a0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251029:md
Date: Wed, 29 Oct 2025 15:59:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The idea here is to expose the DTS sensors through XENPF_resource_op
and expose it for the user through xenpm.

v2:
 - moved userland part to xenpm
 - use cpu policy infrastructure instead of inline cpuid

Teddy Astie (3):
  x86/cpu-policy: Infrastructure for CPUID leaf 0x6
  x86/platform: Expose DTS sensors MSR
  xenpm: Add get-intel-temp subcommand

 tools/misc/xenpm.c                   | 93 +++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/msr-index.h |  3 +
 xen/arch/x86/platform_hypercall.c    |  6 ++
 xen/include/xen/lib/x86/cpu-policy.h | 27 +++++++-
 4 files changed, 127 insertions(+), 2 deletions(-)

-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


