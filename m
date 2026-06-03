Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KzTCHZ86IGqdywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:30:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495016389A1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:30:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ysh6PN2Q;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Ysh6PN2Q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326597.1592021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmcB-0007tF-2Y; Wed, 03 Jun 2026 14:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326597.1592021; Wed, 03 Jun 2026 14:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmcA-0007qv-UW; Wed, 03 Jun 2026 14:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1326597;
 Wed, 03 Jun 2026 14:30:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dfaggioli@suse.com>) id 1wUmc9-0007q8-HF
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:30:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmc8-00Fz3M-Tf
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:30:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a203a7a-2eae-0a2a0a5409dd-0a2a450aadfe-44
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:30:36 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a203a8c-56b3-0a2a450a0019-c387df8283de-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:30:36 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 215966A9E1;
 Wed,  3 Jun 2026 14:30:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ABC02779A7;
 Wed,  3 Jun 2026 14:30:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /jNuJos6IGoBfwAAD6G6ig
 (envelope-from <dfaggioli@suse.com>); Wed, 03 Jun 2026 14:30:35 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780497036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z0OvZLNNBmokUTPLQlQHbQ4dxDW6UtzIgIUujF3UrKg=;
	b=Ysh6PN2Q5PckRn95B9B7mL3fZUjWS3kiiG9kTTGC3Av/Vx1xSmbWNLea3HnK7ENIMgbqPm
	K4c5iYUQzFkpch+bkMluWeQIJEdxjSq9l66uMDrhNVUoRXoyVMNuJC9U9pST6yxeRGb2SV
	w3G5wmfrl1rBjJgAsdMAf+J7xuaNW04=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1780497036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Z0OvZLNNBmokUTPLQlQHbQ4dxDW6UtzIgIUujF3UrKg=;
	b=Ysh6PN2Q5PckRn95B9B7mL3fZUjWS3kiiG9kTTGC3Av/Vx1xSmbWNLea3HnK7ENIMgbqPm
	K4c5iYUQzFkpch+bkMluWeQIJEdxjSq9l66uMDrhNVUoRXoyVMNuJC9U9pST6yxeRGb2SV
	w3G5wmfrl1rBjJgAsdMAf+J7xuaNW04=
Message-ID: <456c856e66ed7e481b1bc93051a4535d767efa9b.camel@suse.com>
Subject: Re: RTDS: Call for [Co]-Maintainers [was: Re: RTDS scheduler
 patches]
From: Dario Faggioli <dfaggioli@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Meng Xu <mengxu@cis.upenn.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>, Juergen Gross
 <jgross@suse.com>
Date: Wed, 03 Jun 2026 16:30:26 +0200
In-Reply-To: <2d0a4c03-319f-4d29-b305-09998a516606@suse.com>
References: <41d236ba-a93d-446a-b29a-449a1c5f8972@suse.com>
	 <0b44963bae28d08fcfc14374cfa5e9bcb7c5eaa3.camel@suse.com>
	 <2d0a4c03-319f-4d29-b305-09998a516606@suse.com>
Autocrypt: addr=dfaggioli@suse.com; prefer-encrypt=mutual;
 keydata=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
 fkAJ0OEQQ==
Organization: SUSE Software Solutions Italy S.r.l.
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Y6lmYPkgczP+GTGlg3cg"
User-Agent: Evolution 3.60.2 (by Flathub.org) 
MIME-Version: 1.0
X-Spam-Flag: NO
X-Spam-Score: -6.40
X-Spam-Level: 
X-purgate-ID: tlsNG-4011c0/1780497036-70D608B7-2BAB68BB/0/0
X-purgate-type: clean
X-purgate-size: 2971
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.29 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[about.me:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,m:Oleksii_Moisieiev@epam.com,m:jgross@suse.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dfaggioli@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dfaggioli@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 495016389A1


--=-Y6lmYPkgczP+GTGlg3cg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-06-03 at 16:15 +0200, Jan Beulich wrote:
> On 03.06.2026 16:08, Dario Faggioli wrote:
> > I'm happy to continue to try to help but, as this thread clearly
> > demonstrates, I can't be the single point of contact for RTDS
> > patches
> > any longer.
>=20
> As to concrete action: From the above I conclude that simply removing
> the "RTDS SCHEDULER" section from ./MAINTAINERS might be a fair first
> step.
>  That would still make you one of its maintainers, along with
> J=C3=BCrgen. Which may not be intended either, judging from what you say.
>
That would be fine for me, but I believe it would, at least
potentially, increase the burden on Juergen.

I mean, he's already reviewing the RTDS patches anyway, so maybe it's
fine... But I'd like to hear from him whether it actually is. :-)

> Might be best if you sent a patch updating ./MAINTAINERS to what you
> think you're going to be capable of doing, in a sustainable way.
> Which
> may be as small a change as converting the two M: to R:. Thoughts?
>
Yeah, so, the alternatives I see are:
- the one you suggest above, if Juergen is fine with it
- leave RTDS separate (with me either as M: or R:, probably the
latter), if someone else steps up.

> (Imo it's always better for people to make such adjustments for
> themselves, then for somebody else to do them, possibly giving the
> impression that the person is being "kicked out".)
>=20
Sure, I'm find doing the change myself, as soon as we decide which path
we take.

Thanks and Regards,
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Y6lmYPkgczP+GTGlg3cg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmogOoIACgkQFkJ4iaW4
c+684g//TdV5dqPaknyRmQsfv7qSFXyahMzqfx7E4zkjKKCn6iHagLD3Z0NB3nNx
utJ1v8p5Y9hAE+4ZcJl4OaAK0YB4Ba/TlH+q2mepbINS4KKxMo3Ih/taMIT/ABjw
UJ/KRRrQ+E2QrJPQZrRg5KhxcACWU27P5bTM+Eg4C3GMdtewXhEBIFWyQePgpd5p
Zn/zV/MjBeYYGYqMerxA/G5dLnqqKP7RAezAVadkmdv9A0YfU1aIpV3R6CTxJmVB
/hiXipSeyDftYBRvSg+n00JlHLjOEL5osC987L7urDZ7kt8jfBDGqb4MSNop7z6B
qkI4MSSODZ3RUDO+LKYmjLZVXXuE56SwmxPaA0okmG16Xghmn8tgghdCsOdj7Mim
e8MtHBSdypjp/2ZAVKldUfjPFcUDQmPD6gOTAd+kmkizHdCfVqe8XFuQEqR3hgCX
4GraMvLHhokhOUas6ojvqclmCOSLf2mCfFCpYpAk7asa4Xh/lQdS1WXobT6VdQ+d
aY2QzsAM3nT3ep/oWbALrAg3NJ/JgRFLQqJqdVbnGr/4JjLDesIhBqrl8rMlo71G
2C7fBfUv/A7EGHanvp6vgtxWai26p5Oz+8gtsUlQofQFl6Qd2YQhpNoa7nUledR0
h9xvaY5LiW3idQVVy8y+FKnVMpKG05WE5gRNzYy3j31hAj08UQs=
=L0ZI
-----END PGP SIGNATURE-----

--=-Y6lmYPkgczP+GTGlg3cg--

