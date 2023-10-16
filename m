Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1787CA077
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 09:26:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617296.959797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHz2-0001p3-JP; Mon, 16 Oct 2023 07:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617296.959797; Mon, 16 Oct 2023 07:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsHz2-0001mG-GZ; Mon, 16 Oct 2023 07:25:48 +0000
Received: by outflank-mailman (input) for mailman id 617296;
 Mon, 16 Oct 2023 07:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4t3W=F6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qsHz1-0001mA-M2
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 07:25:47 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 391328ae-6bf5-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 09:25:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6776121C2B;
 Mon, 16 Oct 2023 07:25:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FBBD133B7;
 Mon, 16 Oct 2023 07:25:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pCMnAnnlLGVcYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 16 Oct 2023 07:25:45 +0000
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
X-Inumbo-ID: 391328ae-6bf5-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697441145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rFm4CulkUNmokAEcnOeX70z/AYWmHa6mMbLig0qJgi8=;
	b=gcWs71s7waiRUffwJ8WcvgJHyqvdI3P0HvOOZF84D1sqsISaJgD40UcUi6CAeUB/lVpSPF
	QoG3XRfaUbJr1//r4CJPevv45uLzWHOjyt/yBCn2PFmyeW9+JfcUKr+mEk3CnCEZoRIOu/
	zWqDBWCggSjr9cYaLfj38g6mNs2LjAY=
Message-ID: <9da983d7-7acf-4c8e-8ab6-4651d43786d7@suse.com>
Date: Mon, 16 Oct 2023 09:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] xen: privcmd: Add support for ioeventfd
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org, Erik Schilling <erik.schilling@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann
 <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <cover.1697439990.git.viresh.kumar@linaro.org>
 <b20d83efba6453037d0c099912813c79c81f7714.1697439990.git.viresh.kumar@linaro.org>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <b20d83efba6453037d0c099912813c79c81f7714.1697439990.git.viresh.kumar@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2r1dOTX1mHKZTC7qYSoT4HnL"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.99
