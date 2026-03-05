Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBcRCSfXqWl5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:19:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0362175B7
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 20:19:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247049.1545965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDR-0004gA-Em; Thu, 05 Mar 2026 19:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247049.1545965; Thu, 05 Mar 2026 19:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyEDR-0004eK-AZ; Thu, 05 Mar 2026 19:18:33 +0000
Received: by outflank-mailman (input) for mailman id 1247049;
 Thu, 05 Mar 2026 19:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBnC=BF=gmail.com=soumyajyotisarkar23@srs-se1.protection.inumbo.net>)
 id 1vyEDQ-00048o-7N
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 19:18:32 +0000
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [2607:f8b0:4864:20::642])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18753e3d-18c8-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 20:18:31 +0100 (CET)
Received: by mail-pl1-x642.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso59682495ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 11:18:31 -0800 (PST)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae4d3113e0sm142965715ad.79.2026.03.05.11.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 11:18:29 -0800 (PST)
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
X-Inumbo-ID: 18753e3d-18c8-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738310; x=1773343110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++GELJavQDbG9JYk0zJHLyDpXIOV9aBooWUi6D+W/MA=;
        b=ZywURYfyu9jtd0HY/U+AMVN1oYScCM8ieiP9SoBXhR3jUC8XZQqqrwbrZe48NQvahw
         meuprx9ZWNPE+nAD8CHiw2voqFWrs4PRd5sUIW8R+w2iuUsIF+F8+xEoQobzx+MMkkcb
         5alIDhKYqfTZoDM/NRb1J6+VxGbAD4z8meHijbS8zJoWyTvvTJglF6taF2DUb5sytTon
         5BsmMNm11Vh9sKgijWgdcvcCiSjB0F/BaxTvyjZm4sDyDnELAZhf+x4htYJSCDWyvKrI
         /zcbzpc6kBZfxu+5h7b1DKbVUWCYn1jTItSNSWXNWBdobc1+hbVAy7fvY+FStNBYrR+K
         apag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738310; x=1773343110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++GELJavQDbG9JYk0zJHLyDpXIOV9aBooWUi6D+W/MA=;
        b=hdl893RlzgGeMycWDwNGmRQPOAMYIE3T+V/WgHRhbvWZ2YOlRu4BAzwLm6DrNC1ym8
         ff6SvrZDqc7yyh5Oe5IytA+Fo0L8u2ZmTfW/jQOvnv2FPw+sLxK5HXVvNGPNpRoKsPix
         do5ab84VQms3St+dfJlIvCojaJwgX5+sT20yGOHB+6QYlzwqOkrz9PRoaeJRgsFVFpn1
         WbfpVX4RIunRnF8is8m8yrCFSEE25FOyKo5Uodwm1ujVch+5lozBxM7jGYSrh6E9C71B
         mxraFRdtgnvJOqfY0BihQ97RzR1WIJWFKnDSTPjroAAhXUZbBQdX4RzOVBsZBEp4J7mB
         zwCQ==
X-Gm-Message-State: AOJu0YwD86CtXyJlFlEoUI/tbz3CGuX9KyLFJzVKghdPcgdefqcI99hr
	ZMHiXADhHQbGnhyQyfXwKX7dlYrtFzHdnqZ+1qGEaDxfu677qT41RrUq0BL3k4TI
X-Gm-Gg: ATEYQzzcZoXd9vNLL/CCU2MHf5XiF9YleQ2WGmnH8ek2DfrLC57yuKzMF+omyQo1fPw
	I6tr8TCUq3KIFpHI/oZIrCyyKWA7gbDJxy13VQhYCkUZso6628tc+XFkFFYO2VqSPkpV54v50W3
	XIkB3SG7n9Ebvp+XBYRDj1eEnvraGkbRiS5HPgQkGJeWhCcDdTIJ0NbAWfi5z7gMkwM9nf+plJI
	iOBne8t0aLDRTZk/i3BRbGyC8TDC0UaQ5dfeO4TmVDeYC2M+QNfl0yS0KfvTB7qCQtKx+79BJvp
	TFC+Y+NPTA6UjZyHFe27JBjj9+VfTpAimMl25vfj4+oymUG5w7t9L8vpdbd6htzhN/BvMtazGgG
	eEbgjvcj8tKWcwtgh3AKumIJ0OMrhNvEI+MtWQU7662zaCWykfJLCUcYi73mrgSxWdTibUzqU4e
	uhVD4aG/u7LuErxW4QJZ0b1QsQ7kJHTlv/tmLGl/s0IC0221/ow8jbJmQPdxsXtBPobkdPll3eq
	aeVHbgSVNoXcgYW86t/WOnRlVPQuRicGd5PQZPLpCraS+Cq61L0Txi6brfo7YLq5AU3Q4sgkFXN
	sCcvQcun
X-Received: by 2002:a17:903:1b6f:b0:2ae:7f15:7a4c with SMTP id d9443c01a7336-2ae7f157a85mr12680975ad.18.1772738309652;
        Thu, 05 Mar 2026 11:18:29 -0800 (PST)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH 3/3] x86/efi: Add opt-out mechanism for BGRT preservation
Date: Fri,  6 Mar 2026 00:48:10 +0530
Message-ID: <20260305191810.31033-4-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
References: <20260305191810.31033-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0F0362175B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	FORGED_SENDER(0.00)[soumyajyotisarkar23@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
  Opt-out: Add 'efi=no-bgrt' in Xen command line

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


