Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CABE997C84
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 07:39:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815441.1229197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sylte-0002DV-2u; Thu, 10 Oct 2024 05:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815441.1229197; Thu, 10 Oct 2024 05:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sylte-0002BS-01; Thu, 10 Oct 2024 05:39:34 +0000
Received: by outflank-mailman (input) for mailman id 815441;
 Thu, 10 Oct 2024 05:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1syltc-0002BM-Km
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 05:39:32 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05725658-86ca-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 07:39:31 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-37d447de11dso293724f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 22:39:31 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:8700:db3b:60ed:e8b9:cd28?
 (p200300e587148700db3b60ede8b9cd28.dip0.t-ipconnect.de.
 [2003:e5:8714:8700:db3b:60ed:e8b9:cd28])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-430ccf45e3bsm37520755e9.15.2024.10.09.22.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 22:39:29 -0700 (PDT)
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
X-Inumbo-ID: 05725658-86ca-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728538770; x=1729143570; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v7LdSdTfuBQVcEfnUv9Wb9m0zO/UjBPCYRw0/7NNE2c=;
        b=IFJHA031upUDZSgObN2Y5kEc5jTvyMNsnfiFlisIOiRgBaS5U4LDucCwQIMyYZk/po
         Z22n1NNXcDJddUkIJHOTnZqyYAMC7M+sQmViE3Z6lCatq7Rx+qqZGxtDzb6R87/KmBdE
         NV7hv+jQduxknsp7r3QEq8kJ+O+juDgsZB1RMJ5/VjtIk08IpJ/2MwSZO/4Oy3pSG8V8
         F1sVNd3Py42v9E1rREJgmzHT92FrkXP429dKcmS9LVNcEtQlHjLy0zbTM9F/sFjlUFLk
         9z53wfkPy7s/x/Z7Iym+Ud6YLfv4N1CyoxFEerVCIN/kVGc77CT5h3iNZGQpT7X5a04j
         lXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728538770; x=1729143570;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7LdSdTfuBQVcEfnUv9Wb9m0zO/UjBPCYRw0/7NNE2c=;
        b=Rs7nEow7X4SV7pa/h3TcFv0WHR83xsRsUTIP+d8quw7byaZIWkYAABEpV6G+ToV/my
         K9vNyYuV+sqswDztmZCwVkoxeyEFG6mY1XncCsCQJgeQ9u78ze+Ol3xe5M+o2mHFA+XF
         D+13EJbwN/e/S5FO0CbH7GJtL+u5AkOsOA39FfIxxUPQLJg34/kE7LkaFl/ZJh955b8I
         x9T7/KDmCVUat1gUtAIcQC4XBfaD9CsT5uueaFGHlOwreYFSkmBZ12aExFYmD+HZ3/MR
         N0ocBwLFRnnITyAyrHIaX0+yGfdRNy3H3ne5062ioXqfrisDBUr2uxlckPFY8LuFxToY
         hqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEJHaTYZbyQIf0pqNjOqjHkTAD08RDqdCGAKKYOgyQ20pLla32aq69S44xAlSiIsm7Gz+MASIsp1Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu5QnO0xTt2KRP1Y6XfNiwHS45Y6kMZh07rREKkQI7LPVSViYW
	pURQDV5HXBAgdODMjeDsHs7h377nOPX4hbiucsDhvP1K4VIurZXEnvqOzIPpBTE=
X-Google-Smtp-Source: AGHT+IFZQQa5Iu7PrlyVFYMYQEPyrY4vINFpziRY58A0az7R9K6pffepPefKiCUmi53tZHqw3yVNxg==
X-Received: by 2002:a05:6000:e81:b0:37c:c4d3:b9ba with SMTP id ffacd0b85a97d-37d3a9b8d60mr3327855f8f.12.1728538769943;
        Wed, 09 Oct 2024 22:39:29 -0700 (PDT)
