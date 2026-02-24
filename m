Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJrOM5KtnWmgQwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 14:54:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317DE188102
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 14:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240070.1541568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vusqv-0007HV-E1; Tue, 24 Feb 2026 13:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240070.1541568; Tue, 24 Feb 2026 13:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vusqv-0007Ew-Ax; Tue, 24 Feb 2026 13:53:29 +0000
Received: by outflank-mailman (input) for mailman id 1240070;
 Tue, 24 Feb 2026 13:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6gRX=A4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vusqt-0007Eq-M1
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 13:53:27 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30814049-1188-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 14:53:25 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-65f5bd5c8e3so1118914a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 05:53:25 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65eab9a077asm3653020a12.4.2026.02.24.05.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 05:53:24 -0800 (PST)
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
X-Inumbo-ID: 30814049-1188-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771941205; x=1772546005; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NafbG4Q2oHJGwYpTFWq8ex1ANZs8I/TQTK7EGeic3fQ=;
        b=E7x31fkPmmagBVhNLsU+v/RdlDHCoiNPMfuo4PrDNlCbRucIGg+sP1XTwyk18DLVVf
         hmbynEQLyqa04JADqUscJZcTdoFHmrmTjhz1bZJmLDLLZwcufXz5iibfcx7GTpEPJIk7
         GJ0LRDSNnt8OvXzw5cZRR3jIIVpAmVMKRxQxsJZgPvZmw7aTJxx4z9QPjIvqGZvjM3VO
         pVdWYiy1V05cFVJ5xjUrERhftQEa5RPF6XxGUrIUONvsD7yYOllwRoddboh0swYvpf4h
         no+smBvQVgl0xyA1xQ5OyQL71NxAqzJ1xgT1LfjBixgQElt1uSUqnWi0j0O8vZv64jNf
         GcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771941205; x=1772546005;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NafbG4Q2oHJGwYpTFWq8ex1ANZs8I/TQTK7EGeic3fQ=;
        b=uOQa3CmeS5vaYpL6YyFcZv5GKZIB+LOIaDs0XxFt0MyUaKe+KQTkd+dwjR6AhsVYzr
         1nkvd48Ge9m6K+u115/z8+RfEUM4KPeJWi5Xjoe50GeBBd4+rDewLtHVpLusGPwW8+SO
         2I2m3xQTtslDmcLT9RltrqQsYzfD8L0w4g0d6ZPQgRqSiS0s9MuDm23oQ88EQrWzrc2A
         KvgvpOB3wbqrv7d7x1B7FazL8lhb0+qlvTD2tOCquNgzYPKvkbhWq49JQJ1zXrdTHeR6
         AagmXE2VOionbqYcqz2xC/rmJIAKhoRVMa/FXJVRD8sAlZPxqZe0+vPKAFnD/tWstEG3
         MIRQ==
X-Gm-Message-State: AOJu0Yw7s2bPf1j4tIa+JDiXu5rj9oBe6IOsK4q5029QaOHKOvCHhv6o
	s5al62goA18u2tL+9OZ+xQSOsxXT7akaNT8grG6y1jonlQonGRYXKU15jyQWFt1o0W0=
X-Gm-Gg: ATEYQzx458eJs/c3Sf8NFrATnPuJt9qIC4T8lcbRmZfyDq/phEENXGHua8XSItRHAqZ
	d1aghRf0nFmw1rFjZ1lj9PEXxSaSHxq5W49y8S94KfGH+Ki1wBP6sQqo7HJo9H550db4opPojV7
	AS7Pf89kClGBUT/Rgc8zcfB2McGhEdQ0GxiANu2aYc/4JKqpRfAZKJlSDk9yJprIfP4YWvON9vs
	VZSgO+j18AQBltiHZwOYAAbRlUUmUIpmX6EjE/1i568EJ79/n1MoKIbOHRwFmWnOvIDBQ04XLJN
	XZwczwspWmdx7ErqoP9aQdIxVanywBq54O2AOE1J7aVTDxmzRvFltTgC7eogBe1PskLSQ0filVW
	9gDlvJrbSpLuA6wzvwaBlA+RysMIH2LNuiHFMQOEIaAhc1nVm4z/yKZ4sROVGEeb2eJ08YhNHz+
	ddGiPboSrzsiAiYf6E2Gn7JNeB6fyOqn5KRXKcOsWCCYoJ5m26Cx+mx9ox1CvTOuezgMpmbI6hN
	CCpOXxvOac1wul1+OCoNbw6Zl5hs6QFhmUDfAteLDoLiPExznI4aSAubUMQqCJ9
