Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7B7CF380
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619003.963451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOye-00056G-8M; Thu, 19 Oct 2023 09:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619003.963451; Thu, 19 Oct 2023 09:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOye-00053q-4u; Thu, 19 Oct 2023 09:06:00 +0000
Received: by outflank-mailman (input) for mailman id 619003;
 Thu, 19 Oct 2023 09:05:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yz61=GB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qtOyd-00052L-A8
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:05:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6f5f50e-6e5e-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 11:05:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7505721B00;
 Thu, 19 Oct 2023 09:05:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32B17139C2;
 Thu, 19 Oct 2023 09:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PljBCnTxMGV5TwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 19 Oct 2023 09:05:56 +0000
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
X-Inumbo-ID: b6f5f50e-6e5e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697706356; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OeJbwcqNRCxvqk1O2Sj0l6691j6KA05WSasvzi0/x1w=;
	b=tW8NthHUkb4uYjAdV4f4G8hvw0doNYWJ0EvXru2NOIrHGg86/UzJWYrsdLeFBOn9sGFeEw
	yeywk0N47oSeSs6/czHuG8APzSlGi50aQyLBnyZUwGV4V7kcoWxs2pj07ztr4/Ry4/N5b2
	+UFtIGmg5H3EyO6vzZEAXBts+di7bUA=
