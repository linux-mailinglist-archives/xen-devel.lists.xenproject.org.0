Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF268AB4AF9
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 07:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982482.1368831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEiCK-0003Js-V6; Tue, 13 May 2025 05:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982482.1368831; Tue, 13 May 2025 05:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEiCK-0003HW-P8; Tue, 13 May 2025 05:29:00 +0000
Received: by outflank-mailman (input) for mailman id 982482;
 Tue, 13 May 2025 05:29:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ws9y=X5=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uEiCI-0003HO-MO
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 05:29:00 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29951e4c-2fbb-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 07:28:55 +0200 (CEST)
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
X-Inumbo-ID: 29951e4c-2fbb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747114134; x=1747373334;
	bh=x6BZWh7G08S8WrxqfstLOBlPC9RhnKLrx/6y3XGUxDE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=HDFBA2z5V36uep6cBR1uUsMy5daPgv2JSUVLJXeg6o+WfgWuJy6PQXoyFGBVp1iE4
	 L5U1QbTQhKeJ6ffg4DTQUmBPFXG9MmmAY7booaW5ngZ+Hv5VI9PkXTThrfghEDZuFV
	 0TQ0DRWIR8qOq5jo83tYuxAYbccox+u3U/cvW8TfUSJsNRBhedH6UBlsXa6y6DHoPs
	 66k015sKizxe4PZwtCwEWoV28ZWjs+SeJiGjPiLqrCtXEd/Ya7QgmT8a7oIeUosBCB
	 haDZlOlNBkT/yenL1NaDRUwzXIfcSm/RiKL53o4c+V6dv5n7sO4UWLOWhY1kd0/Hm8
	 ma8ZmC+5I8GIQ==
Date: Tue, 13 May 2025 05:28:48 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com, roger.pau@citrix.com, nicola.vetrini@bugseng.com, consulting@bugseng.com, dmukhin@ford.com
Subject: [PATCH v5 0/2] x86/vmx: __vmread() cleanup
Message-ID: <20250513052809.3947164-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 64564245a46286fc62b2c46f1d123633555edf98
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 is a straight replace of __vmread() with a new vmread() call.
Patch 2 removes __vmread() and updates ECLAIR config; depends on patch 1.

Link to v4: https://lore.kernel.org/xen-devel/20250426072819.39455-1-dmukhi=
n@ford.com/
Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/1=
814196127

Denis Mukhin (2):
  x86/vmx: replace __vmread() with vmread()
  x86/vmx: remove __vmread()

 docs/misra/function-macro-properties.json |   9 --
 xen/arch/x86/cpu/vpmu_intel.c             |   2 +-
 xen/arch/x86/hvm/vmx/intr.c               |  12 +-
 xen/arch/x86/hvm/vmx/realmode.c           |   2 +-
 xen/arch/x86/hvm/vmx/vmcs.c               |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c                | 170 +++++++++++-----------
 xen/arch/x86/hvm/vmx/vvmx.c               |  36 ++---
 xen/arch/x86/include/asm/hvm/vmx/vmx.h    |   5 -
 8 files changed, 115 insertions(+), 129 deletions(-)

--=20
2.34.1



