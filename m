Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UzKyJ+9NKGqfBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78374662F9B
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 19:31:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=JpCsr+om;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1333724.1596886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0I8-0003em-5x; Tue, 09 Jun 2026 17:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333724.1596886; Tue, 09 Jun 2026 17:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX0I8-0003cd-3K; Tue, 09 Jun 2026 17:31:08 +0000
Received: by outflank-mailman (input) for mailman id 1333724;
 Tue, 09 Jun 2026 17:31:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wX0I6-0003cX-T5
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 17:31:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX0I6-000VFH-2r
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:31:06 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284dc4-e002-0a2a0a5209dd-0a2a4505d884-24
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:06 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a284dd9-aaa8-0a2a45050019-d155802dc190-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 19:31:05 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490b2b037d2so51294395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:31:05 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm113509696f8f.27.2026.06.09.10.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:31:04 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781026265; x=1781631065; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/V8Oj+z9badLK0MAxAfwjiv5BFEHOLvaoYDxB7qvSk=;
        b=JpCsr+omOIfMrRelBwVpCJ4kFmi9BjPYJ+c0Sf9ICxjaIjkQs1uJMgPN03AmYiw6l8
         dtOeZIX2oQUjBGAQrqUmSkg3gg0IQTlF5aTeIBVGU8IuEan1+ze1lmark2bmGJjSloZv
         87EUChlH40YvRLKC3E6MgI6m/wIx9SRrJ6fSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026265; x=1781631065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/V8Oj+z9badLK0MAxAfwjiv5BFEHOLvaoYDxB7qvSk=;
        b=dBNCAMZGupslJt/TSgllslIRYw26fxgYipZPW+jkMXMjvFAdWc2LR03Wx3gG5zclJn
         kVRc9ag9XjN2BbUwPn/kHkPQdJfPK2h18t5YCG3ktK4OkstL6WRbuXg915szLP7czVHL
         beDt+JL4KaVhOYrRtAgTpajDU0Gi94YnH008bOmS8Iz23n5JZq2wGkCoQ2ckkZ+wfdkN
         ERKky6zTlOSuWcilyUYeKry+yzKutjADoHb/IOJm1hClX0UaDrXDQ4yndbrIpTdu21sI
         GLyQtGGZ1q7arUKvr0K+mK1BTwwwrkCVFYQuUm6pGkMI5vaNbaZAJkiAV9bZtyrGV+uS
         ETYg==
X-Gm-Message-State: AOJu0YyYmKPKic0jh8jtTdH8vINFiRFZF+UygsT7DU7IZ3L4MmsWx2Cx
	f/ZOdFNquQUFsYlQlOgBEimCNsdG2u9j3ufbR+6wvY+SV2TOkkw9epemUbVIZOf4WQVe8ixm/6U
	gW+qu
X-Gm-Gg: Acq92OFDhYCil8Q27JORlQoM7XKmsf8U8tfvlMs4IEGjJIn34JE+cZlKfdqZCKDiSAw
	CudBKRCClaQZOlEF42l8FwcblAwcZS4GtuOgrBiuB5n53thZtJHtM2Ubh70kQSmMJECB/DUT6Nx
	Xe/SrdHjd2LGgh0SJcGMGPvZwWDc6NomJiaViCyf4aWQDQ8sOzHVc4VS86NZ5nbzdGdt+/xrhuZ
	DfQ/MTbB4EI9YVKODb7S7bDJUlHO67UxwTa0nNwGYsEUBP9DUO91FVNkWKmWo3O/EA3wTY7j/aq
	1glOa5KVpoXyEzxYfQKs/P8H7FfZmNh0xkohzm2uWydODvlFZmTAwSFERG0Jpv4YTUdVjSxhNwL
	vZt8p+Leo79kKU0RmJQXByTQjC85YGBHJ2JeyGLseRN3jQh3Ne1n/ncURbP/qVcevPKUdhp9A0c
	c3v7fGsjjIOXbF161gsB/zx0JecUH3uTefrN10NlL4/beOtJ3Eq24HnlClFVgGMil8RZRryWEKy
	4Ul2vAPlUS++oQ=
X-Received: by 2002:a05:600c:8b6a:b0:490:bb19:b110 with SMTP id 5b1f17b1804b1-490c26216ddmr326440775e9.27.1781026265368;
        Tue, 09 Jun 2026 10:31:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.22 0/4] CI: Disentangle hardware runner containers
Date: Tue,  9 Jun 2026 18:30:58 +0100
Message-Id: <20260609173102.2908514-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781026266-E3788443-534F815F/0/0
X-purgate-type: clean
X-purgate-size: 1289
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78374662F9B

... and fix archlinux as I happened to get around to it.

There's a query on patch 3 which affects how we proceed.

Andrew Cooper (4):
  CI: Fixes to containerize
  CI: Rename xenial-xilinx to xilinx-hw-runner
  CI: Introduce new qubes-hw-runner.dockerfile
  CI: Rework the archlinux container

 .../build/alpine/qubes-hw-runner.dockerfile   | 21 ++++++++
 .../build/archlinux/current-x86_64.dockerfile | 33 ++++++++++++
 automation/build/archlinux/current.dockerfile | 53 -------------------
 .../build/ubuntu/xenial-xilinx.dockerfile     | 27 ----------
 .../build/ubuntu/xilinx-hw-runner.dockerfile  | 32 +++++++++++
 automation/gitlab-ci/build.yaml               |  8 +--
 automation/gitlab-ci/containers.yaml          |  4 +-
 automation/gitlab-ci/test.yaml                |  6 +--
 automation/scripts/containerize               |  9 ++--
 9 files changed, 99 insertions(+), 94 deletions(-)
 create mode 100644 automation/build/alpine/qubes-hw-runner.dockerfile
 create mode 100644 automation/build/archlinux/current-x86_64.dockerfile
 delete mode 100644 automation/build/archlinux/current.dockerfile
 delete mode 100644 automation/build/ubuntu/xenial-xilinx.dockerfile
 create mode 100644 automation/build/ubuntu/xilinx-hw-runner.dockerfile

-- 
2.39.5


