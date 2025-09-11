Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B0B53F00
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 01:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120995.1465573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSk-00073O-Qq; Thu, 11 Sep 2025 23:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120995.1465573; Thu, 11 Sep 2025 23:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSk-00070s-NU; Thu, 11 Sep 2025 23:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1120995;
 Thu, 11 Sep 2025 23:12:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwqSj-00070m-SI
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 23:12:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c499fed6-8f64-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 01:12:20 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45ed646b656so6195575e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 16:12:20 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e03729c76sm40014715e9.6.2025.09.11.16.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 16:12:19 -0700 (PDT)
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
X-Inumbo-ID: c499fed6-8f64-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757632340; x=1758237140; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Msz/P4Iipik3z5leLuYvmWF+Vhjs/lcwil6do7QRps=;
        b=QYdzt56W18R/lmpkTGyJoR++jwpeesDE41EAlQ816Ryj+RijDCOf0JqJa/1TM4CwQe
         4BD5uF46wT+1Gi34F5Z5y5RexAUXTvhce2HSVyJmpxPlEfENY1OSlgMCtk+kmZ+yd4WQ
         3wMFKFrVkRNiYeUodyB7aRGgTKu8UPikP+DR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757632340; x=1758237140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Msz/P4Iipik3z5leLuYvmWF+Vhjs/lcwil6do7QRps=;
        b=Vo5a3CBLQLKv4+3P4fYSyIA2nzLrg1S7Q7pHMVii6Z8WhbaIqc3auD16c1fEtBr7zx
         85gl3A7d0cD4CMZ0env0hKe3O8NSaz6jkEzsRC8OFoWeOcdHbKRjm75WWVCr+0hG5hyK
         GqAxo+9gBarS0GmJFjlIe/S6NKVEa3uprj3Ak4HAA13LTJl7109LdpMq9XLhN6fWDRDY
         ijNs7spXg/gp3Ii2k5JLomDeye/kTN+e/w9AmmQNjYeWsFfZ+nr3B061Gj1rBvL/+ZbD
         4O4R8xtjLy2CwnWi+ZT93bGLZ7lvgODDVaekubGVRbGSp6vstsqvYSFD62ywb5dOqNlH
         Be8A==
X-Gm-Message-State: AOJu0YzcWD/wX/1y2sx9RfiEIMa0zlp3kYC5P5RR+i+F+Mh0BGI2tUuL
	mNFSbE067lmpeU1wJ8NwpN1pondV5uzfKWrHUxvieBQKWx29Gr+AjP06f+78Vi9FRPLH2su5tpa
	BKZYj
X-Gm-Gg: ASbGncu7wotykUjYSdpQco0oK4nrFUquPRm3CEFAB8c0beUK0Xb1QIWkJl66uUACPsI
	0VhRDXZOvUUwQnJ9IXvJY6ycyr0kX9pnpMAp1fMHL+zZrZbE6waohaw0Y4Pfd1u1fCwj6QSZwH8
	ud1bHrOBjg5D5UBUSd/UbKf3aKwdQQ8X4CZaD0GCgVO2hFC3BqxeWgeIA1xwAUmI0Q6UrKt/s61
	AdqBc078cdxSLPZ/ssE9QuoNvcEpGIAQFhAp3DhtX1WrqoNtoCRGiGy1WWzorD6P0uV+KhsRAXm
	RbN/XdRECTfXNpdoItSQxQhMS8vMh6est3104v5Oq7MP87YcgiTrrIBHoB0svavAk8sgriG+gdA
	huS7pgL/7K7Bmt69mIHLgPxzFskjOhQwxRmoV4w1rfMZeSdl2PsLYdDtuTqyrCUhiwmmcffII5z
	Jm
X-Google-Smtp-Source: AGHT+IGC+bIc1T74WN63SoD7WCNF2JD3BT8W3tc2jyJjdyvVCyZH7heUYQXCve0lh1eDfrBNbtkUFA==
X-Received: by 2002:a05:600c:630e:b0:45d:da25:595d with SMTP id 5b1f17b1804b1-45f211f8835mr8748935e9.22.1757632339941;
        Thu, 11 Sep 2025 16:12:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v3 0/5] CI: Add Debian Trixie
Date: Fri, 12 Sep 2025 00:12:11 +0100
Message-Id: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refreshed the Trixie series.  See patches for details.

These containers are already built and deployed for people to test with.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2035442869

Andrew Cooper (5):
  CI: Use the Debian Trixie container for RISC-V test jobs
  CI: Update ppc64 to use Debian Trixie
  CI: Merge categories in debian/12-x86_64.dockerfile
  CI: Update x86 to use Debian Trixie
  CHANGELOG: Notes about distro changes in CI

 CHANGELOG.md                                  |  3 +
 automation/build/debian/12-x86_64.dockerfile  | 12 ++--
 ...c64le.dockerfile => 13-ppc64le.dockerfile} |  2 +-
 ...x86_32.dockerfile => 13-x86_32.dockerfile} |  2 +-
 ...x86_64.dockerfile => 13-x86_64.dockerfile} | 14 ++--
 automation/gitlab-ci/build.yaml               | 72 +++++++++++++++----
 automation/gitlab-ci/test.yaml                | 18 ++---
 automation/scripts/containerize               |  4 +-
 8 files changed, 84 insertions(+), 43 deletions(-)
 copy automation/build/debian/{12-ppc64le.dockerfile => 13-ppc64le.dockerfile} (93%)
 copy automation/build/debian/{12-x86_32.dockerfile => 13-x86_32.dockerfile} (95%)
 copy automation/build/debian/{12-x86_64.dockerfile => 13-x86_64.dockerfile} (89%)

-- 
2.39.5


