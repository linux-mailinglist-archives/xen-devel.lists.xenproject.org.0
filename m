Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HOEI3otymkA6AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:59:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CD7356CE2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 09:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267281.1556815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Wz-0000Ux-1e; Mon, 30 Mar 2026 07:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267281.1556815; Mon, 30 Mar 2026 07:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Wy-0000Ss-Ty; Mon, 30 Mar 2026 07:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1267281;
 Mon, 30 Mar 2026 07:59:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1w77Wx-0000S0-0x
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 07:59:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w77Wv-00EAm0-RE
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 09:59:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69ca2d5c-e002-0a2a0a5209dd-0a2a45068f32-12
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:59:25 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jgross@suse.com>)
 id 69ca2d5d-3034-0a2a45060019-d155dd2fbca2-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 09:59:25 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-439d8df7620so2923395f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 00:59:25 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e265fsm17812126f8f.1.2026.03.30.00.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 00:59:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1774857565; x=1775462365; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I1/ngx8dqMUrkqXrEfucYH2Pz/hZbbL5OxMBleXDniU=;
        b=URYzYSQNKWTrVpGvHw1d4j+wPeQu7x6FPAVzXlcnazUEGmXKsx3gXKWcfkQDLakvgx
         Xji+3ffMI68UC2z1fzbncMNYFN1hU8EB2/KTDVr752dcdxS4jYQWv4xJXtwEJxvTW3SU
         XrdpAnq+qprq13WMv5CydnWiZnf3vuLhshq62SJqUdrQdN/NdzvySDBgvgyRTdH6VaFd
         /u8v99aB4LrzN5Krz1Je9vdqXrgasVkaBcxwl70YPD63f/9kQDU9LFeeJ9YF/fdCCegq
         1iVUMNn8zhA4a/PKDXA9QEONu05JwQ/NdRbC0tgKlh2e7xfHdlyCOg827FzySfY3vEoh
         JHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857565; x=1775462365;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I1/ngx8dqMUrkqXrEfucYH2Pz/hZbbL5OxMBleXDniU=;
        b=eX+kaytkyQmEOxLPXJfC6FRqD6rF9cAQ8O0Uo/DBpyjuleTkDK0f9TfFvU/PYqLRTP
         3PhAD+i52/htLcmFdBL9PeAlxdtZXHzNm2UL1AiLjzwQV4y37f4fHlrBDktSK5gu4NKT
         XtYwWF+jRqaOoIxlM9EjFoZ+DXVE2FlWYp2ZpMTPYtx1zLurXPdhlfspcLoAAdHbfrL3
         oC136J3GYObeXqURA/6zOf6xnivkdEkkXrq95edTCj+4E46QixIZrFdwaWxRqWe9x+l3
         tgKbw6PuE2ZPytyNP6EQUeR7MjgmwL55sbk6LZPgCAu1oDEdNYekvvEz995ku8WWXwpS
         eiZw==
X-Forwarded-Encrypted: i=1; AJvYcCU+77JvBH3MCxXgFB437o91htPxCqB6pb0wqbb/TddtRsH9zkWcfqHmnffwH1Fv21nrxySmnK+wbxs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCrVNaabrv4xLkiUr3ot77W6X29ZmNnXDcDd0L5TjHKTwstCoy
	mR/HP+7AAdabB/8YzbaSf7viSFtJa/mObDIIxn03rzHn6OC+0WBnyUhyNxd50fu7VPQ=
X-Gm-Gg: ATEYQzztxmUIZe+Fw5p/8BFVHlT63Y8x66C99EUBZViRe1WcF739zl2R2R0/vtuDJ2q
	eNiQ7vu8j/bp3RLXvYAp9EgU0jPcpW59WHdZOmabQPB7yLPxog/yU+s38C+Zb/KGJmv5id5YZGj
	rSxE4wQzIALZD3Kn8cq/bbCzwVoDO3IjLzI/NV/Fzdrkz85mQM0iX+EMgVYHCa3JDTekMscktl2
	X93ogxtYPAUTDN08PWFJ/6rk/BpryaoN7fIt9MyLO12kLgh+mzMbYYDPBHv8vpTbYZRDOfKLcWv
	JwEdnhTeo6lMUUkEeAXSed1MFzjBKZXh6RHRaekvlBC+DytmopGBiuBxbN1AHga5sxBjdndbzkV
	gSttn5uOs/fayOhieeSxsv9nTpIut8Ioo6bT5P29QAsUOD1Cr9iK4QFVbGa+QcAicHo/4qjlsVN
	n2cmqCpxeWyWnU2mg2SBc9r5Wo8AYqSR4pyC/xjgIQkxXmc2JfMQkUN4r8CdAIPTx4cBdkt4Dp0
	ul1sZtw4Ww67ugDtBc3ustWTSnt/jhlzaloYgFALYoEEq89NjmevQDh43bn8Ccy
X-Received: by 2002:a05:6000:26d1:b0:43c:f7e5:817b with SMTP id ffacd0b85a97d-43cf7e58252mr8506607f8f.19.1774857565021;
        Mon, 30 Mar 2026 00:59:25 -0700 (PDT)
