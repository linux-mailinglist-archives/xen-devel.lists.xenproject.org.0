Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GPWvOvMETWpbtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:53:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2329471C27F
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 15:53:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XHhD7PDr;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356247.1610885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6F4-0000m4-8Q; Tue, 07 Jul 2026 13:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356247.1610885; Tue, 07 Jul 2026 13:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh6F4-0000kE-4c; Tue, 07 Jul 2026 13:53:42 +0000
Received: by outflank-mailman (input) for mailman id 1356247;
 Tue, 07 Jul 2026 13:53:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wh6F2-0000k6-Ry
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 13:53:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh6F2-00EES2-8p
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:53:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a4d04dd-bab6-0a2a0a5309dd-0a2a45098954-14
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:53:40 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a4d04e3-97e6-0a2a45090019-d155da34ed00-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 15:53:39 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c12758e75afso526424466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 06:53:39 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19d9d1c7sm5957661a12.20.2026.07.07.06.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 06:53:38 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783432419; x=1784037219; darn=lists.xenproject.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qPXrYD6kbzmy+gF2PFiBQBD9Ng6zXSHMUfTszuhflYw=;
        b=XHhD7PDrIhMPfWKLKyd0aacmtH/WNaiMVipUrAFuZFjg0pcQTeZs8EaIKlmj4rRwdQ
         LXKJ0aPTZubT7vhGp5du2M/D+i5Xpgup6YW6Uvf0UGI/2TjJx7DWVjQqm04wRx4xGYFE
         LqeWQQXksM+/bVA3d290dpZXK5qEotHjT/KeQh2A9MdZHqZjRrJhnbOwUAHJk1YGl3U3
         Di04Uew8lyR+3Zrd6SARAQIHaASBGLImDC89SwF0xd3TS+EgJj6fmpwJioq0dms1jQvO
         3NHo5FJJ5k39zSFeO2MD7IElMe5dJ0n4NLaEVevGzMiAH7KA1eDU/7/3ysOyVtefppkm
         hiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432419; x=1784037219;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPXrYD6kbzmy+gF2PFiBQBD9Ng6zXSHMUfTszuhflYw=;
        b=lLLP9OTwWIbyOLjvXFVIlMNep3UrtHQSoAJujLaMP4pAzwQEf26vqlUX7dXKoLNOvA
         H1iasQLqywXjTUL+oQhkDjZ3AEDhWYuMkB3vnIENKzsMqze2CGSMKxwU9fioR/08pyKl
         H4wgpxZtlh0veuNQvE6N+tV3ffHIJbwW/EvJCE1B8JREgbAUYpRV5g7+kcKu0Bioet+r
         t4AtkEsu45rwnrXJR/8HLbAE2c/xvIM3Uad5HS70psAtgx/kuxHBdGgHyAtfhj16T9BF
         jvGb5APESmMgGgIWN2BiCdxh8GLXFlKRj3J5Jhop4QsUzilhWN7dPZ7APPvFmEz/YzYf
         37lw==
X-Forwarded-Encrypted: i=1; AHgh+Rr18/uzh0euE0+rOFDenQsu31LkPyDqM0+9Z45mrSoSba6/SlyNFGTYrSgFtB4r1mB51hBrskcwjQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC5LqAcNXEFuwm+l4P5Y91rNLxLhJJMZxNQ0gN39Gk3irttnOs
	Sc21of0XxAqQ1aWV5illaVZatlFMe1gw8wBjQoz6BqTQWe+62X5qy7nwB/uowRcZnsQ=
X-Gm-Gg: AfdE7cllo9zjb2B9bW3XAANLJcbrJ8Mp1SeibpNVxs1E0D5SX3f5A1wO8r/7j51HvjM
	8UjvPx43zXXl0EPMxJ6zYbdkgcueQtWz8JlUR6K8VMQcVOSOWCm5aQax68i3LQOO/Fr4zgC90jn
	UzqNyvwW7qGStl+KlQysE8g3f7GLvubXMT44OeIrUZH7ywbYkQCFdlP8BGy9PFEBp123a2cv5PX
	GtxFh8nTKhFYF3ohFTsbThsvPziUS0Mmi5uf/Pqb1RBwQdjLbcetov3biCXl77i90SW4gdmTBgi
	n6S5fN5ejCi34LEcwjobfLyOUz1gETKRyiTi6fqiADh3n7g/ThffvGE1MYyxTa0uBhXNZD4MIE2
	YFuNyE/vmvacKquwL5n0s3pZdiI3N9qSZ1QYiFWivZYLK/QcQZFwByXRKBIlrWj3h+ldQyuDrtX
	In/5bNiwRM6pskBfCNMGX818Ko9PLKaMOehOgrTUwG4t64JZ8odaQ+A6yhkuZvMDlkff+pdYFdh
	YQuFF6H/kt/nCpWcCjZ2qTLo6wwRIC07McPKEjvW+U=
