Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66E9810CFE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 10:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653786.1020344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLDY-000722-Jm; Wed, 13 Dec 2023 09:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653786.1020344; Wed, 13 Dec 2023 09:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDLDY-0006z1-H4; Wed, 13 Dec 2023 09:07:48 +0000
Received: by outflank-mailman (input) for mailman id 653786;
 Wed, 13 Dec 2023 09:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7vuN=HY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rDLDW-0006yu-Oe
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 09:07:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1406be8f-9997-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 10:07:45 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9F7A21FD42;
 Wed, 13 Dec 2023 09:07:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CB311377F;
 Wed, 13 Dec 2023 09:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qzF5FF90eWWnPQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 13 Dec 2023 09:07:43 +0000
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
X-Inumbo-ID: 1406be8f-9997-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702458464; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y+NTlNRv+KUYDyBLj5ss4y+FOo3hBRq7sFCXbTR6Ms8=;
	b=DLg1jopa/TM0I5zPqeJ70nTo3fmvXk+b3JRZcD85a2GTHXTs7yrmRDCRApyGYGNHPvyY1n
	e0lE1m73sWUDAGNL9kJH7L720qg5nWaRalzBGLrG3kaCKAIvneQ8+6yVB2G1qS7xowe9s8
	FNgMrZwGDs0idbejLVT0csyjFeGrj2s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702458463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y+NTlNRv+KUYDyBLj5ss4y+FOo3hBRq7sFCXbTR6Ms8=;
	b=b4vT+SGttJPyoDJrm+PXDLUf4vAFAgQ7IohrsVHFJCVOR6QO3Yqe0q7qlfhe6zjxTArPc5
	tYd3rY7PWL/+jzNVSS+DjoKa3HFErPnQmQEp+cuJ2Goz7ED2EII4FSge2WnD1TmBbl7Mnj
	QsRGjUf2Rw7LS9uovIiJ5ZF2oaFVywk=
