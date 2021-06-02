Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FB639817A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135474.251638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKlb-0006iN-ID; Wed, 02 Jun 2021 06:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135474.251638; Wed, 02 Jun 2021 06:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKlb-0006gW-Dp; Wed, 02 Jun 2021 06:54:15 +0000
Received: by outflank-mailman (input) for mailman id 135474;
 Wed, 02 Jun 2021 06:54:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NSCb=K4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1loKlZ-0006gQ-SY
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:54:13 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5333d106-1e67-4d36-b760-56d5b5ea03cf;
 Wed, 02 Jun 2021 06:54:13 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx526sB2iS
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 2 Jun 2021 08:54:11 +0200 (CEST)
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
X-Inumbo-ID: 5333d106-1e67-4d36-b760-56d5b5ea03cf
ARC-Seal: i=1; a=rsa-sha256; t=1622616851; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=GYgEK4BjILMs4T3k6AItl94teUt7xghrRo0VT9ZzejfYnSphkc/000QdnBQ2sfkO5r
    /WBtGdRMhoSpiC4vNStR+HFLiZUu/wQcxD05pQ75egvVCgcnK9uJI4O1FX2P36+Lks/j
    0iKFU9lQkiuR1GUCjGPuulkjI6zEQEXPb4bhMHGVznMP0a13Z8U7RQoOcAWaU8z5Rwfj
    1ldI/El9Ll/TFERAaYlYIhDgQ3k7h4HAqMcs9o5OPTImCAzN08Y0Id0LTOgbl/Iv/riN
    jRl6nfrDxBsOl0pV/kMc1EGePykOEhZUDMcTkVXhmJWfLIMm7W65g7UA6XfJWPhXJGZV
    sWKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622616851;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=p+1jTP3Fbi/pzfCLcmpYURwnECSrVl4NZeWhW9VjnTA=;
    b=Lw8qGXueUngHCg9Z/tSRZ4XLEv02CZVm4hpvoz2hRgl8M6FyC/JBNXFLefyH9mKQU8
    GeNMC3CE5mzck9Q7RzPgqB+9u0CIC2Lfvl4r6rYWvzW5TE/vExodKl4OCG0jL9HZSD4B
    eVhdkoy0USkaymAYgkLYbMSRBDoiV9uMNW0I9Lwa8vIeNj14lv0AXFIwyYfS4n3D77Dg
    Ukg7/IxJY3sHwCeBUPRDF1cJbgcm7UpeWMyTbqt5IzH1y3GJtvT/hNYAhQ7B15yaeQV4
    hqaE2asGiU9fG5RSUXPh/Ncw7Prj+v4Dk7rtJ3MCc9QUYiNkF+NR/OVUz5Xz0zivOsBt
    X63g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622616851;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=p+1jTP3Fbi/pzfCLcmpYURwnECSrVl4NZeWhW9VjnTA=;
    b=br+7EQ/4zCkRe2f06RHEHTj+EBN+QujDEBVEsWx3BsLP1ZiPqWVhK/pOUCrwkeUKfU
    +B78I7AxKUEtX20RbbjHhIH54Pum2GtH78I0M5fy/7QHirq9HN2+W87OLpTdak8DN8E2
    fJCp+cmG3nONh0lno5LSigbJ0Sxhp6G5JGVV4Dzq460YaZyrkW/3zexH5m86rxzPVx97
    ug7c4efvoSmKO9qrchSy8O78QObf8ITsI0G+uYsb2Zpbwn/W0bjnhh6s8GS6Sm3R8idq
    GklB4Hz5j4AfIML050PCdblBF72uFx9oMuNj/9pLPjYVAyet+dYr97/2Zwwv8Vf1z/oS
    xgyQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF9Wx7WbE3s+BU2kLCYUBd7t4vRd/ulzKn4R+Wk"
X-RZG-CLASS-ID: mo00
Date: Wed, 2 Jun 2021 08:54:03 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v20210601 00/38] leftover from 2020
Message-ID: <20210602085403.40064aed.olaf@aepfle.de>
In-Reply-To: <24670339-c080-7e47-c2a8-22c22f7a719e@suse.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
	<24670339-c080-7e47-c2a8-22c22f7a719e@suse.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FO=8H/H/=4J2GRdLzOdXjkb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FO=8H/H/=4J2GRdLzOdXjkb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 2 Jun 2021 08:10:21 +0200
schrieb Juergen Gross <jgross@suse.com>:

> Would it be possible to split this into multiple independent
> patches/series?

Sure, I can send each individual part that was already sent over and over a=
gain.


Olaf

--Sig_/FO=8H/H/=4J2GRdLzOdXjkb
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmC3KwwACgkQ86SN7mm1
DoAoww/8CoWvgrgmVmYBlkyXBcE5y/g6tsZEExaRIOgPlRYXUA9BouNQbejFlJi7
qpRQayZDoTdXLg/q4/DVtioOG+pXR1im83fcc5N0d4JA1wlyaieBX/rwD8bZSZKm
+WUByhWcp8QMpL8IG6PqmUYCYK0+W99XToF1wgT/amz2FFcMHuejEEx+DCDdshpL
Fyj8JSQebiiCgZID+vpJouxfFHjqpFnBL+2X/xUmNY/XhssmJMGwxS1loY9hhPRO
qOyC8+5UWbIoE99ylDcCgagsUR/saOUnGWSAMJYY4x6llCgjEYs+1CyPSZPdqgkZ
1Tqs28oefLrHSjC6siMvXbB8gfftTNsHOyy8OFfofO3GOm3NmECQY0tXGehSHVVB
yhXSQBB1aTpneU6oKqVet11As+V7zzxIS+AUVA/K8wvhx9Qg1Ck0GkUOYxAGL3v1
ChZcpZpLFvIXlJJej4o5ol4FyO3NiPAnz3fXFwFLU/1nq4g3sOFLI2V/oIeO1sn9
VMB7Ytdw7fZdlAqtqaufoQffod7DzHuFQDQt88Bol70lrjGUluniQeHFkyXkC706
RVSHJpqdVGSRJoiHSyx5h/FJ68O8ECtZEB1gxAFE6HbTK14X6dh8U1o1I88VHos4
gwaGMChEGJG9mUwwMw7L0X7RDz9naaKJpS8bUFQ78Nm+2MwvxG8=
=kg1n
-----END PGP SIGNATURE-----

--Sig_/FO=8H/H/=4J2GRdLzOdXjkb--

