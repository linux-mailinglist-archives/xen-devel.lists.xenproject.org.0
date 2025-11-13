Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16BC55F88
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 07:47:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160642.1488713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJR6F-0000N4-LN; Thu, 13 Nov 2025 06:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160642.1488713; Thu, 13 Nov 2025 06:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJR6F-0000LE-I7; Thu, 13 Nov 2025 06:46:31 +0000
Received: by outflank-mailman (input) for mailman id 1160642;
 Thu, 13 Nov 2025 06:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lXFW=5V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJR6D-0000Kf-OZ
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 06:46:29 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab8927b-c05c-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 07:46:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AE5B8218FB;
 Thu, 13 Nov 2025 06:46:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8D0343EA61;
 Thu, 13 Nov 2025 06:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7rv1IMJ+FWmtUgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 13 Nov 2025 06:46:26 +0000
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
X-Inumbo-ID: 7ab8927b-c05c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763016386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0CQSXzirt5jkt2QxgJkUMdJ0KDvIsVBosMFpoGQso3Y=;
	b=YSmY3FkQWWYs/ad0yS0XeExCC5AQ/dnlsD2iMKjl3Lp/mKRKOt0oPETwt6M8BYjJ0yix5a
	dUwkci5fs1SorLZ3e2hJf+6k9fnmGFPMOLtaZV9RTD5PPgxpCpKx/WB+fUsEEoATCz+aGE
	tcs71LtuhwAd9aOc46iA6EKMuQWXYd0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1763016386; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0CQSXzirt5jkt2QxgJkUMdJ0KDvIsVBosMFpoGQso3Y=;
	b=YSmY3FkQWWYs/ad0yS0XeExCC5AQ/dnlsD2iMKjl3Lp/mKRKOt0oPETwt6M8BYjJ0yix5a
	dUwkci5fs1SorLZ3e2hJf+6k9fnmGFPMOLtaZV9RTD5PPgxpCpKx/WB+fUsEEoATCz+aGE
	tcs71LtuhwAd9aOc46iA6EKMuQWXYd0=
