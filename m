Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4289176F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 12:11:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699359.1092199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8v-0007mJ-FB; Fri, 29 Mar 2024 11:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699359.1092199; Fri, 29 Mar 2024 11:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8v-0007fq-8n; Fri, 29 Mar 2024 11:11:29 +0000
Received: by outflank-mailman (input) for mailman id 699359;
 Fri, 29 Mar 2024 11:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVj/=LD=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rqA8t-0006qu-Kd
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 11:11:27 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14bca0d2-edbd-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 12:11:24 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 2415A800AD;
 Fri, 29 Mar 2024 11:11:23 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id C21C2202AC; Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
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
X-Inumbo-ID: 14bca0d2-edbd-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711710683;
	bh=vvCdYJp3hmq98C5XpPhX29JIJPhg6FKX4zHYexemcSA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Na54nphOlyvcT6fmlR+2XS4n7fZOIZY6aNNyhFg131DLIZ3EO1CvFh9WxdPDl4/wS
	 4KnLfdc2ZsMcYc2U1qJyccrHyi/DEZYaDDdMaWrUgl4Ir71LV19mv4BOn/XDv0sA7m
	 5D8QfiW3LT0iNPduaQMyQgnTTnrw/QmK7xKKMS58=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v2 6/6] docs/man: Add xenwatchdog manual page
Date: Fri, 29 Mar 2024 11:10:56 +0000
Message-Id: <20240329111056.6118-7-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240329111056.6118-1-leigh@solinno.co.uk>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Add a manual page for xenwatchdogd.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
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


