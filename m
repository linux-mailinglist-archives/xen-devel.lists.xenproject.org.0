Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8AC8E82D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 14:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173858.1498855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDo-0007WM-B3; Thu, 27 Nov 2025 13:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173858.1498855; Thu, 27 Nov 2025 13:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcDo-0007Uv-85; Thu, 27 Nov 2025 13:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1173858;
 Thu, 27 Nov 2025 13:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wiUh=6D=bounce.vates.tech=bounce-md_30504962.6928549b.v1-9e7200fe356a47f386094bc58eb43313@srs-se1.protection.inumbo.net>)
 id 1vOcDn-0007Up-Fm
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 13:39:43 +0000
Received: from mail132-18.atl131.mandrillapp.com
 (mail132-18.atl131.mandrillapp.com [198.2.132.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 868a4a58-cb96-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 14:39:42 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-18.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHHbc0bW6zCf9Xsd
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 13:39:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9e7200fe356a47f386094bc58eb43313; Thu, 27 Nov 2025 13:39:39 +0000
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
X-Inumbo-ID: 868a4a58-cb96-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764250780; x=1764520780;
	bh=H+veXQ6aputszDejimTVagqBjaf9DIfMMnXczlKlUwU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=WMtywkXQ8yBXW4NrXZpwHw1jIIw7A8LM6BkpTPuZfeC4uZBPn9XNt4zS3MJ0/gDEj
	 bCx56ebrVGAGSdMYHhsml8WP1PHL1yQXkzMczBjBzIjTvLvITIoe9dda1BWjcVHwua
	 Qyq5vYoYdzC3cAXmiGqL7qwPFpuMq7PQ/4fvOxZU2nNJ2PGMfHWRzG7F/L8hZJnO1E
	 0c6jc8MA8rPpd0bv4U7sFfPdEy9mFLbSwG5qgOY5QT2KN6VErWpsXT0EFCLLqzmd9b
	 lIueELFFG2N6LrSbl7B2C9ZCaYMfGN0GPNwwCYuTqSQK4xk1AmFqlom5E5P3mLSpfx
	 /H16TFcRVG5jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764250780; x=1764511280; i=teddy.astie@vates.tech;
	bh=H+veXQ6aputszDejimTVagqBjaf9DIfMMnXczlKlUwU=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Zt/dHtp5kSP8Zb2NRZW+RXLi3rpaLGcGiFsjBt2ByRMAH1Nb2+zEWVOf6Gt3PGjO+
	 gLU8dMY/ZT0tjgLAzObNEf6jgAwoG80W4hwVGuUDmv3E5Uae4c4L997rhtaKy6Do8I
	 eYFgUgOawwFzrld2tQsWzivKw0G269PjRL5DQh6BiljwCzeO8Mp2Ev8gG4nzOVSIX5
	 30+hNZ+M00Nwfpi18nt6+z9wqguRGKLHXbrKoaNSxvAqUMsyELa0AZLRSU7QotuoYy
	 noZQWnnPHnyZQtBsUoXSM1cbQRkneNGMrM+73G+LbjDxGTLLZZHJSetbpADvM3HsxF
	 9ysZbEYOZcVfg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=200/4]=20x86/p2m:=20Some=20P2M=20refactoring?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764250779124
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Tim Deegan" <tim@xen.org>
Message-Id: <cover.1764248710.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9e7200fe356a47f386094bc58eb43313?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 13:39:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

First patch removes a shadow mode check in a function that can't be
called with shadow mode (only called with EPT hence HAP).

3 other patches drops guest_tlb_flush_mask by removing all its users :
in the shadow paging case by migrating it a shadow variant of it and
in the hap case by moving it to p2m->flush_tlb logic.

One of the goal is to prepare adding HAP-specific optimizations to TLB
flushing code without risking regressions in the shadow paging code.

Teddy Astie (4):
  x86/ept: Drop shadow mode check in ept_sync_domain()
  x86/shadow: Replace guest_tlb_flush_mask with sh_flush_tlb_mask
  x86/p2m-pt: Set p2m->need_flush if page was present before
  x86/hap: Migrate tlb flush logic to p2m->flush_tlb

 xen/arch/x86/flushtlb.c             | 15 ---------------
 xen/arch/x86/include/asm/flushtlb.h |  3 ---
 xen/arch/x86/include/asm/p2m.h      |  3 ---
 xen/arch/x86/mm/hap/hap.c           | 14 +++-----------
 xen/arch/x86/mm/hap/nested_hap.c    |  7 +------
 xen/arch/x86/mm/nested.c            |  2 +-
 xen/arch/x86/mm/p2m-ept.c           |  5 +++--
 xen/arch/x86/mm/p2m-pt.c            | 13 +++++--------
 xen/arch/x86/mm/p2m.c               |  8 ++++----
 xen/arch/x86/mm/shadow/common.c     | 12 ++++++------
 xen/arch/x86/mm/shadow/hvm.c        |  8 ++++----
 xen/arch/x86/mm/shadow/multi.c      | 18 ++++++------------
 xen/arch/x86/mm/shadow/private.h    | 22 ++++++++++++++++++++++
 13 files changed, 55 insertions(+), 75 deletions(-)

-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


