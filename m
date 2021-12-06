Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01762469CA3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239233.414648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFnQ-0004Fz-R0; Mon, 06 Dec 2021 15:20:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239233.414648; Mon, 06 Dec 2021 15:20:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muFnQ-0004EA-Ng; Mon, 06 Dec 2021 15:20:52 +0000
Received: by outflank-mailman (input) for mailman id 239233;
 Mon, 06 Dec 2021 15:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWHB=QX=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1muFnO-0004E4-OM
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:20:50 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 178cdb64-56a8-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 16:20:49 +0100 (CET)
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
X-Inumbo-ID: 178cdb64-56a8-11ec-8a4d-196798b21f7b
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638804048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eBUTJfSYTohYJrigB87qpawZTrkhnOrjrQMyd+1Fhwk=;
	b=eZhwLxSP0xjHaMsmjzLmKUFhWGkGcU+lY49u+slmdMBVa+B0yQeSb0014cmr+9hLtaYxW0
	LITXrzJUUAolVmD0pv6AunfmcFoB6/h5I9tYVNgMUzYyFFUDI3AVfMF9n53HXYCS58ovlj
	HBeuhzlOx/59V1aUzWeEGcArXrZyHafIH1BEASzggpKSMKI6GyHZnHVid8Tnd9aidotcaZ
	nUiTVJByJwlV6FPuPPkjkD0yBQr1siMsmnEobJHOCt9o70Amkq43iDz7+v8bmdu51IlxCL
	ATYKYRa9JqOJXMUwMwbDyxtmzJw0ZVVn+K2ayBGtNZ51tEvg6tsNwmaZO5PMhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638804048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eBUTJfSYTohYJrigB87qpawZTrkhnOrjrQMyd+1Fhwk=;
	b=puPYMI4UmCOWYPLU0RULgaRZC/m0aDW6qv/I9YVdjynxikd2Cgh4EdqYAy0l1xOJHZ0zmi
	Obr7NxW+CZS4qpCw==
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Longpeng  <longpeng2@huawei.com>,
	Gonglei <arei.gonglei@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/2 v2] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be brought up again.
Date: Mon,  6 Dec 2021 16:20:32 +0100
Message-Id: <20211206152034.2150770-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is a repost of the previous patch (#2) and adding Boris
(Ostrovsky)'s suggestion regarding the XEN bits.
The previous post can be found at
   https://lore.kernel.org/all/20211122154714.xaoxok3fpk5bgznz@linutronix.d=
e/

Sebastian



