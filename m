Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPkfHlC8t2mpUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 09:16:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF75D296078
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 09:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255462.1550412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w237A-0002qN-CU; Mon, 16 Mar 2026 08:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255462.1550412; Mon, 16 Mar 2026 08:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w237A-0002nm-8i; Mon, 16 Mar 2026 08:15:52 +0000
Received: by outflank-mailman (input) for mailman id 1255462;
 Mon, 16 Mar 2026 08:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6b3Y=BQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w2379-0002nQ-34
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 08:15:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5762b0cb-2110-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 09:15:49 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b8f97c626aaso662576666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 01:15:49 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9791c108f9sm411538166b.8.2026.03.16.01.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 01:15:48 -0700 (PDT)
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
X-Inumbo-ID: 5762b0cb-2110-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773648949; x=1774253749; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xTKMugorEyR3xlXed/uc5awOxdGIKpbnGckWGnd57Hk=;
        b=UBvEZzhqkebaAMwyhOBk2GFJTm2o/hCZQrG3McfTyIg06Tn8U7xxluVEhcKikF+90y
         muhwYbp9TbbcoQcwXSNH4HIjNBOdIgQ2VXZCl19Ms+HRSWoFUfihgQs2xp4ca/y0IhZc
         Jdu8G4SpTJSBt6UdvTu48V20rY50X8oPL60Yg1lI0WW159tdKFJM+5LdYq9w3HutNxGZ
         okBH0+e2iNxWnZJcKL/ALjaxBh+Nwea1JVQ7YsFd9QKLEUMQG9FyOBzQuyyObQnJphG8
         8XVRkM47Jfe7+WvGa/WyrniES//SMeebFoLP0IiNzmKfmbcBwhK9O2kGANJ49SMfonzs
         cF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648949; x=1774253749;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTKMugorEyR3xlXed/uc5awOxdGIKpbnGckWGnd57Hk=;
        b=lhkkz4mps680r7L91YoVjVdtaNCUUncOYfcrCpNY2IHFqFiIqtdH0eks//LavaqJV5
         8uf2NnYpyLtgw8bqZlH0OjBoOoZf5IBmieLwIPEfZ77wHuG5J3KjzXMhrsOM/Mh+kxOU
         LbBgc1H4TbBsdw5vqZg4Blv7vIt+8ykSVYbvG8UdMfMMDEqhlTFbLWOSr9SYzSY67f5z
         F3uSUKJe/nDJhkYaeUh9QYwQetFHojZ+F2YUwZ6UGk1MeO5IjPNOKk46TXEEbCOChFRI
         hCmQf5X4sMK8v3MK6PU83e1hfpxdM4XZXvgHuDV9wj5DE6saVjlLX0WqC4NGD7ACLLtK
         O/Dw==
X-Gm-Message-State: AOJu0YyWmKZGdGsagRUM5IQ11278SyBmaqFIMrxtD83HlwZs9JRLqbXA
	ng6smVya0vEjazKPCU0jV2c0hqAM78VoNErcyBSyAPTVpMeoK935IXK33uYMxy89Wsn/X4Rfp6I
	Lrw4z
X-Gm-Gg: ATEYQzzOWHt3NuNWm7eympb50wKcNDeoa/geuAyXNpCMZZ6DlAyptCsz5MGXopDFc4K
	LEDgzJO5Rb/97V0E0d/3rT/D3KEduIH3xeyQ5CGJZtyyZ2MxlzHOLZ8YhnIH/00ewxdKRh4FITz
	92Jd1W+y7i1+8VkwUd/YrRIOuUf4KB7dzTUr9YiMLJlL1wn6/u879cuPZhnUaBBZaEqHbR1KvRd
	8nva3e1NBwi8c7Y1O6aKXbB/SQXsu2SI5LZruNyBDyMG84HXdLuNjlky8IX4YjQBIbMbnuuUbfQ
	GD+xxbQNnkxPJjwnzmlMOnzJggzzc6wh+FknEgSJaLfhLMhQydDWOnoMgNqnSV16iRJ6QgVyACt
	hN5rLJ1thmtzHzGE/0cdUzxqoIcmWF0JhghHbSRAMbBWOtF+oV7KPp+Znd4da1c0DTwcrReuerU
	Nf7qoWCWdGtu4obHHkKtWfwpeJtxiEKvUyDWcMwDQV0lNGrTfu2kiPEBJjQAeUaJII47BT9Dz7s
	ILeEXoqTNbahfvRCp86VSeHkZm9yJb9uPAoWCyG2pwEeJ5UdN2Xa6BETu5YnmQE
