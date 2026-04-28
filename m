Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIfdIOe48GlQXwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:40:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD45A486141
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 15:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296253.1572667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHigA-0002g9-63; Tue, 28 Apr 2026 13:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296253.1572667; Tue, 28 Apr 2026 13:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHigA-0002em-32; Tue, 28 Apr 2026 13:40:46 +0000
Received: by outflank-mailman (input) for mailman id 1296253;
 Tue, 28 Apr 2026 13:40:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wHig8-0002eR-6y
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 13:40:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHig7-0029hq-FS
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:40:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69f0b8da-e002-0a2a0a5209dd-0a2a450ca2aa-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:40:43 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69f0b8db-62f1-0a2a450c0019-d155da36f163-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 15:40:43 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-baebe98afa0so544473466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 06:40:43 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb80902237csm107953566b.24.2026.04.28.06.40.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 06:40:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777383643; x=1777988443; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=luRDwW2Zwb/Bu53pmvZgCW0/AZzttxtReBGHLPDEqOI=;
        b=ZiNm+stoqZDzBgp+GVEUSOzCUjWs/hu2KYsaDqH6CeDE9CZjk65zA4prbK9W0bOg7Z
         Dk5VlTiaRSKe7kcPPMI4UZI8I2abwFSFJnpGd59RZxybZJ9gU/Pbzj2Ag0wX0L0m6paI
         vvlU22or0q5IyEs20K1r0EdRSc7lJM20w2PZFJ1/X6MNdMeuObM/PFwp4H6+x+YE4dUU
         toyD0rNxFiVjs5pW0DWwV3Rr+5jl61mRTykdse1hbt6v5NLdpmIWed3TnpMTFRXUUXYD
         vmGyyEGiYMJTaMTr409qaEPk1G5Ufv8py8CvEezs95JAuP2b4YjSPQ05Ky0ljRUz3sL7
         x+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383643; x=1777988443;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luRDwW2Zwb/Bu53pmvZgCW0/AZzttxtReBGHLPDEqOI=;
        b=lL2gF83UMOgn0KgCA+NFObTDk4uklpgjA3jLrgSkq8h44Hn5uOqaAPwnAEPnTEt9F5
         A5owVbfgy4vOZitPHG0Y+hlezKPwacbCAoKQNJYhG6RHmUKHVOg/Q80szgdKwxIpQRHL
         E4KAMQDSgmEULhj/dE/dd95wVaMbJwIhIn0DMxPW4gfKLr9Zw0hV00uilZ4YSZ7Pq3WJ
         O7oFLDiN/8EbjgK+1GQiiLT6/UeM5Iqo9d6L34m14W+/IwTgnEIHEiUQnjcPUfyWVXk4
         9orreY6Xj0xURkWJFqbS9ygSWy0j5tkd8nrTtsGQQstmy4mBnAi7NOn6CAx5lP6Ytyt4
         H2rA==
X-Forwarded-Encrypted: i=1; AFNElJ/BBdrDcDgsHQGoqoE3qN1JJwIlOCy/G5Rst0E4at8Qam32HkVBjFuNvF0fTnwvHHbN5QPCnrfd0zY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF9Qm+gvywAe0VuwGAPH+U+BHHFuN5HfhAI1YyZcouTgd9p6Rz
	KGTyKq2t+rZYwsQidWUOW6VK31HeKtyCVfkTdD+KnWcqlYVslBwpCiDoySeMXfDSW4uEz4oHE0F
	bVP3mctk=
X-Gm-Gg: AeBDietS7V3wco3wzWSvqVm3b30Ezzz61X39aGI/fkA6WZSf1NPFWBdcAdw0QEzxOEb
	/k8Ix35Uua+Nk6ysj+eLYWjkKoPnOBmEl3Cga2EHr9N8f+Id39JhopavcfCX/KBSv3n+nHD72kz
	fXMQx+1XOyaoK/dd6zVmTeFAKq9HO6h0BOJysYWom4Ua4q1qqNcgBmOO5yuwDlM3mpJ/w97OUZw
	TE7UpiLCKC8o8OB+mxq8Go6UTRTwLYlaKgz0b3Wf3Os6cGMxFQpQOzfmrwWVT3A9CnEMHvwNXCT
	kefIX0OJ93U/kpQ4OkVfZFn9MpYNAIv1lw8eJKPTen0NIB/e6jh+hlV3J7584ZJBB174A6aD4r2
	5zKPzHZyLTYscPzUhen8/jjtUMA8IhK1kfgFxrqn8XmoUCuGb/RzXAatYqp1EtaMkSlUzc3UbkC
	7oMi53lGYYsi5EEOG/q3lTAsawCtKMkH7QnDCO1drVQvXxwOgTOtSTqG3ajj+XEyahVPJeB3sOv
	rvzFbMt8fbFjnGFRBl7lBfgjlRtcaAv6LunG5Wwy0bZn+i0n3TDVOOX8onxrUIG
X-Received: by 2002:a17:906:6a1e:b0:bb6:4c2f:92d1 with SMTP id a640c23a62f3a-bb804834131mr198160666b.40.1777383639151;
        Tue, 28 Apr 2026 06:40:39 -0700 (PDT)
