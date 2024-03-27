Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A21D88EDFC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 19:15:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698693.1090734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnT-0005kw-IH; Wed, 27 Mar 2024 18:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698693.1090734; Wed, 27 Mar 2024 18:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnT-0005Wt-AF; Wed, 27 Mar 2024 18:14:47 +0000
Received: by outflank-mailman (input) for mailman id 698693;
 Wed, 27 Mar 2024 18:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSYu=LB=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rpXmy-0004q7-BT
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 18:14:16 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0a6128d-ec65-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 19:14:13 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id D3E75800AD;
 Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 8D260202AB; Wed, 27 Mar 2024 18:14:11 +0000 (GMT)
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
X-Inumbo-ID: d0a6128d-ec65-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711563251;
	bh=/l5XcylGh8QpFXW26aAq5ArxFrGUV6w08D0TT0l/waM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQVXgIPNx1yNAVVZ0+hBNkgAh6nKA1yuxNbnj77qJTP6kpI2gEdvtD2Hc2/KrMCSn
	 xW7Hl6ZnZ6H+/x8fps40L1Q0di+SsyJHwYdLpoGCrDQ3RfBS3YFXejIcKv2+aJk24h
	 NBiH9vxDf8xfMpvccQ54vLaCavCtdiI8Eu90pp00=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH 6/6] docs/man: Add xenwatchdog manual page
Date: Wed, 27 Mar 2024 18:13:53 +0000
Message-Id: <20240327181353.10951-7-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240327181353.10951-1-leigh@solinno.co.uk>
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
 <20240327181353.10951-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Add a manual page for xenwatchdogd.
---
 docs/man/xenwatchdogd.8.pod | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 docs/man/xenwatchdogd.8.pod

diff --git a/docs/man/xenwatchdogd.8.pod b/docs/man/xenwatchdogd.8.pod
new file mode 100644
index 0000000000..2f6454f183
--- /dev/null
+++ b/docs/man/xenwatchdogd.8.pod
@@ -0,0 +1,54 @@
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
+I<TIMEOUT> seconds, then Xen will reboot the domain. If the domain being
+rebooted is domain 0, the whole system will reboot.
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
+regardless of whether the safe exit option was passed.
+
+=head1 AUTHOR
+
+Citrix Ltd and other contributors.
-- 
2.39.2


