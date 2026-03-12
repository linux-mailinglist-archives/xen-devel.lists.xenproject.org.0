Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APIAHOrHsmmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 15:04:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8F72730E6
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 15:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252434.1549121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gdv-0008Sd-Eg; Thu, 12 Mar 2026 14:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252434.1549121; Thu, 12 Mar 2026 14:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gdv-0008Q7-Ac; Thu, 12 Mar 2026 14:04:03 +0000
Received: by outflank-mailman (input) for mailman id 1252434;
 Thu, 12 Mar 2026 14:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0gdu-0008Q1-0f
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 14:04:02 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5147b3c1-1e1c-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 15:03:59 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-661cfb9f3aaso1483325a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 07:03:59 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6639fe6dcb5sm122043a12.18.2026.03.12.07.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 07:02:46 -0700 (PDT)
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
X-Inumbo-ID: 5147b3c1-1e1c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773324239; x=1773929039; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DHs5cO1llEziioN+pBX/qNd2pqwkTbM2SiJUujfbay0=;
        b=dZQbYllDlD2B7xiWte/y9+sQFQiglJVXHLHNHoX/X9EKtECaQYyCucdWFezcmt6LJ1
         vj6GvDLBftg3b2zjwBCEtoh8ro5pFObBir04f/ktID8ahEJc5wvO8KT1MThNiaoE2tXw
         3eJW38cqDlM6IuUmcsT8ml6oOiMIsvI3K48Jl8UilW1qQf5TSEdg/sIw19WOfu9G0Wb1
         Q5rBgQGdQo7PhKP7bsYCII8X9ZgADQeS2mQhcbWmqmqT9iZkyQZWc9PvPGbcdslyicK7
         NljMBIpvwlL1924YriQk9wAO1tzc15Be1+rVBGR4qchbPnTR+b1ZZaHByZM6OY2VG/3E
         Bw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324239; x=1773929039;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHs5cO1llEziioN+pBX/qNd2pqwkTbM2SiJUujfbay0=;
        b=B8nBj/Wi0lWdIgam7ppH0FwbwqAjEKjQOcj0OAPy0dvg1tWdho9UxvmPhn7oka4A1f
         8hzzIBBF031bHedEN9ghqX22oScly5aRh9JED1JNbG1vBCinSnSps141GSM/Ru1lZkbE
         tHTh5m9nLtm8bkWsSGzppJaG0KUxwWabgebcaO/iPuM8t4+13IRk2rgK6sIF7EskYkg5
         21YTbVjDjHbg1ViwvXDpaRNxZJCb+lvf0TqgavVJyjZOFxK9gesQTp62GGwvKME2+eqc
         SB9smc6QKEAO6SZJLGFrxYKikhwI2AqDMzVVeFyVPHzdTeUi3GW9HQBUSHluSSxdLN3Q
         sqfg==
X-Forwarded-Encrypted: i=1; AJvYcCX+A4Z7KaBvwElj7hhc11c11b4fiVpYDaLf6bRtbwk1uFX5ABxbyXedrzSjvZRpaerD3BoDvJrCOJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4JcxL/oXwo+gko2Z6usD9L09ra5KFNMjAqx+X8voCqq93pmVL
	LzFSD5894+MGW5+6UGPZnJqxCMQlCHw0XUk1nR8dQjILFOY48JUbdclNOUFPAYnO4mI=
