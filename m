Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316E3992955
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:36:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811864.1224594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl65-0004tf-TP; Mon, 07 Oct 2024 10:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811864.1224594; Mon, 07 Oct 2024 10:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxl65-0004qn-Pu; Mon, 07 Oct 2024 10:36:13 +0000
Received: by outflank-mailman (input) for mailman id 811864;
 Mon, 07 Oct 2024 10:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yj4Z=RD=syndicat.com=nd@srs-se1.protection.inumbo.net>)
 id 1sxl0g-00031M-Pm
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:30:39 +0000
Received: from mail.syndicat.com (mail.syndicat.com [62.146.89.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30b5e5f1-8497-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 12:30:36 +0200 (CEST)
Received: from localhost.syndicat.com ([127.0.0.1]:62311 helo=localhost)
 by mail.syndicat.com with esmtp (Syndicat PostHamster 12.2 4.96.1)
 (envelope-from <nd@syndicat.com>) id 1sxkzy-0002o3-0X;
 Mon, 07 Oct 2024 12:29:54 +0200
Received: from mail.syndicat.com ([127.0.0.1])
 by localhost (mail.syndicat.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8PNeOnJl_IF; Mon,  7 Oct 2024 12:29:53 +0200 (CEST)
Received: from [62.89.4.53] (port=62965 helo=gongov.localnet)
 by mail.syndicat.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Syndicat PostHamster 12.2 4.96.1) (envelope-from <nd@syndicat.com>)
 id 1sxkzx-0007Je-1p; Mon, 07 Oct 2024 12:29:53 +0200
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
X-Inumbo-ID: 30b5e5f1-8497-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=syndicat.com; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:Reply-To:To:From:Sender:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EAprCz2Gwkm9+pncvZr2IJ9AQor7OnWEiPmOKypE4qM=; b=q80ZG8feEmafqmtw50AGULQgzC
	IwN3tCOeXvM5hn1fH50Ucu4L6mzmZIoDlIrYPC0yiQNideCrU3IdTqYtQ50ikYSSj0bTzM7voe/9D
	BYz1SC6qdLx8BGQJUAgxcfKWBkMnJ8JNITx6w3PL5lejmIZKo+Sb5KSRO4s7wBs5YoSE=;
X-Virus-Scanned: amavisd-new at syndicat.com
From: Niels Dettenbach <nd@syndicat.com>
To: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Reply-To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/1] x86: SMP broken on Xen PV DomU since 6.9
Date: Mon, 07 Oct 2024 12:29:46 +0200
Message-ID: <3635258.LM0AJKV5NW@gongov>
Organization: Syndicat IT&Internet
Disposition-Notification-To:
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <45f3a10c-8695-42cb-abb8-8c13ce1a476b@suse.com>
References:
 <2210883.Icojqenx9y@gongov> <864022534.0ifERbkFSE@gongov>
 <45f3a10c-8695-42cb-abb8-8c13ce1a476b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart16948470.geO5KgaWL5";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Report-Abuse-To: abuse@syndicat.com (see https://www.syndicat.com/kontakt/kontakte/)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - mail.syndicat.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Sender Address Domain - syndicat.com

--nextPart16948470.geO5KgaWL5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Niels Dettenbach <nd@syndicat.com>
To: x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Reply-To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH 1/1] x86: SMP broken on Xen PV DomU since 6.9
Date: Mon, 07 Oct 2024 12:29:46 +0200
Message-ID: <3635258.LM0AJKV5NW@gongov>
Organization: Syndicat IT&Internet
In-Reply-To: <45f3a10c-8695-42cb-abb8-8c13ce1a476b@suse.com>
MIME-Version: 1.0

