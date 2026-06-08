Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/WALTagJmpHaAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:57:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C6265564C
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:57:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=RhxdykEC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1331595.1594166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXfx-0007yU-Bi; Mon, 08 Jun 2026 10:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331595.1594166; Mon, 08 Jun 2026 10:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXfx-0007vf-8Q; Mon, 08 Jun 2026 10:57:49 +0000
Received: by outflank-mailman (input) for mailman id 1331595;
 Mon, 08 Jun 2026 10:57:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wWXfw-0007rl-DJ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWXfv-00CYoi-QE
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:57:47 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a26a02a-e002-0a2a0a5209dd-0a2a4507d2c4-6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:57:47 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a26a02b-229c-0a2a45070019-d155da2ac12f-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:57:47 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-bec2ddee9bbso838203066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 03:57:47 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055308063sm854822966b.48.2026.06.08.03.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 03:57:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1780916267; x=1781521067; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H9DOL/o9aLea2pHg1OX70F3vZ4vsfjUSxkft6MXXC5U=;
        b=RhxdykECBjvQcbgkqeDDQg0QIifaYEKOS7qkCuRgJqZ9GwQCpChIoGwNfZOd8WruzD
         qpaB5s5uzW++2fxRShnMNFwHFkAa79xEzCgHcIOgv2IF4AXJuPrEZuBrBVyTpsQrbdYK
         Hgg7LdQxpMCE3z0KxwOegnYsF4nnHJpe/ex0+XMMmXcnnwLrvPVr/T6rSC5Dkh2zrQJu
         J89nKXnX3uzYDWSubEZXacq4vyT8DJsPKoRXQBMvreE7+Mls6e4j2kki1CSXyve04e5/
         FyeVI9IhMrLidsWyPQINhreXv232XPaobZsWS9O2SCrMkLLnXeKoMsHdNxYxAlAKywlN
         qrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780916267; x=1781521067;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9DOL/o9aLea2pHg1OX70F3vZ4vsfjUSxkft6MXXC5U=;
        b=JVVbf4wxiP4Tobp0BRstI3TVpIiI2QpHcOgJdLLxSjais5qVtd1zdo4w8wk4i4d+Z5
         zhym4N/1rhDdkpYDcFzXH9AMxKUEjOyJPc7MYZVO4vVNjQvCBR/hCcEI/u4W4zpuDsr5
         R+Fr/tgKJlwfWMR47C13CCgJDbLfuAZ71vOyFCbgi8gWwcjNzXIzNyhY/Ji9KgORApDw
         6B1FLQnTTI53Xeyz7XbLgU7KTaZftSEnUzoC86L1oBrNiq7EcHSj4JMc44IrHFH9AB0n
         pmWeAcGT8wmK9MIW+A9yc7ks/2HyvpQBjQId5Ujvw2c8KZ2+QlbbhwfYvJIFOErnoLjM
         5GKQ==
X-Gm-Message-State: AOJu0YwZfTX41NUdpndPV01pHqbsYdNTdNNC+vjHoDROju5yjdQ52TDr
	+Fbb1GVnS/Fmuh9w+eLAxogrjEA/C0lbIwsjoYGiO1kctsKFRIBQfrHzpOKUzYFfN04=
X-Gm-Gg: Acq92OExm+lP6r92FPsaH2PcHUassFtIEukubzrTe0nve9yU16TYiDF89b811eU+6k1
	gpXp83aQBkV56sl9N3DbhFnJDKazn9GIcBG3NBq0qu7jNUL7Sd8Pi2ZvuFxBQD7eJlhWVcRAdt2
	X4Wrw2HzXXclNzcMO8XUfkrsO3kSlPkotQbMi373GtlVtzpMOjT1tW+Ze7Pq41vyM/ZcgdNOiRd
	mLRoflWklmEiE5XLbLIA9sLFvCU5DfjN4/IItEe8jxKBBz8ygaGS75ike/kab9fiIvPD+SjtA0G
	C8micDMi4qaSN77nZQ0cZGBUvqtksFT3rugevr9sLTdosZE4od5edvTbEJxSyBJsorJ8rdXdN2K
	pEExZPW0CtRxzRTo9dAQdhO3xWaYqwKKPwZ4a+rAeETROtgY8fi9ubXUdOmopWK4DLbUrC3QdcY
	78FX7pHd4nKTEKTtur7Iigamb/YNOisZgGjL7qsuMQ2IcJ8xUJCBjM/UJ15PMvywi+kHJsOIx9e
	vH54FfcUWyfol2xCSupXNCqLU3B7U/6bJJaqusVN96s0vg2s3/Fi0a0mMbjvA7F
