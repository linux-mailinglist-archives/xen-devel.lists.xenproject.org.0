Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FD8CD115
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728365.1133270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RC-0006Kq-KX; Thu, 23 May 2024 11:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728365.1133270; Thu, 23 May 2024 11:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RC-0006IR-H8; Thu, 23 May 2024 11:16:46 +0000
Received: by outflank-mailman (input) for mailman id 728365;
 Thu, 23 May 2024 11:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA6RB-0006Hv-MS
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:16:45 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef20935b-18f5-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 13:16:43 +0200 (CEST)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3c9b94951cfso2985814b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:16:43 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179cebsm142194236d6.3.2024.05.23.04.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:16:38 -0700 (PDT)
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
X-Inumbo-ID: ef20935b-18f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716463001; x=1717067801; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvBv5IQ5vD8zkhmMyJHwoIHHhy8iEs5huUmFgDlUZVI=;
        b=rSrKe+EKldLoGvjAnhCSGhhdGbsSAqV1ug0KxVy3zGMMuN5+/t5jNCVUioLyatdXR6
         OYwQ5rzBPaishsNbA5V/2EMhCMk3DBHSgIX1dxd/fBfp62zqa5ATzKf5ZDDckpFxVnx3
         /a2BKa0q/gleXrpKx0v/cWdfdwSdKbcs71Xf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716463001; x=1717067801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvBv5IQ5vD8zkhmMyJHwoIHHhy8iEs5huUmFgDlUZVI=;
        b=a8zFy3E1F55SBjROkQ96m5fBrqM/M5cR/W5xx/Iy8NbvVXwvi2VtZWiYvgWlEzzhNq
         sFbOKdUa+f2cXw9oJTktX/N9RMebVy3BoSUq2iBvlxtiKLz7IrvhV8IEGXfoDJhPPLBJ
         isT40byH4rFaurRV8NewnCdHplgy/T8/mtFs8n8GhNJac7IUj8lBmj2yw6asCLsiDh0A
         Ua0tU3QcHJPFVefyic9k4FZfThxuIhByEVzBh/inc5DPp6nfcUTlwGd2exOC5fT1LJms
         vGPv8UXIxbs+aRdsTN6L6AN5tsrQu88fwr//CTLa/xEG9x/pU7e3B4cRyioDSy1DKZMt
         WPgg==
X-Gm-Message-State: AOJu0YzaRfjrq8fgYFBeP9UBcbE7AAus279Mgq7qMdRR6HEaxhGrPz3W
	XhgFtqZ6lBV6fkFyqfd2NYrB/Zv+hQSC+mTP2d77/Lr9XRfldQELZxmD8V/kjieJ2tgD/wTmfJx
	Ik0w=
X-Google-Smtp-Source: AGHT+IFI+Z81iHkbwpld0dC+maE7dJsscshL4XYvKQRclSQAfFiiFIChxlLBh7SVyOT3zLXjBG48/A==
X-Received: by 2002:a05:6870:818b:b0:23b:339d:6fbf with SMTP id 586e51a60fabf-24c68ada91bmr5712972fac.5.1716462999867;
        Thu, 23 May 2024 04:16:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/7] x86/xstate: Fix initialisation of XSS cache
Date: Thu, 23 May 2024 12:16:21 +0100
Message-Id: <20240523111627.28896-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523111627.28896-1-andrew.cooper3@citrix.com>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The clobbering of this_cpu(xcr0) and this_cpu(xss) to architecturally invalid
values is to force the subsequent set_xcr0() and set_msr_xss() to reload the
hardware register.

While XCR0 is reloaded in xstate_init(), MSR_XSS isn't.  This causes
get_msr_xss() to return the invalid value, and logic of the form:

  old = get_msr_xss();
  set_msr_xss(new);
  ...
  set_msr_xss(old);

to try and restore the architecturally invalid value.

The architecturally invalid value must be purged from the cache, meaning the
hardware register must be written at least once.  This in turn highlights that
the invalid value must only be used in the case that the hardware register is
available.

Fixes: f7f4a523927f ("x86/xstate: reset cached register values on resume")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * Split out of later patch
---
 xen/arch/x86/xstate.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 99cedb4f5e24..75788147966a 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -641,13 +641,6 @@ void xstate_init(struct cpuinfo_x86 *c)
         return;
     }
 
-    /*
-     * Zap the cached values to make set_xcr0() and set_msr_xss() really
-     * write it.
-     */
-    this_cpu(xcr0) = 0;
-    this_cpu(xss) = ~0;
-
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
     feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
     BUG_ON(!valid_xcr0(feature_mask));
@@ -657,8 +650,19 @@ void xstate_init(struct cpuinfo_x86 *c)
      * Set CR4_OSXSAVE and run "cpuid" to get xsave_cntxt_size.
      */
     set_in_cr4(X86_CR4_OSXSAVE);
+
+    /*
+     * Zap the cached values to make set_xcr0() and set_msr_xss() really write
+     * the hardware register.
+     */
+    this_cpu(xcr0) = 0;
     if ( !set_xcr0(feature_mask) )
         BUG();
+    if ( cpu_has_xsaves )
+    {
+        this_cpu(xss) = ~0;
+        set_msr_xss(0);
+    }
 
     if ( bsp )
     {
-- 
2.30.2


