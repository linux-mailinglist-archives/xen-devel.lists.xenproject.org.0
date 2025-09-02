Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E935B4007D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106294.1457010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQ7l-0000gC-Fd; Tue, 02 Sep 2025 12:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106294.1457010; Tue, 02 Sep 2025 12:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQ7l-0000dk-Bw; Tue, 02 Sep 2025 12:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1106294;
 Tue, 02 Sep 2025 12:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Hxa=3N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1utQ7k-0000de-0W
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:28:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5568fc30-87f8-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 14:28:30 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B6EE91F394;
 Tue,  2 Sep 2025 12:28:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EE2413888;
 Tue,  2 Sep 2025 12:28:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2sRrIezitmjhRwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 02 Sep 2025 12:28:28 +0000
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
X-Inumbo-ID: 5568fc30-87f8-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756816110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G+K/VzTMBzDs7fQuBwyce8UB6JA4tcDdbMURhPihSLs=;
	b=SsKQ5bQHFMI1jiiibkGf119YXhl47qIZbqQoJvv552ZqxgNP0wS6jcHvtvP1gXid/cxvXV
	fDkfSxysUP7G02xScHykeP8i7ADvJdY70u0+IfuVlpTsZYNDhUBVdY0T7rzWV4RQq1R6+0
	g2YloKLZrkBNl7CKrzHTEitOvaohS/k=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=XRSxzP4N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1756816108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G+K/VzTMBzDs7fQuBwyce8UB6JA4tcDdbMURhPihSLs=;
	b=XRSxzP4Ng+lEc2B6GbMUbIC1UW8LXaauMBo0M5R9iR2oqljfRtYdFLrr/DxRnDxmQzHF/x
	DXPaD8ORdrpXqjjlA9PvOO5oDKCKjmmatiHgqcxBqeF5a0+L1kBpq+/dx0ljSbxdvW9eIi
	8bxNlS4F+sfJ8l2NnYHAvzbHe+5NvU0=
Message-ID: <2ad255ea-6c5e-4e9a-a821-db7449432399@suse.com>
Date: Tue, 2 Sep 2025 14:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue with dom0_pvh on Xen 4.20
From: Juergen Gross <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
Content-Language: en-US
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
In-Reply-To: <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c87ClrN02AQArw9YFUsUmFmv"
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: B6EE91F394
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -6.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c87ClrN02AQArw9YFUsUmFmv
Content-Type: multipart/mixed; boundary="------------U8ErYhD1Ftw9n9VvnoXNUylP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <2ad255ea-6c5e-4e9a-a821-db7449432399@suse.com>
Subject: Re: issue with dom0_pvh on Xen 4.20
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
In-Reply-To: <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>

--------------U8ErYhD1Ftw9n9VvnoXNUylP
Content-Type: multipart/mixed; boundary="------------H00j1QskIirtmuvCQULPLslD"

