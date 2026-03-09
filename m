Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFqvCheJrmnKFgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 09:47:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7843235A8F
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 09:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249170.1546673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzWGC-0000Gw-Tp; Mon, 09 Mar 2026 08:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249170.1546673; Mon, 09 Mar 2026 08:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzWGC-0000F4-QN; Mon, 09 Mar 2026 08:46:44 +0000
Received: by outflank-mailman (input) for mailman id 1249170;
 Mon, 09 Mar 2026 08:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Z2Q=BJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vzWGB-0000Ey-1o
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 08:46:43 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d70ac1d-1b94-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 09:46:40 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6615c766e60so5888409a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 01:46:40 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b942efb273csm332695366b.29.2026.03.09.01.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 01:46:38 -0700 (PDT)
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
X-Inumbo-ID: 7d70ac1d-1b94-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773045999; x=1773650799; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mzARPScbwnE1dvt8UvB7LVvBx6Pl5gHYQG6LHeQwFv4=;
        b=aALRuEnk/3JpFGE5VHvjmSpns/b77vXdfLhHlEm89BYsVoEZc+bOlJ+ZGFxrueZySk
         fU1xZbwE+aqrgJdLp/+2zEQFJiFwKiE0bEzM7QfSsmOL7Q0IBbY5Ox29O3opn9qL1VlK
         pSx8OQ5mQK8rlCV/LNq7bMuNwxoqJTKl5260O11SfdpNtaVrkbOiwCu/YS1djxp1vIRW
         u98x5GKo5FlSy7fvCAhRzq6oZpJE0H6UI0FxVM9FepANIj1+C9s0JEX+dqO17H4zOz5N
         S8Cmk75c5yEd37FmO2CL6UfvE8dYxFpUbHnexzccNCBFak0/kn5QOVWHPQ5wA/t0pBRP
         FtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773045999; x=1773650799;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzARPScbwnE1dvt8UvB7LVvBx6Pl5gHYQG6LHeQwFv4=;
        b=jNP9Uqo44hzlByRiT9XXceM62gt6Q+KV2jn9kgn5XlXR/oIDhgl6F+7zpCgJ1IXLvi
         xtxKsGbsLDSoYf6kM3QWvkqRj8chg4CCQvlm6m3F6aNrrxCIPnFyFzlNwwaFfYhi0S2E
         fGS2I9IYKvozBRDRZilUFnjrjqeeVs5F14rJSMpXoIt5F1svv8Oo/9z1HAzIKl5+J+LL
         0VUT/M8cV/kor+YDh01xd9LFJqLMb5BZbmYuw5nBlwXAzzgYhsDEAHrWvbCqZS+il7rw
         SQV0V6HCpkDFR1BEMXIu6hi5NGNUTsZGhvSKf/Az1qfLXjkW7nzNAST4kmM88tnpmPNe
         0Y5w==
X-Gm-Message-State: AOJu0YwAtlWRm+7Ad+P5hWU6dRjBFZsPqBPlXW8W0dPmqWUyTTdgKdGc
	Ot/RJVIk3c0t3TtiMwG7HR2P56aNz9gy8oQCItqvt/gZHhxG5E8tcoxIJcXLjLEN9GI=
X-Gm-Gg: ATEYQzwENIaXwxHmPTeHGrs62tzPP8w6VNZhBqvvqSaNRZHnW+KXipOhwHfgF4WGUwy
	2FxhcqNy2TQxbAUOYQ1fFwSAbUsl90bc5bnkwtdfPmDVgqaINEc3UYJKA3jbQcg6BZNtsFAnyPW
	BV2DIU4w3uN0VG2JGMwmw9lhEsRJfrJszGdzpOpdFY5ubkfHVxGYOjvIgoYrjfZwD+QirMLG+do
	/KKW5cZ2FOb+TxrF8WzlKL6X+Llba+VMgYcOwEwMskP/vWUrQr9nh913/cpWzy0wgXl/9BSakh6
	N85Ku7A1dgJMg7/9hFQKJm8+aIUqFFZGq9W6Kl6wO/yML6V9I3MBuiq0g03/qXaTlmKW/Em6fDL
	OSdN6iPc+E+EHr23d5oq0c3gu4OSBQrXmaEW2uJo6oYDWiFngZzXtfcuXV5iCh7s2/2SL985qG8
	XOhm+bl10Duty+Lf7KCG9uvPB/tbBTnQnHzkU6FyzPEujaNoWCwWDjiA/1oD4Sbd2jG4Q2rT30N
	s7+Tk01sZl38X4y991KF+iwHBcIvgowYbk+0i87+6ciEL8VRAW43A==