X-Gm-Gg: ATEYQzxpm6o5zfYHkYGod5utENwY4miePdjVk9hGSQLMsWkHmPmp06fXqf7BvZFOKE9
	6Yml/sjDG9CZTe+Pf6MwQjg/CzfVJqm8ABZMahz3ULMFcTcqjycJc8a5sFZ/J0XhLGDL/x8N0cb
	WIwiPlMn397m9m9LGcSCA0cm52ClzkxhK/bWKyGbEJ4UKGO1n/Fwd5NzjULdv205+vfdoTFvWlN
	7QeQrHHoXBPKPyQR8o8aR9isW0EXCSeiw6zLY6AWbB8snlp66V/ZdhLjM+qr5r06P392clSGeEc
	4H86+oxyuklSG1pca3JbLz+jb/nkpO04cNxo+SV3332b28JD6QCWoryQ4lIeAUJMOeQtUeNibjD
	wKhAvwHC4npepAhtLsMP3HdMpfi/Zb+CbcyIZi+eZakFOzm2n/hEeI8/AkJiPxjQqzACnrlCo/c
	op9KXTrX2BzQS0zaJqVuWYktmawAedwdsEfgBHoe70tIPp06JsHzayNCTtnYCEgwOc+l5LvBqDA
	nkG6zHF/gJjodTT/hiUrQ6lyFYPJ1w9oHKBNrZHuL2jJQcAAi+64tv07Hrud0DB
X-Received: by 2002:a05:6402:2750:b0:65c:668d:c78d with SMTP id 4fb4d7f45d1cf-66319dce062mr3550124a12.20.1773324167117;
        Thu, 12 Mar 2026 07:02:47 -0700 (PDT)
Message-ID: <daf06c16-f857-43b0-ac58-6ecc21970df3@suse.com>
Date: Thu, 12 Mar 2026 15:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs: add man page for xenstore-rm
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-4-jgross@suse.com>
 <0748a784-eaf0-47d9-b683-067c28eeb44c@citrix.com>
 <fb001622-e2b2-490c-ab19-f56a36304baa@suse.com>
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
In-Reply-To: <fb001622-e2b2-490c-ab19-f56a36304baa@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------03l2AUf50XLwJXPc5kLhoiMv"
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:email,xenproject.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF8F72730E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------03l2AUf50XLwJXPc5kLhoiMv
Content-Type: multipart/mixed; boundary="------------hp78ziEHFT0y5i3Il0lboAMg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <daf06c16-f857-43b0-ac58-6ecc21970df3@suse.com>
Subject: Re: [PATCH 3/4] docs: add man page for xenstore-rm
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-4-jgross@suse.com>
 <0748a784-eaf0-47d9-b683-067c28eeb44c@citrix.com>
 <fb001622-e2b2-490c-ab19-f56a36304baa@suse.com>
In-Reply-To: <fb001622-e2b2-490c-ab19-f56a36304baa@suse.com>

--------------hp78ziEHFT0y5i3Il0lboAMg
Content-Type: multipart/mixed; boundary="------------1CVwYl9NBCfyoyEOzUPJi9JP"

