Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48888BFB379
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147743.1479910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVV8-0006za-4B; Wed, 22 Oct 2025 09:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147743.1479910; Wed, 22 Oct 2025 09:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBVV8-0006wv-1a; Wed, 22 Oct 2025 09:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1147743;
 Wed, 22 Oct 2025 09:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+7G=47=bounce.vates.tech=bounce-md_30504962.68f8a918.v1-aaeda03b40e6405b814909a8b740954c@srs-se1.protection.inumbo.net>)
 id 1vBVV6-0006wo-Jm
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:51:24 +0000
Received: from mail180-10.suw31.mandrillapp.com
 (mail180-10.suw31.mandrillapp.com [198.2.180.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa2d2e9b-af2c-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 11:51:22 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-10.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4cs4Dm6vqrz5Ql7wF
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 09:51:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 aaeda03b40e6405b814909a8b740954c; Wed, 22 Oct 2025 09:51:20 +0000
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
X-Inumbo-ID: aa2d2e9b-af2c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761126681; x=1761396681;
	bh=aKRaI3jaK4yfr76DmD5NuOKI+/Nb3OE8X0Ukz31rwg4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=S2UiLj4xInePi2FLfNfTh3oAlnPGAQA8nKs/mhUZgkEO0USpGDC8TiXk8AcpoTiE4
	 /cs2d3z4kbHHdvqtHNkDaH5KM+ZoZtBMhcNT5bFl+q0rQ0nwBwcmaJ/DXuO5fMFJCs
	 rZF0byre0/n9/O9M6crLvZZwTpA1uZa+dc3lB1dw3X9kznnGNqqrErX77CciBVG6W7
	 H2LDJQzSoXrKVrXaylQc/VdFYoPlGf1tL90G17UrYioG1dgIcpRWKkJJx6ESrXEOY6
	 HuME9T7yQ/yNYaJft/1bno02y8JLLLxumb55MoSD4hc5k/8Cn5S+UkfZUyfwFnQbaW
	 vONbdcKVeZ+yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761126681; x=1761387181; i=teddy.astie@vates.tech;
	bh=aKRaI3jaK4yfr76DmD5NuOKI+/Nb3OE8X0Ukz31rwg4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=mTacAvPlJybB11EbkGtE5r3fKCqgG5sCkdIrgElW0vsNurzHU1F2GEHFBB1eNZ1xD
	 si02/1wuX/OOgJF9171Elc3PdLWaLnGf7y8oOdOMcDgGh4KrkAu0fjvBMR2/5g8Ebs
	 FD4MGH9LeFPS69CDHvh5s17P9L0sWljhnr6QfSuBpa0E5LFf945wU4dxADxp+h/let
	 M8ZH2BFoUD6pQBler7JpBLjzCUr5g++Pmh1LwIEl+VpCCEdjLn3ubW0/bS5HqyhBc6
	 Am8kCIQivCWFp5eLOeNusBl2YhP6CTR7Yn0akmXOjilFC7HVuadd0lp0yHvRC2XsnU
	 sk6Pe4A0C8IVg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=200/4]=20Various=20IOMMU=20related=20simplifications?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761126679884
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <cover.1761124632.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.aaeda03b40e6405b814909a8b740954c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251022:md
Date: Wed, 22 Oct 2025 09:51:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Various simplifications in the VT-d and IO-APIC code (mostly related to legacy ia64 code).

No functional change intended.

Teddy Astie (4):
  vtd: Move (un)map_vtd_domain_page to extern.h
  vtd: Collapse x86 subdirectory
  vtd: Remove IO_xAPIC_route_entry macro
  x86/ioapic: Don't open-code 32-bits rte reads

 xen/arch/x86/include/asm/io_apic.h          |  1 +
 xen/arch/x86/io_apic.c                      | 29 +++++--------
 xen/drivers/passthrough/iommu.c             | 10 +++++
 xen/drivers/passthrough/vtd/Makefile        |  3 +-
 xen/drivers/passthrough/vtd/{x86 => }/ats.c | 10 ++---
 xen/drivers/passthrough/vtd/extern.h        | 13 +++++-
 xen/drivers/passthrough/vtd/intremap.c      | 19 ++++----
 xen/drivers/passthrough/vtd/vtd.h           |  3 --
 xen/drivers/passthrough/vtd/x86/Makefile    |  2 -
 xen/drivers/passthrough/vtd/x86/vtd.c       | 48 ---------------------
 10 files changed, 47 insertions(+), 91 deletions(-)
 rename xen/drivers/passthrough/vtd/{x86 => }/ats.c (97%)
 delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
 delete mode 100644 xen/drivers/passthrough/vtd/x86/vtd.c

-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


