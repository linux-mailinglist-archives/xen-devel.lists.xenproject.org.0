Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14957A9F1B1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 15:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970725.1359337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9OCJ-0000e6-F8; Mon, 28 Apr 2025 13:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970725.1359337; Mon, 28 Apr 2025 13:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9OCJ-0000bc-C4; Mon, 28 Apr 2025 13:06:59 +0000
Received: by outflank-mailman (input) for mailman id 970725;
 Mon, 28 Apr 2025 13:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WylS=XO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u9OCI-0000bW-0C
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 13:06:58 +0000
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [2a00:1450:4864:20::544])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9aff0df-2431-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 15:06:56 +0200 (CEST)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so9101892a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 06:06:56 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecfa33csm615649366b.119.2025.04.28.06.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 06:06:55 -0700 (PDT)
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
X-Inumbo-ID: a9aff0df-2431-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745845616; x=1746450416; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i1otkBvX6s6P7ghiGqSQrQtJoTk6xxrhReO+s5Wi9SI=;
        b=T3On4Nuk7Tis2yRbP2nzwq18asdbcYJcIGrQaZT7wrBP8qAomZB0HlLLnyReLRoNUV
         oLmsovw6sOXdOWWpp1sTgCS5gs+bGXmzVJtWbyaqAKtyIsi6Jaf4a7L4o+/ET5tpC5Et
         PYC8WkMc2wVVhAKz+/czNbmzxpQXFMZujl961LexCqp41tbAxsdNsdcaFdW4BA0fGxtG
         FPVibqJTDUvLTm08QAB+G7chi0Ms8NNzXRmMz9zPYQ6hmZYS7bBR/YnEH+PHdr5DjAx6
         3hgmUFspfiQ6nZgONlcgPKXUhmWxx8W3rcqZCASqg0PrNf1fiNWX0Sao8u1/fVgdkD3Z
         JKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745845616; x=1746450416;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1otkBvX6s6P7ghiGqSQrQtJoTk6xxrhReO+s5Wi9SI=;
        b=Hy3u+EoAgevcz1tMEdw7b5K25TB/++IEoTPzX4ZQVXbThiVa5p/8ROXoyx4G1Dgdr8
         hdkj6dRKconrd5dVqyqX1FD0jfNokA/Sk5HgROHjtE6l4S/Q8qXmQGpOHsAcZYlc6p/e
         GgUHCOvuiteqgcG71i9/UPhvmgbTOMQunCHVKDJWW4+b54C7eKw3iZ7naRTwfGw7eSQd
         IEd8zb7RfpwUlyBnQda13qaOaplNrcZA7ZjQptEPT/TZri1A9CzEcR4af1R/z6K12AJ8
         3uQ15Q3QAbiGqOFN+1B3n+wFo/vrXpkblWY1hfWbo7jG2bEGgP8FgCPtVISo29a6cpYr
         joEw==
X-Gm-Message-State: AOJu0YwvriWBsKrKEqhZt0SWMM7gfQiAbBNpXTHNgQD7fWO5uvM6wFON
	GTY12MW9obX9nTTElkZ3aj2TUgl5rQY6C0HaRkIVp9UzsFlWwV7qHSqqT484mCo=
X-Gm-Gg: ASbGnct8PfVPDg5eIDRzOn2WABNNJE6fMWkvv3TOLlVs32gHL0Hc1pZsO9sPrVdS/L6
	T41AZxulTupR5+eY13QqAvJg1FqrlhkvzoTL580jcrNUsdPt1ff1Sf/L3HVrOwNLSxmaHvINNrY
	iW4gWY+j41UBiF36NleYSlgrWZe/zbsriXSY2bBOVWL20abte9hP2bj+R85J2osyVTy3QZ9I8ul
	E+3PPk6DKE7P8/lYfymwF5q0xMbi0VB1GqKu9Qn4sCEIKCIlN9k9+T/vP97kSCAr6UuPbgXMqPR
	hVde0E2e+Yn1JzKCNl/hcl82lk+OsdAZrhQJAuBsjAzmtM7xh8gCF62YpGJ37znBqjuiXkmZ5fH
	r9Ceg4ww4VRlVzav1lQbRIq9tnxOGxb9ix69kPm7FNnlAQtYOnIiSgaQeANntsEvuyQ==
