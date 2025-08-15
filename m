Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55287B27D45
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083142.1442790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umquX-0004qY-72; Fri, 15 Aug 2025 09:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083142.1442790; Fri, 15 Aug 2025 09:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umquX-0004nS-2h; Fri, 15 Aug 2025 09:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1083142;
 Fri, 15 Aug 2025 09:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VEq/=23=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1umquV-0004nL-76
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:39:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2a7ab9f-79bb-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 11:39:38 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb7abfc5cso315234766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:39:38 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:6400:8c05:37ee:9cf6:6840?
 (p200300e5872d64008c0537ee9cf66840.dip0.t-ipconnect.de.
 [2003:e5:872d:6400:8c05:37ee:9cf6:6840])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdcfcacb7sm102830666b.75.2025.08.15.02.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:39:37 -0700 (PDT)
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
X-Inumbo-ID: c2a7ab9f-79bb-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755250777; x=1755855577; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3g+PQ3xjx9P4EFaRQ0wwl8aRz2l/n5CpGraKYVMVvtg=;
        b=ClKkt1cMgc2WriBT88cIluw36INPrZqQtCto0it6mZ1INm+FzAOs6QKnbh0C9k4JXf
         kq5PqQrlkATeqsuvuehoood4ud/DJqfHXEnq3Vn1GaCSSu5ee8MrLRZbEQTJocehJ3Ep
         p0cbzIplpXMBUOHhVev/HNbe2G3JP/iE3UnZ7KLrfObcIVEgEM+Y4gxQgn7E0qzwzw2h
         u0uqXudJb7+yvHIUljPUNXwH4cUi6KZ8GvGDWKhhpvg3YXRhkNzxsbNID08MT1WOYiQu
         +4uhNHpQINnyPS4kYhqdMv43/mhV+/BSbqX3za3N82dVtwTl3PTpf7eWCwpfrtL7SqYB
         vDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755250777; x=1755855577;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3g+PQ3xjx9P4EFaRQ0wwl8aRz2l/n5CpGraKYVMVvtg=;
        b=bPs4IGulctYGNo+8x5eiI5dlYpLLJKtHCYTHmJEUwY2yAssLhxJNCZUE3KNdl6XOKb
         i9dAd5UKD19cXhrAB4osKLazuy3Eky7xjPpsBEckS9M8vUOj6RzKDkZAwQ2oma//pMbq
         zpm7+COuv9Y110dHJRm/G74YGm8gqxAMsI6lar6d6bGeSj8dL1mA89ttobV0ZiT/Jmpp
         QQQhgkjyx8FNrvfvemYEIdfrAxf/Z8nD0ppgEct5IaLTYpFGeFkaS9LthWxx+W9zIrQK
         PVs+A2IN2bCwfeYj+Y8OM2GbEqkxqh1gubfdQHZSJkp7a8UQJHQ//+IA08uRry12unpp
         VSPw==
X-Forwarded-Encrypted: i=1; AJvYcCUKHDYaTDADrZq6kA0zBKq4R/5NOmyGpHrysjHEdRuy/h0LHfhFelcJE4zFfJ/Qu1ca0H3ckzis/H0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWS/+f4LV8DEh6K0s6LPiyilITL4spC3vlpAVIstBeBIUJnAi/
	D9VOIpiMwmYjgzvB+gW2CxLMwZlgn0HcJuBoCh4YcVcbSMlHQFr0ayVPl3czBlvJVKw=
