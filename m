Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOzRCw0lvGkxtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:32:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9742CEDD6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257386.1551794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GHp-00022w-M3; Thu, 19 Mar 2026 16:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257386.1551794; Thu, 19 Mar 2026 16:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3GHp-00021E-It; Thu, 19 Mar 2026 16:31:53 +0000
Received: by outflank-mailman (input) for mailman id 1257386;
 Thu, 19 Mar 2026 16:31:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3GHo-000214-IN
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:31:52 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2159bce5-23b1-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:31:50 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5a27b5ad832so900982e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 09:31:50 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a28530ce0dsm3330e87.81.2026.03.19.09.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 09:31:48 -0700 (PDT)
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
X-Inumbo-ID: 2159bce5-23b1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773937909; x=1774542709; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cci/SwtbewLa+N9buB27xiV3OUQzhGvG/XW3+0wDJao=;
        b=bnuqSoQi5bj81nD9dZzm/isqUzNv5GxV7qgNdTx6B+qtoGGBqsQIIT/bkPUz0KlUqI
         r3cgSutRgae9fu8M7d3ae+YarlSr1nB1WVePWOcRDtWqabP6RhFNa0HViaenVthYe4m6
         jGT4KbNPxu9Eo4QjfrU5816u+PGYcOnL5kljkcv6v01QxV7fYDwkVkPpHNq/Ssqx17M6
         1sM2IdG9cogVSH4rIWzTtLa8szEZWg9T0sTSPeKY76xA+wOHWYyAyX4KWD3TVlCmZyLn
         RaH97IL1mbVKo/RMv0kgC3R7ojLv3DdYXq3kdn9Nj4eCL1oE6bbriXevlMlOVDAvgRX2
         Zzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773937909; x=1774542709;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cci/SwtbewLa+N9buB27xiV3OUQzhGvG/XW3+0wDJao=;
        b=ruqZY3ElYUifeoLNK7dNItHFod7/NJ66efnx8wn57/JYiL1Dg389LVCFxDpI9bhXDo
         k+WsnDodwvmkdx/49fm3Y601H3wd4T0sLe949mYS4+wt9m5aOIl6IhZkmvaR3YvxcyxX
         4gUV0ajDnZF5nPN+q846GILzWDGE4PUQf/tLNZDIw0qhe7O7m4UV7Ukies7QHn6k4INB
         uZjw2ASZ6m8atV2TDoOyR7R27RCXn/+04r6WBqolpROm9o5VAIeVymV03vIcjYegbWZV
         SJ3xvrYE9BxtEofJilWex108HJKUpEiIe8TBoH7nAeRh6Twe4HwhBtso4oUVQ8QncQO+
         mXvg==
X-Gm-Message-State: AOJu0YyAXme+70Z5dwk2q2wtHN9QTYGlbRJgVbJCDUG4CePZySXBl0s7
	nNIykOWsARfz/iCIzPJLnUJAo48lJ7sSLFfpGbKbI6mluY69ZMfWmfJqpZxmU2jgQaZQcKm45DV
	3eq+NW/w=
X-Gm-Gg: ATEYQzw/q/QhwkzwL2OZ3HsuaMUew7up6+We5+9Nqu5l9xxVRf0nmTI0O0O5mpJP/bf
	vTzmMEBy1H6zytPU/GhEp34OXeq39eMcv70RFXEdbmbJJyvmvwL8U4Icnd442K8jOFy64qTroCb
	0l1NuyIV1fVhIX275+FS+tCt94d+4Mb2jRYeDZtpO4FQXLicbOtuUttZHDj0ZrVGArWrPrsNZWt
	1+FPurFy8+abCUNWfo3NUP10yirDZBihFUVXt0gWu2KC6Nzhqms6PLJpPAHWepuASHZlUmd2pvC
	Zqoy0KMCXCxU+mzipxl37+ev5YIRj9H+WjJS3pcgUhxzYnt97Oba8oH21bm2hAbsUwwxjgMx0XJ
	RQvKk8GEYb+aJYzw2N8yJ4c5JWJ7MDZCWRbSKfCE4P2YXEcxkcKqRJp0HX9EPNvr0RVR4CCeisi
	txdlKCLuzGdD0lMf4SLy6IJIUPlSCOZqfIm77+SCu004ugW2nCOhzAD9b4vtoAFzoBYINFs9qPL
	iUHGfRMxNem7G4V0mZjIsqGbi7QRgwhFkLIL+DVNP4lRMEN5jcSrA==