--------------1CVwYl9NBCfyoyEOzUPJi9JP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjYgMTQ6NDksIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDEyLjAzLjI2
IDE0OjIyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMTIvMDMvMjAyNiAxMjoyMiBw
bSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+PiBUaGVyZSBpcyBubyBtYW4gcGFnZSBmb3Ig
eGVuc3RvcmUtcm0sIGFkZCBpdC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+PiAtLS0NCj4+PiDCoCBkb2NzL21hbi94ZW5z
dG9yZS1ybS4xLnBvZCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+Pj4gwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRvY3MvbWFuL3hlbnN0b3JlLXJtLjEucG9kDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEv
ZG9jcy9tYW4veGVuc3RvcmUtcm0uMS5wb2QgYi9kb2NzL21hbi94ZW5zdG9yZS1ybS4xLnBv
ZA0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uYTg1
Yjk3MTExMw0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9kb2NzL21hbi94ZW5zdG9y
ZS1ybS4xLnBvZA0KPj4+IEBAIC0wLDAgKzEsMjQgQEANCj4+PiArPWhlYWQxIE5BTUUNCj4+
PiArDQo+Pj4gK3hlbnN0b3JlLXJtIC0gcmVtb3ZlIFhlbnN0b3JlIGtleXMNCj4+PiArDQo+
Pj4gKz1oZWFkMSBTWU5PUFNJUw0KPj4+ICsNCj4+PiArQjx4ZW5zdG9yZS1ybT4gW0k8T1BU
SU9OPl0uLi4gW0k8UEFUSD5dLi4uDQo+Pj4gKw0KPj4+ICs9aGVhZDEgREVTQ1JJUFRJT04N
Cj4+PiArDQo+Pj4gK1JlbW92ZSBvbmUgb3IgbW9yZSBYZW5zdG9yZSBCPFBBVEg+cy4NCj4+
PiArDQo+Pj4gKz1vdmVyDQo+Pj4gKw0KPj4+ICs9aXRlbSBCPC10Pg0KPj4+ICsNCj4+PiAr
VGlkeSB1cCBYZW5zdG9yZSBrZXlzIHdoaWNoIGdvdCBhbGwgY2hpbGRyZW4gcmVtb3ZlZC4N
Cj4+PiArDQo+Pj4gKz1iYWNrDQo+Pj4gKw0KPj4+ICs9aGVhZDEgQlVHUw0KPj4+ICsNCj4+
PiArU2VuZCBidWdzIHRvIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZywgc2VlDQo+
Pj4gK2h0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1JlcG9ydGluZ19CdWdzX2Fn
YWluc3RfWGVuX1Byb2plY3Qgb24gaG93IA0KPj4+IHRvIHNlbmQgYnVnIHJlcG9ydHMuDQo+
Pg0KPj4gIyB4ZW5zdG9yZS1ybQ0KPj4geGVuc3RvcmUtcm06IFVzYWdlOiB4ZW5zdG9yZS1y
bSBbLWhdIFstdF0ga2V5IFsuLi5dDQo+Pg0KPj4gTG9va2luZyBhdCB4ZW5zdG9yZV9jbGll
bnQuYywgdGhpcyBpcyBjb21tb24gdG8gYWxsLsKgIFNob3VsZG4ndCBpdCBiZQ0KPj4gaW5j
bHVkZWQgaW4gdGhlIG1hbnBhZ2VzID8NCj4gDQo+IEhtbSwgbWF5YmUgYSBnb29kIGlkZWEu
DQo+IA0KPiBJJ2xsIGFkZCBhIHBhdGNoIGFkZGluZyBpdCB0byB0aGUgYWxyZWFkeSBleGlz
dGluZyBtYW4gcGFnZXMgYW5kIGFkZCBpdA0KPiBpbiBlYWNoIG9mIHRoZSA0IG5ldyBtYW4g
cGFnZXMuDQoNCkhtbSwgYW5kIEkgdGhpbmsgaXQgaXMgbm90IGFwcHJvcHJpYXRlIHRvIGV4
aXQgd2l0aCAiMSIgd2hlbiB1c2luZyB0aGUNCiItaCIgcGFyYW1ldGVyLiBJJ2xsIGFkZCBh
bm90aGVyIHBhdGNoIHRvIGZpeCB0aGF0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------1CVwYl9NBCfyoyEOzUPJi9JP
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1CVwYl9NBCfyoyEOzUPJi9JP--

--------------hp78ziEHFT0y5i3Il0lboAMg--

--------------03l2AUf50XLwJXPc5kLhoiMv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmyx4YFAwAAAAAACgkQsN6d1ii/Ey9K
lwf+Mi38JgO8QFNdMskHoFKhL7Pq9R7jvHuU2cG+xcv9/CgvrykKh4M+vwvFFhPi3/ZSuAKi4Lv+
Wxv0glA2EHTl+INlWanZK6RJ9eSp85fz6KcwuZyZO1qQ77scGGHvcn1ZfJbyw2Dudkk0DAJ3IhUH
A1vP+N0Fa9X43MX7qwQYua9Mcgoc3dIB81UfHkJ2CwJ/ofdmGj8fvXKVkRexKw6/AO9cbFI8m1dG
T16+F6a4dFrtV29v/uGcoPMPhKvZG+/V45HyXxQnl46NQDvmT11gnKFGS3IfP5IeKaoqEDj5/kfk
OYo8R3/KRMmLDLSPul6hXqAMMzzbGrbQg6W4cKgTmQ==
=pyqD
-----END PGP SIGNATURE-----

--------------03l2AUf50XLwJXPc5kLhoiMv--

