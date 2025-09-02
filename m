Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B86B4002C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106272.1456990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQ1y-0007zv-Kc; Tue, 02 Sep 2025 12:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106272.1456990; Tue, 02 Sep 2025 12:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQ1y-0007y6-Gw; Tue, 02 Sep 2025 12:22:34 +0000
Received: by outflank-mailman (input) for mailman id 1106272;
 Tue, 02 Sep 2025 12:22:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Hxa=3N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1utQ1x-0007y0-0f
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:22:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f0e6fa0-87f7-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 14:22:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FD3F1F38F;
 Tue,  2 Sep 2025 12:22:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1A4D413888;
 Tue,  2 Sep 2025 12:22:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id p0VPBIbhtmjxRQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 02 Sep 2025 12:22:30 +0000
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
X-Inumbo-ID: 7f0e6fa0-87f7-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756815750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iOWyPAhnVnUcwKSzBRYdNH2CPFxp/Rptscur4Sj4JYE=;
	b=qHyvTStHyVvzX/7Vlav4kpjnGKwqKxzfH9dy3GK4T5S5YjKW0MgQwfNYASzefuNTZ3eG2K
	uQbf42+ELOpsoUfJ5SoTf2I2V4MMjTCHkWYbu7mH51GoA9UWhSVXEldVaKYyJQR0yUx5Rv
	cUW92LzSGaC6H7fgx+dJzemqVKjlXIY=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756815750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iOWyPAhnVnUcwKSzBRYdNH2CPFxp/Rptscur4Sj4JYE=;
	b=qHyvTStHyVvzX/7Vlav4kpjnGKwqKxzfH9dy3GK4T5S5YjKW0MgQwfNYASzefuNTZ3eG2K
	uQbf42+ELOpsoUfJ5SoTf2I2V4MMjTCHkWYbu7mH51GoA9UWhSVXEldVaKYyJQR0yUx5Rv
	cUW92LzSGaC6H7fgx+dJzemqVKjlXIY=
Message-ID: <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
Date: Tue, 2 Sep 2025 14:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
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
In-Reply-To: <aLbNbiHLntX13E46@mail.soc.lip6.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2HGgRcD9o0xAP0RUnwBMEZzk"
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2HGgRcD9o0xAP0RUnwBMEZzk
Content-Type: multipart/mixed; boundary="------------eas3qb7XCNYrfFl0Dpy0XRX2";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
Subject: Re: issue with dom0_pvh on Xen 4.20
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
In-Reply-To: <aLbNbiHLntX13E46@mail.soc.lip6.fr>

--------------eas3qb7XCNYrfFl0Dpy0XRX2
Content-Type: multipart/mixed; boundary="------------PKcqyQf2PwCXcSguLT8NFcl3"

