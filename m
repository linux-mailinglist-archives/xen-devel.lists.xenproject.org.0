Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BDA7349B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 15:38:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929489.1332197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoNg-0002G2-Nj; Thu, 27 Mar 2025 14:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929489.1332197; Thu, 27 Mar 2025 14:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txoNg-0002Dh-Jl; Thu, 27 Mar 2025 14:38:52 +0000
Received: by outflank-mailman (input) for mailman id 929489;
 Thu, 27 Mar 2025 14:38:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zm5l=WO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1txoNf-0001ku-Mm
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 14:38:51 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3336ece6-0b19-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 15:38:51 +0100 (CET)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-5ec9d24acfbso3921253a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 07:38:51 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7192e7d6dsm1111966b.74.2025.03.27.07.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 07:38:50 -0700 (PDT)
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
X-Inumbo-ID: 3336ece6-0b19-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743086330; x=1743691130; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xNwCjykYTgxGGntLE+x1souSdQbrv6a6loMRiMUnCHM=;
        b=bwDbcoiOuKV8b6vUrxo1jsyXmilyjIMGbEyJWzX/dxa+DelS9Ol3WMtnm0RcmmJslY
         ZTvkER7j7OIUzNrTaGsw5NdisC6hehtSYEjP9R+0lvlrC3sl/Lr8KwgSwY53D8Z219HY
         cRqoQizmzni4hrMyRfVWtmuPihZjR+mdc/Zr/ID+ySgK9Xrfo8pY4gZMpzZNHxhfe7rW
         VbHZFzfG/sa6ibDjdAQP4+p/LIbVPdpSjWCQ+vEgcX4vp5ninYmtO0wyeX4+SJIisIFf
         Zqs7OUOmXRkVzqExjDwk9veiExCd6mipxtBbIXn3JLkv1NJ+2dPiFITtLCk25IxZdCdh
         BEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086330; x=1743691130;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNwCjykYTgxGGntLE+x1souSdQbrv6a6loMRiMUnCHM=;
        b=tyL+owye/Q+++x18WZFE5QEnVzLd5oOEvFWU9HhaP9tQEcU1Ltw3A80sEtM9jwThhB
         ynj6h84Zu1XekDpXBmisalGVX0F/ejTa+iDaprnta1HyXfQWuYNO8sBFOzVl8rv4Ooay
         2aTS0y4o3MmiLLMABdmr1iCy6W55noqWvXe0TtDJQo/2MApCBNW27EgBcKqlzs8d+oCc
         0/eJMq8IHtRePN2BTvIeunHBCwyNy85ZFruwZXc/uSW5gBuJMq35YZnh7X/73YCwifBD
         MrxMwHrXAa7s3z2kBvMCqexLP8ExeJfPbTY12TpehDSLOuYCsPEPYM3KSNhBgLeeYWxr
         kehA==
X-Forwarded-Encrypted: i=1; AJvYcCWeGVLaj4VwaJeSsAf+DXcuImaD2m6Wd/knaf12aW1Id66kUAHqKWsxr34PxIBHhUlkUz3rTQHHBtg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+PoDvguOf0x8TpdGz/x6o0itbt+0iE1j+ZHZnZPeT3xVlA/0J
	gInzlbWiordwpSRAygqHkxjUBQAUk4nwYONU+/HAtQRtTpcmUqpWZXf4ecxAM5E=
X-Gm-Gg: ASbGnctAMzdd+MP10qKUfwSss/EPiLJZAAzrcpOvbKsW+nxtMbRFrCHEWruFHDoeOyZ
	zElZjw376Td2nAlFN4ZVtpaAWjU8QUR68bnSGvATjXdwxy9scWxM334NyCT2//9ne1IiuSCy5DU
	MjW4w+tC4kBE/CYuPiSyLEZECorXgs8rxHzOAzQKZTxaF/doSa+v/zzGis8l3eJ89Jf+NG0r5Jh
	HuyQzOtsrPrp9XD/jVcwGkrFLyRakAxVZhAVSR3uRcw+zCSsVvrpm7VKzOCOl0+7lWhdAt+SQRR
	LdA/sWUjzmPJNsK//lKXEiPLoAOiIPd58soL50XmROV80dJI16G+8ooNkAfGIlDg2fr1PUnvima
	um7CjzGv4zpJYZD6a56VfWrppULOvTjnGaxsBxiD3EEv09UKs9myq0ld2nt7TWBSOrdwt1ZYipz
	9sDPyH