X-Received: by 2002:a17:907:7f89:b0:bb8:fd88:f400 with SMTP id a640c23a62f3a-bf370f6b0b1mr732997666b.21.1780916267018;
        Mon, 08 Jun 2026 03:57:47 -0700 (PDT)
Message-ID: <8d17788d-c7cf-47ff-9216-41f920eea621@suse.com>
Date: Mon, 8 Jun 2026 12:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
To: Teddy Astie <teddy.astie@vates.tech>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
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
In-Reply-To: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EJhgzHWGeNJ9mz6vTP1C080x"
X-purgate-ID: tlsNG-ef75cf/1780916267-0B979C48-3F911089/0/0
X-purgate-type: clean
X-purgate-size: 8121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:tglx@linutronix.de,m:xen-devel@lists.xenproject.org,m:olivier.lambert@vates.tech,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22C6265564C

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EJhgzHWGeNJ9mz6vTP1C080x
Content-Type: multipart/mixed; boundary="------------tsXtAwWUSZsZg0hsalyZJhEB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
Message-ID: <8d17788d-c7cf-47ff-9216-41f920eea621@suse.com>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
In-Reply-To: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>

--------------tsXtAwWUSZsZg0hsalyZJhEB
Content-Type: multipart/mixed; boundary="------------L6wly7QKGkrOWKkKyWHkEh4X"

