Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA009476F2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 10:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771827.1182255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saspN-0008Lq-Gs; Mon, 05 Aug 2024 08:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771827.1182255; Mon, 05 Aug 2024 08:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1saspN-0008JN-Dv; Mon, 05 Aug 2024 08:12:25 +0000
Received: by outflank-mailman (input) for mailman id 771827;
 Mon, 05 Aug 2024 08:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Dvoq=PE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1saspL-0008JH-3S
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 08:12:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fca85f6-5302-11ef-8776-851b0ebba9a2;
 Mon, 05 Aug 2024 10:12:20 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF61A21B7A;
 Mon,  5 Aug 2024 08:12:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A210B13254;
 Mon,  5 Aug 2024 08:12:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ohfEJWOJsGZdVwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 05 Aug 2024 08:12:19 +0000
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
X-Inumbo-ID: 6fca85f6-5302-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722845539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ltVcg4amxt6pccipxB3f7kEjMqgZuYFi/jPyHyc77rI=;
	b=KKsPe7RCZD3cM+mdXjhn5h1W1VmVDSKxgOyVW98J+0ZVg0GQsTUl5WzpKnTXQcXahrYryz
	QNDpdRK3GGLbwsZO7t0A24QqXBGGqUkmxMLQ4Yphembx5zq892ldihcixHas6mqoRNPCRb
	h514lT894WFK8MuuwTDk8HRndvEsmLY=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1722845539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ltVcg4amxt6pccipxB3f7kEjMqgZuYFi/jPyHyc77rI=;
	b=KKsPe7RCZD3cM+mdXjhn5h1W1VmVDSKxgOyVW98J+0ZVg0GQsTUl5WzpKnTXQcXahrYryz
	QNDpdRK3GGLbwsZO7t0A24QqXBGGqUkmxMLQ4Yphembx5zq892ldihcixHas6mqoRNPCRb
	h514lT894WFK8MuuwTDk8HRndvEsmLY=
Message-ID: <a5fb0aa4-3d8d-49bf-8669-6dc81c4564ed@suse.com>
Date: Mon, 5 Aug 2024 10:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [KEXEC] Lacking documentation and kexec failure with Xen 4.19-rc4
 and 4.20-dev on linux host
