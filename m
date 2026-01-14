Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C29D1E432
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 11:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202888.1518294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfyaC-0001cI-Lf; Wed, 14 Jan 2026 10:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202888.1518294; Wed, 14 Jan 2026 10:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfyaC-0001ZU-Hq; Wed, 14 Jan 2026 10:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1202888;
 Wed, 14 Jan 2026 10:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cpCS=7T=proton.me=milky_way_303030@srs-se1.protection.inumbo.net>)
 id 1vfyaA-0001ZN-55
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 10:58:35 +0000
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch
 [185.70.43.167]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f66a3f00-f137-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 11:58:31 +0100 (CET)
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
X-Inumbo-ID: f66a3f00-f137-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1768388310; x=1768647510;
	bh=NVfvmKzgrJAEn5XrxiS+E6nAdepF2NP33nCezVWZu8Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g+1mJd7QPSPdvvJ7JC+RbB0ZMOQKIJs5Gj5LuEqkfDRh/SYdEtNWZ4Z11Sa+WTu7J
	 lOnRbev+xPTMiagF3lwU/pbET01kH8j2RkPkuXhDYHXTukxuRhgXwekW7LQVooI1fV
	 Q4ISxtxgbAlL93y1Doj13pTLV4VVDmO+D2A9g16qRMUL/MDmAEydFPe6nx0Wdi3O6l
	 e8NZ+NK4V8MNSm5613fOk+hOZEcWE4tjbvvNDuu9UOwUdmR/xIX8TNJnSdSElBucfw
	 TuWe78JHQG+KfmSIEgsupRZ+maplSI/P5rea8HLa/8BV1RxWnhT7+4T4w9q2tE9UU8
	 w49O4etCbW0Og==
Date: Wed, 14 Jan 2026 10:58:25 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
Subject: Re: Cpufreq drivers not working on T480S
Message-ID: <FEKky8EG7uaCBf24_kJ7c8fNFwXgajV7RH98tbwxsty3gGkFcMJuI4plVzNAVqiLYKWFGwCUo6HsOFKD_abqWU9wZtxgTNXPJz8w7vv-PYI=@proton.me>
In-Reply-To: <rhr8suTtSGv9hTwateK8Tx8Cm9xetzvaOsOIzexIaY-VaPyxsgzA3K0pYTeyyrKFtkc5gHJ3SrJ0I5VKjGsxBKdQm-QKPRVF_bugbAHM9uI=@proton.me>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me> <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com> <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me> <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com> <unRhWiUKUGc3G4yBmJJ2Pc0JOSbM4HC0b-fTBaf1f0RYJEi_aIHV3-il1EafrSE9c77-tZNUV386xdg3UANDdeonG_zecEVq7HrG2COheJ8=@proton.me> <7dbd26d1-0d9a-454f-90d8-5a7f3d8e12da@suse.com> <qo8wx-b_cpRuzol0X0mW_NHY1mu3tOBCzMvy5Y_8IASOkmy1oxPdJWdbrndDL63d5lMbw1FDMkI9gCSH9BS2UFWiuyjhycfqWpJWueeHq2E=@proton.me> <8a2125c7-c5ec-4be1-a7a5-61b2936cc90f@suse.com> <rhr8suTtSGv9hTwateK8Tx8Cm9xetzvaOsOIzexIaY-VaPyxsgzA3K0pYTeyyrKFtkc5gHJ3SrJ0I5VKjGsxBKdQm-QKPRVF_bugbAHM9uI=@proton.me>
Feedback-ID: 171106842:user:proton
X-Pm-Message-ID: 30c71730f5c6aa056b2207ebd2dd618288ca6ad4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Just wanted to update this thread to say that now another T480 user (the T4=
80 is a very similar model to my T480S) using the release builds of librebo=
ot (as of 26.01 RC1) also has the entries missing from the ACPI tables. Tha=
t discussion was here https://codeberg.org/libreboot/lbmk/issues/394. So th=
is confirms that I'm running a standard libreboot, rather than a bad build.

Do you think there is any way to avoid the underclocking issue with Xen on =
such devices/firmware?


