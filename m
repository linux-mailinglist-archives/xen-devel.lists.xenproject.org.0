Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7327888EDFB
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 19:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698684.1090693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnR-0004vt-Fx; Wed, 27 Mar 2024 18:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698684.1090693; Wed, 27 Mar 2024 18:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpXnR-0004tp-A5; Wed, 27 Mar 2024 18:14:45 +0000
Received: by outflank-mailman (input) for mailman id 698684;
 Wed, 27 Mar 2024 18:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lSYu=LB=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1rpXmt-0004pv-H7
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 18:14:12 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce06e62a-ec65-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 19:14:09 +0100 (CET)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 4504980063;
 Wed, 27 Mar 2024 18:14:08 +0000 (GMT)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 288FF202A6; Wed, 27 Mar 2024 18:14:08 +0000 (GMT)
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
X-Inumbo-ID: ce06e62a-ec65-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1711563248;
	bh=4fghE0zaGdPSmd+dQTZotqH0mN2NPxM+aDrfDLB5zDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bgVSiAo7QrXvqMD+HNnROJwQRG1lRZk+KaF42UTEvHgilEkaLOyEAW/HuB05hrVT/
	 mtdm0KB8HDc7CMLZzd+aIDXt1TyL033D+xp43OjC4OW2znac2B8bqg1aOR30fzlOc4
	 LkusIQ21M1TIkcaJMHZ9mLtzMEM9/W8eoXqVM5pU=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH 0/6] xenwatchdogd enhancements
Date: Wed, 27 Mar 2024 18:13:47 +0000
Message-Id: <20240327181353.10951-1-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
References: <55416d60-cae7-4e79-8bde-bc07ee9e3830@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Following up on Cyril's email. I had been independently looking at this,
mainly because xenwatchdogd is simple enough for me to understand. The
primary intention of this patch series is to replace the pathologically
bad behaviour of rebooting the domain if you run "xenwatchdogd -h". To
that end, I have implemented comprehensive argument validation. This
validation ensures you can't pass arguments that instantly reboot the
domain or cause it to spin loop running sleep(0) repeatedly. I added a
couple of enhancements whilst working on the changes as they were easy
enough.

Full list of changes:
- Use getopt_long() to add -h/--help with associated usage help.
- Add -F/--foreground parameter to run without daemonizing.
- Add -x/--save-exit parameter to disarm the watchdog when exiting.
- Validate timeout is numeric and is at least two seconds.
- Validate sleep is numeric and is at least one and less than timeout.
- Check for too many arguments.
- Use symbol constants instead of magic numbers where possible.
- Add a manual page for xenwatchdogd().

I am not an expert in git or sending patches so forgive me if things
don't look quite right.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Leigh Brown (6):
  tools/misc: xenwatchdogd: use EXIT_* constants
  tools/misc: rework xenwatchdogd signal handling
  tools/misc: xenwatchdogd: make functions static
  tools/misc: xenwatchdogd: add parse_secs()
  tools/misc: xenwatchdogd enhancements
  docs/man: Add xenwatchdog manual page

 docs/man/xenwatchdogd.8.pod |  54 +++++++++++
 tools/misc/xenwatchdogd.c   | 180 ++++++++++++++++++++++++++++--------
 2 files changed, 195 insertions(+), 39 deletions(-)
 create mode 100644 docs/man/xenwatchdogd.8.pod

-- 
2.39.2


