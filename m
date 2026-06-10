Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ABFLNhdPKWprUgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:48:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7115C668F2A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:48:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="FMcuV/kY";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1334177.1597283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHQ6-0005w0-97; Wed, 10 Jun 2026 11:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334177.1597283; Wed, 10 Jun 2026 11:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXHQ6-0005to-4V; Wed, 10 Jun 2026 11:48:30 +0000
Received: by outflank-mailman (input) for mailman id 1334177;
 Wed, 10 Jun 2026 11:48:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wXHQ4-0005sc-Gn
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:48:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXHQ3-0093bl-Sg
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:48:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a294f03-e002-0a2a0a5209dd-0a2a450ab1ae-32
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:48:27 +0200
Received: from [209.85.208.54] (helo=mail-ed1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a294f0b-56b3-0a2a450a0019-d155d036e08b-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:48:27 +0200
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-68c19f1f3ceso10708860a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 04:48:27 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68e65027662sm9977446a12.11.2026.06.10.04.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:48:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1781092107; x=1781696907; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GaNEqwUdQ9ePWE4UGxADukb2g8iVupQLLKH37U+8B6o=;
        b=FMcuV/kYrWDsw4tpPNtJx9q0nq31In0+TPgaiTOLLxD/KVWDD+ZysnEcwI8vfyNena
         qohgiJxyH970cMzh83wuv8cj0L7GF7XFi+wdfP72sZRPE0AQlLs1vFvxFEdb4SnBcsI4
         sfRIW2nyDDqRyZ19rAoIRvhwZNU0irogKm7/4qxJe9yWWNU3lZbXkf3U/cHtKdp4Mhgu
         Yv2PXlZbEcjNo8tRxKGB1yvDpW36CQiIzPrQrlRHSb0p+P8h6UkwFNMQhafShq7vypgS
         xnbXm68hkKpjCckxoS5+FzI/8Nsv2psygQ+qaeVcjEtGrnGOr1XH607A1n9sVwbCckUW
         1+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781092107; x=1781696907;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GaNEqwUdQ9ePWE4UGxADukb2g8iVupQLLKH37U+8B6o=;
        b=UdhxfuVjSftG3sJSmgVRFTkgibMEgCGdHoucmy5DhsH/qbsC+qHszszVgTGW28ztoh
         cWIXgHiLkydSqZFOExqZIjN9/Qsep1xlRFhlMKukfBCT3P7M9Z/SooffQSJy0Q50H1jZ
         DATTpf7UFV4D7DXTwyctyA4pQ8rKph7NPxtFpwkqnJoDSzPn5NsScakAwQbItfLcIfuh
         bbQk9u+qLtzfr0NymiZE2u1WPDkaEuQVeYedTosKoIH9cDYWn6IBw410mW88FGGx65xQ
         Yv2zkVPosOIDCc/UpUq0bt82mv6GfgZeqdsyVI/6/+qmhLVgTJqXWr+ZeJ8NL0MQiFIc
         sL9Q==
X-Gm-Message-State: AOJu0YwkyRYQ57/wWRcNAkjBla4jGy3nbRcBmydBsZLtvWH3zRFyoWC4
	/qA0FQALS/S8wuLCLwdFCLpFgLpPfiqgQYH5ze5+FVsDbBKhzYBCVMFTaxSwz1MH61U=
X-Gm-Gg: Acq92OF5IPqsIBzQn+O0h5HUi80X6ytAgwc/0gB6A6tS3+NzTgrawUn1M3MbasvaOGm
	gCPhSMfq3KO86Ugo2xHuRlWgHUeMClMMkaO6Qc4Gj1r+gB5IAJegtaa/XlztD/ciW5NRuEmPpSG
	wQ2drk+W6ypxdL6F+ZSyJqmUrH1xD9I5lu7AZbtQZPNoHCP8F7wnzRwJuriPkBtmnzweWz/9jke
	ATl65Y1qjM0wD4D1fmWhzfptW+N+UWxluvh01jp+G5F5VDZm9ErSBqyv9ZCNPo/3tNf9N03yO4v
	M34A0MO7C6YMxBpSw6RculHbNACqs0gwf+YCeMmnfWYIAzm57EKc2JZYi1fGE50ZhZOeNzr9D4A
	crMNWiIe4JLIao2TxH1tZFQbIqtjOV8Mn0TFSUikTqg2eZmRVGVEHHgIforsd18nKD6S7q6m8Fr
	lFgsUWDYZoFpjRRBpqqCRmOpnITyoyztx3kPPKKYfF2BEcbGF4bBqJjtMWj3G83d3X5sPtjfrzj
	oIOGlARpC3h8kQABzBZVl7hq+lW/jAdmu42bISpXcJbRg//CxophXVLy9Ag/YwVRoxk4RuIOEA=
X-Received: by 2002:a05:6402:35cd:b0:68d:651f:ccf6 with SMTP id 4fb4d7f45d1cf-68fa4c06618mr11673993a12.4.1781092107043;
        Wed, 10 Jun 2026 04:48:27 -0700 (PDT)
Message-ID: <b19b3b96-db17-4ed7-890c-be174b21f391@suse.com>
Date: Wed, 10 Jun 2026 13:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/pvcalls: bound backend response req_id before
 indexing rsp[]
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260610114137.3749027-1-michael.bommarito@gmail.com>
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
In-Reply-To: <20260610114137.3749027-1-michael.bommarito@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Tx1LOYp8wW1aTJ53SXNaFzfJ"
X-purgate-ID: tlsNG-4011c0/1781092107-7D9808B7-704C218E/0/0
X-purgate-type: clean
X-purgate-size: 9178
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 7115C668F2A

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Tx1LOYp8wW1aTJ53SXNaFzfJ
Content-Type: multipart/mixed; boundary="------------d9yYnYsWYCkJQbR32k9vbJ6W";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <b19b3b96-db17-4ed7-890c-be174b21f391@suse.com>
Subject: Re: [PATCH] xen/pvcalls: bound backend response req_id before
 indexing rsp[]
References: <20260610114137.3749027-1-michael.bommarito@gmail.com>
In-Reply-To: <20260610114137.3749027-1-michael.bommarito@gmail.com>

--------------d9yYnYsWYCkJQbR32k9vbJ6W
Content-Type: multipart/mixed; boundary="------------Q20YPybG4hq1agZCvh2N8YwM"

--------------Q20YPybG4hq1agZCvh2N8YwM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDYuMjYgMTM6NDEsIE1pY2hhZWwgQm9tbWFyaXRvIHdyb3RlOg0KPiBwdmNhbGxz
X2Zyb250X2V2ZW50X2hhbmRsZXIoKSB0YWtlcyByZXFfaWQgZGlyZWN0bHkgZnJvbSB0aGUN
Cj4gYmFja2VuZC1zdXBwbGllZCByaW5nIHJlc3BvbnNlIGFuZCB1c2VzIGl0IHRvIGluZGV4
IHRoZSBmaXhlZC1zaXplDQo+IGJlZGF0YS0+cnNwW10gYXJyYXkgZm9yIGEgbWVtY3B5KCkg
YW5kIGEgc3RvcmUsIHdpdGggbm8gcmFuZ2UgY2hlY2suIEENCj4gbWFsaWNpb3VzIG9yIGJ1
Z2d5IGJhY2tlbmQgY2FuIHNldCByZXFfaWQgcGFzdCBQVkNBTExTX05SX1JTUF9QRVJfUklO
Rw0KPiBhbmQgZHJpdmUgYW4gb3V0LW9mLWJvdW5kcyB3cml0ZSBwYXN0IHRoZSBiZWRhdGEg
YWxsb2NhdGlvbi4NCj4gDQo+IHJlcV9pZCB3YXMgYWxzbyBkZWNsYXJlZCBpbnQgd2hpbGUg
dGhlIHdpcmUgZmllbGQgcnNwLT5yZXFfaWQgaXMgdTMyLCBzbw0KPiBhIHJhbmdlIGNoZWNr
IG9uIHRoZSBzaWduZWQgdmFsdWUgaXMgaW5zdWZmaWNpZW50IG9uIGl0cyBvd246IGEgYmFj
a2VuZA0KPiByZXFfaWQgb2YgMHhmZmZmZmZmZiBiZWNvbWVzIC0xLCBwYXNzZXMgdGhlID49
IFBWQ0FMTFNfTlJfUlNQX1BFUl9SSU5HDQo+IHRlc3QsIGFuZCBpbmRleGVzIGJlZGF0YS0+
cnNwWy0xXSwgYW4gb3V0LW9mLWJvdW5kcyB3cml0ZSB0byB0aGUgbGVmdCBvZg0KPiB0aGUg
YXJyYXkuIERlY2xhcmUgcmVxX2lkIGFzIHUzMiBhbmQgYWRkIHRoZSByYW5nZSBjaGVjayBz
byBib3RoIGVuZHMgb2YNCj4gdGhlIGluZGV4IGFyZSBjb3ZlcmVkLg0KPiANCj4gVGhlIHB2
Y2FsbHMgZnJvbnRlbmQgY3VycmVudGx5IHRydXN0cyBpdHMgYmFja2VuZCwgc28gdGhpcyBp
cyBub3QgYQ0KPiBjbGFzc2ljLVhlbiBzZWN1cml0eSBpc3N1ZSwgYnV0IGl0IG1hdHRlcnMg
Zm9yIGhhcmRlbmluZyBQViBmcm9udGVuZHMNCj4gYWdhaW5zdCBtYWxpY2lvdXMgYmFja2Vu
ZHMgKGNvbmZpZGVudGlhbCBhbmQgZGlzYWdncmVnYXRlZCBkZXBsb3ltZW50cykuDQo+IFJl
amVjdCByZXNwb25zZXMgd2hvc2UgcmVxX2lkIGlzIG91dCBvZiByYW5nZS4NCj4gDQo+IEZp
eGVzOiAyMzVhNzFjNTM5MDMgKCJ4ZW4vcHZjYWxsczogaW1wbGVtZW50IHJlbGVhc2UgY29t
bWFuZCIpDQo+IEFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC04DQo+IFNpZ25l
ZC1vZmYtYnk6IE1pY2hhZWwgQm9tbWFyaXRvIDxtaWNoYWVsLmJvbW1hcml0b0BnbWFpbC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyB8IDkgKysrKysr
KystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyBiL2Ry
aXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYw0KPiBpbmRleCA1MGNlNDgyMGY3ZWViLi43OGJk
NGU4OTRiMzJlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWZyb250LmMN
Cj4gKysrIGIvZHJpdmVycy94ZW4vcHZjYWxscy1mcm9udC5jDQo+IEBAIC0xNjgsNyArMTY4
LDggQEAgc3RhdGljIGlycXJldHVybl90IHB2Y2FsbHNfZnJvbnRfZXZlbnRfaGFuZGxlcihp
bnQgaXJxLCB2b2lkICpkZXZfaWQpDQo+ICAgCXN0cnVjdCBwdmNhbGxzX2JlZGF0YSAqYmVk
YXRhOw0KPiAgIAlzdHJ1Y3QgeGVuX3B2Y2FsbHNfcmVzcG9uc2UgKnJzcDsNCj4gICAJdWlu
dDhfdCAqc3JjLCAqZHN0Ow0KPiAtCWludCByZXFfaWQgPSAwLCBtb3JlID0gMCwgZG9uZSA9
IDA7DQo+ICsJdTMyIHJlcV9pZCA9IDA7DQo+ICsJaW50IG1vcmUgPSAwLCBkb25lID0gMDsN
Cj4gICANCj4gICAJaWYgKGRldiA9PSBOVUxMKQ0KPiAgIAkJcmV0dXJuIElSUV9IQU5ETEVE
Ow0KPiBAQCAtMTg1LDYgKzE4NiwxMiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcHZjYWxsc19m
cm9udF9ldmVudF9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkNCj4gICAJCXJzcCA9
IFJJTkdfR0VUX1JFU1BPTlNFKCZiZWRhdGEtPnJpbmcsIGJlZGF0YS0+cmluZy5yc3BfY29u
cyk7DQo+ICAgDQo+ICAgCQlyZXFfaWQgPSByc3AtPnJlcV9pZDsNCj4gKwkJaWYgKHJlcV9p
ZCA+PSBQVkNBTExTX05SX1JTUF9QRVJfUklORykgew0KPiArCQkJLyogTWFsaWNpb3VzIG9y
IGJ1Z2d5IGJhY2tlbmQ6IHJlcV9pZCBvdXQgb2YgcmFuZ2UuICovDQoNClBsZWFzZSBhZGQg
YW4gZXJyb3IgbWVzc2FnZSBoZXJlLCB1c2luZyBwcl9lcnJfb25jZSgpLg0KDQpJbnN0ZWFk
IG9mIGp1c3QgaWdub3Jpbmcgc3VjaCByZXNwb25zZXMsIEknZCBjb25zaWRlciBzdG9wcGlu
ZyBjb21tdW5pY2F0aW9uDQp3aXRoIHRoZSBiYWNrZW5kIGZvciB0aGlzIGRldmljZS4NCg0K
DQpKdWVyZ2VuDQo=
--------------Q20YPybG4hq1agZCvh2N8YwM
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Q20YPybG4hq1agZCvh2N8YwM--

--------------d9yYnYsWYCkJQbR32k9vbJ6W--

--------------Tx1LOYp8wW1aTJ53SXNaFzfJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmopTwoFAwAAAAAACgkQsN6d1ii/Ey+d
Ggf/XZKVztHeDyIB+onfzbh23KeZaRucCZKP8MzxYj9KpYAI53ojxWV4t3yGtfMWnf0JA7TWGgUe
+nYVwi1C2B9eHdkt1kfIhmcKY1AXtMIv8/bwK1+2lpLqhbG+cg/oIOLCNj/J3QWgwVNOBF6D1Zqq
o5XSsaMHgr+jGx5iR7sY2ng23SsX2/3+6dhEF/g1wiXKCex07yaLB9zqACxACC+kIYdQKz7MjXGf
wzt+ZQs3DoPga6t9So3JtZZCOv6TZROi/QGW/OtGZ3X9N0M28gDS+MZZC7IR9a9ERmviy/hOIlUR
4I6UXmoEk4/fqC0opgKIQa2OTsCaunoNngt2PUQb5A==
=OUlR
-----END PGP SIGNATURE-----

--------------Tx1LOYp8wW1aTJ53SXNaFzfJ--