X-Google-Smtp-Source: AGHT+IFTT5dgJbZEqBH7xmLW4Z9cJRq/4hGEfTJKSFGyQpKj3p0ftX0CXbNv25PheYnIN+CRAx0cTA==
X-Received: by 2002:a17:907:6e90:b0:ac3:bd68:24f0 with SMTP id a640c23a62f3a-ace739dd0a4mr1027802166b.7.1745845616154;
        Mon, 28 Apr 2025 06:06:56 -0700 (PDT)
Message-ID: <18555bd2-393f-4b1d-8e0e-e2b6df17b602@suse.com>
Date: Mon, 28 Apr 2025 15:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] tools: remove qemu-traditional
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-5-jgross@suse.com> <aApOBsLtGWQ0qjK0@l14>
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
In-Reply-To: <aApOBsLtGWQ0qjK0@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xc3tEgFHMVMpv40rU1GWS6MI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xc3tEgFHMVMpv40rU1GWS6MI
Content-Type: multipart/mixed; boundary="------------rrawwUM1obu8TTrdxQ027Rmm";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <18555bd2-393f-4b1d-8e0e-e2b6df17b602@suse.com>
Subject: Re: [PATCH v2 4/6] tools: remove qemu-traditional
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-5-jgross@suse.com> <aApOBsLtGWQ0qjK0@l14>
In-Reply-To: <aApOBsLtGWQ0qjK0@l14>
Autocrypt-Gossip: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJ3BBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AAIQkQoDSui/t3IH4WIQQ+pJkfkcoLMCa4X6CgNK6L+3cgfgn7AJ9DmMd0SMJE
 ePbc7/m22D2v04iu7ACffXTdZQhNl557tJuDXZSBxDmW/tLOwU0EWTecRBAIAIK5OMKMU5R2
 Lk2bbjgX7vyQuCFFyKf9rC/4itNwhYWFSlKzVj3WJBDsoi2KvPm7AI+XB6NIkNAkshL5C0kd
 pcNd5Xo0jRR5/WE/bT7LyrJ0OJWS/qUit5eNNvsO+SxGAk28KRa1ieVLeZi9D03NL0+HIAtZ
 tecfqwgl3Y72UpLUyt+r7LQhcI/XR5IUUaD4C/chB4Vq2QkDKO7Q8+2HJOrFIjiVli4lU+Sf
 OBp64m//Y1xys++Z4ODoKh7tkh5DxiO3QBHG7bHK0CSQsJ6XUvPVYubAuy1XfSDzSeSBl//C
 v78Fclb+gi9GWidSTG/4hsEzd1fY5XwCZG/XJJY9M/sAAwUH/09Ar9W2U1Qm+DwZeP2ii3Ou
 14Z9VlVVPhcEmR/AFykL9dw/OV2O/7cdi52+l00reUu6Nd4Dl8s4f5n8b1YFzmkVVIyhwjvU
 jxtPyUgDOt6DRa+RaDlXZZmxQyWcMv2anAgYWGVszeB8Myzsw8y7xhBEVV1S+1KloCzw4V8Z
 DSJrcsZlyMDoiTb7FyqxwQnM0f6qHxWbmOOnbzJmBqpNpFuDcz/4xNsymJylm6oXiucHQBAP
 Xb/cE1YNHpuaH4SRhIxwQilCYEznWowQphNAbJtEKOmcocY7EbSt8VjXTzmYENkIfkrHRyXQ
 dUm5AoL51XZljkCqNwrADGkTvkwsWSvCSQQYEQIACQUCWTecRAIbDAAKCRCgNK6L+3cgfuef
 AJ9wlZQNQUp0KwEf8Tl37RmcxCL4bQCcC5alCSMzUBJ5DBIcR4BY+CyQFAs=

