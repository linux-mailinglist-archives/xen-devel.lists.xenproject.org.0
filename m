Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VdiqJBcZMGoHNgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:24:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7A0687A16
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:24:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=dX2Fu7wR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338395.1599432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9AG-0002SW-D2; Mon, 15 Jun 2026 15:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338395.1599432; Mon, 15 Jun 2026 15:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ9AG-0002QD-9M; Mon, 15 Jun 2026 15:23:52 +0000
Received: by outflank-mailman (input) for mailman id 1338395;
 Mon, 15 Jun 2026 15:23:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wZ9AE-0002Pn-SP
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:23:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ9AE-006hNO-8v
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:23:50 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3018e0-2eae-0a2a0a5409dd-0a2a4503d820-34
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:23:50 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a301906-672d-0a2a45030019-d155d036c1c3-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:23:50 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-691c5776f95so6804238a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:23:50 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6937919a009sm3908132a12.2.2026.06.15.08.23.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 08:23:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1781537030; x=1782141830; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U0pD8sfvonRfZhHhrXQLk0kLzLYL7vz4j3GNsAzo0Lk=;
        b=dX2Fu7wRBUYVVC781PeYz7+iayVKjcOZU62eYQqEPtVkB7lDsJ9b/9ndn2hKPLxcSd
         3+WFapBqr1R4D7mU66UuofO1YN45MsBVJ9kgvjS5HifBtAsALITZv0RxHgGgrKmm+qBK
         QS/Zn3/T23y/OgSSSVqGhZkT8KEKh58hlEbalcnUNyo8HMfN8BEzMrwI8phnNNOKgOeS
         hBiyxyvXuQ4EZd2qIZ9UWqCR1cvzTHrkbrMntKRTRpAHPNt+uT5MwJhmZQ8Cr0DR0T5T
         0ryZkrxKcNZTQr1Mt+F7O2RvzkMk2EX0ub0aIhqEnbWnLPr7J9oQ2hfb4LYr1R5IEKel
         4nmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781537030; x=1782141830;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0pD8sfvonRfZhHhrXQLk0kLzLYL7vz4j3GNsAzo0Lk=;
        b=GcYdIYDo/f17ixtdmgDfrAF15Tez6B5JqvDHNgnBcuoD/xg5i5JNUCTEwSf4yiCKQh
         ITRwf0mmqd6g/Tr79FoAvxtbK3vwDrqQ/L1AaBPCvwDWXTuuVuH1UclOodK7DYYIVIpr
         qA22Ooi1UcOls4tUHnSkjSqxC/XgGDGaFlx8CLf7JVtWYkX0lxd9n/8PwGMl5fTlDoZA
         K5ivZBZ1GHd0v0GScjOmp4b55MnYPy2yrxg1GATv9rdvTIxEI9y4jso6WFPzPlkiJTm/
         C3juSbo2KjUaTEpzNnU/T0N3ajGIarT+qnaJHZT5pqk7GupPmoDPgRALGcLYOBawmcRe
         V/5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8EuPfTc9j1zgzfe3cSoMQ018ZHAkD9oYUGydnXmqoetzpVUEr3DYUWtEDE4wYO57dLawZ21Aw4hFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxsCjdGIezCduKig9KrVEjHjUPobgMr8QBp7eWQI5B1RWj6CcP
	MPxw/Eveiv8ZJMuTDk52xHCMWnvQxpW50sX7ArI3h+zTtAfFgTGlKfctgTmIpdBe1+A=
X-Gm-Gg: Acq92OHomWPtmFw26FtLJ+8olvYx+SEou94nbth2y5/qhhDCfz2nEz0htfACFdQU9wx
	4NCN8uoqgKKPs9IwrwvOMk2DcUSqdf8IDWoWdo2wqrDazAy6ne46ieOGjvNg+A1XKdWL7zKSiwt
	ma0opC+6eSUVRMgNvwWQlID9yYO3RSKk5lqsLuT4OXpmnuqrT7xaBDuhzPkL9GDppOGFDS3h0nE
	QGZENYojzfwgLtLKCwArGS3XUnH92iE/e567HVr1wkEgdNVoRCOE5sPZcg4bVslg1WtcMoJA5SD
	MeAfBG4djV/4PsArMS8pSLsPaMLXCLX2LbfZ9QVpKbi6edb4VblNpw9zJ8OXWD7yeFOUk9BxC/y
	2CepcV/TlQgJ7VcDPgK+kZ0Hj24J+Gtou0xFJBrSpyUKUq0B0C9GmUBerTh8K2DHTP5GhwCmJp4
	7e7jXR/SxaONvEtxELFujSWMI7NGcc8hLQdPpZIUqs7h1DD2qgklDZNqt/LgZSZ+eqtYJoLeGzC
	3u/+LhNUdSd98DsSvVD5wIX7Fu29s1OMnGLNLQ4tieayasOxWC3gQ==
