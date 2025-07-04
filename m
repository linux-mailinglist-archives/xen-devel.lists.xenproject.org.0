Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E9AF8797
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 08:06:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032773.1406167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXZYe-00036i-Ve; Fri, 04 Jul 2025 06:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032773.1406167; Fri, 04 Jul 2025 06:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXZYe-00035G-SR; Fri, 04 Jul 2025 06:06:00 +0000
Received: by outflank-mailman (input) for mailman id 1032773;
 Fri, 04 Jul 2025 06:05:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7DUC=ZR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uXZYd-00033o-OA
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 06:05:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4664167-589c-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 08:05:58 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CF1C51F38A;
 Fri,  4 Jul 2025 06:05:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EFC213AEF;
 Fri,  4 Jul 2025 06:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mFcZHURvZ2jeZQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 04 Jul 2025 06:05:56 +0000
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
X-Inumbo-ID: f4664167-589c-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751609157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R381eyYRfRq8peSzzcIztZmKGkcULzxVLB0cidkDPJY=;
	b=Ifow4KRXFGSLu2I8sOAAZQCzI5MRfQmm/zJ0NRQsfjmy1LBcrvyO84HDMdGU8SrlLw1q2Y
	y+f7xkXS+GjsnCTarZf2ypGF40FncbZPfWRZoIg3kK08HAw4Z0alryTkGF+4kkWGxTdSfy
	LHBOuvh2SqvB4nbr1aumlZ7RKCBwRF0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=gH6jFy63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751609156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R381eyYRfRq8peSzzcIztZmKGkcULzxVLB0cidkDPJY=;
	b=gH6jFy63mC31e98PPG1ZR5N0scEddWy4IHLCsSE6/POrrGk1bBwrsHzV6n/fmlSmGaIjSE
	ud2B0AwTvVoZCh9fF8MNICf8JCr5zMXC5liMTI4VHSBIob0pbMilE2WY2jVNU1Wlt/1kLG
	zuHKIaJ6YwPcyxoRtkcWc1xxp5iQ7ZQ=