--------------rrawwUM1obu8TTrdxQ027Rmm
Content-Type: multipart/mixed; boundary="------------ggii0TiHZEEjr6K4rbsm21RX"

--------------ggii0TiHZEEjr6K4rbsm21RX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDQuMjUgMTY6NDMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIEFw
ciAwOCwgMjAyNSBhdCAwMjozNToyMlBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL0lOU1RBTEwgYi9JTlNUQUxMDQo+PiBpbmRleCA4OGMxNDY0ODE2
Li43ODZlM2RhOTk2IDEwMDY0NA0KPj4gLS0tIGEvSU5TVEFMTA0KPj4gKysrIGIvSU5TVEFM
TA0KPiANCj4gVGhlcmUncyBvbmUgIi0tZW5hYmxlLWlvZW11LXN0dWJkb20iIGxlZnQgaW4g
dGhpcyBmaWxlLg0KDQpPaCwgdGhhbmtzIGZvciBub3RpY2luZy4NCg0KPiANCj4+IGRpZmYg
LS1naXQgYS9zdHViZG9tL01ha2VmaWxlIGIvc3R1YmRvbS9NYWtlZmlsZQ0KPj4gaW5kZXgg
NzI0Y2U0MDM2NS4uODJmYzFlOTBmOCAxMDA2NDQNCj4+IC0tLSBhL3N0dWJkb20vTWFrZWZp
bGUNCj4+ICsrKyBiL3N0dWJkb20vTWFrZWZpbGUNCj4+IEBAIC01NDQsMTMgKzQ3OCw2IEBA
IGVsc2UNCj4+ICAgaW5zdGFsbDogJChTVFVCRE9NUEFUSCkNCj4+ICAgZW5kaWYNCj4+ICAg
DQo+PiAtaW5zdGFsbC1pb2VtdTogaW9lbXUtc3R1YmRvbQ0KPj4gLQkkKElOU1RBTExfRElS
KSAiJChERVNURElSKSQoTElCRVhFQ19CSU4pIg0KPj4gLQkkKElOU1RBTExfUFJPRykgc3R1
YmRvbS1kbSAiJChERVNURElSKSQoTElCRVhFQ19CSU4pIg0KPj4gLQkkKElOU1RBTExfREFU
QSkgc3R1YmRvbXBhdGguc2ggIiQoREVTVERJUikkKExJQkVYRUNfQklOKSINCj4gDQo+IElm
IHdlIGRvbid0IGluc3RhbGwgInN0dWJkb21wYXRoLnNoIiwgd2UgZG9uJ3QgbmVlZCB0byBt
YWtlIGl0DQo+IGFueW1vcmUsIHRoYXQgaXMgJChTVFVCRE9NUEFUSCkgcnVsZSBhbmQgYXMg
cHJlcmVxdWlzaXRlIGlzbid0IG5lZWRlZA0KPiBhbnltb3JlLg0KPiANCj4gSSB0aGluayAi
c3R1YmRvbXBhdGguc2giIGlzIG9ubHkgdXNlZCBieSAic3R1YmRvbS1kbSIsIHNvIHdlIGNh
biByZW1vdmUNCj4gYWxsIG1lbnRpb24gb2YgInN0dWJkb21wYXRoLnNoIiBvciAiJChTVFVC
RE9NUEFUSCkiLCBoZXJlIG9yIGluIHRoZSBuZXh0DQo+IHBhdGNoLg0KPiANCj4gQW5kIHdp
dGggJChTVFVCRE9NUEFUSCkgcGF0aCBnb25lLCB0aGlzIHdpbGwgYmUgdGhlIHVzZXIgb2Yg
dGhlIG1ha2UNCj4gbWFjcm8gJChidWlsZG1ha2V2YXJzMmZpbGUpIGFuZCAkKEJVSUxEX01B
S0VfVkFSUyksIHNvIEkgdGhpbmsgdGhlIGNvdWxkDQo+IGJlIGJvdGggcmVtb3ZlZCBhcyB3
ZWxsLg0KDQpXaWxsIGRvIHNvLg0KDQo+IA0KPj4gLQkkKElOU1RBTExfRElSKSAiJChERVNU
RElSKSQoWEVORklSTVdBUkVESVIpIg0KPj4gLQkkKElOU1RBTExfREFUQSkgbWluaS1vcy0k
KFhFTl9UQVJHRVRfQVJDSCktaW9lbXUvbWluaS1vcy5neiAiJChERVNURElSKSQoWEVORklS
TVdBUkVESVIpL2lvZW11LXN0dWJkb20uZ3oiDQo+PiAtDQo+PiAgIGluc3RhbGwtZ3J1Yjog
cHYtZ3J1Yg0KPj4gICAJJChJTlNUQUxMX0RJUikgIiQoREVTVERJUikkKFhFTkZJUk1XQVJF
RElSKSINCj4+ICAgCSQoSU5TVEFMTF9EQVRBKSBtaW5pLW9zLSQoWEVOX1RBUkdFVF9BUkNI
KS1ncnViL21pbmktb3MuZ3ogIiQoREVTVERJUikkKFhFTkZJUk1XQVJFRElSKS9wdi1ncnVi
LSQoWEVOX1RBUkdFVF9BUkNIKS5neiINCj4+IGRpZmYgLS1naXQgYS90b29scy9NYWtlZmls
ZSBiL3Rvb2xzL01ha2VmaWxlDQo+PiBpbmRleCBlOWUxY2RhMzA1Li42ZWNmN2MwZGE4IDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMvTWFrZWZpbGUNCj4+ICsrKyBiL3Rvb2xzL01ha2VmaWxl
DQo+PiBAQCAtMTM2LDU0ICsxMjksNiBAQCBlbmRpZg0KPj4gLQ0KPj4gLXFlbXUtdHJhZGl0
aW9uYWwtcmVjdXJzZSA9IFwNCj4+IC0Jc2V0IC1lOyBcDQo+PiAtCQkkKGJ1aWxkbWFrZXZh
cnMyc2hlbGx2YXJzKTsgXA0KPiANCj4gVGhlc2UgYXJlIHRoZSBsYXN0IG1lbnRpb24gb2Yg
dGhlIG1ha2UgbWFjcm8gJChidWlsZG1ha2V2YXJzMnNoZWxsdmFycyksDQo+IHNvIHdlIGNh
biByZW1vdmUgaXQgZnJvbSBDb25maWcubWsuDQoNCkFncmVlZC4NCg0KDQpKdWVyZ2VuDQo=

