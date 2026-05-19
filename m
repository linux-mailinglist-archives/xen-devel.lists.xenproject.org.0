Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mByYJphoDGpXggUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:41:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19857FDE0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 15:41:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313034.1583220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKhU-0000mX-Bw; Tue, 19 May 2026 13:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313034.1583220; Tue, 19 May 2026 13:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPKhU-0000kk-8s; Tue, 19 May 2026 13:41:36 +0000
Received: by outflank-mailman (input) for mailman id 1313034;
 Tue, 19 May 2026 13:41:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wPKhS-0000ke-Iu
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 13:41:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPKhR-00CPgz-T9
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 15:41:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a0c687e-e002-0a2a0a5209dd-0a2a45058094-40
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:41:33 +0200
Received: from [202.12.124.146] (helo=fout-b3-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a0c688c-aaa8-0a2a45050019-ca0c7c92d093-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 15:41:33 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 0DE801D00136;
 Tue, 19 May 2026 09:41:31 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 19 May 2026 09:41:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 May 2026 09:41:30 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm3 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1779198091;
	 x=1779284491; bh=/lUE3qzJGWId7T2vKGtoCTDKSCMo76uWk1asDkItOAo=; b=
	FaqcnyAUHfzH3CtYMxjln9L8epJ3rnTBkVc0OaXwsCvHEOrZNgZJciWJaYFApETi
	+oukEewFaHv4GT78HGfqr9ZgJa4gHu4OjJJ1uSimhlPwiIKROkl1SOc3+0Zi5ZL8
	+a2wVg9tqp/xAHd3ITefAbhZfr7BBFDGgPfmZ2QW5ppfBSKPvJFY/U1Eh7X/e2NC
	7MBbz3e92jb3Qy7glQ0N6MoFCinvmDFEOtR1pMOafwGwzpOUvIrxA43/SsF/0lnQ
	ktblvCyLSH8T9jox6pWE1rUC6cfPEoCAuH2a56ng81KqhXCj/e0l2JS8EaCQFcwX
	B5XIUSSyaLPTcT/TLXcMmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1779198091; x=1779284491; bh=/lUE3qzJGWId7T2vKGtoCTDKSCMo76uWk1a
	sDkItOAo=; b=EL9gorARMmL3XTMydaFSAgbJ2dOUxzEmCR9AhB2xgKJzybQcSbV
	/7WdGepBw/vTXrjyP3tASpZszDKuL2J4U9r3h+BZ+DggXLJWR5rfk9J5r00LbMN+
	9eixWh7gBQeOX0Gf+QWo/xfJA9nU1KSiYT5X07Xoc95j2Kqw5NmGwqb/096nUoE9
	2Zm8j904dXmDEZ8mOmtZpGCgNtD26MbSWID5HYRtGJ6G4fxsVZUUSfA7k531RZil
	gzW1vRjOAGNK2l9DIAp6g5pXxa1BxXyLVF6AE5Kf4SJP3rS/Y5llNIhaSNyYBW6j
	5SZVjzGR1qAbrjAZkQ+Uf6LqnEDK5A+uWjw==
X-ME-Sender: <xms:i2gMau4T_wBPWfbatZHN9Z_Jq0q_2cr8VkJDzTb3s0-Xdq49qQ-MQQ>
    <xme:i2gMauw2GHdUUoDE-gmCyWanuBb2YsLvMkO-rFpafY423C3GVIOxkbji3bjAcEh2r
    yEe8K4DGah_0oyBNMVa6nBl2NlbuoEmcIeKFMOXSzRR3iDwqg>
X-ME-Received: <xmr:i2gMalz9SWORWZ8wsMvfQh8KRA-93iuIu1oH8FrNCO1p3jiAJt-e0GeaOFlRxn3EDuwqj_olgOBNK8EmOda8xBONMMetqjlRfv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeduledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprggttggvkhesihhnvhhishhisghlvght
    hhhinhhgshhlrggsrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtsh
    drgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghr
    thhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuh
    hsvgdrtghomhdprhgtphhtthhopeholhgvkhhsihhirdhkuhhrohgthhhkohesghhmrghi
    lhdrtghomh
X-ME-Proxy: <xmx:i2gMamyykp7z0GlZiPNdfkXEAordiO9H2-dsmYZRwPhEDxg5ZcboGg>
    <xmx:i2gMava8aKkRnDX1uX-jq3ZE2W-IeK0vUYNIB8yPkt96R23JTxWOyg>
    <xmx:i2gManXSIcb17ULgK-ydBOWbm_giXKB1lmB0mkQheFox0xE9JAESMw>
    <xmx:i2gMatgBkY_lRI2H7Q5Skhc1Su1Q_LU-olgaHw-vq3ApnYj4kXqxQg>
    <xmx:i2gMatKORHmh9hXMtebQKCIwqpLs0wUSSQcqwP0r_kCHEB4o15MHLazN>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 19 May 2026 15:41:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] EFI: Fix boot from a device without a file
 system
