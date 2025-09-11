Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27676B52B90
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:24:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119696.1464967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbh-0007IC-LM; Thu, 11 Sep 2025 08:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119696.1464967; Thu, 11 Sep 2025 08:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcbh-0007FZ-HE; Thu, 11 Sep 2025 08:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1119696;
 Thu, 11 Sep 2025 08:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUFa=3W=cloud.com=gerald.elder-vass@srs-se1.protection.inumbo.net>)
 id 1uwcbg-0007FO-1o
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:24:40 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c220815c-8ee8-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 10:24:39 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b04abcc1356so63101666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 01:24:39 -0700 (PDT)
Received: from eddie5.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33b4d63sm699314a12.23.2025.09.11.01.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 01:24:37 -0700 (PDT)
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
X-Inumbo-ID: c220815c-8ee8-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1757579078; x=1758183878; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AX5M6JsUVBgtUWQloxbKOjbBxNM6+aanb5rbTnJcZhI=;
        b=FFCitnv2WwnmfwF1k1jHxReL+jQMSpK3NKhLkpKNfa4talQQJIIApJENW4fXM32ERe
         AHKqGRDsNBbC6TXbUfr7f4H/fh+r8MNJ+RGDloYdkdOY/G5uwI2n+2EX5KlWa5WhVyDn
         LCJvyYnWWUxkKzI1cbnSjkfZ/aIRSStx5qb7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757579078; x=1758183878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AX5M6JsUVBgtUWQloxbKOjbBxNM6+aanb5rbTnJcZhI=;
        b=JQvyNrBWGF6k+SdMk4CMSGBcYj66fa4x0CsBuZhARJMGmmVTOCBXf5C1p0sZxBw7s6
         72TFpHwaOh6AhDIh/sL6iZWxyJ0i6OuL3zSM9ZBk5DKXGVB4bbHenmWH+YQXSxlNiH+o
         Hnu2L4Mk/XVWC+STdF5b8KsfiSyxygLq/1tCHs6f7owBhlf1o3c7KXDQ8d9C9C0SU7ck
         en66eYPxKy3o5k+b2SwzFrBJBo3fI8xS/q5l1Du7GVcZw2QgPo751oVeeOQ4h2Do1vNn
         V/38arjtDbwYf689Us0KblYDNQQF/aJzxbk7CaDSiENopxRLVIO1Hs5a/1+tlgEepHlU
         pdfQ==
X-Gm-Message-State: AOJu0YzU22VQkVZeHvsUpyhWXRFdLhrxV2jH2NbKr77o6+OtW4s4CteE
	pkvONU1ul07KRLRm4PdoBNMsiTAR6hDGRJlfIQvKMOv4RQjFVgTzOxjz8XW2JhgX7/ZoXIn9hmf
	HcKuj
X-Gm-Gg: ASbGnctcJFF3DrNk95dX4Vnw8fcdzaj3/MKEeUHHR1TTIKZh7mExGTpuFMxf6CA6yL0
	kBpQb4U8+2YkvY9TEc44z650YLBc7ZN7hf1gisaW3sW3FmiqFaTE8Wv7aimjGVhUeTMtxpUKR1V
	9nxMKjsGipCP8Yn75Xd4Hp075elJZ6Mfp/t7fuApu5nDJzhZEA1vsWRfK/o+kT3ZuEpmN49Y9o7
	/PHUNsX3qr7lj74GYetz2FK0b7MSk5EFBfkQJSvjPvR9foAY7BlHiAdAardtXFMkmwNJaDj/eFe
	WCuMTFEigIW03VSJDKA2T/BwlJtS1bAgpsv1Nkf6xZWmPGlPpcLD7eH82cjv1F2G2qNCUktvXYa
	15V7rVpT/U8b2HYWN6FNvCGh63xGkM1BLJ2jXn2Y3GrIksVndXpAK7U7g
X-Google-Smtp-Source: AGHT+IFR3s3EFcYpDPLzuG37Obd3r47IE8yh46jl0MZDTp4gSHuSNA3dFTphIpJwiNTYzYg8Krou2Q==
X-Received: by 2002:a17:907:1c26:b0:b07:892d:6769 with SMTP id a640c23a62f3a-b07892d67d9mr523996466b.2.1757579078222;
        Thu, 11 Sep 2025 01:24:38 -0700 (PDT)
From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/3] efi: Shim LoadImage improvements
Date: Thu, 11 Sep 2025 08:24:26 +0000
Message-ID: <cover.1757519202.git.gerald.elder-vass@cloud.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A previous series for supporting Shim's LoadImage protocol had some
outstanding comments after it had been accepted, and internal review
revealed an improvement to be safe when unloading the image.

This patch series includes those changes.

https://gitlab.com/xen-project/people/geraldev/xen/-/pipelines/2032454096

Gerald Elder-Vass (3):
  efi: Fix line length in init_secure_boot_mode
  efi: Protect against unnecessary image unloading
  efi: Limit Shim's Verify success to EFI_SUCCESS

 xen/common/efi/boot.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.47.3


