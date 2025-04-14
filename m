Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4ADA87E79
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949710.1346184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgc-0000Oy-9T; Mon, 14 Apr 2025 11:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949710.1346184; Mon, 14 Apr 2025 11:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgc-0000Mk-50; Mon, 14 Apr 2025 11:09:10 +0000
Received: by outflank-mailman (input) for mailman id 949710;
 Mon, 14 Apr 2025 11:09:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Hga-0000MT-Di
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:09:08 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1741442-1920-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:09:06 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-399737f4fa4so2335637f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:09:06 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm176820405e9.7.2025.04.14.04.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:09:05 -0700 (PDT)
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
X-Inumbo-ID: e1741442-1920-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744628945; x=1745233745; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVzvFZahYgkqmI6DD9MT4SQpAMzg6jUROOrj9BaBwVQ=;
        b=Od1mvcfAo2t74qZwnK6O7SZC7B3CmwbSZqZizmkXV6wyk30ozdvmt5nyi9CPGO/D9N
         7OI+4OSP9ZdL1iX00PYAADqki4LtH4MTN1XwrkQBSKcN+9DWTcE3HzAUaU7j/haQUb2/
         5syN5Nr9ooQCCoyFZD0dLcIygcakzc09jFtaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628945; x=1745233745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVzvFZahYgkqmI6DD9MT4SQpAMzg6jUROOrj9BaBwVQ=;
        b=YYZfhUs+L3tFY0bhA64N1iVeXDKS0RM7jQv4MtYGbqOkyLNYY0pNIGdbxj1G9RjenP
         5r3M1mBAkQXd6E2JV7OdGMFk/bbvTyVcyESOQxpL8vzZUeeRx9CEMfHwoim3vGglhVtk
         GeFLpRooKC89wSISg2k6xRGnTLlcmvt3fHt5QfOyb3B5V1TiIyU58nGTH95zN7O7ziQd
         3d+MhaVHblAzUQXjC/1YwqBNTFMm2E9I5Z5KaYyqsNvbjUD1z99bqpW2mLWvKkrqJJYO
         dIRhv3N/796GJBaqvVad5Uk3VoKfeAwjtQoiOJsVJcgoZ77KxJUl+AN7AEfgQHx0upBU
         7NYg==
X-Gm-Message-State: AOJu0YxsOmdKWgiZpeInuTyuEmH/NZp9zacoRwe2l15fy5gheYC9jb0l
	pvds5Y15gsRhkkZ0uidf1HFNdPPRjoSfAg7KBan8eygiQ8qLuVW/C3A/GSJYHINv+lBESTdwzXm
	KYSA=
X-Gm-Gg: ASbGncuuAR7GWvxNeqKMjrNl1cyGvPbMK5RNyImhEMwf0Xwx8eHnuEUep/xg8R5FhXz
	nnZY8m2H4jQSQw6f4cBtf8xfbQR9rApRhjc2ja043h43y4f6xGqQf9mP5rybRkoWXeH/g2k3oj0
	mMg6NGELcyHyXAshYl5GVeyUCBZxKU53s8PoNntJMojLr/TPwmX4WCPkLzUiWDuafJLnOsA6uGM
	md220U8LyLw/yhRp/Tb05Z9rVLkKoWFIDuonulVieBLdX1EUYflYZ2NZuNIIUOAx+xYYbh4hhrX
	bU2xycFu1XA9ZkSEvP0Anv4tylYRbr913ziZBaSwQb5gaJQ08jVHbP20Jmsi5pVSDLfzBQtWyAW
	MXcG3UpdX3tPlc7LJmy0995a/
X-Google-Smtp-Source: AGHT+IH+P1+WtZlssKw0YXi4VggRwBNXTrJE+mFHWTRpo1zioAWf0qe6oTSBWzrjfPk9iQvtYZdDNg==
X-Received: by 2002:a05:6000:40e1:b0:39c:1257:cd40 with SMTP id ffacd0b85a97d-39eaaedd92dmr9262002f8f.58.1744628945435;
        Mon, 14 Apr 2025 04:09:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 0/6] CI: switch to CPIO archives
Date: Mon, 14 Apr 2025 12:08:57 +0100
Message-Id: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is an amalgamation of Marek's work and mine, tested at each stage on all
hardware runners.  See patches for details.

Andrew Cooper (3):
  CI: Rename intermediate artefacts in qemu-* scripts
  CI: Switch to new argo artefact
  CI: Include microcode for x86 hardware jobs

Marek Marczykowski-Górecki (3):
  CI: avoid repacking initrd as part of the test job
  CI: remove now unused alpine-3.18-arm64-rootfs job and its container
  CI: save toolstack artifact as cpio.gz

 automation/gitlab-ci/build.yaml               | 12 +---
 automation/gitlab-ci/test.yaml                | 16 +++--
 automation/scripts/build                      |  2 +-
 automation/scripts/qemu-alpine-x86_64.sh      | 32 ++++-----
 automation/scripts/qemu-smoke-dom0-arm64.sh   | 30 ++++-----
 .../scripts/qemu-smoke-dom0less-arm64.sh      | 17 ++---
 automation/scripts/qubes-x86-64.sh            | 37 +++++------
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 50 +++++++-------
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 33 ++++------
 .../alpine/3.18-arm64v8.dockerfile            | 66 -------------------
 10 files changed, 101 insertions(+), 194 deletions(-)
 delete mode 100644 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile


base-commit: f401eae6ec446671ad79deac84421d56808d43f2
-- 
2.39.5


