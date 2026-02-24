Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KINDBziKnWnBQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:23:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642AA186287
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239878.1541284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqVe-0004Kh-LG; Tue, 24 Feb 2026 11:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239878.1541284; Tue, 24 Feb 2026 11:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqVe-0004Hi-IX; Tue, 24 Feb 2026 11:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1239878;
 Tue, 24 Feb 2026 11:23:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6gRX=A4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vuqVd-0004Hc-LO
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:23:21 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38fabc5c-1173-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 12:23:20 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-65a3527c5easo9395846a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:23:20 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eaba42151sm3533171a12.32.2026.02.24.03.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:23:19 -0800 (PST)
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
X-Inumbo-ID: 38fabc5c-1173-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771932199; x=1772536999; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6JcViuDeispOcFlKWWIs4EYnWeu85r9zzjwa53g4/x8=;
        b=DqI+ZHIaAYo1KelW1pDF8qMkCHuCY5xmo+7KMqwHqfKAtE39v64PaiJn7nrN9aBVht
         uV5j6TXm/pFwZIkv4OdLVORHUDP32bK9k/+KEBSUbn85nsQS0i8EN/Sm2pdoz9OIQrlE
         HYiup1Mx8K4C8M9Ru6hHqaLKM4N+GwAkJQ1XgZOKoUbglw2FTgOPyBrx1FN1TMe5ASTt
         HRcLyBEGsROEqR53LRSCSv7xUrg3TsGAqoirO++xKlcw7eBqHDiRc9pD+bySkXASzG+d
         c6nwBkDsyrnY+OxUpjy/rRxlxze+JzRe3nPksnbW2r4VEpDctoC4qjA35JIsCUYKz/3a
         6meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932199; x=1772536999;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JcViuDeispOcFlKWWIs4EYnWeu85r9zzjwa53g4/x8=;
        b=ghpMaXgcoTypeHzTGw9INLOSG6+OxJBB3locoROSrONP4pHE+3BR/tGwQRFigim91+
         ZMbX/VWOPvCev2a8WuYuux2fCzuY0MI+nIuwgvBBJBCr8AxER+x1c24TEKEsgLNlZY5U
         FSq+DnWoso/Miml0hWXAKoadVkbTOh34tL+BQCakDr/8dxgA9O4MpcJc+zhGaokal5ls
         w9U+YotUMUj0a6jVppk1VVELQb14DL2NDjERmRxfhEvmZXiEErLUrah12CKrcGOihOPK
         +/71RbcjcLQeXF0N8VXN/OZ6Jx6daSzwCZlx3eONAX9ZNwQ5viayDTSX18xeAxFizmPJ
         PUAQ==
X-Gm-Message-State: AOJu0YwCvz9ad8u0VdxBd2V386mfIpuS/LW8qBTvufqD7GD7nBwgS9lN
	FHw2tMy/W2cnG4LCoqJroCpAX+YAK4wo/RH/ulyi5s2ebn2xUc3P0VPIAU8evQ7bp0Y=
X-Gm-Gg: ATEYQzwsiuFwy70uxI3VWbjXpDCx+BqejYKpw13tNKHnBGySjAHJNGMdNfiqyWoY6y7
	eIrBlxEO3l9qzY1W+Db4sn/KQWYiXxC0vgCiH/z6BbHQpxoqOQuZ9rT01QwXwziVIXyLNc3NWUA
	K+fBZ+OLw+7sf/E6fIfYqdJ5vANyD7tR/URZ+oiUnYynsuSCWtCCBR+wQ30HTeL1Km/KkHd7TOq
	+dzOQvSRK2K9oaiC+dXZUHY3zA4Arra+nrOCm43udOjO2QL33+7MorpWDx9UhFmXjGjFhK9cfa1
	E0gozA8F8WftDhMoHiJ25i8fTziYMNlg5/UtJwtwdutTD0pAf07zn7wGghRW2h2vUHHlLU/+TGN
	DlW0RN3B3QZOFYvHf5+K8n7G4qKt+P4gygvHd00FoaOkiHSnRbjMp/uM84Q84UThIrvY5cFNLqZ
	Bx6+DMVJBaOgzSToY32V8ek0mCIkiFuZXnhbSJWFI/erV5yjmhppnv/MXmdOoZYH00+7iZu73iP
	/tpSZeqCc1QPVTwtha6hWjAP6xQa6fytbPW2kktfYrtqZ1cysCGpQ==
X-Received: by 2002:a05:6402:210c:b0:658:1d5:be51 with SMTP id 4fb4d7f45d1cf-65ea4ec03d5mr7051426a12.5.1771932199473;
        Tue, 24 Feb 2026 03:23:19 -0800 (PST)
