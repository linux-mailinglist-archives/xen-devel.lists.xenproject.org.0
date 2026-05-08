Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLc6N7hV/mmepQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C24FBEAC
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304250.1577334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSky-0004tT-Si; Fri, 08 May 2026 21:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304250.1577334; Fri, 08 May 2026 21:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSky-0004oJ-Os; Fri, 08 May 2026 21:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1304250;
 Fri, 08 May 2026 21:29:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wLSkx-0004lA-G4
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:29:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSkw-000E8K-Ke
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:29:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe5568-5cb7-0a2a0a5109dd-0a2a4504d398-24
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:10 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe55a6-1dec-0a2a45040019-d155dd34d4e1-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:10 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso1423792f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:29:10 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca383asm7548608f8f.28.2026.05.08.14.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 14:29:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778275749; x=1778880549; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7PhNq5m+H+OFW/x+gihCJ9/fpAKXYUtHMB+rax9vss=;
        b=FM0OR8FR30opGqMsRAySRLXdL3J383mB8ntp6Aq16juqWua3Lt52+pLRJg75yBiAul
         4Hhf6CTbFe90wc58cYfOXgx5Q+bzLg6rffRyDQy3Cd4Zyo+jmmCJJKeW4SttSscND9Zu
         Bn8swhWr5O63dOp3+e9qcrHd7PnAIAlDc6BzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275749; x=1778880549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7PhNq5m+H+OFW/x+gihCJ9/fpAKXYUtHMB+rax9vss=;
        b=gysg0PU+R75rQ48/Z/xaNYeVxO2VoQr/yKjmXoZioI80kWli0Vb9DMVA/m8RN5gP/L
         PScY8DTmydyz3d9OhIEK1RLWJeONvUEFcF/7iqz1iHJSOBVynRbEEBa/oNacjrvy3sDM
         HbaKyLQehgjaYeFIzVmYTl7leITxuIAHwl9+N8yILJGMqCxZCvhRcpq0TCDnmpZ7ocj3
         +ds8EMKCeqXatC8fploznl2RsJmjKkezW4EVH7Ih34pfJqBujI520uT9J89f4aH2pyRc
         PlZTfKcbf4hnGj69m10KQw+LiSzMGa7AncfK9PHNUrk8Pu/6HSo4iJDwjgHDdjFodh11
         kKxQ==
X-Gm-Message-State: AOJu0YzGc19Od86FQtEGPVIoi41bbj3CnihhmXFw9EZp+mFcLAtsdM8E
	yRwEQfwAMnb3HnmyEhuR8RjX5Os1iKln0zSyoGysLFpntdjeajapKGcV19N4KGA0GTzBcQzPZSF
	vFb2pQIk=
X-Gm-Gg: Acq92OGz7ww1jEURp4rQ9h92/k5ZeNSX6hAkWwnYNvfNnkfmoe4kGXe6CMBlDxA+6b4
	awR1ZM0ddK5HP59Q0rFph5bMJ9XTnNXSSUU3FZKwGiUja4rIgVzG2X7tfTb4lNTvc6A9jpEVLDk
	rfgz6vUQFhZAuaaNnq4HrHWt7qDs1QbSUATp2sSWbQboWeRewsFhCu/61ALHJub9jD6ayU5IZGI
	dgIIz9lw/N4js1iRJMsc3Af/wcvBv+s/sLx9D1JCoNA/qMBLx/f9BHKKjrsOLcdCsM4Lqk0vFpA
	NRg7opeAQWUzh4LVM8/ZLqSW5npp8N68EBrpIcbEN3cgYce+psO94bknihUXdLghxJAsbyxkd3O
	4mgyw+R4OyH09SZvnxdz6Wo32NH6f4EZIzWB5kdKJYBRFVFPOcRUJB4aVwvISWh3qyVS+mgRB4M
	12SVOBML0/xFtyDX8+YnAIJ9DrZhJ5jatBaF1n3oNTazH5TyfwYxgJrx7qUhdc/n64WWKd6E86P
	fp5
X-Received: by 2002:a05:6000:24ca:b0:449:a07a:967f with SMTP id ffacd0b85a97d-4515cf127cemr23232077f8f.28.1778275748693;
        Fri, 08 May 2026 14:29:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/5] CI: Refresh ARM Debian testing
Date: Fri,  8 May 2026 22:29:02 +0100
Message-Id: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1778275750-40B733FF-922BD691/0/0
X-purgate-type: clean
X-purgate-size: 2017
X-Rspamd-Queue-Id: D53C24FBEAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Long overdue.  Clean up the ARM Debian containers, conforming to the new style
and naming schemes, and purge the final *-export jobs.

I have already deployed the containers as they're new names and don't collide.
I have also checked that the series produces a green pipeline on every commit.

Andrew Cooper (3):
  CI: Adjust test needs[] to ensure binaries/ is non-root
  CI: Add a Debian 13 (Trixie) arm64 container
  CI: Switch qemu-arm* jobs to using the distro provided QEMU

Javi Merino (2):
  CI: Refresh the Debian 12 arm32 cross compile container
  CI: Refresh the Debian 12 arm64 container

 .../build/debian/12-arm64v8-arm32.dockerfile  | 32 ++++++++
 automation/build/debian/12-arm64v8.dockerfile | 69 +++++++++++++++++
 automation/build/debian/13-arm64v8.dockerfile | 71 +++++++++++++++++
 .../bookworm-arm64v8-arm32-gcc.dockerfile     | 24 ------
 .../build/debian/bookworm-arm64v8.dockerfile  | 55 -------------
 automation/gitlab-ci/build.yaml               | 65 ++++------------
 automation/gitlab-ci/test.yaml                | 30 ++++----
 automation/scripts/containerize               |  5 +-
 automation/scripts/include/xtf-arm64          |  7 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh   |  6 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh   |  6 +-
 .../scripts/qemu-smoke-dom0less-arm32.sh      |  6 +-
 .../scripts/qemu-smoke-dom0less-arm64.sh      |  6 +-
 .../6.0.0-arm64v8.dockerfile                  | 77 -------------------
 14 files changed, 218 insertions(+), 241 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8-arm32.dockerfile
 create mode 100644 automation/build/debian/12-arm64v8.dockerfile
 create mode 100644 automation/build/debian/13-arm64v8.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8.dockerfile
 delete mode 100644 automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile

-- 
2.39.5


