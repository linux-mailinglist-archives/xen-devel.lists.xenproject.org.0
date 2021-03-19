Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7D3417EC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 10:04:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99147.188335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNB2a-0006hw-Sz; Fri, 19 Mar 2021 09:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99147.188335; Fri, 19 Mar 2021 09:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNB2a-0006hX-Pl; Fri, 19 Mar 2021 09:03:32 +0000
Received: by outflank-mailman (input) for mailman id 99147;
 Fri, 19 Mar 2021 09:03:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=egOj=IR=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lNB2Y-0006hC-VW
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 09:03:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10b824fe-a3de-4b39-b034-c12489ac566a;
 Fri, 19 Mar 2021 09:03:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A4BEAE42;
 Fri, 19 Mar 2021 09:03:29 +0000 (UTC)
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
X-Inumbo-ID: 10b824fe-a3de-4b39-b034-c12489ac566a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616144609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EWfP7UzloOiAPorS85pHk23RXUijFI78X2molTUlK08=;
	b=PDWukbk2bZaCqZFG2XB1Q+PBrbIS+GKA0qpkfpj6P4HzxFgYAYYR9zi7Mp40BMLppv+t5B
	4S3MpkAyGoq6m3YpGWYnEgjKmDuEzeS7RrdT09Eqafc3WUe4Qg+ICza5fFCaYodmFg6OrH
	pdKy/815cwelWDcwfIVzmqV4GwrAJ9c=
Message-ID: <d7aaa4e7fa3083ff5bb18e18c5cd8274194109ba.camel@suse.com>
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Dylanger Daly
 <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Date: Fri, 19 Mar 2021 10:03:28 +0100
In-Reply-To: <4916dec1-1bb9-7e6f-2fe5-577bbab92861@suse.com>
References: 
	<9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
	 <2cc5da3e-0ad0-4647-f1ca-190788c2910b@citrix.com>
	 <3pKjdPYCiRimYjqHQP0xd_vqhoTOJqthTXOrY_rLeNvnQEpIF24gXDKgRhmr95JfARJzbVJVbfTrrJeiovGVHGbV0QBSZ2jez2Y_wt6db7g=@protonmail.com>
	 <768d9dbb-4387-099f-b489-7952d7e883b0@suse.com>
	 <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
	 <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com>
	 <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
	 <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com>
	 <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com>
	 <PGn1fJFla-7vPl7QFdkkBX8ASy2cWw-f2HBW7rWE5KgeFEZ_kNUp8Yq5zMaGyS38wMWofVshR75o1jD1rXZeTWtE8XhKQvEq_Dmgsnu-Uy0=@protonmail.com>
	 <4916dec1-1bb9-7e6f-2fe5-577bbab92861@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-GoX3ylmGFV4yNyyCHmnh"
User-Agent: Evolution 3.38.4 (by Flathub.org) 
MIME-Version: 1.0


--=-GoX3ylmGFV4yNyyCHmnh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-03-16 at 09:02 +0100, Jan Beulich wrote:
> On 16.03.2021 03:10, Dylanger Daly wrote:
> > I just wanted to close this off and let everyone know the issue
> > ended up being a faulty/misconfigured HPET clock.
> >=20
> > Appending `clocksource=3Dtsc tsc=3Dunstable hpetbroadcast=3D0` to Xen's
> > CMDLINE totally fixed my issue, I assume Xen was detecting TSC may
> > have been 'off' and was trying to recover/self-correct?
>=20
> I find this a very confusing combination of command line options.
> In particular "tsc=3Dunstable" clears one of the feature prereqs
> (TSC_RELIABLE) that are required for "clocksource=3Dtsc" to take
> any effect, afaict. I therefore would conclude that you're not
> actually running with TSC as the clock source.=C2=A0
>
Right. Also, isn't hpetbroadcast set to 0 by default already?

Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-GoX3ylmGFV4yNyyCHmnh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmBUaOAACgkQFkJ4iaW4
c+6jsw//Qhucgz4gNZj09uf6iyo4vLt1MFzq62SMB2MkxKpEh/kHb3TnJjBMbkw2
zqp1bJI+ysDl+T3i0yWofFaXP+zdmTTtxggdj3QoZLIpM83osGgZ3x4Z4/YQ7cPu
KY1YLryFlYXJpc3sQPRJOll5x12/U7SGq+j3k0BtBQkJcB90NIY5uUoDP5F3kKvN
wTqHAuKufOKdr7nMhEly6J+bNXkMP9E5LRMn5M7YrrnebMufEuL+eo5uSK/+gJ8d
kFN2fWtVTjrtSUldjOtZudMz/jkBMgwNggGv3lF6L7L8IE/FaR5IxGT9Gg91ICfi
22sX3HzrXaMiCbn2YmLo0bEGCBhjcmZw/BQv3ycKxq7uFHczTA/WKWGDYcZiH9yu
RRicpR0O74/fgqvbZ2kVuXceNDQqVadXcDAiUDTn61OB/W+wscYM1U9LbtZea3bU
eIF1HR5BsHdlpT9gu/fuaBLeMdf2WFRwFN8q67nwWpdeOayhU7vgOjwJRPjxGbyz
mI5usjwrrql+lFS4WO2wP/HDiz0hFfPopRJMTbC4N3kbPzWXi4F6kEWNTUy/2jxw
Fbpw6rR2+PECIsSO1M4V7wLn+OgIa/fC6/ktgVkWhcDWQgfucTd4nkxXqKpKmRPM
MSK/gHjIL3Mbep0hRhwS7kaiNCd0FJK9Wn3s1Ufe6tAt8fTEERY=
=t5Qz
-----END PGP SIGNATURE-----

--=-GoX3ylmGFV4yNyyCHmnh--


