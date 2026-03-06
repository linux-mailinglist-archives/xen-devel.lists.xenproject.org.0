Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PZ2I+TWqmnfXgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954F221A16
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 14:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247725.1546216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFf-0001bA-Sv; Fri, 06 Mar 2026 13:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247725.1546216; Fri, 06 Mar 2026 13:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyVFf-0001YC-Pe; Fri, 06 Mar 2026 13:29:59 +0000
Received: by outflank-mailman (input) for mailman id 1247725;
 Fri, 06 Mar 2026 13:29:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GgqK=BG=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyVFe-00011B-1X
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 13:29:58 +0000
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [2607:f8b0:4864:20::642])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90d16a4a-1960-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 14:29:57 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-2aae146b604so69864045ad.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 05:29:57 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae840ad92fsm34784815ad.77.2026.03.06.05.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 05:29:54 -0800 (PST)
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
X-Inumbo-ID: 90d16a4a-1960-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772803795; x=1773408595; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZnA155v70+QhGSyRygUUhwtWIBU38ELU4IAn875zcw=;
        b=k5DgFYaJ1lxlx0kjYbJwsKRNnq6XiaCWN7KXA/PjWxaDW3Fgq4oKbxU8HQwsyH+0Vz
         su+z+ODqMvofyM8lEYQmJDdMeN0rTz8Pir0A1BxBoFe/GulTMxESQj+PlkMRwXkyLy4P
         185Wi0jWAfJbMHJWvqUfVYJWIGowHm88QcjO+wYATJnFlHbLWy00T0+T3ojske994ZDQ
         6PuWXLWiGOfzMqF1uQYrKyHrD9HhnFncdaHRYEmn4Nne93lRsHOh5+rAGTSTm9998D1s
         PsYPX10l0V4vp53YE7NlP45aKSa9b6BWzQ9vlSCjbMIGqwTUkmXSw0gG43aKAO7r8xRh
         XtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772803795; x=1773408595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZnA155v70+QhGSyRygUUhwtWIBU38ELU4IAn875zcw=;
        b=KzHObskamz74iECKL1N5JfoSemkH4RO+r51FalH5YFmTxoQcXM+b3RTF0Z9iuGQCs7
         I0bq65ngwZxgJQ7jMawvqqRUpeAwELZBL2WVAz1tGg/s2lYV3xU00wUNEesvuYUdZgjN
         jowo/fbA0vLgOSSf88kkYDwIoLz/AYJZQrZT1yX9bR4PUB7ihdxuqFSzln5jlMNh3r1X
         Oq94bwT8bO7kS3i5l1Ty1Imbc7z5IliPjh8Rqksi6ZC/QjDC22ewaq3D/+8rC84NkRHE
         FD6xd8D5MdIX+aL4xBGjmeVfyJxI8pNQMP19pyujQ4gf2AtZG94I6v8ircUyW3GKMnSn
         cIvQ==
X-Gm-Message-State: AOJu0Ywtc9Oq7uk44CiwrfxujgWOzDtAQ+EVHkfc4nVA9EvbFkHPokar
	4sf+4PIO8O4DoEoZrtdgscPXliSbqJ5cIHLbGgVBIXWlXy6xLrjLIfIKNwGJTxU0
X-Gm-Gg: ATEYQzy5jZdfNdzeqdewJj7QjMeJsv+uxvOqWCwe9LKQHWjOKFZjO16I36D/Z6/JkLD
	r1IQw5sAY/gHNX9ZmPwbzEUcTJ5cQyFuSP9ErpwZV9sKddnBKd2SQbXVnEdyop3GFa7Q/4Gh5S+
	L9FV8P2CQtxW4v27TYrlraq4yujMyx5eNWSsR4rSW8qtcdktfytVQeeI2h861crExC+mWrm2TDm
	Q5P8RSfke2ZK+Ms27vS/X0SX2/Mwjl2P4nlc4IgJcYB4JEYnwWLJ9hGYpqUuWr5Tg6fGVNce0Jv
	bHRevP+uemgDXEerOlkv0ud++s17a7YnohrT+Sk9y2+HzDretOD3lPX4UqV0wQgayxy8N3IhI2h
	MjFYUbb0BWa6n121vt+dFG0K4Xb8RNc385viEt8E3ETNK4QicdAKFdO57a+vTZwMdAgfQztRL/O
	FKC83FPVgVH6s3bEDn4fdnFYZSh/hg3iXD35LDOu5RYhJ8BKVbV77SikgzFokWwlJ5r3CQwyiZz
	1mjndW64E3qfMhSUPAluW06+vQC5x/UCSVKJTRzusfenhqTh5SovYG8+wH5gvtdGd209C+LWA==
X-Received: by 2002:a17:902:e845:b0:2ad:c1e1:c286 with SMTP id d9443c01a7336-2ae823ac4camr23806925ad.24.1772803795206;
        Fri, 06 Mar 2026 05:29:55 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v2 3/3] x86/efi: Add opt-out mechanism for BGRT preservation
Date: Fri,  6 Mar 2026 18:59:35 +0530
Message-ID: <20260306132935.13727-4-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
References: <20260306132935.13727-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3954F221A16
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,apertussolutions.com,citrix.com,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:andrew.cooper3@citrix.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

As described in the task, BGRT preservation is now enabled by default to fix ACPI corruption
for desktop/workstation systems (similar to ESRT).

Add an opt-out parameter 'efi=no-bgrt' to allow disabling BGRT
preservation on systems where the ~1MB memory overhead is not
desired.

The parameter is parsed during normal Xen boot (not during EFI
phase), so it only affects diagnostic logging. The opt-out flag
is checked at the start of efi_preserve_bgrt_img().

Usage:
  Default: BGRT preserved automatically
  Opt-out: Add 'efi=no-bgrt' to Xen command line

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/common/efi/boot.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 1e3489e902..b735eac6b2 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -167,6 +167,7 @@ static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdErr;

 static UINT32 __initdata mdesc_ver;
 static bool __initdata map_bs;
+static bool __initdata opt_bgrt_disabled = false;

 static struct file __initdata cfg;
 static struct file __initdata kernel;
@@ -868,6 +869,9 @@ static void __init efi_preserve_bgrt_img(EFI_SYSTEM_TABLE *SystemTable)
     bgrt_debug_info.preserved = false;
     bgrt_debug_info.failure_reason = NULL;

+    if ( opt_bgrt_disabled )
+        return;
+
     bgrt = find_bgrt_table(SystemTable);
     if ( !bgrt )
     {
@@ -1873,6 +1877,10 @@ static int __init cf_check parse_efi_param(const char *s)
             else
                 __clear_bit(EFI_RS, &efi_flags);
         }
+        else if ( (ss - s) == 7 && !memcmp(s, "no-bgrt", 7) )
+        {
+            opt_bgrt_disabled = true;
+        }
         else if ( (ss - s) > 5 && !memcmp(s, "attr=", 5) )
         {
             if ( !cmdline_strcmp(s + 5, "uc") )
@@ -1968,7 +1976,11 @@ void __init efi_init_memory(void)
     if ( !efi_enabled(EFI_BOOT) )
         return;

-    if ( bgrt_debug_info.preserved )
+    if ( opt_bgrt_disabled )
+    {
+        printk(XENLOG_INFO "EFI: BGRT preservation disabled\n");
+    }
+    else if ( bgrt_debug_info.preserved )
     {
         printk(XENLOG_INFO "EFI: BGRT image preserved: %u KB\n",
                bgrt_debug_info.size / 1024);
--
2.53.0