X-Received: by 2002:a17:907:9304:b0:c0e:4017:6471 with SMTP id a640c23a62f3a-c15a6797c24mr299472466b.16.1783432419041;
        Tue, 07 Jul 2026 06:53:39 -0700 (PDT)
Message-ID: <bf89f32e-f54f-47ad-a99f-eb0b1ba1d06e@suse.com>
Date: Tue, 7 Jul 2026 15:53:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improper handling of fast-resumed domains by O/Cxenstored
To: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
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
In-Reply-To: <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VmX5NApdYw10p7qle20XKHvH"
X-purgate-ID: tlsNG-bad1c0/1783432419-56FA9986-291998B1/0/0
X-purgate-type: clean
X-purgate-size: 10420
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.32 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andriy.sultanov@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2329471C27F

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VmX5NApdYw10p7qle20XKHvH
Content-Type: multipart/mixed; boundary="------------TEVojAt0OVMykQIFf1yFbDW8";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrii Sultanov <andriy.sultanov@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <bf89f32e-f54f-47ad-a99f-eb0b1ba1d06e@suse.com>
Subject: Re: Improper handling of fast-resumed domains by O/Cxenstored
References: <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>
In-Reply-To: <1783429662.8631fc262581453bbf619ec5b2062170.19f3cb107e000080a8@vates.tech>

--------------TEVojAt0OVMykQIFf1yFbDW8
Content-Type: multipart/mixed; boundary="------------tkAw6SFUpVzjxrKeqZ8U5DQ0"

