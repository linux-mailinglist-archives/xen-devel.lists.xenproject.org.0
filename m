Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7D72C380
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:53:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547086.854294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g6I-00037X-AE; Mon, 12 Jun 2023 11:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547086.854294; Mon, 12 Jun 2023 11:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8g6I-00035C-7C; Mon, 12 Jun 2023 11:52:46 +0000
Received: by outflank-mailman (input) for mailman id 547086;
 Mon, 12 Jun 2023 11:52:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f5dG=CA=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1q8g6G-000356-8k
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:52:44 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a38b3d80-0917-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:52:43 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.5.3 AUTH)
 with ESMTPSA id L38909z5CBqXcBB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 12 Jun 2023 13:52:33 +0200 (CEST)
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
X-Inumbo-ID: a38b3d80-0917-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1686570753; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MIEW7J+zwjKt/bEOzYVsv5GLJX/5hnJo9TRL+7PjxJsNmT68IGTXjgkYYJwEICvP40
    Uqk/ss28rlE6qWuiHObGzGV6++6BTxkJihjlg6/yJNmlWwLQHnKPtUlgDJogYTyR8V2I
    mk3uNcr2FRQ32WmEULhKkTweAuZ/qZ65sOkZgtrSSza89LKdriYKMQ96Gc4M1foAnJ/B
    3/cqCio2xN7ojdHMSr1XmesySad1gCz9OkOO9K7dvKgNc7p1uae7O7uIXL7/RsU7ekUG
    icBpRBPS5OT6K8h+mHpygQkENFrYhoJtL9df0OwQO0r71vAzPlzNPbh4Gws8XE5tyzRk
    Ccnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686570753;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=O76z9zijWopISnAwDvyX3ASVM1MoLBXtnk2mYRUu30I=;
    b=Es2mBf/yhiYB2U0kzzuMRFiLGNTGvXU7M9mWSnPjRx5rjRA/JUvlutFG0erEbBLKdY
    TaS/AwtYwzAje1ZTXs0lvH5naMJfyxXzlMDd91fW4tO53Af1mOMU2UvNObluBS3kEYxx
    26TF+qpXJQL6jJ9Sj0eDiYDtX7DI5szn3fjaP3+dFcSNMynOo2mRHvN9447WWM4Pb4Tn
    ErZF2Aia5jk42NsDdOZ172nvp9JD08dp0Q82ORjfO8305DS1p+7VZjcbaUlUhUY3iQrL
    fg8RRd8xiAiI1TKXpfwCo/h6NT1B/8G9VPOOffwxoS5MezZbyIrZEtB2Hat40b78T+T2
    eYdg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686570753;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=O76z9zijWopISnAwDvyX3ASVM1MoLBXtnk2mYRUu30I=;
    b=m5AnqutTe7n94ccs5wKM8NiCNzMQe+O2R5XVctjJcPl0pb1ihOsSq+wS2C3E2OvJji
    DHp27U+unnDFqUH8WkwLmfyZvM0iyRM084jL50+Gx5HjwHrfuDtzOJ76V6rBmzPvSmFn
    sPxb4hRm3O4c95+++phyUfBjk1e8F62e9Kje09frfwfYv42X1HHxAmbd4jiut9Q8Sger
    4g0P7Gn2AGyR+3LQQe2C+xgQarw4D8mtH5ZbdPab3C0HOAcPHCLxFNkf1It9rnJnIMIi
    fl+eMJIZJzR9Yb6mTWMWtZW0d7CL1Kt3tO31NxfZ9xRgSo+rUtXSjpYj8uMuZoWooIX8
    A++g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686570753;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=O76z9zijWopISnAwDvyX3ASVM1MoLBXtnk2mYRUu30I=;
    b=GyOcHwmqR7WBWgb/8y0zClsteINDU0iTSFGXr33eGpLw1ZS4yIg9hT85G1VHyt/YZ5
    G1JGc5G76UhzShzKjmAA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Mon, 12 Jun 2023 13:52:26 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v1] tools: fix make rpmball
Message-ID: <20230612135226.0190f2e3.olaf@aepfle.de>
In-Reply-To: <8eb549c7-be3a-a41b-bee0-4cc6d39e7aa7@suse.com>
References: <20230530111807.6521-1-olaf@aepfle.de>
	<6734a258-3396-4641-b9bf-edf6193a8095@perard>
	<20230612133545.1318ce98.olaf@aepfle.de>
	<8eb549c7-be3a-a41b-bee0-4cc6d39e7aa7@suse.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N_1SvDKnGZbwDLQ5F7YrfjY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/N_1SvDKnGZbwDLQ5F7YrfjY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 12 Jun 2023 13:44:34 +0200 Jan Beulich <jbeulich@suse.com>:

> On 12.06.2023 13:35, Olaf Hering wrote:
> > I will send v2 without these two lines. =20
> I'd be fine dropping them while committing.

Another cosmetic change in such v2 would be the usage of | instead of @
in the last sed call, for consistency with the other three earlier sed
calls. I think it was a result of copy&paste from elsewhere.


Olaf

--Sig_/N_1SvDKnGZbwDLQ5F7YrfjY
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSHBvoACgkQ86SN7mm1
DoDAthAAj1DB5SHOGjIO932XO7RL6RvApFW3QKQg6OP9c0WheFNtN/QP56lSviWw
xPh2YcFk4u4uAjZIS5g6xskK61jVU283i6aBNYkKNQI8y3f1M7Oo/ptzlyd2JvRo
7SEnFSdD1Op3Aa9pQ2Uwh9cdC5F5Ep8I3TmYsOKUt8H33tJRTdEvVEgqlpkg/Fca
ohNeDna+b4eXtqhRNwNBWfojLQW0LnpQh85kEojagTCEDrP1XYqb0DqFW7i5Jnq/
wfXJPTRHo+hY3mFqQ6cn6daPmtnXmOPrT053WDNQfVycmrP50wR5hhZ4+h48clgB
PGwYztgYuXoxkYw1e4MPAYLFB75+8P6LsksqLSaGJBkmvIpkJZW/SefzNLiO/+IJ
s2rghQvz2+yqI4qkq2AgTFNCnG7LtzM/KjIf7i6w6hNzwfSfHU6RD2B5ziPur9Hi
mxMagB5gXbSgXDmGN8UlFK+g/N9ltgG2FX2xNPni1SnEsC79ZG4gdsCXB307SnuK
HLseWKWP+eNCu1PA7B346d2Lbs8s5M84vc5i3sV7C7pxMkILgu3h814SR2ugiXqR
IM9eeFk2zLxP7MZcAL4yC/LlqBnLSFsj8nUerxv+reMLOvM/yh7Afdr8hnRtQu1q
NayuNiWKfrqwkf5kbV7sKRYkHdTVZkdt5FDJbGmtZR6LI8pmRFE=
=dOX2
-----END PGP SIGNATURE-----

--Sig_/N_1SvDKnGZbwDLQ5F7YrfjY--

