Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CD3945A4D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 10:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770763.1181349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZo25-0003CO-RQ; Fri, 02 Aug 2024 08:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770763.1181349; Fri, 02 Aug 2024 08:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZo25-0003AV-Oc; Fri, 02 Aug 2024 08:53:05 +0000
Received: by outflank-mailman (input) for mailman id 770763;
 Fri, 02 Aug 2024 08:53:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GvaU=PB=gmail.com=adobriyan@srs-se1.protection.inumbo.net>)
 id 1sZo24-0003AP-Mx
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 08:53:04 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0d9aa11-50ac-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 10:53:03 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso8418763a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 01:53:03 -0700 (PDT)
Received: from p183 ([46.53.254.37]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839610c77sm833557a12.9.2024.08.02.01.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 01:53:02 -0700 (PDT)
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
X-Inumbo-ID: a0d9aa11-50ac-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722588783; x=1723193583; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8XFkRTNOAvo/6n1TkCxI0Nq/GhsBWYAifvh3B1avP60=;
        b=nSehq0EN3JsxhBiMShlIzM95uMBuI43KNTQE5uLMuCK6j9WQqoETY+AbVO3inkeXd7
         VZ3SjX7ugkb3qcaiVbAVlzAB+LxLtSULQMOFl3GYR3KVnsH9sAArghtdLGfdxDwkXeEH
         Pvh4aoC9RfJekytUb82syQG0aqx1hJouygIaxsVO2fIF+wr2vHnSI2eQ8YjOiqnY3CYf
         6rRWEl90KYmCihV8ml9GtF8MvsG/QurdilBP+Ty4lb2fOGzWG4zA/W77QY88Xzw9csPH
         SHCadmakjLT9bs0ws0G94nFuQegIgm9kGXatps1fkArKKcup+TvUFO21NyHrPNUPl8XT
         jphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722588783; x=1723193583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XFkRTNOAvo/6n1TkCxI0Nq/GhsBWYAifvh3B1avP60=;
        b=eKie2t0r4PyZQhQMlIECyIGOeulOfp44yVY+YYmBzDu9hoioZvKGXiuHU2mfCrZUWA
         ejYiBTaPCLbuPh5qKZ6bNsDmCBkbvj3zNaw9oBhpPp88ek0nqizqdghLKqhsUnCiVTpR
         MNG9lGUvdwn5p/oPuBORLenn71E2YPtsEMrXPK1z2XfLAilOsNAZKczBDKtQ1ZpvmmM9
         nmPMLU20/GA6F5Idlu9Z/aT8QN1/GmQDgWRY6j/znV/WdiSJT07prQ3B1VG6tfS7JOh7
         HiQ00OJ4gaj7msN8HHxMSoAITxZzfZcpzyPMfewHvk8+Y+mzkgjjP8xiq1BqIUGztl7J
         no2A==
X-Gm-Message-State: AOJu0Yzw25S2Q/wztnEf+9BcPplSXg2z9T1UlTSH9QLUqBHdhfjx9eI9
	lsfBtlaGiIffoY1OgAi7b2jppsrnNau/s7m9rUcwi3OxJATEiVA=
X-Google-Smtp-Source: AGHT+IFJwhpUx7VoS206VbLfNRc/AmbO26vvXS6AcphopWKlowMmiS2F7rsx3JjoggcT9/JHDYDaLg==
X-Received: by 2002:a05:6402:22d7:b0:5b8:34a9:7fe0 with SMTP id 4fb4d7f45d1cf-5b834a98116mr1232930a12.6.1722588782707;
        Fri, 02 Aug 2024 01:53:02 -0700 (PDT)
Date: Fri, 2 Aug 2024 11:53:00 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] xen, pvh: fix unbootable VMs by inlining memset in
 xen_prepare_pvh
Message-ID: <3fe4502f-020e-46de-976a-b32a76de478a@p183>
References: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>

If this memset() is not inlined than PVH early boot code can call
into KASAN-instrumented memset() which results in unbootable VMs.

Ubuntu's 22.04.4 LTS gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04)
doesn't inline this memset but inlines __builtin_memset.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/x86/platform/pvh/enlighten.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index 8c2d4b8de25d..c2f6e202217c 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -133,7 +133,8 @@ void __init xen_prepare_pvh(void)
 		BUG();
 	}
 
-	memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
+	/* This can compile to "call memset" and memset() can be instrumented. */
+	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
 
 	hypervisor_specific_init(xen_guest);
 

