Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD7AD6F51
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 13:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012925.1391447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgMy-00024v-QT; Thu, 12 Jun 2025 11:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012925.1391447; Thu, 12 Jun 2025 11:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPgMy-00022B-NW; Thu, 12 Jun 2025 11:45:20 +0000
Received: by outflank-mailman (input) for mailman id 1012925;
 Thu, 12 Jun 2025 11:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDOK=Y3=bounce.vates.tech=bounce-md_30504962.684abdcb.v1-8d8ce76ea9094f4393af6d5f0659fcb0@srs-se1.protection.inumbo.net>)
 id 1uPgMx-000222-6C
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 11:45:19 +0000
Received: from mail36.us4.mandrillapp.com (mail36.us4.mandrillapp.com
 [205.201.136.36]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b55df9ed-4782-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 13:45:17 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail36.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bJ1173Yy9zS62Gxc
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 11:45:15 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8d8ce76ea9094f4393af6d5f0659fcb0; Thu, 12 Jun 2025 11:45:15 +0000
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
X-Inumbo-ID: b55df9ed-4782-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749728715; x=1749998715;
	bh=7cDHf1g3XpDeCPvM0pPKcTSosiJNoQW7LvEECDF8XZs=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=pSSyYii3XHTeNWC08NikLcoUe+0csC78ihdYgosK2TTh2U+ijqYjKj/0rj2VPFQeG
	 bouA7SN+6X+wy8MU38XWiZz8M1hDPVjN6LcwBIL3HhLwZphISfV8ysfon4gDtNHhwt
	 aKzWflh1/2OqTdQ/B6pIaagUhEWant4w/k9AbeNhcCjWGus4luF9fB42V2ZjgOGJmc
	 KYzvS5Cf2ArrJ4f4iXjggMuc0JQjhmlPMh+b8UI38s4nUDb/hS+HW5RYfRUEVtcb/E
	 IUwzxVTLtTv3BOhDqfr2/V76HR+k7MO+iCnV+IxnLfUhzpV3NEod0iH3De3D8KhK5U
	 1XHoQ9uteq5Gw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749728715; x=1749989215; i=teddy.astie@vates.tech;
	bh=7cDHf1g3XpDeCPvM0pPKcTSosiJNoQW7LvEECDF8XZs=;
	h=From:Subject:Message-Id:To:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=DDKBXRb3dcMeSPQckefvbFlqZ1VZc1e9oiUhNInNRzwpzYogT2iXE1nxqkRsE9CUL
	 +43kb9bHuFnCGTYx5yFaDHf6YTg/2l/ZZyHxEtxXLjHDSY7j3buPs69qEi+Es8tquv
	 MphH4+b5BbBOShw1mct7q4PXfA3vd3GRSHcnkqwGlihUwOn7RJuUanbDc9SebNqmFc
	 VOHA3fXoI1HE+Ow8nSuLL4VtwJnCU9i/8V+NIMofakpMrM7tlW4fgdAsyy62ZblwOQ
	 5Bb6uYQFn5VDUj1tuOyaO68wqwGpaq4We1c3Sbsp4ySHg6LK5wxQ3oOREJGt97UkQO
	 pkrrB+4W/pVHg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC]=20Proposed=20x86=20shadow=20paging=20changes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749728714870
Message-Id: <a769ea0f-84b7-47d0-9a6a-438de98aa0ed@vates.tech>
To: Xen-devel <xen-devel@lists.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8d8ce76ea9094f4393af6d5f0659fcb0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250612:md
Date: Thu, 12 Jun 2025 11:45:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

In Xen x86, there is the shadow paging that could be used in some cases 
(notably with HVM), and is used when HAP is not available. It may also 
be used in very specific cases for PV guests.

With the vast majority of hardware supporting HAP (through EPT or NPT), 
it's rarely used in practice for HVM, with most downstream projects 
(XenServer, XCP-ng, QubesOS) are compiling-out its support by default. 
It also performs very significantly worse than HAP.

Therefore, it's not very used in production, and unsurprisingly isn't 
actively being worked on (most projects being around HAP).

One of the issues of Shadow Paging is that it relies on a heavy set of 
optimizations, with some of them being effectively obselete 
(optimisations based on heuristics designed for more than 20 years old 
kernels) or eventually problematic (e.g with modern CPU mitigations e.g 
L1TF mitigations).
Most of these optimizations are hard to reason regarding reliability and 
security and difficult to debug. Some of these optimizations causes very 
subtle issues with TLB refactoring for ASID management rework [1].
Moreover, it's fair to say performance is no longer the priority for 
shadow paging.

My proposal would be to :
- significantly reduce the complexity of shadow paging by dropping most 
of the complex optimizations
- consider Shadow Paging as Deprecated
 > Functional completeness: Yes
 > Functional stability: Quirky
 > Interface stability: No (as in, may disappear the next release)
 > Security supported: Yes

Teddy

[1] 
https://lore.kernel.org/xen-devel/9cdb3e67abd01390bcc4cd103ca539d6bf7adbc0.1747312394.git.teddy.astie@vates.tech/


 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


