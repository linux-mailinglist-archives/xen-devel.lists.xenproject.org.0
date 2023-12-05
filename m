Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E418049F1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 07:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647405.1010493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAOnx-0003E4-Me; Tue, 05 Dec 2023 06:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647405.1010493; Tue, 05 Dec 2023 06:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAOnx-0003C7-Jk; Tue, 05 Dec 2023 06:21:13 +0000
Received: by outflank-mailman (input) for mailman id 647405;
 Tue, 05 Dec 2023 06:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rAOnv-0003C1-QG
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 06:21:11 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b3ddef2-9336-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 07:21:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B4BBF1FB6C;
 Tue,  5 Dec 2023 06:21:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C678136CF;
 Tue,  5 Dec 2023 06:21:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DTxJHFXBbmV8DAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 06:21:09 +0000
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
X-Inumbo-ID: 7b3ddef2-9336-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701757269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aKfyYx7lUsnRISXdC0QikAeubapZ9LeOfhW7e8yKQDM=;
	b=asyxkitvagD01GZmi79KIBx67WAq3ZfM4Z/D/5NkxihA3q5lq6LQKZP06wzVBFOqCVWD+g
	Kcl3J1a4j0G87wqhAJBjnS/bNy4AH3lWS3pgc0OL1mWqgRyPZt79cRsIjzQVxlw3bUlsVB
	5CUXBh1dL6g8Y8/hcGmDaq0GLaNdx3k=
