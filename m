Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638D8568DB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681897.1060889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeGF-00030q-IU; Thu, 15 Feb 2024 16:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681897.1060889; Thu, 15 Feb 2024 16:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raeGF-0002y3-Ev; Thu, 15 Feb 2024 16:06:55 +0000
Received: by outflank-mailman (input) for mailman id 681897;
 Thu, 15 Feb 2024 16:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4buu=JY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1raeGD-0002qL-CQ
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:06:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ac2fbdc-cc1c-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 17:06:51 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9A9D51F8BA;
 Thu, 15 Feb 2024 16:06:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E86213A82;
 Thu, 15 Feb 2024 16:06:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yRKGGZk2zmUWfwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 15 Feb 2024 16:06:49 +0000
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
X-Inumbo-ID: 3ac2fbdc-cc1c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708013210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9tVIFMZw6BYNF6n4vpzTLBOVUekmRywRuvET2uc7LI4=;
	b=AVlNXnM6nTZR7uLwobXWnuZFcBw52ZnMGNh9bIkMuKRl3kc1KP+ABbi2qHyPhm7JsSa9Ik
	kgRjSJD4kTD3/IE+Lml22g/IZRQd7utUZztWI3lG24+KEKzQGUfrPT93wcFuwwGy9m9BMF
	xcBdJN8OZkMiAyWLNdIyraR0IBE/T6U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1708013209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9tVIFMZw6BYNF6n4vpzTLBOVUekmRywRuvET2uc7LI4=;
	b=VLuCZatLdretGsu17c3GrlP3NhoFTznHp47xBG+Dd/Or7GEAkzHkfYyRe1qCi0bKYgytrT
	NXFpa1moM8C1tlxKIFZ8Uy7/Qn+Y6VhBiDq61YJbxc5JZ+gFv0hEGTVfSlq387WqXN0Kyk
	ezBqmWBLYcgFfvmLGZbM9JmcSj1DbMw=
