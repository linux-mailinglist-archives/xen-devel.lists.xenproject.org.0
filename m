Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8FB9F82F9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 19:15:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861415.1273362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL2b-0006YN-B0; Thu, 19 Dec 2024 18:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861415.1273362; Thu, 19 Dec 2024 18:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOL2b-0006Va-85; Thu, 19 Dec 2024 18:14:29 +0000
Received: by outflank-mailman (input) for mailman id 861415;
 Thu, 19 Dec 2024 18:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQ2H=TM=eurecom.fr=Ariel.Otilibili-Anieli@srs-se1.protection.inumbo.net>)
 id 1tOL2Z-0006VU-KF
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 18:14:27 +0000
Received: from smtp.eurecom.fr (smtp.eurecom.fr [193.55.113.210])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1475bb77-be35-11ef-a0d8-8be0dac302b0;
 Thu, 19 Dec 2024 19:14:26 +0100 (CET)
Received: from waha.eurecom.fr (HELO smtps.eurecom.fr) ([10.3.2.236])
 by drago1i.eurecom.fr with ESMTP; 19 Dec 2024 19:14:25 +0100
Received: from localhost.localdomain (88-183-119-157.subs.proxad.net
 [88.183.119.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtps.eurecom.fr (Postfix) with ESMTPSA id E2874234F;
 Thu, 19 Dec 2024 19:14:24 +0100 (CET)
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
X-Inumbo-ID: 1475bb77-be35-11ef-a0d8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=eurecom.fr; i=@eurecom.fr; q=dns/txt; s=default;
  t=1734632066; x=1766168066;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KH1lcKt8lRD2c9fpVmHrC09cC9OfF/qsIitMWvfTsi0=;
  b=sCHDjezyR9jZRN5NN+fuBIQMMjObuM1+HAk45RKzKEy8DN577vdRFRpE
   1U8H3/5fnj+qd9lm08A24jCwl/AQlX3kAvp2bElpMDlpgz/MQcsV1Ebng
   qjpChGAlas4G4tq1W5AxmHW1xMVm7EpA8XSeh6yNbVdfhVUEtGDVBwpt2
   c=;
X-CSE-ConnectionGUID: lkP41m0DRXSJ6NF2HI7NUA==
X-CSE-MsgGUID: FT5m/XyeR3+iRJKrSI067g==
X-IronPort-AV: E=Sophos;i="6.12,248,1728943200"; 
   d="scan'208";a="28259975"
From: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
To: xen-devel@lists.xenproject.org
Cc: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/1] xen/scripts: Fix regex syntax warnings with Python 3.12
Date: Thu, 19 Dec 2024 19:10:42 +0100
Message-ID: <20241219181352.709315-1-Ariel.Otilibili-Anieli@eurecom.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch clears out this warning:

```
$ xen/scripts/xen-analysis.py
xen/scripts/xen_analysis/cppcheck_analysis.py:94: SyntaxWarning: invalid escape sequence '\*'
  comment_line_starts = re.match('^[ \t]*/\*.*$', line)
```

It is the same fix than commit 826a9eb072 (tools: Fix regex syntax warnings with
Python 3.12).

Thank you,

Ariel Otilibili (1):
  xen/scripts: Fix regex syntax warnings with Python 3.12

 xen/scripts/xen_analysis/cppcheck_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.47.1