X-Google-Smtp-Source: AGHT+IEN3NjQYuocAMHbbwvcCGmGa8xtQ1lMLcUjFfWpz8WhQS+B0/WdvyDtfAZ9wfId32DiI2iIFw==
X-Received: by 2002:a17:907:9721:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ac716bc402dmr50333666b.26.1743086330369;
        Thu, 27 Mar 2025 07:38:50 -0700 (PDT)
Message-ID: <ae5b49ba-efb8-44c4-99ed-624bf007de25@suse.com>
Date: Thu, 27 Mar 2025 15:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] docs: remove qemu-traditional support from
 documentation
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-3-jgross@suse.com>
 <ee9d3fb9-d3b3-49e1-8a2e-83990a3fc7c5@suse.com>
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
In-Reply-To: <ee9d3fb9-d3b3-49e1-8a2e-83990a3fc7c5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xheZBwW0KZ6N80h4i8iQJnAN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xheZBwW0KZ6N80h4i8iQJnAN
Content-Type: multipart/mixed; boundary="------------B86uYWk0kaBTTqUlTFkDSQb8";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <ae5b49ba-efb8-44c4-99ed-624bf007de25@suse.com>
Subject: Re: [PATCH 2/6] docs: remove qemu-traditional support from
 documentation
References: <20250326160442.19706-1-jgross@suse.com>
 <20250326160442.19706-3-jgross@suse.com>
 <ee9d3fb9-d3b3-49e1-8a2e-83990a3fc7c5@suse.com>
In-Reply-To: <ee9d3fb9-d3b3-49e1-8a2e-83990a3fc7c5@suse.com>
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

--------------B86uYWk0kaBTTqUlTFkDSQb8
Content-Type: multipart/mixed; boundary="------------GSS0Wcm0krB1LA3ZlRZrzEtZ"