--------------ggii0TiHZEEjr6K4rbsm21RX
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ggii0TiHZEEjr6K4rbsm21RX--

--------------rrawwUM1obu8TTrdxQ027Rmm--

--------------xc3tEgFHMVMpv40rU1GWS6MI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgPfW8FAwAAAAAACgkQsN6d1ii/Ey9i
0gf+PhkJ75iiQvPMxMFZhCKwIEzcGY482WJI5gj9PMZBR9qaKQSAIo5S6eAQQ8jS9ebsHY6VcFwu
YTvZqh4Q97ER/YPg68dwnWeZRAifnCEN4ZI4hQ6VVlthieT6sFMpyvK1mCc/aN+dk7xEnLZnGjLZ
+/aqL95oGltxEsI7p76YTVGS9wS8aIk3mDEetjW8AZeJpMXaWEXAtLID/Ux/+WneagCwYzbLDqll
r6MRxLDdxlCVusKh5onoPUNckgr4NzAiJ7nLBmFQjj9rfrTGN1ePxIJG8+mEuvOlHbs9AhTSNcDm
2WlOrI7iicfK/6T4fVjyO165BAGFfs4qVKv98RGbdg==
=3QtO
-----END PGP SIGNATURE-----

--------------xc3tEgFHMVMpv40rU1GWS6MI--