Message-ID: <8b3d8e28-6501-462e-b028-8f4dc44027e7@suse.com>
Date: Thu, 13 Nov 2025 07:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen DomU Bootloader Experiences
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
References: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
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
In-Reply-To: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uB80qtV9gL8muERTY0LCTpVp"
X-Spam-Level: 
X-Spamd-Result: default: False [-5.20 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -5.20

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uB80qtV9gL8muERTY0LCTpVp
Content-Type: multipart/mixed; boundary="------------DAqQCSpoGUJyWUwk8B7Srrtt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org
Message-ID: <8b3d8e28-6501-462e-b028-8f4dc44027e7@suse.com>
Subject: Re: Xen DomU Bootloader Experiences
References: <aRT4fiuF8soWI6tc@mattapan.m5p.com>
In-Reply-To: <aRT4fiuF8soWI6tc@mattapan.m5p.com>

--------------DAqQCSpoGUJyWUwk8B7Srrtt
Content-Type: multipart/mixed; boundary="------------RkIsOllKgeNEoAtS0urlvohf"

--------------RkIsOllKgeNEoAtS0urlvohf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMTEuMjUgMjI6MTMsIEVsbGlvdHQgTWl0Y2hlbGwgd3JvdGU6DQo+IEEgZmV3IHRp
bWVzIHRoZXJlIGhhdmUgYmVlbiBtZW50aW9ucyBvZiBhIG5lZWQgdG8gY2hvb3NlIGJldHdl
ZW4gYm9vdA0KPiBtZXRob2RzIGZvciBEb21Vcy4gIFRoZXJlIGlzIGEgbmVlZCB0byBkZWNp
ZGUgb24gb25lcyB0byByZWNvbW1lbmQgYW5kDQo+IHB1dCBlZmZvcnQgaW50byBzdXBwb3J0
dGluZy4gIEkgbWF5IG5vdCBoYXZlIHRyaWVkIHRoYXQgbWFueSBub3IgZG9uZQ0KPiBwYXJ0
aWN1bGFybHkgZ3JlYXQgYW1vdW50cyBvZiBleHBlcmltZW50YXRpb24sIGJ1dCBJIGRvIGhh
dmUgc29tZQ0KPiBleHBlcmllbmNlIHdpdGggbXVsdGlwbGUgVXNlciBEb21haW4gYm9vdGxv
YWRlcnMuDQo+IA0KPiBQeUdSVUINCj4gWGVuJ3MgYm9vdGxvYWRlci4gIFB5R1JVQiBpcyBx
dWl0ZSBmdW5jdGlvbmFsIHdpdGhpbiBpdHMgbGltaXRzLiAgSW4NCj4gcGFydGljdWxhciBp
dCBzaW11bGF0ZXMgdGhlIGRvbWFpbidzIGVudmlyb25tZW50IGluIERvbWFpbiAwLiAgVGhp
cyBtZWFucw0KPiB0aGUgc2VjdXJpdHkgZXhwb3N1cmUgaXMgcHJvYmxlbWF0aWMuICBBbm90
aGVyIGJpZyBjb25jZXJuIGlzIHRoYXQgaXQNCj4gb25seSBkb2VzIEdSVUIgdjEgc3ludGF4
LiAgRm9yIGEgbG9uZyB3aGlsZSBEZWJpYW4gaGFkIGEgcGFja2FnZSBmb3INCj4gZ2VuZXJh
dGluZyB0aG9zZSBmaWxlcyBvbiBhIG1vZGVybiBzeXN0ZW0sIGJ1dCB0aGF0IHBhY2thZ2Ug
d2FzIGRyb3BwZWQuDQo+IA0KPiBZZXQgUHlHUlVCIGRvZXMgYXZvaWQgbmVlZGluZyB0byB1
c2UgZXh0ZXJuYWwgdG9vbHMgdG8gcmV0cmlldmUgdGhlDQo+IGtlcm5lbC4gIElmIHRoZSBr
ZXJuZWwgaXMgdXBkYXRlZCBpbnNpZGUgdGhlIGRvbWFpbiwgdGhpcyBkb2VzIGdldCB0aGUN
Cj4gbmV3IGtlcm5lbC4gIEZ1cnRoZXIgYmVpbmcgYXJjaGl0ZWN0dXJlLWluZGVwZW5kZW50
IHRoaXMgd29ya3Mgb24geDg2LA0KPiBBUk0qLCBSSVNDLVYgYW5kIFBvd2VyUEMuDQo+IA0K
PiBBcyBpdCBpcyB0aGUgb25seSBHUlVCLWZsYXZvciBsb2FkZXIgYXZhaWxhYmxlIG9uIEFS
TSosIHRoYXQgaXMgdGhlIG9ubHkNCj4gcGxhY2Ugd2hlcmUgSSd2ZSB1c2VkIFB5R1JVQi4N
Cg0KVGhlcmUgaXMgb25lIGZ1cnRoZXIgYWR2YW50YWdlIGZvciBQeUdSVUI6IGl0IGNhbiBs
b29rIGludG8gdGhlIGtlcm5lbA0KX2JlZm9yZV8gdGhlIGRvbVUgaXMgYmVpbmcgY3JlYXRl
ZCwgc28gaXQgY2FuIHRlbGwgWGVuIHRvb2xzIHdoZXRoZXIgYQ0KMzItIG9yIDY0LWJpdCBk
b21VIGlzIG5lZWRlZCBiYXNlZCBvbiB0aGUgc2VsZWN0ZWQga2VybmVsLg0KDQpUaGlzIGlz
IHRoZSBtYWluIHJlYXNvbiB3aHkgUHlHUlVCIGlzIHN0aWxsIGV4aXN0aW5nLg0KDQo+IFB2
R1JVQg0KPiBJJ20gc3VyZSBuZWFybHkgZXZlcnlvbmUga25vd3MgYWJvdXQgUHZHUlVCLiAg
QnkgYmVpbmcgYSBwcm9wZXIgcG9ydCBvZg0KPiBHUlVCIHRvIHJ1biBkaXJlY3RseSBvbiBY
ZW4sIGl0IG92ZXJjb21lcyBQeUdSVUIncyBkaXNhZHZhbnRhZ2VzLiAgVGhlDQo+IG9uZSBk
aXNhZHZhbnRhZ2UgaXMgbmVlZGluZyB0byBnZXQgcGF0Y2hlcyBpbnRvIGFuIGV4dGVybmFs
IHByb2plY3QgZm9yDQo+IGNoYW5nZXMgaW4gWGVuLg0KPiANCj4gVHdvIGNoYW5nZXMgdG8g
WGVuIHVyZ2VudGx5IG5lZWQgcHJvcG9nYXRpb24gdG8gUHZHUlVCLiAgSSdtIHVuc3VyZQ0K
PiB3aGV0aGVyIFB2R1JVQiB1bm1hcHMgaXRzIG1hcHBpbmcgb2YgdmNwdV9pbmZvIGRhdGEu
ICBUaGUgc2Vjb25kIGlzDQo+IG5lZWRpbmcgdG8gd29yayBvbiBBUk0qLCBSSVNDLVYgYW5k
IFBvd2VyUEMuICBUaGUgbGF0dGVyIGlzIHRoZSBvbmUgYW5kDQo+IG9ubHkgd2F5IGluIHdo
aWNoIFB2R1JVQiBpcyBpbmZlcmlvciB0byBQeUdSVUIuDQo+IA0KPiBBcyBQdkdSVUIgaXMg
b25seSBhdmFpbGFibGUgZm9yIHg4NiwgdGhhdCBpcyB0aGUgb25seSBwbGFjZSBJJ3ZlIHVz
ZWQNCj4gUHZHUlVCLg0KDQpOYW1pbmcgaXMgZGlmZmljdWx0LiA6LSkNCg0KWW91IGFyZSB0
YWxraW5nIGFib3V0IGdydWItcHYuIHB2LWdydWIgaXMgdGhlIFhlbi1pbnRlcm5hbCB2YXJp
YW50IGJhc2VkDQpvbiBNaW5pLU9TIGFuZCBsZWdhY3kgZ3J1YiAwLjk3LCBzdXBwb3J0aW5n
IGdydWIgZm9yIFBWLWRvbVVzLg0KDQpncnViLXB2IGNvbWVzIGJhc2ljYWxseSBpbiB0aHJl
ZSBmbGF2b3JzLCBhbGwgeDg2LW9ubHk6DQoNCi0gZm9yIDMyLWJpdCBQVi1ndWVzdHMNCi0g
Zm9yIDY0LWJpdCBQVi1ndWVzdHMNCi0gZm9yIFBWSC1ndWVzdHMgKDMyLSBvciA2NC1iaXQp
DQoNCkFkZGluZyBQVkggc3VwcG9ydCB0byB1cHN0cmVhbSBHcnViIGZvciBlLmcuIEFybSBz
aG91bGQgYmUgcmF0aGVyIGVhc3kuDQoNCj4gDQo+IA0KPiBFREsyL1RpYW5vY29yZQ0KPiBR
dWl0ZSB3ZWxsLWtub3duIGZvciBiZWluZyB0aGUgYmFzaXMgb2YgbW9zdCB4ODYgZmlybXdh
cmVzLCBwbHVzIGJlaW5nDQo+IHBhcnQgb2YgYSB0eXBpY2FsIFFlbXUgc2V0dXAuICBOb3Qg
bmVhcmx5IGFzIHdlbGwga25vd24gZm9yIGJlaW5nIGEgWGVuDQo+IERvbVUgYm9vdGxvYWRl
ci4NCj4gDQo+IFdoZW4gaXQgd2FzIHdvcmtpbmcgeW91IHdvdWxkIGJ1aWxkIHRoZWlyIEFy
bVZpcnRYZW4uZHNjIGZpbGUgYW5kIGdldA0KPiBYRU5fRUZJLmZkIGFzIG91dHB1dC4gIFlv
dSB3b3VsZCB0aGVuIHVzZSBYRU5fRUZJLmZkIGZvciB0aGUgZG9tYWluJ3MNCj4ga2VybmVs
LiAgSWYgeW91IGxvb2tlZCBhdCB0aGUgY29uc29sZSB5b3Ugc2F3IHNvbWV0aGluZyB3aGlj
aCBsb29rZWQgYW5kDQo+IGFjdGVkIHByZXR0eSBzaW1pbGFyIHRvIGEgVUVGSSBmaXJtd2Fy
ZSBvbiB4ODYgbWFjaGluZXMuICBUaGlzIHdhcw0KPiBleHRyZW1lbHkgZnVuY3Rpb25hbCBm
b3IgT1NlcyB3aGljaCBkaWRuJ3QgcGFydGljdWxhcmx5IGxpa2UgR1JVQi4NCj4gTm90YWJs
eSBJJ3ZlIHJlYWQgb2YgaXQgYmVpbmcgYWJsZSB0byBsb2FkIGEgUmVkbW9uZCBPUyBhbmQg
aXQgd2FzIHF1aXRlDQo+IGZ1bmN0aW9uYWwgZm9yIGJvb3RpbmcgYW4gQVJNNjQgcG9ydCBv
ZiBGcmVlQlNELg0KPiANCj4gU29tZXRpbWUgYWZ0ZXIgTm92ZW1iZXIgMTZ0aCwgMjAyMiBv
ciBjb21taXQgZmZmNmQ4MTI3MC4gIFRoZSBidWlsdA0KPiBpbWFnZXMgc3RvcHBlZCBmdW5j
dGlvbmluZy4gIFRoaXMgaXMgYWN0dWFsbHkgcmF0aGVyIGNvbmNlcm5pbmcgc2luY2UgaXQN
Cj4gbWF5IGFsc28gZWZmZWN0cyBmaXJtd2FyZXMgYnVpbHQgZm9yIHg4NiBIVk0gZG9tYWlu
cy4gIEkgZG9uJ3QgcHJlc2VudGx5DQo+IGtub3cgd2hldGhlciB0aGVyZSBhcmUgbXVsdGlw
bGUgYnVncywgb3IgYSBzaW5nbGUgb25lIGVmZmVjdGluZyBhbGwgWGVuDQo+IGJ1aWxkcy4N
Cj4gDQo+IFRoZXJlIGlzIGFsc28gYW4gdXJnZW50IG5lZWQgdG8gZ2V0IEVESzIvVGlhbm9j
b3JlIHVwZGF0ZWQgdG8gbWF0Y2gNCj4gWGVuL0FSTSdzIGRpc2FsbG93aW5nIG1hcHBpbmcg
dGhlIHNoYXJlZCBpbmZvcm1hdGlvbiBwYWdlIG11bHRpcGxlIHRpbWVzLg0KPiBBcyBJIGRp
ZCBub3Qgd2lzaCB0byBiZWNvbWUgZGVlcGx5IGludm9sdmVkIHdpdGggRURLMi9UaWFub2Nv
cmUgSSBzZW50IGENCj4gcGF0Y2ggdG8geGVuLWRldmVsIGNsb3NlIHRvIDEuNSB5ZWFycyBh
Z28uICBMYWNrIG9mIGFjdGlvbiBzdWdnZXN0cyB0aGVyZQ0KPiBpcyBhbiB1cmdlbnQgbmVl
ZCBmb3IgYSBsaWFzb24uDQo+IA0KPiANCj4gDQo+IFJlY29tbWVuZGF0aW9uczoNCj4gUHlH
UlVCIGlzIGZ1bmN0aW9uYWwgd2l0aGluIGl0cyBsaW1pdHMuICBQcm9ibGVtcyBhcmUgR1JV
QnYxIHN5bnRheCBhbmQNCj4gcnVubmluZyB3aXRoaW4gRG9tYWluIDAuICBHaXZlbiB0aGlz
IEkgZmVlbCB0aGUgWGVuIFByb2plY3Qgc2hvdWxkIGJlDQo+IGhlYWRpbmcgdG93YXJkcyBk
ZXByZWNhdGluZyBQeUdSVUIuICBTaW5jZSBQdkdSVUIgd29ya3MgZm9yIHg4NiBub3csIEkN
Cj4gd291bGQgZGVmYXVsdCB0byBuZWl0aGVyIGJ1aWxkaW5nIG5vciBpbnN0YWxsaW5nIFB5
R1JVQiBvbiB4ODYuICBGb3INCj4gb3RoZXIgYXJjaGl0ZWN0dXJlcyBQeUdSVUIgaXMgc3Rp
bGwgdXNlZnVsLg0KPiANCj4gVGhlIFhlbiBQcm9qZWN0IHNob3VsZCBmb3JtYWxseSBhc2sg
dGhlIEdSVUIgUHJvamVjdCB0byBwb3J0IFB2R1JVQiB0bw0KPiBBUk0sIFJJU0MtViBhbmQg
UG93ZXJQQy4gIFRoZSBuZWVkIGZvciBQdkdSVUIgb24gQVJNIHNlZW1zIHJhdGhlciB1cmdl
bnQuDQo+IFdpdGhvdXQgYSBwcm9wZXIgYm9vdGxvYWRlciBWTXMgYXJlbid0IHRvbyB1c2Vm
dWwuDQoNCldlbGwsIEkgZGlkIHRoZSBncnViLXB2aCBpbXBsZW1lbnRhdGlvbi4NCg0KRG9p
bmcgdGhhdCBmb3Igb3RoZXIgYXJjaGl0ZWN0dXJlcyBzaG91bGRuJ3QgYmUgcm9ja2V0IHNj
aWVuY2UuIDotKQ0KDQo+IFRoZSBYZW4gUHJvamVjdCBuZWVkcyBwZW9wbGUgdG8gd29yayB3
aXRoIEVESzIvVGlhbm9jb3JlLiAgVGhlIG9sZGVzdA0KPiByZXBvcnQgSSd2ZSBzZWVuIG9m
IHRoZSBFREsyL1RpYW5vY29yZSBpc3N1ZSBkYXRlcyB0byBtaWQtMjAyMy4gIE5vdyB0d28N
Cj4geWVhcnMgbGF0ZXIgdGhlIGJ1ZyBpcyBzdGlsbCBwcmVzZW50Lg0KPiANCj4gVGhlIGFi
aWxpdHkgdG8gY29uZmlndXJlIFhFTl9FRkkuZmQgYXMgYSBkb21haW4ga2VybmVsIGlzIGEg
ZmVhdHVyZQ0KPiBoaWdobHkgd29ydGh5IG9mIGJlaW5nIHBvcnRlZCB0byB4ODYuICBGb3Ig
T1NlcyB3aGljaCBkb24ndCBwYXJ0aWN1bGFybHkNCj4gbGlrZSBHUlVCLCBidXQgZG8gaGF2
ZSBQViBkcml2ZXJzIHRoaXMgaXMgYW4gaWRlYWwgYm9vdCBtZXRob2QuDQoNCg0KSnVlcmdl
bg0K
--------------RkIsOllKgeNEoAtS0urlvohf
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RkIsOllKgeNEoAtS0urlvohf--

--------------DAqQCSpoGUJyWUwk8B7Srrtt--

--------------uB80qtV9gL8muERTY0LCTpVp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkVfsIFAwAAAAAACgkQsN6d1ii/Ey8M
dwf8DmVZiBgmbFXPmpdVZ01uYROS2w+gI/nWhZm5nQPtVYLXIuTHnn9VaDsc2suvLN6OuTlqVI9E
Qz4SFBGmbmpCJv9v67CvI42g/IZa2MUl/CleCdXXWslsH/dNSDVKVu4fWHIXIYjclTfmzXPrMarh
a9JMBATNjdZFdM121aS+yuyqI4C4hWCk1hmjFw+MaHv33RgLeQUjwe6Tnd9Qp0KoBJ5lI1bmYvFA
80E7F3hX1BnMdVtfkpkMksHtnNH5D12dpTYtWXIji78bU78kTitowz+JoGH2VPZCpFmfDFATlOmG
6eK1DA63gI0PAgug++TGuZLghh9Kii+lR3wUSLe86Q==
=gxZG
-----END PGP SIGNATURE-----

--------------uB80qtV9gL8muERTY0LCTpVp--