Message-ID: <8bfaa6cc-2cf1-48e4-828b-e4d356f0b3fc@suse.com>
Date: Thu, 10 Oct 2024 07:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Remove config dependency in XEN_PRIVCMD definition
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <20241009062014.407310-1-Jiqian.Chen@amd.com>
 <73174eb0-380d-4f95-a2c3-097b86fac8db@suse.com>
 <alpine.DEB.2.22.394.2410091539260.471028@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2410091539260.471028@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kCnudpVj5QLHGd2zxbJWtYri"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kCnudpVj5QLHGd2zxbJWtYri
Content-Type: multipart/mixed; boundary="------------u0hfL5lBoxeauLJAZd7Xgs4x";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
Message-ID: <8bfaa6cc-2cf1-48e4-828b-e4d356f0b3fc@suse.com>
Subject: Re: [PATCH] xen: Remove config dependency in XEN_PRIVCMD definition
References: <20241009062014.407310-1-Jiqian.Chen@amd.com>
 <73174eb0-380d-4f95-a2c3-097b86fac8db@suse.com>
 <alpine.DEB.2.22.394.2410091539260.471028@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2410091539260.471028@ubuntu-linux-20-04-desktop>
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

--------------u0hfL5lBoxeauLJAZd7Xgs4x
Content-Type: multipart/mixed; boundary="------------W1wbDms6j7JY06GoHtrL0XU1"

