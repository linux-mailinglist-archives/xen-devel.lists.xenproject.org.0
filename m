Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDDD3895AE
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 20:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130302.244159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljR9G-0006Qo-42; Wed, 19 May 2021 18:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130302.244159; Wed, 19 May 2021 18:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljR9F-0006NQ-VU; Wed, 19 May 2021 18:42:25 +0000
Received: by outflank-mailman (input) for mailman id 130302;
 Wed, 19 May 2021 18:42:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dLqQ=KO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ljR9D-0006NI-Qe
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 18:42:24 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35da6c87-dd7d-49df-ad4c-7f24c308a1bb;
 Wed, 19 May 2021 18:42:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.26.1 AUTH)
 with ESMTPSA id z0b24bx4JIgK004
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 19 May 2021 20:42:20 +0200 (CEST)
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
X-Inumbo-ID: 35da6c87-dd7d-49df-ad4c-7f24c308a1bb
ARC-Seal: i=1; a=rsa-sha256; t=1621449740; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lcSWtzXaOvxj7MsIKsdfDKez0Fy0ECtz6xe+e4GJ09zaUx8O118pSoixtArzkMMSy2
    FX858hzjj7cvNJ9aoMJlhZKtvel8NIXjzHQondWTHA8qQbdYvVScfzovttlOnB2vhhwy
    /iGbZkX5r2/HfE/SrhYqoPMLUb+k/cl5hLq+h+wj/F6XAzq9gI2R1SRlqGjOloUsmbXa
    n7WYsR57+Wg2WjVi8dh8PPHmD1FjDpnVNpsa/nG0/oRD4UqnGDkFAfRivM7aMryU6/Ra
    RsTOwUG3e4lzSMSttZJvdGvrhJrXENmQBtOW3v+Ykv41gyzQsb+g1fOnyPUZJgxcBjIH
    yr/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621449740;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=mCJ9nZZdYMufSz5UqlzFY4JHtrSF7XvaEMFLbphEo6o=;
    b=U+PuczWDnfE4bSGv9ZMZFGHXg0bTyJWsS3wFPV+Fb65eVHlLheyAWJ5H9sjGEXiXao
    TMDRYyIE9E3FLf2OLswbk/qkaFu5Nqu+MmxFiVnMrfkyN78XcdsPTyDBlBzBbHqDs3uu
    d0SKoPezzU0MTGwS4RGNacfYJ9lrjHPyhqAtZktBoJUJNBf6qaCJHwK+9DyuQbj8RFqL
    kCB/JtBW0nyYVR5p+EjVJXWzEXsQ3Isc9GtWg9QF3A36z1GjSgAPQRtTO24Gn9fGeaLW
    H2gybu5xfGexipzDeC811xZPPczzGHa0d5fQy46y99wHPis6/LCs6y2dM2ijLW6/bGZ3
    n9iA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621449740;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=mCJ9nZZdYMufSz5UqlzFY4JHtrSF7XvaEMFLbphEo6o=;
    b=b58mEcqHFuEe11s5RfkBkFxilYmI8YELhztA9HewVD+rBm8QG/HYQ9SL2rWtK5QOTp
    4DwBi6Rd8bIZvhRsbuW2/FuHatVqUnsg/+J1WfRQ0NtiQe2HN9Nr07fHqJ5tUehxK7Qn
    N/ZuTMQotDrsW27f1e1Tk2YuuUqakXCIecnmXJU0nUEdtx/xXceFQWxXDfoOK4qQxvYP
    DV+wGDqZRSVUOH90ZVc0ZCdsBY3cG27WPxdfZOr5/bF3ZMdXtCC1GFlh1SfppcVSFb4U
    AU7YKNNA1Rt3VdlibNkXM0yDRgbBKhqzDcmmIyJxoU+Pi72s2nSkdAZtCgY+8ft11s79
    gTiw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 19 May 2021 20:42:05 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210519204205.5bf59d51.olaf@aepfle.de>
In-Reply-To: <7abb3c8f-4a9b-700b-5c0c-dc6f42336eab@suse.com>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
	<7abb3c8f-4a9b-700b-5c0c-dc6f42336eab@suse.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KDp9mBry2JYq=FciRNN_/Dj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KDp9mBry2JYq=FciRNN_/Dj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 17 May 2021 12:54:02 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> x86/Xen: swap NX determination and GDT setup on BSP
>=20
> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
> For this to work when NX is not available, x86_configure_nx() needs to
> be called first.


Thanks. I tried this patch on-top of the SLE15-SP3 kernel branch.
Without the patch booting fails as reported.
With the patch the dom0 starts as expected.


Olaf

--Sig_/KDp9mBry2JYq=FciRNN_/Dj
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmClW/0ACgkQ86SN7mm1
DoCtrA//Yvc7TtGgzGuqFFkLaj4rD3zvgNWDhLF44/oFU23Ksxh7YoT5oaQSxiVy
JliWgplE11NiRv5RGZQ91T+s52Vaglk0DFhqKrBo35XPAauAuKraLlQ25W8VjSrr
80mehnsAuRzFexd9e7O1+gmUKz5TdW7Ys6MTn/L7zSVTQQaDdEOQtOdQfGHzkdfv
+L4EUA7x1XAvxIsd5VViATIZ2ieYAxLQE2ApgzppwowKSJki+V31QINMoPHPd3+P
A8OldTeygCfecWZNjELkuxULRPjTxCrbS9NIEZ6ubBEiRSMICnmafX73d9AcIrDh
XlSq6Wse7hH9R/+ZxlYeMZPQZI0kDEYyRrFE+5OK7WpWllDpm92XlbqvbtLBcbus
9h8qoYgDjJAgRhxWhhtBxyWuq6bfEQu+7GLA1YZeULSS29nKnCaasA9eMUdq3eA2
9ZQ3Ie+5jlAb2i2KQSIgr6XiD3gMALt6oDjX/bKrDkYFZZAjvbfFvDvkxvKYvmaM
6IhMGJBwIhRAlEQ2yS4B/VihvAoRxOJLzlnGrlvafvCbUD4bjYffstnXKhmQsc/L
TTthNL4j3l2sSdtG3sWqetQ16WMGva56Oq3LX746BQkiN3N6uy9k9/RT6JXAGXNm
G47AL5w/5kp6OWqnDJif+17b4QC1na6dMg1p0r+qqZ+EmC9DYao=
=oroi
-----END PGP SIGNATURE-----

--Sig_/KDp9mBry2JYq=FciRNN_/Dj--