Message-ID: <f172ffac-777d-4280-9538-a4d0e20ffc06@suse.com>
Date: Mon, 30 Mar 2026 09:59:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add xenstore quota support
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20260327152103.438997-1-jgross@suse.com>
 <49a3c6fe-db8a-4814-8638-6242dfee495d@citrix.com>
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
In-Reply-To: <49a3c6fe-db8a-4814-8638-6242dfee495d@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hkjoVOealAuyAkD48AKTYQeJ"
X-purgate-ID: tlsNG-16d1c6/1774857565-7A9971C2-75163EC3/0/0
X-purgate-type: clean
X-purgate-size: 7072
X-Spamd-Result: default: False [0.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,keepachangelog.com:url];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_SPAM(0.00)[0.954];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A8CD7356CE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hkjoVOealAuyAkD48AKTYQeJ
Content-Type: multipart/mixed; boundary="------------vfduRjwt3n6nT0VBVOLFDwtX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
Message-ID: <f172ffac-777d-4280-9538-a4d0e20ffc06@suse.com>
Subject: Re: [PATCH] CHANGELOG: add xenstore quota support
References: <20260327152103.438997-1-jgross@suse.com>
 <49a3c6fe-db8a-4814-8638-6242dfee495d@citrix.com>
In-Reply-To: <49a3c6fe-db8a-4814-8638-6242dfee495d@citrix.com>

--------------vfduRjwt3n6nT0VBVOLFDwtX
Content-Type: multipart/mixed; boundary="------------nFEDVdT3MlIeDmZQmf76PBfM"

--------------nFEDVdT3MlIeDmZQmf76PBfM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDMuMjYgMTg6MzksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI3LzAzLzIw
MjYgMzoyMSBwbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IFNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiANCj4+IC0tLQ0KPj4gICBD
SEFOR0VMT0cubWQgfCAyICsrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdFTE9HLm1kDQo+
PiBpbmRleCBjMTkxZTUwNGFiLi41NjZmZTUxMGM1IDEwMDY0NA0KPj4gLS0tIGEvQ0hBTkdF
TE9HLm1kDQo+PiArKysgYi9DSEFOR0VMT0cubWQNCj4+IEBAIC05LDYgKzksOCBAQCBUaGUg
Zm9ybWF0IGlzIGJhc2VkIG9uIFtLZWVwIGEgQ2hhbmdlbG9nXShodHRwczovL2tlZXBhY2hh
bmdlbG9nLmNvbS9lbi8xLjAuMC8pDQo+PiAgICMjIyBDaGFuZ2VkDQo+PiAgIA0KPj4gICAj
IyMgQWRkZWQNCj4+ICsgLSBTdXBwb3J0IG9mIHBlci1kb21haW4gWGVuc3RvcmUgcXVvdGEg
aW4gQyB4ZW5zdG9yZWQgKGluY2x1ZGVzDQo+PiArICAgeGVuc3RvcmUtc3R1YmRvbSksIGxp
YnhsIGFuZCB4bC4NCj4gDQo+IEEgbWlub3IgcG9pbnQsIGJ1dCAiU3VwcG9ydCBmb3IiLCBt
YWlubHkgZm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIHJlc3QNCj4gb2YgdGhlIHNlY3Rpb24u
DQoNCkZpbmUgd2l0aCBtZS4NCg0KQ2FuIHRoaXMgYmUgY2hhbmdlZCB3aGlsZSBjb21taXR0
aW5nLCBvciBkbyB5b3Ugd2FudCBtZSB0byBzZW5kIFYyPw0KDQoNCkp1ZXJnZW4NCg==
--------------nFEDVdT3MlIeDmZQmf76PBfM
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

--------------nFEDVdT3MlIeDmZQmf76PBfM--

--------------vfduRjwt3n6nT0VBVOLFDwtX--

--------------hkjoVOealAuyAkD48AKTYQeJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnKLVwFAwAAAAAACgkQsN6d1ii/Ey//
hAf/V47VUXiq4rkv7aUG71EJyCuJQR0eDeyi8YF4JhUf07hXvP7VcqWYI2dFwpugjO9HurM610nG
EjfRmGiAqEGXgPY1Jt5qA30i5czI/kOxLPO6dZWuZPWCpb9WPbmdQanPT4jAALHwSr07ozpUZp3V
hukVsbLU9AvJlu00KKX71oSvF4bFNGYB8ivnQQFdtxHO7zjM7/tjBPGTxgTHr9d6PQzy3/xwKEl5
R9I2s6KQPwpSv0K+EUAzvn0ZocNvTwn/ECb7zp1y5ypeeOcglD+q/l+PGjKF9JW8fW0L7S9KdSAN
kj4R6Gu3jAQ4fnFtypfZDH4rkK7iVxd7S4VMOoKQLQ==
=WVTX
-----END PGP SIGNATURE-----

--------------hkjoVOealAuyAkD48AKTYQeJ--