Message-ID: <e909d01d-6609-4f3e-af05-e829bf1b278c@suse.com>
Date: Thu, 19 Oct 2023 11:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] xen/spinlock: reduce lock profile ifdefs
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231013094224.7060-1-jgross@suse.com>
 <20231013094224.7060-3-jgross@suse.com>
 <12b1909a-5ad2-bc8e-8855-e80b468990b1@suse.com>
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
In-Reply-To: <12b1909a-5ad2-bc8e-8855-e80b468990b1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nbbIPIugHUH5xZhsOGv50W1Y"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.98
X-Spamd-Result: default: False [-7.98 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BAYES_HAM(-2.99)[99.95%];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nbbIPIugHUH5xZhsOGv50W1Y
Content-Type: multipart/mixed; boundary="------------riJy0eTQm0zjsv0eIQCa8ExY";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: javi.merino@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <e909d01d-6609-4f3e-af05-e829bf1b278c@suse.com>
Subject: Re: [PATCH v2 02/13] xen/spinlock: reduce lock profile ifdefs
References: <20231013094224.7060-1-jgross@suse.com>
 <20231013094224.7060-3-jgross@suse.com>
 <12b1909a-5ad2-bc8e-8855-e80b468990b1@suse.com>
In-Reply-To: <12b1909a-5ad2-bc8e-8855-e80b468990b1@suse.com>

--------------riJy0eTQm0zjsv0eIQCa8ExY
Content-Type: multipart/mixed; boundary="------------uKVwR0BXy7AP33Brw0Zk0piE"

--------------uKVwR0BXy7AP33Brw0Zk0piE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMTAuMjMgMTc6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4xMC4yMDIz
IDExOjQyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2l0aCBzb21lIHNtYWxsIGFkanVz
dG1lbnRzIHRvIHRoZSBMT0NLX1BST0ZJTEVfKiBtYWNyb3Mgc29tZSAjaWZkZWZzDQo+PiBj
YW4gYmUgZHJvcHBlZCBmcm9tIHNwaW5sb2NrLmMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMjoNCj4+IC0g
bmV3IHBhdGNoDQo+PiAtLS0NCj4+ICAgeGVuL2NvbW1vbi9zcGlubG9jay5jIHwgNDUgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vc3BpbmxvY2suYyBiL3hlbi9jb21tb24vc3BpbmxvY2su
Yw0KPj4gaW5kZXggMjAyYzcwNzU0MC4uNDg3OGEwMTMwMiAxMDA2NDQNCj4+IC0tLSBhL3hl
bi9jb21tb24vc3BpbmxvY2suYw0KPj4gKysrIGIveGVuL2NvbW1vbi9zcGlubG9jay5jDQo+
PiBAQCAtMjY3LDI1ICsyNjcsMjggQEAgdm9pZCBzcGluX2RlYnVnX2Rpc2FibGUodm9pZCkN
Cj4+ICAgICAgICAgICBsb2NrLT5wcm9maWxlLT50aW1lX2hvbGQgKz0gTk9XKCkgLSBsb2Nr
LT5wcm9maWxlLT50aW1lX2xvY2tlZDsgICAgICBcDQo+PiAgICAgICAgICAgbG9jay0+cHJv
ZmlsZS0+bG9ja19jbnQrKzsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXA0KPj4gICAgICAgfQ0KPj4gLSNkZWZpbmUgTE9DS19QUk9GSUxFX1ZBUiAgICBz
X3RpbWVfdCBibG9jayA9IDANCj4+IC0jZGVmaW5lIExPQ0tfUFJPRklMRV9CTE9DSyAgYmxv
Y2sgPSBibG9jayA/IDogTk9XKCk7DQo+PiAtI2RlZmluZSBMT0NLX1BST0ZJTEVfR09UICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+
PiArI2RlZmluZSBMT0NLX1BST0ZJTEVfVkFSKHZhbCkgICAgc190aW1lX3QgYmxvY2sgPSAo
dmFsKQ0KPiANCj4gVGhpcyBtYWNybywgYW5kIHRoZW4gYXQgbGVhc3QgZm9yIGNvbnNpc3Rl
bmN5IGFsc28gLi4uDQo+IA0KPj4gKyNkZWZpbmUgTE9DS19QUk9GSUxFX0JMT0NLICBibG9j
ayA9IGJsb2NrID8gOiBOT1coKQ0KPiANCj4gLi4uIHRoaXMgb25lIHNob3VsZCBpbW8gdGFr
ZSB0aGUgdmFyaWFibGUgbmFtZSBhcyBhbiBhcmd1bWVudC4gT3RoZXJ3aXNlDQo+IHNpdHVh
dGlvbnMgbGlrZSAuLi4NCj4gDQo+PiAgIHZvaWQgX3NwaW5fYmFycmllcihzcGlubG9ja190
ICpsb2NrKQ0KPj4gICB7DQo+PiAgICAgICBzcGlubG9ja190aWNrZXRzX3Qgc2FtcGxlOw0K
Pj4gLSNpZmRlZiBDT05GSUdfREVCVUdfTE9DS19QUk9GSUxFDQo+PiAtICAgIHNfdGltZV90
IGJsb2NrID0gTk9XKCk7DQo+PiAtI2VuZGlmDQo+PiArICAgIExPQ0tfUFJPRklMRV9WQVIo
Tk9XKCkpOw0KPj4gICANCj4+ICAgICAgIGNoZWNrX2JhcnJpZXIoJmxvY2stPmRlYnVnKTsN
Cj4+ICAgICAgIHNtcF9tYigpOw0KPj4gQEAgLTQzMiwxMyArNDMxLDcgQEAgdm9pZCBfc3Bp
bl9iYXJyaWVyKHNwaW5sb2NrX3QgKmxvY2spDQo+PiAgICAgICB7DQo+PiAgICAgICAgICAg
d2hpbGUgKCBvYnNlcnZlX2hlYWQoJmxvY2stPnRpY2tldHMpID09IHNhbXBsZS5oZWFkICkN
Cj4+ICAgICAgICAgICAgICAgYXJjaF9sb2NrX3JlbGF4KCk7DQo+PiAtI2lmZGVmIENPTkZJ
R19ERUJVR19MT0NLX1BST0ZJTEUNCj4+IC0gICAgICAgIGlmICggbG9jay0+cHJvZmlsZSAp
DQo+PiAtICAgICAgICB7DQo+PiAtICAgICAgICAgICAgbG9jay0+cHJvZmlsZS0+dGltZV9i
bG9jayArPSBOT1coKSAtIGJsb2NrOw0KPj4gLSAgICAgICAgICAgIGxvY2stPnByb2ZpbGUt
PmJsb2NrX2NudCsrOw0KPj4gLSAgICAgICAgfQ0KPj4gLSNlbmRpZg0KPj4gKyAgICAgICAg
TE9DS19QUk9GSUxFX0JMS0FDQyhsb2NrLT5wcm9maWxlLCBibG9jayk7DQo+PiAgICAgICB9
DQo+PiAgICAgICBzbXBfbWIoKTsNCj4+ICAgfQ0KPiANCj4gLi4uIHRoaXMgYXJpc2Ugd2hl
cmUgdGhlcmUncyBubyB2aXNpYmxlIGRlY2xhcmF0aW9uIG9mICJibG9jayIsIGJ1dCBhDQo+
IHVzZS4gKE9yaWdpbmFsbHkgSSB3YXMgbWVhbmluZyB0byBhc2sgaG93IHRoaXMgZnVuY3Rp
b24gd291bGQgYnVpbGQsDQo+IHdoZW4gdGhlIGRlY2xhcmF0aW9uIGlzIGRyb3BwZWQuKQ0K
DQpPa2F5Lg0KDQoNCkp1ZXJnZW4NCg0K
--------------uKVwR0BXy7AP33Brw0Zk0piE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------uKVwR0BXy7AP33Brw0Zk0piE--

--------------riJy0eTQm0zjsv0eIQCa8ExY--

--------------nbbIPIugHUH5xZhsOGv50W1Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmUw8XMFAwAAAAAACgkQsN6d1ii/Ey8R
xAf8C9igTRKe5RqFkX8GU+A7pEdSBObcjCYcFnVR+HMSyTV9+R5ICeRTTsLsqGj7+3Za06gFiaEh
UeANMcnqyVHTPGbYbVTHj6kj1cVAT7z9CJHdetl4GI8WVI3HnIX6Hs6lfsi/XoP7KLh2xzX/6Hwd
zfWRjRYvEAMxJITJEuArYV5S/vlWpS0NlIpj0J9N7uAJ1odt/14wyaAy0ykAvIevyLqEVYBRyvCJ
BKLuUOlKQktlKHdz+lK1pl91/h31Nj7GNEV3gJbn66wYVgiU80pHbFSacXKhvEf/8DjwgPQSTBP1
UE3Y/8QrDonm0gUaC23hRdE7JFhcJywWyNYxXL8hjw==
=Hepb
-----END PGP SIGNATURE-----

--------------nbbIPIugHUH5xZhsOGv50W1Y--

