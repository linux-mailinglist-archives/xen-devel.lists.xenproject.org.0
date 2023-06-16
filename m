Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BAF732C7D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 11:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550058.858937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA66t-0007XI-MS; Fri, 16 Jun 2023 09:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550058.858937; Fri, 16 Jun 2023 09:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA66t-0007Uw-If; Fri, 16 Jun 2023 09:51:15 +0000
Received: by outflank-mailman (input) for mailman id 550058;
 Fri, 16 Jun 2023 09:51:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2CY=CE=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qA66r-0007Up-FX
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 09:51:14 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.221]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530189e2-0c2b-11ee-b232-6b7b168915f2;
 Fri, 16 Jun 2023 11:51:11 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5G9pA79i
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 16 Jun 2023 11:51:10 +0200 (CEST)
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
X-Inumbo-ID: 530189e2-0c2b-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1686909070; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=J+fcPpGIMbsH1BcD4udFSFWiCiKkK6T20RjtjFyiUCMESNju7GogjT3mIG2Oyc7/IC
    hqQlyLM+1pz/W4HhjGNpnllRX43QUWkZS7pL+jGkKFKcsCwF47xYWqGaVAh/1FoEFrJi
    p/XdGgq/LvGCzanSdumzoJ88Ud9RHWyPnkbicgxj/nzPC6Tlu1sRbDz24IaE9qImB5o7
    hQUhfV6kniGJs1WIGdg3ZLlFFcIW6lGJT+M/pyJW4MFtW4qJT1lwTum+tLKZEQEIhKil
    OQOMQ4W5i7dfHeEQHh0UbZRRFYlCwNgqGygWoDEvJaly8gF4VKNRvcNh1ZL1E8Y+q5e0
    gQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686909070;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=2P1x9GXm0TweywT8hh6nU0PzG0yD9qJ7KPg+jyEgi9o=;
    b=V3JWGl8eHeEupf/GKSR21jKGHKTr+TWOud5FGYH+OSu0NVh+bVO12jSZNCqK+qJb40
    l1PmZXa8zG+Wdw/m7gOrN/DO+x8f28LdC+q/W8HC32w9+zabpPaArpbCWEhYnhBZG2Br
    KZ7Jr1rXoKhWOlgLPrl3OmUkyPAcuYnIiRbMi0/7XhyKqA2jPsabNfk+D7IjCQcVQQtq
    wFDgmDGlaHbULVhBEVdONZgYrZLcde7x439/TUvaB8WYIj57XX0jGKxtAdnRFEdLFvqi
    IJvmv6D99E/3ibaMI69eMapG5CLD9F+BKH3Aq3UwPFbTLwmULLdH5pwTxMdG+3ewa0Lf
    MJRA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686909070;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=2P1x9GXm0TweywT8hh6nU0PzG0yD9qJ7KPg+jyEgi9o=;
    b=KtMrfRdnI8Eid97zhQ4qGyG6AIPbXWQxHQ1DvxVccBVBucFZBDoqXxgM4nnWkszWsz
    qPN//udpY4sT3ABSBqHFPaVze9z9Zp5BN1aZeRX6iDkAfBBr4yfWI/8xqWBV587emncr
    8fukqUiKMbh3kkEvo1gMCadZ8uldhORcSK0xtl52gHvs+JPQ3O4llMrWnhNnPIjCccPn
    65csGK4QrdQaFbYYb/mez+9eYcPrDQWc2B0qcAz7WPUMjf4cx5IxPtjB/V5rI2tc6WtT
    zJLy35OEzgRvCRIVxUBTM8EhFnL6+IE3l6lOP+ZjpPuBdjUM2Z53rDwSr3G5zyx7DqcO
    ObUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686909070;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=2P1x9GXm0TweywT8hh6nU0PzG0yD9qJ7KPg+jyEgi9o=;
    b=HMziUXWyvpzHsT9/oGrCtCpCczY9cBj9dCNTBdLqzGr9fPizTeJC6qSQUIKiE7co+W
    QYLk1caO9Nx/Znj5kFBw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Fri, 16 Jun 2023 11:51:03 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: compat code lacks support for __attribute__
Message-ID: <20230616115103.1fc88699.olaf@aepfle.de>
In-Reply-To: <ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
References: <20230614104234.56835aa9.olaf@aepfle.de>
	<ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/T_WllCH8rSUp/jtfFjW/+cc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/T_WllCH8rSUp/jtfFjW/+cc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 14 Jun 2023 11:49:35 +0200 Jan Beulich <jbeulich@suse.com>:

