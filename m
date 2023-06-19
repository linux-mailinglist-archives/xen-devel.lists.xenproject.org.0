Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA67351C3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550966.860213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBwA-000430-T4; Mon, 19 Jun 2023 10:16:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550966.860213; Mon, 19 Jun 2023 10:16:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBwA-00040m-PB; Mon, 19 Jun 2023 10:16:42 +0000
Received: by outflank-mailman (input) for mailman id 550966;
 Mon, 19 Jun 2023 10:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jc0u=CH=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qBBw9-00040g-Al
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:16:41 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61a1eedd-0e8a-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 12:16:40 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5JAGdG6x
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 19 Jun 2023 12:16:39 +0200 (CEST)
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
X-Inumbo-ID: 61a1eedd-0e8a-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1687169799; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ur7HbKjwuUQ2ytcuBd8XgTOsMyJFR9Em1oGD4fTwCTdd8OCyH/j2SH5xz1XFD4O6kF
    VSPqo2W9ZIGT9EHjUmTuB0rEB7JFRcKMAChGbC+S7JnIzieNRlS7LKmhyFtRAuH2BeVb
    DL5MbQaCEKb8eNpbdjdriV9gIGmjXxxumDFVnApx0juoD7MDd2izrzaIFzqGKf/njWTs
    t+VBhJokbMqVNLBVt40GadAwJ2WzHIKMWft8Bfkd8QxAP/tpTpZ7phROUkEt/Q3317ey
    y9GhgustIM6qbdtCiW56iPYna4pUroQ85vLluEfZE+0/CbxXwkgSl3GXlZQ93YSeVYRH
    gxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1687169799;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=jobFpGhdV47ByKxj0J+rEBbMdDWwbgoitVOAgGSKQhg=;
    b=Pc9KfySQdYT9mfLDqqaeScdSc1Jzaaq0qJsVmm06A6ycmfRb+QMDL/wYHSHtoKHFyS
    Z9NmHbAfhO6OFTH+OxrlTS9ujVfkfIiwnDZS3/LAd6efLi9sWaT25YAizh+ApdPEVrHe
    7xDFS9MwsKVJ8SJelmz83FUQup5KYT4dd+QpUZKyxV5LyKbqZciZULZUrikwA0XajOhN
    Jr+Y/QzNwVgjs6bnM17zmOWn9j0cGga3ShFxXAC1kEBmSUzfury/qzkI7dIIx8lzCCaf
    6WXTXXcF9YgIBphAZxB122Y5+HI7HpYjmbK1jXIUYwIKUJ7WEN7yxJFjp+YtHSr/imlp
    N++Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1687169799;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=jobFpGhdV47ByKxj0J+rEBbMdDWwbgoitVOAgGSKQhg=;
    b=KvqVF/l+mO/AL2ulmZ53OhH3vW3IeJJ9J4y+8Yjing0TCxIl75Q8UezqeRTi6c9I7d
    62js6UZQrfHaM2aBA0as8fVjOTFQqfFOVPhiJCQTL1P701ofJmxTgIEJrremq3sBVmu6
    +zofoIGV2vVsNcbJBOISkfsvNLJdA62kcU/pF4KmfwexGI/xIKWay/zaMrSdqSlxCRD9
    Gbut/nIzY4e25BbAvagI9ntOioFm3+yFfkXpvGFJzQMsuustNtBqdcc9qXiEgG5nbZgN
    Y6m3S30aF4O1LwtHW8ZT+I4iLl7QmXDQlfv2neQU5XakrhYFjEJPmSnqapHuVZ55r/86
    ggpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1687169799;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=jobFpGhdV47ByKxj0J+rEBbMdDWwbgoitVOAgGSKQhg=;
    b=5YbaWutEAqEbpzgw8BhnrUBkprKK22Od2tkwkHD1gT8MQ90rUWZG58WTYpHMbJw3uU
    lkI7JHUz2adEG21iRHCg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Mon, 19 Jun 2023 12:16:36 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@cloud.com>, Jan Beulich
 <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Juergen Gross
 <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: xentrace buffer size, maxcpus and online cpus
Message-ID: <20230619121636.672c8cdd.olaf@aepfle.de>
In-Reply-To: <cab85336-c49f-8993-89ae-a7132c46c0d6@citrix.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
	<578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
	<20230530220613.4c4da5cc.olaf@aepfle.de>
	<1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
	<20230616134708.6b3c6964.olaf@aepfle.de>
	<b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
	<CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
	<20230616173717.3f264151.olaf@aepfle.de>
	<cab85336-c49f-8993-89ae-a7132c46c0d6@citrix.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KLXv2W_IabjEd5Jp=KE+oFh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/KLXv2W_IabjEd5Jp=KE+oFh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 16 Jun 2023 17:08:25 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> XENMEM_acquire_resource is a new mapping interface with far more sane
> semantics which, amongst other things, will work in PVH guests too.

Does that indicate xentrace will not work in a PVH dom0?

I will have a look how XENMEM_acquire_resource is used in other places.
The resulting change will likely be too intrusive for 4.18.


Olaf

--Sig_/KLXv2W_IabjEd5Jp=KE+oFh
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSQKwUACgkQ86SN7mm1
DoBcvw//VagZ1+K6o62s63PUx2AVtBOj4PLPjdvuxa8CAqVG02Y9Pb0uFcsehV96
nj0NubhComkD2icvh+u3Q/hW6nLySZwtWGU7gCVxOhxinIpvkS104ol0gMsEcfpN
A/L1Ev7ybtmIfu+cOZFJU9uRwG53thRN+wjbgSESJ8xl40oOJmRncn+fZ+Sr9Yzn
MeDf1D2ERI/l+UKdNEqwO4DIccZrX6vnZr+4FnOW9fTUm9rk2sQ5CCzztCxjsbUS
J+kX022XZwYKjwM+rPbH/9/RMjd+Nm61/cBk+gV9GgkC4xA6yi0BIOj9JDh/Z/DM
rbr1qY4pR3QrdEA5UJNZnYXcebaz/VSaBHvTMvvY9P2pOS1WhzaJhlrYM45j5T6z
2SU4ujHDBQzW59QySsEVpIOZBDOtKIRxUq04UcX6kFm/BUgcZeHDo7BQFCYlFWv/
n/OS6gydjUsRq5vQSkENeFKqZyARoCfzKw/GtjdexsQMGKTIG8TpgkPKZjYiOfv2
vESTyZKt4F4rsnH2dKgt/NIJ89qTZBY67vVTSwAKe6yMgvuHA04wmJmGh2t4lcJR
5MstG46xtV94iwPUgXJeWSBcWzmoLv8DeDOF1kwK+uXTiLErUwWNBw0SrCxJ8M2M
TICszNnbHMvxcE7CqqoFqzgWYu/5NsfQwDXaHcSoBfDNXDfcKgo=
=ORIo
-----END PGP SIGNATURE-----

--Sig_/KLXv2W_IabjEd5Jp=KE+oFh--

