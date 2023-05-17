Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3064705FB4
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 08:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535776.833781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzADQ-0002n0-3t; Wed, 17 May 2023 06:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535776.833781; Wed, 17 May 2023 06:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzADQ-0002kN-0P; Wed, 17 May 2023 06:00:48 +0000
Received: by outflank-mailman (input) for mailman id 535776;
 Wed, 17 May 2023 06:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ox5N=BG=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pzADO-0002kH-Qk
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 06:00:46 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 295a637f-f478-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 08:00:44 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4H60iZoh
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Wed, 17 May 2023 08:00:44 +0200 (CEST)
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
X-Inumbo-ID: 295a637f-f478-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1684303244; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=V06lVMquFWcqyXSZhOHKtdEmcCCCG+GHqcGes+MX+X9cvdL2mg8zhGQkCIuOJ1aIy/
    G/mzZR84IRLGKXqLIrWGnnLtGrBt6vaYaU/ikLr+p4EnUvpxPcv1U3PdIbdDDpEUWkhd
    ZwnIiqxurPx1sWoqSNLosPSqjDBJrymai0eFCU9FWpLPeGE/ARA4j5KObk6uhvutQ3v0
    GyHFMhOAvRrZj0fg4rJ1xBYWw63TKfDumcoyYBZEXBx/x8IiZezBLVDe4LLV2cgmNWI6
    u3CfIoYupdBUqELH6QKrLciM2dHVjLUcj5AZZpQltZ5jB2Yv0nFDglCRorbteJf8PfM+
    dXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684303244;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=MhFDJKZnJdarpDmKEzJHJdw14S3sG04JUxt6GAadBKY=;
    b=LrFYoXNhjwOOjNWJst7MypRsmpYf8ukQb7w1NZ02a2W0vGZ4ND2ENeEYCvo/Sk3JUN
    QI/7T4nLxurDK+tEEwk9VWFnf6wq5qCfkqN8Ze2i+q1Tz0OfIyb4pC0jngNfIqY3x8ly
    11yPs2dVvFmSjz9zwcdpesfdizTY/8ENRcBhq/Q5JjCbCdzLk9LfPzZJiXwV0oM0ZygM
    joVN9aZrrhS72h0D/oP5D8+4kZ65wyC7gH7AK8fAbCjlVFeP28hpwXmF23hil4/sBLsD
    iJu1erlJCvuuPCFJbMTNLTxxP/CFaAeaU9ISYYbBFuysZ9m4LtR73zHBFrS/DaPahdtC
    Kjcg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684303244;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=MhFDJKZnJdarpDmKEzJHJdw14S3sG04JUxt6GAadBKY=;
    b=Rp4Xy09VQnlWT8lQN8EOQJSqbEb18IYd8KRgGheboNPUBd26lyRmZGwNARjN/slz9k
    UDM8tSe7oV37Feo2iy74PWpHKldB3Bk4UAdfboo/x2DLtNTaNjCtK+KksAWsvmzNxPS2
    0r2uit/u3linKUXH3i1+W+JptG6Liq5CvvCPI83CV3ftKkja1Uoqat7JwS0PkwfMDtQM
    gw2hDtpYfQ6Zym1p/YTp+7sVdZPiI74OamNiqrRlWOSLkalgtlsSJJpgSX+/91qg3SiQ
    ZFbUqANVDRccyDDHnTQN7WGxqnOKzIQL4CprqO41iykvIXgGrtUpEHzTUJadko90+tfG
    2d5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684303244;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=MhFDJKZnJdarpDmKEzJHJdw14S3sG04JUxt6GAadBKY=;
    b=p26KJiwi+30BISZqx/YNQNXGCKIgGlIx9S4qrXS7+BfJL3UTlcfI8PH8hnRvWvXGva
    EnSmtFZ5JPdVqSQeI9Ag==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX/0jCNVp4ivfSTHw=="
Date: Wed, 17 May 2023 06:00:24 +0000
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: fix qemu to build with gcc13
Message-ID: <20230517060024.6c5d730a@sender>
X-Mailer: Claws Mail 2023.04.19 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zhdk1pmSVJ9su3FAnEtA_Mw";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--Sig_/zhdk1pmSVJ9su3FAnEtA_Mw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,

please backport d66ba6dc1cce914673bd8a89fca30a7715ea70d1 to
qemu-xen.git to allow building it with gcc13.

Thanks,
Olaf

--Sig_/zhdk1pmSVJ9su3FAnEtA_Mw
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCZGRteAAKCRBdQqD6ppg2
fod7AJ94xNQhydRMQazuKNN4F/jGW/FLMACfT/FPSPpkfpzDGoD/7XOxDdWHqUY=
=cvRE
-----END PGP SIGNATURE-----

--Sig_/zhdk1pmSVJ9su3FAnEtA_Mw--