To: A Kundu <avikalpa@yahoo.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26.ref@yahoo.com>
 <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
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
In-Reply-To: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------B2ZOMl0aUfKfh4a4NwiTWw4y"
X-Spam-Level: 
X-Spamd-Result: default: False [-3.19 / 50.00];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.com,lists.xenproject.org];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	HAS_ATTACHMENT(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -3.19

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------B2ZOMl0aUfKfh4a4NwiTWw4y
Content-Type: multipart/mixed; boundary="------------8FHjDX5se0YtTY2kFe0iFJn0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: A Kundu <avikalpa@yahoo.com>, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com
Message-ID: <a5fb0aa4-3d8d-49bf-8669-6dc81c4564ed@suse.com>
Subject: Re: [KEXEC] Lacking documentation and kexec failure with Xen 4.19-rc4
 and 4.20-dev on linux host
References: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26.ref@yahoo.com>
 <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>
In-Reply-To: <05395ed2-3bf3-4926-8e24-c2e7ff37ed26@yahoo.com>

--------------8FHjDX5se0YtTY2kFe0iFJn0
Content-Type: multipart/mixed; boundary="------------gCy8dGgYXAbGQPV0qSxi6kWN"

--------------gCy8dGgYXAbGQPV0qSxi6kWN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAuMDcuMjQgMDY6MDIsIEEgS3VuZHUgd3JvdGU6DQo+IEkgYW0gZXhwZXJpZW5jaW5n
IGlzc3VlcyB1c2luZyBrZXhlYyB0byBsb2FkIFhlbiA0LjE5LXJjNCBhbmQNCj4gNC4yMC1k
ZXYgb24gYSBkZWJpYW4gaG9zdC4NCj4gDQo+IFRoZSBjdXJyZW50IGRvY3VtZW50YXRpb24g
YXQNCj4gaHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2RvY3MvNC4xOS10ZXN0aW5n
L21pc2Mva2V4ZWNfYW5kX2tkdW1wLnR4dA0KPiBhcHBlYXJzIHRvIGJlIG1pc3NpbmcgY3J1
Y2lhbCBkZXRhaWxzIG9uIHByb3Blcmx5IHVzaW5nIGtleGVjDQo+IHdpdGggdGhlIC0tdm1t
IG9wdGlvbiBmb3IgbG9hZGluZyBYZW4uDQo+IA0KPiBrZXhlYyBjb21wbGFpbnMgdGhlIC0t
dm1tIG9wdGlvbiBpcyBub3QgcHJlc2VudC4NCj4gDQo+IFN5c3RlbSBpbmZvcm1hdGlvbjoN
Cj4gJCB1bmFtZSAtYQ0KPiBMaW51eCBob3N0IDYuOS4xMC1hbWQ2NCAjMSBTTVAgUFJFRU1Q
VF9EWU5BTUlDIERlYmlhbiA2LjkuMTAtMSAoMjAyNC0wNy0xOSkgDQo+IHg4Nl82NCBHTlUv
TGludXgNCj4gDQo+ICQga2V4ZWMgLS12ZXJzaW9uICMgY29tcGlsZWQgZnJvbSBzb3VyY2Ug
dGFyYmFsbCB3aXRoIC4vY29uZmlndXJlIC0td2l0aC14ZW4NCj4ga2V4ZWMtdG9vbHMgMi4w
LjI5DQo+IA0KPiBTdGVwcyB0byByZXByb2R1Y2U6DQo+IA0KPiAxLiBTZXQgdmFyaWFibGVz
Og0KPiANCj4gWEVOX0hZUEVSVklTT1I9Ii9ib290L3hlbi5neiINCj4gWEVOX0NNRD0iZG9t
MF9tZW09NkcgZG9tMF9tYXhfdmNwdXM9NiBkb20wX3ZjcHVzX3BpbiBjcHVmcmVxPXhlbiIN
Cj4gDQo+IDIuIEF0dGVtcHQgdG8gbG9hZCBYZW4gNC4xOS1yYzQ6DQo+IA0KPiAjIGtleGVj
IC1sICIkWEVOX0hZUEVSVklTT1IiIC0tY29tbWFuZC1saW5lPSIkWEVOX0NNRCINCj4gQ291
bGQgbm90IGZpbmQgYSBmcmVlIGFyZWEgb2YgbWVtb3J5IG9mIDB4M2I2MDAxIGJ5dGVzLi4u
DQo+IGVsZl9leGVjX2J1aWxkX2xvYWRfcmVsb2NhdGFibGU6IEVMRiBleGVjIGxvYWQgZmFp
bGVkDQo+IA0KPiAzLiBBdHRlbXB0IHRvIGxvYWQgWGVuIDQuMjAtZGV2Og0KPiANCj4gIyBr
ZXhlYyAtbCAiJFhFTl9IWVBFUlZJU09SIiAtLWNvbW1hbmQtbGluZT0iJFhFTl9DTUQiDQo+
IENvdWxkIG5vdCBmaW5kIGEgZnJlZSBhcmVhIG9mIG1lbW9yeSBvZiAweDNmODAwMSBieXRl
cy4uLg0KPiBlbGZfZXhlY19idWlsZF9sb2FkX3JlbG9jYXRhYmxlOiBFTEYgZXhlYyBsb2Fk
IGZhaWxlZA0KPiANCj4gNC4gRm9sbG93IHRoZSBzdGVwcyBpbiB0aGUgWGVuIG1hbnVhbCBh
dCBtaXNjL2tleGVjX2FuZF9rZHVtcC50eHQ6DQo+IA0KPiAjIFNldCB2YXJpYWJsZXMNCj4g
DQo+IFhFTl9JTUFHRT0iL2Jvb3QveGVuLTQuMTktcmMuZ3oiDQo+IERPTTBfSU1BR0U9Ii9i
b290L3ZtbGludXotNi45LjEwLWFtZDY0Ig0KPiBET00wX0lOSVRSRD0iL2Jvb3QvaW5pdHJk
LmltZy02LjkuMTAtYW1kNjQiDQo+IERPTTBfTUVNT1JZPSI2RyINCj4gRE9NMF9DUFVTPSIw
LTUiDQo+IA0KPiAjIFByZXBhcmUgWGVuIGFuZCBkb20wIGNvbW1hbmQgbGluZSBhcmd1bWVu
dHMNCj4gDQo+IFhFTl9BUkdTPSJuby1yZWFsLW1vZGUgZG9tMF9tZW09JHtET00wX01FTU9S
WX0iDQo+IERPTTBfQVJHUz0ibWF4X2NwdXM9NiBkb20wX21heF92Y3B1cz02IGRvbTBfdmNw
dXNfcGluIg0KPiANCj4gIyBMb2FkIFhlbiBhbmQgZG9tMCBrZXJuZWwNCj4gDQo+IGtleGVj
IC1sIC0tYXBwZW5kPSIke1hFTl9BUkdTfSAtLSAke0RPTTBfQVJHU30iIC0taW5pdHJkPSR7
RE9NMF9JTklUUkR9IFwNCj4gIMKgIC0tdm1tPSR7WEVOX0lNQUdFfSAke0RPTTBfSU1BR0V9
DQo+IA0KPiBSZXN1bHQ6DQo+IGtleGVjOiB1bnJlY29nbml6ZWQgb3B0aW9uICctLXZtbT0v
Ym9vdC94ZW4tNC4xOS1yYy5neicNCj4gDQo+IEkgaGF2ZSB0cmllZCBjb21waWxpbmcga2V4
ZWMtdG9vbHMgMi4wLjI5IGZyb20gc291cmNlIHVzaW5nDQo+IC4vY29uZmlndXJlIC0td2l0
aC14ZW4sIGFzIHdlbGwgYXMgdXNpbmcgZGViaWFuJ3MgYXB0IHZlcnNpb24sIGJ1dA0KPiBi
b3RoIHJlc3VsdCBpbiB0aGUgc2FtZSAidW5yZWNvZ25pemVkIG9wdGlvbiAnLS12bW0nIiBl
cnJvci4NCj4gDQo+IFBsZWFzZSBwcm92aWRlIGd1aWRhbmNlIG9uIHRoZSBjb3JyZWN0IHN0
ZXBzIHRvIGdldCBrZXhlYyB3b3JraW5nDQo+IGZvciBsb2FkaW5nIFhlbiA0LjE5LXJjNCBh
bmQgNC4yMC1kZXYuIEFkZGl0aW9uYWxseSwgSSBraW5kbHkNCj4gcmVxdWVzdCB0aGF0IHRo
ZSBkb2N1bWVudGF0aW9uIGJlIHVwZGF0ZWQgd2l0aCB0aGVzZSBkZXRhaWxzIHRvDQo+IGFz
c2lzdCBvdGhlciB1c2VycyB3aG8gbWF5IGVuY291bnRlciB0aGlzIGlzc3VlLg0KDQpUaGUg
bWVudGlvbmVkIGRvY3VtZW50YXRpb24gaGFzbid0IHNlZW4gYW55IHVwZGF0ZXMgc2luY2Ug
MjAwOCBpbiB0aGUNCnBhcnQgeW91IGFyZSBpbnRlcmVzdGVkIGluLiBJIGJlbGlldmUgdGhl
IG1vc3Qgc2FuZSBhY3Rpb24gd291bGQgYmUgdG8NCnJlbW92ZSB0aGUgIktleGVjIiBjaGFw
dGVyIGNvbXBsZXRlbHkuDQoNCldpdGggWGVuIEknbSBub3QgYXdhcmUgb2YgYW55IHVzZSBj
YXNlIG5vd2FkYXlzIG90aGVyIHRoYW4gdGhhdCBleHBsYWluZWQNCmluIHRoZSAiS2R1bXAi
IGNoYXB0ZXIuDQoNCg0KSnVlcmdlbg0K
--------------gCy8dGgYXAbGQPV0qSxi6kWN
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gCy8dGgYXAbGQPV0qSxi6kWN--

--------------8FHjDX5se0YtTY2kFe0iFJn0--

--------------B2ZOMl0aUfKfh4a4NwiTWw4y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmawiWMFAwAAAAAACgkQsN6d1ii/Ey8h
ugf8DO78EgYpWXfEHRO+xxTRLnhUd+k7XBQXZR5eII6KhedBz/3gdMUV2IqnfLLK51Y1tOPX/2x8
tpIC/wr/k+V4wLPG6Fwqz8B11soUrJEczKIM49hBrjYmGUC8LIdzgdisgTcEFT98UeRnWof1JVZc
9XhUJakr57SbKaECClPNdBfRoni/Pg399FdfvtdXnwZt8noIPPe6+CeN7UqETDQesGwno61ifP6i
WxW4ZKOfbAzPgGkVU/nIXJ0EMB89EgLgJVXOhoaD6Gcap+lGXB5lEQlbwPMU8peEp0ZMGztuNuBm
pYn+A+73ZOjhktyqHWDhrHzVeD3fj85bIBiO44lMQw==
=khBV
-----END PGP SIGNATURE-----

--------------B2ZOMl0aUfKfh4a4NwiTWw4y--

