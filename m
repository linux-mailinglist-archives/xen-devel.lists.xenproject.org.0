Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C5943131
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 15:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768705.1179606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9bt-0006ox-0q; Wed, 31 Jul 2024 13:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768705.1179606; Wed, 31 Jul 2024 13:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9bs-0006mB-U3; Wed, 31 Jul 2024 13:43:20 +0000
Received: by outflank-mailman (input) for mailman id 768705;
 Wed, 31 Jul 2024 13:43:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8n5P=O7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZ9br-0006m0-9d
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 13:43:19 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7727ff8-4f42-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 15:43:18 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52f04c29588so10228243e87.3; 
 Wed, 31 Jul 2024 06:43:17 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c19ac4sm2253412e87.192.2024.07.31.06.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 06:43:15 -0700 (PDT)
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
X-Inumbo-ID: d7727ff8-4f42-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722433397; x=1723038197; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r718cEIdkop+N07k1ZNX/53J6gUGA7u7PilJxZxkD8I=;
        b=lFzF8gmdPC40bCkUJhy1/yVk5kIie5IOGwc3tXPwFJQl1GYtWmaODQJeRX8gEChtSR
         5IkmIRQ154u3vZHBXFRrmkjgLBxNGKiSiGBD/eEPBc/GL4aIWWj3hFFlCNiTtqDBoUfP
         JzOZeTpk8iY86dcLzz3TA/2CoCuBCaAIjxMRUT8Gy1JYe59XEv1JbXRO19VO97pGMKil
         WIkeZviJt2IEoI2Ym77QVc9PzCO8XpvjcHXbLvQUB94vAqNtlPbemie47pScOY+w4ZmH
         OKYk9lb2bdRpwsoT87XMQA65Fx7d1EWgVHwdjEMVL8ibfehQgyiM9oVjuCNUwgWsSm2p
         j+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722433397; x=1723038197;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r718cEIdkop+N07k1ZNX/53J6gUGA7u7PilJxZxkD8I=;
        b=qHkv2AwXZaiLYsN8gVdPrP74AEJyWp1npzLpaBb1CUQcwYY53431+b5c/LwF4HVFCk
         UvpgCSi9U+c6DgeDnzhLyYibIGXw/Bq57bbpUA3ovkD41y3tnWolbGVEF/Xikx9LlQNM
         wRzSlRuvItgpdLIuu34W5/lriwAs/52YM8OMHk+IGZVmMMo+8Aer56UpWTjaQXZc6iIr
         c5nMCHVIwGCvXso8jigEjwkdhBvDBnEIvWUdvscEWg6M81QK6D6Spirs5tfhoYC/EeK0
         3oEPxQQ1o9R1ep1aUT2Uvaxl5ndsCKvNl44cHCRpB3g11yLYuUiZs+SPhJrwbWPGDTpr
         Q8tg==
X-Forwarded-Encrypted: i=1; AJvYcCVuSF7Y1TTuSBbKUX+y0q1xuY3CzqiD65cEw8WLyCJ3JIICiSnUWHTSHU7UWCzN9qQ0KtqJ1joYCMHmGh5naU/fGjIUkdNYBEIe2kZ1gEa25bGqLuRj9Ul0p6kDbrQjl8opEIjm15vi77j3QMeSsYM0xMfyrfAeZvDIvUybH5VcPuONpAvT9zYZSvIfrDTgG9hQ9kjLgXA=
X-Gm-Message-State: AOJu0Yyi0GqyMlne0vMYvD1mlG2Br6Fs4s1yDPygJT6+kCOzo5nugose
	BGz3ffAKGNOLrpv9JKbCp2AM0Hrn/0MpG1a6U8I9a3v8rfMVdHniJ0nnHQ==
