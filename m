Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352C37F7F7
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 14:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126921.238504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhATI-0001J4-R3; Thu, 13 May 2021 12:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126921.238504; Thu, 13 May 2021 12:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhATI-0001Gx-MP; Thu, 13 May 2021 12:29:44 +0000
Received: by outflank-mailman (input) for mailman id 126921;
 Thu, 13 May 2021 12:29:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yjCE=KI=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lhATG-00010V-Le
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 12:29:43 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22519350-4ffb-4e1d-bf8a-d3ba812bffe0;
 Thu, 13 May 2021 12:29:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.8 AUTH)
 with ESMTPSA id N048d9x4DCTe45t
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 14:29:40 +0200 (CEST)
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
X-Inumbo-ID: 22519350-4ffb-4e1d-bf8a-d3ba812bffe0
ARC-Seal: i=1; a=rsa-sha256; t=1620908980; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bsVgK/K9AA+0p8mCjxaMXK+44UI15wLJqakXB46s33eAblVaz/sgNS8B582w9/rg1j
    Nt7zd2tLmCGSKT0/PEz2ow0gnYHuKC0oChb/vPiGa6W7n87+zn4fQslNbR7+yfG5GCe0
    GTYwBSt2EHA534DXMkD/sj8kZDm8CoR9To47sa7rmU/7JzzU8xIx7LdZGPpP+ngwUQbC
    8rmo+G5zDRwMBWn/QB5qfzSBwzqOLxS1XAhVztGO40B8J7nRWHV1nfmNGYvCoS/tCIwS
    vPOUiIPY8rfECiPIfDeo61J8FBeIf7fCGlXrYp1XUAQ7EwnMNAXaFZGZH7ILnHnyxIoZ
    y0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620908980;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=E+lnzI9vLJIrlIXAvC/adxVUcFTOqme0cw6DHBKZA6w=;
    b=q/F9IM+2/43x79eAY8UVC3DVdkrNj4lEAdqeO9dXU6M0z8+9QIwCMU437NUpERLUk0
    +auce2u5sGQTaYSNuqzSKffdD3c/6TXYoqKL+LPiC2fr0+A2HD2L2/wVHaquEFaxNy3H
    ndjyRFu8mYsCXD6KV6cEy0gtuHI76MRqIyDywnSEDKm4bu/UnNlvj7rKlVVlNnNaQuff
    aKwmNA2BNdXBeCa1WprL1QrjHOSxib4rZr+l1HWgNoeF0tEFtvCXD2dnoFCLkKIaPqtE
    k0IUsiB365hEd+o97MUkFn97SanndY7QRCm+u+AXfaz0nauWVba2yGFakeYlUrEHLqa8
    kspg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620908980;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=E+lnzI9vLJIrlIXAvC/adxVUcFTOqme0cw6DHBKZA6w=;
    b=C1KUIFM56wrKwfBzPggxsWCFHKgcdiN33cTa1TKDDC3ybTPTmehXfSvf7P59I+wEy7
    cKg69ozHTyk/K/jsAqHb/VTkWu/w67Mr3KElEtiO1A2l/oIfcHEtG9DM3NzO2ax52uJw
    Zl8dzsb9vMIe2uSD/MIVvSoKsKS2W2SZw+ilXgrGLDJOMt2UpKoBC8ZDzHrDGy0+h8g4
    xovbz7yPg7ELppKL4YKUjpUxydIZWvWsoHaPBfRW5Rfz2HqMrOiQE874Pd657DaIv+VS
    NPRFWoZJ/5sr0K/dbxo5QNk6dfLfQTZbFyLT5uZBorcjTeuMyE7mF+761jfdWLEuOZIC
    oYOA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF/Wx6Ea03sAi8O4Y0c9DLMc9kgmB2KMHkQZ2le"
X-RZG-CLASS-ID: mo00
Date: Thu, 13 May 2021 14:29:38 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: regression in recent pvops kernels, dom0 crashes early
Message-ID: <20210513142938.72320118.olaf@aepfle.de>
In-Reply-To: <378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
	<378acbb3-7bb0-6512-2e68-0a6999926811@citrix.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SeYi41kNcYzA0URP9hVw2Qw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SeYi41kNcYzA0URP9hVw2Qw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 May 2021 13:11:10 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> If I'm counting bits correctly, that is Xen rejecting the use of the NX
> bit, which is suspicious.

I tried 'dom0=3Dpvh,debug':

...
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) Running stub recovery selftests...
(XEN) Fixup #UD[0000]: ffff82d07fffe040 [ffff82d07fffe040] -> ffff82d040394=
a17
(XEN) Fixup #GP[0000]: ffff82d07fffe041 [ffff82d07fffe041] -> ffff82d040394=
a17
(XEN) Fixup #SS[0000]: ffff82d07fffe040 [ffff82d07fffe040] -> ffff82d040394=
a17
(XEN) Fixup #BP[0000]: ffff82d07fffe041 [ffff82d07fffe041] -> ffff82d040394=
a17
(XEN) HPET: 0 timers usable for broadcast (3 total)
(XEN) Warning: NX (Execute Disable) protection not active
(XEN) Dom0 has maximum 864 PIRQs
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Presently, iommu must be enabled for PVH hardware domain
(XEN) ****************************************
...

The other logs have:
(XEN) Warning: NX (Execute Disable) protection not active

Olaf

--Sig_/SeYi41kNcYzA0URP9hVw2Qw
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCdG7IACgkQ86SN7mm1
DoCWWBAAo4ovEFagVQ97/JHEDV+y1FHMrMtDVqptnTaIbb0JpWCen2nt8JfKhZ2G
9rH1bdjxNZSClMzEzkUR67nhcBotKNROumkadqZXlKv8/+BkH/YTZoI3aTyI0uKf
s525Pbi7swif6BvNt/O7ToPhaerP6KMA+s/Ii4MFaO67kFE3eA+wjmnLw8DS72gz
gt3cERjzeBqBlH7RwBxKoZGelIXhk1HpBsxW1Cf3ceozR6CEyQUAgGXMMA9JFJm3
oI7t+vCcoeoKBz8KNU/VH6rWbvMJbsYhqDHaPjg1SzinQOXoPzAeHiGMbmm87kRW
4O+13lwJzpUTW8ExXhb9x5EJfdzrGluJrYid1llMD7+2eyTKXjUbYBkR7yEjTVBN
CT+C6rmRb/+GvRGXrsnI5CmykwmGkCzikxMNwKNHSyvsPmJQXdM4ujorYPjLTtlg
471S8dV1o1J/3C6tNrca/A67mq8vt6X3tHN1k8Xazt1OXKGHXRspXButRCI94Z12
IT5UpLq/0Yg8okj/E2rYw5LUWGnf81PVnNAIzKu4AwZtr/qYpR5vE27qNz0m5xNU
C+BPTcfLLqE5xztZ41ropYbIeZNnDYl/9FhTk6MsNvXcQhegnQ2Dbw/h6vu6u0WQ
z/Pa3w8aOdsRki5ZsSJ2GlPHuG2OsM2X+XTp0TVaY1tBJuhY3nU=
=w4nh
-----END PGP SIGNATURE-----

--Sig_/SeYi41kNcYzA0URP9hVw2Qw--