X-Received: by 2002:a17:907:1187:b0:b96:f488:18f6 with SMTP id a640c23a62f3a-b976534685fmr568943266b.34.1773648948759;
        Mon, 16 Mar 2026 01:15:48 -0700 (PDT)
Message-ID: <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
Date: Mon, 16 Mar 2026 09:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] tools/xenstored: add GLOBAL_QUOTA_DATA record for
 live update
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14>
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
In-Reply-To: <abREpWtSt0eLWo4q@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9RsVUVrsItfRZOnhc76LVYg3"
X-Spamd-Result: default: False [-1.42 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,bootlin.com:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF75D296078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9RsVUVrsItfRZOnhc76LVYg3
Content-Type: multipart/mixed; boundary="------------GQZBIOYk3CMRFAAwv8kNWMor";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-ID: <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
Subject: Re: [PATCH 04/11] tools/xenstored: add GLOBAL_QUOTA_DATA record for
 live update
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14>
In-Reply-To: <abREpWtSt0eLWo4q@l14>

--------------GQZBIOYk3CMRFAAwv8kNWMor
Content-Type: multipart/mixed; boundary="------------16xZPGRaf8ZDujsNf46jHx8u"

--------------16xZPGRaf8ZDujsNf46jHx8u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDMuMjYgMTg6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MjowMVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBiL3Rvb2xzL3hlbnN0
b3JlZC9kb21haW4uYw0KPj4gaW5kZXggYWNkY2FhNzY5ZS4uNjk0YWU1ODk3MyAxMDA2NDQN
Cj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gKysrIGIvdG9vbHMveGVu
c3RvcmVkL2RvbWFpbi5jDQo+PiBAQCAtMTMzMiw2ICsxMzMyLDI3IEBAIGludCBkb19zZXRf
ZmVhdHVyZShjb25zdCB2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9uICpjb25uLA0KPj4g
ICAJcmV0dXJuIDA7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGljIGJvb2wgcGFyc2VfcXVv
dGFfbmFtZShjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25lZCBpbnQgKnFpZHgsDQo+PiArCQkJ
ICAgICB1bnNpZ25lZCBpbnQgKmlkeCkNCj4+ICt7DQo+PiArCXVuc2lnbmVkIGludCBxOw0K
PiANCj4gV2hhdCBkbyB5b3UgdGhpbmsgb2YgdXNpbmcgc29tZXRoaW5nIGxpa2U6DQo+ICAg
ICAgY29uc3QgY2hhciBzb2Z0X3ByZWZpeFtdID0gInNvZnQtIjsNCj4gICAgICBjb25zdCBz
aXplX3Qgc29mdF9wcmVmaXhfbGVuID0gc2l6ZW9mKHNvZnRfcHJlZml4KSAtIDE7DQo+IHRv
IGV4cGxhaW4gdGhlIGA1YCwgaGVyZSBhbmQgaW4gZS5nLiB0aGUgZnVuY3Rpb24gYnVpbGRf
cXVvdGFfZGF0YSgpID8NCj4gV2UgdXNlZCB0aGlzIGluIGxpYnhsIGluIG9uZSBwbGFjZToN
Cj4gICAgICBodHRwczovL2VsaXhpci5ib290bGluLmNvbS94ZW4vdjQuMjEuMC9zb3VyY2Uv
dG9vbHMvbGlicy9saWdodC9saWJ4bF9xbXAuYyNMMTI4OA0KPiANCj4gQnV0IGl0J3MgZmlu
ZSB0byBsZWF2ZSBpdCBsaWtlIHRoYXQsIGFzIHRoZSAnNSdzIGFyZSBjbG9zZSBlbm91Z2h0
IHRvDQo+IHRoZSBwcmVmaXggdGhhdCB3ZSBjYW4gZ3Vlc3MgZWFzbHkgZW5vdWdoLg0KDQpJ
IGNhbiBjaGFuZ2UgaXQsIGJ1dCBJJ2QgcHJlZmVyIHRvIHVzZSBtYWNyb3MgZm9yIHRoYXQg
cHVycG9zZS4NCg0KPiANCj4+ICsNCj4+ICsJaWYgKHN0cm5jbXAobmFtZSwgInNvZnQtIiwg
NSkpIHsNCj4+ICsJCSppZHggPSBRX0lEWF9IQVJEOw0KPj4gKwl9IGVsc2Ugew0KPj4gKwkJ
KmlkeCA9IFFfSURYX1NPRlQ7DQo+PiArCQluYW1lICs9IDU7DQo+PiArCX0NCj4+ICsJZm9y
IChxID0gMDsgcSA8IEFDQ19OOyBxKyspIHsNCj4+ICsJCWlmIChxdW90YV9hZG1bcV0ubmFt
ZSAmJiAhc3RyY21wKHF1b3RhX2FkbVtxXS5uYW1lLCBuYW1lKSkgew0KPj4gKwkJCSpxaWR4
ID0gcTsNCj4+ICsJCQlyZXR1cm4gZmFsc2U7DQo+PiArCQl9DQo+PiArCX0NCj4+ICsNCj4+
ICsJcmV0dXJuIHRydWU7DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgaW50IGNsb3NlX3hn
dF9oYW5kbGUodm9pZCAqX2hhbmRsZSkNCj4+ICAgew0KPj4gICAJeGVuZ250dGFiX2Nsb3Nl
KCooeGVuZ250dGFiX2hhbmRsZSAqKilfaGFuZGxlKTsNCj4+IEBAIC0yMDAxLDYgKzIwMjIs
NjEgQEAgdm9pZCByZWFkX3N0YXRlX2Nvbm5lY3Rpb24oY29uc3Qgdm9pZCAqY3R4LCBjb25z
dCB2b2lkICpzdGF0ZSkNCj4+ICAgCX0NCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgdW5z
aWduZWQgaW50IGdldF9xdW90YV9zaXplKHN0cnVjdCBxdW90YSAqcXVvdGEsIHVuc2lnbmVk
IGludCAqbGVuKQ0KPj4gK3sNCj4+ICsJdW5zaWduZWQgaW50IHE7DQo+PiArCXVuc2lnbmVk
IGludCBuID0gMDsNCj4+ICsNCj4+ICsJZm9yIChxID0gMDsgcSA8IEFDQ19OOyBxKyspIHsN
Cj4+ICsJCWlmICghcXVvdGFfYWRtW3FdLm5hbWUpDQo+PiArCQkJY29udGludWU7DQo+PiAr
CQlpZiAocXVvdGFbcV0udmFsW1FfSURYX0hBUkRdICE9IFFfVkFMX0RJU0FCTEVEKSB7DQo+
PiArCQkJbisrOw0KPj4gKwkJCSpsZW4gKz0gc3RybGVuKHF1b3RhX2FkbVtxXS5uYW1lKSAr
IDE7DQo+PiArCQl9DQo+PiArCQlpZiAocXVvdGFbcV0udmFsW1FfSURYX1NPRlRdICE9IFFf
VkFMX0RJU0FCTEVEKSB7DQo+PiArCQkJbisrOw0KPj4gKwkJCSpsZW4gKz0gc3RybGVuKHF1
b3RhX2FkbVtxXS5uYW1lKSArIDUgKyAxOw0KPiANCj4gVGhlIHZhbHVlIDUgaGVyZSBpc24n
dCBleHBsYWluZWQuIEEgY29tbWVudCB3b3VsZCBiZSBuaWNlLg0KDQpVc2luZyB0aGUgbWFj
cm8gbWVudGlvbmVkIGFib3ZlIHdpbGwgbWFrZSBpdCBtb3JlIGRlc2NyaXB0aXZlLg0KDQo+
IA0KPj4gKwkJfQ0KPj4gKwl9DQo+PiArDQo+PiArCXJldHVybiBuOw0KPj4gK30NCj4+ICsN
Cj4+ICtzdGF0aWMgdm9pZCBidWlsZF9xdW90YV9kYXRhKHN0cnVjdCBxdW90YSAqcXVvdGEs
IHVpbnQzMl90ICp2YWwsIGNoYXIgKm5hbWUpDQo+IA0KPiBJIGd1ZXNzIHdlIHdpbGwgbmVl
ZCBhIGxlYXAgb2YgZmFpdGggdG8gdHJ1c3QgdGhhdCBgdmFsYCBpcyBiaWcgZW5vdWdoLA0K
PiBhZnRlciBmaW5kaW5nIG91dCB0aGF0IGl0J3MgYWN0dWFsbHkgYW4gb3V0cHV0IG9mIG11
bHRpcGxlIHZhbHVlcywgYW5kDQo+IG5vdCBhbiBpbnB1dCBvZiBhIHNpbmdsZSB2YWx1ZS4N
Cg0KVGhhdCdzIHdoYXQgZ2V0X3F1b3RhX3NpemUoKSBpcyBjYWxjdWxhdGluZy4NCg0KPiAN
Cj4gQW5kIGBuYW1lYCBzZWVtcyB0byBhbHNvIGJlIGFuIG91dHB1dCwgYW5kIHRoaXMgaXMg
YWN0dWFsbHkgaW1wb3NzaWJsZQ0KPiB0byBndWVzcyBmcm9tIHRoZSBwcm90b3R5cGUuDQoN
ClRydWUuIFdoYXQgYWJvdXQgbmFtZXM/DQoNCj4gDQo+PiArew0KPj4gKwl1bnNpZ25lZCBp
bnQgcTsNCj4+ICsJdW5zaWduZWQgaW50IG4gPSAwOw0KPj4gKw0KPj4gKwlmb3IgKHEgPSAw
OyBxIDwgQUNDX047IHErKykgew0KPj4gKwkJaWYgKCFxdW90YV9hZG1bcV0ubmFtZSkNCj4+
ICsJCQljb250aW51ZTsNCj4+ICsJCWlmIChxdW90YVtxXS52YWxbUV9JRFhfSEFSRF0gIT0g
UV9WQUxfRElTQUJMRUQpIHsNCj4+ICsJCQl2YWxbbisrXSA9IHF1b3RhW3FdLnZhbFtRX0lE
WF9IQVJEXTsNCj4+ICsJCQlzdHJjcHkobmFtZSwgcXVvdGFfYWRtW3FdLm5hbWUpOw0KPj4g
KwkJCW5hbWUgKz0gc3RybGVuKG5hbWUpICsgMTsNCj4+ICsJCX0NCj4+ICsJCWlmIChxdW90
YVtxXS52YWxbUV9JRFhfU09GVF0gIT0gUV9WQUxfRElTQUJMRUQpIHsNCj4+ICsJCQl2YWxb
bisrXSA9IHF1b3RhW3FdLnZhbFtRX0lEWF9TT0ZUXTsNCj4+ICsJCQlzdHJjcHkobmFtZSwg
InNvZnQtIik7DQo+PiArCQkJc3RyY3B5KG5hbWUgKyA1LCBxdW90YV9hZG1bcV0ubmFtZSk7
DQo+PiArCQkJbmFtZSArPSBzdHJsZW4obmFtZSkgKyAxOw0KPj4gKwkJfQ0KPj4gKwl9DQo+
PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHBhcnNlX3F1b3RhX2RhdGEoY29uc3QgdWlu
dDMyX3QgKnZhbCwgY29uc3QgY2hhciAqbmFtZSwNCj4+ICsJCQkgICAgIHVuc2lnbmVkIGlu
dCBuLCBzdHJ1Y3QgcXVvdGEgKnF1b3RhKQ0KPj4gK3sNCj4+ICsJdW5zaWduZWQgaW50IGks
IHEsIGlkeDsNCj4+ICsNCj4+ICsJZm9yIChpID0gMDsgaSA8IG47IGkrKykgew0KPj4gKwkJ
aWYgKCFwYXJzZV9xdW90YV9uYW1lKG5hbWUsICZxLCAmaWR4KSkNCj4+ICsJCQlxdW90YVtx
XS52YWxbaWR4XSA9IHZhbFtpXTsNCj4+ICsJCW5hbWUgKz0gc3RybGVuKG5hbWUpICsgMTsN
Cj4gDQo+IFNvIGZvciBgdmFsYCwgd2UgaGF2ZSBhIHNpemUuIEJ1dCwgd2UgZG9uJ3QgaGF2
ZSBhIHNpemUgZm9yIGBuYW1lYCwgYXJlDQo+IHdlIHN1cmUgdGhhdCBpdCdzIHNhZmUgdG8g
a2VlcCByZWFkaW5nIHBhc3QgYE5VTGAgY2hhcmFjdGVycyA/IElzIHRoZQ0KPiBzaXplIG9m
IG5hbWUgYXZhaWxhYmxlIHNvbWV3aGVyZT8NCg0KWWVzLiBnZXRfcXVvdGFfc2l6ZSgpIGNh
bGN1bGF0ZWQgdGhhdCBhcyB3ZWxsLg0KDQo+IA0KPj4gKwl9DQo+PiArfQ0KPj4gKw0KPj4g
ICBzdGF0aWMgaW50IGR1bXBfc3RhdGVfZG9tYWluKGNvbnN0IHZvaWQgKmssIHZvaWQgKnYs
IHZvaWQgKmFyZykNCj4+ICAgew0KPj4gICAJc3RydWN0IGRvbWFpbiAqZG9tYWluID0gdjsN
Cj4+IEBAIC0yMDQ5LDYgKzIxMjUsNTMgQEAgdm9pZCByZWFkX3N0YXRlX2RvbWFpbihjb25z
dCB2b2lkICpjdHgsIGNvbnN0IHZvaWQgKnN0YXRlLCB1bnNpZ25lZCBpbnQgdmVyc2lvbikN
Cj4+ICAgCQlkb21haW4tPmZlYXR1cmVzID0gc2QtPmZlYXR1cmVzOw0KPj4gICB9DQo+PiAg
IA0KPj4gK2NvbnN0IGNoYXIgKmR1bXBfc3RhdGVfZ2xiX3F1b3RhKEZJTEUgKmZwKQ0KPj4g
K3sNCj4+ICsJc3RydWN0IHhzX3N0YXRlX3JlY29yZF9oZWFkZXIgKmhlYWQ7DQo+PiArCXN0
cnVjdCB4c19zdGF0ZV9nbGJfcXVvdGEgKmdsYjsNCj4+ICsJdm9pZCAqcmVjb3JkOw0KPj4g
Kwl1bnNpZ25lZCBpbnQgbl9xdW90YTsNCj4+ICsJdW5zaWduZWQgaW50IGxlbiA9IHNpemVv
ZigqZ2xiKTsNCj4+ICsJc2l6ZV90IHJldDsNCj4+ICsNCj4+ICsJbl9xdW90YSA9IGdldF9x
dW90YV9zaXplKHF1b3RhcywgJmxlbik7DQo+IA0KPiBTbywgZ2V0X3F1b3RhX3NpemUgaXMg
YWN0dWFsbHkgYW4gImFkZCIgdGhlIHNpemUgdG8gdGhpcyB2YXJpYWJsZSwgYW5kDQo+IG5v
dCAic3RvcmUiIHRoZSBzaXplIGluIHRoaXMgdmFyaWFibGUuIFRoYXQncyBub3QgY29uZnVz
aW5nIGF0IGFsbC4NCg0KV291bGQgaXQgYmUgYmV0dGVyIGlmIGxlbiBpcyByZW5hbWVkIHRv
IG5hbWVzX2xlbiAoYm90aCBoZXJlIGFuZCB0aGUNCnBhcmFtZXRlciBvZiBnZXRfcXVvdGFf
c2l6ZSgpKT8NCg0KPiANCj4+ICsJbGVuICs9IG5fcXVvdGEgKiBzaXplb2YoZ2xiLT5xdW90
YV92YWxbMF0pOw0KPj4gKwlsZW4gPSBST1VORFVQKGxlbiwgMyk7DQo+PiArDQo+PiArCXJl
Y29yZCA9IHRhbGxvY19zaXplKE5VTEwsIGxlbiArIHNpemVvZigqaGVhZCkpOw0KPj4gKwlp
ZiAoIXJlY29yZCkNCj4+ICsJCXJldHVybiAiRHVtcCBnbG9iYWwgcXVvdGEgYWxsb2NhdGlv
biBlcnJvciI7DQo+PiArDQo+PiArCWhlYWQgPSByZWNvcmQ7DQo+PiArCWhlYWQtPnR5cGUg
PSBYU19TVEFURV9UWVBFX0dMQl9RVU9UQTsNCj4+ICsJaGVhZC0+bGVuZ3RoID0gbGVuOw0K
Pj4gKw0KPj4gKwlnbGIgPSAoc3RydWN0IHhzX3N0YXRlX2dsYl9xdW90YSAqKShoZWFkICsg
MSk7DQo+PiArCWdsYi0+bl9kb21fcXVvdGEgPSBuX3F1b3RhOw0KPj4gKwlnbGItPm5fZ2xv
Yl9xdW90YSA9IDA7DQo+IA0KPiBTaG91bGRuJ3QgYG5fcXVvdGFgIGJlIGFzc2lnbmVkIHRv
IGBuX2dsb2JfcXVvdGFgIGluc3RlYWQ/IFdlIGRvbid0IGhhdmUNCj4gcGVyLWRvbWFpbiBx
dW90YSB5ZXQsIGFuZCBvbmx5IGhhdmUgZ2xvYmFsIHF1b3RhLCByaWdodD8NCg0KV2UgYXJl
IGFwcGx5aW5nIGFsbCBnbG9iYWwgcXVvdGEgdmFsdWVzIHRvIHRoZSBkb21haW5zLCBzbyB0
aGlzIGlzIGZpbmUuDQoNCkl0IGlzbid0IGFib3V0IHdoZXJlIHdlIHN0b3JlIHRoZSBxdW90
YSAocGVyIGRvbWFpbiBvciBnbG9iYWxseSksIGJ1dA0KaG93IHRoZSBxdW90YSB2YWx1ZXMg
YXJlIHVzZWQuDQoNCkl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGhhdmUgZS5nLiAidG90YWxf
bWVtb3J5IiBvciAidG90YWxfbm9kZXMiIHF1b3RhDQp3aGljaCB3b3VsZCBub3QgYXBwbHkg
dG8gc2luZ2xlIGRvbWFpbnMsIGJ1dCB0byBhbGwgb2YgeGVuc3RvcmUuIFRob3NlDQp3b3Vs
ZCBuZWVkIHRvIGJlIGNvdW50ZWQgYnkgbl9nbG9iX3F1b3RhLg0KDQo+IA0KPj4gKw0KPj4g
KwlidWlsZF9xdW90YV9kYXRhKHF1b3RhcywgZ2xiLT5xdW90YV92YWwsDQo+PiArCQkJIChj
aGFyICopKGdsYi0+cXVvdGFfdmFsICsgbl9xdW90YSkpOw0KPj4gKw0KPj4gKwlyZXQgPSBm
d3JpdGUocmVjb3JkLCBsZW4gKyBzaXplb2YoKmhlYWQpLCAxLCBmcCk7DQo+PiArDQo+PiAr
CXRhbGxvY19mcmVlKHJlY29yZCk7DQo+PiArDQo+PiArCWlmIChyZXQgIT0gMSB8fCBkdW1w
X3N0YXRlX2FsaWduKGZwKSkNCj4+ICsJCXJldHVybiAiRHVtcCBnbG9iYWwgcXVvdGEgZXJy
b3IiOw0KPj4gKw0KPj4gKwlyZXR1cm4gTlVMTDsNCj4+ICt9DQo+PiArDQo+PiArdm9pZCBy
ZWFkX3N0YXRlX2dsYl9xdW90YShjb25zdCB2b2lkICpjdHgsIGNvbnN0IHZvaWQgKnN0YXRl
KQ0KPj4gK3sNCj4+ICsJY29uc3Qgc3RydWN0IHhzX3N0YXRlX2dsYl9xdW90YSAqZ2xiID0g
c3RhdGU7DQo+PiArCXVuc2lnbmVkIGludCBuX3F1b3RhID0gZ2xiLT5uX2RvbV9xdW90YSAr
IGdsYi0+bl9nbG9iX3F1b3RhOw0KPj4gKwljb25zdCBjaGFyICpuYW1lID0gKGNvbnN0IGNo
YXIgKikoZ2xiLT5xdW90YV92YWwgKyBuX3F1b3RhKTsNCj4+ICsNCj4+ICsJcGFyc2VfcXVv
dGFfZGF0YShnbGItPnF1b3RhX3ZhbCwgbmFtZSwgbl9xdW90YSwgcXVvdGFzKTsNCj4+ICt9
DQo+PiArDQoNCkp1ZXJnZW4NCg==
--------------16xZPGRaf8ZDujsNf46jHx8u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------16xZPGRaf8ZDujsNf46jHx8u--

--------------GQZBIOYk3CMRFAAwv8kNWMor--

--------------9RsVUVrsItfRZOnhc76LVYg3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm3vDQFAwAAAAAACgkQsN6d1ii/Ey+/
Ewf/TM+KSC7+k3yhVk4siGJzL5AjMsX6RC6RZoVXaNTw2ccpDqyNnnY3vfaMie/yVuevb1DrCz1t
r89ZsORAu3jwshurAbssyWoXUXTC/XCwWXQ2ag2vZeIt8DV9g9TqWuCpd/h78aUkPILeChbOpuIP
KaajCJ6qX7I1et7b6GXWwPgvUvV3TlBH2SzEXGV9+qkRNvGCuCP4eeLwSLpMNLqmUEyp/qPkqpPB
e72/SIvtZK8ZKa20NRcGtnCdF8Usy2mxnvVnIje8I1P4OUr0xUHGp5rREo+RCm5hnYhO7p8yKhfC
V1QcFGu7wvAx1I6OT4RlEUfh2fMzSvIDAXMmeFRVhA==
=NDOd
-----END PGP SIGNATURE-----

--------------9RsVUVrsItfRZOnhc76LVYg3--

