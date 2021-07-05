Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63203BB95F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 10:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149927.277288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0K1n-00024q-1C; Mon, 05 Jul 2021 08:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149927.277288; Mon, 05 Jul 2021 08:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0K1m-00022K-UC; Mon, 05 Jul 2021 08:32:30 +0000
Received: by outflank-mailman (input) for mailman id 149927;
 Mon, 05 Jul 2021 08:32:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0K1l-00022C-4C
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 08:32:29 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efc23c29-cedd-42a0-b1f2-035551992620;
 Mon, 05 Jul 2021 08:32:27 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx658WQKn9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 10:32:26 +0200 (CEST)
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
X-Inumbo-ID: efc23c29-cedd-42a0-b1f2-035551992620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625473946;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+WR0Grpii3a1Rkx/QcBQ9lUKVcEax2K181Wqa4C+VMY=;
    b=ttD72Er+ueuQ14qrQ3c3/2ebG3E56jVm+ILNdyULlz/996gq7G48fgg91aTScFHyL3
    5w1VR1YgtPfP20FyYX9GyGnuzATuplJBoASPcSELdQk7mHJJaRiPgTzscIxXlMuPa+Zg
    /64BmYW+fMm9LHpDF2JXyTrZBHEF4DUuCcAI/zXISj+/VsVdfiUD1CK+FXDjpqr0hEWv
    EreEsLKAHyH6ZiJHkEiFshhKXhxwAk/RyRiep+oDE1W7s5YDNhCLdxIvD9VzpMUnAs4z
    lEyllarSEFVZM0RzgHqspIkrLBcUokA1MR5IN4KL0qWmkB+2o9H1NT4eNNYA02sBOKDt
    A/0Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 10:32:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools/libxenguest: Fix migration's debug option
Message-ID: <20210705103224.26f3835d.olaf@aepfle.de>
In-Reply-To: <ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
References: <20210702190342.31319-1-andrew.cooper3@citrix.com>
	<06968742-355f-ad37-0681-e51eea256414@suse.com>
	<20210705100228.4947ed4e.olaf@aepfle.de>
	<ed3ceecf-239f-9bd9-e040-5246c9b49f53@suse.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_tSAvO78fL=Hc3r7J1Cc_lx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_tSAvO78fL=Hc3r7J1Cc_lx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 5 Jul 2021 10:23:00 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> I see. A similar problem then exists with at least the FIFO event
> channel per-vCPU control blocks?

I have not done any debugging how the pages differ and what they are actual=
ly used for.

My guess was that it might be activity from the backends, particularly netb=
ack. I found no API to query the usage of a page, so I declared the interfa=
ce broken..


Olaf

--Sig_/_tSAvO78fL=Hc3r7J1Cc_lx
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDiw5gACgkQ86SN7mm1
DoCpsw//cHJIb+i/s61t77mQZB5eToYHtekdEt6Kfj65jY2rKlI/akXkL0RHAHRA
ZQAfFvVg7E0N+FlQK1FXxbBugrZDaC+xiKDvZU/nV1Tx1F5iBGPgAlURk0cOK8YZ
J7amLS377pmHq3KcQNE2Pk+BhqAckWWO+SekgGSLiEGYMypKqgwstmqBG0Fa6DiJ
gdurZgBlHs0gWawUaF8XuQs92W1O1idiqckR5+Vl9aF9vZUqvn0SgZJtqNW7JVNQ
zGQkjJZ65sP57tSEelLGo98JxupoPbuSphZihQng71uPalCvZykxCPLMekfP6xKo
Eui5fjUrb8AgsA90p7xrG+4h/UVGc2MkOa33X6l/drAjbq2BBvwaJsjuSVWvRKVs
DkpWBoB2uynb/EQjmIR6dUDIT6UfO9RbwiOfzQhQbs214rT+R1DypQjCG2dXjaSV
Ll1KeUTF/baDA9pbQGOfdxKBaSG/p/fwAFPa5SAlqCzzf9+xUm40fA/lEau+/sTr
uERx1vHCQSsDs5q7TZQ+bJVrtcXVaou7PRPkvOLI6ONGrJ84nAjDFxCXKTu2nuGL
MUqb2ZBhcVEE5fJt2sKxrBUo6AVLviuDUORZnbwNikJ5YpG7audCJgx/wESZIMzN
/v/hFg0v8O+QHE7qY00PEjjvysZrjeiO6XL30hMeZ1D6R/sJW6Y=
=0ZiK
-----END PGP SIGNATURE-----

--Sig_/_tSAvO78fL=Hc3r7J1Cc_lx--