X-Received: by 2002:a05:6402:34d5:b0:65c:64a:2164 with SMTP id 4fb4d7f45d1cf-65ea4ee7b62mr8032598a12.12.1771941204604;
        Tue, 24 Feb 2026 05:53:24 -0800 (PST)
Message-ID: <c317c1ee-82d9-4e9d-9c47-fb474527b5ae@suse.com>
Date: Tue, 24 Feb 2026 14:53:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
To: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
 <aZ2IB9gBo_DrZLSf@macbook.local>
 <c788fa3d-4080-47bb-9fb4-1452866393bf@suse.com>
 <d4ff30fe-4770-49a7-8f80-3e45370b682a@vates.tech>
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
In-Reply-To: <d4ff30fe-4770-49a7-8f80-3e45370b682a@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QPptFcXq6v9lbURaP95pBHbq"
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
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,oracle.com:email,epam.com:email,vates.tech:email];
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
X-Rspamd-Queue-Id: 317DE188102
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QPptFcXq6v9lbURaP95pBHbq
Content-Type: multipart/mixed; boundary="------------hoFB35ELV9PuN50zNpHBJNHt";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <c317c1ee-82d9-4e9d-9c47-fb474527b5ae@suse.com>
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
 <aZ2IB9gBo_DrZLSf@macbook.local>
 <c788fa3d-4080-47bb-9fb4-1452866393bf@suse.com>
 <d4ff30fe-4770-49a7-8f80-3e45370b682a@vates.tech>
In-Reply-To: <d4ff30fe-4770-49a7-8f80-3e45370b682a@vates.tech>

--------------hoFB35ELV9PuN50zNpHBJNHt
Content-Type: multipart/mixed; boundary="------------jZClsr1CzM0Z048GPlPJhl0W"