X-Received: by 2002:a05:6512:108c:b0:5a1:3fff:5e91 with SMTP id 2adb3069b0e04-5a2796b44cdmr2872307e87.20.1773937909224;
        Thu, 19 Mar 2026 09:31:49 -0700 (PDT)
Message-ID: <5d9cb2c8-c124-4ab2-9587-f839722435b4@suse.com>
Date: Thu, 19 Mar 2026 17:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] tools/xenstored: add GLOBAL_QUOTA_DATA record for
 live update
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14>
 <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
 <52da8abd-a9d0-4a7d-8213-93a94b489fc6@suse.com> <abwhDCOT487Z4D8A@l14>
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
In-Reply-To: <abwhDCOT487Z4D8A@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oaIGU3wO5XXfMlY3XArHydRH"
X-Spamd-Result: default: False [-2.42 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D9742CEDD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oaIGU3wO5XXfMlY3XArHydRH
Content-Type: multipart/mixed; boundary="------------FPVLejSYf8v0JdUw3lOXQq8b";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-ID: <5d9cb2c8-c124-4ab2-9587-f839722435b4@suse.com>
Subject: Re: [PATCH 04/11] tools/xenstored: add GLOBAL_QUOTA_DATA record for
 live update
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14>
 <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
 <52da8abd-a9d0-4a7d-8213-93a94b489fc6@suse.com> <abwhDCOT487Z4D8A@l14>
In-Reply-To: <abwhDCOT487Z4D8A@l14>

--------------FPVLejSYf8v0JdUw3lOXQq8b
Content-Type: multipart/mixed; boundary="------------jUc9UV2TcwmQsVH4jmTerSez"

--------------jUc9UV2TcwmQsVH4jmTerSez
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjYgMTc6MTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBXZWQsIE1h
ciAxOCwgMjAyNiBhdCAwMToxNjozMFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gT24gMTYuMDMuMjYgMDk6MTUsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4gT24gMTMu
MDMuMjYgMTg6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+PiBPbiBUaHUsIE1hciAw
NSwgMjAyNiBhdCAwMjo1MjowMVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+
Pj4gK3N0YXRpYyB2b2lkIGJ1aWxkX3F1b3RhX2RhdGEoc3RydWN0IHF1b3RhICpxdW90YSwg
dWludDMyX3QgKnZhbCwgY2hhciAqbmFtZSkNCj4+Pj4NCj4+Pj4gSSBndWVzcyB3ZSB3aWxs
IG5lZWQgYSBsZWFwIG9mIGZhaXRoIHRvIHRydXN0IHRoYXQgYHZhbGAgaXMgYmlnIGVub3Vn
aCwNCj4+Pj4gYWZ0ZXIgZmluZGluZyBvdXQgdGhhdCBpdCdzIGFjdHVhbGx5IGFuIG91dHB1
dCBvZiBtdWx0aXBsZSB2YWx1ZXMsIGFuZA0KPj4+PiBub3QgYW4gaW5wdXQgb2YgYSBzaW5n
bGUgdmFsdWUuDQo+Pj4NCj4+PiBUaGF0J3Mgd2hhdCBnZXRfcXVvdGFfc2l6ZSgpIGlzIGNh
bGN1bGF0aW5nLg0KPj4+DQo+Pj4+DQo+Pj4+IEFuZCBgbmFtZWAgc2VlbXMgdG8gYWxzbyBi
ZSBhbiBvdXRwdXQsIGFuZCB0aGlzIGlzIGFjdHVhbGx5IGltcG9zc2libGUNCj4+Pj4gdG8g
Z3Vlc3MgZnJvbSB0aGUgcHJvdG90eXBlLg0KPj4+DQo+Pj4gVHJ1ZS4gV2hhdCBhYm91dCBu
YW1lcz8NCj4+DQo+PiBJIGhhdmUgY2hvc2VuIG5hbWVzX2J1ZiBpbnN0ZWFkLCBtYWtpbmcg
aXQgbW9yZSBjbGVhciB0aGF0IHRoaXMgaXMgYW4NCj4+IG91dHB1dCBwYXJhbWV0ZXIgZm9y
IG11bHRpcGxlIG5hbWVzLg0KPiANCj4gU291bmRzIGdvb2QuDQo+IA0KPj4+Pj4gK2NvbnN0
IGNoYXIgKmR1bXBfc3RhdGVfZ2xiX3F1b3RhKEZJTEUgKmZwKQ0KPj4+Pj4gK3sNCj4+Pj4+
ICvCoMKgwqAgc3RydWN0IHhzX3N0YXRlX3JlY29yZF9oZWFkZXIgKmhlYWQ7DQo+Pj4+PiAr
wqDCoMKgIHN0cnVjdCB4c19zdGF0ZV9nbGJfcXVvdGEgKmdsYjsNCj4+Pj4+ICvCoMKgwqAg
dm9pZCAqcmVjb3JkOw0KPj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgbl9xdW90YTsNCj4+
Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IGxlbiA9IHNpemVvZigqZ2xiKTsNCj4+Pj4+ICvC
oMKgwqAgc2l6ZV90IHJldDsNCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqAgbl9xdW90YSA9IGdl
dF9xdW90YV9zaXplKHF1b3RhcywgJmxlbik7DQo+Pj4+DQo+Pj4+IFNvLCBnZXRfcXVvdGFf
c2l6ZSBpcyBhY3R1YWxseSBhbiAiYWRkIiB0aGUgc2l6ZSB0byB0aGlzIHZhcmlhYmxlLCBh
bmQNCj4+Pj4gbm90ICJzdG9yZSIgdGhlIHNpemUgaW4gdGhpcyB2YXJpYWJsZS4gVGhhdCdz
IG5vdCBjb25mdXNpbmcgYXQgYWxsLg0KPj4+DQo+Pj4gV291bGQgaXQgYmUgYmV0dGVyIGlm
IGxlbiBpcyByZW5hbWVkIHRvIG5hbWVzX2xlbiAoYm90aCBoZXJlIGFuZCB0aGUNCj4+PiBw
YXJhbWV0ZXIgb2YgZ2V0X3F1b3RhX3NpemUoKSk/DQo+Pg0KPj4gSW4gdGhlIGVuZCBJIGhh
dmUgY2hvc2VuIHRvIGFkZCBhIGNvbW1lbnQgYWJvdmUgZ2V0X3F1b3RhX3NpemUoKSBhbmQN
Cj4+IHJlbmFtZSAibGVuIiB0byAicmVjX2xlbiIgaW4gZHVtcF9zdGF0ZV9nbGJfcXVvdGEo
KS4NCj4gDQo+IEl0IHdvdWxkIHN0aWxsIGJlIGNvdW50ZXItaW50dWl0aXZlIGlmIGdldF9x
dW90YV9zaXplKCkgcmV0dXJucyBkaWZmZXJlbnQNCj4gdmFsdWVzIGRlcGVuZGluZyBvbiB0
aGUgaW5pdGlhbCB2YWx1ZSBvZiB0aGUgc2Vjb25kIHBhcmFtZXRlci4gQSBjb21tZW50DQo+
IHdvbid0IGhlbHAuIFNvIEkgd291bGQgc3RpbGwgcHJvcG9zZSB0byBhZGQgInNpemVvZigq
Z2xiKSIgdG8gYGxlbmAgb3INCj4gYHJlY19sZW5gIGFmdGVyIGNhbGxpbmcgZ2V0X3F1b3Rh
X3NpemUuDQoNCk9rYXksIHdpbGwgY2hhbmdlIHRoYXQuDQoNCg0KSnVlcmdlbg0K
--------------jUc9UV2TcwmQsVH4jmTerSez
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------jUc9UV2TcwmQsVH4jmTerSez--

--------------FPVLejSYf8v0JdUw3lOXQq8b--

--------------oaIGU3wO5XXfMlY3XArHydRH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm8JPQFAwAAAAAACgkQsN6d1ii/Ey/h
OQf/Q+70+Blq3JUW1SOGZevxHo/ujvPRsUV98dV71wkLeQfLLTgBGmqO8yCfb1Hslef/lJeGRhN0
0eN2S7h34SEJYCXV7GXXm2vCzdrqyak/ZrOLDqSq9UKud6sesHLU4eq08LYFVo+GBnEquMKFuLQD
aOD3DkSoEnLogG1FEKyB4c6INSnWr7nZ44t0g0B6lEr4mpXGlm5bCEsMpP7Ix4hlWoGDqH5muqJB
GUzZJLvrvKaNWh3uMPEg0EVdS5SqAkwBjcIjWDBYfsbzC6HeI9xR3bFgWVJEafWvPH9gU4VmTMK9
L/2eU9GnF7uEC4pN8zrQ1Rt56xIP7pBlc9CtwjHMGw==
=Bp2r
-----END PGP SIGNATURE-----

--------------oaIGU3wO5XXfMlY3XArHydRH--