X-Spamd-Result: default: False [-2.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 REPLY(-4.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 BAYES_SPAM(0.00)[27.06%];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 NEURAL_SPAM_LONG(3.00)[1.000];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2r1dOTX1mHKZTC7qYSoT4HnL
Content-Type: multipart/mixed; boundary="------------aaD1b1OYmjY0a22YsRfWggOZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org, Erik Schilling <erik.schilling@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann
 <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <9da983d7-7acf-4c8e-8ab6-4651d43786d7@suse.com>
Subject: Re: [PATCH V4 4/4] xen: privcmd: Add support for ioeventfd
References: <cover.1697439990.git.viresh.kumar@linaro.org>
 <b20d83efba6453037d0c099912813c79c81f7714.1697439990.git.viresh.kumar@linaro.org>
In-Reply-To: <b20d83efba6453037d0c099912813c79c81f7714.1697439990.git.viresh.kumar@linaro.org>

--------------aaD1b1OYmjY0a22YsRfWggOZ
Content-Type: multipart/mixed; boundary="------------kYpPsBWQm0iQEiybzpBF4ED2"

--------------kYpPsBWQm0iQEiybzpBF4ED2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTAuMjMgMDk6MTEsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4gVmlydGlvIGd1ZXN0
cyBzZW5kIFZJUlRJT19NTUlPX1FVRVVFX05PVElGWSBub3RpZmljYXRpb24gd2hlbiB0aGV5
IG5lZWQNCj4gdG8gbm90aWZ5IHRoZSBiYWNrZW5kIG9mIGFuIHVwZGF0ZSB0byB0aGUgc3Rh
dHVzIG9mIHRoZSB2aXJ0cXVldWUuIFRoZQ0KPiBiYWNrZW5kIG9yIGFub3RoZXIgZW50aXR5
LCBwb2xscyB0aGUgTU1JTyBhZGRyZXNzIGZvciB1cGRhdGVzIHRvIGtub3cNCj4gd2hlbiB0
aGUgbm90aWZpY2F0aW9uIGlzIHNlbnQuDQo+IA0KPiBJdCB3b3JrcyB3ZWxsIGlmIHRoZSBi
YWNrZW5kIGRvZXMgdGhpcyBwb2xsaW5nIGJ5IGl0c2VsZi4gQnV0IGFzIHdlIG1vdmUNCj4g
dG93YXJkcyBnZW5lcmljIGJhY2tlbmQgaW1wbGVtZW50YXRpb25zLCB3ZSBlbmQgdXAgaW1w
bGVtZW50aW5nIHRoaXMgaW4NCj4gYSBzZXBhcmF0ZSB1c2VyLXNwYWNlIHByb2dyYW0uDQo+
IA0KPiBHZW5lcmFsbHksIHRoZSBWaXJ0aW8gYmFja2VuZHMgYXJlIGltcGxlbWVudGVkIHRv
IHdvcmsgd2l0aCB0aGUgRXZlbnRmZA0KPiBiYXNlZCBtZWNoYW5pc20uIEluIG9yZGVyIHRv
IG1ha2Ugc3VjaCBiYWNrZW5kcyB3b3JrIHdpdGggWGVuLCBhbm90aGVyDQo+IHNvZnR3YXJl
IGxheWVyIG5lZWRzIHRvIGRvIHRoZSBwb2xsaW5nIGFuZCBzZW5kIGFuIGV2ZW50IHZpYSBl
dmVudGZkIHRvDQo+IHRoZSBiYWNrZW5kIG9uY2UgdGhlIG5vdGlmaWNhdGlvbiBmcm9tIGd1
ZXN0IGlzIHJlY2VpdmVkLiBUaGlzIHJlc3VsdHMNCj4gaW4gYW4gZXh0cmEgY29udGV4dCBz
d2l0Y2guDQo+IA0KPiBUaGlzIGlzIG5vdCBhIG5ldyBwcm9ibGVtIGluIExpbnV4IHRob3Vn
aC4gSXQgaXMgcHJlc2VudCB3aXRoIG90aGVyDQo+IGh5cGVydmlzb3JzIGxpa2UgS1ZNLCBl
dGMuIGFzIHdlbGwuIFRoZSBnZW5lcmljIHNvbHV0aW9uIGltcGxlbWVudGVkIGluDQo+IHRo
ZSBrZXJuZWwgZm9yIHRoZW0gaXMgdG8gcHJvdmlkZSBhbiBJT0NUTCBjYWxsIHRvIHBhc3Mg
dGhlIGFkZHJlc3MgdG8NCj4gcG9sbCBhbmQgZXZlbnRmZCwgd2hpY2ggbGV0cyB0aGUga2Vy
bmVsIHRha2UgY2FyZSBvZiBwb2xsaW5nIGFuZCByYWlzZQ0KPiBhbiBldmVudCBvbiB0aGUg
ZXZlbnRmZCwgaW5zdGVhZCBvZiBoYW5kbGluZyB0aGlzIGluIHVzZXIgc3BhY2UgKHdoaWNo
DQo+IGludm9sdmVzIGFuIGV4dHJhIGNvbnRleHQgc3dpdGNoKS4NCj4gDQo+IFRoaXMgcGF0
Y2ggYWRkcyBzaW1pbGFyIHN1cHBvcnQgZm9yIHhlbi4NCj4gDQo+IEluc3BpcmVkIGJ5IGV4
aXN0aW5nIGltcGxlbWVudGF0aW9ucyBmb3IgS1ZNLCBldGMuLg0KPiANCj4gVGhpcyBhbHNv
IGNvcGllcyBpb3JlcS5oIGhlYWRlciBmaWxlIChvbmx5IHN0cnVjdCBpb3JlcSBhbmQgcmVs
YXRlZA0KPiBtYWNyb3MpIGZyb20gWGVuJ3Mgc291cmNlIHRyZWUgKFRvcCBjb21taXQgNWQ4
NGYwN2ZlNmJmICgieGVuL3BjaTogZHJvcA0KPiByZW1haW5pbmcgdXNlcyBvZiBib29sX3Qi
KSkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaXJlc2ggS3VtYXIgPHZpcmVzaC5rdW1hckBs
aW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KDQoNCkp1ZXJnZW4NCg0K
--------------kYpPsBWQm0iQEiybzpBF4ED2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------kYpPsBWQm0iQEiybzpBF4ED2--

--------------aaD1b1OYmjY0a22YsRfWggOZ--

--------------2r1dOTX1mHKZTC7qYSoT4HnL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUs5XgFAwAAAAAACgkQsN6d1ii/Ey/G
xgf/XccFGPPB3U8Vs9SCABzb+BugbgcSDsjkPY2S5TTBp0zqOxo+dwD+HUUqPOBbJz5o+vfMZb3P
/aazQ0ESrhVtxyI9rf460Os4VZJDGRTUo1sLHihzLJk9DTf+iBV7eIxGJ88rNF6XLxWIJR3ed+K2
gxN7WtsZyfUwbGsPYihIRldPNTV26a+rkYB9AhfwE8qfonkh8hzz067vrKyh70Gg9YjaVs3kBzt7
YLyq1oRBUGpP+M8mw9wQrwmZk9tEwQh0E5eS3FI/hci2uLf6XiosH/CKVApsYT5MuN/ByN3kHH8s
BeN3/nfpI4IhADYqjRd5JH/UcvbsIpVx9YXm1dWXdQ==
=R1SS
-----END PGP SIGNATURE-----

--------------2r1dOTX1mHKZTC7qYSoT4HnL--

