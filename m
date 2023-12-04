Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B1C80322B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 13:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646876.1009506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7jr-00024h-2W; Mon, 04 Dec 2023 12:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646876.1009506; Mon, 04 Dec 2023 12:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA7jq-00021N-V8; Mon, 04 Dec 2023 12:07:50 +0000
Received: by outflank-mailman (input) for mailman id 646876;
 Mon, 04 Dec 2023 12:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rA7jp-00021H-IR
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 12:07:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc9bacf3-929d-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 13:07:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 227322209F;
 Mon,  4 Dec 2023 12:07:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3D77139AA;
 Mon,  4 Dec 2023 12:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lNupNRHBbWV4fgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 12:07:45 +0000
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
X-Inumbo-ID: bc9bacf3-929d-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701691666; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tgiCsAa+BIXJ+p9AGRAlKDHtD+RXFRTFQjXmGkxnZvU=;
	b=TYo5Xzrgxnst8dRaH0kIPtHnaXWKFDTC23ktBOxdUUUQFBlL/xqWteho67jwutCwpbTtFc
	NkXQ9HtSFBvTkOF0raLasbeZ05CpH5dteKFFPfw/zRkKfsXCcVKncRmVIsqW35mTqOxyX8
	tcgezMx1CV8H+a/jhQJA+HrMNZgFa+w=
Message-ID: <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com>
Date: Mon, 4 Dec 2023 13:07:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?UmVuw6kgV2ludGhlciBIw7hqZ2Fh?=
 =?UTF-8?Q?rd?= <renewin@proton.me>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
 <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
 <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>
Content-Language: en-US
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
In-Reply-To: <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------guVH0E8jwxmiv0ERU3SnFCnX"
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-3.19 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -3.19

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------guVH0E8jwxmiv0ERU3SnFCnX
Content-Type: multipart/mixed; boundary="------------c2UaUpD7CuLUHS2EdIYnWBjA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?UmVuw6kgV2ludGhlciBIw7hqZ2Fh?=
 =?UTF-8?Q?rd?= <renewin@proton.me>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com>
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
 <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
 <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>
In-Reply-To: <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>

--------------c2UaUpD7CuLUHS2EdIYnWBjA
Content-Type: multipart/mixed; boundary="------------LV0tgP71xVAbso2eqVMzFW6S"