Message-ID: <c788fa3d-4080-47bb-9fb4-1452866393bf@suse.com>
Date: Tue, 24 Feb 2026 12:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
 <aZ2IB9gBo_DrZLSf@macbook.local>
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
In-Reply-To: <aZ2IB9gBo_DrZLSf@macbook.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LTmO2Vt6Lf9aiPWnxHpUROco"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email,oracle.com:email,epam.com:email];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 642AA186287
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LTmO2Vt6Lf9aiPWnxHpUROco
Content-Type: multipart/mixed; boundary="------------7GBOigJwEtIJHq0kc3tOuXkX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <c788fa3d-4080-47bb-9fb4-1452866393bf@suse.com>
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
 <aZ2IB9gBo_DrZLSf@macbook.local>
In-Reply-To: <aZ2IB9gBo_DrZLSf@macbook.local>

--------------7GBOigJwEtIJHq0kc3tOuXkX
Content-Type: multipart/mixed; boundary="------------PFODHX4lAegmlgwu0GkGrlHW"

--------------PFODHX4lAegmlgwu0GkGrlHW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjYgMTI6MTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFR1ZSwg
RmViIDI0LCAyMDI2IGF0IDEwOjUxOjM1QU0gKzAwMDAsIFRlZGR5IEFzdGllIHdyb3RlOg0K
Pj4gSXQncyBjdXJyZW50bHkgcG9zc2libGUgdG8gYnVpbGQgTGludXggd2l0aCBDT05GSUdf
UFZIfENPTkZJR19YRU5fUFZIVk0NCj4+IGFuZCBubyBDT05GSUdfWEVOX1BWSC4gVGhhdCBs
ZWFkcyB0byBpbmNvbnNpc3RlbnQga2VybmVscyB0aGF0IGZhaWxzIHdpdGgNCj4+ICJNaXNz
aW5nIHhlbiBQVkggaW5pdGlhbGl6YXRpb24iIHdoZW4gYm9vdGluZyB1c2luZyBQVkggYm9v
dCBtZXRob2Qgb3INCj4+IGRpc3BsYXkgdmFyaW91cyBlcnJvcnMgYW5kIGZhaWwgdG8gaW5p
dGlhbGl6ZSBYZW4gUFYgZHJpdmVycyB3aGVuIGJvb3RpbmcNCj4+IHdpdGggUFZILUdSVUIu
DQo+Pg0KPj4gICAgICBwbGF0Zm9ybV9wY2lfdW5wbHVnOiBYZW4gUGxhdGZvcm0gUENJOiB1
bnJlY29nbmlzZWQgbWFnaWMgdmFsdWUNCj4+ICAgICAgLi4uDQo+PiAgICAgICMgbW9kcHJv
YmUgeGVuLWJsa2Zyb250DQo+PiAgICAgIG1vZHByb2JlOiBFUlJPUjogY291bGQgbm90IGlu
c2VydCAneGVuX2Jsa2Zyb250JzogTm8gc3VjaCBkZXZpY2UNCj4+ICAgICAgIyBtb2Rwcm9i
ZSB4ZW4tbmV0ZnJvbnQNCj4+ICAgICAgbW9kcHJvYmU6IEVSUk9SOiBjb3VsZCBub3QgaW5z
ZXJ0ICd4ZW5fbmV0ZnJvbnQnOiBObyBzdWNoIGRldmljZQ0KPj4NCj4+IFdoZW4gYnVpbHQg
d2l0aG91dCBDT05GSUdfWEVOX1BWSCwgUFZILXNwZWNpZmljIGxvZ2ljIGlzIGRpc2FibGVk
LCBoZW5jZSB3aGVuDQo+PiBib290aW5nIHdpdGggZS5nIFBWSC1PVk1GLCBMaW51eCBhc3N1
bWVzIHdlIGFyZSBhIEhWTSBndWVzdCwgZXZlbiB3aGVuIHdlIGFyZW4ndA0KPj4gYWN0dWFs
bHkgb25lIChpbiB0aGUgIndpdGggSFZNIGVtdWxhdGVkIGRldmljZXMiIHNlbnNlKS4NCj4+
DQo+PiBBcyBpdCBpcyBhY3R1YWxseSBwb3NzaWJsZSB0byBib290IFhlbiBQVkggd2l0aG91
dCBDT05GSUdfUFZIOyBhbmQgdGhhdCBtb3N0DQo+PiBYZW4tcmVsYXRlZCBsb2dpYyBleGlz
dCB3aXRoaW4gQ09ORklHX1hFTl9QVkhWTTsgY29uc2lkZXIgUFZIIGd1ZXN0cyBzdXBwb3J0
DQo+PiB3aXRoaW4gQ09ORklHX1hFTl9QVkhWTSBpbnN0ZWFkIG9mIENPTkZJR19YRU5fUFZI
Lg0KPiANCj4gU28gdGhlIGN1cnJlbnQgQ09ORklHX1BWSCBzZWxlY3Rpb24gZG9uZSBieSBD
T05GSUdfWEVOX1BWSCBpcyBtb290Pw0KDQpObywgaXQgaXNuJ3QuDQoNCkNPTkZJR19QVkgg
aXMgdGhlIGNvbW1vbiBiYXNlIG5lZWRlZCBmb3IgWGVuIGFuZCBLVk0gZ3Vlc3RzIHRvIGJl
IGFibGUgdG8NCnJ1biBpbiBQVkggbW9kZS4NCg0KPiANCj4+IEtlZXAgQ09ORklHX1hFTl9Q
VkggYXMgYSBzaG9ydGN1dCB0byBlbmFibGUgUFZIIGJvb3QsIEFDUEkgc3VwcG9ydCBhbmQg
UFZIVk0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGll
QHZhdGVzLnRlY2g+DQo+PiAtLS0NCj4+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQo+PiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4NCj4+IENjOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+DQo+Pg0KPj4gQSB0ZW50YXRpdmUgcGF0Y2gsIEknbSBub3Qgc3VyZSBv
ZiB0aGUgd2F5IG9mIGRlYWxpbmcgd2l0aCB0aGUgS0NvbmZpZyBwYXJ0LA0KPj4ga2VlcGlu
ZyBDT05GSUdfWEVOX1BWSCBhcyBhIHNob3J0Y3V0IGlzIGludGVyZXN0aW5nLCBidXQgdGhl
cmUgbWF5IGJlIG90aGVyDQo+PiBvcHRpb25zLg0KPj4NCj4+IFRoZXJlIGFyZSB3aWRlc3By
ZWFkbHkgdXNlZCBMaW51eCBkaXN0cmlidXRpb25zIHRoYXQgaGF2ZSBhIHNpbWlsYXIgY29u
ZmlndXJhdGlvbg0KPj4gdG8gdGhpcyBvbmUsIHRodXMgZXhoaWJpdCB0aGlzIGlzc3VlIGku
ZSBmYWlsIHRvIGJvb3QuDQo+IA0KPiBEbyB5b3Uga25vdyB0aGUgdW5kZXJseWluZyBjYXVz
ZSBvZiBub3QgZW5hYmxpbmcgQ09ORklHX1hFTl9QVkg/ICBJcw0KPiB0aGUgZGVmYXVsdCBz
ZXQgdG8gbiBvbiB0aGUgZGVmY29uZmlnPyAgT3IgYXJlIGRpc3Ryb3Mgc3BlY2lmaWNhbGx5
DQo+IGRpc2FibGluZyB0aGlzIG9wdGlvbiBvbiBwdXJwb3NlPw0KPiANCj4gSXQgc2VlbXMg
bGlrZSBhIHN0ZXAgYmFja3dhcmRzIHRvIG1lcmdlIHRoaXMgaW50byBzb21lIGJpZ2dlciBn
ZW5lcmljDQo+IG9wdGlvbiwgd2UgYWx3YXlzIHRyeSB0byBmaW5lLWdyYWluIGFzIG11Y2gg
YXMgcG9zc2libGUuDQo+IA0KPiBNYXliZSB5b3UgY291bGQgaW50cm9kdWNlIFhFTl9IVk0g
bWV0YSBvcHRpb24sIHRoYXQgc2VsZWN0cyBib3RoIFBWSFZNDQo+IGFuZCBQVkg/DQpObywg
cGxlYXNlIGRvbid0IHVzZSAiSFZNIiBmb3IgdGhhdCBwdXJwb3NlLg0KDQpJZiBhbnl0aGlu
ZyBJJ2Qgc2V0IHRoZSBDT05GSUdfWEVOX1BWSCBkZWZhdWx0IHRvIHRoYXQgb2YgQ09ORklH
X1hFTl9QVkhWTS4NCg0KDQpKdWVyZ2VuDQo=
--------------PFODHX4lAegmlgwu0GkGrlHW
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------PFODHX4lAegmlgwu0GkGrlHW--

--------------7GBOigJwEtIJHq0kc3tOuXkX--

--------------LTmO2Vt6Lf9aiPWnxHpUROco
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmdiiYFAwAAAAAACgkQsN6d1ii/Ey82
dAf+P6GirZvbRYFn+8KxCGWXM+Y3KD2/ekw09K2yEWxPlXAK1KPRRr4YMPaybbAO7ooYmgAyUrSV
pgcjkeN0g/pb0HnSRKmh+49a5ugKvIufqXj3SvYgEOjdsFRMjMgQn6HvgorOek5BnY1/PGqDnFuo
7U/2vb5Hjl/sqGCT4eNx5lTyvd6wlK91xgQVvUpSWhzEsVUOltN4lErDjFzLIrmHlbslLcCXv+T4
4wXHEt9r9WcljAoe58jd17t5fsfbwqiGaj0akYNFY9Q2GadKENJOSWiqNyCPZ52aiva9LKNZNfvD
cMmSIE1HQyoMU62L+6UsGVjDUzeVMibHXjpXnuLqag==
=l96A
-----END PGP SIGNATURE-----

--------------LTmO2Vt6Lf9aiPWnxHpUROco--

