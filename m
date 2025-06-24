Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42DAE63BA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 13:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023604.1399596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU20L-0000zf-6Q; Tue, 24 Jun 2025 11:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023604.1399596; Tue, 24 Jun 2025 11:39:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU20L-0000xb-3X; Tue, 24 Jun 2025 11:39:57 +0000
Received: by outflank-mailman (input) for mailman id 1023604;
 Tue, 24 Jun 2025 11:39:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU20J-0000xP-80
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 11:39:55 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2123191-50ef-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 13:39:54 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 8AFA41380CCE;
 Tue, 24 Jun 2025 07:39:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 24 Jun 2025 07:39:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 07:39:52 -0400 (EDT)
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
X-Inumbo-ID: f2123191-50ef-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750765193;
	 x=1750851593; bh=NtCDtcotcSzRjElW0HpZk3b852V3YOCBDiESB2CuzXU=; b=
	XAdrWiGTmr8mEN0cGsaXR7YfX80QLDGh6Ki/GRMiXFCoulBJ2wIbnUX4LI3SFdDB
	30LrVqPlq88xh1LLScKmLQzjXPDSUDn5a6L1ynx7wMNeLSImxJi6VuhN5lMZ+2h8
	Dc3BkhhnszcdFsAuPj61cBd09dq4EY42wIjGwfWGuSfOfyRVPohQFAPtSZAlAftp
	uJJ26YDJXs5h5MNloXboc8M+Ek4HZpTmrq2jAX5dKwO1CCBrP89Fxu8HTS4JdM/V
	Wz/U9ORf1yKfhLLyahGd+ljQGZ8lnQdv39GKbl/+uYo6w3NdQgrmQRRpanHUXSSi
	X82IyZ05XzghRLwz0smiWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750765193; x=1750851593; bh=NtCDtcotcSzRjElW0HpZk3b852V3YOCBDiE
	SB2CuzXU=; b=hG9QTGHFGduG/jP2c6kKim0a25CMOyh6f7utgYDAvYUEUShjaR6
	BJq14PP/3QFQVcVtkKsgsdI9r3qzSI1K8LvViON1peAjUzwxTH1d+/yifF3o780d
	wo5byQag+YodgpFrwcJ7MpOgoDjhRKURWiW4+ecEoq8xlHtCEFNp6Z9iP6MycHLK
	vIunxqwSjIKtwdDP0kIky6WJxR33tSzsZkluXjUnVWGZqu1JptgxR6PDZhhIbHUm
	7c8W8zlxLUiLHw0eFF+oBLTPLHKBG2+XK6tQBL5T/KPpRF0GL1ja8PqOYp5Zgexa
	KIifi9rWD4m4Hk6YnKFxG/Dm7D+jPLM8C2g==
X-ME-Sender: <xms:iY5aaP68O2hAt_yrB-kTBBT1bqjslkDRXxUeAgO88c2oV22pWppokg>
    <xme:iY5aaE7IWdMbSyCmuo-NAAtPpDuLcyMwWpM3Jb4pzrLbPfI2q7eWN21qXC70VLFnO
    ao_Pye4Nlk-Fw>
X-ME-Received: <xmr:iY5aaGe1eOqmLREVkCGgVL293_v32oB43TokwcoxpQcZzob0pH23eSlbZlimwR3LgB67jgTBXvUqSARrwd2wuC4bmG3hwryOgCI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhs
    ohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homh
X-ME-Proxy: <xmx:iY5aaAIzNxocWkH8sOAtfUUVgZHw-j-ROAz_5azp3oaaAYO5bcKgmg>
    <xmx:iY5aaDJIcL9YcXv7FtBbr48KdTbKvrsda8ba1JgeRgbfiXOxwGaqdw>
    <xmx:iY5aaJxFqs5OK2FIBUHONn6idzoVzAz_-e2sq9gTvC0Om8esipRgeA>
    <xmx:iY5aaPJcd9-RTel4xV5aeHoAX7pNNPod3tsWLt6W7Uxdkpm6pUZong>
    <xmx:iY5aaA2lP4WA7Enc_qr0DyeWTD6GbURLRHXIFPFNAPtUYMxvR3CGeQXA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 13:39:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Show error message for EFI_INVALID_PARAMETER
 error
Message-ID: <aFqOhvUeGsWs042i@mail-itl>
References: <20250624063541.236691-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="swWOuFDa8Otvr5Rq"
Content-Disposition: inline
In-Reply-To: <20250624063541.236691-1-frediano.ziglio@cloud.com>


--swWOuFDa8Otvr5Rq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 13:39:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen/efi: Show error message for EFI_INVALID_PARAMETER
 error

On Tue, Jun 24, 2025 at 07:35:39AM +0100, Frediano Ziglio wrote:
> Show string message instead of code.
> This happened trying some different ways to boot Xen, specifically
> trying loading xen.efi using GRUB2 "linux" command.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/common/efi/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index fb3b120982..ded7cc129d 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -329,6 +329,9 @@ static void __init PrintErrMesg(const CHAR16 *mesg, E=
FI_STATUS ErrCode)
>      case EFI_BUFFER_TOO_SMALL:
>          mesg =3D L"Buffer too small";
>          break;
> +    case EFI_INVALID_PARAMETER:
> +        mesg =3D L"Invalid parameter";
> +        break;
>      default:
>          PrintErr(L"ErrCode: ");
>          DisplayUint(ErrCode, 0);
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--swWOuFDa8Otvr5Rq
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhajoYACgkQ24/THMrX
1ywRSwf/bickcyO95ZolVxli1cu5IDly0kAfRdXXVlNW7UfrXDNNcjs6ipcBlfe4
qsnvUqtXyRrmN11eJShIVT40vmmKogjGZ7fuH7quFxHC8ifF5KIxefMCAkDWfI8i
h+4OQhoZuLBUgPK7runb+jIj+NIGrsglC+6jjsan82vRlgYBvsNkxddFj6SiEMJP
r23Iep+H7yqWDhR7MOpLoLZa+SmFzwXetNezjZXdMlDczCcAHQPxevxFDru5F0VC
cSFIGSbFhyc6aqpX4s9s7VZOiWr6Ad9+ElOh5UCZ0ZVEa0VwvvavH9yRFV3IiEMd
HB6s+7JpQGIf7Z7jez3BVMuF8HvAyA==
=l9Ut
-----END PGP SIGNATURE-----

--swWOuFDa8Otvr5Rq--