Message-ID: <a42d9ca5-9a6d-4e73-b771-6fd5a6267529@suse.com>
Date: Tue, 28 Apr 2026 15:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tools/xenstored: remove permissions related to dead
 domain
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-5-jgross@suse.com>
 <9624178e-7596-4395-adca-7cedc58aafb9@amd.com>
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
In-Reply-To: <9624178e-7596-4395-adca-7cedc58aafb9@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o3th2mmBF3o0jHFKSsKL0dsb"
X-purgate-ID: tlsNG-d25034/1777383643-F600DCF5-97D3AD07/0/0
X-purgate-type: clean
X-purgate-size: 7417
X-Rspamd-Queue-Id: CD45A486141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.42 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.67)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,m:julien@xen.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------o3th2mmBF3o0jHFKSsKL0dsb
Content-Type: multipart/mixed; boundary="------------R68zS0tOhHWv5jKo8JTl5mSa";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: dmukhin@ford.com, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <a42d9ca5-9a6d-4e73-b771-6fd5a6267529@suse.com>
Subject: Re: [PATCH 4/4] tools/xenstored: remove permissions related to dead
 domain
References: <20260423080840.530547-1-jgross@suse.com>
 <20260423080840.530547-5-jgross@suse.com>
 <9624178e-7596-4395-adca-7cedc58aafb9@amd.com>
In-Reply-To: <9624178e-7596-4395-adca-7cedc58aafb9@amd.com>

--------------R68zS0tOhHWv5jKo8JTl5mSa
Content-Type: multipart/mixed; boundary="------------0QiMXP0u0Wz6SCifY0nBIxoz"

--------------0QiMXP0u0Wz6SCifY0nBIxoz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDQuMjYgMDA6MTQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDQt
MjMgMDQ6MDgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBXaXQgdW5wcml2aWxlZ2VkIGRv
bWFpbnMgbm93IGNhcGFibGUgdG8gdXNlIHRoZSBAcmVsZWFzZURvbWFpbiB3YXRjaCwNCj4g
DQo+IHMvV2l0L1dpdGgvDQo+IA0KPj4gdGhlcmUgaXMgbm8gcmVhc29uIG5vdCB0byByZW1v
dmUgYW55IG5vZGUgcGVybWlzc2lvbnMgd2hpY2ggcmVsYXRlIHRvDQo+PiBhIGRvbWFpbiB3
aGljaCBoYXMgYmVlbiByZW1vdmVkLg0KPj4NCj4+IFRoaXMgcmVzb2x2ZXMgYSBjb21wbGV4
IHNjZW5hcmlvIHdoZXJlIGEgbmV3IGRvbWFpbiBjb3VsZCBpbmhlcml0IHRoZQ0KPj4gcGVy
bWlzc2lvbnMgb2YgYW4gb2xkIG9uZSB3aXRoIHRoZSBzYW1lIGRvbWlkLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+PiAt
wqDCoMKgIHJldHVybiBkb21haW4tPmFjY192YWxbQUNDX05PREVTXSA/IHJldCA6IFdBTEtf
VFJFRV9TVUNDRVNTX1NUT1A7DQo+PiArwqDCoMKgIGlmIChub2RlLT5wZXJtc1swXS5pZCA9
PSBkb21haW4tPmRvbWlkKSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgZG9tYWluX25iZW50cnlf
ZGVjKE5VTEwsIGRvbWFpbi0+ZG9taWQpOw0KPj4gK8KgwqDCoMKgwqDCoMKgIG5vZGUtPnBl
cm1zWzBdLmlkID0gcHJpdl9kb21pZDsNCj4+ICvCoMKgwqDCoMKgwqDCoCBub2RlLT5hY2Mu
bWVtb3J5ID0gMDsNCj4+ICvCoMKgwqDCoMKgwqDCoCBkb21haW5fbmJlbnRyeV9pbmMoTlVM
TCwgcHJpdl9kb21pZCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgdHJhY2UoIm1vdmluZyBvcnBo
YW5lZCBub2RlICVzIHRvIGRvbTBcbiIsIG5vZGUtPm5hbWUpOw0KPiANCj4gU2luY2UgeW91
IGFyZSB0b3VjaGluZyB0aGlzLCBtYXliZSBzL2RvbTAvZG9tJXUvIGFuZCBwcml2X2RvbWlk
Pw0KDQpHb29kIGlkZWEuDQoNCj4gDQo+IFJldmlld2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxq
YXNvbi5hbmRyeXVrQGFtZC5jb20+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------0QiMXP0u0Wz6SCifY0nBIxoz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------0QiMXP0u0Wz6SCifY0nBIxoz--

--------------R68zS0tOhHWv5jKo8JTl5mSa--

--------------o3th2mmBF3o0jHFKSsKL0dsb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnwuNYFAwAAAAAACgkQsN6d1ii/Ey9W
hQf/dhEZMQin+AdYKn6jDrtmdjJHh34s+rn3pgDsv/WRhJAIIGvnQqegZHPmjDYxLE1owPdHo6ty
7L7ju9ZoaLaqXkJnUKB4l0ltlbfVwgdRQrSVYyBXE3YikTXpQpDGKOB4eLsvSdliADJnVPzbiLuV
kpPGAshlM7mcGcBQMQI4dN4mDZnko3kZkljCxHmpaeggk8Txq/BrbU3/J+kIeJ6lf9NLLwOJEQaJ
sQck+M7I7KjxX4Pd98DY5qdBU1GV+MLzUnApOiPEkVeOyCftzzTrFizaugz8EzwYdrVfrZounbIa
nBcP6q+sHqlOcsEtEDfrpWj8BIo4+pQ3ZCrq9GAdeQ==
=mXDK
-----END PGP SIGNATURE-----

--------------o3th2mmBF3o0jHFKSsKL0dsb--

