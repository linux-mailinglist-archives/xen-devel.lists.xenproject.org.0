Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17EA81B7B8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 14:30:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658888.1028322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGJ6z-0000NZ-VE; Thu, 21 Dec 2023 13:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658888.1028322; Thu, 21 Dec 2023 13:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGJ6z-0000LU-RP; Thu, 21 Dec 2023 13:29:17 +0000
Received: by outflank-mailman (input) for mailman id 658888;
 Thu, 21 Dec 2023 13:29:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRZ7=IA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rGJ6x-0000LO-Om
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 13:29:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee54543a-a004-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 14:29:13 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F6781FB66;
 Thu, 21 Dec 2023 13:29:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B7EB13725;
 Thu, 21 Dec 2023 13:29:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KDdQCag9hGUzBgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 21 Dec 2023 13:29:12 +0000
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
X-Inumbo-ID: ee54543a-a004-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1703165352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qHupHbYhaQAKsn2JPRIZ8ciBqgzTcV6PnWPxlp/uQWA=;
	b=nUKrbhwY+omt5O/wCHcp4HbUTGCgej5OW+GVv7rkQAkbediXPpAMYrpHmt+stsR4KadQNG
	pfh43wlfgcid0xo+qQ0TYNfHk7kg5SXKEkbTInrHooI2Rg9eISCT1J8OAMUDsXsaD/3CdC
	cZMdyuX/00j41KllP2TfFYcHuwn6XAY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1703165352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qHupHbYhaQAKsn2JPRIZ8ciBqgzTcV6PnWPxlp/uQWA=;
	b=nUKrbhwY+omt5O/wCHcp4HbUTGCgej5OW+GVv7rkQAkbediXPpAMYrpHmt+stsR4KadQNG
	pfh43wlfgcid0xo+qQ0TYNfHk7kg5SXKEkbTInrHooI2Rg9eISCT1J8OAMUDsXsaD/3CdC
	cZMdyuX/00j41KllP2TfFYcHuwn6XAY=
