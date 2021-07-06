Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846A3BD400
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 14:03:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151166.279397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jmq-0004UK-Fb; Tue, 06 Jul 2021 12:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151166.279397; Tue, 06 Jul 2021 12:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0jmq-0004SU-CT; Tue, 06 Jul 2021 12:02:48 +0000
Received: by outflank-mailman (input) for mailman id 151166;
 Tue, 06 Jul 2021 12:02:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0jmo-0004SL-Rb
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 12:02:46 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.50])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1303df6e-de52-11eb-848f-12813bfff9fa;
 Tue, 06 Jul 2021 12:02:45 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx66C0HRRN
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 14:00:17 +0200 (CEST)
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
X-Inumbo-ID: 1303df6e-de52-11eb-848f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625572818;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=l2RIPzx1fKjgqHs4Veqk4kH2oX1FOhF4tS7aEo+0JAE=;
    b=HIkQkl+YzXadqHjv4xMmUmBudYsiO4zb7fRgKOTZXgIlQog+79hrOg0jo4Iy+Z2Q8f
    kbQouLNL/H5wYG3pGpmyVxMQjkSz5XjGEblPDV1C6AfBzhuQLMH1bjWAS3KluMCoh7E/
    SdrgMfMOcXmEjzjonqYGVEo049sVOo7A72jdz1dblIyAZ/Tl+DgkzR31LZd42bGuYpSG
    ZLRiASzfH5dLAsTAB2jt4KyvbS/ZSAMJPVcWKsklayiaKwbufOHV2pDQsleJhVzQipE0
    5BIhOFuCbMlwCYkhZ6Ve4GYNARNHZrG+DjUTbPtJQpPoREu+cKyjs+XQrmYTLanqu0ER
    YlmA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 14:00:10 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Michal Orzel <michal.orzel@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, bertrand.marquis@arm.com
Subject: Re: [PATCH v4] arm64: Change type of hsr, cpsr, spsr_el1 to
 uint64_t
Message-ID: <20210706140010.4b8802d9.olaf@aepfle.de>
In-Reply-To: <20210705063952.25629-1-michal.orzel@arm.com>
References: <20210705063952.25629-1-michal.orzel@arm.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TkrcJ+Fb3SFu9VLYbQg+Xct";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TkrcJ+Fb3SFu9VLYbQg+Xct
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon,  5 Jul 2021 08:39:52 +0200
schrieb Michal Orzel <michal.orzel@arm.com>:

> Modify type of hsr, cpsr, spsr_el1 to uint64_t.

I think this is now commit 918b8842a852e0e7446286f546724b1c63c56c66, which =
fails to build:

...
diff -u reference.size tmp.size
--- reference.size      2021-06-29 10:50:32.237518309 +0200
+++ tmp.size    2021-07-06 13:58:19.052592351 +0200
@@ -4,8 +4,8 @@
 start_info                |       -       -    1112    1168
 trap_info                 |       -       -       8      16
 cpu_user_regs             |       -       -      68     200
-vcpu_guest_core_regs      |     304     304       -       -
-vcpu_guest_context        |     344     344    2800    5168
+vcpu_guest_core_regs      |     312     312       -       -
+vcpu_guest_context        |     352     352    2800    5168
 arch_vcpu_info            |       0       0      24      16
 vcpu_time_info            |      32      32      32      32
 vcpu_info                 |      48      48      64      64
gmake[2]: *** [Makefile:24: check-headers] Error 1

osstest may catch this error as well.

Olaf

--Sig_/TkrcJ+Fb3SFu9VLYbQg+Xct
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDkRcoACgkQ86SN7mm1
DoCWxA//YDvVLUx7rPAep1gcwSf4DVkQ9380VN05iByqhWYiCzHSj4jnE9bjR0vD
3MlqXHZrt5CKHmuk+g5zmys6kalh8b3WYKpF+X0q1xuTRMUSTDsYfSRHsoJbbyJt
VVMzSK4Wu7DPBsVufLNWk94VGYaMsKy05SJI6KNJtmeFsNQ6Puv0/3Ptplz7aJcD
7JFAgjEPtA3p5/FMPG6/riWV4qN7Uy02WFRGGCEzulfTOqW5lfPmx6iQCr8NPEua
2sd4Teio61BCoLmg0E8QlRVdDD392MSbT04je09hwZYgV7+NKeyi6Agq7RWf5cFr
EwaSjLJtoQ1OkjFt/KY0uVZwyUZ6AjhN6oPDbmw95moXL13TVPPF+OmBO6wl8Z8T
PYt/qLKgPyC3ZNSpLjJAI6o8GuGKz14c3WZQ6Y6yRto5NcbO2TAXPCVWOICldFTG
nn3E0ssJY+c6bz6ZWLjuTqAIg2d5NcTcKVr3Y2JVEjHCRey+PwkIV3iDdVkfKH7V
xKUV9yddWVcK6tvJBAYgp7gsQaZe7cYWnUP/PXadcrmMjt7UXV/RbrAom0K8PdfL
qes6LnSeaFXDPRanPNnTzJtd1CNEwHCOpAdiM860uXvP77vH/oXmfXuX+Oz5QZBk
H5IYR/4wCKa2glzlw0/FQzjQlnw5FGSeEyQcU+AwFxG7LEtsSaQ=
=KBQV
-----END PGP SIGNATURE-----

--Sig_/TkrcJ+Fb3SFu9VLYbQg+Xct--

