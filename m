Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162BCB14181
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 19:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061810.1427397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4t-0002ir-U3; Mon, 28 Jul 2025 17:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061810.1427397; Mon, 28 Jul 2025 17:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugS4t-0002ds-RD; Mon, 28 Jul 2025 17:55:59 +0000
Received: by outflank-mailman (input) for mailman id 1061810;
 Mon, 28 Jul 2025 17:55:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugS4s-0002bc-G5
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 17:55:58 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d35e40e-6bdc-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 19:55:57 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45622a1829eso16387655e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 10:55:57 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458705bcb96sm169306385e9.21.2025.07.28.10.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 10:55:56 -0700 (PDT)
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
X-Inumbo-ID: 1d35e40e-6bdc-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753725357; x=1754330157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2QsoSixqiO30KRHgdek0SA+oshRTfHy/b6VwZ47sdo=;
        b=Risp7LhPu1doPnlEPUZt6mgvvUHOL2fOskzm9+am9QfD0cqeEHWyxqt8fdo/LPvDQk
         4yLS0ReemlIV1MqKjLzwxCDcKcdeUc7MUQ0gnH3cpsb53aEuiNclSBRY/gyqRSU7pGb0
         Mx8oesl712Mn5h9JXmaRRM6vff+dQoIh1E9kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753725357; x=1754330157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2QsoSixqiO30KRHgdek0SA+oshRTfHy/b6VwZ47sdo=;
        b=j6w9eLE0Qbm6YgtyvJDrObQIh/yEtM2IFEB6ug8zCa1zREZZr0mbv9B/2sRZE0ms4M
         3dDGT9SfJ4rvg8wXUBDtouuKtSNC+O6FESar6AM9IFQOqSwAmQuPvqQXrmB3fG5DHV0J
         ZtvLtXo6jcNdoeil3h3vmK9veCmlA8+EFgNvoM2szLYe0tTgVaDuGmFpPK2ivHSKPpMX
         0h+KaDR6MLIw/nlfDItCFKeU3Ta9eeZ8fmEW2Cv9akZk7hWL/QSY4ur0L8QDyUYPD2Gr
         DIR9vXz+efULfEAx1kuzhvithuONtEHpdiGdSxG7kIL2NR+crsYVA9qQscz03yv7anHv
         tTXQ==
X-Gm-Message-State: AOJu0Ywu3OTjHNSUcdzCyDwet45QFqqv6E79NloHKUsoQAeYh1QYXEsA
	buh+DASkwYr6kyygh88C2GGUc959DspIGxiM3egnktNPyt7gwlALmdHIOKoaA3WiKjJSscOKYA2
	ICZkllLI=
X-Gm-Gg: ASbGncuVit4v2Lr3SJEJwJOfaaQivbzxkB4QxvTr15PPuf3oUEry+BTMgzSIdkPsu+c
	o/BxfGSwXYLM6YZORBP8YYdCErBJ9U2nww3hvbQFiVzfW2g7OruT6MbiajZ1aU2jKrmnmP4hur7
	ePO82KyvFGdLIFCAqatAjIbvKh7FR7PMHKR6ucFCLLUjSp1KhqNwldEF+csjVBf/CP8eIMrBthu
	3wmj/2St03H6910Iy5sU+gJI9a9qkfC0xS2jFY+33wzAbCexlfzmwOYdig5vY5BSr9zivaRECOV
	5UB/2F2jsOX4EbiZWt31LBhKPXOr77zpgbGMjDgiae7kyr2BhdDhALOlpA6q7uJUoMJWHVr48z6
	oAC87IBkW5M89uC2dYdMQjjIBthlHf5csZVShaAtyVUUzDCdGTxcL3lD6Dx8ZoYHoT2kBboPwOk
	kO
X-Google-Smtp-Source: AGHT+IEq3HGDiABSD+VVmxvZ3BmacOFX1nlQyBy44/x7VzSCQwa1+G7asYmctvD2ZUuDR9DHPHOq2w==
X-Received: by 2002:a05:600c:1e2a:b0:43d:b3:fb1 with SMTP id 5b1f17b1804b1-45876556336mr103542415e9.27.1753725356722;
        Mon, 28 Jul 2025 10:55:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 1/3] tools/flask: Strip trailing whitespace
Date: Mon, 28 Jul 2025 18:55:46 +0100
Message-Id: <20250728175548.3199177-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250728175548.3199177-1-andrew.cooper3@citrix.com>
References: <20250728175548.3199177-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 tools/flask/policy/modules/modules.conf           | 2 +-
 tools/flask/policy/modules/vm_role.cons           | 4 ++--
 tools/flask/policy/policy/mls                     | 2 +-
 tools/flask/policy/policy/support/misc_macros.spt | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/flask/policy/modules/modules.conf b/tools/flask/policy/modules/modules.conf
index 6dba0a3d9172..1b6975551ab4 100644
--- a/tools/flask/policy/modules/modules.conf
+++ b/tools/flask/policy/modules/modules.conf
@@ -42,7 +42,7 @@ xenstore = on
 all_system_role = on
 
 # Example users, roles, and constraints for user-based separation.
-# 
+#
 # The three users defined here can set up grant/event channel communication
 # (vchan, device frontend/backend) between their own VMs, but cannot set up a
 # channel to a VM under a different user.
diff --git a/tools/flask/policy/modules/vm_role.cons b/tools/flask/policy/modules/vm_role.cons
index 3847ec1afa4e..ac38217f4641 100644
--- a/tools/flask/policy/modules/vm_role.cons
+++ b/tools/flask/policy/modules/vm_role.cons
@@ -3,7 +3,7 @@
 #
 # constrain class_set perm_set expression ;
 #
-# expression : ( expression ) 
+# expression : ( expression )
 #	     | not expression
 #	     | expression and expression
 #	     | expression or expression
@@ -17,7 +17,7 @@
 #	     | t1 op names
 #	     | t2 op names
 #
-# op : == | != 
+# op : == | !=
 # role_op : == | != | eq | dom | domby | incomp
 #
 # names : name | { name_list }
diff --git a/tools/flask/policy/policy/mls b/tools/flask/policy/policy/mls
index 9290a76ae9bc..c4b74c10cda7 100644
--- a/tools/flask/policy/policy/mls
+++ b/tools/flask/policy/policy/mls
@@ -1,6 +1,6 @@
 ifdef(`enable_mls',`
 #
-# Define sensitivities 
+# Define sensitivities
 #
 # Domination of sensitivities is in increasin
 # numerical order, with s0 being the lowest
diff --git a/tools/flask/policy/policy/support/misc_macros.spt b/tools/flask/policy/policy/support/misc_macros.spt
index 3116db92fbed..4c3be036c6e9 100644
--- a/tools/flask/policy/policy/support/misc_macros.spt
+++ b/tools/flask/policy/policy/support/misc_macros.spt
@@ -21,7 +21,7 @@ define(`ifndef',`ifdef(`$1',`$3',`$2')')
 #
 # __endline__
 #
-# dummy macro to insert a newline.  used for 
+# dummy macro to insert a newline.  used for
 # errprint, so the close parentheses can be
 # indented correctly.
 #
-- 
2.39.5