--------------W1wbDms6j7JY06GoHtrL0XU1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTAuMjQgMDA6NDYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gV2Vk
LCA5IE9jdCAyMDI0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA5LjEwLjIwMjQgMDg6
MjAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+IENvbW1pdCAyZmFlNmJiN2JlMzIgKCJ4ZW4v
cHJpdmNtZDogQWRkIG5ldyBzeXNjYWxsIHRvIGdldCBnc2kgZnJvbSBkZXYiKQ0KPj4+IGFk
ZHMgYSB3ZWFrIHJldmVyc2UgZGVwZW5kZW5jeSB0byB0aGUgY29uZmlnIFhFTl9QUklWQ01E
IGRlZmluaXRpb24sIGl0cw0KPj4+IHB1cnBvc2UgaXMgdG8gcGFzcyB0aGUgY29tYmluYXRp
b24gb2YgY29tcGlsYXRpb24gdGhhdCBDT05GSUdfWEVOX1BSSVZDTUQ9eQ0KPj4+IGFuZCBD
T05GSUdfWEVOX1BDSURFVl9CQUNLRU5EPW0sIGJlY2F1c2UgaW4gdGhhdCBjb21iaW5hdGlv
biwgeGVuLXBjaWJhY2sNCj4+PiBpcyBjb21waWxlZCBhcyBhIG1vZHVsZSBidXQgeGVuLXBy
aXZjbWQgaXMgYnVpbHQtaW4sIHNvIHhlbi1wcml2Y21kIGNhbid0DQo+Pj4gZmluZCB0aGUg
aW1wbGVtZW50YXRpb24gb2YgcGNpc3R1Yl9nZXRfZ3NpX2Zyb21fc2JkZi4NCj4+Pg0KPj4+
IEJ1dCB0aGF0IGRlcGVuZGVuY3kgY2F1c2VzIHhlbi1wcml2Y21kIGNhbid0IGJlIGxvYWRl
ZCBvbiBkb21VLCBiZWNhdXNlDQo+Pj4gZGVwZW5kZW50IHhlbi1wY2liYWNrIGlzIGFsd2F5
cyBub3QgYmUgbG9hZGVkIHN1Y2Nlc3NmdWxseSBvbiBkb21VLg0KPj4+DQo+Pj4gVG8gc29s
dmUgYWJvdmUgcHJvYmxlbSBhbmQgY292ZXIgb3JpZ2luYWwgY29tbWl0J3MgcmVxdWlyZW1l
bnQsIGp1c3QgcmVtb3ZlDQo+Pj4gdGhhdCBkZXBlbmRlbmN5LCBiZWNhdXNlIHRoZSBjb2Rl
ICJJU19SRUFDSEFCTEUoQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCkiDQo+Pj4gb2Ygb3Jp
Z2luYWwgY29tbWl0IGlzIGVub3VnaCB0byBtZWV0IHRoZSByZXF1aXJlbWVudC4NCj4+Pg0K
Pj4+IEZpeGVzOiAyZmFlNmJiN2JlMzIgKCJ4ZW4vcHJpdmNtZDogQWRkIG5ldyBzeXNjYWxs
IHRvIGdldCBnc2kgZnJvbSBkZXYiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPj4NCj4+IFRoaXMgbGFja3MgYSBSZXBvcnRlZC1i
eTouDQo+Pg0KPj4+IC0tLSBhL2RyaXZlcnMveGVuL0tjb25maWcNCj4+PiArKysgYi9kcml2
ZXJzL3hlbi9LY29uZmlnDQo+Pj4gQEAgLTI2MSw3ICsyNjEsNiBAQCBjb25maWcgWEVOX1ND
U0lfQkFDS0VORA0KPj4+ICAgY29uZmlnIFhFTl9QUklWQ01EDQo+Pj4gICAJdHJpc3RhdGUg
IlhlbiBoeXBlcmNhbGwgcGFzc3Rocm91Z2ggZHJpdmVyIg0KPj4+ICAgCWRlcGVuZHMgb24g
WEVODQo+Pj4gLQlpbXBseSBYRU5fUENJREVWX0JBQ0tFTkQNCj4+PiAgIAlkZWZhdWx0IG0N
Cj4+PiAgIAloZWxwDQo+Pj4gICAJICBUaGUgaHlwZXJjYWxsIHBhc3N0aHJvdWdoIGRyaXZl
ciBhbGxvd3MgcHJpdmlsZWdlZCB1c2VyIHByb2dyYW1zIHRvDQo+Pg0KPj4gVGhlIHJlcG9y
dCB3YXNuJ3QgYWJvdXQgYSBidWlsZCBwcm9ibGVtLCBidXQgYSBydW50aW1lIG9uZS4gUmVt
b3ZpbmcgdGhlDQo+PiBkZXBlbmRlbmN5IGhlcmUgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcg
aW4gdGhlIGRlcGVuZGVuY3kgb2YgeGVuLXByaXZjbWQNCj4+IG9uIHhlbi1wY2liYWNrLCBh
cyB0aGUgdXNlIG9mIHBjaXN0dWJfZ2V0X2dzaV9mcm9tX3NiZGYoKSBjb250aW51ZXMgdG8N
Cj4+IGV4aXN0Lg0KPj4NCj4+IENvbnNpZGVyIHRoZSBjYXNlIG9mIFhFTl9QQ0lERVZfQkFD
S0VORD1tIGFuZCBYRU5fUFJJVkNNRD1tLCB3aGljaA0KPj4gSSBndWVzcyBpcyB3aGF0IE1h
cmVrIGlzIHVzaW5nIGluIGhpcyBjb25maWcuIEJvdGggZHJpdmVycyBhcmUgYXZhaWxhYmxl
DQo+PiBpbiBzdWNoIGEgY29uZmlndXJhdGlvbiwgeWV0IGxvYWRpbmcgb2YgeGVuLXByaXZj
bWQgdGhlbiByZXF1aXJlcyB0bw0KPj4gbG9hZCB4ZW4tcGNpYmFjayBmaXJzdC4gQW5kIHRo
YXQgbGF0dGVyIGxvYWQgYXR0ZW1wdCB3aWxsIGZhaWwgaW4gYSBEb21VLg0KPj4gVGhlIHR3
byBkcml2ZXJzIHNpbXBseSBtYXkgbm90IGhhdmUgYW55IGRlcGVuZGVuY3kgaW4gZWl0aGVy
IGRpcmVjdGlvbi4NCj4gDQo+IFRoZSBpZGVhIGlzIHRoYXQgdGhlcmUgc2hvdWxkIGJlIG5v
IGhhcmQgZGVwZW5kZW5jeSBvbg0KPiBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmKCkuIElm
IGl0IGlzIGF2YWlsYWJsZSwgdGhlIHNlcnZpY2Ugd2lsbCBiZQ0KPiB1c2VkLCBvdGhlcndp
c2UgYW4gZXJyb3Igd2lsbCBiZSByZXBvcnRlZC4NCj4gDQo+IFRoZSBwcm9ibGVtIGlzIHRo
YXQgSVNfUkVBQ0hBQkxFIGlzIGEgY29tcGlsZS10aW1lIGNoZWNrLiBXaGF0IHdlIG5lZWQN
Cj4gaXMgYSBydW50aW1lIGNoZWNrIGluc3RlYWQuIE1heWJlIHN5bWJvbF9nZXQgb3IgdHJ5
X21vZHVsZV9nZXQgPw0KDQpUaGlzIGlzIGEgcmF0aGVyIGNsdW1zeSBzb2x1dGlvbiBJTU8u
DQoNCkknbSBzZWVpbmcgdGhlIGZvbGxvd2luZyBzb2x1dGlvbnM6DQoNCjEuIERvbid0IGZh
aWwgdG8gdG8gbG9hZCB0aGUgcGNpYmFjayBkcml2ZXIgaW4gYSBEb21VLCBidXQgb25seSBk
aXNhYmxlDQogICAgYW55IGZ1bmN0aW9uYWxpdHkuDQoNCjIuIE1vdmUgdGhlIGRyaXZlcnMv
eGVuL3hlbi1wY2liYWNrL3BjaV9zdHViLmMgZnVuY3Rpb25hbGl0eSBpbiBhIG1vZHVsZQ0K
ICAgIG9mIGl0cyBvd24sIGFsbG93aW5nIHRoZSBwcml2Y21kIGRyaXZlciB0byBiZSBsb2Fk
ZWQgd2l0aG91dCBuZWVkaW5nDQogICAgdGhlIHJlc3Qgb2YgcGNpYmFjay4NCg0KMy4gQWRk
IGEgaG9vayB0byBlLmcuIGRyaXZlcnMveGVuL3BjaS5jIGluc3RlYWQgZm9yIGNhbGxpbmcg
b2YNCiAgICBwY2lzdHViX2dldF9nc2lfZnJvbV9zYmRmKCkgZGlyZWN0bHkuIHBjaWJhY2sg
Y291bGQgcmVnaXN0ZXIgdGhlIHJlYWwNCiAgICBjYWxsIGFkZHJlc3MuIElmIHBjaWJhY2sg
aXNuJ3QgbG9hZGVkLCB0aGUgaG9vayBjYW4gcmV0dXJuIGFuIGVycm9yLg0KICAgIFRoaXMg
d291bGQgcmVtb3ZlIHRoZSBleHBsaWNpdCBkZXBlbmRlbmN5IG9mIHByaXZjbWQgb24gcGNp
YmFjay4NCg0KSSdkIHByZWZlciB0aGUgM3JkIHZhcmlhbnQuDQoNCg0KSnVlcmdlbg0KDQo=

