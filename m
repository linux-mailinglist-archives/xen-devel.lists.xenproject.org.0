Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3EBA2E1B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 10:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131288.1470441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23Rt-0000VE-G5; Fri, 26 Sep 2025 08:05:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131288.1470441; Fri, 26 Sep 2025 08:05:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23Rt-0000SD-Cs; Fri, 26 Sep 2025 08:05:01 +0000
Received: by outflank-mailman (input) for mailman id 1131288;
 Fri, 26 Sep 2025 08:05:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v23Rs-0000RE-1P
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 08:05:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f1eb5b4-9aaf-11f0-9d14-b5c5bf9af7f9;
 Fri, 26 Sep 2025 10:04:59 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8909B6B062;
 Fri, 26 Sep 2025 08:04:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A8CA1373E;
 Fri, 26 Sep 2025 08:04:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id COQjGClJ1mibbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 26 Sep 2025 08:04:57 +0000
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
X-Inumbo-ID: 7f1eb5b4-9aaf-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758873897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4sQh/CiinmBC59T4F3kvNbGZCHfl6iTQQwPV43dmacA=;
	b=PU6NGCkqodSIIY9wm2kn/FnRtDLysmv5gDbUt9EcG2e6y2T+Pc+CTiert36E8fayjBMCtI
	3ZQclQxi/hGqDoeX5T6PrgnYc9w/J5Kn9fGT/TKpVy5cu8666mDbIbDM2uOlUUumpMVoQ3
	TNW7FDXS6iu89jYFdcM+VoTpV10BLCM=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=PU6NGCkq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758873897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4sQh/CiinmBC59T4F3kvNbGZCHfl6iTQQwPV43dmacA=;
	b=PU6NGCkqodSIIY9wm2kn/FnRtDLysmv5gDbUt9EcG2e6y2T+Pc+CTiert36E8fayjBMCtI
	3ZQclQxi/hGqDoeX5T6PrgnYc9w/J5Kn9fGT/TKpVy5cu8666mDbIbDM2uOlUUumpMVoQ3
	TNW7FDXS6iu89jYFdcM+VoTpV10BLCM=
Message-ID: <9a2c77f3-fbdf-4d8a-8793-7d75f9ffb538@suse.com>
Date: Fri, 26 Sep 2025 10:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Unexpected growth of nr_cpu in `credit` Xen scheduler?
To: Igor Korkin <igor.korkin@gmail.com>, xen-devel@lists.xenproject.org
References: <CAC8oKvry6UFOE6B9dkfWFPEkehc3o4w+xJPZJe-sUpks6WmzNA@mail.gmail.com>
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
In-Reply-To: <CAC8oKvry6UFOE6B9dkfWFPEkehc3o4w+xJPZJe-sUpks6WmzNA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xKkZs2uT0YZrbDtpkOISbGHW"
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8909B6B062
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.41 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid]
X-Spam-Score: -5.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xKkZs2uT0YZrbDtpkOISbGHW
Content-Type: multipart/mixed; boundary="------------HJjWm7veJp2SSCfsX1IZIhOI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Igor Korkin <igor.korkin@gmail.com>, xen-devel@lists.xenproject.org
Message-ID: <9a2c77f3-fbdf-4d8a-8793-7d75f9ffb538@suse.com>
Subject: Re: [Question] Unexpected growth of nr_cpu in `credit` Xen scheduler?
References: <CAC8oKvry6UFOE6B9dkfWFPEkehc3o4w+xJPZJe-sUpks6WmzNA@mail.gmail.com>
In-Reply-To: <CAC8oKvry6UFOE6B9dkfWFPEkehc3o4w+xJPZJe-sUpks6WmzNA@mail.gmail.com>

--------------HJjWm7veJp2SSCfsX1IZIhOI
Content-Type: multipart/mixed; boundary="------------U6BH36iCPGn8AA4Wv6XOlzll"

