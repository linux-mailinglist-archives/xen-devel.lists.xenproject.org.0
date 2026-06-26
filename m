Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p56FHvtnPmr7FQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:52:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90576CCA6E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 13:52:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NXmetbHT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1346046.1604595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd56T-000317-EV; Fri, 26 Jun 2026 11:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346046.1604595; Fri, 26 Jun 2026 11:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd56T-0002zS-Bp; Fri, 26 Jun 2026 11:52:13 +0000
Received: by outflank-mailman (input) for mailman id 1346046;
 Fri, 26 Jun 2026 11:52:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wd56R-0002zM-Nl
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 11:52:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd56R-006t7q-0e
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 13:52:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e67da-e002-0a2a0a5209dd-0a2a4502a700-32
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:52:10 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a3e67ea-5a27-0a2a45020019-d155d031b498-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 13:52:10 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-697b8540279so1373331a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 04:52:10 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c122db5dba3sm40133566b.22.2026.06.26.04.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 04:52:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1782474730; x=1783079530; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hBl68+QzpBda0pzCXc3ChZ3pzNir2n0QAeAZmeKBtXE=;
        b=NXmetbHTUff4j1X47fEUDFIPEeXNqTyKnttIZfWTF4FhONRJvN98SmcnpFNciWcJrW
         okCji8fgxisNkdrhBf3HZw3VOeW+DUa6LdTxtML4OBr494EqybUTposJ1P+/BVbbV5sq
         Zy/lN1G2X1XLwVMydn5VoOxlX66EpU4GOoI5/OvcCsTgcLDcCVUy6jLHLSAwlV3li+TJ
         LjIoGgXGcAvPxVe3QZuMka77CP2QWS+SLd5Lo6GgrNu1St0J6p/0gi3tdd5XG2+a16Np
         0cmy3LS2dCbrO5Lft5a5/tKpUsTywz8yUkVm28mk6iSeVOoctRhXEtIlw/DJk1ltZ7k8
         a03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782474730; x=1783079530;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBl68+QzpBda0pzCXc3ChZ3pzNir2n0QAeAZmeKBtXE=;
        b=g9OORcl7Nk02k3xvIymxUKrYAbqDRiJ58ghZU01dNGyQicJSeZQ4aEXaD/dAOhKRiY
         U2slI/tImmbo+EoxHDkTIGdw4t90AJ7BRt/HciqMEU09VYsUZiu908DBQxqK46bcbMep
         ErIaxEXEX5+k2Vq3DsP0NLMpmBYyLKF2RTiv51c2XaTAHl/n2jyQ5B1IC+wWM8p7O32l
         8TqUzAN25uCMzecqqtcJjg5vgeMaBlvDq87IWMlgkCo3npqEP/Q+1Y1lA/i7fAmbshHJ
         9InrgpzzfiSjXflSK1AxNYLcCSXDMh15IPaDYfYK0XgS1eY0wCmiKfonwTifKJss2zBn
         jPdQ==
X-Gm-Message-State: AOJu0Yz7VsIjgnMcFs4Xf0KWEs2FkupRzMNV4pO9z2cC1xnMxAYtssjT
	ju9LofVd65VZ5oD0RJKFv04b2W/2DYV5R8jRuyenNxJNAJn99Kq9mqNmq7QktSJCKkk=
X-Gm-Gg: AfdE7cm7+vxa1amO1NNF4HjBuwcuZl4EJSuzU/aQwUeMxEN2//FIq5frxP8kJgMpaVW
	YS8rcGDKHZOT6SxT5qNuU92IpFOnUdoqtBIjnacbst0PxwlBVrtsA6ADsQKRCEJVnpMth6W09Q+
	C4/ReP+PYkTWDyNfdNUl42EM5Cd3j89XtsBQin0c1qZfkb74xH5mXvfCawW1XPb87FGFu28/WaY
	t5apSNvK3RNEfR1sbRhEtBk9MKj7pefxBaFoZHwxEIfH1dEkT1TVJL+CIZk6DyOoRpp80VyhKqH
	idG0umkYfh8tqXDO8MyvqkpmlYEjY1jnbTGFgr6UIm7pEeyTaFsi1sR+iJCJ4CO5P22XrtdAPWA
	YQIhDzoegcOeSAtT2naIt/Po5GP9XaaDGY4SBt4chW6/Hvcal5GBMLUT8rrrO5MuympDdoh1ih9
	hqXGkjeVd3CBb2nswp48xzj7xFs2hkoQUgHXjUDoKAmhDEttGeFvAb/898kRW+PpJCD7mUfVpEp
	2v9tArIKBW0J80uDZMkGyfditGIvwV1iT+n4yedSKc=