X-Gm-Gg: ASbGncvbSkMsEqhHO21o2zEeCZKyk46S6OVmNqPVzp8NpqUSK2kmjPi/C3hi1ygUY9Z
	upiw6182HmHs/CewocFzY/hLO3ymUyHXREA1zbMmpp7I1G/ke/9/Dp+rMLRnNtl+jTA/AOXArfi
	FYhHfcD0pUuYTkB4LNDB0EWfX71DirHJby7wDEv2SqEaNSYMnCFfVBWj3pXoUMtztsmCy9Lal2F
	aOWQ+PCac2D7G4KIDoFlsmcsrciZcTEWV7S3Vl8DO5r8+z6Wg/M3YTPY9BDD/EVrSghp26T7w2G
	e8aY6sqAwzZgXKeskV24WoWawFI2qd3tokeNYyhYvBCfygHHZmPmHhOLUaRDqTJLkcpm7+zpnVS
	KRJd5GdVNQAwHlw1baI7vAJ9n7GL/8f2dfTuYP/rp8/J11FVYLdaOC6vsYRst9+IBUP/zTnpQ/M
	G0ki7Qc6NCASlgBBUYiqI30KakiUsZMQhiOnxCwXyfqJLLn2Y=
X-Google-Smtp-Source: AGHT+IEHXHXioE2m6N5dfhq3XxxDP5XEOG6qUvoMnlnSz4ZTvO2zDp7w6xyK4QzGWlTbfjW24XkKOA==
X-Received: by 2002:a17:907:70c:b0:ad5:7bc4:84b5 with SMTP id a640c23a62f3a-afcdc4215c0mr106520366b.57.1755250777520;
        Fri, 15 Aug 2025 02:39:37 -0700 (PDT)
Message-ID: <1e8347ef-3d77-4317-b8af-4f12ad4aa659@suse.com>
Date: Fri, 15 Aug 2025 11:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
 <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
 <795cf4c1-07be-47a5-b807-074b165650c4@suse.com>
 <07c5f672-034a-46f0-a563-081a0d4ad0d5@amd.com>
 <cefc96a0-b095-4bc8-baa6-4d929ffaa1a6@suse.com>
 <a3e9afa2-d60e-4779-8eee-54268d7d833f@amd.com>
 <f35586f8-c80f-4023-a9c0-5107e53c4063@suse.com>
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
In-Reply-To: <f35586f8-c80f-4023-a9c0-5107e53c4063@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OmdcWlgnaXUz88V1U4SxfOdp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OmdcWlgnaXUz88V1U4SxfOdp
Content-Type: multipart/mixed; boundary="------------TTYF5c4pBk6NY170xxnySqxT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <1e8347ef-3d77-4317-b8af-4f12ad4aa659@suse.com>
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
 <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
 <795cf4c1-07be-47a5-b807-074b165650c4@suse.com>
 <07c5f672-034a-46f0-a563-081a0d4ad0d5@amd.com>
 <cefc96a0-b095-4bc8-baa6-4d929ffaa1a6@suse.com>
 <a3e9afa2-d60e-4779-8eee-54268d7d833f@amd.com>
 <f35586f8-c80f-4023-a9c0-5107e53c4063@suse.com>
In-Reply-To: <f35586f8-c80f-4023-a9c0-5107e53c4063@suse.com>
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

--------------TTYF5c4pBk6NY170xxnySqxT
Content-Type: multipart/mixed; boundary="------------yQGfq7og37jqka0bMz8ZZqeA"

