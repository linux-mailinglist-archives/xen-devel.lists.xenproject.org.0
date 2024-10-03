Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D134A98F880
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 23:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809873.1222442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swT1K-0002qg-8D; Thu, 03 Oct 2024 21:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809873.1222442; Thu, 03 Oct 2024 21:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swT1K-0002oo-5C; Thu, 03 Oct 2024 21:05:58 +0000
Received: by outflank-mailman (input) for mailman id 809873;
 Thu, 03 Oct 2024 21:05:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GA31=Q7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1swT1I-0002oi-23
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 21:05:56 +0000
Received: from fout-a6-smtp.messagingengine.com
 (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45fcfa82-81cb-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 23:05:53 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id DB68E138020C;
 Thu,  3 Oct 2024 17:05:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 03 Oct 2024 17:05:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Oct 2024 17:05:50 -0400 (EDT)
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
X-Inumbo-ID: 45fcfa82-81cb-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727989551;
	 x=1728075951; bh=c+5OFLAKLeaXi4xTAdxu+JI5KfktZfkvOoDYH4SZxVY=; b=
	K80+St/LtZp9TftIYxGUNNlj+MW7D8oR6xsIa3u1q6CLyc3AL9GsNasxeEYggKIl
	84ciTn3krzXjz9Cd5Kdz9+9lItZKL2PE7pwOkC2k5boIxRbGLRU/Eg8Tyh+Ijagr
	HUGwzSmpWzunKWnr6dHzxrxgiWEKYMnH4EJQPezzWmDupr64EV8taThsGDeZx/+q
	YDaOiD0oNPnRJ1lUMjahFyk0eag441lmc82Z/tZBLlahCHMboti/28NGjtv7WXtc
	eOJ122bCNGWZHd+vVDOJygUt7P7iYI6Vtxv+ZhEPEoxaddLkU3B7XtLRkrrcNjB/
	NkxoYKdI1zuFfv9eb3sGXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727989551; x=1728075951; bh=c+5OFLAKLeaXi4xTAdxu+JI5Kfkt
	ZfkvOoDYH4SZxVY=; b=RguNitMXOEHgbMC4/5K6M5i5irMzaoxANEsJkcKCUoa5
	5TqE9+kH63HK2e/N/lTCkJ7Df4RR08BxjNWHLff5/TvTcceX8QVMNpR+Z+POG66z
	Qe+UTKmMwp9K8a3mRC9wkz3NDwM7e8EisfZK0tWrXTTGFQYZgpD2RXX1gZFzu6KJ
	nmRtJpkks16l5ZI0fGhN4AjjYs7X4IAautQO+EcPzlYVrEkfoKk/llhoouOVWD8v
	ThntoRzz1OgCWooMFUpIYFlrYSpfr7plrl0to56oCpS1Yn2/Uz4y8LlkyRAifPbN
	CFS8vtmOJ9BbJcpfZmpe0omJGO/0E7zTHV77q3R9Rg==
X-ME-Sender: <xms:Lwf_ZrWQgYLOlCs7KdCkv_d65WKQNRpDvdg8k0SBdanzaD8oguk6gQ>
    <xme:Lwf_ZjlX_52dkpydUvoJUXuiVr9lZuOsGxIIdUi6Nyk9lxISCWg0gvVtfXREg3s5C
    JODeAhb-ysenw>
X-ME-Received: <xmr:Lwf_ZnaxAXySxwVQ8yZjD5B1EQwFdWWfSbDDlTvK6Or1nBKILgsiKf07hCSA51tkPCfjX_6QDnHW0PeqH3DUA73uzfcdYighGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvuddgudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsshht
    rggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigvghnqdguvghvvg
    hlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegtrghrugho
    vgestggrrhguohgvrdgtohhmpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmh
    gurdgtohhmpdhrtghpthhtohepvhhitghtohhrmhdrlhhirhgrsegrmhgurdgtohhm
X-ME-Proxy: <xmx:Lwf_ZmX_04PYkAeza1MOKH-gM-s13gtp_8uMUD3O_5GejAEdaAfBLg>
    <xmx:Lwf_ZllAGNxfvwnWR49KsRyRljWQjlReQSkgnIbtZ_WkTQmSkQo7dw>
    <xmx:Lwf_Zjf4FYHcBXKgsNQOIMji8MJ6CwZKYYtIUCRasPKiE7ELJY3VxQ>
    <xmx:Lwf_ZvGqrar6cNo6n0mYMBkgrQL3iKASB59P2cfTVTD6rIm2550BGQ>
    <xmx:Lwf_ZuBGVZYzWapuHZbog4f_sLsAkoj6UIH1ZzWrfsaq_KA81ngdtCOD>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Oct 2024 23:05:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	Michal Orzel <michal.orzel@amd.com>, victorm.lira@amd.com
Subject: Re: [PATCH] automation: introduce TEST_TIMEOUT_OVERRIDE
Message-ID: <Zv8HLCxOXxWN1GHx@mail-itl>
References: <alpine.DEB.2.22.394.2410031319100.1138574@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Dn2qgiqVkBPwJ4Z9"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2410031319100.1138574@ubuntu-linux-20-04-desktop>


--Dn2qgiqVkBPwJ4Z9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Oct 2024 23:05:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
	Michal Orzel <michal.orzel@amd.com>, victorm.lira@amd.com
Subject: Re: [PATCH] automation: introduce TEST_TIMEOUT_OVERRIDE

On Thu, Oct 03, 2024 at 01:22:51PM -0700, Stefano Stabellini wrote:
> TEST_TIME is set as a CI/CD project variable, as it should be, to match
> the capability and speed of the testing infrastructure.
>=20
> As it turns out, TEST_TIME defined in test.yaml cannot override
> TEST_TIME defined as CI/CD project variable. As a consequence, today the
> TEST_TIME setting in test.yaml for the Xilinx jobs is ignored.

s/TEST_TIME/\0OUT/

>=20
> Instead, rename TEST_TIMEOUT to TEST_TIMEOUT_OVERRIDE in test.yaml and
> check for TEST_TIMEOUT_OVERRIDE first in console.exp.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

with commit message fixed:
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 8675016b6a..e947736195 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -84,7 +84,7 @@
>    variables:
>      CONTAINER: ubuntu:xenial-xilinx
>      LOGFILE: qemu-smoke-xilinx.log
> -    TEST_TIMEOUT: 120
> +    TEST_TIMEOUT_OVERRIDE: 120
>    artifacts:
>      paths:
>        - smoke.serial
> @@ -104,7 +104,7 @@
>      LOGFILE: xilinx-smoke-x86_64.log
>      XEN_CMD_CONSOLE: "console=3Dcom2 com2=3D57600,8n1,0x2F8,4"
>      TEST_BOARD: "crater"
> -    TEST_TIMEOUT: 1000
> +    TEST_TIMEOUT_OVERRIDE: 1000
>    artifacts:
>      paths:
>        - smoke.serial
> diff --git a/automation/scripts/console.exp b/automation/scripts/console.=
exp
> index f538aa6bd0..310543c33e 100755
> --- a/automation/scripts/console.exp
> +++ b/automation/scripts/console.exp
> @@ -1,6 +1,8 @@
>  #!/usr/bin/expect -f
> =20
> -if {[info exists env(TEST_TIMEOUT)]} {
> +if {[info exists env(TEST_TIMEOUT_OVERRIDE)]} {
> +    set timeout $env(TEST_TIMEOUT_OVERRIDE)
> +} elseif {[info exists env(TEST_TIMEOUT)]} {
>      set timeout $env(TEST_TIMEOUT)
>  } else {
>      set timeout 1500

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Dn2qgiqVkBPwJ4Z9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb/BywACgkQ24/THMrX
1ywZbQf/bXFGyHqYBuCngwarb3tybRKGEBEjmTBYA4DFUNKdm6pO+DUEnb/x/+Vv
uC2iW1IqXz0elaI0C6eRiO6i/1+7QrjJJqXHekRDI2x8l/5JMGx5sQfn9toqPTCQ
0WA/UDwLsYTlZi5h75UsmIfwbBddN+gEp/F/En5p1Hcg0CSvjX5DY24XAa0ENhVa
HF5tCy9XHmdX9xTqb/FDbTln6eiB+2wdyDjnsw/88yp5Ceutq+6w5w+T0bmxYWMg
g2jbmzHiCVktD5Vfu0lpgYdkNSZXWA3pUZr83iB1s35E6r3PIol+cnNfcDZTxlLE
LRhnshX40aYFs0s6r1d+/SWh5rx0OA==
=5wI0
-----END PGP SIGNATURE-----

--Dn2qgiqVkBPwJ4Z9--