X-Received: by 2002:a17:907:1c90:b0:c0c:1259:7a65 with SMTP id a640c23a62f3a-c1205f50228mr420797166b.41.1782474730305;
        Fri, 26 Jun 2026 04:52:10 -0700 (PDT)
Message-ID: <5837c107-d2c7-483e-b0f5-bd824a505561@suse.com>
Date: Fri, 26 Jun 2026 13:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/pvcalls: bound backend response req_id before
 indexing rsp[]
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260610114137.3749027-1-michael.bommarito@gmail.com>
 <20260617014149.2647404-1-michael.bommarito@gmail.com>
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
In-Reply-To: <20260617014149.2647404-1-michael.bommarito@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r0qG0Y9TFQDN7y9ULoy07tu1"
X-purgate-ID: tlsNG-720697/1782474730-55AE07C5-E1A4D37C/0/0
X-purgate-type: clean
X-purgate-size: 8260
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.59 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,epam.com];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D90576CCA6E

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r0qG0Y9TFQDN7y9ULoy07tu1
Content-Type: multipart/mixed; boundary="------------02y2pm3vMHIqAgbHC4GDVbnA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <5837c107-d2c7-483e-b0f5-bd824a505561@suse.com>
Subject: Re: [PATCH v2] xen/pvcalls: bound backend response req_id before
 indexing rsp[]
References: <20260610114137.3749027-1-michael.bommarito@gmail.com>
 <20260617014149.2647404-1-michael.bommarito@gmail.com>
In-Reply-To: <20260617014149.2647404-1-michael.bommarito@gmail.com>

--------------02y2pm3vMHIqAgbHC4GDVbnA
Content-Type: multipart/mixed; boundary="------------0ua1BN9KlMNEI0I5854aEjuS"