> However, if you're after adding packed attributes, and if you're
> meaning to only communicate between Xen and the tool stack, then
> the requirement above doesn't exist. Yet then I would also wonder
> whether you need any compat translation in the first place. Those
> packed structures would better be arch-/bitness-agnostic, wouldn't
> they? So perhaps we could arrange for your additions to be excluded
> from the compat translation machinery?

The change below works for me. I wonder if any special compat handling
for t_buf and t_rec is required. To me it looks like only uint32_t is
used, which will most likely cause no unexpected alignment issues.


Olaf

--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -34,15 +34,6 @@
 #include <asm/atomic.h>
 #include <public/sysctl.h>
=20
-#ifdef CONFIG_COMPAT
-#include <compat/trace.h>
-#define xen_t_buf t_buf
-CHECK_t_buf;
-#undef xen_t_buf
-#else
-#define compat_t_rec t_rec
-#endif
-
 /* opt_tbuf_size: trace buffer size (in pages) for each cpu */
 static unsigned int opt_tbuf_size;
 static unsigned int opt_tevt_mask;
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -30,7 +30,7 @@ headers-$(CONFIG_HVM)     +=3D compat/hvm/hvm_op.h
 headers-$(CONFIG_HVM)     +=3D compat/hvm/hvm_vcpu.h
 headers-$(CONFIG_HYPFS)   +=3D compat/hypfs.h
 headers-$(CONFIG_KEXEC)   +=3D compat/kexec.h
-headers-$(CONFIG_TRACEBUFFER) +=3D compat/trace.h
+headers-n                 +=3D compat/trace.h
 headers-$(CONFIG_XENOPROF) +=3D compat/xenoprof.h
 headers-$(CONFIG_XSM_FLASK) +=3D compat/xsm/flask_op.h
=20
--- a/xen/include/public/trace.h
+++ b/xen/include/public/trace.h
@@ -81,6 +81,15 @@
 #define TRC_TRACE_WRAP_BUFFER  (TRC_GEN + 2)
 #define TRC_TRACE_CPU_CHANGE    (TRC_GEN + 3)
=20
+#define TRC_a (TRC_GEN + 123)
+struct __attribute__((__packed__)) trc_a {
+    unsigned a;
+};
+#define TRC_b (TRC_GEN + 321)
+typedef struct __attribute__((__packed__)) trc_b {
+    unsigned b;
+} trc_b_t;
+
 #define TRC_SCHED_RUNSTATE_CHANGE   (TRC_SCHED_MIN + 1)
 #define TRC_SCHED_CONTINUE_RUNNING  (TRC_SCHED_MIN + 2)
 #define TRC_SCHED_DOM_ADD        (TRC_SCHED_VERBOSE +  1)

--Sig_/T_WllCH8rSUp/jtfFjW/+cc
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSMMIcACgkQ86SN7mm1
DoA7jw//XvvbIgTXZw+M3t+NQRqKhBrLMMlZjxgR3u6wAgadcJG+oADpKm/pw6pk
BeHpISl4LHCEY6eGLqKSwRX4q6hz5e5axAXsP3+056YGOv6mX2V2q4qaBU/IoVEh
EGxPBsr91GX9MsmM0Fnuj/fOXB590jAvxJFEVijKI792TKXxUFCIqvteLO4NY2e3
jEpvKdWIkK6xzFGxPP6w1YXg1u3UNdAC90ef+EzIgrLHVNZGI9UG++6QjHMVoKn4
i85kUims4Mcb+Wp8Qcj2fg8dpLF5smEImVEmXjBx0t1dqgyKJ9l2i+X/yC9A7YGI
5cYGQKdeCzUAvrksmTj5gw8thept2EamowXX2M96lMP8fZU7yuSfjpFW8+5kLAbu
N+e5jswx9yp4VWnTStj9eYIiQj0sIpxQ1fOr8Xw5t1L4WxqkYLqwI7bUitJNZEoS
mj3ipmXcEoT5QY7iBG64GEZycs5+0anB7PihHMXO22G4Vc8X2BdBrSP2wR4TRYLi
RDIr5b97Dfik7BzupMZkaI3G6fpBOoyUnDg+9NixbgCM51rdSTt7S4SdxzbsNBKG
w+srrLRL/CWbIkIyi0Zmw1YO7+8hkhkqhOSC3EDfC9J9h8pK+wvlJ8cT5q/FmTsy
Z4P4FpZLH+ys+YlrsSexb0B4XJw8tm0YVrh3HMUoqf5xKjIecks=
=HvBs
-----END PGP SIGNATURE-----

--Sig_/T_WllCH8rSUp/jtfFjW/+cc--