Message-ID: <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
Date: Thu, 21 Dec 2023 14:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?S=C3=A9bastien_Chaumat?=
 <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
 <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
 <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
 <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
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
In-Reply-To: <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HcQL1M1IabEgzyYsK0SOeG5m"
X-Spam-Level: 
X-Spam-Level: 
X-Spamd-Result: default: False [-4.99 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 TO_DN_SOME(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FREEMAIL_TO(0.00)[suse.com,gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: -4.99
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HcQL1M1IabEgzyYsK0SOeG5m
Content-Type: multipart/mixed; boundary="------------CEd5VNZ81Bp2dvHgFIo4KliV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?S=C3=A9bastien_Chaumat?=
 <euidzero@gmail.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <e83e7254-0c90-4912-ae63-ea7221a10071@suse.com>
 <CAKm-UmbDNbeakVQtDT47o4Qc4oQvi0dqmBDb5Q=pRqTHFY0C5w@mail.gmail.com>
 <CAKm-UmZtN2o3d13cE9GyyLKfMmZ855MfrAAw9O6zE-5ob0-iYg@mail.gmail.com>
 <64d738b7-08c1-4b2c-a828-a137c870408e@suse.com>
 <CAKm-UmayUxd8F337g+BnR=_50_o__oV_PeUv9Z+9gNZ5MXYmrA@mail.gmail.com>
 <b4f46a91-b3b9-49b9-9a26-e2f962dee54c@suse.com>
 <CAKm-UmY9yYv2gOwm-O3DF7dBBNeNjs+3pDGuU+sYgJ+OHwcLNw@mail.gmail.com>
 <CAKm-UmZ1Q77EqUit9J6RX0-MCALdu4gjaU2zrX6oneW+45a+Kw@mail.gmail.com>
 <CAKm-UmYZcsY=C2Yhmy_EeZi0iAguVH0Eqy83upBLa_ikQtPwnw@mail.gmail.com>
 <CAKm-Umapq5LW9yhSOGk8TOg1iuvUogUDKbEXbUcE5T5-vVzW3w@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
 <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
In-Reply-To: <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>

--------------CEd5VNZ81Bp2dvHgFIo4KliV
Content-Type: multipart/mixed; boundary="------------0s49s78u89f3x0hJ13bYGeDO"

--------------0s49s78u89f3x0hJ13bYGeDO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMTIuMjMgMTM6NDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4xMi4yMDIz
IDE3OjM0LCBTw6liYXN0aWVuIENoYXVtYXQgd3JvdGU6DQo+PiBIZXJlIGFyZSB0aGUgcGF0
Y2hlcyBJIG1hZGUgdG8geGVuIGFuZCBsaW51eCBrZXJuZWwNCj4+IFBsdXMgZG1lc2cgKGJh
cmUgbWV0YWwseGVuKSBhbmQgInhsIGRtZXNnIg0KPiANCj4gU28gdGhlIHByb2JsZW0gbG9v
a3MgdG8gYmUgdGhhdCBwY2lfeGVuX2luaXRpYWxfZG9tYWluKCkgcmVzdWx0cyBpbg0KPiBw
ZXJtYW5lbnQgc2V0dXAgb2YgSVJRNywgd2hlbiB0aGVyZSBvbmx5ICJzdGF0aWMiIEFDUEkg
dGFibGVzIChpbg0KPiBwYXJ0aWN1bGFyIHNvdXJjZSBvdmVycmlkZXMgaW4gTUFEVCkgYXJl
IGNvbnN1bHRlZC4gVGhlIG5lY2Vzc2FyeQ0KPiBzZXR0aW5ncywgaG93ZXZlciwgYXJlIGtu
b3duIG9ubHkgYWZ0ZXIgX0NSUyBmb3IgdGhlIGRldmljZSB3YXMNCj4gZXZhbHVhdGVkIChh
bmQgcG9zc2libHkgX1BSUyBmb2xsb3dlZCBieSBpbnZvY2F0aW9uIG9mIF9TUlMpLiBBbGwg
b2YNCj4gdGhpcyBoYXBwZW5zIGJlZm9yZSB4ZW5fcmVnaXN0ZXJfZ3NpKCkgaXMgY2FsbGVk
LiBCdXQgdGhhdCBmdW5jdGlvbidzDQo+IGNhbGwgdG8geGVuX3JlZ2lzdGVyX3BpcnEoKSBp
cyBzaG9ydC1jaXJjdWl0ZWQgYnkgdGhlIHZlcnkgZmlyc3QgaWYoKQ0KPiBpbiB4ZW5fcmVn
aXN0ZXJfcGlycSgpIHdoZW4gdGhlcmUgd2FzIGFuIGVhcmxpZXIgaW52b2NhdGlvbi4gSGVu
Y2UNCj4gdGhlICh3cm9uZykgImVkZ2UiIGJpbmRpbmcgcmVtYWlucyBpbiBwbGFjZSwgYXMg
d2FzIGVzdGFibGlzaGVkIGJ5DQo+IHRoZSBlYXJsaWVyIGNhbGwgaGVyZS4NCj4gDQo+IErD
vHJnZW4sIHRoZXJlJ3MgYW4gaW50ZXJlc3RpbmcgY29tbWVudCBpbiB4ZW5fYmluZF9waXJx
X2dzaV90b19pcnEoKSwNCj4gcmlnaHQgYmVmb3JlIGludm9raW5nIGlycV9zZXRfY2hpcF9h
bmRfaGFuZGxlcl9uYW1lKCkuIERlc3BpdGUgd2hhdA0KPiB0aGUgY29tbWVudCBzYXlzIChh
Y2NvcmRpbmcgdG8gbXkgcmVhZGluZyksIHRoZSBmYXN0ZW9pIG9uZSBpcyBfbm90Xw0KPiB1
c2VkIGluIGFsbCBjYXNlcy4gQXNzdW1pbmcgdGhlcmUncyBhIHJlYXNvbiBmb3IgdGhpcywg
aXQncyBub3QgY2xlYXINCj4gdG8gbWUgd2hldGhlciB1cGRhdGluZyB0aGUgaGFuZGxlciBs
YXRlciBvbiBpcyBhIHZhbGlkIHRoaW5nIHRvIGRvLg0KPiBfX2lycV9zZXRfaGFuZGxlcigp
IGJlaW5nIGV2ZW4gYW4gZXhwb3J0ZWQgc3ltYm9sIHN1Z2dlc3RzIHRoYXQgbWlnaHQNCj4g
YmUgYW4gb3B0aW9uIHRvIHVzZSBoZXJlLiBUaGVuIGFnYWluIG1lcmVseSB1cGRhdGluZyB0
aGUgaGFuZGxlciBtYXkNCj4gbm90IGJlIHN1ZmZpY2llbnQsIHNlZWluZyB0aGVyZSBhcmUg
YWxzbyBlLmcuIElSUURfVFJJR0dFUl9NQVNLIGFuZA0KPiBJUlFEX0xFVkVMLg0KDQpJIHVu
ZGVyc3RhbmQgdGhlIGxhc3QgcGFyYWdyYXBoIG9mIHRoYXQgY29tbWVudCB0byByZWFzb24s
IHRoYXQgaW4gY2FzZQ0KcGlycV9uZWVkc19lb2koKSByZXR1cm4gdHJ1ZSBldmVuIGluIGNh
c2Ugb2YgYW4gZWRnZSB0cmlnZ2VyZWQgaW50ZXJydXB0LA0KdGhlIG91dGNvbWUgaXMgc3Rp
bGwgb2theS4NCg0KSSBkb24ndCB0aGluayB1cGRhdGluZyB0aGUgaGFuZGxlciBsYXRlciBp
cyB2YWxpZC4NCg0KPiBTw6liYXN0aWVuLCB0byBwcm92ZSB0aGUgKHN0aWxsIHByZXR0eSB3
ZWFrKSB0aGVvcnkgdGhhdCB0aGUgY2hhbmdlIGluDQo+IGhhbmRsZXIgaXMgYWxsIHRoYXQn
cyBuZWVkZWQgdG8gbWFrZSB0aGluZ3Mgd29yayBpbiB5b3VyIGNhc2UsIGNvdWxkDQo+IHlv
dSBmaWRkbGUgd2l0aCBwY2lfeGVuX2luaXRpYWxfZG9tYWluKCkgdG8gaGF2ZSBpdCBza2lw
IElSUTc/IChUaGF0DQo+IG9mIGNvdXJzZSB3b24ndCBiZSBhIHByb3BlciBzb2x1dGlvbiwg
YnV0IG91Z2h0IHRvIGJlIG9rYXkgZm9yIHlvdXINCj4gc3lzdGVtLikgVGhlIG1haW4gd2Vh
a25lc3Mgb2YgdGhlIHRoZW9yeSBpcyB0aGF0IElSUTcgcmVhbGx5IGlzbid0DQo+IHZlcnkg
c3BlY2lhbCBpbiB0aGlzIHJlZ2FyZCAtIG90aGVyIFBDSSBJUlFzIHJvdXRlZCB0byB0aGUg
bG93IDE2DQo+IElPLUFQSUMgcGlucyBvdWdodCB0byBoYXZlIHNpbWlsYXIgaXNzdWVzIChm
cm9tIHRoZSBsb2csIG9uIHlvdXINCj4gc3lzdGVtIHRoaXMgd291bGQgYmUgYXQgbGVhc3Qg
SVJRNiBhbmQgSVJRMTAsIGV4Y2VwdCB0aGF0IHRoZXkgaGFwcGVuDQo+IHRvIGJlIGVkZ2Uv
bG93LCBzbyBmaXR0aW5nIHRoZSBJU0EgZGVmYXVsdHMpOyBvbmx5IElSUTE2IGFuZCB1cCB3
b3VsZA0KPiB3b3JrIG9rYXkuDQo+IA0KPiBGdXJ0aGVybW9yZSBpdCBtaWdodCBiZSBpbnRl
cmVzdGluZyB0byBrbm93IHdoZXRoZXIgRUxDUiB3b3VsZCBnaXZlIHVzDQo+IGFueSBoaW50
IGluIHRoaXMgY2FzZS4gU2FkbHkgZGVwZW5kaW5nIG9uIHdoZXJlIHlvdSBsb29rLA0KPiBh
cHBsaWNhYmlsaXR5IG9mIHRoaXMgcGFpciBvZiByZWdpc3RlcnMgKEkvTyBwb3J0cyAweDRk
MCBhbmQgMHg0ZDEpDQo+IHRvIG90aGVyIHRoYW4gRUlTQSBzeXN0ZW1zIGlzIGNsYWltZWQg
dHJ1ZSBvciBmYWxzZS4gQ291bGQgeW91IHBlcmhhcHMNCj4gbWFrZSBYZW4gc2ltcGx5IGxv
ZyB0aGUgdmFsdWVzIHJlYWQgZnJvbSB0aG9zZSB0d28gcG9ydHMsIGJ5IGUuZy4NCj4gaW5z
ZXJ0aW5nDQo+IA0KPiAgICAgIHByaW50aygiRUxDUjogJTAyeCwgJTAyeFxuIiwgaW5iKDB4
NGQwKSwgaW5iKDB4NGQxKSk7DQo+IA0KPiBpbiwgc2F5LCBzZXR1cF9kdW1wX2lycXMoKT8N
Cj4gDQo+IErDvHJnZW4sIGxvb2tpbmcgYXQgcGNpX3hlbl9pbml0aWFsX2RvbWFpbigpLCB3
aGF0J3MgdGhlIHB1cnBvc2Ugb2YNCj4gdGhlIGxvb3AgaW4gdGhlIGZpbmFsIGlmKCk/IENh
biB0aGlzIGV2ZXIgZG8gYW55dGhpbmcgdXNlZnVsIHdoZW4NCj4gdGhlIGVhcmxpZXIgY29t
bWVudCBzdWdnZXN0cyBucl9sZWdhY3lfaXJxcygpIGlzIHplcm8gYW55d2F5PyBPciBpcw0K
PiB0aGUgY29tbWVudCBzaW1wbHkgaW5hY2N1cmF0ZSBpbiBub3QgY292ZXJpbmcgdGhlICJu
byBJTy1BUElDcyIgY2FzZT8NCg0KTm8sIEkgdGhpbmsgdGhlIGZpbmFsIGxvb3Agd291bGQg
b25seSBkbyBzb21ldGhpbmcgaW4gY2FzZSBwcm9iZV84MjU5QSgpDQppcyBkZXRlY3Rpbmcg
YSB3b3JraW5nIFBJQyAod2hpY2ggc2hvdWxkIG5vdCBiZSB0aGUgY2FzZSBJTUhPKS4gQ291
bGQgaXQNCmJlIHRoYXQgdGhlcmUgaGF2ZSBiZWVuIFhlbiB2ZXJzaW9ucyBlbXVsYXRpbmcg
YSBQSUM/DQoNClRoZSBjYWxsIG9mIHByb2JlXzgyNTlBKCkgaXMgaW4gbm8gd2F5IGRlcGVu
ZGluZyBvbiBucl9pb2FwaWNzLg0KDQoNCkp1ZXJnZW4NCg==
--------------0s49s78u89f3x0hJ13bYGeDO
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

--------------0s49s78u89f3x0hJ13bYGeDO--

--------------CEd5VNZ81Bp2dvHgFIo4KliV--

--------------HcQL1M1IabEgzyYsK0SOeG5m
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmWEPacFAwAAAAAACgkQsN6d1ii/Ey8e
bwf/aSZ/F8tA1+SYcPWVFleatfgSFMG+mg3bRAl4H5WycBCVIezhU34V4QSLv/pw9Vsx6QR4CiLE
+m7Qxp0G76hIkxkKKizgwKy+b9ZpTvsSoK81vfPoeVWnqPa+ylrY6w4VwLMWvVKdOwhhUpqxTBXI
rOzGir8Dj8mdy5ILIH48MheQ4cqOYF3ZJcNksOBxKGYTpUwdq2/sHsMedEodNX/98EQ/RnXrLuXb
oAWdeQBIOPs9D/wmd4XjtFSwksAkDNjeXzTiT4GciwNscnwcMQmbONraAo9WdlhDMCa5wPm5wXsL
jFk+SCWIN50UazCcgXOP4qZWYQ8kZlsnstMOBVtu6g==
=4OnE
-----END PGP SIGNATURE-----

--------------HcQL1M1IabEgzyYsK0SOeG5m--