X-Received: by 2002:a05:6402:a284:10b0:694:fd48:83a8 with SMTP id 4fb4d7f45d1cf-694fd48843amr193808a12.7.1781537029705;
        Mon, 15 Jun 2026 08:23:49 -0700 (PDT)
Message-ID: <69464e3f-895f-4f8f-bd10-a97938e71dbe@suse.com>
Date: Mon, 15 Jun 2026 17:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gntdev: fix refcount leak in
 gntdev_ioctl_map_grant_ref()
To: WenTao Liang <vulab@iscas.ac.cn>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260611142328.87566-1-vulab@iscas.ac.cn>
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
In-Reply-To: <20260611142328.87566-1-vulab@iscas.ac.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------quszfhjmjkSSdySO1vWrN1LH"
X-purgate-ID: tlsNG-33051d/1781537030-41F90938-9804FDAE/0/0
X-purgate-type: clean
X-purgate-size: 8168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vulab@iscas.ac.cn,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,iscas.ac.cn:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD7A0687A16

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------quszfhjmjkSSdySO1vWrN1LH
Content-Type: multipart/mixed; boundary="------------xNzf8DtKZGPX2Os0YABuur72";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: WenTao Liang <vulab@iscas.ac.cn>, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Message-ID: <69464e3f-895f-4f8f-bd10-a97938e71dbe@suse.com>
Subject: Re: [PATCH] xen/gntdev: fix refcount leak in
 gntdev_ioctl_map_grant_ref()
References: <20260611142328.87566-1-vulab@iscas.ac.cn>
In-Reply-To: <20260611142328.87566-1-vulab@iscas.ac.cn>

--------------xNzf8DtKZGPX2Os0YABuur72
Content-Type: multipart/mixed; boundary="------------8JfUFMriZHEtIaFRQ8lwwLxE"