X-Google-Smtp-Source: AGHT+IGZFF3mk7oJ3pIj23gs7Hb0BVkYb1S67I6Cja7HRi41SZjz6dqZjEMXc/TAhT5BD/iKe7oKjw==
X-Received: by 2002:a05:6512:3ed:b0:52c:e17c:3741 with SMTP id 2adb3069b0e04-5309b269b87mr8479716e87.5.1722433396139;
        Wed, 31 Jul 2024 06:43:16 -0700 (PDT)
Message-ID: <4dc6a46b72e75d4bdd9a40916ed3bf05460146bd.camel@gmail.com>
Subject: Xen Project Releases Version 4.19
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org, 
	xen-announce@lists.xenproject.org, advisory-board@lists.xenproject.org
Cc: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 31 Jul 2024 15:43:15 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hello everyone,

It's with great pleasure that I announce our 4.19 PR release.

I want to thank the whole community for their efforts in getting this
release published!

*Please find the PR article attached here
<https://www.linuxfoundation.org/press/xen-project-announces-performance-an=
d-security-advancements-with-release-of-4.19?utm_content=3D302230092&utm_me=
dium=3Dsocial&utm_source=3Dtwitter&hss_channel=3Dtw-14706299
>*

Please find the tarball and its signature at:
   https://downloads.xenproject.org/release/xen/4.19.0/

You can also check out the tag in xen.git:
   git://xenbits.xen.org/xen.git RELEASE-4.19.0

Git checkout and build instructions can be found at:
   https://wiki.xenproject.org/wiki/Xen_Project_4.19_Release_Notes#Build_Re=
quirements

Release notes can be found at:
   https://wiki.xenproject.org/wiki/Xen_Project_4.19_Release_Notes

A summary for 4.19 release documents can be found at:
   https://wiki.xenproject.org/wiki/Category:Xen_4.19

*Some notable features:*
  - *Security Enhancements:*
    - Published 13 new Xen Security Advisories (XSAs) to mitigate =20
vulnerabilities.
    - Adoption of additional MISRA-C rules for improved code quality.
 =20
  - *Arm*
    - Introduction of dynamic node programming using overlay dtbo.
    - FF-A notification support

  - *x86 Architecture:*
    - Introduce a new x2APIC driver that uses Cluster Logical     =20
addressing mode for IPIs and physical addressing mode for     =20
external interrupts.
    - Deprecate support for XeonPhi in 4.19, with the firm plan to   =20
remove support in 4.20.
   *PVH:*
     - PVH dom0 has now moved to "supported with caveats" status=E2=80=8B=
=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B=E2=80=8B
     - PVH/HVM can now map foreign pages, which should for example   =20
allow QEMU stubdomains to run as PVH
     - Boot time speedup due to the IOMMU changes
     - Don't expose pIRQ support to HVM guests by default.  The feature
(XENFEAT_hvm_pirqs) can now be enabled on a per-domain basis

   *Other updates:*
     - Add a new 9pfs backend running as a daemon in dom0. First user=20
is Xenstore-stubdom now being able to support full Xenstore      =20
trace capability.=20
     - libxl support for backendtype=3Dtap with tapback.
     - Increase the maximum number of CPUs Xen can be built for from =20
4095 to 16383.
     - When building with Systemd support (./configure --enable-     =20
systemd), remove libsystemd as a build dependency. Systemd           =20
Notify support is retained, now using a standalone library      =20
implementation.
     - xenalyze no longer requires `--svm-mode` when analyzing traces=20
generated on AMD CPUs.
     - Code symbol annotations and MISRA compliance improvements.

   *CI updates:*
     - Minimum fixes to rebuild the containers, following the HEREDOC=20
problems.
     - Rebuild containers to have testing with up-to-date LTS distros.
     - Few build system checks, and strip the obsolete contents of the
build containers.

Aside from the updates mentioned, I would also like to note that we are
still actively working on the PPC and RISC-V ports.

Best regards,
 Oleksii

Come join the conversation on Matrix:

XenProject: https://matrix.to/#/#XenProject:matrix.org

XenDevel: https://matrix.to/#/#XenDevel:matrix.org

XenSocial: https://matrix.to/#/#XenSocial:matrix.org

