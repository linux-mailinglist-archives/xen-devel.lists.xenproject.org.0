Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D442B14185
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 19:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061809.1427391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4t-0002dz-MQ; Mon, 28 Jul 2025 17:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061809.1427391; Mon, 28 Jul 2025 17:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4t-0002bn-JC; Mon, 28 Jul 2025 17:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1061809;
 Mon, 28 Jul 2025 17:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugS4r-0002bc-Sa
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 17:55:57 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c89bc4e-6bdc-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 19:55:56 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so1185462f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 10:55:56 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705bcb96sm169306385e9.21.2025.07.28.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 10:55:55 -0700 (PDT)
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
X-Inumbo-ID: 1c89bc4e-6bdc-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753725356; x=1754330156; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=67/qEWjQufU5KgRZYeEsZL/UIgHDmoY6gXurd4PjnVc=;
        b=Q1vjPTEkOjcpy9yI/U3zJb3eZRrj0h8gG84hbdbWRAECO7vAOS295lHMSGdPnADi4K
         Ibg2rO6Dqa4b+Jy7x5GRXPDfUNy3xwlxySoFcF/50VhnLltSoZbfNCAQ42EcJBPOOLZa
         pY718kZeSS8awMn8yzcF2VhTzFTcNJ48r6VRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725356; x=1754330156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67/qEWjQufU5KgRZYeEsZL/UIgHDmoY6gXurd4PjnVc=;
        b=hJRBrRR8qmi+gBVPTii+lDkcGGv3g+9C6mrenWBdccN7LpQSUDo5FIhXICK9Scm/Ck
         y5EejoNpWuM9BjO4FQjNdsDIpWGBy5KFvtM5k3afcotkv3QwUww8yeOD91Y/tnhbdWiT
         I8iTCwpcZzXtX+mRPsAQE2Jgy3tjuLN5zZ78JEJZo8q8hyMC+lNLHbo0op5cxJYA0lv3
         Z2xhyhM2AiUFsINF+jHmqikf0CUIS+JQV3C8OctWoPDDGM8ESxrieOVpIi53DLS+hQuB
         NQgrXbABWZ2fxiQ6x4Zy/sxcLFFYPjUBVt+PiPSGG7AmBGSr3Ly66SM2hK2wrikdgIe4
         6t0g==
X-Gm-Message-State: AOJu0YxujRaYvuswCJHVWxQRQtzSg471FlP/fO0v5zLzDIARMIWGHsqj
	k/NTY3Dmgt/8PwGjlU0q14VN+9u6IfqZ27QWcSTuc85KE8a/beM2wO7pXdRaQvJjN0A8T2ncb+8
	cZxgw3Tw=
X-Gm-Gg: ASbGnctqhwmhXB+g9Qnf5B0xP3rWiZNqxC/HhhYBN/5DYGTRfgJrwEmipBsxxK8bQys
	FD1ItRbIPtviv2Gs2KxlnzWPGqZJ5dat/caemSkqo0KlZv1jefQKHG4+KkBFEHTRyn5dqZ+QMYT
	Y0mz0bImCJTMW1I3H+alTUUy0oxwc+0q9akkBA/JxHY6iejp64PEPDGXPxLYa5tVgiQJCtvzrA/
	KXTxamz9/Ea+IWrK5q5sf4SMU1W8n9SPTtCF7NK22xtcO+CvLBoQLzyVO7Ob7eTdyd93dg6rqU6
	hW4xkbE46NWOObUPwZRtvOjGmI6zxuoIwwUsRhCYj6ZqP7CIbN34dJyNYpoUdxbHmWAYcQ4R9ak
	cYZMhkbPdWs7kQqh1N7zayUHYmTztYXmnRoqYg/xxJnGcMAom57h38m7SCV9PZmSRyel+MYJWNi
	rf
X-Google-Smtp-Source: AGHT+IHxK4zD7L5I5q7BjeeVhq2n0KXpuro0DJT8yw1J9Xzxq7nAw10kU6iGi7chRO4R+R1WPM9ZiQ==
X-Received: by 2002:a05:6000:2382:b0:3b7:8d80:e382 with SMTP id ffacd0b85a97d-3b78d80ea5bmr639389f8f.4.1753725355679;
        Mon, 28 Jul 2025 10:55:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 0/3] tools/flask: Whitespace changes
Date: Mon, 28 Jul 2025 18:55:45 +0100
Message-Id: <20250728175548.3199177-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 3 intends to make it easier to maintain local changes to the flask
policy in a patchqueue.  The prior patches are trivial cleanup.

No functional change.  Only whitespace changes.

Andrew Cooper (3):
  tools/flask: Strip trailing whitespace
  tools/flask: Use tabs uniformly
  tools/flask: Reformat allow declarations

 tools/flask/policy/modules/dom0.te            | 122 +++++++--
 tools/flask/policy/modules/modules.conf       |   2 +-
 tools/flask/policy/modules/vm_role.cons       |   4 +-
 tools/flask/policy/modules/xen.if             | 253 ++++++++++++++----
 tools/flask/policy/modules/xen.te             |  25 +-
 tools/flask/policy/modules/xenstore.te        |   6 +-
 tools/flask/policy/policy/mls                 |   2 +-
 .../policy/policy/support/misc_macros.spt     |   2 +-
 8 files changed, 338 insertions(+), 78 deletions(-)


base-commit: a845b50c12f3ec3a14255f5eb3062d0c9801a356
-- 
2.39.5


