Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B89B2B2C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 10:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826297.1240523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu3-0006C8-HR; Mon, 28 Oct 2024 09:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826297.1240523; Mon, 28 Oct 2024 09:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Lu3-00065x-B0; Mon, 28 Oct 2024 09:19:11 +0000
Received: by outflank-mailman (input) for mailman id 826297;
 Mon, 28 Oct 2024 09:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5Lu2-0005yk-Av
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 09:19:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af10cdb9-950d-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 10:19:07 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a998a5ca499so548901766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 02:19:07 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f05deb6sm355961566b.88.2024.10.28.02.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 02:19:03 -0700 (PDT)
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
X-Inumbo-ID: af10cdb9-950d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730107146; x=1730711946; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdgomcGm+tyb6osYP5OAYq6042ngUQkHmwMCkva53Ic=;
        b=uM0UKGSicrKqUQteRrshehA9iIykD30CUQDZD71/o5bCmMpacEwDhlDIoYAoMk3QGc
         0lo/JSJywQawBVFtlWr7BnZ9BVVAI7NGtvJyzeCZuOwq/jZPHvbU60TkQ483qi9+q71V
         xDJvrdu2Rs3zcJH8u6n/R6RQslxYAkg9jbl0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107146; x=1730711946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdgomcGm+tyb6osYP5OAYq6042ngUQkHmwMCkva53Ic=;
        b=TE2Sh5cnySsCfKXNONxHSduClWC/phm5Dwwsbf+MkauYtSxkBnG/ur1s4mAUO3nCsY
         IvY52G+7GC7HZ4JCZcR7JuOcpPNxKLOsHjEye6eCFQtarsBDrdkuq5sq/7TBbsa0vtjX
         VqgsVFSuDzbxrqs+HEIB2yowGi9dSHa5LtO9tBIXntvTVIWTUf+mGt+hZGBpjoPRYUFm
         rwTu8w0wj+JmVbsZpfLoUc+0LBHS0DzownFgQK+VQW07DfPiWIFkVVTyZVmrlKn6kFgy
         laOPmntuBnKQz0R9NugKywFGaC0oxRhz7pjI/i2lOvftwmgk1b0JZYCo4PBTw7Ko6C/1
         ylPw==
X-Gm-Message-State: AOJu0Yx1iVBE7pGkq4mv4y+c758q9JqgRQTmQv95bto8FApSb82PlyiD
	97z5FCo3Pc/ClcPO3/gB3Z73ERiXwIBq3cNzQdcmpKWGzaoYJL6uyx0QjR5I4JZmLCoAOyl2xx2
	C
X-Google-Smtp-Source: AGHT+IHWATzgfaBR+v7s6x26PjQ/1kwTDosqOTlvX4xnR0qEOkNvvuLiP6BdqUAHfeuQZcsSkG6MLA==
X-Received: by 2002:a17:907:94c1:b0:a99:4ca4:4ff4 with SMTP id a640c23a62f3a-a9de5d98002mr545033266b.23.1730107144591;
        Mon, 28 Oct 2024 02:19:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 02/10] x86/ucode: Delete the microcode_init() initcall
Date: Mon, 28 Oct 2024 09:18:48 +0000
Message-Id: <20241028091856.2151603-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The comment highlights just how bogus this really is.  Being an initcall, the
boot allocator is long gone, and bootstrap_unmap() is a no-op.

The fact there is nothing to do should be a giant red flag about the validity
of the mappings "being freed".  Indeed, they both constitute use-after-frees.

We could move the size/data/end clobbering into microcode_init_cache() which
is the final consumer of the information, but we're intending to delete these
static variables entirely, and it's less churn to just leave them dangling for
a few patches.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

After the $N'th rearranging, this could actually be merged into "x86/ucode:
Drop ucode_mod and ucode_blob" with no effect on the intermediate patches.
---
 xen/arch/x86/cpu/microcode/core.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 9a2cc631d2aa..3e815f1880af 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -758,28 +758,6 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
     return continue_hypercall_on_cpu(0, microcode_update_helper, buffer);
 }
 
-static int __init cf_check microcode_init(void)
-{
-    /*
-     * At this point, all CPUs should have updated their microcode
-     * via the early_microcode_* paths so free the microcode blob.
-     */
-    if ( ucode_blob.size )
-    {
-        bootstrap_unmap();
-        ucode_blob.size = 0;
-        ucode_blob.data = NULL;
-    }
-    else if ( ucode_mod.mod_end )
-    {
-        bootstrap_unmap();
-        ucode_mod.mod_end = 0;
-    }
-
-    return 0;
-}
-__initcall(microcode_init);
-
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
-- 
2.39.5