--------------8JfUFMriZHEtIaFRQ8lwwLxE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDYuMjYgMTY6MjMsIFdlblRhbyBMaWFuZyB3cm90ZToNCj4gV2hlbiBnbnRkZXZf
aW9jdGxfbWFwX2dyYW50X3JlZigpIGZhaWxzIHRvIGNvcHkgdGhlIG9wZXJhdGlvbg0KPiBy
ZXN1bHQgYmFjayB0byB1c2Vyc3BhY2UgYWZ0ZXIgc3VjY2Vzc2Z1bGx5IGFkZGluZyB0aGUg
bWFwcGluZyB0bw0KPiB0aGUgbGlzdCwgdGhlIGVycm9yIHBhdGggcmV0dXJucyAtRUZBVUxU
IHdpdGhvdXQgcmVsZWFzaW5nIHRoZQ0KPiByZWZlcmVuY2UgYWNxdWlyZWQgYnkgZ250ZGV2
X2FsbG9jX21hcCgpLiBUaGUgbWFwcGluZyByZW1haW5zIGluDQo+IHByaXYtPm1hcHMgd2l0
aCBhIHJlZmNvdW50IG9mIDEsIGNhdXNpbmcgYSBtZW1vcnkgbGVhayBhbmQgYQ0KPiBkYW5n
bGluZyBsaXN0IGVudHJ5Lg0KPiANCj4gRml4IHRoaXMgYnkgbW92aW5nIHRoZSBjb3B5X3Rv
X3VzZXIoKSBiZWZvcmUgZ250ZGV2X2FkZF9tYXAoKSwNCj4gc28gdGhhdCB0aGUgbWFwcGlu
ZyBpcyBvbmx5IGluc2VydGVkIGludG8gdGhlIGxpc3Qgb24gc3VjY2Vzcy4NCj4gVGhpcyBh
dm9pZHMgdGhlIG5lZWQgdG8gcmVtb3ZlIHRoZSBtYXBwaW5nIGZyb20gdGhlIGxpc3Qgb24g
ZXJyb3IuDQo+IA0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBGaXhlczogNjhi
MDI1YzgxM2MyICgieGVuLWdudGRldjogQWRkIHJlZmVyZW5jZSBjb3VudGluZyB0byBtYXBz
IikNCj4gU2lnbmVkLW9mZi1ieTogV2VuVGFvIExpYW5nIDx2dWxhYkBpc2Nhcy5hYy5jbj4N
Cj4gLS0tDQo+ICAgZHJpdmVycy94ZW4vZ250ZGV2LmMgfCA3ICsrKysrKy0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYw0K
PiBpbmRleCA2MWVhODU1YzQ1MDguLmExYzIzMDc1NmIzZCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy94ZW4vZ250ZGV2LmMNCj4gKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMNCj4gQEAg
LTY3Miw4ICs2NzIsMTMgQEAgc3RhdGljIGxvbmcgZ250ZGV2X2lvY3RsX21hcF9ncmFudF9y
ZWYoc3RydWN0IGdudGRldl9wcml2ICpwcml2LA0KPiAgIAlvcC5pbmRleCA9IG1hcC0+aW5k
ZXggPDwgUEFHRV9TSElGVDsNCj4gICAJbXV0ZXhfdW5sb2NrKCZwcml2LT5sb2NrKTsNCj4g
ICANCj4gLQlpZiAoY29weV90b191c2VyKHUsICZvcCwgc2l6ZW9mKG9wKSkgIT0gMCkNCj4g
KwlpZiAoY29weV90b191c2VyKHUsICZvcCwgc2l6ZW9mKG9wKSkgIT0gMCkgew0KPiArCQlt
dXRleF9sb2NrKCZwcml2LT5sb2NrKTsNCj4gKwkJbGlzdF9kZWwoJm1hcC0+bmV4dCk7DQo+
ICsJCW11dGV4X3VubG9jaygmcHJpdi0+bG9jayk7DQoNCkkgZG9uJ3QgdGhpbmsgdGhpcyBp
cyByYWNlIGZyZWUuDQoNCkp1c3QgZGVyZWZlcmVuY2luZyBtYXAgd2l0aG91dCB2ZXJpZnlp
bmcgaXQgaXMgc3RpbGwgb24gdGhlIGxpc3QgKHRoZSBtdXRleCB3YXMNCmRyb3BwZWQgaW4g
YmV0d2VlbiEpIG1pZ2h0IGFjY2VzcyBhbiBhbHJlYWR5IGZyZWVkIG9iamVjdC4NCg0KSSB0
aGluayB5b3UgbmVlZCB0byBrZWVwIHRoZSBtdXRleCBoZWxkIGFjcm9zcyB0aGUgY29weV90
b191c2VyKCkgYW5kIGRyb3AgaXQNCm9ubHkgYWZ0ZXIgdGhlIGxhc3QgdGltZSBhY2Nlc3Np
bmcgbWFwLg0KDQoNCkp1ZXJnZW4NCg==
--------------8JfUFMriZHEtIaFRQ8lwwLxE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------8JfUFMriZHEtIaFRQ8lwwLxE--

--------------xNzf8DtKZGPX2Os0YABuur72--

--------------quszfhjmjkSSdySO1vWrN1LH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmowGQUFAwAAAAAACgkQsN6d1ii/Ey9T
kwgAgJU1P+urvXdXak7fVaX/9ExbOquaa9iDZupzNMBjwOIogdhdCA53gBQ1jawpUzxCu/uQoRx2
2Jbyh0bPywjds0dlkICRe7QiZd/DP8Xgtqi7hDs9twnNVGjEN0BvFZoZpsZv+AUvKPB4Ffek9qVm
8BjhpQ+L6RzcgFDpBwfb/2hBGaNjL473WjYYpnmaLZPmUbJlvv7lxoYRc/+lgZnFtvCx8U28fXuN
fmJJiIcm4WiLrVSGo/ysKojCa9JcVEXxdAxe+O4HAtIa/mWt4ayq/TpuZZdWtqQXVUalWUk9APDM
iZno4/t4P45hGwek5gTxS0nuEbwo9m09OLPE3/JGdA==
=PkCK
-----END PGP SIGNATURE-----

--------------quszfhjmjkSSdySO1vWrN1LH--

