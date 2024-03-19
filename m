Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9224487FFE2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 15:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695421.1085142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmal7-0006RV-Sr; Tue, 19 Mar 2024 14:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695421.1085142; Tue, 19 Mar 2024 14:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmal7-0006Nw-Ou; Tue, 19 Mar 2024 14:48:09 +0000
Received: by outflank-mailman (input) for mailman id 695421;
 Tue, 19 Mar 2024 14:48:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmal6-0005fD-Sb
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 14:48:08 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3598bfe-e5ff-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 15:48:08 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51381021af1so8201708e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 07:48:08 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 xi8-20020a170906dac800b00a46af0fbe83sm3335059ejb.76.2024.03.19.07.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 07:48:06 -0700 (PDT)
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
X-Inumbo-ID: b3598bfe-e5ff-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710859686; x=1711464486; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eaw7etip514ivjOH3GhsXOD2/5lNzqfhjxpPNlIaVtY=;
        b=Z30m6RQoRuYn1d6NjJl23Xvx++bBlWtCpSfy2XgcdJsaCSBENWKU6wkeyVNLkWCPED
         X+gaF9a/e5ZncozNy4QOMt51dpQDC7rqmvVTKORmJO/TFEoICmr+/qALTQa9bzf8kWeJ
         grtcfWQGlIwPFB/pjFoemHiOuCDU2MY8QUuC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710859686; x=1711464486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eaw7etip514ivjOH3GhsXOD2/5lNzqfhjxpPNlIaVtY=;
        b=d+Cy6g6suiU5ikSSdx9nyxnUVqfE5sUc3bzHyR7xxqFz/iEgn8lEpNyORFUQ+K8aJG
         GmTqevwa1rLlBthlC2xo2c4E/CWDUBgIx51qbXDfPTswju3pLU1czAbVZWBDsUo0+Wi3
         1F/AJjvQB09IMHl+gc4rGuF23BaeVj2oLlgEnvltc/WiQESqaDhExYTU0nuqwmakrVZ6
         7psPP3Uulh75lqEilg0B4QXGl+uGglBtBg1iqYqGWTMANSMRQB6/0MghZ+Zt6XCJA6OT
         /U11uBY/MDMMuq/TzuMAJs4VD8LRhPegWhG0uFUa8DNtPST0wXqO5Q0NR+K52nhs5Ajf
         csag==
X-Gm-Message-State: AOJu0Yy2APYuwgKw9jH6itsWXXM8DPy0j4oqEHrjYVJM3vyXHBiwpOz8
	jf9cHJb7jF9LYjKPiXb5kSVf2+o9sUYDJI5pFGw1GCO2XrhJGTfIYbmi9HSAE6t66zaPYsTtlnc
	t
X-Google-Smtp-Source: AGHT+IFSwPYDc0ZA0xloOcC4DmRiqr+2k2oSPeyuavUrZ8xRya4nQ0h+DcfqTzDeEeb5R85aZ6DvEw==
X-Received: by 2002:ac2:5e9d:0:b0:513:cb89:82c1 with SMTP id b29-20020ac25e9d000000b00513cb8982c1mr7959551lfq.43.1710859686557;
        Tue, 19 Mar 2024 07:48:06 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/boot: Support the watchdog on newer AMD systems
Date: Tue, 19 Mar 2024 14:48:02 +0000
Message-Id: <20240319144802.3894710-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
References: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MSRs used by setup_k7_watchdog() are architectural in 64bit.  The Unit
Select (0x76, cycles not in halt state) isn't, but it hasn't changed in 23
years, making this a trend likely to continue.

Drop the family check.  If the Unit Select does happen to change meaning in
the future, check_nmi_watchdog() will still notice the watchdog not operating
as expected.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/nmi.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 33f77a92047f..f6329cb0270e 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -387,15 +387,12 @@ void setup_apic_nmi_watchdog(void)
     if ( nmi_watchdog == NMI_NONE )
         return;
 
-    switch (boot_cpu_data.x86_vendor) {
+    switch ( boot_cpu_data.x86_vendor )
+    {
     case X86_VENDOR_AMD:
-        switch (boot_cpu_data.x86) {
-        case 6:
-        case 0xf ... 0x19:
-            setup_k7_watchdog();
-            break;
-        }
+        setup_k7_watchdog();
         break;
+
     case X86_VENDOR_INTEL:
         switch (boot_cpu_data.x86) {
         case 6:
-- 
2.30.2


