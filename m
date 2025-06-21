Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC03AE2985
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 16:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021599.1397521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSzNZ-0005ho-I5; Sat, 21 Jun 2025 14:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021599.1397521; Sat, 21 Jun 2025 14:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSzNZ-0005fa-FQ; Sat, 21 Jun 2025 14:39:37 +0000
Received: by outflank-mailman (input) for mailman id 1021599;
 Sat, 21 Jun 2025 14:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AuTB=ZE=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1uSzNX-0005fU-F4
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 14:39:36 +0000
Received: from gw4.antarean.org (gw4.antarean.org [136.144.238.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8bdbaa62-4ead-11f0-b894-0df219b8e170;
 Sat, 21 Jun 2025 16:39:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by gw4.antarean.org (Postfix) with ESMTP id 4bPcS46gdZzNnCS
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jun 2025 16:39:32 +0200 (CEST)
Received: from gw4.antarean.org ([127.0.0.1])
 by localhost (gw4.antarean.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8aScyt8RL1V for <xen-devel@lists.xenproject.org>;
 Sat, 21 Jun 2025 16:39:32 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw4.antarean.org (Postfix) with ESMTP id 4bPcS43vp0zNkdZ
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jun 2025 16:39:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4bPcS434Txz1G
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jun 2025 14:39:32 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavis, port 10024)
 with ESMTP id qOKc3lwMqd28 for <xen-devel@lists.xenproject.org>;
 Sat, 21 Jun 2025 14:39:32 +0000 (UTC)
Received: from persephone.localnet (persephone.adm.antarean.org [10.55.16.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPS id 4bPcS40BHsz17
 for <xen-devel@lists.xenproject.org>; Sat, 21 Jun 2025 14:39:32 +0000 (UTC)
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
X-Inumbo-ID: 8bdbaa62-4ead-11f0-b894-0df219b8e170
X-Virus-Scanned: amavis at antarean.org
X-Virus-Scanned: amavis at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1750516772;
	bh=BOfW3GpKIf/U0nZqm9q2J+6mX9tIalYI/xyewp3VoBo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ND/Rz1zsZghHiks8kNzIxo3S8GVGCZVt6HkAX1gcXIAhvUHYvoA4NhDhj38LKhkqn
	 srg4bgoDxTdlBUy74MRwGwv2Q5xZfZcXTPGh3sxhLTDFQ/aPWi4RrkszUKixs/uChw
	 FKL8/e5PTPlw4IYcO9JyQ4CiBiQj2hvSLHidLTBY=
From: "J. Roeleveld" <joost@antarean.org>
To: xen-devel@lists.xenproject.org
Subject:
 xen_pciback: error enabling MSI-X / MSI for guest -- WAS: Re: Kernel panic
 when passing through 2 identical PCI devices
Date: Sat, 21 Jun 2025 16:39:31 +0200
Message-ID: <4683544.LvFx2qVVIh@persephone>
In-Reply-To: <2226691.irdbgypaU6@persephone>
References: <2226691.irdbgypaU6@persephone>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi all,

I managed to get past the kernel panic (sort of) by doing the following:

1) Ensure system is fully OFF before booting. A reset/reboot will cause these 
errors.

2) Fix the BIOS config to ensure the PCI-ports are split correctly. If anyone 
has a Supermicro board and gets errors about PCI-slots not getting full speed 
let me know.

Not entirely convinced the 2nd was part of the cause, but that's ok.

I now, however, get a new error message in the Domain0 dmesg:
pciback <pci-address>: xen_map irq failed -28 for <domid> domain
pciback <pci-address>: error enabling MSI-X for guest <domid>: err -28!

For the NVMe devices, I get these twice, with the 2nd time complaining about 
MSI (without the -X)

I feel there is something missing in my kernel-config and/or domain config.
If anyone can point me at what needs to be enabled/disabled or suggestions on 
what I can try?

Many many thanks in advance,

Joost






