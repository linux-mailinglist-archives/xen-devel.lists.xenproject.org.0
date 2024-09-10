Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A19737FA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795524.1204916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0L7-0006hM-M2; Tue, 10 Sep 2024 12:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795524.1204916; Tue, 10 Sep 2024 12:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so0L7-0006eo-J6; Tue, 10 Sep 2024 12:51:25 +0000
Received: by outflank-mailman (input) for mailman id 795524;
 Tue, 10 Sep 2024 12:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1so0L5-0006eP-QI
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:51:23 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62013a23-6f73-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 14:51:23 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cb58d810eso13428065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 05:51:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:8741:4a00:60e5:7bee:fc48:e85c?
 (p200300e587414a0060e57beefc48e85c.dip0.t-ipconnect.de.
 [2003:e5:8741:4a00:60e5:7bee:fc48:e85c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42caeb8120asm110481945e9.37.2024.09.10.05.51.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:51:21 -0700 (PDT)
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
X-Inumbo-ID: 62013a23-6f73-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725972682; x=1726577482; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RAeMCKmWvza43Nu71cBoTtzP6tH/bCv86C2jKctL7U8=;
        b=Ad8Wn40Ag3iCnWnY9D6q8xGVyEY73bpmnBDUUUj6zYJOKSx8rhLYJZ8gMw8qqWk1ag
         LDIj8NxM/TrdYt/bo9oG3jY2AHqwN+n5ToftE1oUlBpiQP9ganK+VyK7capp6HopT6b4
         hZQNm0WaEPmGCHuOPtjcL7P5uoVG0LAC0tUVoC7MCtMiRbDn0AEtLM9yReb95V9qckxe
         JlCdUvjTVGFNrCkN4pceJjHpPVssj8JsoCTmQF7bwT9QErZBxyCo6ZtLpr0QF9J4o6de
         O2Ar/g4bvFXo5tsecyo3Vu10MLJWRByJVMA2iv74cc3/p6ziXxfwGMLIbtl8yF+K38yu
         u5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972682; x=1726577482;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAeMCKmWvza43Nu71cBoTtzP6tH/bCv86C2jKctL7U8=;
        b=Hzd9h2qzhYg/GGMVJS0nfzurkjijZDdnPA6sC5KPnORzA5cruHpaaszVRVYiM7euAW
         cjGasLOktX1SoFLjWDo9qpJ/CwZF75Jn0dLvRNSdp8Ux+jkuDBuk3iWydZETKPPnn3Dh
         XaKjXQOsvdU+1PMfmapWcfpXE2tX0uNZkmH36s7Ur0gyGtD0OKlKyZMUVYoJHSPlo8q1
         AnJKIRrHbFdZ0PNHGWAJN7SsddiM7mkcALQn+JNvnYP3CeT76sLMED4qwDFwO9igkByD
         S3Y1gdlJW6nN9Lh+QegRpNp0S0WItH+bkqsmuupMqb13RV68FxxLuZO222AxRlRzua3N
         qtZA==
X-Forwarded-Encrypted: i=1; AJvYcCUQO4i9dzPpPSWWUUXluzXh0FtHQotV3ItPDm3JSDRcD/tzso92+TMyi1v8QDlqsj5BM0NPY4dR/EA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyA+0YW9eovjph2QInltknaj92/Z3XGFpsrZ+ONl5sM1egYwibe
	B1/sMbIEwlp8pNVKjl2uit3iohcFWchUQDMzLZQGDheAcxumZ9IJxDd5tNuvAhc=
X-Google-Smtp-Source: AGHT+IE2bu1PEM3oINJPnUVRif7L3mk3Ym1xRASor35sxzraH/Vf6vcgza0+vyhGIw9CdV6get3sUA==
X-Received: by 2002:a05:600c:1caa:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-42cbde09a29mr19714235e9.17.1725972681420;
        Tue, 10 Sep 2024 05:51:21 -0700 (PDT)
Message-ID: <7ce2eaaf-27a7-47a6-bf33-87176cd9cb26@suse.com>
Date: Tue, 10 Sep 2024 14:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen: add capability to remap non-RAM pages to
 different PFNs
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20240910103932.7634-1-jgross@suse.com>
 <20240910103932.7634-6-jgross@suse.com>
 <0c4f3e87-b138-407b-a271-7f86fef255f6@suse.com>
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
In-Reply-To: <0c4f3e87-b138-407b-a271-7f86fef255f6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZokzG9C9TZobncaej7XamCWz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZokzG9C9TZobncaej7XamCWz
Content-Type: multipart/mixed; boundary="------------0iyyNybbmClI80Z25k0YA0hR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
Message-ID: <7ce2eaaf-27a7-47a6-bf33-87176cd9cb26@suse.com>
Subject: Re: [PATCH v3 5/7] xen: add capability to remap non-RAM pages to
 different PFNs
References: <20240910103932.7634-1-jgross@suse.com>
 <20240910103932.7634-6-jgross@suse.com>
 <0c4f3e87-b138-407b-a271-7f86fef255f6@suse.com>
In-Reply-To: <0c4f3e87-b138-407b-a271-7f86fef255f6@suse.com>
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

--------------0iyyNybbmClI80Z25k0YA0hR
Content-Type: multipart/mixed; boundary="------------NABlShubVjh8h9p4iADsy1lm"

--------------NABlShubVjh8h9p4iADsy1lm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDkuMjQgMTQ6MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wOS4yMDI0
IDEyOjM5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBydW5uaW5nIGFzIGEgWGVu
IFBWIGRvbTAgaXQgY2FuIGhhcHBlbiB0aGF0IHRoZSBrZXJuZWwgaXMgYmVpbmcNCj4+IGxv
YWRlZCB0byBhIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgY29uZmxpY3Rpbmcgd2l0aCB0aGUg
aG9zdCBtZW1vcnkNCj4+IG1hcC4NCj4+DQo+PiBJbiBvcmRlciB0byBiZSBhYmxlIHRvIHJl
c29sdmUgdGhpcyBjb25mbGljdCwgYWRkIHRoZSBjYXBhYmlsaXR5IHRvDQo+PiByZW1hcCBu
b24tUkFNIGFyZWFzIHRvIGRpZmZlcmVudCBndWVzdCBQRk5zLiBBIGZ1bmN0aW9uIHRvIHVz
ZSB0aGlzDQo+PiByZW1hcHBpbmcgaW5mb3JtYXRpb24gZm9yIG90aGVyIHB1cnBvc2VzIHRo
YW4gZG9pbmcgdGhlIHJlbWFwIHdpbGwgYmUNCj4+IGFkZGVkIHdoZW4gbmVlZGVkLg0KPj4N
Cj4+IEFzIHRoZSBudW1iZXIgb2YgY29uZmxpY3RzIHNob3VsZCBiZSByYXRoZXIgbG93IChj
dXJyZW50bHkgb25seQ0KPj4gbWFjaGluZXMgd2l0aCBtYXguIDEgY29uZmxpY3QgYXJlIGtu
b3duKSwgc2F2ZSB0aGUgcmVtYXAgZGF0YSBpbiBhDQo+PiBzbWFsbCBzdGF0aWNhbGx5IGFs
bG9jYXRlZCBhcnJheS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiB3aXRoIHR3byBjb3NtZXRpYyByZW1hcmtzOg0KPiANCj4+IEBA
IC03OTIsNiArNzkzLDcwIEBAIGludCBjbGVhcl9mb3JlaWduX3AybV9tYXBwaW5nKHN0cnVj
dCBnbnR0YWJfdW5tYXBfZ3JhbnRfcmVmICp1bm1hcF9vcHMsDQo+PiAgIAlyZXR1cm4gcmV0
Ow0KPj4gICB9DQo+PiAgIA0KPj4gKy8qIFJlbWFwcGVkIG5vbi1SQU0gYXJlYXMgKi8NCj4+
ICsjZGVmaW5lIE5SX05PTlJBTV9SRU1BUCA0DQo+PiArc3RhdGljIHN0cnVjdCBub25yYW1f
cmVtYXAgew0KPj4gKwlwaHlzX2FkZHJfdCBtYWRkcjsNCj4+ICsJcGh5c19hZGRyX3QgcGFk
ZHI7DQo+PiArCXNpemVfdCBzaXplOw0KPj4gK30geGVuX25vbnJhbV9yZW1hcFtOUl9OT05S
QU1fUkVNQVBdIF9fcm9fYWZ0ZXJfaW5pdDsNCj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IG5y
X25vbnJhbV9yZW1hcCBfX3JvX2FmdGVyX2luaXQ7DQo+IA0KPiBJIHRha2UgaXQgdGhpcyBp
cyB0aGUgY2Fub25pY2FsIHBsYWNlbWVudCBvZiBzZWN0aW9uIGF0dHJpYnV0ZXMgaW4gdGhl
DQo+IGtlcm5lbD8gKEluIFhlbiBJJ2QgYXNrIGZvciB0aGUgYXR0cmlidXRlcyB0byBiZSBt
b3ZlZCBhaGVhZCBvZiB0aGUNCj4gaWRlbnRpZmllcnMgYmVpbmcgZGVjbGFyZWQuKQ0KDQpJ
IGRpZG4ndCBmaW5kIGFuIGV4cGxpY2l0IG1lbnRpb25pbmcgaW4gdGhlIGNvZGluZyBzdHls
ZSwgYnV0IG1vc3QNCmV4YW1wbGVzIEkndmUgZm91bmQgcGxhY2UgdGhlIHNlY3Rpb24gYXR0
cmlidXRlIGFmdGVyIHRoZSBuYW1lIG9mIHRoZQ0KdmFyaWFibGUuDQoNCj4gDQo+PiArLyoN
Cj4+ICsgKiBEbyB0aGUgcmVhbCByZW1hcHBpbmcgb2Ygbm9uLVJBTSByZWdpb25zIGFzIHNw
ZWNpZmllZCBpbiB0aGUNCj4+ICsgKiB4ZW5fbm9ucmFtX3JlbWFwW10gYXJyYXkuDQo+PiAr
ICogSW4gY2FzZSBvZiBhbiBlcnJvciBqdXN0IGNyYXNoIHRoZSBzeXN0ZW0uDQo+PiArICov
DQo+PiArdm9pZCBfX2luaXQgeGVuX2RvX3JlbWFwX25vbnJhbSh2b2lkKQ0KPj4gK3sNCj4+
ICsJdW5zaWduZWQgaW50IGk7DQo+PiArCXVuc2lnbmVkIGludCByZW1hcHBlZCA9IDA7DQo+
PiArCWNvbnN0IHN0cnVjdCBub25yYW1fcmVtYXAgKnJlbWFwID0geGVuX25vbnJhbV9yZW1h
cDsNCj4+ICsJdW5zaWduZWQgbG9uZyBwZm4sIG1mbiwgZW5kX3BmbjsNCj4+ICsNCj4+ICsJ
Zm9yIChpID0gMDsgaSA8IG5yX25vbnJhbV9yZW1hcDsgaSsrKSB7DQo+PiArCQllbmRfcGZu
ID0gUEZOX1VQKHJlbWFwLT5wYWRkciArIHJlbWFwLT5zaXplKTsNCj4+ICsJCXBmbiA9IFBG
Tl9ET1dOKHJlbWFwLT5wYWRkcik7DQo+PiArCQltZm4gPSBQRk5fRE9XTihyZW1hcC0+bWFk
ZHIpOw0KPj4gKwkJd2hpbGUgKHBmbiA8IGVuZF9wZm4pIHsNCj4+ICsJCQlpZiAoIXNldF9w
aHlzX3RvX21hY2hpbmUocGZuLCBtZm4pKSB7DQo+PiArCQkJCXByX2VycigiRmFpbGVkIHRv
IHNldCBwMm0gbWFwcGluZyBmb3IgcGZuPSVseCBtZm49JWx4XG4iLA0KPj4gKwkJCQkgICAg
ICAgcGZuLCBtZm4pOw0KPj4gKwkJCQlCVUcoKTsNCj4gDQo+IFdvdWxkbid0IHBhbmljKCkg
Z2V0IHlvdSBib3RoIGluIG9uZSBvcGVyYXRpb24/IE9yIGRvIHlvdSBleHBlY3QgdGhlIGNh
bGwNCj4gdHJhY2UgLyByZWdpc3RlciBzdGF0ZSB0byBiZSBvZiBpbW1lZGlhdGUgcmVsZXZh
bmNlIGZvciBhbmFseXNpcz8NCg0KWW91IGFyZSByaWdodCwgaW4gdGhpcyBjYXNlIHBhbmlj
KCkgaXMgYSBiZXR0ZXIgb3B0aW9uLg0KDQoNCkp1ZXJnZW4NCg0K
--------------NABlShubVjh8h9p4iADsy1lm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------NABlShubVjh8h9p4iADsy1lm--

--------------0iyyNybbmClI80Z25k0YA0hR--

--------------ZokzG9C9TZobncaej7XamCWz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmbgQMgFAwAAAAAACgkQsN6d1ii/Ey88
SQf/XuVSJ3h8eaS9lG4QOl0mBxECsL/Su7aPf9Eq/Bqtxp+hzkl33voFyRTAZp4Lb1PXgW65rAPq
zZtMq5gwzi6H+nChWhcNfu66UtO8biYmGY2ydp3Pn1AYXiQcuPrHhYLmo1vzBKyiQtaJQ6P/chal
JuEizGEBhZ4Vu3qlKhMXM4FacbJI6zs+YrzvuSvA/OoPDQL01jBAfAD2s3YfJQmJ0DuaUxGx7KBm
Lm32wMy8fdRYefvrufiYgzpECI9N4JxOlBo07VNJI0VAu5AzGj2fQp2aSRP8tjg7G7DSjRNTy6bf
zrIR7IJz/ZW7eX+lyWcZ8rOPsiphANew2LBdmfoJWw==
=CirT
-----END PGP SIGNATURE-----

--------------ZokzG9C9TZobncaej7XamCWz--

