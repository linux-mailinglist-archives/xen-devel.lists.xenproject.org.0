Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C605804B1E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 08:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647430.1010543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAPpN-000769-H1; Tue, 05 Dec 2023 07:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647430.1010543; Tue, 05 Dec 2023 07:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAPpN-00072r-EG; Tue, 05 Dec 2023 07:26:45 +0000
Received: by outflank-mailman (input) for mailman id 647430;
 Tue, 05 Dec 2023 07:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAPpM-00071D-GW
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 07:26:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a39aea47-933f-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 08:26:43 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D812D21EA9;
 Tue,  5 Dec 2023 07:26:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A984E13A2E;
 Tue,  5 Dec 2023 07:26:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id K3F7J7LQbmWNIgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 07:26:42 +0000
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
X-Inumbo-ID: a39aea47-933f-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701761202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gYYrslexbeasbMTYOtSkxaEKNNOdVW1CSS6dagoWibM=;
	b=hJxX2wuV51MggW08AtkHoAHqbeK3EDQWfs2fBqTMmob5t+j91ZI7omCIZBvIM7oopoCqf1
	g+h2Ys1XDlzqAOQyhKosIMzCJee+g/4PgnN5l92V2l3qOciHRSkfR7W6gqMZIVrtEi+TJr
	AejMjEwePki60L4LXdTAQ1t+I3i3Gl4=
Message-ID: <092bab73-90a8-493d-9e5f-2d4ee9359b35@suse.com>
Date: Tue, 5 Dec 2023 08:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
 <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
 <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
 <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com>
 <cd4b8857-ad69-489b-9a4f-63d53c4d360e@suse.com>
 <CA+zSX=b0fVbRcyonZ3axXfbS6Kaw_kKTebNBhUie6C555JbLvg@mail.gmail.com>
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
In-Reply-To: <CA+zSX=b0fVbRcyonZ3axXfbS6Kaw_kKTebNBhUie6C555JbLvg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4MhnT0AclkpJm68nDvql0wHr"
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-3.18 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[14.22%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.19)[-0.968];
	 MIME_BASE64_TEXT(0.10)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: -3.18

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4MhnT0AclkpJm68nDvql0wHr
Content-Type: multipart/mixed; boundary="------------x2x2HEzOi254MApP0bxKsJLE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <george.dunlap@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Message-ID: <092bab73-90a8-493d-9e5f-2d4ee9359b35@suse.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
 <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
 <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
 <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com>
 <cd4b8857-ad69-489b-9a4f-63d53c4d360e@suse.com>
 <CA+zSX=b0fVbRcyonZ3axXfbS6Kaw_kKTebNBhUie6C555JbLvg@mail.gmail.com>
In-Reply-To: <CA+zSX=b0fVbRcyonZ3axXfbS6Kaw_kKTebNBhUie6C555JbLvg@mail.gmail.com>

--------------x2x2HEzOi254MApP0bxKsJLE
Content-Type: multipart/mixed; boundary="------------QZjKM0Iiikn0WALLGmYeWX5u"

--------------QZjKM0Iiikn0WALLGmYeWX5u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjMgMjA6MzMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIE1vbiwgRGVj
IDQsIDIwMjMgYXQgMjo0NOKAr1BNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pj4+IFBlcnNvbmFsbHkgSSBwcmVmZXIgdG8ga2VlcCB0aGUgImdvdG8gb3V0
IiwgcmF0aGVyIHRoYW4gZHVwbGljYXRpbmcNCj4+Pj4gdGhlIHJjdV9yZWFkX3VubG9jaygp
LiAgSSdkIHlpZWxkIGlmIEphbiBzYWlkIGhlIHByZWZlcnJlZA0KPj4+PiBkdXBsaWNhdGlv
biwgaG93ZXZlci4NCj4+Pg0KPj4+IEknbSBvbiB0aGUgZWRnZSB0aGVyZSBhY3R1YWxseS4N
Cj4+DQo+PiBJbiB0aGlzIGNhc2UgSSdkIHByZWZlciBpdCBteSB3YXksIGFzIGl0IGF2b2lk
cyBoYXZpbmcgdG8gc2Nyb2xsIGRvd24gdG8gdGhlDQo+PiBvdXQ6IGxhYmVsIHRvIHNlZSB3
aGF0IGlzIGhhcHBlbmluZyB0aGVyZS4gQWRkaXRpb25hbGx5IGl0IGVuYWJsZXMgdG8gZ2V0
IHJpZA0KPj4gb2YgdGhlIHJldCB2YXJpYWJsZS4NCj4gDQo+IFRoZSBpc3N1ZSBpcywgc3Vw
cG9zZSB3ZSBjaGFuZ2Ugc29tZXRoaW5nIGVsc2UsIGxpa2UgbmVlZGluZyB0byBncmFiDQo+
IChhbmQgcmVsZWFzZSkgYW5vdGhlciBsb2NrPyAgU2hhcmluZyB0aGUgZXhpdCBwYXRoIG1h
a2VzIGl0IGVhc2llciB0bw0KPiBhdm9pZCB0aG9zZSBraW5kcyBvZiBtaXN0YWtlcy4NCg0K
WWVzLCB0aGlzIGNvdWxkIGhhcHBlbi4gT1RPSCBpdCBjb3VsZCBoYXBwZW4gdGhhdCBhbiBh
Y3Rpb24gaXMgYWRkZWQNCm9uIHRoZSBleGl0IHBhdGggd2hpY2ggc2hvdWxkIF9ub3RfIGJl
IGV4ZWN1dGVkIGluIHRoZSBlcnJvciBjYXNlLg0KDQpJIGFncmVlIHRoYXQgaW4gY2FzZSBv
ZiBtb3JlIHRoYW4gb25lIGV4aXQgYWN0aW9uIG5lZWRlZCB0aGUgZ290byBhcHByb2FjaA0K
aXMgc3VwZXJpb3IuIEZvciB6ZXJvIGV4aXQgYWN0aW9ucyBpdCBpcyBpbmZlcmlvciwgd2hp
bGUgZm9yIG9uZSBpdCB3aWxsDQpkZXBlbmQgb24gdGhlIHNwZWNpZmljIGNhc2UgSU1ITy4N
Cg0KDQpKdWVyZ2VuDQo=
--------------QZjKM0Iiikn0WALLGmYeWX5u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------QZjKM0Iiikn0WALLGmYeWX5u--

--------------x2x2HEzOi254MApP0bxKsJLE--

--------------4MhnT0AclkpJm68nDvql0wHr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVu0LIFAwAAAAAACgkQsN6d1ii/Ey8L
awgAmh4yskBnlFJ9A+gkcTF9nZWW7/h+rLH2kLWzwyz67uJSEONPE0bELwzdxDkxN3kUgz+8BZv3
KfwB8IH5MQ6lHboxob6ltWpmSIhHiejcMYk+p5gRGCK99qIUicemvwyc328w45nTMjmsaFsbhwto
gt/+OztYA+5O/lHzj88BloTHlMZ5yLkIZ+CvKMKOu9j8yTnSM5lcxjIdRwTKFBPe6VvUFlAFF9Kp
SpgqhJ7mP4q0YVkxzv9Mas4jtVjbc+ddXGIXSCAnmvv5R8jTAv/2PFSy6mpJh/+7B5R2tXaQMDZR
Ff75P01vTN6Z7UJHFymCWEHzdoYkO3eh2gpC0GJq0Q==
=zk09
-----END PGP SIGNATURE-----

--------------4MhnT0AclkpJm68nDvql0wHr--

