Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FB453E030
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 05:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342163.567222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bk-0006CH-4I; Mon, 06 Jun 2022 03:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342163.567222; Mon, 06 Jun 2022 03:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ny3bj-0006AU-VT; Mon, 06 Jun 2022 03:40:47 +0000
Received: by outflank-mailman (input) for mailman id 342163;
 Mon, 06 Jun 2022 03:40:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ny3bi-0006AI-0I
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 03:40:46 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7021a82f-e54a-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 05:40:42 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 07AAE5C0121;
 Sun,  5 Jun 2022 23:40:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 05 Jun 2022 23:40:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Jun 2022 23:40:39 -0400 (EDT)
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
X-Inumbo-ID: 7021a82f-e54a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1654486841; x=1654573241; bh=7MjZrA6murLLAihNY6Un10I7X//Y3HFoLj2
	d9nffLD8=; b=F/VU+rckCr1Bxg8+/5CDQ1IKqp/Kjk3j/b2a2ACwrVTHJ1+seZq
	jbzkMXJcFa78+BWk+6gaIUNKSlWad74kr73Qk3kw2xJ7SGnvYIp9kH+Z++bt9EXE
	/BkHySG0qFG5jltc2eBYrICEEvOW8TLPI9YNxcrQ3uHgQOORJbcdsfi+riH1ZLqh
	xSmBry4EEgeOdaRN8eNOgageaZwN3ZmLRcwB2V4bGznziLVj8abtemEGJ7WkW1k6
	lT6R1RePZTP08rLg+OWAdgVLM+xuSWZ9AdMCXMcSx6ahbzchZe2XMydUVYBColr5
	sS+2EyacF/DCDF8c2gJyvQqQvTSzh12gQpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1654486841; x=1654573241; bh=7MjZrA6murLLA
	ihNY6Un10I7X//Y3HFoLj2d9nffLD8=; b=SmdPv9NRAuU2vZ1N5H1ToSLWGYsip
	wxXGaMJhN5miaLXBjk5h3z+xF/Cj8CLb9Fb3cRbWoj5TkJEQ2F6X0QyURqJPZell
	qxlWAg2g4TnPnI8tgUvn5pd3zSpT5nW1GbtZiuqJDUZGiHon2UffOnFwczJ27rqB
	aTHd1xya++GCv3JjPcMKgA/6hIyNAjzJoXn5c7gx27dEvNK3iBzP3ejEvL6+ajKX
	0aqFKhipyH/4k5akUFMd9FoSRTE5soAPVbtEUMrY4uNcpxsBt92/1NqTxHS7s41k
	veH0nEtFIUIz3YKWxU/+nOBgl5cbxjqgl2Rhd9LQ6Ciu+ehHbcZPlo5Tw==
X-ME-Sender: <xms:OHedYouKNnKdndSmJ2AbgtmB5Nq0_NG-PPi-1KsExEHby-ZXXDyzEQ>
    <xme:OHedYlf7yytrXyXpai3on747rKDWEz7iakUIj6EVvhF-OuAf52wdz8b7IxIG7fA_y
    -f5ymSKJgm4tw>
X-ME-Received: <xmr:OHedYjyGPgdVlZkN_l9t1i2HHaTVa9iCF5sxeAC0Y9T_6c2QQbgx2jJs6i-RrfF9u7H4l5I5Z3sZAL0yEn11g1IoXZjTFWZjpAvxlKPBkaz6X6K-azk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtuddgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeefgffg
    geevhffggfetfefhffeuvefhvdevkeehkedttddtgeefkeduheevffduleenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:OHedYrN7bE47sdhK_H5Sqy-hf2d9oTe15rE3LXM_igJqbhxMdnyK-g>
    <xmx:OHedYo9Bm1q0T70z9qjmG4Lf2oJ_pRAY1sTq5VXv8Nklq-ekmRUfFQ>
    <xmx:OHedYjUAvAO6YkQwnkW8IIpnx3V6smtpMcnvZ8Kc8mrIxgoxjwOhZQ>
    <xmx:OXedYsR1y97A0iP-YzJUmiimI-i1VH1HfK4QXOpe7fThNgLWjjSwqQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability
Date: Mon,  6 Jun 2022 05:40:12 +0200
Message-Id: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is integration of https://github.com/connojd/xue into mainline Xen.
This patch series includes several patches that I made in the process, some are
very loosely related.

The RFC status is to collect feedback on the shape of this series, specifically:

1. The actual Xue driver is a header-only library. Most of the code is in a
series of inline functions in xue.h. I kept it this way, to ease integrating
Xue updates. That's also why I preserved its original code style. Is it okay,
or should I move the code to a .c file?

2. The xue.h file includes bindings for several other environments too (EFI,
Linux, ...). This is unused code, behind #ifdef. Again, I kept it to ease
updating. Should I remove it?

3. The adding of IOMMU reserverd memory is necessary even if "hiding" device
from dom0. Otherwise, VT-d will deny DMA. That's probably not the most elegant
solution, but Xen doesn't have seem to have provisions for devices doing DMA
into Xen's memory.

4. To preserve authorship, I included unmodified "drivers/char: Add support for
Xue USB3 debugger" commit from Connor, and only added my changes on top. This
means, with that this commit, the driver doesn't work yet (but it does
compile). Is it okay, or should I combine fixes into that commit and somehow
mark authorship in the commit message?

5. The last patch(es) enable using the controller by dom0, even when Xen
uses DbC part. That's possible, because the capability was designed
specifically to allow separate driver handle it, in parallel to unmodified xhci
driver (separate set of registers, pretending the port is "disconnected" for
the main xhci driver etc). It works with Linux dom0, although requires an awful
hack - re-enabling bus mastering behind dom0's backs. Is it okay to leave this
functionality as is, or guard it behind some cmdline option, or maybe remove
completely?

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>

Connor Davis (1):
  drivers/char: Add support for Xue USB3 debugger

Marek Marczykowski-Górecki (11):
  xue: annotate functions with cf_check
  xue: reset XHCI ports when initializing dbc
  xue: add support for selecting specific xhci
  ehci-dbgp: fix selecting n-th ehci controller
  console: support multiple serial console simultaneously
  IOMMU: add common API for device reserved memory
  IOMMU/VT-d: wire common device reserved memory API
  IOMMU/AMD: wire common device reserved memory API
  xue: mark DMA buffers as reserved for the device
  xue: prevent dom0 (or other domain) from using the device
  xue: allow driving the reset of XHCI by a domain while Xen uses DbC

 docs/misc/xen-command-line.pandoc        |    5 +-
 xen/arch/x86/include/asm/fixmap.h        |    4 +-
 xen/arch/x86/setup.c                     |    5 +-
 xen/drivers/char/Makefile                |    1 +-
 xen/drivers/char/console.c               |   58 +-
 xen/drivers/char/ehci-dbgp.c             |    2 +-
 xen/drivers/char/xue.c                   |  197 ++-
 xen/drivers/passthrough/amd/iommu_acpi.c |   16 +-
 xen/drivers/passthrough/iommu.c          |   40 +-
 xen/drivers/passthrough/vtd/dmar.c       |  203 +-
 xen/include/xen/iommu.h                  |   11 +-
 xen/include/xue.h                        | 1942 +++++++++++++++++++++++-
 12 files changed, 2387 insertions(+), 97 deletions(-)
 create mode 100644 xen/drivers/char/xue.c
 create mode 100644 xen/include/xue.h

base-commit: 49dd52fb1311dadab29f6634d0bc1f4c022c357a
-- 
git-series 0.9.1