--------------U6BH36iCPGn8AA4Wv6XOlzll
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDkuMjUgMDk6MTcsIElnb3IgS29ya2luIHdyb3RlOg0KPiBIaSBhbGwsDQo+IA0K
PiBJJ20gb2JzZXJ2aW5nIGEgc3RlYWR5IGFuZCBhYm5vcm1hbCBpbmNyZWFzZSBpbiB0aGUg
YG5yX2NwdWAgdmFsdWUNCj4gcmVwb3J0ZWQgYnkgdGhlIGBjcmVkaXRgIFhlbiBzY2hlZHVs
ZXINCj4gKHZpc2libGUgdmlhIGBzdWRvIHhsIGRtZXNnOyBzdWRvIHhsIGRlYnVnLWtleXMg
cmApLg0KPiANCj4gDQo+IFRoaXMgYmVoYXZpb3Igb2NjdXJzIGNvbnNpc3RlbnRseSB3aGVu
IHRoZSBzeXN0ZW0gaXMgc3ViamVjdGVkIHRvDQo+IGhlYXZ5IHN5bnRoZXRpYyBsb2FkIChl
LmcuLCBtdWx0aXBsZSBWTXMgcnVubmluZyBzdHJlc3Mgd29ya2xvYWRzIHRoYXQNCj4gZnVs
bHkgc2F0dXJhdGUgdkNQVXMpLg0KPiBPdmVyIHRpbWUsIGBucl9jcHVgIGdyb3dzIGZhciBi
ZXlvbmQgdGhlIGFjdHVhbCBudW1iZXIgb2YgcGh5c2ljYWwgb3INCj4gbG9naWNhbCBDUFVz
ICg0OCBpbiBvdXIgY2FzZSksIGFuZCB0aGlzIGNvcnJlbGF0ZXMgd2l0aCBub3RpY2VhYmxl
DQo+IHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLCBlc3BlY2lhbGx5IHVuZGVyIGhpZ2ggVk0g
ZGVuc2l0eS4NCg0KQ2FuIHlvdSBwbGVhc2Ugc2hhcmUgdGhlIHJlbGF0ZWQgb3V0cHV0PyBF
c3BlY2lhbGx5IG9uZSBpbnN0YW5jZSBvZg0KdGhlICJ4bCBkZWJ1Zy1rZXlzIHI7IHhsIGRt
ZXNnIiBiZWZvcmUgdGhlIHRlc3QgaXMgc3RhcnRpbmcsIGFuZCBvbmUNCndpdGggdGhlIHdy
b25nIG51bWJlciBvZiBjcHVzIGluIHRoZSBkYXRhLg0KPiBXZeKAmXJlIHJ1bm5pbmcgb24g
YSBkdWFsLXNvY2tldCB4ODZfNjQgc2VydmVyICgyIMOXIDEyLWNvcmUgSW50ZWwgWGVvbg0K
PiBTaWx2ZXIgNDMxMCBDUFVzIHdpdGggSHlwZXItVGhyZWFkaW5nLCB0b3RhbCA0OCBsb2dp
Y2FsIENQVXMpIHVuZGVyDQo+IFhlbiA0LjE5Lg0KPiANCj4gSXMgdGhpcyBncm93dGggb2Yg
YG5yX2NwdWAgZXhwZWN0ZWQgaW4gdGhlIGNyZWRpdCBzY2hlZHVsZXI/DQo+IElmIG5vdCwg
aXQgbWF5IGluZGljYXRlIGEgYnVnIGluIENQVSBhY2NvdW50aW5nIG9yIHJ1bnF1ZXVlIG1h
bmFnZW1lbnQNCj4gdGhhdCB3YXJyYW50cyBmdXJ0aGVyIGludmVzdGlnYXRpb24uDQo+IA0K
PiANCj4gRW52aXJvbm1lbnQgZGV0YWlsczoNCj4gLSB4ZW5fdmVyc2lvbiAgICAgICAgICAg
IDogNC4xOS4wLTUuMjUuMC4zODQzMQ0KPiAtIHhlbl9jYXBzICAgICAgICAgICAgICAgOiB4
ZW4tMy4wLXg4Nl82NCBodm0tMy4wLXg4Nl8zMg0KPiBodm0tMy4wLXg4Nl8zMnAgaHZtLTMu
MC14ODZfNjQxDQo+IC0geGVuX3NjaGVkdWxlciAgICAgICAgICA6IGNyZWRpdA0KPiAtIEhh
cmR3YXJlIDogRHVhbC1zb2NrZXQgSW50ZWwgWGVvbiBTaWx2ZXIgNDMxMCBAIDIuMTBHSHog
KDEyDQo+IGNvcmVzL3NvY2tldCwgSFQgZW5hYmxlZCwgNDggbG9naWNhbCBDUFVzKQ0KPiAt
IE5VTUEgbm9kZXMgOiAyDQo+IC0gRG9tMCBrZXJuZWwgOiBEZWJpYW4gNi4xLjE0Ny0xICg2
LjEuMC0zOC1hbWQ2NCwgU01QIFBSRUVNUFRfRFlOQU1JQykNCj4gLSBucl9jcHVzICAgICAg
ICAgICAgICAgIDogNDgNCj4gLSBucl9ub2RlcyAgICAgICAgICAgICAgIDogMg0KPiAtIHJl
bGVhc2UgICAgICAgICAgICAgICAgOiA2LjEuMC0zOC1hbWQ2NA0KPiAtIHZlcnNpb24gICAg
ICAgICAgICAgICAgOiAjMSBTTVAgUFJFRU1QVF9EWU5BTUlDIERlYmlhbiA2LjEuMTQ3LTEg
KDIwMjUtMDgtMDIpDQo+IC0gbWFjaGluZSAgICAgICAgICAgICAgICA6IHg4Nl82NA0KPiAt
IG5yX25vZGVzICAgICAgICAgICAgICAgOiAyDQo+IC0gY29yZXNfcGVyX3NvY2tldCAgICAg
ICA6IDEyDQo+IC0gdGhyZWFkc19wZXJfY29yZSAgICAgICA6IDINCj4gLSBjcHVfbWh6ICAg
ICAgICAgICAgICAgIDogMjEwMC4wMDANCj4gLSB2aXJ0X2NhcHMgICAgICAgICAgICAgIDog
cHYgaHZtIGh2bV9kaXJlY3RpbyBwdl9kaXJlY3RpbyBoYXAgc2hhZG93DQo+IGlvbW11X2hh
cF9wdF9zaGFyZSB2bXRyYWNlIGdudHRhYi12MSBnbnR0YWItdjINCj4gLSB0b3RhbF9tZW1v
cnkgICAgICAgICAgIDogMTMwNzI0DQo+IC0gZnJlZV9tZW1vcnkgICAgICAgICAgICA6IDU0
MDY0DQpQbGVhc2Ugc2hhcmUgdGhlIGNvbXBsZXRlICJ4bCBpbmZvIiBvdXRwdXQsIGluY2x1
ZGluZyB0aGUgeGVuIGNvbW1hbmQgbGluZS4NCg0KQXJlIHRoZXJlIGFueSBjcHVwb29scyBp
bnZvbHZlZD8gQW55IGNwdSBob3RwbHVnIG9wZXJhdGlvbnM/DQoNCg0KSnVlcmdlbg0K
--------------U6BH36iCPGn8AA4Wv6XOlzll
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------U6BH36iCPGn8AA4Wv6XOlzll--

--------------HJjWm7veJp2SSCfsX1IZIhOI--

--------------xKkZs2uT0YZrbDtpkOISbGHW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmjWSSgFAwAAAAAACgkQsN6d1ii/Ey/L
gggAk2YPNJHDmOexGlb/FBwKOtgKujRy+LA/0tVewOzWTkqm4MdSbhphBzUx2FixhU+dHCYilIV/
IOtJ7P8W+Ecr/E8VeCgOIC8wA8RB/HG7czbMWyJW0zIHNAinNRVNCdMImMbgqcrptmNrL+H7mcVo
sDMQYBxURIPJiF1xzFzztYUHEcWlimhPay0LDvccZJ9gBDyprlCpYKblx4PbFQmbsak3pYBulNI8
DATnud0oS7SODqtPJseDnNUjbv58LThV9VoJOcwCjFSNTvvib3qPNYlAJ4dS+NB7U5JLYxrtTIvf
uxssxrYFUIGs1VG0L4hUkvykcgZ5Rvt+STc0I7Q2GQ==
=454j
-----END PGP SIGNATURE-----

--------------xKkZs2uT0YZrbDtpkOISbGHW--