--------------jZClsr1CzM0Z048GPlPJhl0W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDIuMjYgMTM6NDYsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBMZSAyNC8wMi8yMDI2
IMOgIDEyOjI1LCBKw7xyZ2VuIEdyb8OfIGEgw6ljcml0wqA6DQo+PiBPbiAyNC4wMi4yNiAx
MjoxNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUdWUsIEZlYiAyNCwgMjAy
NiBhdCAxMDo1MTozNUFNICswMDAwLCBUZWRkeSBBc3RpZSB3cm90ZToNCj4+Pj4gSXQncyBj
dXJyZW50bHkgcG9zc2libGUgdG8gYnVpbGQgTGludXggd2l0aCBDT05GSUdfUFZIfENPTkZJ
R19YRU5fUFZIVk0NCj4+Pj4gYW5kIG5vIENPTkZJR19YRU5fUFZILiBUaGF0IGxlYWRzIHRv
IGluY29uc2lzdGVudCBrZXJuZWxzIHRoYXQgZmFpbHMNCj4+Pj4gd2l0aA0KPj4+PiAiTWlz
c2luZyB4ZW4gUFZIIGluaXRpYWxpemF0aW9uIiB3aGVuIGJvb3RpbmcgdXNpbmcgUFZIIGJv
b3QgbWV0aG9kIG9yDQo+Pj4+IGRpc3BsYXkgdmFyaW91cyBlcnJvcnMgYW5kIGZhaWwgdG8g
aW5pdGlhbGl6ZSBYZW4gUFYgZHJpdmVycyB3aGVuDQo+Pj4+IGJvb3RpbmcNCj4+Pj4gd2l0
aCBQVkgtR1JVQi4NCj4+Pj4NCj4+Pj4gIMKgwqDCoMKgIHBsYXRmb3JtX3BjaV91bnBsdWc6
IFhlbiBQbGF0Zm9ybSBQQ0k6IHVucmVjb2duaXNlZCBtYWdpYyB2YWx1ZQ0KPj4+PiAgwqDC
oMKgwqAgLi4uDQo+Pj4+ICDCoMKgwqDCoCAjIG1vZHByb2JlIHhlbi1ibGtmcm9udA0KPj4+
PiAgwqDCoMKgwqAgbW9kcHJvYmU6IEVSUk9SOiBjb3VsZCBub3QgaW5zZXJ0ICd4ZW5fYmxr
ZnJvbnQnOiBObyBzdWNoIGRldmljZQ0KPj4+PiAgwqDCoMKgwqAgIyBtb2Rwcm9iZSB4ZW4t
bmV0ZnJvbnQNCj4+Pj4gIMKgwqDCoMKgIG1vZHByb2JlOiBFUlJPUjogY291bGQgbm90IGlu
c2VydCAneGVuX25ldGZyb250JzogTm8gc3VjaCBkZXZpY2UNCj4+Pj4NCj4+Pj4gV2hlbiBi
dWlsdCB3aXRob3V0IENPTkZJR19YRU5fUFZILCBQVkgtc3BlY2lmaWMgbG9naWMgaXMgZGlz
YWJsZWQsDQo+Pj4+IGhlbmNlIHdoZW4NCj4+Pj4gYm9vdGluZyB3aXRoIGUuZyBQVkgtT1ZN
RiwgTGludXggYXNzdW1lcyB3ZSBhcmUgYSBIVk0gZ3Vlc3QsIGV2ZW4NCj4+Pj4gd2hlbiB3
ZSBhcmVuJ3QNCj4+Pj4gYWN0dWFsbHkgb25lIChpbiB0aGUgIndpdGggSFZNIGVtdWxhdGVk
IGRldmljZXMiIHNlbnNlKS4NCj4+Pj4NCj4+Pj4gQXMgaXQgaXMgYWN0dWFsbHkgcG9zc2li
bGUgdG8gYm9vdCBYZW4gUFZIIHdpdGhvdXQgQ09ORklHX1BWSDsgYW5kDQo+Pj4+IHRoYXQg
bW9zdA0KPj4+PiBYZW4tcmVsYXRlZCBsb2dpYyBleGlzdCB3aXRoaW4gQ09ORklHX1hFTl9Q
VkhWTTsgY29uc2lkZXIgUFZIIGd1ZXN0cw0KPj4+PiBzdXBwb3J0DQo+Pj4+IHdpdGhpbiBD
T05GSUdfWEVOX1BWSFZNIGluc3RlYWQgb2YgQ09ORklHX1hFTl9QVkguDQo+Pj4NCj4+PiBT
byB0aGUgY3VycmVudCBDT05GSUdfUFZIIHNlbGVjdGlvbiBkb25lIGJ5IENPTkZJR19YRU5f
UFZIIGlzIG1vb3Q/DQo+Pg0KPj4gTm8sIGl0IGlzbid0Lg0KPj4NCj4+IENPTkZJR19QVkgg
aXMgdGhlIGNvbW1vbiBiYXNlIG5lZWRlZCBmb3IgWGVuIGFuZCBLVk0gZ3Vlc3RzIHRvIGJl
IGFibGUgdG8NCj4+IHJ1biBpbiBQVkggbW9kZS4NCj4+DQo+IA0KPiBUbyBtZSwgQ09ORklH
X1BWSCBpcyBtb3JlIGFib3V0IGJlaW5nIGFibGUgdG8gYm9vdCB1c2luZyBQVkggRGlyZWN0
IEJvb3QNCj4gdGhhbiBzb21ldGhpbmcgZWxzZS4NCg0KVGhpcyBpcyBvbmUgYXNwZWN0IG9m
IGl0LCB5ZXMuDQoNCj4gDQo+Pj4NCj4+Pj4gS2VlcCBDT05GSUdfWEVOX1BWSCBhcyBhIHNo
b3J0Y3V0IHRvIGVuYWJsZSBQVkggYm9vdCwgQUNQSSBzdXBwb3J0DQo+Pj4+IGFuZCBQVkhW
TS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVGVkZHkgQXN0aWUgPHRlZGR5LmFzdGll
QHZhdGVzLnRlY2g+DQo+Pj4+IC0tLQ0KPj4+PiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPg0KPj4+PiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4NCj4+Pj4gQ2M6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJf
dHlzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4NCj4+Pj4gQSB0ZW50YXRpdmUgcGF0Y2gsIEkn
bSBub3Qgc3VyZSBvZiB0aGUgd2F5IG9mIGRlYWxpbmcgd2l0aCB0aGUNCj4+Pj4gS0NvbmZp
ZyBwYXJ0LA0KPj4+PiBrZWVwaW5nIENPTkZJR19YRU5fUFZIIGFzIGEgc2hvcnRjdXQgaXMg
aW50ZXJlc3RpbmcsIGJ1dCB0aGVyZSBtYXkgYmUNCj4+Pj4gb3RoZXINCj4+Pj4gb3B0aW9u
cy4NCj4+Pj4NCj4+Pj4gVGhlcmUgYXJlIHdpZGVzcHJlYWRseSB1c2VkIExpbnV4IGRpc3Ry
aWJ1dGlvbnMgdGhhdCBoYXZlIGEgc2ltaWxhcg0KPj4+PiBjb25maWd1cmF0aW9uDQo+Pj4+
IHRvIHRoaXMgb25lLCB0aHVzIGV4aGliaXQgdGhpcyBpc3N1ZSBpLmUgZmFpbCB0byBib290
Lg0KPj4+DQo+Pj4gRG8geW91IGtub3cgdGhlIHVuZGVybHlpbmcgY2F1c2Ugb2Ygbm90IGVu
YWJsaW5nIENPTkZJR19YRU5fUFZIP8KgIElzDQo+Pj4gdGhlIGRlZmF1bHQgc2V0IHRvIG4g
b24gdGhlIGRlZmNvbmZpZz/CoCBPciBhcmUgZGlzdHJvcyBzcGVjaWZpY2FsbHkNCj4+PiBk
aXNhYmxpbmcgdGhpcyBvcHRpb24gb24gcHVycG9zZT8NCj4+Pg0KPj4+IEl0IHNlZW1zIGxp
a2UgYSBzdGVwIGJhY2t3YXJkcyB0byBtZXJnZSB0aGlzIGludG8gc29tZSBiaWdnZXIgZ2Vu
ZXJpYw0KPj4+IG9wdGlvbiwgd2UgYWx3YXlzIHRyeSB0byBmaW5lLWdyYWluIGFzIG11Y2gg
YXMgcG9zc2libGUuDQo+Pj4NCj4+PiBNYXliZSB5b3UgY291bGQgaW50cm9kdWNlIFhFTl9I
Vk0gbWV0YSBvcHRpb24sIHRoYXQgc2VsZWN0cyBib3RoIFBWSFZNDQo+Pj4gYW5kIFBWSD8N
Cj4+IE5vLCBwbGVhc2UgZG9uJ3QgdXNlICJIVk0iIGZvciB0aGF0IHB1cnBvc2UuDQo+Pg0K
Pj4gSWYgYW55dGhpbmcgSSdkIHNldCB0aGUgQ09ORklHX1hFTl9QVkggZGVmYXVsdCB0byB0
aGF0IG9mIENPTkZJR19YRU5fUFZIVk0uDQo+Pg0KPiANCj4gVGhhdCBjb3VsZCB3b3JrLCBi
dXQgdGhhdCB3b3VsZCB0cmFuc2l0aXZlbHkgaW1wbHkgdGhhdCBDT05GSUdfWEVOIG5lZWRz
DQo+IENPTkZJR19QVkgsIHdoaWNoIEkgZ3Vlc3Mgd2UgcHJvYmFibHkgd2FudCB0byBhdm9p
ZC4NCg0KSSBkb24ndCBzZWUgdGhhdCAobmVpdGhlciB0aGUgZGVwZW5kZW5jeSBvZiBDT05G
SUdfWEVOIG9uIENPTkZJR19QVkgsIG5vcg0KdGhhdCBpdCBpcyBhIHByb2JsZW0gdGhhdCBD
T05GSUdfWEVOX1BWSCBkZXBlbmRzIG9uIENPTkZJR19QVkgpLg0KDQo+IEFzIEkgc2FpZCwg
aXQncyBub3QgcmVxdWlyZWQgdG8gYm9vdCB3aXRoICJQVkggZGlyZWN0IGJvb3QiIGZvciBh
ICJQVkgNCj4gZ3Vlc3QgcGVyc29uYWxpdHkiIHRvIHdvcmsgaW4gTGludXggc2luY2UgWzFd
Lg0KDQpQbGVhc2UgYmUgYXdhcmUgdGhhdCB0aGlzIHdhcyBuZWVkZWQgYmFjayB0aGVuIGlu
IG9yZGVyIHRvIGJlIGFibGUgdG8gdXNlDQphIGJvb3QgbG9hZGVyIGZvciBib290aW5nIGFz
IFBWSCBndWVzdC4NCg0KV2l0aCB0aGUgYWRkaXRpb24gb2YgZ3J1Yi14ZW5wdmggKHdoaWNo
IHdhcyBtb3JlIHRoYW4gb25lIHllYXIgbGF0ZXIpIHRoZQ0KcHJlZmVycmVkIHdheSB0byBi
b290IGEgWGVuIFBWSCBndWVzdCB3YXMgdG8gdXNlIHRoYXQgZ3J1YiBmbGF2b3IsIHdoaWNo
DQppcyB1c2luZyB0aGUgUFZIIHNwZWNpZmljIGVudHJ5IHBvaW50IG9mIHRoZSBrZXJuZWwu
IEV2ZW4gbGF0ZXIgcWVtdQ0Kd2FzIGVuaGFuY2VkIHRvIGJvb3QgdGhlIGtlcm5lbCB2aWEg
dGhlIHNhbWUgZW50cnkgcG9pbnQgd2hlbiB1c2luZyBLVk0uDQpUaGF0IHdhcyB0aGUgdGlt
ZSB3aGVuIHRoZSBDT05GSUdfUFZIIGNvZGUgd2FzIGNhcnZlZCBvdXQgZnJvbSB0aGUNCkNP
TkZJR19YRU5fUFZIIGNvZGUuDQoNCj4gV2UgY2FuIGV2ZW50dWFsbHkgY29uc2lkZXIgZGVj
b3VwbGluZyBDT05GSUdfWEVOX1BWSCBhbmQgQ09ORklHX1BWSCwgYnV0DQo+IHRoYXQgd291
bGQgYnJlYWsgc2V0dXAgdGhhdCBleHBlY3RzIHRoYXQgQ09ORklHX1hFTl9QVkggaW1wbGll
cw0KPiBDT05GSUdfUFZIIChhcmNoL3g4Ni9jb25maWdzL3hlbi5jb25maWcgaW4gcGFydGlj
dWxhcikuDQoNCkhpc3RvcmljYWxseSBhbmQgdGVjaG5pY2FsbHkgSSdkIGNvbnNpZGVyIHRo
ZSBDT05GSUdfUFZIIHNwZWNpZmljIHBhcnRzDQphcyBtYW5kYXRvcnkgWGVuIFBWSCBtb2Rl
IGtlcm5lbCBjb2RlLiBOb3QgYmVpbmcgYWJsZSB0byBib290IHZpYSBncnViLXhlbnB2aA0K
d291bGQgYmUgYSBtYWpvciByZWdyZXNzaW9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------jZClsr1CzM0Z048GPlPJhl0W
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------jZClsr1CzM0Z048GPlPJhl0W--

--------------hoFB35ELV9PuN50zNpHBJNHt--

--------------QPptFcXq6v9lbURaP95pBHbq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmdrVMFAwAAAAAACgkQsN6d1ii/Ey8e
jwgAnKiXNyO0f+HwXCvo1GQBfkCxdqn/mSkHyLdj2J41tZRIX4tG281a7HnvM7URnAJOdM/N9UhC
auTd0GYjcG9hDJWabstysrI6yXJoOXAhioi99cMK8EgV1ZIXD5KjZE9KvFHeXbiAO2ZWH8wp6/yz
0cu8ImmDbCnBMbYIgSgt5wKZiRvYR2FuZH+HIBhQsRa7sOkisJEQ8xIoksiml2wLfRacS73Ppis7
6ONm2YuAJOsFIrpjPFNcnVI1HlFGX6Q0ZYE2aeJEhj0tNeIzWttfX7RGI1fdqOJ4xBwVbY78O6VW
7n9CYf1A9O77Dm3rvzmDChoUWdGRW+t/WO5h0GdNpQ==
=1pd4
-----END PGP SIGNATURE-----

--------------QPptFcXq6v9lbURaP95pBHbq--

