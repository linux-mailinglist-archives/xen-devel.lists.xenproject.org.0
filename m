Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3F891774
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 12:11:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699356.1092168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8t-00074D-GP; Fri, 29 Mar 2024 11:11:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699356.1092168; Fri, 29 Mar 2024 11:11:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rqA8t-0006xT-Av; Fri, 29 Mar 2024 11:11:27 +0000
Received: by outflank-mailman (input) for mailman id 699356;
 Fri, 29 Mar 2024 11:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tVj/=LD=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rqA8r-0006qu-VC
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 11:11:25 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13deb0a4-edbd-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 12:11:23 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id E5CF58007C;
 Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id B5BBA202A6; Fri, 29 Mar 2024 11:11:22 +0000 (GMT)
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
X-Inumbo-ID: 13deb0a4-edbd-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711710682;
	bh=2sf3ZtOm0BxdBFc+SmNlslY2YAMo3EUI11FbwuJ5YCc=;
	h=From:To:Cc:Subject:Date:From;
	b=anY31tqlcHgrtCNxXdOGZDcJva5OXvCe/8YggAe8lXZTqpz7Lj2KLpMGpVtBMCMBr
	 Zm4OY4tbnW+3/76H1o0PwbmDUwXLq9+dneJH8P4iteN4Z6MoOtSgkZQche/CPBpBgI
	 Sjts+Y+7QDP5zZvfd9M3unI7n0c+jUTSnEwx9lCQ=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v2 0/6] xenwatchdogd bugfixes and enhancements
Date: Fri, 29 Mar 2024 11:10:50 +0000
Message-Id: <20240329111056.6118-1-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

The primary intention of this patch series is to replace the 
pathologically bad behaviour of rebooting the domain if you run 
"xenwatchdogd -h". To that end, I have implemented comprehensive 
argument validation. This validation ensures you can't pass 
arguments that instantly reboot the domain or cause it to spin 
loop running sleep(0) repeatedly.

I added a couple of enhancements whilst working on the changes as 
they were easy enough.  In particular, being able to run in the
foreground, disarming the watchdog on exit, help and a manpage.

Changes since v1:
- Add Signed-off-by on every patch.
- Make global variables static.

Full list of changes:
- Use getopt_long() to add -h/--help with associated usage help.
- Add -F/--foreground parameter to run without daemonizing.
- Add -x/--save-exit parameter to disarm the watchdog when exiting.
- Validate timeout is numeric and is at least two seconds.
- Validate sleep is numeric and is at least one and less than timeout.
- Check for too many arguments.
- Use symbol constants instead of magic numbers where possible.
- Make all functions except main() and global variables static.
- Add a manual page for xenwatchdogd().

Leigh Brown (6):
  tools/misc: xenwatchdogd: use EXIT_* constants
  tools/misc: rework xenwatchdogd signal handling
  tools/misc: xenwatchdogd: add static qualifier
  tools/misc: xenwatchdogd: add parse_secs()
  tools/misc: xenwatchdogd enhancements
  docs/man: Add xenwatchdog manual page

 docs/man/xenwatchdogd.8.pod |  54 +++++++++++
 tools/misc/xenwatchdogd.c   | 182 ++++++++++++++++++++++++++++--------
 2 files changed, 196 insertions(+), 40 deletions(-)
 create mode 100644 docs/man/xenwatchdogd.8.pod

-- 
2.39.2


