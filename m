Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7F8A1DE3
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704119.1100283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2J-0004lc-Nc; Thu, 11 Apr 2024 18:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704119.1100283; Thu, 11 Apr 2024 18:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2J-0004iU-L6; Thu, 11 Apr 2024 18:20:35 +0000
Received: by outflank-mailman (input) for mailman id 704119;
 Thu, 11 Apr 2024 18:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAdS=LQ=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1ruz2H-0004iO-VU
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:20:33 +0000
Received: from doppler.solinno.uk
 (8.1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.9.a.d.0.6.f.d.1.0.b.8.0.1.0.0.2.ip6.arpa
 [2001:8b0:1df6:da9::18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e8a632c-f830-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 20:20:32 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 7225580069;
 Thu, 11 Apr 2024 19:20:31 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 49FFE2017C; Thu, 11 Apr 2024 19:20:31 +0100 (BST)
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
X-Inumbo-ID: 2e8a632c-f830-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1712859631;
	bh=572pjbUD7n4h0CJX74r8RUlCwEtYRTt6uBNki5qw238=;
	h=From:To:Cc:Subject:Date:From;
	b=meCnVkSTvFuwu14T6O2ny5wWCJnLuUFtTpoIg35EVkQ6f2FtA5qCcI+jVwrU32WZn
	 iIBI1c2QIYktm8Rv1Nsb/wg7UYmouOEd2qSsuQXQlIf1urZ7vVIx2d5uK7zQLuLWK1
	 d1vrv6HBTrz7rencHRsdC1ZMnBZu6+XSBbKo540A=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 0/4] xenwatchdogd bugfixes and enhancements
Date: Thu, 11 Apr 2024 19:20:19 +0100
Message-Id: <20240411182023.56309-1-leigh@solinno.co.uk>
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


Changes since v2:
- Drop patches 1-3 from v2, as they have been applied.
- Tweak check for NULL character.
- Fix initial implementation of parse_secs() not to use optind.
- Updated copyright notice.
- Better patch message for enhancements patch.
- Addressed feedback on manpage.

Changes since v1:
- Add Signed-off-by on every patch.
- Make global variables static.

Leigh Brown (4):
  tools/misc: xenwatchdogd: add parse_secs()
  tools/misc: xenwatchdogd enhancements
  tools/misc: Add xenwatchdogd.c copyright notice
  docs/man: Add xenwatchdog manual page

 docs/man/xenwatchdogd.8.pod |  55 ++++++++++++++++
 tools/misc/xenwatchdogd.c   | 121 +++++++++++++++++++++++++++++++-----
 2 files changed, 161 insertions(+), 15 deletions(-)
 create mode 100644 docs/man/xenwatchdogd.8.pod

-- 
2.39.2


