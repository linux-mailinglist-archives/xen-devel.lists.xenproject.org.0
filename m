Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FBC375569
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123583.233122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeiN-0004CJ-3i; Thu, 06 May 2021 14:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123583.233122; Thu, 06 May 2021 14:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeiM-00048n-Vc; Thu, 06 May 2021 14:10:54 +0000
Received: by outflank-mailman (input) for mailman id 123583;
 Thu, 06 May 2021 14:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeYh-0003iB-OU
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:55 +0000
Received: from mail-qv1-xf32.google.com (unknown [2607:f8b0:4864:20::f32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3021232-c65c-49fc-ae5a-973073c5306d;
 Thu, 06 May 2021 14:00:09 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id u1so3042441qvg.11
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:09 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.07.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 07:00:07 -0700 (PDT)
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
X-Inumbo-ID: c3021232-c65c-49fc-ae5a-973073c5306d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=INJlvdLEiMRlxDVXoqvU7bWzaHIWnzxg1XcmDrQV7tE=;
        b=hzDTz2nGVFQefH2LMpgFDEFvOb/lGoQmVVe3Meg2/PusuSTC0hqWI2vO7FnpbedbVa
         VMqXxtJAdCD9yvOW8NBc4fY/pQrae9CWlfVudRO6TdwQKm0UQvcvAIueXYZ6I3zUIknf
         dFonW8qa3bo/iXTtt7etwOBahlooJw+SEZ2Q9MuowQulRfgIgqBFdZDSEDMvY0LP7Pzo
         rKr1U5U9X/q2glIKloDNJwFB5X1gMKPOqVWi126Dv3ULLodTeWVn9MMqPvPR/8CMV/sY
         CsXSBmPDxtEMvoKD8iEGoW2JiOaAHyFKt7sZkdT/AuVc08KxtQv32TmJOv5vnoAFnmA6
         7+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=INJlvdLEiMRlxDVXoqvU7bWzaHIWnzxg1XcmDrQV7tE=;
        b=NAnIojiTEZnVAcF+oZhaGiu2uDSubddlZ5R5DV5KcBNO/PHhsPGqOhIexIuHzqLPZR
         Y8RDhhxE1jCnEt/oaGJfw1d7TGRglegL1BA9Tzp447h8SHKoD9Ky/A8JEfd0uKRE8LEV
         NgJyvs0Y1UVQe/PpQU2kViXyYSth2LWUdpgrKHHqoOmO4qYN6WYH9KPmgADAwzx37ed1
         oByagZV6HdBskpaT9z0nhU5AVbJQZVDs2jDRL5J6JHxbINZNkLb5aGuUd8PDTXZzl/q7
         35Dwp+IYDSe6m+xVS0HBnu/Sa1EPBmjUfcmICPnCPY8X/ncvGE93xjz80U6CEVFzDqxo
         ISxg==
X-Gm-Message-State: AOAM5305N1E///mqXpDYle95QaTTb8VeLBRYuAk6RkSiKWyWkcCFrd9i
	ayHxt/+p/ZxB8RhnbsUsvGfkTONoRcI=
X-Google-Smtp-Source: ABdhPJxTqMFHefgYQlpQl9V3rpHD48J1Hf1gvVoQC47X7dXoL2/OtjrZzrC0QRpN22L5c1VOFkd7Kw==
X-Received: by 2002:a0c:f0c4:: with SMTP id d4mr4347832qvl.54.1620309608256;
        Thu, 06 May 2021 07:00:08 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 13/13] vtpm: Correct timeout units and command duration
Date: Thu,  6 May 2021 09:59:23 -0400
Message-Id: <20210506135923.161427-14-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two patches:
vtpm-microsecond-duration.patch fixes the units for timeouts and command
durations.
vtpm-command-duration.patch increases the timeout linux uses to allow
commands to succeed.

Linux works around low timeouts, but not low durations.  The second
patch allows commands to complete that often timeout with the lower
command durations.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/Makefile                        |  2 +
 stubdom/vtpm-command-duration.patch     | 52 +++++++++++++++++++++++++
 stubdom/vtpm-microsecond-duration.patch | 52 +++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 stubdom/vtpm-command-duration.patch
 create mode 100644 stubdom/vtpm-microsecond-duration.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index c6de5f68ae..06aa69d8bc 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -239,6 +239,8 @@ tpm_emulator-$(XEN_TARGET_ARCH): tpm_emulator-$(TPMEMU_VERSION).tar.gz
 	patch -d $@ -p1 < vtpm-implicit-fallthrough.patch
 	patch -d $@ -p1 < vtpm_TPM_ChangeAuthAsymFinish.patch
 	patch -d $@ -p1 < vtpm_extern.patch
+	patch -d $@ -p1 < vtpm-microsecond-duration.patch
+	patch -d $@ -p1 < vtpm-command-duration.patch
 	mkdir $@/build
 	cd $@/build; CC=${CC} $(CMAKE) .. -DCMAKE_C_FLAGS:STRING="-std=c99 -DTPM_NO_EXTERN $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -Wno-declaration-after-statement"
 	touch $@
diff --git a/stubdom/vtpm-command-duration.patch b/stubdom/vtpm-command-duration.patch
new file mode 100644
index 0000000000..6fdf2fc9be
--- /dev/null
+++ b/stubdom/vtpm-command-duration.patch
@@ -0,0 +1,52 @@
+From e7c976b5864e7d2649292d90ea60d5aea091a990 Mon Sep 17 00:00:00 2001
+From: Jason Andryuk <jandryuk@gmail.com>
+Date: Sun, 14 Mar 2021 12:46:34 -0400
+Subject: [PATCH 2/2] Increase command durations
+
+Wth Linux 5.4 xen-tpmfront and a Xen vtpm-stubdom, xen-tpmfront was
+failing commands with -ETIME:
+tpm tpm0: tpm_try_transmit: send(): error-62
+
+The vtpm was returning the data, but it was after the duration timeout
+in vtpm_send.  Linux may have started being more stringent about timing?
+
+The vtpm-stubdom has a little delay since it writes its disk before
+returning the response.
+
+Anyway, the durations are rather low.  When they were 1/10/1000 before
+converting to microseconds, Linux showed all three durations rounded to
+10000.  Update them with values from a physical TPM1.2.  These were
+taken from a WEC which was software downgraded from a TPM2 to a TPM1.2.
+They might be excessive, but I'd rather have a command succeed than
+return -ETIME.
+
+An IFX physical TPM1.2 uses:
+1000000
+1500000
+150000000
+
+Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
+---
+ tpm/tpm_data.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tpm/tpm_data.c b/tpm/tpm_data.c
+index bebaf10..844afca 100644
+--- a/tpm/tpm_data.c
++++ b/tpm/tpm_data.c
+@@ -71,9 +71,9 @@ static void init_timeouts(void)
+   tpmData.permanent.data.tis_timeouts[1] = 2000000;
+   tpmData.permanent.data.tis_timeouts[2] = 750000;
+   tpmData.permanent.data.tis_timeouts[3] = 750000;
+-  tpmData.permanent.data.cmd_durations[0] = 1000;
+-  tpmData.permanent.data.cmd_durations[1] = 10000;
+-  tpmData.permanent.data.cmd_durations[2] = 1000000;
++  tpmData.permanent.data.cmd_durations[0] = 3000000;
++  tpmData.permanent.data.cmd_durations[1] = 3000000;
++  tpmData.permanent.data.cmd_durations[2] = 600000000;
+ }
+ 
+ void tpm_init_data(void)
+-- 
+2.30.2
+
diff --git a/stubdom/vtpm-microsecond-duration.patch b/stubdom/vtpm-microsecond-duration.patch
new file mode 100644
index 0000000000..7a906e72c5
--- /dev/null
+++ b/stubdom/vtpm-microsecond-duration.patch
@@ -0,0 +1,52 @@
+From 5a510e0afd7c288e3f0fb3523ec749ba1366ad61 Mon Sep 17 00:00:00 2001
+From: Jason Andryuk <jandryuk@gmail.com>
+Date: Sun, 14 Mar 2021 12:42:10 -0400
+Subject: [PATCH 1/2] Use microseconds for timeouts and durations
+
+The timeout and duration fields should be in microseconds according to
+the spec.
+
+TPM_CAP_PROP_TIS_TIMEOUT:
+A 4 element array of UINT32 values each denoting the timeout value in
+microseconds for the following in this order:
+
+TPM_CAP_PROP_DURATION:
+A 3 element array of UINT32 values each denoting the duration value in
+microseconds of the duration of the three classes of commands:
+
+Linux will scale the timeouts up by 1000, but not the durations.  Change
+the units for both sets as appropriate.
+
+Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
+---
+ tpm/tpm_data.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/tpm/tpm_data.c b/tpm/tpm_data.c
+index a3a79ef..bebaf10 100644
+--- a/tpm/tpm_data.c
++++ b/tpm/tpm_data.c
+@@ -67,13 +67,13 @@ static void init_nv_storage(void)
+ static void init_timeouts(void)
+ {
+   /* for the timeouts we use the PC platform defaults */
+-  tpmData.permanent.data.tis_timeouts[0] = 750;
+-  tpmData.permanent.data.tis_timeouts[1] = 2000;
+-  tpmData.permanent.data.tis_timeouts[2] = 750;
+-  tpmData.permanent.data.tis_timeouts[3] = 750;
+-  tpmData.permanent.data.cmd_durations[0] = 1;
+-  tpmData.permanent.data.cmd_durations[1] = 10;
+-  tpmData.permanent.data.cmd_durations[2] = 1000;
++  tpmData.permanent.data.tis_timeouts[0] = 750000;
++  tpmData.permanent.data.tis_timeouts[1] = 2000000;
++  tpmData.permanent.data.tis_timeouts[2] = 750000;
++  tpmData.permanent.data.tis_timeouts[3] = 750000;
++  tpmData.permanent.data.cmd_durations[0] = 1000;
++  tpmData.permanent.data.cmd_durations[1] = 10000;
++  tpmData.permanent.data.cmd_durations[2] = 1000000;
+ }
+ 
+ void tpm_init_data(void)
+-- 
+2.30.2
+
-- 
2.30.2


