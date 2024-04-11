Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0808A1DE2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704123.1100317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2P-0005Sk-0s; Thu, 11 Apr 2024 18:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704123.1100317; Thu, 11 Apr 2024 18:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2O-0005Lr-PO; Thu, 11 Apr 2024 18:20:40 +0000
Received: by outflank-mailman (input) for mailman id 704123;
 Thu, 11 Apr 2024 18:20:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAdS=LQ=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1ruz2N-0004xS-TJ
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:20:39 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31d25aa9-f830-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 20:20:37 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 32CC6800AC;
 Thu, 11 Apr 2024 19:20:37 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 0CE7B2017C; Thu, 11 Apr 2024 19:20:37 +0100 (BST)
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
X-Inumbo-ID: 31d25aa9-f830-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1712859637;
	bh=YwGv2PhPp4Evj73ZY3lHmUchew8hvcOMY1tjrOsWuo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jyK+6dO6x07zzohtd7D+p7nxPLtdOzqIerpifvQGmAwcDx40I3xLG/VGQD9reAVH+
	 zoKDfCFwo/Ddp+WuY1g5MOYRqcP5rxC9a6HeLv+9V53Bqc0zpNzFYWu3hLyO95jkRM
	 FBeYwGmSn49U4U3w9RWJhI5MT0pRty+vq0aBtZy0=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 4/4] docs/man: Add xenwatchdog manual page
Date: Thu, 11 Apr 2024 19:20:23 +0100
Message-Id: <20240411182023.56309-5-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411182023.56309-1-leigh@solinno.co.uk>
References: <20240411182023.56309-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Add a manual page for xenwatchdogd.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 docs/man/xenwatchdogd.8.pod | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 docs/man/xenwatchdogd.8.pod

diff --git a/docs/man/xenwatchdogd.8.pod b/docs/man/xenwatchdogd.8.pod
new file mode 100644
index 0000000000..b03ed53ee6
--- /dev/null
+++ b/docs/man/xenwatchdogd.8.pod
@@ -0,0 +1,55 @@
+=head1 NAME
+
+xenwatchdogd - Xen hypercall based watchdog daemon
+
+=head1 SYNOPSIS
+
+B<xenwatchdogd> [ I<OPTIONS> ] <I<TIMEOUT>> [ <I<SLEEP>> ]
+
+=head1 DESCRIPTION
+
+B<xenwatchdogd> arms the Xen watchdog timer to I<TIMEOUT> every I<SLEEP>
+seconds. If the xenwatchdogd process dies or is delayed for more than
+I<TIMEOUT> seconds, then Xen will take the B<on_watchdog> action
+specified in the domain configuration (see xl.cfg(5)). If B<xenwatchdogd>
+is running in dom0, the whole system will reboot.
+
+=head1 OPTIONS
+
+=over 4
+
+=item B<-h>, B<--help>
+
+Display a help message.
+
+=item B<-F>, B<--foreground>
+
+Run in the foreground. The default behaviour is to daemonize.
+
+=item B<-x>, B<--safe-exit>
+
+Disable watchdog on orderly exit. The default behaviour is to arm the
+watchdog to 300 seconds to allow time for the domain to shutdown.  See 
+also the B<SIGNALS> section.
+
+=item B<timeout>
+
+The number of seconds to arm the Xen watchdog timer. This must be set to
+a minimum of two.
+
+=item B<sleep>
+
+The number of seconds to sleep in between calls to arm the Xen watchdog
+timer. This must be at least one second, and less than the I<timeout>
+value. If not specified, it defaults to half the I<timeout> value.
+
+=back
+
+=head1 SIGNALS
+
+B<SIGUSR1> Will cause the program to disarm the watchdog timer and exit,
+regardless of whether the B<--safe-exit> option was passed.
+
+=head1 AUTHOR
+
+Citrix Ltd and other contributors.
-- 
2.39.2


