Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1163FFC46
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 10:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177911.323679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4tL-0006q9-LH; Fri, 03 Sep 2021 08:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177911.323679; Fri, 03 Sep 2021 08:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mM4tL-0006nN-HJ; Fri, 03 Sep 2021 08:49:43 +0000
Received: by outflank-mailman (input) for mailman id 177911;
 Fri, 03 Sep 2021 08:49:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FOYs=NZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mM4tK-0006nA-39
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 08:49:42 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5dadf295-4f13-42fd-b413-aa9abfb9d364;
 Fri, 03 Sep 2021 08:49:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0FD5122663;
 Fri,  3 Sep 2021 08:49:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 6EBBF1374A;
 Fri,  3 Sep 2021 08:49:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id YQ4TGaPhMWFjdAAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 03 Sep 2021 08:49:39 +0000
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
X-Inumbo-ID: 5dadf295-4f13-42fd-b413-aa9abfb9d364
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630658980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Etfp5KRM0ihxlz1Fzg+3n+yV+gWrXCILk5YBRRiJ4ec=;
	b=g/xCu4uUEeLNVhfh4hdAtjtyZDkPPqU9rW19W5JYaL63cE3RPFwRsK8D5oSo5RKnUyhZef
	oRJKvg5r8mEK1qPZy47OOCWYT8N3Ja1dGzT5F+tieQLSPZ2csfGh8mApFEuhAiWEv2KpMv
	5oLIfL7iry/5ho/b6+Y9oBZRKXdYVLY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	stable@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/2] xen: fix illegal rtc device usage of pv guests
Date: Fri,  3 Sep 2021 10:49:35 +0200
Message-Id: <20210903084937.19392-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change in mc146818_get_time() resulted in WARN splats when
booting a Xen PV guest.

The main reason is that there is a code path resulting in accessing a
RTC device which is not present, which has been made obvious by a
call of WARN() in this case.

This small series is fixing this issue by:

- avoiding the RTC device access from drivers/base/power/trace.c in
  cast there is no legacy RTC device available
- resetting the availability flag of a legacy RTC device for Xen PV
  guests

Juergen Gross (2):
  PM: base: power: don't try to use non-existing RTC for storing data
  xen: reset legacy rtc flag for PV domU

 arch/x86/xen/enlighten_pv.c |  7 +++++++
 drivers/base/power/trace.c  | 10 ++++++++++
 2 files changed, 17 insertions(+)

-- 
2.26.2