--------------GSS0Wcm0krB1LA3ZlRZrzEtZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcuMDMuMjUgMDg6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNi4wMy4yMDI1
IDE3OjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQEAgLTE5MDMsMTAgKzE4OTQsNyBA
QCBpdCBtYXkgYmUgdXNlZnVsIHRvIHJlcXVlc3QgYSBkaWZmZXJlbnQgb25lLCBsaWtlIFVF
RkkuDQo+PiAgIA0KPj4gICA9aXRlbSBCPHJvbWJpb3M+DQo+PiAgIA0KPj4gLUxvYWRzIFJP
TUJJT1MsIGEgMTYtYml0IHg4NiBjb21wYXRpYmxlIEJJT1MuIFRoaXMgaXMgdXNlZCBieSBk
ZWZhdWx0DQo+PiAtd2hlbiBCPGRldmljZV9tb2RlbF92ZXJzaW9uPXFlbXUteGVuLXRyYWRp
dGlvbmFsPi4gVGhpcyBpcyB0aGUgb25seSBCSU9TDQo+PiAtb3B0aW9uIHN1cHBvcnRlZCB3
aGVuIEI8ZGV2aWNlX21vZGVsX3ZlcnNpb249cWVtdS14ZW4tdHJhZGl0aW9uYWw+LiBUaGlz
IGlzDQo+PiAtdGhlIEJJT1MgdXNlZCBieSBhbGwgcHJldmlvdXMgWGVuIHZlcnNpb25zLg0K
Pj4gK0xvYWRzIFJPTUJJT1MsIGEgMTYtYml0IHg4NiBjb21wYXRpYmxlIEJJT1MuDQo+IA0K
PiBJcyB0aGlzIGRvYyAoYW5kIHRoZSBvcHRpb24gaXRzZWxmKSBzdGlsbCB1c2VmdWwgd2l0
aG91dCBxZW11dD8gcWVtdXUgZG9lc24ndA0KPiB1c2UgaXQsIEkgZG9uJ3QgdGhpbms/DQo+
IA0KPj4gQEAgLTc0LDcgKzcxLDYgQEAgb3Y9NC4wDQo+PiAgIEVuc3VyZSByZWZlcmVuY2Vz
IHRvIHFlbXUgdHJlZXMgYW5kIE1pbmktT1MgaW4geGVuLmdpdCdzIENvbmZpZy5tayBhcmUg
dXBkYXRlZC4NCj4+ICAgVGhlIHZhcmlhYmxlcyBhbmQgdGhlcmUgY29udGVudCBzaG91bGQg
YmU6DQo+PiAgICAgKiBRRU1VX1VQU1RSRUFNX1JFVklTSU9OOiBxZW11LXhlbi1YLlkuMA0K
Pj4gLSAgKiBRRU1VX1RSQURJVElPTkFMX1JFVklTSU9OOiB4ZW4tWC5ZLjANCj4+ICAgICAq
IE1JTklPU19VUFNUUkVBTV9SRVZJU0lPTjogeGVuLVJFTEVBU0UtWC5ZLjANCj4+ICAgV2hl
cmUgWC5ZIGlzIHRoZSByZWxlYXNlIHZlcnNpb24gKGUuZy4gNC4xNykuDQo+IA0KPiBFc3Bl
Y2lhbGx5IGZvciB0aGlzIHBpZWNlIG9mIGluZm9ybWF0aW9uIEknbSB1bmNvbnZpbmNlZCBp
dCBjYW4gcGxhdXNpYmx5IGJlDQo+IHJlbW92ZWQgYWhlYWQgb2YgcmVtb3ZpbmcgdGhlIHJl
c3BlY3RpdmUgZGF0YSBmcm9tIENvbmZpZy5tay4NCj4gDQo+PiBAQCAtNTgsNyArNTYsNiBA
QCB0PVJFTEVBU0UtJHINCj4+ICAgDQo+PiAgICogY2hhbmdlIHhlbi11bnN0YWJsZSBDb25m
aWcubWsNCj4+ICAgIyAgIFFFTVVfVVBTVFJFQU1fUkVWSVNJT04sDQo+PiAtIyAgIFFFTVVf
VFJBRElUSU9OQUxfUkVWSVNJT04NCj4+ICAgIyAgIE1JTklPU19VUFNUUkVBTV9SRVZJU0lP
Tg0KPj4gICAjICAgICAoZHJvcCBhbnkgcmVmZXJlbmNlcyB0byB0aGUgc3BlY2lmaWMgY29t
bWl0cywgZS5nLiBkYXRlIG9yIHRpdGxlKQ0KPiANCj4gU2FtZSBoZXJlIHRoZW4uDQoNCkkg
Y2FuIG1vdmUgdGhvc2UgMiBjaGFuZ2VzIHRvIHRoZSBwYXRjaCByZW1vdmluZyB0aGUgZGF0
YSBmcm9tIENvbmZpZy5tay4NCg0KDQpKdWVyZ2VuDQo=
--------------GSS0Wcm0krB1LA3ZlRZrzEtZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------GSS0Wcm0krB1LA3ZlRZrzEtZ--

--------------B86uYWk0kaBTTqUlTFkDSQb8--

--------------xheZBwW0KZ6N80h4i8iQJnAN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmflYvkFAwAAAAAACgkQsN6d1ii/Ey/u
SQf/fFeJfaYdsQOP217Phz6c1PviV0bL+Zf363KKQ75Qj1X5KDuz3qnvzogCWZ5X9UbDwUnMDK/f
oCQqDDyEFXS3+oxoLuKwF44YjOKvqTycGr38j7vT11ZM8/f4hkRKQ75F5QZrqeEpXRMWxCRowAg+
oiujYWdEtoNepH8jE1mdPYYSqR084gpSrFxDpz+it6XvzJd7/1meZfOC9YMy4ZikReW2+tMxwujk
YbE5PZ8K/mT31n4ATtyqZBvBXuTCjlqCBmuBSQTk031LEIgKALDBn3DIXOxn9V29XCtDPe4Y/FAO
skqHGoLg+hBeu0XLHO2rFGYOoPxXD9lm1xQj0urAug==
=T+Wz
-----END PGP SIGNATURE-----

--------------xheZBwW0KZ6N80h4i8iQJnAN--

