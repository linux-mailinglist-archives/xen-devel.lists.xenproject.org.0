Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4684AEBBE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 09:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268817.462765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHhvn-0001xy-6b; Wed, 09 Feb 2022 08:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268817.462765; Wed, 09 Feb 2022 08:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHhvn-0001vy-3F; Wed, 09 Feb 2022 08:02:27 +0000
Received: by outflank-mailman (input) for mailman id 268817;
 Wed, 09 Feb 2022 08:02:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zPP=SY=linutronix.de=bigeasy@srs-se1.protection.inumbo.net>)
 id 1nHhvm-0001r0-2E
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 08:02:26 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c115e87-897e-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 09:02:24 +0100 (CET)
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
X-Inumbo-ID: 9c115e87-897e-11ec-8eb8-a37418f5ba1a
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644393741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wif2+D8xIFS05ms3vC/tlw/Lp5Jixy0HFVXUKnCOTkc=;
	b=BKSpVDboAbB04c8UKWU3/3FN6+QZwIsMMrXG2MHWEUl44AznK97B3GxtTJQhyLriSbJRES
	OmjG3Pc2XlVgBO0uI/IcBSzYAvZVVOHbyxTWFemF76KKfebfzZfBP93GnSYhbYnFkMj0b9
	Cs7VaOsl9K4VXnpNPvMK3GzHw8v1AW0B4S0pvJumHINH4LV1XsOwPJZq2uM0hd1/WijN8R
	hqiPkTWlB+/DvR+WpOUs6H4NdHSog0phWMhXNKH00NsPQncCAleMEUgSS+TZFlJ2RYiX/o
	1ejwsFGwV2Qh1lbu/ebUTUVy8lyi/c8kKQ/o0PQKL+kQ67eNRBXJraMTr7vPxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644393741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wif2+D8xIFS05ms3vC/tlw/Lp5Jixy0HFVXUKnCOTkc=;
	b=3/KmyOIUIb9YbWeQ0TVKV5GTKlK6SuWXvl1XUdcTswqUY/80O9zfP7saKRH7wenDcSoKpU
	UdIbq3lrpAY/YQAA==
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Longpeng <longpeng2@huawei.com>,
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
Subject: [PATCH REPOST v2 0/2 v2] cpu/hotplug: Allow the CPU in CPU_UP_PREPARE state to be brought up again.
Date: Wed,  9 Feb 2022 09:02:12 +0100
Message-Id: <20220209080214.1439408-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is a another repost of the previous patch (#2) and adding Boris
(Ostrovsky)'s suggestion regarding the XEN bits.
The previous posts can be found at
   https://lore.kernel.org/all/20211206152034.2150770-1-bigeasy@linutronix.=
de/
   https://lore.kernel.org/all/20211122154714.xaoxok3fpk5bgznz@linutronix.d=
e/

Sebastian