--------------L6wly7QKGkrOWKkKyWHkEh4X
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QWRkIFRob21hcyBHbGVpeG5lciAoYXV0aG9yIG9mIHRoZSBwYXRjaCBpbnRyb2R1Y2luZyB0
aGUgcmVncmVzc2lvbikuDQoNCg0KSnVlcmdlbg0KDQpPbiAwOC4wNi4yNiAxMjoyOSwgVGVk
ZHkgQXN0aWUgd3JvdGU6DQo+IEhlbGxvLA0KPiANCj4gSW4gNi4xMi41KyBrZXJuZWxzIG9u
IEFNRCBDUFVzLCB3ZSBvYnNlcnZlIGFibm9ybWFsbHkgbG9uZyBib290IHRpbWVzIHdoZXJl
IHRoZSANCj4gZ3Vlc3QgaXMgc3RydWdnbGluZyBvbiBQViBzcGlubG9jayBpbml0aWFsaXph
dGlvbi4NCj4gDQo+IFRoaXMgb2NjdXJzIHN0YXJ0aW5nIHdpdGggNi4xMi41LCBhbmQgYWxz
byBvbiBtb3JlIHJlY2VudCBrZXJuZWxzIG9uIEludGVsIA0KPiBwbGF0Zm9ybXMsIGJ1dCB0
aGF0IGhhc24ndCBiZWVuIGZ1bGx5IGludmVzdGlnYXRlZCBhdCB0aGlzIHRpbWUgKGJ1dCBJ
IGFzc3VtZSANCj4gaXQncyBhIHZhcmlhbnQgb2YgdGhlIHNhbWUgaXNzdWUpLg0KPiANCj4g
VGhpcyBvY2N1cnMgc2luY2UgYSBiYWNrcG9ydCBvZiA3NjAzMWQ5ICgiY2xvY2tzb3VyY2U6
IE1ha2UgbmVnYXRpdmUgbW90aW9uIA0KPiBkZXRlY3Rpb24gbW9yZSByb2J1c3QiKS4NCj4g
DQo+IFNvbWUgKGNsYXVkZS1iYXNlZCkgYW5hbHlzaXMgbWFkZSBhcHBlYXJzIHRvIHJlbGF0
ZSB0aGF0IHRvIHRoZSBsYWNrIG9mIHByb3BlciANCj4gbWF4X3Jhd19kZWx0YSBpbiB0aGUg
amlmZmllcyBjbG9ja3NvdXJjZSB3aGljaCBhcHBlYXJzIHRvIG1ha2UgdGhlIGNsb2NrIGZh
aWwgdG8gDQo+IHByb2dyZXNzIG1lYW5pbmdmdWxseS4NCj4gDQo+IEhlcmUgaXMgYSByYXcg
c3VtbWFyeSBvZiB0aGUgYW5hbHlzaXMNCj4gID4gV2UgdHJhY2tlZCBpdCBkb3duIHRvIGEg
c2luZ2xlIHN0YWJsZSBiYWNrcG9ydCBpbiA2LjEyLjU6IGNvbW1pdCAxYTY3OGY2ODI5YTgg
DQo+ICgiY2xvY2tzb3VyY2U6IE1ha2UgbmVnYXRpdmUgbW90aW9uIGRldGVjdGlvbiBtb3Jl
IHJvYnVzdCIsIHVwc3RyZWFtIA0KPiA3NjAzMWQ5NTM2YTApLiBJdCBpbnRyb2R1Y2VzIGEg
bWF4X3Jhd19kZWx0YSBmaWVsZCBvbiBzdHJ1Y3QgY2xvY2tzb3VyY2UgYnV0IA0KPiBuZXZl
ciBpbml0aWFsaXplcyBpdCBmb3IgdGhlIGRlZmF1bHQgYm9vdCB0aW1la2VlcGVyICh0aGUg
amlmZmllcyBjbG9ja3NvdXJjZSksIA0KPiBzbyBjbG9ja3NvdXJjZV9kZWx0YSgpIGNsYW1w
cyBldmVyeSBkZWx0YSB0byAwIGFuZCBDTE9DS19NT05PVE9OSUMgZnJlZXplcyB3aGlsZSAN
Cj4gdGhhdCBjbG9ja3NvdXJjZSBpcyBhY3RpdmUuIE9uIHRoaXMgSFZNIGd1ZXN0LCBTTVAg
YnJpbmctdXAgcnVucyB3aGlsZSB0aGUgDQo+IGppZmZpZXMgY2xvY2tzb3VyY2UgaXMgc3Rp
bGwgdGhlIHRpbWVrZWVwZXIsIGFuZCB0aGUgWGVuIHNpbmdsZSBzaG90IChoaWdoIA0KPiBy
ZXNvbHV0aW9uKSB0aWNrIHRoZW4gYWR2YW5jZXMgamlmZmllcyBmYXIgdG9vIHNsb3dseSwg
c28gdGhlIHNlY29uZGFyeSBDUFVzIA0KPiBidXJuIHNlY29uZHMgaW4gY2FsaWJyYXRlX2Rl
bGF5KCkuDQo+IA0KPiBUZWRkeQ0KDQo=
--------------L6wly7QKGkrOWKkKyWHkEh4X
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------L6wly7QKGkrOWKkKyWHkEh4X--

--------------tsXtAwWUSZsZg0hsalyZJhEB--

--------------EJhgzHWGeNJ9mz6vTP1C080x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmomoCoFAwAAAAAACgkQsN6d1ii/Ey8y
6wf+OG96gAV1ZcRnq8/dlt9Jje0fZQEXvS3qKFdnHSXZuE7J2l/hCL8Mmsu/0zrLOofq+OqzH/5P
eVcZU7/To0S7vr/W21V7u2DooWhAX7jdKtZzcaTY8KMFhnay6ySi7CakSgD8IOEaqbgAfjD2rRfs
cIe5jvQ5IarH+wtyEM0tb47YaOB8YI1KaAFbcvHlAaDxMVp2NyeN7NbwC1/y+4TJmLrKX4MqoSiB
Mj47/Em8mkKhPI5bCvVoxR1qy0lzcRWx/9oUNtVMYdOdiBDzh9ZMOBgSb+lvSuHlleVSWhUZJu4J
It+jwYi9R1vftcBufTT8sPGJhzYgyuvp7IFS+pHBhQ==
=h4Ky
-----END PGP SIGNATURE-----

--------------EJhgzHWGeNJ9mz6vTP1C080x--