Message-ID: <agxoiG_JLs_84rY5@mail-itl>
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KMQcbhd7BCExKLra"
Content-Disposition: inline
In-Reply-To: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
X-purgate-ID: tlsNG-c201ff/1779198093-DAB68443-7162175B/0/0
X-purgate-type: clean
X-purgate-size: 4096
X-Spamd-Result: default: False [-1.28 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,apertussolutions.com,suse.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0A19857FDE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--KMQcbhd7BCExKLra
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 15:41:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Szymon =?utf-8?Q?Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.22] EFI: Fix boot from a device without a file
 system

On Tue, May 19, 2026 at 03:06:57PM +0200, Szymon Aceda=C5=84ski wrote:
> When netbooting a unified Xen kernel image (via GRUB chainloader),
> the resulting loaded_image->DeviceHandle does not support
> SIMPLE_FILE_SYSTEM_PROTOCOL.
>=20
> Instead of crashing via noreturn PrintErrMesg(), print a message
> via PrintStr() and return NULL from get_parent_handle().

It's worth noting this isn't the first instance of returning NULL from
get_parent_handle(). The return value is used only as an argument
to read_file() (sometimes indirectly), and if it gets to be called with
NULL, read_file() will terminate execution via PrintErrMesg(). But with
unified Xen image, the intention is to not call read_file() at all, only
read_section(), so tolerating get_parent_handle() failure in this case
is desired. Keeping the message in place will ease debugging if
read_file() will actually be called later.

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

As a side note, a slightly better approach would be to call
get_parent_handle() lazily (on the first call to read_file()?). But it's
a bigger change that I feel may be too late for in Xen 4.22.

Also, adding cc: Oleksii for release ack.

> Signed-off-by: Szymon Aceda=C5=84ski <accek@invisiblethingslab.com>
> ---
> Tested on Intel Lunar Lake laptop via PXE-loaded GRUB chainloading
> the unified image including Xen built from upstream staging. Without
> the patch the boot aborts with:
>=20
>   Couldn't obtain the File System Protocol Interface: ErrCode: 0x80000000=
00000003
>=20
> (EFI_UNSUPPORTED, per UEFI spec Appendix D). With the patch, dom0
> reaches login.
>=20
>  xen/common/efi/boot.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 9ea2183c0b..a6c3c371c6 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -471,6 +471,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(cons=
t EFI_LOADED_IMAGE *loaded_i
>          /* Get the file system interface. */
>          ret =3D efi_bs->HandleProtocol(loaded_image->DeviceHandle,
>                                       &fs_protocol, (void **)&fio);
> +        if ( ret =3D=3D EFI_UNSUPPORTED )
> +        {
> +            /*
> +             * The image could come from a device without a file system,
> +             * for example it could be a netbooted unified Xen kernel im=
age.
> +             */
> +            PrintStr(L"File System Protocol not supported on boot device=
\r\n");
> +            return NULL;
> +        }
>          if ( EFI_ERROR(ret) )
>              PrintErrMesg(L"Couldn't obtain the File System Protocol Inte=
rface",
>                           ret);
> --=20
> 2.53.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--KMQcbhd7BCExKLra
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmoMaIgACgkQ24/THMrX
1yzB8Af8Df9Pm7Jjg/ehsHDowBPmxPEyifkqDf+B3F7OMqvbaAGrVju3pxjmvpEY
HVosTs6gfY/UVIAqkjxgCz7xsniVVqtrfWeg03xsDOrEc2qgKwTYwnzGihutV5NP
JCjHE1DAiUi8nFzHlL17rCI3jboomHiDDoUCPAiMa7tsnzqNPi2FCU2GxUMvuNDB
iMyrBsTz1wscBGkZOw7um0tH8au4wT510jyfLppTd7tDwFaSLd4Z2/F3lVWjVFe0
0+mLAH5b6zIYyV/NHr69D3YyAzwqmOVXzMlq46NAf1Mk0fiqrmIJO6022rc5pc2S
sbG9vx7KRdbCuB32dF9cTRGo9+npPA==
=dZcW
-----END PGP SIGNATURE-----

--KMQcbhd7BCExKLra--