Message-ID: <b838696e-d5b2-4d48-8261-ca24a86cdbde@suse.com>
Date: Wed, 13 Dec 2023 10:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
 <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>
 <3895f5bb-354c-4ada-a14d-83537dd5d119@suse.com>
 <3f5f7df0-d7e5-4540-b01b-9b2cde9dcc55@suse.com>
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
In-Reply-To: <3f5f7df0-d7e5-4540-b01b-9b2cde9dcc55@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NmJOSgOCN7V1ERPijZwCxDVc"
X-Spam-Level: ***************
X-Spam-Flag: YES
X-Spam-Score: 15.00
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=b4vT+SGt;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-7.90 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 SIGNED_PGP(-2.00)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.00)[40.49%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.90
X-Rspamd-Queue-Id: 9F7A21FD42
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NmJOSgOCN7V1ERPijZwCxDVc
Content-Type: multipart/mixed; boundary="------------tkpD75prSHKA7qTBxHa3mjlO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <b838696e-d5b2-4d48-8261-ca24a86cdbde@suse.com>
Subject: Re: [PATCH v4 06/12] xen/spinlock: make struct lock_profile
 rspinlock_t aware
References: <20231212094725.22184-1-jgross@suse.com>
 <20231212094725.22184-7-jgross@suse.com>
 <ba842318-0d5e-4b8f-99f9-f0f1e2dda1ab@xen.org>
 <3895f5bb-354c-4ada-a14d-83537dd5d119@suse.com>
 <3f5f7df0-d7e5-4540-b01b-9b2cde9dcc55@suse.com>
In-Reply-To: <3f5f7df0-d7e5-4540-b01b-9b2cde9dcc55@suse.com>

--------------tkpD75prSHKA7qTBxHa3mjlO
Content-Type: multipart/mixed; boundary="------------I57fp1RDmk1qkqg1Pcp4Vofh"

--------------I57fp1RDmk1qkqg1Pcp4Vofh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTIuMjMgMDk6MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4xMi4yMDIz
IDA3OjA1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTIuMTIuMjMgMTk6NDIsIEp1
bGllbiBHcmFsbCB3cm90ZToNCj4+PiBPbiAxMi8xMi8yMDIzIDA5OjQ3LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaA0KPj4+
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc3BpbmxvY2suaA0KPj4+PiBAQCAtNzYsMTMgKzc2
LDE5IEBAIHVuaW9uIGxvY2tfZGVidWcgeyB9Ow0KPj4+PiAgwqAgKi8NCj4+Pj4gIMKgIHN0
cnVjdCBzcGlubG9jazsNCj4+Pj4gKy8qIFRlbXBvcmFyeSBoYWNrIHVudGlsIGEgZGVkaWNh
dGVkIHN0cnVjdCByc3BpbmxvY2sgaXMgZXhpc3RpbmcuICovDQo+Pj4+ICsjZGVmaW5lIHJz
cGlubG9jayBzcGlubG9jaw0KPj4+PiAgwqAgc3RydWN0IGxvY2tfcHJvZmlsZSB7DQo+Pj4+
ICDCoMKgwqDCoMKgIHN0cnVjdCBsb2NrX3Byb2ZpbGUgKm5leHQ7wqDCoMKgwqDCoMKgIC8q
IGZvcndhcmQgbGluayAqLw0KPj4+PiAgwqDCoMKgwqDCoCBjb25zdCBjaGFywqDCoMKgwqDC
oMKgwqDCoMKgICpuYW1lO8KgwqDCoMKgwqDCoCAvKiBsb2NrIG5hbWUgKi8NCj4+Pj4gLcKg
wqDCoCBzdHJ1Y3Qgc3BpbmxvY2vCoMKgwqDCoCAqbG9jazvCoMKgwqDCoMKgwqAgLyogdGhl
IGxvY2sgaXRzZWxmICovDQo+Pj4+ICvCoMKgwqAgdW5pb24gew0KPj4+PiArwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHNwaW5sb2NrICpsb2NrO8KgwqDCoMKgwqDCoCAvKiB0aGUgbG9jayBp
dHNlbGYgKi8NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCByc3BpbmxvY2sgKnJsb2Nr
O8KgwqDCoMKgIC8qIHRoZSByZWN1cnNpdmUgbG9jayBpdHNlbGYgKi8NCj4+Pj4gK8KgwqDC
oCB9Ow0KPj4+PiAgwqDCoMKgwqDCoCB1aW50NjRfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bG9ja19jbnQ7wqDCoMKgIC8qICMgb2YgY29tcGxldGUgbG9ja2luZyBvcHMgKi8NCj4+Pj4g
LcKgwqDCoCB1aW50NjRfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxvY2tfY250O8KgwqAg
LyogIyBvZiBjb21wbGV0ZSB3YWl0IGZvciBsb2NrICovDQo+Pj4+ICvCoMKgwqAgdWludDY0
X3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJsb2NrX2NudDo2MzsgLyogIyBvZiBjb21wbGV0
ZSB3YWl0IGZvciBsb2NrICovDQo+Pj4+ICvCoMKgwqAgdWludDY0X3TCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlzX3Jsb2NrOjE7wqAgLyogdXNlIHJsb2NrIHBvaW50ZXIgKi8NCj4+Pg0K
Pj4+IFRoaXMgaXMgbWVhbnQgdG8gYWN0IGxpa2UgYSBib29sLiBTbyBJIHdvdWxkIHByZWZl
ciBpZiB3ZSB1c2U6DQo+Pj4NCj4+PiBib29sIGlzX3J3bG9jazoxOw0KPj4+DQo+Pj4gQW5k
IHRoZW4gdXNlIHRydWUvZmFsc2Ugd2hlbiBzZXQuDQo+Pg0KPj4gRG8gd2Ugd2FudCB0byBk
byB0aGF0PyBBRkFJSyBpdCB3b3VsZCBkZXBlbmQgb24gdGhlIGNvbXBpbGVyIHdoYXQgdGhl
IHNpemUgb2YNCj4+IHRoZSBzdHJ1Y3QgaXMgd2hlbiBtaXhpbmcgdHlwZXMgaW4gYml0Zmll
bGRzIChpbiB0aGlzIGNhc2U6IGJvb2wgYW5kIHVpbnQ2NF90KS4NCj4gDQo+IEkgdGhvdWdo
dCBpbiBhIHNpbWlsYXIgd2F5IGFzIHlvdSBkaWQgd2hlbiBBbmRyZXcgaW50cm9kdWNlZCBz
aW1pbGFyDQo+IHBhdHRlcm5zIChzZWUgSnVsaWVuJ3MgcmVwbHkgZm9yIGFuIGV4YW1wbGUp
LCBhbmQgd2FzIHRoZW4gY29udmluY2VkDQo+IHRoYXQgdGhlIGNvbXBpbGVyIHJlYWxseSBp
cyBzdXBwb3NlZCB0byBiZSBkb2luZyB3aGF0IHdlIHdhbnQgaGVyZS4NCj4gU28geWVzLCBJ
IHNlY29uZCBKdWxpZW4ncyBkZXNpcmUgdG8gaGF2ZSBib29sIHVzZWQgd2hlbiBib29sZWFu
IGlzDQo+IG1lYW50Lg0KDQpPa2F5LCBmaW5lIHdpdGggbWUuDQoNCg0KSnVlcmdlbg0K
--------------I57fp1RDmk1qkqg1Pcp4Vofh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------I57fp1RDmk1qkqg1Pcp4Vofh--

--------------tkpD75prSHKA7qTBxHa3mjlO--

--------------NmJOSgOCN7V1ERPijZwCxDVc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmV5dF4FAwAAAAAACgkQsN6d1ii/Ey8Q
/QgAi4sW++7CMmBmmbRgTb8Iy+Cp/NBlyhTamvQ3aip6DW9c/TVGCZG7dnd/MBWeMaBsatjAs2N8
l0s6AmhylQYUxukD8zklwS8HYkwr7Ejh7qpuLhYMt60E4289hp4RBM+mLwUcnWoEYg3VERijS5+o
x97p1T0HJS7cfzWC1CaY5DZFmjDkc4LXdpa1c5rlOR19/1/nE71wGOqNYJQBhZkf7O4mUiH3Muig
ElHP7qw716fMbM03VHaN+DwiSV0F9HSyQ+FPqc92pzQsSPdfL0rMh/JO4piqJUNr1e+9MuBmOkq/
nCy1Y/TNH2UjGJ/hS7FvwSBnZ0l3QPGRrPmd1ujDxg==
=Cbg5
-----END PGP SIGNATURE-----

--------------NmJOSgOCN7V1ERPijZwCxDVc--

