Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FE570446B
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 06:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534931.832436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pymlv-0001vW-WF; Tue, 16 May 2023 04:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534931.832436; Tue, 16 May 2023 04:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pymlv-0001sx-TO; Tue, 16 May 2023 04:58:51 +0000
Received: by outflank-mailman (input) for mailman id 534931;
 Tue, 16 May 2023 04:58:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkax=BF=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pymlu-0001sq-Rq
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 04:58:50 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57e315cf-f3a6-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 06:58:48 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4G4wiUdO
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 May 2023 06:58:44 +0200 (CEST)
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
X-Inumbo-ID: 57e315cf-f3a6-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1684213124; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Zfi/ViYUh7QEX+xwRaAhpimpO6XEG5mN/ldVXuBH1bjHChXfPEiR0NATBRjCGVMhsQ
    zQPqUoTK+83rKPku96RM7dzNyBxNUCNYKmOPU/25h7dwgCCF58awf5hJRD9cXKBljdTZ
    vhxNQC5F6un3E9saNODRNTxFclOLyZLCifl66qWNEAukIegeWaQ71YBU4SptxFjKolXQ
    Tb4tpAe9kc/fRLqJNci4KIeVtJV/xusmgSwTN+DAe91OOaTNBb5rNT/wxkVgjhy8fTcv
    IpMq9PbLhF90gJiBEkdlcuJ2QzMgiTQ38m9qNpgIplrHndKkZAH+jJjFdZDe7zRy2pog
    DXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684213124;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=URSaZjGgI9AxRR8qLgzMYVr4Gnu0X7An01qLZ5Mtnjc=;
    b=nWKjvMJMV3Kv2pIbmN/MD/Z0zYE1XES7HZUM3VFb6bDk/DHRqmMurzlqSK9jRsyXeA
    RW+UpBtQVFpRCJN8Yh9VvRaMGU2Wy5lUzZWYv4X/4Qmr8w7Oo9JQfszOka08WsrZNpYb
    u8U5v2UczsRwfwjhQAJY5H3DXgbVi/6bO7IuSLqkYH7HhMFQwrtCViN33Msen/u4FGzI
    atqwf9ZBovKZ+d64iWHoYD90+VtgsBEUuiBVgcEJTSPyenbTPygnJ5jhOtnoTHlSp9af
    Nb7XHV3T74NALePMs+uodRNN37dtAiNYybWevvBOzfW+erBtpFRobKeDGGn6iRhqXw+O
    jZcg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684213124;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=URSaZjGgI9AxRR8qLgzMYVr4Gnu0X7An01qLZ5Mtnjc=;
    b=EtNP7YUkF2xBECy/+6VY+slzsAzB/r0LtbsLhvkyXN2Ur+i05KGXowwqmnC3/UwkOL
    hKDM2miTiTg/UlG43sKpHdc43CyD9nP3tCFKgHDRC0EWjyNw/312rGQ7ykD5+HmuEiqa
    rKpOLEK3n7ZGjnwzLPFZVTriIqurRPtIwFeHxmlLNahbpkeG9TH7uxHRwP4ccov96K5Y
    FplAHJRB40p+sycLJn2fTQxNOfwH+RoOOAmW2dK+kCpIIjE8LBm64TPOsay+xttvWmTc
    TJW6QJBsZ0+ROBNZVV5TwehvjFRiyjz43haJN44DurlHoKBeDQ0mkA+b13IDu1p+wXp9
    QWYQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684213124;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=URSaZjGgI9AxRR8qLgzMYVr4Gnu0X7An01qLZ5Mtnjc=;
    b=wmKryQiQ1OdQMWA8MHlrpFs9n0Wdi/VKh7D2rBTbKWOWYq7pc4pcRjtK3bJIcI5hOh
    cJul8aStJHQth2TYx/AA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX/0jCNVp4ivfSTHw=="
Date: Tue, 16 May 2023 04:58:35 +0000
From: Olaf Hering <olaf@aepfle.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: provide example for downloading an
 existing container
Message-ID: <20230516045835.2d210b75@sender>
In-Reply-To: <alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop>
References: <20230502201444.6532-1-olaf@aepfle.de>
	<alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop>
X-Mailer: Claws Mail 2023.04.19 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CjG_5.zCCO7l6_CoMBEX3Ke";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--Sig_/CjG_5.zCCO7l6_CoMBEX3Ke
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 15 May 2023 16:03:01 -0700 (PDT)
schrieb Stefano Stabellini <sstabellini@kernel.org>:

> Given that opensuse-tumbleweed is still broken (doesn't complete the
> Xen build successfully) even after these patches, I suggest we use a
> different example?

For some reason it succeeded for me locally.
Does it fail for you as well if you run it locally?

Olaf

--Sig_/CjG_5.zCCO7l6_CoMBEX3Ke
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCZGMNewAKCRBdQqD6ppg2
fncLAJ0eL/AEakEKXBmosjXalNMInOtprwCeKogMNdk9BsU0BhkBCzs9lp9ob3Q=
=NvNJ
-----END PGP SIGNATURE-----

--Sig_/CjG_5.zCCO7l6_CoMBEX3Ke--

