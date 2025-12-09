Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A8CB0B29
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 18:19:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1182036.1504982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Mm-0005iI-2g; Tue, 09 Dec 2025 17:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1182036.1504982; Tue, 09 Dec 2025 17:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vT1Ml-0005em-UO; Tue, 09 Dec 2025 17:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1182036;
 Tue, 09 Dec 2025 17:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqtn=6P=bounce.vates.tech=bounce-md_30504962.69385a0a.v1-3197bb4c014e49a287c8cbd8cf335242@srs-se1.protection.inumbo.net>)
 id 1vT1Mk-0005cC-NU
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 17:19:10 +0000
Received: from mail187-28.suw11.mandrillapp.com
 (mail187-28.suw11.mandrillapp.com [198.2.187.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b5ab827-d523-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 18:19:08 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-28.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4dQlvG6kXJzMQxgGg
 for <xen-devel@lists.xenproject.org>; Tue,  9 Dec 2025 17:19:06 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3197bb4c014e49a287c8cbd8cf335242; Tue, 09 Dec 2025 17:19:06 +0000
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
X-Inumbo-ID: 2b5ab827-d523-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1765300746; x=1765570746;
	bh=T8BxQyHaTM8Vxv9q11NjSlbM4TLG3b8CE8KX4D6riUI=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=QRUg+rxVCtKJjJAwS+X6cLQDPrDCGEwNUFnJGJh5hUSKMeljgLoRl4DFKmXFwMbfa
	 MP869LrSzjIj9Xj8MCB79fk+oYH+q3e1n6u77YZDI0Zv9rpptXu4iWWSfjUHe2BuL0
	 Qr1nkhBfFZcU+ihrse3nLz3SXyj7EPjSkut4e1M88XofkhZluoRI6xrpIpEuAv83Zb
	 Ti1nkdHr0ESFYeEniohDSG+hKdRJlfABtrXiUyCocoPTEgcnpbVdMyTHNZA4SjaR5L
	 knjQlSxQBpPUbzMz8zYGMeCjVBNhoLlUuNYMkUxdVFCWwNZ/tE7T21a5LfP3wnF5/A
	 RFjbL4AK5QHkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1765300746; x=1765561246; i=teddy.astie@vates.tech;
	bh=T8BxQyHaTM8Vxv9q11NjSlbM4TLG3b8CE8KX4D6riUI=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=PgJ5KRjXrGsnWQSD/oLbEFNYJLiMv0dn0L/3uUvOSl/Ufuv9hL4pQ6GzZLAWrilUy
	 o98vvELETb0fnfvNbMKfCGCKNuwEBFRREeEgrdFs1TDphYPHxs9O8dFvM7Ha+zXOmd
	 R8X/ALKUrr2IoArQoXL7j5jz/08SndA0ol71jGAoB1GgrZ1pT+CHuPbuPIdoGxFG6q
	 Y0fDdQVSYcvFMWaGx9eXB77GEZ1twvCBAW8P04aFxGMRhZ17JcLBqAlzEtJs42Ol8R
	 haqj48mtx6WFEPVHFQ12WsMw3jT1nJkXbZy446+RG6ePRuS1sLOHLB/Y+8yOfk2XKY
	 jEVLf0pO1kKdg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=200/3]=20Support=20for=20Intel=20temperature=20sensors=20(DTS)?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1765300745836
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <cover.1765300623.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3197bb4c014e49a287c8cbd8cf335242?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251209:md
Date: Tue, 09 Dec 2025 17:19:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The idea here is to expose the DTS sensors through XENPF_resource_op
and expose it for the user through xenpm.

v3:
 - use msr-index.h instead of adding defines to MSRs in xenpm

v2:
 - moved userland part to xenpm
 - use cpu policy infrastructure instead of inline cpuid

Teddy Astie (3):
  x86/cpu-policy: Infrastructure for CPUID leaf 0x6
  x86/platform: Expose DTS sensors MSR
  xenpm: Add get-intel-temp subcommand

 tools/misc/xenpm.c                   | 91 +++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/msr-index.h |  3 +
 xen/arch/x86/platform_hypercall.c    |  6 ++
 xen/include/xen/lib/x86/cpu-policy.h | 27 ++++++++-
 4 files changed, 125 insertions(+), 2 deletions(-)

-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