--------------yQGfq7og37jqka0bMz8ZZqeA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMDguMjUgMTE6NDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wOC4yMDI1
IDExOjMzLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+PiBPbiA4LzUvMjUgMDU6MTcs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA1LjA4LjIwMjUgMTE6MDYsIFN0ZXdhcnQg
SGlsZGVicmFuZCB3cm90ZToNCj4+Pj4gT24gOC81LzI1IDAzOjQ0LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4+Pj4+IE9uIDA0LjA4LjIwMjUgMTg6NTcsIFN0ZXdhcnQgSGlsZGVicmFuZCB3
cm90ZToNCj4+Pj4+PiBPbiA4LzQvMjUgMDM6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+
Pj4+PiBPbiAwMS4wOC4yMDI1IDIyOjI0LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+
Pj4+Pj4+PiBAQCAtODM5LDYgKzgzOSw5IEBAIHZvaWQgc2NoZWRfZGVzdHJveV92Y3B1KHN0
cnVjdCB2Y3B1ICp2KQ0KPj4+Pj4+Pj4gICB7DQo+Pj4+Pj4+PiAgICAgICBzdHJ1Y3Qgc2No
ZWRfdW5pdCAqdW5pdCA9IHYtPnNjaGVkX3VuaXQ7DQo+Pj4+Pj4+PiAgIA0KPj4+Pj4+Pj4g
KyAgICBpZiAoICF1bml0ICkNCj4+Pj4+Pj4+ICsgICAgICAgIHJldHVybjsNCj4+Pj4+Pj4+
ICsNCj4+Pj4+Pj4+ICAgICAgIGtpbGxfdGltZXIoJnYtPnBlcmlvZGljX3RpbWVyKTsNCj4+
Pj4+Pj4+ICAgICAgIGtpbGxfdGltZXIoJnYtPnNpbmdsZXNob3RfdGltZXIpOw0KPj4+Pj4+
Pj4gICAgICAga2lsbF90aW1lcigmdi0+cG9sbF90aW1lcik7DQo+Pj4+Pj4+DQo+Pj4+Pj4+
IFdoYXQgaWYgaXQncyB0aGUgMm5kIGVycm9yIHBhdGggaW4gc2NoZWRfaW5pdF92Y3B1KCkg
dGhhdCBpcyB0YWtlbj8NCj4+Pj4NCj4+Pj4gXl4gVGhpcyBeXiBpcyB3aGF0IEknbSBjb25m
dXNlZCBhYm91dA0KPj4+DQo+Pj4gSWYgc2NoZWRfaW5pdF92Y3B1KCkgdG9vayB0aGUgaW5k
aWNhdGVkIHBhdGgsDQo+Pg0KPj4gV2hhdCBwYXRoPyBJbiB0aGUgb25lIEknbSBsb29raW5n
IGF0LCBzY2hlZF9mcmVlX3VuaXQoKSBnZXRzIGNhbGxlZCwNCj4gDQo+IE9oLCBJIHNlZSAt
IHRoYXQgd2Fzbid0IHF1aXRlIG9idmlvdXMsIHRob3VnaC4gWWV0IG9mIGNvdXJzZSAuLi4N
Cj4gDQo+PiBzZXR0aW5nIHYtPnNjaGVkX3VuaXQgPSBOVUxMLCBhbmQgaW4gdGhhdCBjYXNl
IC4uLg0KPj4NCj4+PiB0aGUgaWYoKSB5b3UgYWRkIGhlcmUgd29uJ3QNCj4+PiBoZWxwLCBh
bmQgLi4uDQo+Pg0KPj4gLi4uIHRoZSBjb25kaXRpb24gaXMgdHJ1ZSwgYW5kIC4uLg0KPj4N
Cj4+Pj4+Pj4gVGhlbiB3ZQ0KPj4+Pj4+PiBtaWdodCB0YWtlIHRoaXMgcGF0aCAoanVzdCBv
dXQgb2YgY29udGV4dCBoZXJlKQ0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAgIGlmICggdW5pdC0+
dmNwdV9saXN0ID09IHYgKQ0KPj4+Pj4+PiAgICAgIHsNCj4+Pj4+Pj4gICAgICAgICAgcmN1
X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOw0KPj4+Pj4+Pg0KPj4+Pj4+PiAgICAg
ICAgICBzY2hlZF9yZW1vdmVfdW5pdCh2Y3B1X3NjaGVkdWxlcih2KSwgdW5pdCk7DQo+Pj4+
Pj4+ICAgICAgICAgIHNjaGVkX2ZyZWVfdWRhdGEodmNwdV9zY2hlZHVsZXIodiksIHVuaXQt
PnByaXYpOw0KPj4+Pj4+Pg0KPj4+Pj4+PiBhbmQgYXQgbGVhc3QgQ3JlZGl0MSdzIGhvb2sg
ZG9lc24ndCBsb29rIHRvIGJlIHNhZmUgYWdhaW5zdCBiZWluZyBwYXNzZWQgTlVMTC4NCj4+
Pj4+Pj4gKE5vdCB0byBzcGVhayBvZiB0aGUgcmlzayBvZiB1bml0LT5wcml2IGJlaW5nIHVz
ZWQgZWxzZXdoZXJlIHdoaWxlIGNsZWFuaW5nDQo+Pj4+Pj4+IHVwLikNCj4gDQo+IC4uLiB0
aGlzIGxhdHRlciBwYXJ0IG9mIG15IHJlbWFyayBzdGlsbCBhcHBsaWVzLiBJT1cgSSBjb250
aW51ZSB0byB0aGluaw0KPiB0aGF0IGRpc2N1c3NpbmcgdGhlIGNvcnJlY3RuZXNzIG9mIHRo
aXMgY2hhbmdlIG5lZWRzIHRvIGJlIGV4dGVuZGVkLg0KPiBVbmxlc3Mgb2YgY291cnNlIGEg
c2NoZWR1bGVyIG1haW50YWluZXIgd2FudHMgdG8gYWNrIGl0IGFzIGlzLg0KDQpJdCBkb2Vz
bid0IGFwcGx5Lg0KDQp2Y3B1cyBvZiBub3JtYWwgZG9tYWlucyAoaS5lLiBub3QgdGhlIGlk
bGUgZG9tYWluKSBhcmUgY3JlYXRlZCBpbiBzZXF1ZW50aWFsDQpvcmRlci4gSWYgdGhlIDJu
ZCBlcnJvciBwYXRoIG9mIHNjaGVkX2luaXRfdmNwdSgpIGlzIHRha2VuLCB0aGlzIG1lYW5z
IHdlDQphcmUgaGFuZGxpbmcgdGhlIGZpcnN0IHZjcHUgb2YgdGhlIHVuaXQuIEluIHRoaXMg
Y2FzZSBzY2hlZF9mcmVlX3VuaXQoKSB3aWxsDQpmcmVlIHRoZSB1bml0IGl0c2VsZiBjb21w
bGV0ZWx5LCBzbyB0aGUgcGF0aCB5b3UgYXJlIHJlZmVycmluZyB0byBjYW4ndCBiZQ0KcmVh
Y2hlZC4NCg0KSSB0aGluayBvbmx5IEFuZHJldydzIGNvbW1lbnRzIG5lZWQgdG8gYmUgd29y
a2VkIG9uLg0KDQoNCkp1ZXJnZW4NCg==
--------------yQGfq7og37jqka0bMz8ZZqeA
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------yQGfq7og37jqka0bMz8ZZqeA--

--------------TTYF5c4pBk6NY170xxnySqxT--

--------------OmdcWlgnaXUz88V1U4SxfOdp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmifAFgFAwAAAAAACgkQsN6d1ii/Ey+g
AAf9GipFpYDBJpxnoPq+M0VQjsYdNIZjlkQorH/VcFmG9HUHMz6oJ9EoWU08hCEnnfOnvsnee5bS
Aiv1Kp6TadUANISJSVPAjs6PSfVm+y8OyHOBoq8YbhDhJ6ayeul23UvjwqtuBXl9E8eBNAhA5ik5
wX5bSuXtiySPq7PPp6mFaO2McJAqUSsxbqIIFCIg72EowLj9F1sLGaEJHgnJTp82iHCYQQ5Rucy1
o3kQJGBNDedeyf/Db9WUOyR4AqCYeLtWFNNgEEFWs6c54guSGdPThVFKwjw1FWc/kWGhsAYwiasA
3z9TSV9fGz4WwcOenHq7BgiwNsDq/3+M4Diqd0rGhg==
=6ud4
-----END PGP SIGNATURE-----

--------------OmdcWlgnaXUz88V1U4SxfOdp--