--------------tkAw6SFUpVzjxrKeqZ8U5DQ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDcuMjYgMTU6MDcsIEFuZHJpaSBTdWx0YW5vdiB3cm90ZToNCj4gQm90aCBPeGVu
c3RvcmVkIGFuZCBDeGVuc3RvcmVkIGRvbid0IHByb3Blcmx5IGhhbmRsZSBhIHNodXRkb3du
IGRvbWFpbg0KPiAoZXZlbiBpZiBzaHV0ZG93bl9jb2RlID09IFNIVVRET1dOX3N1c3BlbmQp
IGNvbWluZyBiYWNrIGJlY2F1c2Ugb2YNCj4geGNfZG9tYWluX3Jlc3VtZShmYXN0PTEpLg0K
PiANCj4gQ3hlbnN0b3JlZCBjb3JyZWN0bHkgc2VuZHMgQGludHJvZHVjZURvbWFpbiB3YXRj
aCBldmVudHMgb24gdGhlDQo+IGluaXRpYWwgSU5UUk9EVUNFIGNhbGw6DQo+IA0KPiAgIMKg
IMKgIElOIDB4MWY3ODYxMCAyMDI2MDYxOSAxNTo0NTozNyBJTlRST0RVQ0UgKDEgMTA0NDQ3
NiAyICkNCj4gICDCoCDCoCBDUkVBVEUgY29ubmVjdGlvbiAweDFmNzU4NzANCj4gICDCoCDC
oCBPVVQgMHgxZjc2ZjAwIDIwMjYwNjE5IDE1OjQ1OjM3IFdBVENIX0VWRU5UIChAaW50cm9k
dWNlRG9tYWluIGRvbWxpc3QgKQ0KPiAgIMKgIMKgIE9VVCAweDFmNzZjZTAgMjAyNjA2MTkg
MTU6NDU6MzcgV0FUQ0hfRVZFTlQgKEBpbnRyb2R1Y2VEb21haW4NCj4gc3F1ZWV6ZWQgKQ0K
PiAgIMKgIMKgIE9VVCAweDFmNzdjNDAgMjAyNjA2MTkgMTU6NDU6MzcgV0FUQ0hfRVZFTlQg
KEBpbnRyb2R1Y2VEb21haW7CoCApDQo+ICAgwqAgwqAgT1VUIDB4MWY3ODYxMCAyMDI2MDYx
OSAxNTo0NTozNyBXQVRDSF9FVkVOVCAoQGludHJvZHVjZURvbWFpbsKgICkNCj4gICDCoCDC
oCBPVVQgMHgxZjc4NjEwIDIwMjYwNjE5IDE1OjQ1OjM3IElOVFJPRFVDRSAoT0sgKQ0KPiAN
Cj4gQW5kIGl0IHNlbmRzIEByZWxlYXNlRG9tYWluIHdoZW4gaXQgbm90aWNlcyBkb21pbmZv
LnNodXRkb3duICh3aXRob3V0DQo+IGNoZWNraW5nIGZvciBzaHV0ZG93bl9jb2RlKToNCj4g
DQo+ICAgwqAgwqAgT1VUIDB4MWY3NmYwMCAyMDI2MDYxOSAxNTo0Njo1NiBXQVRDSF9FVkVO
VCAoQHJlbGVhc2VEb21haW4gZG9tbGlzdCApDQo+ICAgwqAgwqAgT1VUIDB4MWY3NmNlMCAy
MDI2MDYxOSAxNTo0Njo1NiBXQVRDSF9FVkVOVCAoQHJlbGVhc2VEb21haW4gc3F1ZWV6ZWQg
KQ0KPiAgIMKgIMKgIE9VVCAweDFmNzdjNDAgMjAyNjA2MTkgMTU6NDY6NTYgV0FUQ0hfRVZF
TlQgKEByZWxlYXNlRG9tYWluICkNCj4gICDCoCDCoCBPVVQgMHgxZjc4NjEwIDIwMjYwNjE5
IDE1OjQ2OjU2IFdBVENIX0VWRU5UIChAcmVsZWFzZURvbWFpbiApDQo+IA0KPiBCdXQgYWZ0
ZXIgZmFzdCByZXN1bWUsIGV2ZW4gdGhvdWdoIElOVFJPRFVDRSByZXR1cm5zIHN1Y2Nlc3Nm
dWxseSwNCj4gQGludHJvZHVjZURvbWFpbiB3YXRjaCBldmVudHMgYXJlIG5vdCByZS1zZW50
Og0KPiANCj4gICDCoCDCoCBJTiAweDFmNzg2MTAgMjAyNjA2MTkgMTU6NDc6MDYgSU5UUk9E
VUNFICgxIDEwNDQ0NzYgMiApDQo+ICAgwqAgwqAgPC0tLS0tIG5vIHdhdGNoIGV2ZW50cw0K
PiAgIMKgIMKgIE9VVCAweDFmNzg2MTAgMjAyNjA2MTkgMTU6NDc6MDYgSU5UUk9EVUNFIChP
SyApDQo+IA0KPiBPeGVuc3RvcmVkIGxpa2V3aXNlIGF2b2lkcyBzZW5kaW5nIEBpbnRyb2R1
Y2VEb21haW4gZm9yICJyZS1jb25uZWN0aW5nIg0KPiBkb21haW5zICh3aGljaCBpcyB3aGF0
IGl0IHRoaW5rcyBhIGRvbWFpbiBjb21pbmcgYmFjayBsaWtlIHRoaXMgbG9va3MgbGlrZSku
DQo+IA0KPiBSRVNVTUUgZG9lcyBub3QgcmUtc2VuZCBAaW50cm9kdWNlRG9tYWluIGVpdGhl
ciwgaXQganVzdCBtYXJrcyB0aGUgZG9tYWluIGFzDQo+IGxpdmUgaW50ZXJuYWxseSBpbiBD
eGVuc3RvcmVkIGFuZCBpcyBhIG5vLW9wIGZvciBPeGVuc3RvcmVkLg0KPiANCj4gVGhpcyBt
aXNzaW5nIG5vdGlmaWNhdGlvbiBsZWFkcyB0byBhbGwga2luZHMgb2YgaXNzdWVzIHNpbmNl
IHRoZSB0b29sc3RhY2tzDQo+IGRvbid0IG5vdGljZSB0aGUgcmVzdW1lZCBkb21haW4gaXMg
YmFjayAoYXQgbGVhc3Qgb24gdGhlIFhBUEkgc2lkZSkuDQo+IA0KPiBJcyB0aGlzIGEgcmVh
bCBpc3N1ZSBvciBpcyB0aGUgdG9vbHN0YWNrIGhvbGRpbmcgeGVuc3RvcmVkIHdyb25nIGhl
cmU/DQo+IA0KPiBJZiBpdCBpcywgSSBzZWUgdHdvIHBvc3NpYmxlIG9wdGlvbnMgZm9yIGhh
bmRsaW5nIHRoaXM6DQo+IA0KPiAxKSBEb24ndCBjb25zaWRlciBTSFVURE9XTl9zdXNwZW5k
IGRvbWFpbnMgYXMgZGVhZCwgb25seSBkcm9wIHRoZW0gd2hlbiB0aGV5DQo+ICAgwqAgwqBh
cmUgZGVmaW5pdGl2ZWx5IGdvbmUuIFRoaXMgYXZvaWRzIHRoZSBAcmVsZWFzZURvbWFpbiBu
b3RpZmljYXRpb24NCj4gICDCoCDCoGFuZCBoZW5jZSBkb2Vzbid0IHJlcXVpcmUgYW5vdGhl
ciBAaW50cm9kdWNlRG9tYWluDQo+IA0KPiAyKSBEbyBhY3R1YWxseSBzZW5kIG91dCBAaW50
cm9kdWNlRG9tYWluIGZvciB0aG91Z2h0LXRvLWJlLXNodXRkb3duIGRvbWFpbnMNCj4gICDC
oCDCoG9uIElOVFJPRFVDRQ0KPiANCj4gVGhvdWdodHM/DQoNCkkgYmVsaWV2ZSAxKSBpcyB0
aGUgd2F5IHRvIGdvIGhlcmUuDQoNCkluIGZhY3QgdGhpcyBpcyBhIGh5cGVydmlzb3IgaXNz
dWUuIEluIF9fZG9tYWluX2ZpbmFsaXNlX3NodXRkb3duKCkgdGhlIGNhbGwNCm9mIGRvbWFp
bl9jaGFuZ2VkX3N0YXRlKCkgc2hvdWxkIG9ubHkgaGFwcGVuIGlmIHNlbmRfZ2xvYmFsX3Zp
cnEoVklSUV9ET01fRVhDKQ0KaXMgZG9uZS4NCg0KQ291bGQgeW91IHBsZWFzZSB0ZXN0IHdo
ZXRoZXIgdGhlIGZvbGxvd2luZyBkaWZmIGlzIGhlbHBpbmc/DQoNCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYw0KaW5kZXggNTNhYzFk
NmM0MC4uYTRkOTA5NWMyMCAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMNCisr
KyBiL3hlbi9jb21tb24vZG9tYWluLmMNCkBAIC0yODYsMTEgKzI4NiwxMiBAQCBzdGF0aWMg
dm9pZCBfX2RvbWFpbl9maW5hbGlzZV9zaHV0ZG93bihzdHJ1Y3QgZG9tYWluICpkKQ0KICAg
ICAgICAgICAgICByZXR1cm47DQoNCiAgICAgIGQtPmlzX3NodXRfZG93biA9IDE7DQotICAg
IGRvbWFpbl9jaGFuZ2VkX3N0YXRlKGQpOw0KICAgICAgaWYgKCAoZC0+c2h1dGRvd25fY29k
ZSA9PSBTSFVURE9XTl9zdXNwZW5kKSAmJiBkLT5zdXNwZW5kX2V2dGNobiApDQogICAgICAg
ICAgZXZ0Y2huX3NlbmQoZCwgZC0+c3VzcGVuZF9ldnRjaG4pOw0KLSAgICBlbHNlDQorICAg
IGVsc2Ugew0KKyAgICAgICAgZG9tYWluX2NoYW5nZWRfc3RhdGUoZCk7DQogICAgICAgICAg
c2VuZF9nbG9iYWxfdmlycShWSVJRX0RPTV9FWEMpOw0KKyAgICB9DQogIH0NCg0KICBzdGF0
aWMgdm9pZCB2Y3B1X2NoZWNrX3NodXRkb3duKHN0cnVjdCB2Y3B1ICp2KQ0KDQoNCg0KSnVl
cmdlbg0K
--------------tkAw6SFUpVzjxrKeqZ8U5DQ0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tkAw6SFUpVzjxrKeqZ8U5DQ0--

--------------TEVojAt0OVMykQIFf1yFbDW8--

--------------VmX5NApdYw10p7qle20XKHvH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpNBOIFAwAAAAAACgkQsN6d1ii/Ey9a
GAf/alIUTA9E6JCivs1B1zx1xZqhUh6M0ZZNQrm5xWc9sQkpv3hUwHDgYXc0QtfJ/GipmEI1x4Gt
2tS63UcmmpN0CN83q7jqfy7nfskKiYtcj0Dpz2KDuRuUHEvb/7KDFOFXErKXdqEmmLdmVpFIpwDz
t4qiSZHpJGM/xk3Pj3b6XFEfAakCVZzWAKGkDLO6WqYjyCglCcQM2tu3g6Q9xq5GJJ1isSBZx/ex
NBABkqKYBzxlA1EpYht4HqYiNQyWxVKENNbkzoSeNSByuW7UfmFc2vzJ/VQgSjHC4Ll4pWQ2wlP2
lC99GydZBsoc0GRPwxmXnvFA9J1V8K5A36rBW6uvGQ==
=CiV1
-----END PGP SIGNATURE-----

--------------VmX5NApdYw10p7qle20XKHvH--

