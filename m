Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD7572FA20
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 12:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548670.856720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NR0-0002yk-Lp; Wed, 14 Jun 2023 10:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548670.856720; Wed, 14 Jun 2023 10:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9NR0-0002wH-Hk; Wed, 14 Jun 2023 10:09:02 +0000
Received: by outflank-mailman (input) for mailman id 548670;
 Wed, 14 Jun 2023 10:09:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RSaz=CC=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q9NQy-0002wB-Lf
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 10:09:00 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.218]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79f89808-0a9b-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 12:08:58 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z5EA8vl68
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 14 Jun 2023 12:08:57 +0200 (CEST)
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
X-Inumbo-ID: 79f89808-0a9b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686737337; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lZQkmG6gUo8dXBUvhQmzk2v7XhnqrNc/tA8RvjNaU/g9Dh25Y0FTkWSO+918cQkzez
    zDOg0XlZRv5WM2itWpaZuWfOIbAImhDcmpaIBfUVfW1QNRZJcdyV4yUh8BV6eLNqn5hA
    /MSx709TVhvPFC12I1ucgSNMPX98wRwPpx3t+IE0A9SeK63MwMG1r6verDXcO/CBflkQ
    Pin2Tirs+5r8OYyd0WANUVoASLPbZiFGLjumrguUeEyYF9mt7RQSWRZoBI+63983FRep
    Y6/8R0O/WVnKBUqDTQxuDpN/JkPolPg5S1EH7q71vneEeDURVFJp18GCB4UKKn27/wE7
    FD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686737337;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=6ZbBq/+/Mg97MaoGiiimJ71ZwYCPFfKpYvoi5JiMjb4=;
    b=ODqIa+NAV1oXvEFkni0G2gMQCsv0WxxJ2Tq+tGjpylgmyk6Y+hu56QnpwEKs5bmaom
    0n5NeCGRxdgjyMuhiZcsYbejiK/wX3u+fHFp+8iOD/m7MO1PDZl+FWh21ijChSq0DRvt
    N1NBTuWD4ayN15jdKRot/q+agNQ5appbND354QH5Qa4D4p6GVs2CyVGDpH73mGXlDYi3
    w7Tc8w2QWHllmDtaJ1LoT8EA5O5FuESDWw4l0Pg74D3vkav0/b6fPbLMDZY9RCZsEwUn
    N+AtIFowCFOnvvkxnj+ThrpCMo3xn9X5cflotsm72CgTi5yPfMGgN+ULfmiWokap/4bk
    wjjw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686737337;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=6ZbBq/+/Mg97MaoGiiimJ71ZwYCPFfKpYvoi5JiMjb4=;
    b=alWOBSOYzbWFnKRC6XFNhdHqh8G28TuPO/ZNcDEq10aKp/zR6zHDooPnPyaD7KFeD3
    F3zkB/h1xiItHweZpVbADK4Uem7+ggoHmLSzAGPZz3BREdTWw49vNh8TrgA8fNP1R6KI
    VrHT0e1D/JLOZ4hzqv/nFhiFqIVj4afrxW9/hQxIXaIvPFyN0OIYGLds/ZWafqxYqhUY
    9vZWdNEyrQ6zncctQrz/+3JD9b54tRzJNcjOJHcsrveEsKhEoY+qKtUkEIOSgUwONrbQ
    mIquAZ/MVm5x+sy2YIS3lvZav2ncD/ljTL3Z4+21bj58xyPDtcvDTSz4Cfv5/SWriDLd
    hXUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686737337;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=6ZbBq/+/Mg97MaoGiiimJ71ZwYCPFfKpYvoi5JiMjb4=;
    b=IqHbRNiW9iY4IPdEMCWmjKuMilg9aLio2atPS/mPe6AMGceLwimMf97LzQFRPaQT+i
    p+e3+cBAKSEVSRNs35AQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Wed, 14 Jun 2023 12:08:50 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: compat code lacks support for __attribute__
Message-ID: <20230614120850.6b4d0d32.olaf@aepfle.de>
In-Reply-To: <ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
References: <20230614104234.56835aa9.olaf@aepfle.de>
	<ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=_C11xtIT4EACuM9BnUMiT2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/=_C11xtIT4EACuM9BnUMiT2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 14 Jun 2023 11:49:35 +0200 Jan Beulich <jbeulich@suse.com>:

> So perhaps we could arrange for your additions to be excluded
> from the compat translation machinery?

Is there maybe a place for headers which are not public,
but which are visible for tools/ and xen/? I think the trace
functionality would be a candidate for such local shared headers.


Olaf

--Sig_/=_C11xtIT4EACuM9BnUMiT2
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSJkbIACgkQ86SN7mm1
DoC54A//aH/VXUGxvz3mGKJbyxw7nkl3ELyJNDfnBJKU9eb9jBVsmjkc2+Hgbub9
m+rcMV+bdLM5F66KssYNHiEBnyeg3f1zHGyUtnrXAuTiO4rsi63+afwGnrnZMY7n
G87TQePaczunN4mxZirh+cRMtPJelJA/QZINO3+VijrDUxrl0FrXtSGA3J/fZ68V
mWPdIf9/cZKWhK+18gmi7RwAB92J66rb9DPRRfY8UU9lmsNUWkpCuZS8jRPpB7WA
2FifzQTMWzf9oS5XDDPkIKo0KEByQzi8kr4yr5/568hUPPcK6TGxozUT+61G0bn7
ygEe7Ea8xA/Ocj/TZ8HzhTBaKXPFXVCury7OUxZ7aboHqU2aIy8r2cAM/e5i6l8e
kKeVSFEO/MVVqGDF4aOpI7dPLNOJexg/P9+3wArQCs5/lI/NiHCnfL0zL7dBfJZP
3GkfwBlIkzGqsY9DK/LI396OPnTyc5swfEgY9bAVvhywffN/O80d4OY045Vk0HYm
iAzP4EB4Go+C8IsWNr1LRRM3bsJWM+sNHntZK+g/30slg3xzsn0aSZUSasagkcE0
DTV7IVztPtGrv4MWqPiDNJRWpfLPu4SXC+UgsiFAvACBAYq7HBj4hUZSG/jTO2LP
vVyrXuxex2G+QTQuO69CX663Y2xxjMao3SSdSxxwF751TQ9tmNA=
=Nult
-----END PGP SIGNATURE-----

--Sig_/=_C11xtIT4EACuM9BnUMiT2--