X-Received: by 2002:a17:906:f5a5:b0:b90:35c8:d01b with SMTP id a640c23a62f3a-b942df74781mr562384166b.36.1773045999253;
        Mon, 09 Mar 2026 01:46:39 -0700 (PDT)
Message-ID: <a5bfb790-5776-4235-a986-7fecf302b347@suse.com>
Date: Mon, 9 Mar 2026 09:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/grant-table: scope gnttab suspend and resume helpers
 to hibernate callbacks
To: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 18291782795@163.com
References: <20260309083622.717803-1-pengpeng.hou@isrc.iscas.ac.cn>
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
In-Reply-To: <20260309083622.717803-1-pengpeng.hou@isrc.iscas.ac.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4HXLkhp0pooATIYDhpvMKsoZ"
X-Rspamd-Queue-Id: B7843235A8F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,iscas.ac.cn:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng.hou@isrc.iscas.ac.cn,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:18291782795@163.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FREEMAIL_CC(0.00)[lists.xenproject.org,vger.kernel.org,163.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4HXLkhp0pooATIYDhpvMKsoZ
Content-Type: multipart/mixed; boundary="------------hs29NsfQFLuM860P8kEdl2C0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 18291782795@163.com
Message-ID: <a5bfb790-5776-4235-a986-7fecf302b347@suse.com>
Subject: Re: [PATCH] xen/grant-table: scope gnttab suspend and resume helpers
 to hibernate callbacks
References: <20260309083622.717803-1-pengpeng.hou@isrc.iscas.ac.cn>
In-Reply-To: <20260309083622.717803-1-pengpeng.hou@isrc.iscas.ac.cn>

--------------hs29NsfQFLuM860P8kEdl2C0
Content-Type: multipart/mixed; boundary="------------y9t3zWFL0v0uuF0Tre27fsJl"

--------------y9t3zWFL0v0uuF0Tre27fsJl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDMuMjYgMDk6MzYsIFBlbmdwZW5nIEhvdSB3cm90ZToNCj4gRnJvbTogcGVuZ3Bl
bmcuaG91QGlzcmMuaXNjYXMuYWMuY24NCj4gDQo+IEluIGN1cnJlbnQgbGludXguZ2l0ICgx
OTU0YzRmMDEyMjApLCBnbnR0YWJfc3VzcGVuZCgpIGFuZA0KPiBnbnR0YWJfcmVzdW1lKCkg
YXJlIGRlZmluZWQgYW5kIGRlY2xhcmVkIHVuY29uZGl0aW9uYWxseS4gSG93ZXZlciwNCj4g
dGhlaXIgb25seSBpbi10cmVlIGNhbGxlcnMgcmVzaWRlIGluIGRyaXZlcnMveGVuL21hbmFn
ZS5jLCB3aGljaCBhcmUNCj4gZ3VhcmRlZCBieSAjaWZkZWYgQ09ORklHX0hJQkVSTkFURV9D
QUxMQkFDS1MuDQo+IA0KPiBNYXRjaCB0aGUgaGVscGVyIHNjb3BlIHRvIHRoZWlyIGNhbGxl
cnMgYnkgd3JhcHBpbmcgdGhlIGRlZmluaXRpb25zIGluDQo+IENPTkZJR19ISUJFUk5BVEVf
Q0FMTEJBQ0tTIGFuZCBwcm92aWRpbmcgbm8tb3Agc3R1YnMgaW4gdGhlIGhlYWRlci4gVGhp
cw0KPiBmaXhlcyB0aGUgY29uZmlnLXNjb3BlIG1pc21hdGNoIGFuZCByZWR1Y2VzIHRoZSBj
b2RlIGZvb3RwcmludCB3aGVuDQo+IGhpYmVybmF0aW9uIGNhbGxiYWNrcyBhcmUgZGlzYWJs
ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBwZW5ncGVuZy5ob3VAaXNyYy5pc2Nhcy5hYy5j
bg0KPiAtLS0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMgYi9k
cml2ZXJzL3hlbi9ncmFudC10YWJsZS5jDQo+IC0tLSBhL2RyaXZlcnMveGVuL2dyYW50LXRh
YmxlLmMNCj4gKysrIGIvZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYw0KPiBAQA0KPiAtaW50
IGdudHRhYl9yZXN1bWUodm9pZCkNCj4gKyNpZmRlZiBDT05GSUdfSElCRVJOQVRFX0NBTExC
QUNLUw0KPiAraW50IGdudHRhYl9yZXN1bWUodm9pZCkNCj4gICB7DQo+ICAgCWdudHRhYl9y
ZXF1ZXN0X3ZlcnNpb24oKTsNCj4gICAJcmV0dXJuIGdudHRhYl9zZXR1cCgpOw0KPiBAQA0K
PiAgIAlpZiAoeGVuX3B2X2RvbWFpbigpKQ0KPiAgIAkJZ250dGFiX2ludGVyZmFjZS0+dW5t
YXBfZnJhbWVzKCk7DQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gKyNlbmRpZg0KPiAgIA0K
PiAgIHN0YXRpYyBpbnQgZ250dGFiX2V4cGFuZCh1bnNpZ25lZCBpbnQgcmVxX2VudHJpZXMp
DQo+ICAgew0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4vZ3JhbnRfdGFibGUuaCBiL2lu
Y2x1ZGUveGVuL2dyYW50X3RhYmxlLmgNCj4gLS0tIGEvaW5jbHVkZS94ZW4vZ3JhbnRfdGFi
bGUuaA0KPiArKysgYi9pbmNsdWRlL3hlbi9ncmFudF90YWJsZS5oDQo+IEBADQo+ICAgDQo+
ICAgaW50IGdudHRhYl9pbml0KHZvaWQpOw0KPiArI2lmZGVmIENPTkZJR19ISUJFUk5BVEVf
Q0FMTEJBQ0tTDQo+ICAgaW50IGdudHRhYl9zdXNwZW5kKHZvaWQpOw0KPiAgIGludCBnbnR0
YWJfcmVzdW1lKHZvaWQpOw0KPiArI2Vsc2UNCj4gK3N0YXRpYyBpbmxpbmUgaW50IGdudHRh
Yl9zdXNwZW5kKHZvaWQpDQo+ICt7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0
YXRpYyBpbmxpbmUgaW50IGdudHRhYl9yZXN1bWUodm9pZCkNCj4gK3sNCj4gKwlyZXR1cm4g
MDsNCj4gK30NCj4gKyNlbmRpZg0KPiAgIA0KPiAgIGludCBnbnR0YWJfZ3JhbnRfZm9yZWln
bl9hY2Nlc3MoZG9taWRfdCBkb21pZCwgdW5zaWduZWQgbG9uZyBmcmFtZSwNCj4gICAJCQkJ
aW50IHJlYWRvbmx5KTsNCj4gDQo+IA0KDQpJIGRvIGFncmVlIG9uIHRoZSBwdXJwb3NlIG9m
IHRoZSBwYXRjaCwgYnV0IHRoZSBwYXRjaCBpdHNlbGYgaXMgYSBsaXR0bGUNCmJpdCBzdHJh
bmdlLiBUaGUgaHVua3MgbGFjayBhbnkgaW5mb3JtYXRpb24gYWJvdXQgbGluZSBudW1iZXJz
IGFuZCBodW5rDQpzaXplLCBhbmQgdGhlIGNvbnRleHQgaXMgbm90IGNvbnNpc3RlbnQgKDAg
LSA0IGxpbmVzIG9mIHVubW9kaWZpZWQgY29kZQ0KYXJvdW5kIHRoZSBtb2RpZmllZCBwYXJ0
cykuDQoNClBsZWFzZSBwcm9kdWNlIHRoZSBwYXRjaCB3aXRoIGEgcHJvcGVyIHRvb2wsIGxp
a2UgImdpdCBmb3JtYXQtcGF0Y2giLg0KDQoNCkp1ZXJnZW4NCg==
--------------y9t3zWFL0v0uuF0Tre27fsJl
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

--------------y9t3zWFL0v0uuF0Tre27fsJl--

--------------hs29NsfQFLuM860P8kEdl2C0--

--------------4HXLkhp0pooATIYDhpvMKsoZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmuiO4FAwAAAAAACgkQsN6d1ii/Ey/z
Wgf/QYyREP0AsSMRRar57XwrUdlkHBBy2KQ1h82B4amy0RmHL7CQ4fiW5Gvca/4eMjjE4bK3IRn9
o6nrVU/imftyXnTEV0MFh0yocZQDknDa2C8dcYMGaMFu08+gO+CXNWNnWKTPKPCdJEiJbVY4Llj8
bAcQnYsGEXqd0LkRhXTEcJnxK2gNDQDk7F/UJxrDuXS2M2VPF8hpK/TpLI2kmmyNlLqmZt+uBRQf
OS9PM4Zcs2/niwLkNdZ4WMWliVZZtYuyiLNYpc7NIgk7ogayHVuY31NctQ3+9UvPnelHoxuB2FOg
38Pj4/wDd2wh49rPZVNrerc+a9ejlX1nNSPTyyvogg==
=wdKK
-----END PGP SIGNATURE-----

--------------4HXLkhp0pooATIYDhpvMKsoZ--