--------------0ua1BN9KlMNEI0I5854aEjuS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDYuMjYgMDM6NDEsIE1pY2hhZWwgQm9tbWFyaXRvIHdyb3RlOg0KPiBwdmNhbGxz
X2Zyb250X2V2ZW50X2hhbmRsZXIoKSB0YWtlcyByZXFfaWQgZGlyZWN0bHkgZnJvbSB0aGUN
Cj4gYmFja2VuZC1zdXBwbGllZCByaW5nIHJlc3BvbnNlIGFuZCB1c2VzIGl0IHRvIGluZGV4
IHRoZSBmaXhlZC1zaXplDQo+IGJlZGF0YS0+cnNwW10gYXJyYXkgZm9yIGEgbWVtY3B5KCkg
YW5kIGEgc3RvcmUsIHdpdGggbm8gcmFuZ2UgY2hlY2suIEENCj4gbWFsaWNpb3VzIG9yIGJ1
Z2d5IGJhY2tlbmQgY2FuIHNldCByZXFfaWQgcGFzdCBQVkNBTExTX05SX1JTUF9QRVJfUklO
Rw0KPiBhbmQgZHJpdmUgYW4gb3V0LW9mLWJvdW5kcyB3cml0ZSBwYXN0IHRoZSBiZWRhdGEg
YWxsb2NhdGlvbi4NCj4gDQo+IHJlcV9pZCB3YXMgYWxzbyBkZWNsYXJlZCBpbnQgd2hpbGUg
dGhlIHdpcmUgZmllbGQgcnNwLT5yZXFfaWQgaXMgdTMyLCBzbw0KPiBhIHJhbmdlIGNoZWNr
IG9uIHRoZSBzaWduZWQgdmFsdWUgYWxvbmUgaXMgaW5zdWZmaWNpZW50OiBhIGJhY2tlbmQN
Cj4gcmVxX2lkIG9mIDB4ZmZmZmZmZmYgYmVjb21lcyAtMSwgcGFzc2VzIGEgPj0gUFZDQUxM
U19OUl9SU1BfUEVSX1JJTkcNCj4gdGVzdCBhbmQgaW5kZXhlcyBiZWRhdGEtPnJzcFstMV0u
IERlY2xhcmUgcmVxX2lkIGFzIHUzMiBzbyBhIHNpbmdsZQ0KPiBib3VuZCBjb3ZlcnMgYm90
aCBlbmRzLg0KPiANCj4gQSBiYWNrZW5kIHRoYXQgc2VuZHMgYW4gb3V0LW9mLXJhbmdlIHJl
cV9pZCBoYXMgdmlvbGF0ZWQgdGhlIHdpcmUNCj4gcHJvdG9jb2wsIHNvIHJhdGhlciB0aGFu
IHNpbGVudGx5IGRyb3BwaW5nIHRoZSByZXNwb25zZSwgbG9nIG9uY2UgYW5kDQo+IHN0b3Ag
dHJ1c3RpbmcgdGhlIGJhY2tlbmQ6IHNldCBiZWRhdGEtPmRpc2FibGVkLiBUaGUgZXZlbnQg
aGFuZGxlciB0aGVuDQo+IGlnbm9yZXMgZnVydGhlciByZXNwb25zZXMsIGFuZCB0aGUgcmVx
dWVzdCBwYXRocyB0aGF0IHdhaXQgZm9yIGENCj4gcmVzcG9uc2UgcmV0dXJuIC1FSU8gaW5z
dGVhZCBvZiBibG9ja2luZyBmb3JldmVyLiBUaGlzIG1pcnJvcnMgdGhlDQo+IGZhdGFsLWVy
cm9yIGhhbmRsaW5nIHhlbi1uZXRiYWNrIHVzZXMgKHhlbnZpZl9mYXRhbF90eF9lcnIoKSku
DQo+IA0KPiBUaGUgcHZjYWxscyBmcm9udGVuZCBjdXJyZW50bHkgdHJ1c3RzIGl0cyBiYWNr
ZW5kLCBzbyB0aGlzIGlzIG5vdCBhDQo+IGNsYXNzaWMtWGVuIHNlY3VyaXR5IGlzc3VlLCBi
dXQgaXQgbWF0dGVycyBmb3IgaGFyZGVuaW5nIFBWIGZyb250ZW5kcw0KPiBhZ2FpbnN0IG1h
bGljaW91cyBiYWNrZW5kcyAoY29uZmlkZW50aWFsIGFuZCBkaXNhZ2dyZWdhdGVkIGRlcGxv
eW1lbnRzKS4NCj4gDQo+IEZpeGVzOiAyMTk1MDQ2YmZkNjkgKCJ4ZW4vcHZjYWxsczogaW1w
bGVtZW50IHNvY2tldCBjb21tYW5kIGFuZCBoYW5kbGUgZXZlbnRzIikNCj4gU3VnZ2VzdGVk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IEFzc2lzdGVkLWJ5OiBD
bGF1ZGU6Y2xhdWRlLW9wdXMtNC04DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgQm9tbWFy
aXRvIDxtaWNoYWVsLmJvbW1hcml0b0BnbWFpbC5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=

--------------0ua1BN9KlMNEI0I5854aEjuS
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0ua1BN9KlMNEI0I5854aEjuS--

--------------02y2pm3vMHIqAgbHC4GDVbnA--

--------------r0qG0Y9TFQDN7y9ULoy07tu1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmo+Z+kFAwAAAAAACgkQsN6d1ii/Ey80
8Af/fSAn8inD1McGn/vePbiogbJLxzqN+Rl3GTCynHYL+WTkiezsAPhHwyNElsr49V0gKyctgd0w
BVb8ObFSekA4XXx9RMMNQC+u0oJUZoaGIimDHyQbM91TLwkL6I0t0zoJOtv0srZUH0nEVXUEYpFv
U5utsE3rCt05aabsShqMpeHFPPx40pG5ha57sbcYi/lU0ZSOJTY6P4O21MTBChWiWPEnQ5MTel+/
UMkDwSb2NbkKUdhglmnvmaVFZR4vfJyRvd6iSWvqPy36J8PMwelzrB2WOq4Sr8SuAN/T3K28UeIp
aTP/Zka5x/p5fDQIJc/vf3ILHGro5gJ2IBcs+iFSLQ==
=8xK3
-----END PGP SIGNATURE-----

--------------r0qG0Y9TFQDN7y9ULoy07tu1--