--------------PKcqyQf2PwCXcSguLT8NFcl3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDkuMjUgMTI6NTYsIE1hbnVlbCBCb3V5ZXIgd3JvdGU6DQo+IE9uIFR1ZSwgU2Vw
IDAyLCAyMDI1IGF0IDExOjQ0OjM2QU0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+
PiBPbiAwMi8wOS8yMDI1IDExOjE3IGFtLCBNYW51ZWwgQm91eWVyIHdyb3RlOg0KPj4+IEhl
bGxvLA0KPj4+IEknbSB0cnlpbmcgdG8gYm9vdCBhIE5ldEJTRCBQVkggZG9tMCBvbiBYZW4g
NC4yMC4NCj4+PiBUaGUgc2FtZSBOZXRCU0Qga2VybmVsIHdvcmtzIGZpbmUgd2l0aCBYZW4g
NC4xOA0KPj4+DQo+Pj4gVGhlIGJvb3Qgb3B0aW9ucyBhcmU6DQo+Pj4gbWVudT1Cb290IG5l
dGJzZC1jdXJyZW50IFBWSCBYZW40MjA6ZGV2IGhkMGY6O2xvYWQgL25ldGJzZC1QVkggY29u
c29sZT1jb20wIHJvb3Q9d2QwZjsgbXVsdGlib290IC94ZW40MjAtZGVidWcuZ3ogZG9tMF9t
ZW09MTAyNE0gY29uc29sZT1jb20xIGNvbTE9Mzg0MDAsOG4xIGxvZ2x2bD1hbGwgZ3Vlc3Rf
bG9nbHZsPWFsbCBnbnR0YWJfbWF4X25yX2ZyYW1lcz02NCBzeW5jX2NvbnNvbGU9MSBkb20w
PXB2aA0KPj4+DQo+Pj4gYW5kIHRoZSBmdWxsIGxvZyBmcm9tIHNlcmlhbCBjb25zb2xlIGlz
IGF0dGFjaGVkLg0KPj4+DQo+Pj4gV2l0aCA0LjIwIHRoZSBib290IGZhaWxzIHdpdGg6DQo+
Pj4NCj4+PiAoWEVOKSAqKiogU2VyaWFsIGlucHV0IHRvIERPTTAgKHR5cGUgJ0NUUkwtYScg
dGhyZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0KQ0KPj4+IChYRU4pIEZyZWVkIDY2NGtCIGlu
aXQgbWVtb3J5DQo+Pj4gKFhFTikgZDB2MCBUcmlwbGUgZmF1bHQgLSBpbnZva2luZyBIVk0g
c2h1dGRvd24gYWN0aW9uIDENCj4+PiAoWEVOKSAqKiogRHVtcGluZyBEb20wIHZjcHUjMCBz
dGF0ZTogKioqDQo+Pj4gKFhFTikgLS0tLVsgWGVuLTQuMjAuMi1wcmVfMjAyNTA4MjFuYjAg
IHg4Nl82NCAgZGVidWc9eSAgVGFpbnRlZDogICBDICAgIF0tLS0tDQo+Pj4gKFhFTikgQ1BV
OiAgICA3DQo+Pj4gKFhFTikgUklQOiAgICAwMDA4Ols8MDAwMDAwMDAwMDIwZTI2OD5dDQo+
Pj4gKFhFTikgUkZMQUdTOiAwMDAwMDAwMDAwMDEwMDA2ICAgQ09OVEVYVDogaHZtIGd1ZXN0
IChkMHYwKQ0KPj4+IChYRU4pIHJheDogMDAwMDAwMDAyMDI0YzAwMyAgIHJieDogMDAwMDAw
MDAwMDIwZTI2MCAgIHJjeDogMDAwMDAwMDAwMDBkZmViNw0KPj4+IChYRU4pIHJkeDogMDAw
MDAwMDAwMDEwMDAwMCAgIHJzaTogMDAwMDAwMDAwMDEwMzAwMCAgIHJkaTogMDAwMDAwMDAw
MDEzZTAwMA0KPj4+IChYRU4pIHJicDogMDAwMDAwMDA4MDAwMDAwMCAgIHJzcDogMDAwMDAw
MDAwMTQwMDJlNCAgIHI4OiAgMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4pIHI5OiAgMDAw
MDAwMDAwMDAwMDAwMCAgIHIxMDogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMTogMDAwMDAwMDAw
MDAwMDAwMA0KPj4+IChYRU4pIHIxMjogMDAwMDAwMDAwMDAwMDAwMCAgIHIxMzogMDAwMDAw
MDAwMDAwMDAwMCAgIHIxNDogMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4pIHIxNTogMDAw
MDAwMDAwMDAwMDAwMCAgIGNyMDogMDAwMDAwMDAwMDAwMDAxMSAgIGNyNDogMDAwMDAwMDAw
MDAwMDAwMA0KPj4+IChYRU4pIGNyMzogMDAwMDAwMDAwMDAwMDAwMCAgIGNyMjogMDAwMDAw
MDAwMDAwMDAwMA0KPj4+IChYRU4pIGZzYjogMDAwMDAwMDAwMDAwMDAwMCAgIGdzYjogMDAw
MDAwMDAwMDAwMDAwMCAgIGdzczogMDAwMDAwMDAwMDAwMDAwMA0KPj4+IChYRU4pIGRzOiAw
MDEwICAgZXM6IDAwMTAgICBmczogMDAwMCAgIGdzOiAwMDAwICAgc3M6IDAwMTAgICBjczog
MDAwOA0KPj4+DQo+Pj4gYmVjYXVzZSBvZiB0aGUgdHJpcGxlIGZhdWx0IHRoZSBSSVAgYWJv
dmUgZG9lbnMndCBwb2ludCB0byB0aGUgY29kZS4NCj4+Pg0KPj4+IEkgdHJhY2tlZCBpdCBk
b3duIHRvIHRoaXMgY29kZToNCj4+PiAgICAgICAgICBjbXBsICAgICQwLCVlY3ggICAgICAg
ICAgICAgICAgIDsgICAgICAgLyogemVyby1zaXplZD8gKi8gICAgICAgXA0KPj4+ICAgICAg
ICAgIGplICAgICAgMmYgICAgICAgICAgICAgICAgICAgICAgOyBcDQo+Pj4gICAgICAgICAg
cHVzaGwgICAlZWJwICAgICAgICAgICAgICAgICAgICA7IFwNCj4+PiAgICAgICAgICBtb3Zs
ICAgIFJFTE9DKG5veF9mbGFnKSwlZWJwICAgIDsgXA0KPj4+IDE6ICAgICAgbW92bCAgICAl
ZWJwLChQREVfU0laRS00KSglZWJ4KSA7ICAgICAgIC8qIHVwcGVyIDMyIGJpdHM6IE5YICov
IFwNCj4+PiAgICAgICAgICBtb3ZsICAgICVlYXgsKCVlYngpICAgICAgICAgICAgIDsgICAg
ICAgLyogc3RvcmUgcGh5cyBhZGRyICovICAgXA0KPj4+ICAgICAgICAgIGFkZGwgICAgJFBE
RV9TSVpFLCVlYnggICAgICAgICAgOyAgICAgICAvKiBuZXh0IFBURS9QREUgKi8gICAgICBc
DQo+Pj4gICAgICAgICAgYWRkbCAgICAkUEFHRV9TSVpFLCVlYXggICAgICAgICA7ICAgICAg
IC8qIG5leHQgcGh5cyBwYWdlICovICAgIFwNCj4+PiAgICAgICAgICBsb29wICAgIDFiICAg
ICAgICAgICAgICAgICAgICAgIDsgXA0KPj4+ICAgICAgICAgIHBvcGwgICAgJWVicCAgICAg
ICAgICAgICAgICAgICAgOyBcDQo+Pj4gMjogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDsNCj4+Pg0KPj4+IHRoZXJlIGFyZSBvdGhlcnMgcHVzaGwvcG9wbCBiZWZv
cmUgc28gSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIHByb2JsZW0NCj4+PiAoaW4gZmFjdCB0
aGUgZXhhY3Qgc2FtZSBmcmFnbWVudCBpcyBjYWxsZWQganVzdCBiZWZvcmUgd2l0aCBkaWZm
ZXJlbnQNCj4+PiBpbnB1dHMgYW5kIGl0IGRvZXNuJ3QgZmF1bHQpLiBTbyB0aGUgY3VscHJp
dCBpdCBwcm9iYWJseSB0aGUgd3JpdGUgdG8gKCVlYngpLA0KPj4+IHdoaWNoIHdvdWxkIGJl
IDB4MjBlMjYwDQo+Pj4gVGhpcyBpcyBpbiB0aGUgcmFuZ2U6DQo+Pj4gKFhFTikgIFswMDAw
MDAwMDAwMTAwMDAwLCAwMDAwMDAwMDQwMDY4ZTc3XSAodXNhYmxlKQ0KPj4+IHNvIEkgY2Fu
J3Qgc2VlIHdoeSB0aGlzIHdvdWxkIGJlIGEgcHJvYmxlbS4NCj4+Pg0KPj4+IEFueSBpZGVh
LCBpbmNsdWRpbmcgaG93IHRvIGRlYnVnIHRoaXMgZnVydGhlciwgd2VsY29tZQ0KPj4NCj4+
IEV2ZW4gdGhvdWdoIHRyaXBsZSBmYXVsdCdzIGFyZSBhYm9ydHMsIHRoZXkncmUgZ2VuZXJh
bGx5IGFjY3VyYXRlIHVuZGVyDQo+PiB2aXJ0LCBzbyAweDIwZTI2OCBpcyBtb3N0IGxpa2Vs
eSB3aGVyZSB0aGluZ3MgZGllLg0KPiANCj4gYnV0IHRoYXQncyB0aGUgUklQIG9mIHRoZSBs
YXN0IGZhdWx0LCBub3QgdGhlIGZpcnN0IG9uZSwgcmlnaHQgPw0KPiAweDIwZTI2OCBpc24n
dCBpbiB0aGUgdGV4dCBzZWdtZW50IG9mIHRoZSBrZXJuZWwsIG15IGd1ZXNzIGlzIHRoYXQg
dGhlDQo+IGZpcnN0IGZhdWx0IHRyaWdnZXJzIGFuIGV4Y2VwdGlvbiwgYnV0IHRoZSBleGVw
dGlvbiBoYW5kbGVyIGlzbid0IHNldCB1cCB5ZXQNCj4gc28gd2UgZW5kIHVwIGp1bXBpbmcg
dG8gc29tZSByYW5kb20gdmFsdWUuDQo+IA0KDQpXaGF0IHB1enpsZXMgbWUgaXMgdGhhdDoN
Cg0KLSAlY3IyIGlzIDAsIHNvIHByb2JhYmx5IHRoZSBmaXJzdCBmYXVsdCB3YXNuJ3QgYSBw
YWdlIGZhdWx0DQotIFJJUCBpcyAlZWJ4ICsgOCwgc28gbWF5YmUgdGhlIGNvZGUgd2FzIGp1
c3QgY2xvYmJlcmVkIGJ5IHRoZSBsb29wPw0KDQpDb3VsZCBpdCBiZSB0aGUgY29kZSBoYXMg
YmVlbiBtb3ZlZCB0byB0aGlzIGxvY2F0aW9uLCBvciBpcyBhYm91dCB0bw0KYmUgbW92ZWQg
YXdheSBhZnRlcndhcmRzPw0KDQoNCkp1ZXJnZW4NCg==
--------------PKcqyQf2PwCXcSguLT8NFcl3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------PKcqyQf2PwCXcSguLT8NFcl3--

--------------eas3qb7XCNYrfFl0Dpy0XRX2--

--------------2HGgRcD9o0xAP0RUnwBMEZzk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi24YUFAwAAAAAACgkQsN6d1ii/Ey8f
rAgAiL4mlNJYggi+5XC79/szuKCABMaO7fKZVIxyF0e/7t9DyRJINvW8g0Jns1fM2aAW4nKb7ZOr
BUUIVGjgUb5aEaZD29VyOM4y7/8K0daISxmisJ7K52SL6OklSxyxo5br3G5CVlMWDdZAbN9TU66X
hXtiaEklrSXFGtwj01YOZh+onaJgS8i5Nl+wtHhiEg9Ijd+CMWUVCkBATHvDxYM5d6vU8p+lsAVq
qie/xeBBMAaheJLyRGhZrz4+ifzbpxu8bFzg/QeE6Hd8bHPBaQ2FxQMygELcKzjloe/qaF2o6cy+
dTnxByD7VG6xD2hhGFvtyWYmY+WiSYB4a0LM6/Vpuw==
=7hlr
-----END PGP SIGNATURE-----

--------------2HGgRcD9o0xAP0RUnwBMEZzk--

