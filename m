Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19FB1AD3C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 06:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069988.1433658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj9by-0002iC-EB; Tue, 05 Aug 2025 04:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069988.1433658; Tue, 05 Aug 2025 04:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj9by-0002fz-BJ; Tue, 05 Aug 2025 04:49:18 +0000
Received: by outflank-mailman (input) for mailman id 1069988;
 Tue, 05 Aug 2025 04:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8F9P=2R=gmail.com=arraybolt3@srs-se1.protection.inumbo.net>)
 id 1uj9bw-0002fb-Nx
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 04:49:16 +0000
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [2607:f8b0:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89cd20e3-71b7-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 06:49:16 +0200 (CEST)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3e3df510580so1349615ab.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 21:49:16 -0700 (PDT)
Received: from kf-m2g5 ([2607:fb90:bf84:45ad:2f41:d127:adbe:c0d6])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50ab153eeb3sm522662173.25.2025.08.04.21.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 21:49:14 -0700 (PDT)
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
X-Inumbo-ID: 89cd20e3-71b7-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754369355; x=1754974155; darn=lists.xenproject.org;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXs9SwO4XSOIUWvjoKCrX+uREz6ahOCzhSla9A0bVUM=;
        b=KzamnNy77t/A5EhbLJHd4ZT6N1U6Ml18tIxW1FUTY51FMlOAMX/3ExPYmWDR+B9Tj4
         kD+Fv4HdrdZV+FGKzhGNsAGEFB0s2cguXyMPae/nn+qBd5XjWD0Ccm1oboZxH2d9BZS4
         rOqNN0+2JGt0EkMt5xpZjX/4OJ3TIdUkf16AFF6trcmF+KcR1yLLHWpMRnN0OPKKpvyV
         46NbQMtC1MtnyUjS81c5zyqBlK+sXkm9lAYsGJ3hCSl/33fFVbrwCTI7biFtjlBRpMlu
         bMKCH+X1xfTheh1jeofVJBClxbR+scLWrKTx11IJ9NciHzViyywMJJjDeNTtQOONmFag
         ruBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754369355; x=1754974155;
        h=mime-version:references:in-reply-to:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXs9SwO4XSOIUWvjoKCrX+uREz6ahOCzhSla9A0bVUM=;
        b=rUmMX0+7sMML0LOnHszn+Q20NCcixbfjMmhF/fxxBm5ZZQvyiO+eSfUdCMVfpT67sI
         YOrOaU24fcWPUEG3IdaZhsu1ei33A76HAxIv2dsbHqbQwM6dLDW0B7gtqxGExGUqlj3T
         Rs1XM7tPs+lIr+jMQ9pQEvqTNQj8S4oFcoJjp62x+/Qb00/1pWIU7J3JXIYNmcc3X9Yc
         3TqZOkEe3f4p9/T4DfXTn+zTGGrS16rP4FvmOaVakbfpugM+OrR/xxKcGsZUPgdxJQb6
         CLC4A/sXYzhHpDNpcGnIxymUHhlrAwU5vAOXsQ2xqdhNBKb8WLzJ/KEM0sTPexWCfxTd
         vCBA==
X-Forwarded-Encrypted: i=1; AJvYcCWwhjmvlMqJzwaqvwolCArgHTzsCy8m+GRswaKNWGfqHltTGcbcblM5s1tfP1yNy9OqJQufNSOUYCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyszGocvBSSaacwD/SDMgs23DYzgFof10mCsNpUVxhVl5n1HCLk
	TrGo91GCZGce+Vfn1hethh53/MeVfUa+c4/3rUY7hof/yzUpjz00NJMP
X-Gm-Gg: ASbGncu94SRD9Q3063VBtwUkA32FSUtarkZX7ah3Zf7YG8urUHb4r3dW01ciIBd0Yd2
	2+6HnfgwI14h0HvLSQOv8rd3gXmTfJQo7Ih8gPLqT6t/J6xp1BH3m4gU5o0apDjOFTxbBlzCPHZ
	Waa4s6mC4wWALvsUObfB1d7FfaUBVVJEGm9S019LefWyd/OtWPx8OX1sZWoAQBztfi7mqkg8FZK
	IdIFg0fVghM3DJJR5WcCv1iwMAVONMvQXA4RwhWcWZbM8DglrwhlfF7WJasBDDHkc8svXa6AZhX
	oGxy7hKIstFsn+RcnWtJVajcepMDD7Hqtc4fwRtHsZvEempMlqpOFZdVZoL4YMX7yjahXzk0jkc
	HnPAqG4wJI1VJOeIGz071wcPHYwaddNs=
X-Google-Smtp-Source: AGHT+IH8VyvpMYmeKrfWuSB8PKhzo0cdcmlppy8+mTsfWjTZFGwyfCTjPHESrMmpxY3ES7MyKSnMtQ==
X-Received: by 2002:a05:6e02:b44:b0:3e3:c947:e323 with SMTP id e9e14a558f8ab-3e41610a3fbmr55523055ab.2.1754369354792;
        Mon, 04 Aug 2025 21:49:14 -0700 (PDT)
Date: Mon, 4 Aug 2025 23:49:11 -0500
From: Aaron Rainbolt <arraybolt3@gmail.com>
To: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Subject: [PATCH v4 1/2] include/xen: Rename MAX_GUEST_CMDLINE to
 GRUB_XEN_MAX_GUEST_CMDLINE
Message-ID: <20250804234911.3cc3997c@kf-m2g5>
In-Reply-To: <20250804234816.3d14f53f@kf-m2g5>
References: <20250804234816.3d14f53f@kf-m2g5>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cayLqM02C/AJXMYF4q/w2jR";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/cayLqM02C/AJXMYF4q/w2jR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The xen.h header was using an overly generic name to refer to the
maximum length of the command line passed from Xen to a guest. Rename it
to avoid confusion or conflicts in the future.

Signed-off-by: Aaron Rainbolt <arraybolt3@gmail.com>
---
 include/xen/xen.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/xen/xen.h b/include/xen/xen.h
index 692f97a..fdf0fc4 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -823,8 +823,8 @@ struct start_info {
                                 /* (PFN of pre-loaded module if           =
*/
                                 /*  SIF_MOD_START_PFN set in flags).      =
*/
     unsigned long mod_len;      /* Size (bytes) of pre-loaded module.     =
*/
-#define MAX_GUEST_CMDLINE 1024
-    int8_t cmd_line[MAX_GUEST_CMDLINE];
+#define GRUB_XEN_MAX_GUEST_CMDLINE 1024
+    int8_t cmd_line[GRUB_XEN_MAX_GUEST_CMDLINE];
     /* The pfn range here covers both page table and p->m table frames.   =
*/
     unsigned long first_p2m_pfn;/* 1st pfn forming initial P->M table.    =
*/
     unsigned long nr_p2m_frames;/* # of pfns forming initial P->M table.  =
*/
--=20
2.50.1


--Sig_/cayLqM02C/AJXMYF4q/w2jR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEudh48PFXwyPDa0wGpwkWDXPHkQkFAmiRjUcACgkQpwkWDXPH
kQnPRhAAwD0BnZnH/WypxaZfvHSRWFj2A1vN+TZL4GAj8foEiE9r6ia/uPRVDR60
uayYCi0NQ35VfGYYA8Ok/ses+8kpCtFcNQaGOwu8DwzQu2+4gaTp5EKAz4cl189e
JsRds5jE8nLReqFxKhNbVMTMMlz91THrPM9vMlt3SJLnDveNhZgTCZl+JqQPV0wZ
FxBxb08f8fcA3k6MPZfZkY1su2ncLszFJUidDSjyA+8PHzxiT2n8PNCUJX06a60O
xPNnr9bfb9P13H4hk57gSazsc03iVnbw14njhssBYr2Aw/1J+gGWWRBXTyqFBFiu
JLsZPdFkEKo0CAsuNNW4teNXurCjLMjad/mVvfOUOw65NQUM9bpPAcm+SdgviVG/
Xj1m/fIKVRBoPwfDHXgcDVPIE8YtcP6kN3+YKeJrmHdT7sUPv9Rcbp+jNeRa6BC+
rzIVnkIPXYP95dV0Ycou0lYTBuFSTYAS7wPOotV/HxPp/Z1trRnYXmeWJieF6Iis
z6Ih4dywciqSfy5Q+xanxKC8vq17KZW49QQc/aWC9hJt45KnkcAFJeUFEbZfBWXV
FW/e59JWreNSNQ7IZ87j7Wk8zbBXShNAJ7uONiox00W3cJrglSBbOkI4DZ1zMt/Q
mI0uzhOJ4uAOrRZ3qFS+oei+C8jaz69jgG9PjtJ+HV/hxlzmBpQ=
=xDlH
-----END PGP SIGNATURE-----

--Sig_/cayLqM02C/AJXMYF4q/w2jR--