Am Freitag, 4. Oktober 2024, 12:29:57  schrieb J=C3=BCrgen Gro=C3=9F:
> On 04.10.24 12:05, Niels Dettenbach wrote:
>=20
> > Virtual machines under Xen Hypervisor (DomU) running in Xen PV mode use
> > a
> > special, nonstandard synthetized CPU topology which "just works" under
> > kernels 6.9.x while newer kernels wrongly assuming a "crash kernel" and
> > disable SMP (reducing to one CPU core) because the newer topology
> > implementation produces a wrong error "[Firmware Bug]: APIC enumeration
> > order not specification compliant" after new topology checks which are
> > improper for Xen PV platform. As a result, the kernel disables SMP and
> > activates just one CPU core within the PV DomU "VM" (DomU in PV mode).
> >=20
> > The patch disables the regarding checks if it is running in Xen PV
> > mode (only) and bring back SMP / all CPUs as in the past to such DomU
> > VMs. The Xen subsystem takes care of the proper interaction between
> > "guest" (DomU) and the "host" (Dom0).
> >=20
> > Signed-off-by: Niels Dettenbach <nd@syndicat.com>
>=20
>=20
> Does the attached patch instead of yours help?
>=20
> Compile tested only.


it does =C3=9F)))


domU:
=2D- snip --
vcpus=3D6
cpu=3D"12,13,14,15,23,24"
=2D- snap --


=2D- snip --
[    0.500458] cpu 0 spinlock event irq 1
[    0.500485] VPMU disabled by hypervisor.
[    0.501273] Performance Events: unsupported p6 CPU model 62 no PMU drive=
r, software events only.
[    0.501304] signal: max sigframe size: 1776
[    0.501410] rcu: Hierarchical SRCU implementation.
[    0.501428] rcu:     Max phase no-delay instances is 400.
[    0.502032] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.502309] smp: Bringing up secondary CPUs ...
[    0.502759] installing Xen timer for CPU 2
[    0.503384] installing Xen timer for CPU 4
[    0.503838] cpu 2 spinlock event irq 16
[    0.503870] cpu 4 spinlock event irq 17
[    0.504867] installing Xen timer for CPU 1
[    0.505495] installing Xen timer for CPU 3
[    0.506125] installing Xen timer for CPU 5
[    0.506363] cpu 1 spinlock event irq 33
[    0.507869] cpu 3 spinlock event irq 34
[    0.507901] cpu 5 spinlock event irq 35
[    0.507923] smp: Brought up 1 node, 6 CPUs
=2D- snap --



thank you very much!


niels.


--nextPart16948470.geO5KgaWL5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEen+3H2N8RDyGzUZnDbtaiEWSKkQFAmcDuBoACgkQDbtaiEWS
KkQnsg/+KCqd6M8AuOs1taM3LOothfBX+XvsqupFVM3+d6q88qITNequbF+q5ktV
QfVFy5i3GcIah1mx4cXMEBGipYczDEHQ9qQg2WnyRkgXBstPByztA2N47h7EyzXd
UcEDcApFiuonMxVV6r5/j01OIRAmk7zLrJzDpzUkh6ybJV4rpj+b+rabboHS1wA3
G5xmRCSZVGXQaxAKWUzt2IL/NEd0/36JvZgMukolf5Dj9Mbe8Uy7EhGxTCTUCQyO
kbfb7kd/HVdW4+tFXAU+U18Lvmg/cKt0ECdv/Adj+8ZYBfAgAJyWglQIgGlozHCm
OYPjBIEQe4KdODFg8xFa4Z4gQbEsfB1tZekj/rzMk54iHX71DYPNjCD9Mdk3+W1K
EUtOnLDZuLklbNfr6fE2NLcClVG4BeaFAj4xwY4o7YxCz0KUlvJkX6wdHGojCu+F
kvBIXDLu/0Kvor1mPSlsnWZ0No+pq1MsiRgXeLGhVW08wO4RQD9ZZAu/KEsjkZK+
tw3jTazLcfxsJlh5zAK/toG0ST9HNac5AJ1BYjFKW6+wbVNIjlAkCAB/MLIaTmq4
da0881C3+yYlk0aJMGSxqTW7S9hvECHsWoFak+6E/vy1pvYqJDrkAflYPufsVpjv
RNo2XOKfCztP2oSOypiQJSdvl+9NwXWhbJvwc1m7HNWFHYU5xJQ=
=WEKw
-----END PGP SIGNATURE-----

--nextPart16948470.geO5KgaWL5--