--------------LV0tgP71xVAbso2eqVMzFW6S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjMgMTE6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4xMi4yMDIz
IDExOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDQuMTIuMjMgMTA6MTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAxLjEyLjIwMjMgMjE6MTIsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+Pj4+IE9uIDAxLzEyLzIwMjMgNzo1OSBwbSwgUmVuw6kgV2ludGhlciBI
w7hqZ2FhcmQgd3JvdGU6DQo+Pj4+PiBJZiBJIHNldCBzbXQ9b2ZmIGFuZCB0cnkgdG8gY29u
ZmlndXJlIGNwdXBvb2xzIHdpdGggY3JlZGl0KDEpIGFzIGlmDQo+Pj4+PiBhbGwgY29yZXMg
YXJlIGF2YWlsYWJsZSwgSSBnZXQgdGhlIGZvbGxvd2luZyBjcmFzaC4NCj4+Pj4+DQo+Pj4+
PiBUaGUgY3Jhc2ggaGFwcGVucyB3aGVuIEkgdHJ5IHRvIHVzZSB4bCBjcHVwb29sLWFkZC1j
cHUgb24gdGhlIGRpc2FibGVkDQo+Pj4+PiBIVCBzaWJsaW5nIGNvcmVzLg0KPj4+Pj4NCj4+
Pj4+IEh5cGVyLXRocmVhZGluZyBpcyBlbmFibGVkIGluIHRoZSBmaXJtd2FyZSwgYW5kIG9u
bHkgZGlzYWJsZWQgd2l0aA0KPj4+Pj4gc210PW9mZi4NCj4+Pj4NCj4+Pj4gQ0MnaW5nIHNv
bWUgbWFpbnRhaW5lcnMuDQo+Pj4+DQo+Pj4+IEkgZXhwZWN0IHRoaXMgd2lsbCBhbHNvIGV4
cGxvZGUgd2hlbiBhIENQVSBpcyBydW50aW1lIG9mZmxpbmVkIHdpdGgNCj4+Pj4gYHhlbi1o
cHRvb2wgY3B1LW9mZmxpbmVgIGFuZCB0aGVuIGFkZGVkIHRvIGEgY3B1cG9vbC4NCj4+Pj4N
Cj4+Pj4gSW50ZXJlc3RpbmdseSwgdGhlIGNyYXNoIGlzIG1vdiAoJXJkeCwlcmF4LDEpLCVy
MTMsIGFuZCBJIHRoaW5rIHRoYXQncw0KPj4+PiB0aGUgcGVyY3B1IHBvc2lvbiB2YWx1ZSBp
biAlcmR4Lg0KPj4+Pg0KPj4+PiBJIGV4cGVjdCBjcHVwb29scyB3YW50IHRvIHJlamVjdCBw
YXJrZWQvb2ZmbGluZSBDUFVzLg0KPj4+DQo+Pj4gV2hpbGUgdGhlIG9ubHkgZXhwbGljaXQg
Y2hlY2sgdGhlcmUgaXMNCj4+Pg0KPj4+ICAgICAgICAgICBpZiAoIGNwdSA+PSBucl9jcHVf
aWRzICkNCj4+PiAgICAgICAgICAgICAgIGdvdG8gYWRkY3B1X291dDsNCj4+Pg0KPj4+IEkg
d291bGQgaGF2ZSBleHBlY3RlZCB0aGlzDQo+Pj4NCj4+PiAgICAgICAgICAgaWYgKCAhY3B1
bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9jcHVzKSB8fA0KPj4+ICAgICAgICAg
ICAgICAgIGNwdW1hc2tfaW50ZXJzZWN0cyhjcHVzLCAmY3B1cG9vbF9sb2NrZWRfY3B1cykg
KQ0KPj4+ICAgICAgICAgICAgICAgZ290byBhZGRjcHVfb3V0Ow0KPj4+DQo+Pj4gdG8gZGVh
bCB3aXRoIHRoZSBzaXR1YXRpb24sIGFzIHBhcmtlZC9vZmZsaW5lIENQVXMgc2hvdWxkbid0
IGJlICJmcmVlIi4NCj4+PiBKw7xyZ2VuPw0KPj4NCj4+IFRoZSBwcm9ibGVtIGlzIHRoZSBj
YWxsIG9mIHNjaGVkX2dldF9vcHRfY3B1bWFzaygpIHRvIG5lZWQgdGhlIHBlcmNwdSBhcmVh
DQo+PiBvZiB0aGUgY3B1IGluIHF1ZXN0aW9uLg0KPiANCj4gVGhhdCB3YXMgbXkgZmlyc3Qg
dGhvdWdodCwgdG9vLCBidXQgdGhlbiBJIHNhdyBjcHVwb29sX2Fzc2lnbl9jcHVfbG9ja2Vk
KCkgb24NCj4gdGhlIGNhbGwgdHJhY2UsIHdoaWNoIGlzIGNhbGxlZCBvbmx5IGFmdGVyd2Fy
ZHMuIFBsdXMgc2NoZWRfZ2V0X29wdF9jcHVtYXNrKCkNCj4gbmVlZHMgdGhlIHBlci1DUFUg
YXJlYSBvbmx5IHdoZW4gZ3JhbnVsYXJpdHkgd2FzIHN3aXRjaGVkIGZyb20gaXRzIGRlZmF1
bHQgb2YNCj4gU0NIRURfR1JBTl9jcHUgYWZhaWNzLg0KDQpPaCByaWdodCB5b3UgYXJlLg0K
DQpNeSBwYXRjaCBpcyBuZWVkZWQgZm9yIGxhcmdlciBncmFudWxhcml0aWVzLCB0aG91Z2gu
DQoNCkkndmUgdHJpZWQgdG8gaGl0IHRoZSBzYW1lIHByb2JsZW0gYXMgUmVuw6ksIGJ1dCBl
dmVyeXRoaW5nIHdvcmtzIGFzIGludGVuZGVkIChubw0KY3Jhc2gsIGJ1dCBhZGRpbmcgYW4g
b2ZmbGluZSBjcHUgaXMgYmVpbmcgcmVqZWN0ZWQpLg0KDQpSZW7DqSwgY291bGQgeW91IHBs
ZWFzZSB0ZWxsIHVzIHdoYXQgZXhhY3RseSB5b3UndmUgYmVlbiBkb2luZz8gVGhpcyB3b3Vs
ZCBiZToNCg0KLSBYZW4gY29tbWFuZCBsaW5lIHBhcmFtZXRlcnMNCi0gT3V0cHV0IG9mICJ4
bCBpbmZvIg0KLSBPdXRwdXQgb2YgInhsIGNwdXBvb2wtbGlzdCIgYmVmb3JlIHN0YXJ0aW5n
IHRvIG1hbmlwdWxhdGUgY3B1cG9vbHMNCi0gT3V0cHV0IG9mICJ4bCBjcHVwb29sLWxpc3Qg
LWMiIGJlZm9yZSBzdGFydGluZyB0byBtYW5pcHVsYXRlIGNwdXBvb2xzDQotIENwdXBvb2wg
Y29uZmlnIGZpbGUgdXNlZCB0byBjcmVhdGUgbmV3IGNwdXBvb2wNCi0geGwgY29tbWFuZHMg
eW91J3ZlIHVzZWQgdG8gc2V0dXAgdGhlIGNwdXBvb2wgYW5kIGFkZGluZyB0aGUgY3B1KHMp
IHRvIGl0DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------LV0tgP71xVAbso2eqVMzFW6S
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------LV0tgP71xVAbso2eqVMzFW6S--

--------------c2UaUpD7CuLUHS2EdIYnWBjA--

--------------guVH0E8jwxmiv0ERU3SnFCnX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVtwREFAwAAAAAACgkQsN6d1ii/Ey9L
JQf/ScciUWehTKv8j2tBJiINJRt06wexkkuOfmnH2XkTadiSGFKw/KMRgkIpgzaar3Y7q75WEDNa
h6p2MibG32xYSf4bsURLBJcpEGLARDiHeiuIFyokE/QzR0yChHN/jy0ziiQ0XJ5Jlhwx4rwSRl1i
/CwNKVRLeHe0wVU0uRkUKxV2jvp2RNYQafUGUiptOTdr320x2yarl8BAqtzsT/k513vASUx5/9py
iZ0ZfYX5DN8+csXkU1A2mAjbNVSEiqq0gphR56Q+MsFdu54bcXzcBVq9Jhxfrr1AH7c5IwoVINqx
YYurQujjcW9KQSOH3NG2MtVjxqNdVY8BqtyB0907CA==
=gnIr
-----END PGP SIGNATURE-----

--------------guVH0E8jwxmiv0ERU3SnFCnX--

