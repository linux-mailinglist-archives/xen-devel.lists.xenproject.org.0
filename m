Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5DC64175
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163718.1490792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyUH-0006Fp-HG; Mon, 17 Nov 2025 12:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163718.1490792; Mon, 17 Nov 2025 12:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyUH-0006Dp-Ek; Mon, 17 Nov 2025 12:37:41 +0000
Received: by outflank-mailman (input) for mailman id 1163718;
 Mon, 17 Nov 2025 12:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vKyUF-0006D9-Tx
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:37:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33487cad-c3b2-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:37:38 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b736cd741c1so456316766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:37:38 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8a86sm1045382666b.52.2025.11.17.04.37.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:37:37 -0800 (PST)
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
X-Inumbo-ID: 33487cad-c3b2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763383057; x=1763987857; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UtWkbel30QNiSJr4HVe3BSLshFWrR0WFjc7KfRRQ4sw=;
        b=WujiQfFPTRErID1f6iBvM4YeKsYL1tHsgAnpA2WqdPHrKk/4wZ55EE7vlBHr+6CnyS
         AzywFRhYnIbBLXd3XkLTIkVb00WbUVwsTbhLbHerwN1PtE2JJR96GRyEn/EQj8dzlIWC
         lo+/picn2UhQOLeubrU1bdB1Q+MCHRjR59l+HzTQJL7MQZ7HnUr+D59nsur/Kvqqxju2
         02uDYw9Toapz0TzjLg5kqueUQcurhDfzHRwOgBdJgIddPnXrumHQEZSJwf+l7QoqzeiG
         gpcnZxjI1MR/qrBhBEOAZSVgZG8n4110CXXrXd284cuc5+kU+A9sxqsOM+JaOLCXxozh
         9NEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383057; x=1763987857;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtWkbel30QNiSJr4HVe3BSLshFWrR0WFjc7KfRRQ4sw=;
        b=W4VyR4sTlNSoWi0PifWiM/r4fPpaGBgChYSVnv54lyruhrTJ4FGubdTXZvJHE/l+Ys
         x83otGzzk+oHn44I7cnvftKArAniYc+iyASfrRyrurQNTpF6qwiuczoOmW0IwT/4cjkj
         MjLEwB9EqGh+kd9jLa6HfYflqLNkHB5hgF+023nQaWiG+4T+LVF9GLhdjiCpTFAPv6RM
         jZxYdazhdslq/3QF7KzL8WDdNo+/K6m5Pxumbl5WgCDc8bKy65DjhS51xflje94z8omn
         FkT80I3nfYrvpAFZ2Hep1QPu/DtnxIOBELDW+cNpS8avGnVgjcIV/0setVs5wiYk1rhw
         fquQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjBz1fYfOPmhd5y/rgJnUjTQtjlQlKlfnaGS8t23JtO1b1pmJt5XfanBjhI5U++29j4Z/JQ8rPSOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6Zt6UrwmsTJupviFsehHcqJxYzMXgi8PpHilIkr24O9c6F5sP
	WW14q9I/CncsKGK21vetz9mvYPXHmRPzZ9hELZpLlMtWTj+pZ2mfsVaVDxeRdZtKoyc=
X-Gm-Gg: ASbGnctUtI7XN/OJ1zTq/d85AdZHHTbXDFQbYC/tfCtD6WGnzwoD84pNcv//aXtHrwy
	RhGbEsF8JNHxOFdnIxIAIyfZ7uz5nQeCv/imYas8aFB6eMaeorLHTSUHhL/jExmvKKdYgll153m
	u6P/+r8AMBZLEgGiXZqKFZmn2e+IKU20Bhf9W+QKOAFUwJcoDhBfoiozneiU77zBBhSTggXJm9U
	bJlcd4Cb21PkZa4LiYH4rAFiTlMZmMRVZi4uU6t9ajYCignsr52WukTqjPseuZ5l6H3rK/FvzST
	sliwRCX8bVSN1v8lBdHAl5B1L7T1IoQ3GuZzE4Je9IslWrSVxU1N5vIszOs0m3nQyXJociQUjah
	k8TyoGwdOonIl5xVgPlhbLuNDcjyWimF9taeZU+IOU9bGrJEtMeGD3GUHu/I2FSEm1Gp4f0IVmn
	9LbELMNb5F0rd5wak9a1rNiVYsBSNR2aQ4LAFGqamrpnGADkfYWIRD+XtgSdOuLZ+DKPG7d4b0c
	zDpmnKWG78gwka9YX48a5/MktHNnn4/a96Jin8=