--------------H00j1QskIirtmuvCQULPLslD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDkuMjUgMTQ6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDAyLjA5LjI1
IDEyOjU2LCBNYW51ZWwgQm91eWVyIHdyb3RlOg0KPj4gT24gVHVlLCBTZXAgMDIsIDIwMjUg
YXQgMTE6NDQ6MzZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAwMi8w
OS8yMDI1IDExOjE3IGFtLCBNYW51ZWwgQm91eWVyIHdyb3RlOg0KPj4+PiBIZWxsbywNCj4+
Pj4gSSdtIHRyeWluZyB0byBib290IGEgTmV0QlNEIFBWSCBkb20wIG9uIFhlbiA0LjIwLg0K
Pj4+PiBUaGUgc2FtZSBOZXRCU0Qga2VybmVsIHdvcmtzIGZpbmUgd2l0aCBYZW4gNC4xOA0K
Pj4+Pg0KPj4+PiBUaGUgYm9vdCBvcHRpb25zIGFyZToNCj4+Pj4gbWVudT1Cb290IG5ldGJz
ZC1jdXJyZW50IFBWSCBYZW40MjA6ZGV2IGhkMGY6O2xvYWQgL25ldGJzZC1QVkggY29uc29s
ZT1jb20wIA0KPj4+PiByb290PXdkMGY7IG11bHRpYm9vdCAveGVuNDIwLWRlYnVnLmd6IGRv
bTBfbWVtPTEwMjRNIGNvbnNvbGU9Y29tMSANCj4+Pj4gY29tMT0zODQwMCw4bjEgbG9nbHZs
PWFsbCBndWVzdF9sb2dsdmw9YWxsIGdudHRhYl9tYXhfbnJfZnJhbWVzPTY0IA0KPj4+PiBz
eW5jX2NvbnNvbGU9MSBkb20wPXB2aA0KPj4+Pg0KPj4+PiBhbmQgdGhlIGZ1bGwgbG9nIGZy
b20gc2VyaWFsIGNvbnNvbGUgaXMgYXR0YWNoZWQuDQo+Pj4+DQo+Pj4+IFdpdGggNC4yMCB0
aGUgYm9vdCBmYWlscyB3aXRoOg0KPj4+Pg0KPj4+PiAoWEVOKSAqKiogU2VyaWFsIGlucHV0
IHRvIERPTTAgKHR5cGUgJ0NUUkwtYScgdGhyZWUgdGltZXMgdG8gc3dpdGNoIGlucHV0KQ0K
Pj4+PiAoWEVOKSBGcmVlZCA2NjRrQiBpbml0IG1lbW9yeQ0KPj4+PiAoWEVOKSBkMHYwIFRy
aXBsZSBmYXVsdCAtIGludm9raW5nIEhWTSBzaHV0ZG93biBhY3Rpb24gMQ0KPj4+PiAoWEVO
KSAqKiogRHVtcGluZyBEb20wIHZjcHUjMCBzdGF0ZTogKioqDQo+Pj4+IChYRU4pIC0tLS1b
IFhlbi00LjIwLjItcHJlXzIwMjUwODIxbmIwwqAgeDg2XzY0wqAgZGVidWc9ecKgIFRhaW50
ZWQ6wqDCoCBDwqDCoMKgIF0tLS0tDQo+Pj4+IChYRU4pIENQVTrCoMKgwqAgNw0KPj4+PiAo
WEVOKSBSSVA6wqDCoMKgIDAwMDg6WzwwMDAwMDAwMDAwMjBlMjY4Pl0NCj4+Pj4gKFhFTikg
UkZMQUdTOiAwMDAwMDAwMDAwMDEwMDA2wqDCoCBDT05URVhUOiBodm0gZ3Vlc3QgKGQwdjAp
DQo+Pj4+IChYRU4pIHJheDogMDAwMDAwMDAyMDI0YzAwM8KgwqAgcmJ4OiAwMDAwMDAwMDAw
MjBlMjYwwqDCoCByY3g6IDAwMDAwMDAwMDAwZGZlYjcNCj4+Pj4gKFhFTikgcmR4OiAwMDAw
MDAwMDAwMTAwMDAwwqDCoCByc2k6IDAwMDAwMDAwMDAxMDMwMDDCoMKgIHJkaTogMDAwMDAw
MDAwMDEzZTAwMA0KPj4+PiAoWEVOKSByYnA6IDAwMDAwMDAwODAwMDAwMDDCoMKgIHJzcDog
MDAwMDAwMDAwMTQwMDJlNMKgwqAgcjg6wqAgMDAwMDAwMDAwMDAwMDAwMA0KPj4+PiAoWEVO
KSByOTrCoCAwMDAwMDAwMDAwMDAwMDAwwqDCoCByMTA6IDAwMDAwMDAwMDAwMDAwMDDCoMKg
IHIxMTogMDAwMDAwMDAwMDAwMDAwMA0KPj4+PiAoWEVOKSByMTI6IDAwMDAwMDAwMDAwMDAw
MDDCoMKgIHIxMzogMDAwMDAwMDAwMDAwMDAwMMKgwqAgcjE0OiAwMDAwMDAwMDAwMDAwMDAw
DQo+Pj4+IChYRU4pIHIxNTogMDAwMDAwMDAwMDAwMDAwMMKgwqAgY3IwOiAwMDAwMDAwMDAw
MDAwMDExwqDCoCBjcjQ6IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4gKFhFTikgY3IzOiAwMDAw
MDAwMDAwMDAwMDAwwqDCoCBjcjI6IDAwMDAwMDAwMDAwMDAwMDANCj4+Pj4gKFhFTikgZnNi
OiAwMDAwMDAwMDAwMDAwMDAwwqDCoCBnc2I6IDAwMDAwMDAwMDAwMDAwMDDCoMKgIGdzczog
MDAwMDAwMDAwMDAwMDAwMA0KPj4+PiAoWEVOKSBkczogMDAxMMKgwqAgZXM6IDAwMTDCoMKg
IGZzOiAwMDAwwqDCoCBnczogMDAwMMKgwqAgc3M6IDAwMTDCoMKgIGNzOiAwMDA4DQo+Pj4+
DQo+Pj4+IGJlY2F1c2Ugb2YgdGhlIHRyaXBsZSBmYXVsdCB0aGUgUklQIGFib3ZlIGRvZW5z
J3QgcG9pbnQgdG8gdGhlIGNvZGUuDQo+Pj4+DQo+Pj4+IEkgdHJhY2tlZCBpdCBkb3duIHRv
IHRoaXMgY29kZToNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBjbXBswqDCoMKgICQwLCVlY3jC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA7wqDCoMKgwqDCoMKgIC8qIHplcm8t
c2l6ZWQ/ICovwqDCoMKgwqDCoMKgIFwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBqZcKgwqDC
oMKgwqAgMmbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOyBc
DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgcHVzaGzCoMKgICVlYnDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA7IFwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBtb3Zs
wqDCoMKgIFJFTE9DKG5veF9mbGFnKSwlZWJwwqDCoMKgIDsgXA0KPj4+PiAxOsKgwqDCoMKg
wqAgbW92bMKgwqDCoCAlZWJwLChQREVfU0laRS00KSglZWJ4KSA7wqDCoMKgwqDCoMKgIC8q
IHVwcGVyIDMyIGJpdHM6IE5YICovIFwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBtb3ZswqDC
oMKgICVlYXgsKCVlYngpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDvCoMKgwqDCoMKgwqAg
Lyogc3RvcmUgcGh5cyBhZGRyICovwqDCoCBcDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgYWRk
bMKgwqDCoCAkUERFX1NJWkUsJWVieMKgwqDCoMKgwqDCoMKgwqDCoCA7wqDCoMKgwqDCoMKg
IC8qIG5leHQgUFRFL1BERSAqL8KgwqDCoMKgwqAgXA0KPj4+PiDCoMKgwqDCoMKgwqDCoMKg
IGFkZGzCoMKgwqAgJFBBR0VfU0laRSwlZWF4wqDCoMKgwqDCoMKgwqDCoCA7wqDCoMKgwqDC
oMKgIC8qIG5leHQgcGh5cyBwYWdlICovwqDCoMKgIFwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oCBsb29wwqDCoMKgIDFiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDsgXA0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgIHBvcGzCoMKgwqAgJWVicMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDsgXA0KPj4+PiAyOsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDsNCj4+Pj4NCj4+Pj4gdGhlcmUgYXJlIG90aGVycyBwdXNobC9wb3BsIGJl
Zm9yZSBzbyBJIGRvbid0IHRoaW5rIHRoYXQncyB0aGUgcHJvYmxlbQ0KPj4+PiAoaW4gZmFj
dCB0aGUgZXhhY3Qgc2FtZSBmcmFnbWVudCBpcyBjYWxsZWQganVzdCBiZWZvcmUgd2l0aCBk
aWZmZXJlbnQNCj4+Pj4gaW5wdXRzIGFuZCBpdCBkb2Vzbid0IGZhdWx0KS4gU28gdGhlIGN1
bHByaXQgaXQgcHJvYmFibHkgdGhlIHdyaXRlIHRvICglZWJ4KSwNCj4+Pj4gd2hpY2ggd291
bGQgYmUgMHgyMGUyNjANCj4+Pj4gVGhpcyBpcyBpbiB0aGUgcmFuZ2U6DQo+Pj4+IChYRU4p
wqAgWzAwMDAwMDAwMDAxMDAwMDAsIDAwMDAwMDAwNDAwNjhlNzddICh1c2FibGUpDQo+Pj4+
IHNvIEkgY2FuJ3Qgc2VlIHdoeSB0aGlzIHdvdWxkIGJlIGEgcHJvYmxlbS4NCj4+Pj4NCj4+
Pj4gQW55IGlkZWEsIGluY2x1ZGluZyBob3cgdG8gZGVidWcgdGhpcyBmdXJ0aGVyLCB3ZWxj
b21lDQo+Pj4NCj4+PiBFdmVuIHRob3VnaCB0cmlwbGUgZmF1bHQncyBhcmUgYWJvcnRzLCB0
aGV5J3JlIGdlbmVyYWxseSBhY2N1cmF0ZSB1bmRlcg0KPj4+IHZpcnQsIHNvIDB4MjBlMjY4
IGlzIG1vc3QgbGlrZWx5IHdoZXJlIHRoaW5ncyBkaWUuDQo+Pg0KPj4gYnV0IHRoYXQncyB0
aGUgUklQIG9mIHRoZSBsYXN0IGZhdWx0LCBub3QgdGhlIGZpcnN0IG9uZSwgcmlnaHQgPw0K
Pj4gMHgyMGUyNjggaXNuJ3QgaW4gdGhlIHRleHQgc2VnbWVudCBvZiB0aGUga2VybmVsLCBt
eSBndWVzcyBpcyB0aGF0IHRoZQ0KPj4gZmlyc3QgZmF1bHQgdHJpZ2dlcnMgYW4gZXhjZXB0
aW9uLCBidXQgdGhlIGV4ZXB0aW9uIGhhbmRsZXIgaXNuJ3Qgc2V0IHVwIHlldA0KPj4gc28g
d2UgZW5kIHVwIGp1bXBpbmcgdG8gc29tZSByYW5kb20gdmFsdWUuDQo+Pg0KPiANCj4gV2hh
dCBwdXp6bGVzIG1lIGlzIHRoYXQ6DQo+IA0KPiAtICVjcjIgaXMgMCwgc28gcHJvYmFibHkg
dGhlIGZpcnN0IGZhdWx0IHdhc24ndCBhIHBhZ2UgZmF1bHQNCj4gLSBSSVAgaXMgJWVieCAr
IDgsIHNvIG1heWJlIHRoZSBjb2RlIHdhcyBqdXN0IGNsb2JiZXJlZCBieSB0aGUgbG9vcD8N
Cj4gDQo+IENvdWxkIGl0IGJlIHRoZSBjb2RlIGhhcyBiZWVuIG1vdmVkIHRvIHRoaXMgbG9j
YXRpb24sIG9yIGlzIGFib3V0IHRvDQo+IGJlIG1vdmVkIGF3YXkgYWZ0ZXJ3YXJkcz8NCg0K
QW5kIGluZGVlZDogZnJvbSB0aGUgZnVsbCBib290IGxvZyBJIGNhbiBzZWU6DQoNCihYRU4p
ICAgICB2aXJ0X2Jhc2UgICAgICAgID0gMHgwDQooWEVOKSAgICAgZWxmX3BhZGRyX29mZnNl
dCA9IDB4MA0KKFhFTikgICAgIHZpcnRfb2Zmc2V0ICAgICAgPSAweDANCihYRU4pICAgICB2
aXJ0X2tzdGFydCAgICAgID0gMHgyMDAwMDANCihYRU4pICAgICB2aXJ0X2tlbmQgICAgICAg
ID0gMHgxN2JhYjkwDQooWEVOKSAgICAgdmlydF9lbnRyeSAgICAgICA9IDB4MjBlNGQwDQoN
ClNvIHZpcnRfa2VudHJ5IGlzIHZlcnkgbmVhciB0byB0aGUgUklQLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------H00j1QskIirtmuvCQULPLslD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------H00j1QskIirtmuvCQULPLslD--

--------------U8ErYhD1Ftw9n9VvnoXNUylP--

--------------c87ClrN02AQArw9YFUsUmFmv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmi24uwFAwAAAAAACgkQsN6d1ii/Ey97
TggAhzQfnvJ6djcEd4dgO1Jrj+LkBtdL22GbIb9LNVhzXvdGzFRAKH1U0SBijzk5QJzlb87IaGBf
qDMwDarjh6Nk9BfwXNIybr26dmdmutzELH07tLjsSMqfxSRR/vptnpGva0kqaHwzm0DRmd0U7OAp
HWDrPstKpulStsQL8KP7vpcMkubmPUxTDw5eRKsGMnbxAOrwhfTA1rH0CGUBo7N4RZ0WZ6Q8niDq
WY6/NUUbtcxDdIgrDPKas7OfC2fINfDynpPbRA6yDpzGeolFN5/AIvuWX0NlsNPweOYJjSjGR126
XQTWYjsntOtQqafjas6vJqj1pr5b8lsRt0b3dvUyMQ==
=ki0z
-----END PGP SIGNATURE-----

--------------c87ClrN02AQArw9YFUsUmFmv--