Message-ID: <f8335a71-f9af-4911-96fa-46e7088acaf8@suse.com>
Date: Fri, 4 Jul 2025 08:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Tu Dinh <ngoc-tu.dinh@vates.tech>, Abinash <abinashlalotra@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
 <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
 <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
 <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
 <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
 <f1c68345-a511-46b8-964c-a00bb62274ba@wanadoo.fr>
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
In-Reply-To: <f1c68345-a511-46b8-964c-a00bb62274ba@wanadoo.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZLQua54py0y302zmmXQaUITj"
X-Spamd-Result: default: False [-6.41 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,wanadoo.fr];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_TO(0.00)[wanadoo.fr,vates.tech,gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	HAS_ATTACHMENT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,epam.com,lists.xenproject.org,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: CF1C51F38A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -6.41

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZLQua54py0y302zmmXQaUITj
Content-Type: multipart/mixed; boundary="------------SImcOnPmWUOC3YSpKB9YRqi8";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Tu Dinh <ngoc-tu.dinh@vates.tech>, Abinash <abinashlalotra@gmail.com>
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Abinash Singh <abinashsinghlalotra@gmail.com>
Message-ID: <f8335a71-f9af-4911-96fa-46e7088acaf8@suse.com>
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
 <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
 <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
 <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
 <f8bde276-9d4e-47d0-9841-fd8724ef5275@suse.com>
 <f1c68345-a511-46b8-964c-a00bb62274ba@wanadoo.fr>
In-Reply-To: <f1c68345-a511-46b8-964c-a00bb62274ba@wanadoo.fr>

--------------SImcOnPmWUOC3YSpKB9YRqi8
Content-Type: multipart/mixed; boundary="------------h5v6MQRVJSQBTHVbv0AI9xba"

--------------h5v6MQRVJSQBTHVbv0AI9xba
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDcuMjUgMTk6MzUsIENocmlzdG9waGUgSkFJTExFVCB3cm90ZToNCj4gTGUgMDMv
MDcvMjAyNSDDoCAwNzoyMiwgSsO8cmdlbiBHcm/DnyBhIMOpY3JpdMKgOg0KPj4gT24gMDMu
MDcuMjUgMDA6NDIsIFR1IERpbmggd3JvdGU6DQo+Pj4gT24gMDEvMDcvMjAyNSAyMzo1Mywg
QWJpbmFzaCB3cm90ZToNCj4+Pj4gSGkgLA0KPj4+Pg0KPj4+PiBUaGFua3MgZm9yIHBvaW50
aW5nIHRoYXQgb3V0Lg0KPj4+Pg0KPj4+PiBJIGhhdmVu4oCZdCBtZWFzdXJlZCB0aGUgcGVy
Zm9ybWFuY2UgaW1wYWN0IHlldCDigJQgbXkgbWFpbiBmb2N1cyB3YXMgb24NCj4+Pj4gZ2V0
dGluZyByaWQgb2YgdGhlIHN0YWNrIHVzYWdlIHdhcm5pbmcgdHJpZ2dlcmVkIGJ5IExMVk0g
ZHVlIHRvDQo+Pj4+IGlubGluaW5nLiBCdXQgeW91J3JlIHJpZ2h0LCBnbnRkZXZfaW9jdGxf
Z3JhbnRfY29weSgpIGlzIG9uIGEgaG90DQo+Pj4+IHBhdGgsIGFuZCBjYWxsaW5nIGttYWxs
b2MoKSB0aGVyZSBjb3VsZCBkZWZpbml0ZWx5IHNsb3cgdGhpbmdzIGRvd24sDQo+Pj4+IGVz
cGVjaWFsbHkgdW5kZXIgbWVtb3J5IHByZXNzdXJlLg0KPj4+Pg0KPj4+PiBJ4oCZbGwgcnVu
IHNvbWUgYmVuY2htYXJrcyB0byBjb21wYXJlIHRoZSBjdXJyZW50IGFwcHJvYWNoIHdpdGgg
dGhlDQo+Pj4+IGR5bmFtaWMgYWxsb2NhdGlvbiwgYW5kIGFsc28gbG9vayBpbnRvIGFsdGVy
bmF0aXZlcyDigJQgbWF5YmUNCj4+Pj4gcHJlLWFsbG9jYXRpbmcgdGhlIHN0cnVjdCBvciBs
aW1pdGluZyBpbmxpbmluZyBpbnN0ZWFkLiBJZiB5b3UgaGF2ZQ0KPj4+PiBhbnkgaWRlYXMg
b3Igc3VnZ2VzdGlvbnMgb24gaG93IGJlc3QgdG8gYXBwcm9hY2ggdGhpcywgSeKAmWQgYmUg
aGFwcHkgdG8NCj4+Pj4gaGVhciB0aGVtLg0KPj4+Pg0KPj4+PiBEbyB5b3UgaGF2ZSBhbnkg
c3VnZ2VzdGlvbnMgb24gaG93IHRvIHRlc3QgdGhlIHBlcmZvcm1hbmNlPw0KPj4+Pg0KPj4+
PiBCZXN0LA0KPj4+PiBBYmluYXNoDQo+Pj4+DQo+Pj4+DQo+Pj4NCj4+PiBQcmVhbGxvY2F0
aW5nIG1heSB3b3JrIGJ1dCBJJ2QgYmUgd2FyeSBvZiBzeW5jaHJvbml6YXRpb24gaWYgdGhl
DQo+Pj4gcHJlYWxsb2NhdGVkIHN0cnVjdCBpcyBzaGFyZWQuDQo+Pj4NCj4+PiBJJ2QgbG9v
ayBhdCBvcHRpbWl6aW5nIHN0YXR1c1tdIHdoaWNoIHNob3VsZCBzYXZlIHF1aXRlIGEgZmV3
IGJ5dGVzLg0KPj4+DQo+Pj4gUmVkdWNpbmcgR05UREVWX0NPUFlfQkFUQ0ggY291bGQgYmUg
YSBsYXN0IHJlc29ydCwgYnV0IHRoYXQgbWF5IGFsc28NCj4+PiBpbXBhY3QgcGVyZm9ybWFu
Y2UuDQo+Pg0KPj4gSU1ITyB0aGUgbW9zdCBwcm9taXNpbmcgd2F5IHdvdWxkIGJlIHRvIGR5
bmFtaWNhbGx5IGFsbG9jYXRlIHRoZSBzdHJ1Y3QsIGJ1dA0KPj4gZG9uJ3QgZnJlZSBpdCBh
dCB0aGUgZW5kIG9mIHRoZSBpb2N0bC4gSW5zdGVhZCBpdCBjb3VsZCBiZSBwdXQgaW50byBh
IGxpc3QNCj4+IGFuY2hvcmVkIGluIHN0cnVjdCBnbnRkZXZfcHJpdiwgc28gZnJlZWluZyB3
b3VsZCBiZSBkb25lIG9ubHkgYXQgY2xvc2UoKSB0aW1lLg0KPj4NCj4+IFN5bmNocm9uaXph
dGlvbiB3b3VsZCBiZSBtaW5pbWFsIChqdXN0IGZvciB0YWtpbmcgYSBmcmVlIHN0cnVjdCBm
cm9tIHRoZSBsaXN0DQo+PiBvciBwdXR0aW5nIGl0IGJhY2sgYWdhaW4pLCB3aGlsZSBtZW1v
cnkgdXNhZ2Ugd291bGQgYmUgYmFzaWNhbGx5IGp1c3QgYXMgbmVlZGVkLA0KPj4gZGVwZW5k
aW5nIG9uIHRoZSBudW1iZXIgb2YgY29uY3VycmVudCB0aHJlYWRzIHVzaW5nIHRoZSBzYW1l
IGZpbGUgZGVzY3JpcHRvcg0KPj4gZm9yIHRoZSBpb2N0bC4NCj4+DQo+PiBUaGlzIGFwcHJv
YWNoIHdvdWxkIGV2ZW4gYWxsb3cgdG8gcmFpc2UgR05UREVWX0NPUFlfQkFUQ0gsIG1heWJl
IHJlc3VsdGluZyBldmVuDQo+PiBpbiBhIGdhaW4gb2YgcGVyZm9ybWFuY2UuDQo+Pg0KPj4g
SSdsbCB3cml0ZSBhIHBhdGNoIGltcGxlbWVudGluZyB0aGUgYWxsb2NhdGlvbiBzY2hlbWUu
DQo+Pg0KPj4NCj4+IEp1ZXJnZW4NCj4gDQo+IEl0IG1heSBiZSBhbiBvdmVya2lsbCwgYnV0
IHNvbWV0aW1lcyB3ZSBzZWUgcGF0dGVybiB0aGF0IHRyeSB0byBrZWVwIHRoZSBiZXN0IG9m
IA0KPiB0aGUgMiB3b3JsZHMuIFNvbWV0aGluZyBsaWtlOg0KPiANCj4gDQo+IHN0YXRpYyBz
dHJ1Y3QgZ250ZGV2X2NvcHlfYmF0Y2ggc3RhdGljX2JhdGNoOw0KPiBzdGF0aWMgc3RydWN0
IG11dGV4IG15X211dGV4Ow0KPiANCj4gc3RhdGljIGxvbmcgZ250ZGV2X2lvY3RsX2dyYW50
X2NvcHkoLi4uKQ0KPiB7DQo+ICDCoMKgwqDCoHN0cnVjdCBnbnRkZXZfY29weV9iYXRjaCAq
ZHluYW1pY19iYXRjaCA9IE5VTEw7DQo+ICDCoMKgwqDCoHN0cnVjdCBnbnRkZXZfY29weV9i
YXRjaCAqYmF0Y2g7DQo+IA0KPiAgwqDCoMKgwqAuLi4NCj4gDQo+ICDCoMKgwqDCoGlmICht
dXRleF90cnlsb2NrKCZteV9tdXRleCkpIHsNCj4gIMKgwqDCoMKgwqDCoMKgIC8qDQo+ICDC
oMKgwqDCoMKgwqDCoMKgICogTm8gY29uY3VycmVudCBhY2Nlc3M/DQo+ICDCoMKgwqDCoMKg
wqDCoMKgICogVXNlIGEgc2hhcmVkIHN0YXRpYyB2YXJpYWJsZSB0byBhdm9pZCBhbiBhbGxv
Y2F0aW9uDQo+ICDCoMKgwqDCoMKgwqDCoMKgICovDQo+ICDCoMKgwqDCoMKgwqDCoCBiYXRj
aCA9ICZzdGF0aWNfYmF0Y2g7DQo+ICDCoMKgwqDCoGVsc2Ugew0KPiAgwqDCoMKgwqDCoMKg
wqAgLyogb3RoZXJ3aXNlLCB3ZSBuZWVkIHNvbWUgZnJlc2ggbWVtb3J5ICovDQo+ICDCoMKg
wqDCoMKgwqDCoCBkeW5hbWljX2JhdGNoID0ga21hbGxvYyhzaXplb2YoKmJhdGNoKSwgR0ZQ
X0tFUk5FTCk7DQo+ICDCoMKgwqDCoMKgwqDCoCBpZiAoIWJhdGNoKQ0KPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsNCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCBi
YXRjaCA9IGR5bmFtaWNfYmF0Y2g7DQo+ICDCoMKgwqDCoH0NCj4gDQo+ICDCoMKgwqDCoC8q
IGRvIHN0dWZmIHdpdGggJ2JhdGNoJyAqLw0KPiAgwqDCoMKgwqAuLi4NCj4gDQo+IGZyZWVf
YmF0Y2g6DQo+ICDCoMKgwqDCoGlmICghZHluYW1pY19iYXRjaCkNCj4gIMKgwqDCoMKgwqDC
oMKgIG11dGV4X3VubG9jaygmbXlfbXV0ZXgpOw0KPiAgwqDCoMKgwqBlbHNlDQo+ICDCoMKg
wqDCoMKgwqDCoCBrZnJlZShkeW5hbWljX2JhdGNoKTsNCj4gIMKgwqDCoMKgIHJldHVybiBy
ZXQ7DQo+ICDCoH0NCj4gDQo+IA0KPiBKdXN0IG15IDJjLg0KDQpUaGFua3MgZm9yIHRoZSBy
ZW1hcmssIGJ1dCB0aGlzIHdvbid0IGhlbHAgbXVjaC4gZ250ZGV2X2lvY3RsX2dyYW50X2Nv
cHkoKQ0KaXMgZS5nLiB1c2VkIGJ5IHFlbXUgZm9yIGRvaW5nIGRpc2sgSS9PIG9uIGJlaGFs
ZiBvZiBhIFhlbiBndWVzdC4gVGhpcw0KbWVhbnMgdGhhdCBpdCBpcyB2ZXJ5IGxpa2VseSB0
byBiZSB1c2VkIGNvbmN1cnJlbnRseSwgc28ganVzdCBvcHRpbWl6aW5nDQpmb3IgYSBzaW5n
bGUgdGhyZWFkIHdvbid0IGJlIGVub3VnaC4NCg0KDQpKdWVyZ2VuDQo=
--------------h5v6MQRVJSQBTHVbv0AI9xba
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------h5v6MQRVJSQBTHVbv0AI9xba--

--------------SImcOnPmWUOC3YSpKB9YRqi8--

--------------ZLQua54py0y302zmmXQaUITj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhnb0QFAwAAAAAACgkQsN6d1ii/Ey8N
agf+NDt/hN16kHzKdIWxFdnd8LWYPCHfiyeIsI4kQB1wYytYXIOTS6T8HsemCBvpxL+un1leTI2G
78+WNDm7TrsNU27J27UurYZeUqyxjSLWRGdUlbiXEKNROMFE/Ca8966QtyQzDp03ZBGP4fE8oQcf
25yqWVEw17eoRaCxH4mh2GDaNHoO0r8aShq6HtJAFDS5qECyWYOAByEih22dnanhT02HJkZTU0Gm
siZPN3j09+Wye6Koeg4kol9qO42BYSZSO/1pGbI38L3DIMozXxHyRABnqIDkWYhkz4/phA06DqNU
57lplB34sXYNYHsDIgr20lbm5BEZCVA+UtfA7c0VlQ==
=hpAH
-----END PGP SIGNATURE-----

--------------ZLQua54py0y302zmmXQaUITj--