X-Google-Smtp-Source: AGHT+IHnjIrgpVP6n+OK8TRtx0iQLTiYMOibsslLP6qZVS5M3g+xwpGzA6EAlshAin+4paFanPf+Jg==
X-Received: by 2002:a17:907:749:b0:b72:5a54:1713 with SMTP id a640c23a62f3a-b736796b4b2mr1382879366b.58.1763383057522;
        Mon, 17 Nov 2025 04:37:37 -0800 (PST)
Message-ID: <88e6b9d8-21b6-4b37-97fc-d35b90ed9b49@suse.com>
Date: Mon, 17 Nov 2025 13:37:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
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
In-Reply-To: <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dgvdE5aDDm9XLgC909h2Ph53"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dgvdE5aDDm9XLgC909h2Ph53
Content-Type: multipart/mixed; boundary="------------BeaFg8yRGg6eeami4TVkqeEr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <88e6b9d8-21b6-4b37-97fc-d35b90ed9b49@suse.com>
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
In-Reply-To: <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
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

--------------BeaFg8yRGg6eeami4TVkqeEr
Content-Type: multipart/mixed; boundary="------------tNZYOr2B5lw0BJue1BDXJu8E"

--------------tNZYOr2B5lw0BJue1BDXJu8E
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTEuMjUgMTM6MjQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNC4xMS4yMDI1
IDEzOjU0LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTQuMTEuMjUgMTI6NDIsIEFu
ZHJldyBDb29wZXIgd3JvdGU6DQo+Pj4gT24gMTQvMTEvMjAyNSAxMTozMiBhbSwgSnVlcmdl
biBHcm9zcyB3cm90ZToNCj4+Pj4gZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0NvbmZpZy5t
aw0KPj4+PiBpbmRleCBlMTU1NmRmYmZhLi5kMjFkNjc5NDVhIDEwMDY0NA0KPj4+PiAtLS0g
YS9Db25maWcubWsNCj4+Pj4gKysrIGIvQ29uZmlnLm1rDQo+Pj4+IEBAIC0xNTksNiArMTU5
LDE5IEBAIGRlZmluZSBtb3ZlLWlmLWNoYW5nZWQNCj4+Pj4gICAgCWlmICEgY21wIC1zICQo
MSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEpICQoMik7IGVsc2Ugcm0gLWYgJCgxKTsgZmkNCj4+
Pj4gICAgZW5kZWYNCj4+Pj4gICAgDQo+Pj4+ICtQQVRIX0ZJTEVTIDo9IFBhdGhzDQo+Pj4+
ICtJTkNfRklMRVMgOj0gJChmb3JlYWNoIGYsICQoUEFUSF9GSUxFUyksICQoWEVOX1JPT1Qp
L2NvbmZpZy8kKGYpLm1rKQ0KPj4+PiArDQo+Pj4+ICtpbmNsdWRlICQoSU5DX0ZJTEVTKQ0K
Pj4+PiArDQo+Pj4+ICtCVUlMRF9NQUtFX1ZBUlMgOj0gJChmb3JlYWNoIGYsICQoUEFUSF9G
SUxFUyksICQoc2hlbGwgYXdrICckJDIgPT0gIjo9IiB7IHByaW50ICQkMTsgfScgJChYRU5f
Uk9PVCkvY29uZmlnLyQoZikubWsuaW4pKQ0KPj4+PiArDQo+Pj4+ICsjIFJlcGxhY2UgQHh4
eEAgbWFya2VycyBpbiAkKDEpLmluIHdpdGggJCh4eHgpIHZhcmlhYmxlIGNvbnRlbnRzLCB3
cml0ZSB0byAkKDEpDQo+Pj4+ICtkZWZpbmUgYXBwbHktYnVpbGQtdmFycw0KPj4+PiArICQo
MSk6ICQoMSkuaW4NCj4+Pj4gKwlzZWQgJCQoZm9yZWFjaCB2LCAkJChCVUlMRF9NQUtFX1ZB
UlMpLCAtZSAncyNAJCQodilAIyQkKCQkKHYpKSNnJykgPCQkPCA+JCRADQo+Pj4+ICtlbmRl
Zg0KPj4+DQo+Pj4gU2hvdWxkbid0IHRoaXMgd3JpdGUgdG8gYSB0bXAgZmlsZSwgYW5kIHVz
ZSBtb3ZlLWlmLWNoYW5nZWQ/wqAgTW9zdCBvZg0KPj4+IHRoZSB0aW1lIHRoZSBtYXJrZXJz
IHdvbid0IGhhdmUgY2hhbmdlZCwgYW5kIHdlJ2xsIHdhbnQgdG8gc2hvcnQgY2lyY3VpdA0K
Pj4+IGRlcGVuZGVudCBydWxlcy4NCj4+DQo+PiBJIGNhbiBzZWUgdGhpcyBiZWluZyBhbiBh
ZHZhbnRhZ2Ugd2hlbiBlLmcuIGdlbmVyYXRpbmcgaGVhZGVyIGZpbGVzLCBhcw0KPj4gdGhv
c2UgYmVpbmcgZ2VuZXJhdGVkIGFnYWluIHdvdWxkIHBvdGVudGlhbGx5IGNhdXNlIGxvdHMg
b2YgcmVidWlsZHMuDQo+Pg0KPj4gSW4gdGhpcyBjYXNlIEkgY2FuIGhhcmRseSBzZWUgYW55
IGNhc2Ugd2hlcmUgbWFrZSB3b3VsZG4ndCBkbyB0aGUgcmlnaHQNCj4+IHRoaW5nIGFscmVh
ZHkuIEVpdGhlciB0aGUgKi5pbiBmaWxlIGlzIG5ld2VyIHRoYW4gdGhlIGdlbmVyYXRlZCBm
aWxlIGR1ZQ0KPj4gdG8gYSBnaXQgdXBkYXRlIG9yIGEgbWFudWFsIGVkaXQsIHNvIG1ha2Ug
d2lsbCByZWdlbmVyYXRlIHRoZSB0YXJnZXQgKGFuZA0KPj4gdGhpcyBpcyB3aGF0IHdlIHdh
bnQpLCBvciB0aGUgKi5pbiBmaWxlIGhhc24ndCBjaGFuZ2VkLCBzbyBtYWtlIHdvbid0DQo+
PiByZWdlbmVyYXRlIHRoZSBmaWxlIGFzIGl0IGlzIG5ld2VyIHRoYW4gdGhlICouaW4gZmls
ZSBhbHJlYWR5Lg0KPj4NCj4+IE9yIGRpZCBJIG1pc3Mgc29tZSBhc3BlY3Q/DQo+IA0KPiBB
cmVuJ3Qgc29tZSBvZiB0aGUgZ2VuZXJhdGVkIGZpbGVzIE1ha2VmaWxlIGZyYWdtZW50cz8g
VGhlbSBiZWluZyByZS1nZW5lcmF0ZWQNCg0KTm8uDQoNCk1hbi1wYWdlcywgc2hlbGwgc2Ny
aXB0cyBhbmQgc29tZSBPY2FtbCBmaWxlcyAob25lIGNvbmZpZyBmaWxlIGFuZCBvbmUgLm1s
IGZpbGUsDQp3aGljaCBpcyBzaW1pbGFyIHRvIGFuIGluY2x1ZGUgZmlsZSBJIGJlbGlldmUp
Lg0KDQo+IG1lYW5zIG1ha2UgcmUtaW52b2tpbmcgaXRzZWxmLCB3aGljaCBjb3VsZCBiZSBh
dm9pZGVkIGlmIHRoZSBjb250ZW50cyBkb24ndA0KPiByZWFsbHkgY2hhbmdlLiAoVGhpcyBp
c24ndCBqdXN0IGEgcGVyZm9ybWFuY2UgY29uY2VybjsgdGhpcyByZS1pbnZvY2F0aW9uIGhh
cw0KPiBiZWVuIHRoZSBzb3VyY2Ugb2YsIHdlbGwsIHN1cnByaXNpbmcgYmVoYXZpb3IgaW4g
Y2VydGFpbiBjYXNlcy4pDQoNCkkgc3RpbGwgZG9uJ3Qgc2VlIGEgY2FzZSB3aGVyZSBtYWtl
IHdvdWxkIGNvbnNpZGVyIHJlYnVpbGRpbmcgdGhlIGZpbGUgZnJvbQ0KaXRzIC5pbiBmaWxl
IHdpdGhvdXQgdGhlIC5pbiBmaWxlIGhhdmluZyBjaGFuZ2VkLCB0aHVzIHJlc3VsdGluZyBp
biB0aGUgYnVpbHQNCmZpbGUgdG8gY2hhbmdlLCB0b28uIFdlbGwsIHdpdGggb25lIHByb2Jh
Ymx5IHZlcnkgcmFyZSBleGNlcHRpb246IGluIGNhc2UgYQ0KZGlmZmVyZW50IEBtYXJrZXJA
IGlzIHVzZWQgaW4gdGhlIC5pbiBmaWxlLCBidXQgd2l0aG91dCBjaGFuZ2luZyB0aGUgcmVz
dWx0aW5nDQpmaWxlIGR1ZSB0byBvbGQgYW5kIG5ldyBtYXJrZXIgcmVzdWx0aW5nIGluIHRo
ZSBzYW1lIG91dHB1dC4NCg0KSW4gY2FzZSB3ZSByZWFsbHkgY2FyZSBhYm91dCBzdWNoIGNh
c2VzLCB3ZSBzaG91bGQgdGhpbmsgYWJvdXQgdXNpbmcNCm1vdmUtaWYtY2hhbmdlZCBldmVy
eXdoZXJlLCBhcyBlLmcuIGJ1aWxkaW5nIGEgcHJvZ3JhbSB3aXRoICRIT1NUQ0MgY291bGQN
CnJlc3VsdCBpbiBhbiB1bmNoYW5nZWQgYmluYXJ5IGV2ZW4gd2l0aCBzb3VyY2UgZmlsZXMg
aGF2aW5nIGNoYW5nZWQsIGFuZCB0aGUNCnJlc3VsdGluZyBwcm9ncmFtIGNvdWxkIGJlIHVz
ZWQgdG8gZ2VuZXJhdGUgb3RoZXIgZmlsZXMgLi4uDQoNCg0KSnVlcmdlbg0KDQo=
--------------tNZYOr2B5lw0BJue1BDXJu8E
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tNZYOr2B5lw0BJue1BDXJu8E--

--------------BeaFg8yRGg6eeami4TVkqeEr--

--------------dgvdE5aDDm9XLgC909h2Ph53
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkbFxAFAwAAAAAACgkQsN6d1ii/Ey89
WggAiiEOHzy4/ulQ0rkQDo6Ttqon/FnvhclYCtvJSikZLRVD7tl+8xCwkG+93mFv9c1d69a+9QbT
OeCvvISKT9rx2a7/aNkfX+oTLA/rjOj+RCRWmVru5mklYUkfGNMDbJYH63KWy/jBhqC2YCIyTHQq
f/leixYNUCkC7Xlfxm+9wAmoRDV0+7omSXNFemisNEzxzh6uCFwwDqlLDih6pjjee4xS4if+UUl5
YO8hKWC7iT9C1Ol/FILe4yMkpuE99L7u4S+yzl0HPbw20k4vdW37PSiz6NnoGbr/eQH/YgUhbNvB
K0uwWtWW8vagXmJ12T8al6Qi5dWAPONCtPVoVLeT1g==
=csjU
-----END PGP SIGNATURE-----

--------------dgvdE5aDDm9XLgC909h2Ph53--