--------------W1wbDms6j7JY06GoHtrL0XU1
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------W1wbDms6j7JY06GoHtrL0XU1--

--------------u0hfL5lBoxeauLJAZd7Xgs4x--

--------------kCnudpVj5QLHGd2zxbJWtYri
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmcHaJAFAwAAAAAACgkQsN6d1ii/Ey8o
NQf+Jk8xKYaRguEDNlCuIjv39oEKU0REmjs0qRKASL3RuVQ1ig43umiLw8oYi7po1ukho2LkCF9y
mVnqBnc0DrmM/eJe5fKASD0L5Y5vtawztqzS016pb1HJioQm4XyBL//d5q8VBp2iNR2ARv2c7n4m
Jb7QItc4ggbEIBoGMC59QVtZpYRs577PeEloUhLaKxB8rPUAsFYVjiKgqKY8Su3PoM+7RwbiWOdY
ds9zTVe+2ztVC3mClkvg2iCbmXSXdu6fJwbv7iG/a7pxEjqNqKjKgYtcZ51nDFUEXINMoahNHCnz
MCcsZKVzncANAy0XuqjXmlNxBQv1+sUx1mOqpYy1zw==
=SZ9F
-----END PGP SIGNATURE-----

--------------kCnudpVj5QLHGd2zxbJWtYri--