Message-ID: <4f6445b2-f871-415a-aa72-7c08a2c357e0@suse.com>
Date: Tue, 5 Dec 2023 07:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Content-Language: en-US
To: =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
 <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
 <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>
 <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com>
 <eoYHHXdHJzBIPmppjwYPoxVy_LbXN8PCF5FawlOBYMIpqAUeOiPNsW9ZVL3u_iCpzCy7xB0muzDKIfCIDdiFkR-bumO3TgxZkksrOZE7_oE=@proton.me>
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
In-Reply-To: <eoYHHXdHJzBIPmppjwYPoxVy_LbXN8PCF5FawlOBYMIpqAUeOiPNsW9ZVL3u_iCpzCy7xB0muzDKIfCIDdiFkR-bumO3TgxZkksrOZE7_oE=@proton.me>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J9Ckw51FayVhhexmGxNRpoz8"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.99
X-Spamd-Result: default: False [-2.99 / 50.00];
	 ARC_NA(0.00)[];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-0.00)[24.29%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J9Ckw51FayVhhexmGxNRpoz8
Content-Type: multipart/mixed; boundary="------------pJv4ypT97oWvc9HHsjZAU391";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4f6445b2-f871-415a-aa72-7c08a2c357e0@suse.com>
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
 <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
 <1fc21e82-f9f3-4929-a138-2b3de98c06dc@suse.com>
 <dec807bc-8450-48b0-be99-70bf17e62bca@suse.com>
 <eoYHHXdHJzBIPmppjwYPoxVy_LbXN8PCF5FawlOBYMIpqAUeOiPNsW9ZVL3u_iCpzCy7xB0muzDKIfCIDdiFkR-bumO3TgxZkksrOZE7_oE=@proton.me>
In-Reply-To: <eoYHHXdHJzBIPmppjwYPoxVy_LbXN8PCF5FawlOBYMIpqAUeOiPNsW9ZVL3u_iCpzCy7xB0muzDKIfCIDdiFkR-bumO3TgxZkksrOZE7_oE=@proton.me>

--------------pJv4ypT97oWvc9HHsjZAU391
Content-Type: multipart/mixed; boundary="------------bVP9NjCP0xsq6Fwk8FqFYDom"

--------------bVP9NjCP0xsq6Fwk8FqFYDom
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjMgMTg6NDAsIFJlbsOpIFdpbnRoZXIgSMO4amdhYXJkIHdyb3RlOg0KPiBI
aSBKdWVyZ2VuLA0KPiANCj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lg0KPiANCj4gSGVy
ZSBhcmUgdGhlIGNvbW1hbmRzIEkgZXhlY3V0ZSwgaXQgaXMgJ3hsIGNwdXBvb2wtY3B1LWFk
ZCBwY29yZXMgNC0xNScgdGhhdCBjcmFzaCB0aGUgc3lzdGVtLg0KPiANCj4geGwgY3B1cG9v
bC1jcHUtcmVtb3ZlIFBvb2wtMCA0LTMxDQo+IHhsIGNwdXBvb2wtY3JlYXRlIG5hbWU9XCJl
Y29yZXNcIiBzY2hlZD1cImNyZWRpdFwiDQo+IHhsIGNwdXBvb2wtY3B1LWFkZCBlY29yZXMg
MTYtMzENCj4gDQo+IHhsIGNwdXBvb2wtY3JlYXRlIG5hbWU9XCJwY29yZXNcIiBzY2hlZD1c
ImNyZWRpdFwiDQo+IHhsIGNwdXBvb2wtY3B1LWFkZCBwY29yZXMgNC0xNQ0KPiANCj4gDQo+
IEhlcmUgaXMgdGhlIG90aGVyIGluZm9ybWF0aW9uIHlvdSBhc2tlZCBmb3IuDQo+IA0KPiB4
bCBjcHVwb29sLWxpc3Q6DQo+IE5hbWUgICAgICAgICAgICAgICBDUFVzICAgU2NoZWQgICAg
IEFjdGl2ZSAgIERvbWFpbiBjb3VudA0KPiBQb29sLTAgICAgICAgICAgICAgIDI0ICAgIGNy
ZWRpdCAgICAgICB5ICAgICAgICAgIDUNCj4gDQo+IHhsIGNwdXBvb2wtbGlzdCAtYzoNCj4g
TmFtZSAgICAgICAgICAgICAgIENQVSBsaXN0DQo+IFBvb2wtMCAgICAgICAgICAgICAwLDIs
NCw2LDgsMTAsMTIsMTQsMTYsMTcsMTgsMTksMjAsMjEsMjIsMjMsMjQsMjUsMjYsMjcsMjgs
MjksMzAsMzENCj4gDQo+IHhsIGluZm86DQo+IGhvc3QgICAgICAgICAgICAgICAgICAgOiBk
b20wDQo+IHJlbGVhc2UgICAgICAgICAgICAgICAgOiA2LjEuNjItMS5xdWJlcy5mYzM3Lng4
Nl82NA0KPiB2ZXJzaW9uICAgICAgICAgICAgICAgIDogIzEgU01QIFBSRUVNUFRfRFlOQU1J
QyBUdWUgTm92IDE0IDA2OjE2OjM4IEdNVCAyMDIzDQo+IG1hY2hpbmUgICAgICAgICAgICAg
ICAgOiB4ODZfNjQNCj4gbnJfY3B1cyAgICAgICAgICAgICAgICA6IDI0DQo+IG1heF9jcHVf
aWQgICAgICAgICAgICAgOiAzMQ0KPiBucl9ub2RlcyAgICAgICAgICAgICAgIDogMQ0KPiBj
b3Jlc19wZXJfc29ja2V0ICAgICAgIDogMjQNCj4gdGhyZWFkc19wZXJfY29yZSAgICAgICA6
IDENCj4gY3B1X21oeiAgICAgICAgICAgICAgICA6IDI5OTUuMTk2DQo+IGh3X2NhcHMgICAg
ICAgICAgICAgICAgOiBiZmViZmJmZjo3N2ZhZjNmZjoyYzEwMDgwMDowMDAwMDEyMTowMDAw
MDAwZjoyMzljMjdlYjoxODQwMDc4YzowMDAwMDEwMA0KPiB2aXJ0X2NhcHMgICAgICAgICAg
ICAgIDogcHYgaHZtIGh2bV9kaXJlY3RpbyBwdl9kaXJlY3RpbyBoYXAgaW9tbXVfaGFwX3B0
X3NoYXJlIHZtdHJhY2UgZ250dGFiLXYxDQo+IHRvdGFsX21lbW9yeSAgICAgICAgICAgOiA2
NTM3Mw0KPiBmcmVlX21lbW9yeSAgICAgICAgICAgIDogNTY1MDUNCj4gc2hhcmluZ19mcmVl
ZF9tZW1vcnkgICA6IDANCj4gc2hhcmluZ191c2VkX21lbW9yeSAgICA6IDANCj4gb3V0c3Rh
bmRpbmdfY2xhaW1zICAgICA6IDANCj4gZnJlZV9jcHVzICAgICAgICAgICAgICA6IDANCj4g
eGVuX21ham9yICAgICAgICAgICAgICA6IDQNCj4geGVuX21pbm9yICAgICAgICAgICAgICA6
IDE3DQo+IHhlbl9leHRyYSAgICAgICAgICAgICAgOiAuMg0KPiB4ZW5fdmVyc2lvbiAgICAg
ICAgICAgIDogNC4xNy4yDQo+IHhlbl9jYXBzICAgICAgICAgICAgICAgOiB4ZW4tMy4wLXg4
Nl82NCBodm0tMy4wLXg4Nl8zMiBodm0tMy4wLXg4Nl8zMnAgaHZtLTMuMC14ODZfNjQNCj4g
DQo+IHhlbl9zY2hlZHVsZXIgICAgICAgICAgOiBjcmVkaXQNCj4geGVuX3BhZ2VzaXplICAg
ICAgICAgICA6IDQwOTYNCj4gcGxhdGZvcm1fcGFyYW1zICAgICAgICA6IHZpcnRfc3RhcnQ9
MHhmZmZmODAwMDAwMDAwMDAwDQo+IHhlbl9jaGFuZ2VzZXQgICAgICAgICAgOg0KPiANCj4g
eGVuX2NvbW1hbmRsaW5lICAgICAgICA6IHBsYWNlaG9sZGVyIGRvbTBfbWVtPW1pbjoyMDQ4
TSBkb20wX21lbT1tYXg6NDA5Nk0gdWNvZGU9c2NhbiBnbnR0YWJfbWF4X2ZyYW1lcz0yMDQ4
IGdudHRhYl9tYXhfbWFwdHJhY2tfZnJhbWVzPTQwOTYgc210PW9mZiBkb20wX21heF92Y3B1
cz00IGRvbTBfdmNwdXNfcGluIHNjaGVkLWdyYW49Y29yZSBzY2hlZD1jcmVkaXQgbm8tcmVh
bC1tb2RlIGVkZD1vZmYNCg0KUGxlYXNlIGRyb3AgdGhlICJzY2hlZC1ncmFuPWNvcmUiIGZy
b20gdGhlIFhlbiBib290IHBhcmFtZXRlcnMuIEl0IGRvZXNuJ3QgbWFrZQ0KYW55IHNlbnNl
IHdpdGggc210PW9mZiBhbmQgaXMgYWRkaW5nIGFkZGl0aW9uYWwgY29tcGxleGl0eS4NCg0K
SXQgc2hvdWxkbid0IGNyYXNoLCBidXQgY29yZSBzY2hlZHVsaW5nIGlzIHN0aWxsICJFeHBl
cmltZW50YWwiLiBJJ2xsIGxvb2sgaW50bw0KdGhlIGlzc3VlIGxhdGVyLg0KDQoNCkp1ZXJn
ZW4NCg==
--------------bVP9NjCP0xsq6Fwk8FqFYDom
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------bVP9NjCP0xsq6Fwk8FqFYDom--

--------------pJv4ypT97oWvc9HHsjZAU391--

--------------J9Ckw51FayVhhexmGxNRpoz8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVuwVUFAwAAAAAACgkQsN6d1ii/Ey9X
HQf+L1I6C2FsZqgd5IuRFc+nu5K7M0jt3RePzJkGEDgndghlN/vy4dPijyAeTIrcjx50ngzpqDqW
vJ0QSbMwHvhVlySyPH7EZGMpTIBknh2K3so0FZQNZfHRRLB+8pViA9NhsgGHUpp399/siK0XCHzx
iJSc+L7AQqNkyz5DeLcrovppxY3reD+TZftYeT9sFHOeiUyiZzYX0paS5FewZFkB7kBj3CHv9/fs
4SMvggJYABcF1VjOlWFc8/CZUQU2m2crtQ1Z8fKdWMfEB80FY76w2/lXK7Ad9kvqYTtNAU/Deq0w
Sz4GgXGfwGw9jfyJRQ0mfnSUNS00Cu0sFP395nwz/w==
=ZI/M
-----END PGP SIGNATURE-----

--------------J9Ckw51FayVhhexmGxNRpoz8--

