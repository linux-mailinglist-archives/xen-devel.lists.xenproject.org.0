Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD9F98647B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804377.1215340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUYs-0008B3-Gh; Wed, 25 Sep 2024 16:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804377.1215340; Wed, 25 Sep 2024 16:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUYs-00088t-E0; Wed, 25 Sep 2024 16:08:18 +0000
Received: by outflank-mailman (input) for mailman id 804377;
 Wed, 25 Sep 2024 16:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mw3j=QX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1stUYq-00086A-Mw
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:08:16 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e088413-7b58-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 18:08:13 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5365aa568ceso45758e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 09:08:13 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f342b2sm226492366b.35.2024.09.25.09.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 09:08:12 -0700 (PDT)
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
X-Inumbo-ID: 5e088413-7b58-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727280493; x=1727885293; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6djaZ0i0UcLAQOEF1aMz+/6MjQ2USThbc7kTlX/IVDk=;
        b=YBwHFE2Q7QkO1BzEFSmYkcyt+nf47WiYuzF9Gc1Eos+GLc4Dx+bLHWB9XDO9OKWxac
         SP6CTeJL1hvBD4BNNXZb19dS9c+QieSq3jCAGMa+VpVqAolIQcfXNMWRfx4kZ3boKDq4
         2Fk3Z2V1BcPosKX1c+5fwPX8aba22gCyKRuEeL7DcNSJdr26drHfDl9pHKS9Yq5H/p+a
         dtEohsWw/aNRGtXzcDG0rftuATSg2AMpTTA72YwAqRmzcZuzwadoD6ZNTW5RJzHt1PV8
         L2n+fdybl8ILEJ+0zKPVueo2+5Rzqgj3+6ydYAepQSHz2V2O471U+RA0aKwiGFA/oHNS
         DLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727280493; x=1727885293;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6djaZ0i0UcLAQOEF1aMz+/6MjQ2USThbc7kTlX/IVDk=;
        b=O+C6FpfinfeB0DgcAkrGBoueViksE85EyryePJ4NcbDHCacBYmg99V9d/evc7Jfd4j
         Wh2xlWZNeoVfgypz2LJKQ+ooH46GiVhgUjLwqyJHkwpBIZKRyIjPa1XyXmfrK/fLXWBs
         4Taeka/iVVF4QH7ghxw0TquMy59TNTfrCu6Lzy5T2vL3ricoweneD4hjqfaGtoKUBRPM
         y42BSs9LRt7qikhPZQc+zQ2dgyUnhFC/4ha/UGynDdQDmRJn2kzyLTtvtOzAGwuwerBB
         E7KQE2P3tOATMOyxEVhCWHdZL1z7VhgLiSE6u62gH3lib36dMsjLYruyFtjLo9+fNqgr
         7HPw==
X-Forwarded-Encrypted: i=1; AJvYcCUCcjrxF8v30Z5yj8QJGd8j1fpRw5vCoeW3V5t3KkkVzSUeCez817Zqe7VPxnad4TCJUNbfbWwnjI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYvVkYgzrwENnYPc8q7ZNe8knf0U60sOcvYDZkAZmDYPkiW26I
	g1kzcevbJ56ag0lkfZksceV9xT0a886jr8Hjfl1gfcN/YxCfIXv8
X-Google-Smtp-Source: AGHT+IFZYWTDkbSqil3GuCgrvM2AL9hQcvrygCaygfWhMnA3SIyJlvdTtDmukDU9trDkfSg6If9mKw==
X-Received: by 2002:a05:6512:1303:b0:536:5509:8862 with SMTP id 2adb3069b0e04-53877538bf6mr3117193e87.36.1727280492816;
        Wed, 25 Sep 2024 09:08:12 -0700 (PDT)
Message-ID: <81b676ae5958d93ecbc3a552c1c0a208dfa2d18a.camel@gmail.com>
Subject: Re: [PATCH v3 1/5] xen: define ACPI and DT device info sections
 macros
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2024 18:08:11 +0200
In-Reply-To: <82125953-99b5-4fde-83b8-51643cce793b@suse.com>
References: <cover.1727193766.git.oleksii.kurochko@gmail.com>
	 <7521839bd265e0520fc448adf50361d18dfe53df.1727193766.git.oleksii.kurochko@gmail.com>
	 <82125953-99b5-4fde-83b8-51643cce793b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Wed, 2024-09-25 at 10:36 +0200, Jan Beulich wrote:
> PPC's desire to use DECL_SECTION() can certainly be covered by
> providing
> a (trivial) DECL_SECTION() also for Arm and RISC-V. Seeing that even
> x86
> overrides the default to the trivial form for building xen.efi, I'm
> inclined to suggest we should actually have a way for an arch to
> indicate
> to xen.lds.h that it wants just the trivial form (avoiding a later
> #undef).
If to go with what I suggested before then x86 will look like:

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d48de67cfd..911585541e 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -3,6 +3,10 @@
=20
 #include <xen/cache.h>
 #include <xen/lib.h>
+
+#ifdef EFI
+#define SIMPLE_DECL_SECTION
+#endif
 #include <xen/xen.lds.h>
 #include <asm/page.h>
 #undef ENTRY
@@ -12,9 +16,7 @@
=20
 #define FORMAT "pei-x86-64"
 #undef __XEN_VIRT_START
-#undef DECL_SECTION
 #define __XEN_VIRT_START __image_base__
-#define DECL_SECTION(x) x :
=20
 ENTRY(efi_start)
=20
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index a17810bb28..fb11ba7357 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -5,6 +5,8 @@
  * Common macros to be used in architecture specific linker scripts.
  */
=20
+#ifdef SIMPLE_DECL_SECTION
+
 /*
  * Declare a section whose load address is based at PA 0 rather than
  * Xen's virtual base address.
@@ -15,6 +17,10 @@
 # define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
 #endif
=20
+#else /* SIMPLE_DECL_SECION */
+# define DECL_SECTION(x) x :
+#endif
+
 /*
  * To avoid any confusion, please note that the EFI macro does not
correspond
  * to EFI support and is used when linking a native EFI (i.e. PE/COFF)
binary,

Does it make sense? Or it would be better to follow way for each
architecture:
   #undef DECL_SECTION
   #define DECL_SECTION(x) x :
  =20
~ Oleksii