Message-ID: <4cabd0e1-4010-450e-aacd-80b19b477908@suse.com>
Date: Thu, 15 Feb 2024 17:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/21] tools/xen-9pfsd: add transport layer
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20240215130509.24008-1-jgross@suse.com>
 <20240215130509.24008-4-jgross@suse.com>
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
In-Reply-To: <20240215130509.24008-4-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PmAHb0jJzMRpXV2RqLT3So26"
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=VLuCZatL
X-Spamd-Result: default: False [-6.20 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 XM_UA_NO_VERSION(0.01)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 HAS_ATTACHMENT(0.00)[];
	 MIME_BASE64_TEXT_BOGUS(1.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MIME_BASE64_TEXT(0.10)[];
	 MX_GOOD(-0.01)[];
	 SIGNED_PGP(-2.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 MIME_UNKNOWN(0.10)[application/pgp-keys];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,citrix.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[xen.org,citrix.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 9A9D51F8BA
X-Spam-Level: 
X-Spam-Score: -6.20
X-Spam-Flag: NO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PmAHb0jJzMRpXV2RqLT3So26
Content-Type: multipart/mixed; boundary="------------egQ0k5XkWKwBYvKuS8qG1Xl0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
Message-ID: <4cabd0e1-4010-450e-aacd-80b19b477908@suse.com>
Subject: Re: [PATCH v7 03/21] tools/xen-9pfsd: add transport layer
References: <20240215130509.24008-1-jgross@suse.com>
 <20240215130509.24008-4-jgross@suse.com>
In-Reply-To: <20240215130509.24008-4-jgross@suse.com>

--------------egQ0k5XkWKwBYvKuS8qG1Xl0
Content-Type: multipart/mixed; boundary="------------dXIHiq5xRB4NITX42hSPFSC2"

--------------dXIHiq5xRB4NITX42hSPFSC2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTUuMDIuMjQgMTQ6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IEFkZCB0aGUgdHJh
bnNwb3J0IGxheWVyIG9mIDlwZnMuIFRoaXMgaXMgYmFzaWNhbGx5IHRoZSBpbmZyYXN0cnVj
dHVyZQ0KPiB0byByZWNlaXZlIHJlcXVlc3RzIGZyb20gdGhlIGZyb250ZW5kIGFuZCB0byBz
ZW5kIHRoZSByZWxhdGVkIGFuc3dlcnMNCj4gdmlhIHRoZSByaW5ncy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gUmV2aWV3ZWQt
Ynk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gQWNrZWQtYnk6IEFu
dGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KDQpTZWVtcyBDSSBp
cyB1bmhhcHB5IGR1ZSB0byBhIGZhbHNlIHBvc2l0aXZlLg0KDQpUaGUgZm9sbG93aW5nIGRp
ZmYgbmVlZHMgdG8gYmUgZm9sZGVkIGluOg0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvOXBmc2Qv
aW8uYyBiL3Rvb2xzLzlwZnNkL2lvLmMNCmluZGV4IDQzMTJhNjJkZmUuLjk5NjAxN2E4YmUg
MTAwNjQ0DQotLS0gYS90b29scy85cGZzZC9pby5jDQorKysgYi90b29scy85cGZzZC9pby5j
DQpAQCAtMTA0LDcgKzEwNCw3IEBAIHZvaWQgKmlvX3RocmVhZCh2b2lkICphcmcpDQogIHsN
CiAgICAgIHN0cnVjdCByaW5nICpyaW5nID0gYXJnOw0KICAgICAgdW5zaWduZWQgaW50IGNv
dW50ID0gMDsNCi0gICAgc3RydWN0IHA5X2hlYWRlciBoZHI7DQorICAgIHN0cnVjdCBwOV9o
ZWFkZXIgaGRyID0geyAuc2l6ZSA9IDAgfTsNCiAgICAgIGJvb2wgaW5faGRyID0gdHJ1ZTsN
Cg0KICAgICAgcmluZy0+bWF4X3NpemUgPSByaW5nLT5yaW5nX3NpemU7DQoNCg0KSnVlcmdl
bg0KDQo+IC0tLQ0KPiBWMjoNCj4gLSByZW5hbWUgcHV0X3JlcXVlc3RfYnl0ZXMoKSAoSmFz
b24gQW5kcnl1aykNCj4gLSByZW5hbWUgZ2V0X3JlcXVlc3RfYnl0ZXMoKSBhbmQgcHV0X3Jl
c3BvbnNlX2J5dGVzKCkgbGVuIHBhcmFtZXRlcg0KPiAgICAoSmFzb24gQW5kcnl1aykNCj4g
LSBkb24ndCB1bm1hc2sgZXZlbnQgY2hhbm5lbCBpZiBlcnJvciBpbmRpY2F0b3IgaXMgc2V0
IChKYXNvbiBBbmRyeXVrKQ0KPiAtLS0NCj4gICB0b29scy85cGZzZC9pby5jICAgICAgICB8
IDE0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAgdG9v
bHMvOXBmc2QveGVuLTlwZnNkLmggfCAgMTYgKysrKysNCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDE1NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rvb2xzLzlwZnNkL2lvLmMgYi90b29scy85cGZzZC9pby5jDQo+IGluZGV4IGViN2MxMzZl
MDkuLjQzMTJhNjJkZmUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzLzlwZnNkL2lvLmMNCj4gKysr
IGIvdG9vbHMvOXBmc2QvaW8uYw0KPiBAQCAtNiwzOSArNiwxNzYgQEANCj4gICAgKiBDb3B5
cmlnaHQgKEMpIDIwMjQgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiAgICAq
DQo+ICAgICogSS9PIHRocmVhZCBoYW5kbGluZy4NCj4gKyAqDQo+ICsgKiBPbmx5IGhhbmRs
ZSBvbmUgcmVxdWVzdCBhdCBhIHRpbWUsIHB1c2hpbmcgb3V0IHRoZSBjb21wbGV0ZSByZXNw
b25zZQ0KPiArICogYmVmb3JlIGxvb2tpbmcgZm9yIHRoZSBuZXh0IHJlcXVlc3QuDQo+ICAg
ICovDQo+ICAgDQo+ICAgI2luY2x1ZGUgPHN0ZGJvb2wuaD4NCj4gKyNpbmNsdWRlIDxzdGRs
aWIuaD4NCj4gICAjaW5jbHVkZSA8c3RyaW5nLmg+DQo+ICAgI2luY2x1ZGUgPHN5c2xvZy5o
Pg0KPiArI2luY2x1ZGUgPHhlbmN0cmwuaD4gICAgICAgICAgIC8qIEZvciBjcHUgYmFycmll
cnMuICovDQo+ICsjaW5jbHVkZSA8eGVuLXRvb2xzL2NvbW1vbi1tYWNyb3MuaD4NCj4gICAN
Cj4gICAjaW5jbHVkZSAieGVuLTlwZnNkLmgiDQo+ICAgDQo+ICsvKg0KPiArICogTm90ZSB0
aGF0IHRoZSByaW5nIG5hbWVzICJpbiIgYW5kICJvdXQiIGFyZSBmcm9tIHRoZSBmcm9udGVu
ZCdzDQo+ICsgKiBwZXJzcGVjdGl2ZSwgc28gdGhlICJpbiIgcmluZyB3aWxsIGJlIHVzZWQg
Zm9yIHJlc3BvbnNlcyB0byB0aGUgZnJvbnRlbmQsDQo+ICsgKiB3aGlsZSB0aGUgIm91dCIg
cmluZyBpcyB1c2VkIGZvciByZXF1ZXN0cyBmcm9tIHRoZSBmcm9udGVuZCB0byB0aGUNCj4g
KyAqIGJhY2tlbmQuDQo+ICsgKi8NCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgcmluZ19pbl9m
cmVlKHN0cnVjdCByaW5nICpyaW5nKQ0KPiArew0KPiArICAgIHVuc2lnbmVkIGludCBxdWV1
ZWQ7DQo+ICsNCj4gKyAgICBxdWV1ZWQgPSB4ZW5fOXBmc19xdWV1ZWQocmluZy0+cHJvZF9w
dnRfaW4sIHJpbmctPmludGYtPmluX2NvbnMsDQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJpbmctPnJpbmdfc2l6ZSk7DQo+ICsgICAgeGVuX3JtYigpOw0KPiArDQo+ICsg
ICAgcmV0dXJuIHJpbmctPnJpbmdfc2l6ZSAtIHF1ZXVlZDsNCj4gK30NCj4gKw0KPiArc3Rh
dGljIHVuc2lnbmVkIGludCByaW5nX291dF9kYXRhKHN0cnVjdCByaW5nICpyaW5nKQ0KPiAr
ew0KPiArICAgIHVuc2lnbmVkIGludCBxdWV1ZWQ7DQo+ICsNCj4gKyAgICBxdWV1ZWQgPSB4
ZW5fOXBmc19xdWV1ZWQocmluZy0+aW50Zi0+b3V0X3Byb2QsIHJpbmctPmNvbnNfcHZ0X291
dCwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmluZy0+cmluZ19zaXplKTsN
Cj4gKyAgICB4ZW5fcm1iKCk7DQo+ICsNCj4gKyAgICByZXR1cm4gcXVldWVkOw0KPiArfQ0K
PiArDQo+ICtzdGF0aWMgdW5zaWduZWQgaW50IGdldF9yZXF1ZXN0X2J5dGVzKHN0cnVjdCBy
aW5nICpyaW5nLCB1bnNpZ25lZCBpbnQgb2ZmLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdG90YWxfbGVuKQ0KPiArew0KPiArICAg
IHVuc2lnbmVkIGludCBzaXplOw0KPiArICAgIHVuc2lnbmVkIGludCBvdXRfZGF0YSA9IHJp
bmdfb3V0X2RhdGEocmluZyk7DQo+ICsgICAgUklOR19JRFggcHJvZCwgY29uczsNCj4gKw0K
PiArICAgIHNpemUgPSBtaW4odG90YWxfbGVuIC0gb2ZmLCBvdXRfZGF0YSk7DQo+ICsgICAg
cHJvZCA9IHhlbl85cGZzX21hc2socmluZy0+aW50Zi0+b3V0X3Byb2QsIHJpbmctPnJpbmdf
c2l6ZSk7DQo+ICsgICAgY29ucyA9IHhlbl85cGZzX21hc2socmluZy0+Y29uc19wdnRfb3V0
LCByaW5nLT5yaW5nX3NpemUpOw0KPiArICAgIHhlbl85cGZzX3JlYWRfcGFja2V0KHJpbmct
PmJ1ZmZlciArIG9mZiwgcmluZy0+ZGF0YS5vdXQsIHNpemUsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgcHJvZCwgJmNvbnMsIHJpbmctPnJpbmdfc2l6ZSk7DQo+ICsNCj4gKyAg
ICB4ZW5fcm1iKCk7ICAgICAgICAgICAvKiBSZWFkIGRhdGEgb3V0IGJlZm9yZSBzZXR0aW5n
IHZpc2libGUgY29uc3VtZXIuICovDQo+ICsgICAgcmluZy0+Y29uc19wdnRfb3V0ICs9IHNp
emU7DQo+ICsgICAgcmluZy0+aW50Zi0+b3V0X2NvbnMgPSByaW5nLT5jb25zX3B2dF9vdXQ7
DQo+ICsNCj4gKyAgICAvKiBTaWduYWwgdGhhdCBtb3JlIHNwYWNlIGlzIGF2YWlsYWJsZSBu
b3cuICovDQo+ICsgICAgeGVuZXZ0Y2huX25vdGlmeSh4ZSwgcmluZy0+ZXZ0Y2huKTsNCj4g
Kw0KPiArICAgIHJldHVybiBzaXplOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdW5zaWduZWQg
aW50IHB1dF9yZXNwb25zZV9ieXRlcyhzdHJ1Y3QgcmluZyAqcmluZywgdW5zaWduZWQgaW50
IG9mZiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCB0b3RhbF9sZW4pDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgaW50IHNpemU7DQo+
ICsgICAgdW5zaWduZWQgaW50IGluX2RhdGEgPSByaW5nX2luX2ZyZWUocmluZyk7DQo+ICsg
ICAgUklOR19JRFggcHJvZCwgY29uczsNCj4gKw0KPiArICAgIHNpemUgPSBtaW4odG90YWxf
bGVuIC0gb2ZmLCBpbl9kYXRhKTsNCj4gKyAgICBwcm9kID0geGVuXzlwZnNfbWFzayhyaW5n
LT5wcm9kX3B2dF9pbiwgcmluZy0+cmluZ19zaXplKTsNCj4gKyAgICBjb25zID0geGVuXzlw
ZnNfbWFzayhyaW5nLT5pbnRmLT5pbl9jb25zLCByaW5nLT5yaW5nX3NpemUpOw0KPiArICAg
IHhlbl85cGZzX3dyaXRlX3BhY2tldChyaW5nLT5kYXRhLmluLCByaW5nLT5idWZmZXIgKyBv
ZmYsIHNpemUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICZwcm9kLCBjb25zLCBy
aW5nLT5yaW5nX3NpemUpOw0KPiArDQo+ICsgICAgeGVuX3dtYigpOyAgICAgICAgICAgLyog
V3JpdGUgZGF0YSBvdXQgYmVmb3JlIHNldHRpbmcgdmlzaWJsZSBwcm9kdWNlci4gKi8NCj4g
KyAgICByaW5nLT5wcm9kX3B2dF9pbiArPSBzaXplOw0KPiArICAgIHJpbmctPmludGYtPmlu
X3Byb2QgPSByaW5nLT5wcm9kX3B2dF9pbjsNCj4gKw0KPiArICAgIHJldHVybiBzaXplOw0K
PiArfQ0KPiArDQo+ICAgc3RhdGljIGJvb2wgaW9fd29ya19wZW5kaW5nKHN0cnVjdCByaW5n
ICpyaW5nKQ0KPiAgIHsNCj4gICAgICAgaWYgKCByaW5nLT5zdG9wX3RocmVhZCApDQo+ICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gLSAgICByZXR1cm4gZmFsc2U7DQo+ICsgICAgaWYg
KCByaW5nLT5lcnJvciApDQo+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4gKyAgICByZXR1
cm4gcmluZy0+aGFuZGxlX3Jlc3BvbnNlID8gcmluZ19pbl9mcmVlKHJpbmcpIDogcmluZ19v
dXRfZGF0YShyaW5nKTsNCj4gICB9DQo+ICAgDQo+ICAgdm9pZCAqaW9fdGhyZWFkKHZvaWQg
KmFyZykNCj4gICB7DQo+ICAgICAgIHN0cnVjdCByaW5nICpyaW5nID0gYXJnOw0KPiArICAg
IHVuc2lnbmVkIGludCBjb3VudCA9IDA7DQo+ICsgICAgc3RydWN0IHA5X2hlYWRlciBoZHI7
DQo+ICsgICAgYm9vbCBpbl9oZHIgPSB0cnVlOw0KPiArDQo+ICsgICAgcmluZy0+bWF4X3Np
emUgPSByaW5nLT5yaW5nX3NpemU7DQo+ICsgICAgcmluZy0+YnVmZmVyID0gbWFsbG9jKHJp
bmctPm1heF9zaXplKTsNCj4gKyAgICBpZiAoICFyaW5nLT5idWZmZXIgKQ0KPiArICAgIHsN
Cj4gKyAgICAgICAgc3lzbG9nKExPR19DUklULCAibWVtb3J5IGFsbG9jYXRpb24gZmFpbHVy
ZSEiKTsNCj4gKyAgICAgICAgcmV0dXJuIE5VTEw7DQo+ICsgICAgfQ0KPiAgIA0KPiAgICAg
ICB3aGlsZSAoICFyaW5nLT5zdG9wX3RocmVhZCApDQo+ICAgICAgIHsNCj4gICAgICAgICAg
IHB0aHJlYWRfbXV0ZXhfbG9jaygmcmluZy0+bXV0ZXgpOw0KPiAgICAgICAgICAgaWYgKCAh
aW9fd29ya19wZW5kaW5nKHJpbmcpICkNCj4gICAgICAgICAgIHsNCj4gLSAgICAgICAgICAg
IGlmICggeGVuZXZ0Y2huX3VubWFzayh4ZSwgcmluZy0+ZXZ0Y2huKSA8IDAgKQ0KPiArICAg
ICAgICAgICAgaWYgKCAhcmluZy0+ZXJyb3IgJiYgeGVuZXZ0Y2huX3VubWFzayh4ZSwgcmlu
Zy0+ZXZ0Y2huKSA8IDAgKQ0KPiAgICAgICAgICAgICAgICAgICBzeXNsb2coTE9HX1dBUk5J
TkcsICJ4ZW5ldnRjaG5fdW5tYXNrKCkgZmFpbGVkIik7DQo+ICAgICAgICAgICAgICAgcHRo
cmVhZF9jb25kX3dhaXQoJnJpbmctPmNvbmQsICZyaW5nLT5tdXRleCk7DQo+ICAgICAgICAg
ICB9DQo+ICAgICAgICAgICBwdGhyZWFkX211dGV4X3VubG9jaygmcmluZy0+bXV0ZXgpOw0K
PiAgIA0KPiAtICAgICAgICAvKiBUT0RPOiBJL08gaGFuZGxpbmcuICovDQo+ICsgICAgICAg
IGlmICggcmluZy0+c3RvcF90aHJlYWQgfHwgcmluZy0+ZXJyb3IgKQ0KPiArICAgICAgICAg
ICAgY29udGludWU7DQo+ICsNCj4gKyAgICAgICAgaWYgKCAhcmluZy0+aGFuZGxlX3Jlc3Bv
bnNlICkNCj4gKyAgICAgICAgew0KPiArICAgICAgICAgICAgaWYgKCBpbl9oZHIgKQ0KPiAr
ICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAgIGNvdW50ICs9IGdldF9yZXF1ZXN0
X2J5dGVzKHJpbmcsIGNvdW50LCBzaXplb2YoaGRyKSk7DQo+ICsgICAgICAgICAgICAgICAg
aWYgKCBjb3VudCAhPSBzaXplb2YoaGRyKSApDQo+ICsgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPiArICAgICAgICAgICAgICAgIGhkciA9ICooc3RydWN0IHA5X2hlYWRlciAq
KXJpbmctPmJ1ZmZlcjsNCj4gKyAgICAgICAgICAgICAgICBpZiAoIGhkci5zaXplID4gcmlu
Zy0+bWF4X3NpemUgfHwgaGRyLnNpemUgPCBzaXplb2YoaGRyKSApDQo+ICsgICAgICAgICAg
ICAgICAgew0KPiArICAgICAgICAgICAgICAgICAgICBzeXNsb2coTE9HX0VSUiwgIiV1LiV1
IHNwZWNpZmllZCBpbGxlZ2FsIHJlcXVlc3QgbGVuZ3RoICV1IiwNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJpbmctPmRldmljZS0+ZG9taWQsIHJpbmctPmRldmljZS0+ZGV2
aWQsIGhkci5zaXplKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgcmluZy0+ZXJyb3IgPSB0
cnVlOw0KPiArICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gKyAgICAgICAgICAg
ICAgICB9DQo+ICsgICAgICAgICAgICAgICAgaW5faGRyID0gZmFsc2U7DQo+ICsgICAgICAg
ICAgICB9DQo+ICsNCj4gKyAgICAgICAgICAgIGNvdW50ICs9IGdldF9yZXF1ZXN0X2J5dGVz
KHJpbmcsIGNvdW50LCBoZHIuc2l6ZSk7DQo+ICsgICAgICAgICAgICBpZiAoIGNvdW50IDwg
aGRyLnNpemUgKQ0KPiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiArDQo+ICsgICAg
ICAgICAgICAvKiBUT0RPOiBoYW5kbGUgcmVxdWVzdCAod2lsbCByZXdyaXRlIGhkci5zaXpl
KS4gKi8NCj4gKw0KPiArICAgICAgICAgICAgcmluZy0+aGFuZGxlX3Jlc3BvbnNlID0gdHJ1
ZTsNCj4gKyAgICAgICAgICAgIGhkci5zaXplID0gKChzdHJ1Y3QgcDlfaGVhZGVyICopcmlu
Zy0+YnVmZmVyKS0+c2l6ZTsNCj4gKyAgICAgICAgICAgIGNvdW50ID0gMDsNCj4gKyAgICAg
ICAgfQ0KPiArDQo+ICsgICAgICAgIGlmICggcmluZy0+aGFuZGxlX3Jlc3BvbnNlICkNCj4g
KyAgICAgICAgew0KPiArICAgICAgICAgICAgY291bnQgKz0gcHV0X3Jlc3BvbnNlX2J5dGVz
KHJpbmcsIGNvdW50LCBoZHIuc2l6ZSk7DQo+ICsNCj4gKyAgICAgICAgICAgIGlmICggY291
bnQgPT0gaGRyLnNpemUgKQ0KPiArICAgICAgICAgICAgew0KPiArICAgICAgICAgICAgICAg
IC8qIFNpZ25hbCBwcmVzZW5jZSBvZiByZXNwb25zZS4gKi8NCj4gKyAgICAgICAgICAgICAg
ICB4ZW5ldnRjaG5fbm90aWZ5KHhlLCByaW5nLT5ldnRjaG4pOw0KPiArDQo+ICsgICAgICAg
ICAgICAgICAgcmluZy0+aGFuZGxlX3Jlc3BvbnNlID0gZmFsc2U7DQo+ICsgICAgICAgICAg
ICAgICAgaW5faGRyID0gdHJ1ZTsNCj4gKyAgICAgICAgICAgICAgICBjb3VudCA9IDA7DQo+
ICsgICAgICAgICAgICB9DQo+ICsgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgIA0KPiArICAg
IGZyZWUocmluZy0+YnVmZmVyKTsNCj4gKw0KPiAgICAgICByaW5nLT50aHJlYWRfYWN0aXZl
ID0gZmFsc2U7DQo+ICAgDQo+ICAgICAgIHJldHVybiBOVUxMOw0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvOXBmc2QveGVuLTlwZnNkLmggYi90b29scy85cGZzZC94ZW4tOXBmc2QuaA0KPiBp
bmRleCBmZjM1NjIxNjRhLi5kNTg3ZjU5YTMyIDEwMDY0NA0KPiAtLS0gYS90b29scy85cGZz
ZC94ZW4tOXBmc2QuaA0KPiArKysgYi90b29scy85cGZzZC94ZW4tOXBmc2QuaA0KPiBAQCAt
MTUsNiArMTUsMTIgQEANCj4gICAjZGVmaW5lIE1BWF9SSU5HX09SREVSICAgICAgICAgICA5
DQo+ICAgI2RlZmluZSBNQVhfT1BFTl9GSUxFU19ERUZBVUxUICAgNQ0KPiAgIA0KPiArc3Ry
dWN0IHA5X2hlYWRlciB7DQo+ICsgICAgdWludDMyX3Qgc2l6ZTsNCj4gKyAgICB1aW50OF90
IGNtZDsNCj4gKyAgICB1aW50MTZfdCB0YWc7DQo+ICt9IF9fYXR0cmlidXRlX18oKHBhY2tl
ZCkpOw0KPiArDQo+ICAgdHlwZWRlZiBzdHJ1Y3QgZGV2aWNlIGRldmljZTsNCj4gICANCj4g
ICBzdHJ1Y3QgcmluZyB7DQo+IEBAIC0yOSw3ICszNSwxNyBAQCBzdHJ1Y3QgcmluZyB7DQo+
ICAgICAgIHN0cnVjdCB4ZW5fOXBmc19kYXRhX2ludGYgKmludGY7DQo+ICAgICAgIHVuc2ln
bmVkIGludCByaW5nX29yZGVyOw0KPiAgICAgICBSSU5HX0lEWCByaW5nX3NpemU7DQo+ICsN
Cj4gKyAgICAvKiBUcmFuc3BvcnQgbGF5ZXIgZGF0YS4gKi8NCj4gICAgICAgc3RydWN0IHhl
bl85cGZzX2RhdGEgZGF0YTsNCj4gKyAgICBSSU5HX0lEWCBwcm9kX3B2dF9pbjsNCj4gKyAg
ICBSSU5HX0lEWCBjb25zX3B2dF9vdXQ7DQo+ICsNCj4gKyAgICAvKiBSZXF1ZXN0IGFuZCBy
ZXNwb25zZSBoYW5kbGluZy4gKi8NCj4gKyAgICB1aW50MzJfdCBtYXhfc2l6ZTsNCj4gKyAg
ICBib29sIGVycm9yOyAgICAgICAgICAgICAvKiBQcm90b2NvbCBlcnJvciAtIHN0b3AgcHJv
Y2Vzc2luZy4gKi8NCj4gKyAgICBib29sIGhhbmRsZV9yZXNwb25zZTsgICAvKiBNYWluIGxv
b3Agbm93IGhhbmRsaW5nIHJlc3BvbnNlLiAqLw0KPiArICAgIHZvaWQgKmJ1ZmZlcjsgICAg
ICAgICAgIC8qIFJlcXVlc3QvcmVzcG9uc2UgYnVmZmVyLiAqLw0KPiAgIH07DQo+ICAgDQo+
ICAgc3RydWN0IGRldmljZSB7DQoNCg==
--------------dXIHiq5xRB4NITX42hSPFSC2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dXIHiq5xRB4NITX42hSPFSC2--

--------------egQ0k5XkWKwBYvKuS8qG1Xl0--

--------------PmAHb0jJzMRpXV2RqLT3So26
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmXONpkFAwAAAAAACgkQsN6d1ii/Ey8X
/Af+NioQfMcKGSd9ISBDmiBMY25xbY86T0VnOV8qAg2bdeahh+0kFmB6d2rLQCZVueSA2FII/ADB
EMCeGNQxjonaHOKK9Dh4sGV+47/vJmgTiq91LealgD1ka6D4nN9i+ii55ZgYhfGENycu2qfK8nv2
LibTrjclqsabc47bWvrC+Qqki2Ez1HzvXg/Q6qXWzXP9MhyyZo3Bx8nhMHG4DODrxtzC+Am1S0EX
1dspRMadJtuNgFqDyuCAnNnXYNeRHWX4grFxYFA5sujDiJHeAvi8P4RkeB+jWRrcerq6+JJuiPmm
dVoHKr40JU8h7+3Take9G56lxTwwufuOHTbVnwY3ng==
=ULUs
-----END PGP SIGNATURE-----

--------------PmAHb0jJzMRpXV2RqLT3So26--

