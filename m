Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA4BA9F160
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 14:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970680.1359306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9NwS-0005WQ-IG; Mon, 28 Apr 2025 12:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970680.1359306; Mon, 28 Apr 2025 12:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9NwS-0005Tz-En; Mon, 28 Apr 2025 12:50:36 +0000
Received: by outflank-mailman (input) for mailman id 970680;
 Mon, 28 Apr 2025 12:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WylS=XO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u9NwR-0005Tp-4H
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 12:50:35 +0000
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [2a00:1450:4864:20::544])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fdacaaf-242f-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 14:50:34 +0200 (CEST)
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-5e5cded3e2eso7280399a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 05:50:34 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef?
 (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de.
 [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edb1580sm629590766b.175.2025.04.28.05.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 05:50:33 -0700 (PDT)
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
X-Inumbo-ID: 5fdacaaf-242f-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745844633; x=1746449433; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ipd2QVSUL3iE7j/leKmDmpOS3TiZmbagecg2Ot21l1M=;
        b=TQ0j8wbIZPTwfPBJXoxAs3bgaGFOwNjxkrgCzxfsYqFQrqmU9DAclv7NRTs7j7IAJu
         43Yh5+yPXcrVi+dy7KK2yUZ2OovAInPUhUMW3XZ5G/3tp2b+HmmkNvkJXVgqYhUcZI5b
         rbF0Q9MWKqi9y4AYFubMTLek5xokep2/qRlXnGEttXkFEnGHcqxkkqR0KItWmdtzcOaT
         1cGZqiBDrU+4stlcDoPTagdntCzevtJOyzkZufN6vlbkGYYS39qPDrvWp03doEzVdiV3
         T7whJi7kmwFOGAUXYkdzVra2P/G4w16z5mR7TlJKr1jSlirXQLtflXSJ56Yeo/Fpuuuj
         JJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844633; x=1746449433;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ipd2QVSUL3iE7j/leKmDmpOS3TiZmbagecg2Ot21l1M=;
        b=kHBotuo3u7rFcKP25yiOtO2NaZgpVGAnokgHBRRtFeoMJSgLAW1+aQX3Z4ZzrPhWN+
         U2PXheb6CBgJWsraH9iFzmp7Xlqkq8akDK+s5/8XeObBjzPGX0jPE/eqV7w8Rbzjijak
         i2i00rIwYuk2PU9tkiHnfhQ0Gp2wqCT6JBaQH2HE021sIyPg/6j9hmhyNggBCrbmlTRV
         cmlXWo/YAlGKy45nPmafWNzY+Pl3sTcjBWx/tOTg807lUYwtXUNwwEHaegyfftnMuJDk
         wsQp2cY7opIJqwSY0TPntvGBHvuyrxuotmRQZ35PYOYRs7ljt4p2lgoBHfUf/AOxbo0Y
         rY8A==
X-Gm-Message-State: AOJu0YxVlkvWrO9LnevnNE1gzuOieMR/qzpYO7DzMoNM4DNpUpstVhJW
	Zs66WETbdoPtlM1+xbA7W7+gh4tcYM6MJT1m4636OKnO0Z/Vx+NrSXbE7Um6MNU=
X-Gm-Gg: ASbGnctcFtXzCsSO+rpi4euk3KK32qH8HNDQtlSiDso7wKiJFOrAcy+AITx7wBjEHvg
	2Je68cEi/Kh6E92MwwSuJXi51DGLI+et+w3QGQ8tXQAb7ywuqdjhKmrVBnWav4oLOQD3fwqXpok
	LhyF8nMiLU/fB/pOm22tg3L9TDBw4/738E0NMIaCe109l+q7YQCfxfYSFtVmvj1NrHre2zkxGTx
	jnEg54vdtdiIjjhZI8ibgIgMwJflGVLoSyrDWDtTtiCcGgOa5VgcJuSR/kyWYCQvoXnC5Hy4zrb
	znHAjESnUJD/lhKL0iJ+VuL7nqMXbvQ25W0EzsUhRbINldWKuM8m0Cd5wxMhsej+yEHY2WDjYUO
	wxuWq3vIZF6Eb+x0xa6hDFiSe1aFZoiUr3+yytLWFt7Hyiv5lAa9CWxM2Tn0GtQ2mhg==
X-Google-Smtp-Source: AGHT+IGSZX97CGZlVE1t/NJ3ip31dgQNdK432mmun6cZ3exO2Edb9nEq8Hk7NN1nHg4SdYmg6KhyKg==
X-Received: by 2002:a17:906:d54a:b0:ac8:179a:42f5 with SMTP id a640c23a62f3a-ace7108a276mr1169116766b.14.1745844633329;
        Mon, 28 Apr 2025 05:50:33 -0700 (PDT)
Message-ID: <70667513-4035-4fb1-aca3-4c7017bbfa72@suse.com>
Date: Mon, 28 Apr 2025 14:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
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
In-Reply-To: <aAoHOrcZ5LlhEObL@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oHFKOKzTnd4Acmx1NPfpkuDQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oHFKOKzTnd4Acmx1NPfpkuDQ
Content-Type: multipart/mixed; boundary="------------PQLNfs0wUZBwXS9igmNOilke";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <70667513-4035-4fb1-aca3-4c7017bbfa72@suse.com>
Subject: Re: [PATCH v2 2/6] docs: remove qemu-traditional support from
 documentation
References: <20250408123526.14613-1-jgross@suse.com>
 <20250408123526.14613-3-jgross@suse.com> <aAoHOrcZ5LlhEObL@l14>
In-Reply-To: <aAoHOrcZ5LlhEObL@l14>
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

--------------PQLNfs0wUZBwXS9igmNOilke
Content-Type: multipart/mixed; boundary="------------2p6zo03RuHEnk6Zz9viN9wx3"

--------------2p6zo03RuHEnk6Zz9viN9wx3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDQuMjUgMTE6NDEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIEFw
ciAwOCwgMjAyNSBhdCAwMjozNToyMFBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiBiL2RvY3MvbWFuL3hs
LmNmZy41LnBvZC5pbg0KPj4gaW5kZXggNzMzOWM0NGVmZC4uY2NmMGM1ODg5NSAxMDA2NDQN
Cj4+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbg0KPj4gKysrIGIvZG9jcy9tYW4v
eGwuY2ZnLjUucG9kLmluDQo+PiBAQCAtODk1LDEyICs4OTUsNiBAQCBpcyB1c2VkLg0KPj4g
ICBTcGVjaWZpZXMgdGhlIHBhdGggdG8gdGhlIFggYXV0aG9yaXR5IGZpbGUgdGhhdCBzaG91
bGQgYmUgdXNlZCB0bw0KPj4gICBjb25uZWN0IHRvIHRoZSBYIHNlcnZlciB3aGVuIHRoZSBC
PHNkbD4gb3B0aW9uIGlzIHVzZWQuDQo+PiAgIA0KPj4gLT1pdGVtIEI8b3BlbmdsPUJPT0xF
QU4+DQo+IA0KPiBUaGlzIGBvcGVuZ2xgIHN1Yi1vcHRpb24gaXMgYWxzbyBtZW50aW9uIGFi
b3ZlLCBmb3IgdGhlIGB2ZmJgIG9wdGlvbi4NCg0KUmlnaHQsIEknbGwgZHJvcCB0aGlzIHJl
ZmVyZW5jZS4NCg0KPiANCj4+IC0NCj4+IC1FbmFibGUgT3BlbkdMIGFjY2VsZXJhdGlvbiBv
ZiB0aGUgU0RMIGRpc3BsYXkuIE9ubHkgZWZmZWN0cyBtYWNoaW5lcw0KPj4gLXVzaW5nIEI8
ZGV2aWNlX21vZGVsX3ZlcnNpb249InFlbXUteGVuLXRyYWRpdGlvbmFsIj4gYW5kIG9ubHkg
aWYgdGhlDQo+PiAtZGV2aWNlLW1vZGVsIHdhcyBjb21waWxlZCB3aXRoIE9wZW5HTCBzdXBw
b3J0LiBUaGUgZGVmYXVsdCBpcyAwIChkaXNhYmxlZCkuDQo+PiAtDQo+PiAgID1pdGVtIEI8
a2V5bWFwPUxBTkc+DQo+PiAgIA0KPj4gICBDb25maWd1cmUgdGhlIGtleW1hcCB0byB1c2Ug
Zm9yIHRoZSBrZXlib2FyZCBhc3NvY2lhdGVkIHdpdGggdGhpcw0KPj4gQEAgLTEyMTUsMTcg
KzEyMDksMTQgQEAgd29ya2luZyBncmFwaGljcyBwYXNzdGhyb3VnaC4gU2VlIHRoZSBYZW5W
R0FQYXNzdGhyb3VnaFRlc3RlZEFkYXB0ZXJzDQo+PiAgIEw8aHR0cHM6Ly93aWtpLnhlbnBy
b2plY3Qub3JnL3dpa2kvWGVuVkdBUGFzc3Rocm91Z2hUZXN0ZWRBZGFwdGVycz4gd2lraSBw
YWdlDQo+PiAgIGZvciBncmFwaGljcyBjYXJkcyBjdXJyZW50bHkgc3VwcG9ydGVkIGJ5IEI8
Z2Z4X3Bhc3N0aHJ1Pi4NCj4+ICAgDQo+PiAtQjxnZnhfcGFzc3RocnU+IGlzIGN1cnJlbnRs
eSBzdXBwb3J0ZWQgYm90aCB3aXRoIHRoZSBxZW11LXhlbi10cmFkaXRpb25hbA0KPj4gLWRl
dmljZS1tb2RlbCBhbmQgdXBzdHJlYW0gcWVtdS14ZW4gZGV2aWNlLW1vZGVsLg0KPj4gK0I8
Z2Z4X3Bhc3N0aHJ1PiBpcyBjdXJyZW50bHkgc3VwcG9ydGVkIHdpdGggdGhlIHVwc3RyZWFt
IHFlbXUteGVuIGRldmljZS1tb2RlbC4NCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkg
dGhpcyBpcyB3cml0dGVuIGluIHRoZSBkb2MgOi0oLCB3aGVyZSBpcyBpdCBub3QNCj4gc3Vw
cG9ydGVkPyBQcmV2aW91cyByZXZpc2lvbiBoYWQ6ICJvbmx5IHN1cHBvcnRlZCBvbiBxZW11
LXRyYWQsIG5vDQo+IHN1cHBvcnQgZm9yIHFlbXUteGVuIiB3aGljaCB3YXMgdXNlZnVsIGlu
Zm9ybWF0aW9uLCBhbmQgd2FzIGNoYW5nZWQNCj4gbGF0ZXIgd2hlbiBxZW11LXhlbiBnYWlu
IHN1cHBvcnQuIEkgd291bGQgcmVtb3ZlIHRoZSBzZW50ZW5jZS4NCg0KQWdyZWVkLg0KDQo+
IA0KPj4gICBXaGVuIGdpdmVuIGFzIGEgYm9vbGVhbiB0aGUgQjxnZnhfcGFzc3RocnU+IG9w
dGlvbiBlaXRoZXIgZGlzYWJsZXMgZ3JhcGhpY3MNCj4+ICAgY2FyZCBwYXNzdGhyb3VnaCBv
ciBlbmFibGVzIGF1dG9kZXRlY3Rpb24uDQo+PiAgIA0KPj4gICBXaGVuIGdpdmVuIGFzIGEg
c3RyaW5nIHRoZSBCPGdmeF9wYXNzdGhydT4gb3B0aW9uIGRlc2NyaWJlcyB0aGUgdHlwZQ0K
Pj4gICBvZiBkZXZpY2UgdG8gZW5hYmxlLiBOb3RlIHRoYXQgdGhpcyBiZWhhdmlvciBpcyBv
bmx5IHN1cHBvcnRlZCB3aXRoIHRoZQ0KPj4gLXVwc3RyZWFtIHFlbXUteGVuIGRldmljZS1t
b2RlbC4gV2l0aCBxZW11LXhlbi10cmFkaXRpb25hbCBJR0QgKEludGVsIEdyYXBoaWNzDQo+
PiAtRGV2aWNlKSBpcyBhbHdheXMgYXNzdW1lZCBhbmQgb3B0aW9ucyBvdGhlciB0aGFuIGF1
dG9kZXRlY3Qgb3IgZXhwbGljaXQgSUdEDQo+PiAtd2lsbCByZXN1bHQgaW4gYW4gZXJyb3Iu
DQo+PiArdXBzdHJlYW0gcWVtdS14ZW4gZGV2aWNlLW1vZGVsLg0KPiANCj4gSGVyZSwgd2Ug
Y2FuIHJlbW92ZSB0aGUgIk5vdGUgdGhhdCB0aGlzIGJlaGF2aW9yIGlzIG9ubHkgc3VwcG9y
dGVkIHdpdGgNCj4gcWVtdS14ZW4gZG0iLCB0aGlzIGlzIHRoZSBvbmx5IGRldmljZSBtb2Rl
bCBzdXBwb3J0ZWQgc28gSSBob3BlIHRoZQ0KPiBiZWhhdmlvciBpcyBzdXBwb3J0ZWQgaW4g
dGhpcyBjYXNlLi4uDQoNClllcy4NCg0KPiANCj4+ICAgDQo+PiAgIEN1cnJlbnRseSwgdmFs
aWQgdmFsdWVzIGZvciB0aGUgb3B0aW9uIGFyZToNCj4+ICAgDQo+PiBAQCAtMTkwMywxMCAr
MTg5NCw3IEBAIGl0IG1heSBiZSB1c2VmdWwgdG8gcmVxdWVzdCBhIGRpZmZlcmVudCBvbmUs
IGxpa2UgVUVGSS4NCj4+ICAgDQo+PiAgID1pdGVtIEI8cm9tYmlvcz4NCj4+ICAgDQo+PiAt
TG9hZHMgUk9NQklPUywgYSAxNi1iaXQgeDg2IGNvbXBhdGlibGUgQklPUy4gVGhpcyBpcyB1
c2VkIGJ5IGRlZmF1bHQNCj4+IC13aGVuIEI8ZGV2aWNlX21vZGVsX3ZlcnNpb249cWVtdS14
ZW4tdHJhZGl0aW9uYWw+LiBUaGlzIGlzIHRoZSBvbmx5IEJJT1MNCj4+IC1vcHRpb24gc3Vw
cG9ydGVkIHdoZW4gQjxkZXZpY2VfbW9kZWxfdmVyc2lvbj1xZW11LXhlbi10cmFkaXRpb25h
bD4uIFRoaXMgaXMNCj4+IC10aGUgQklPUyB1c2VkIGJ5IGFsbCBwcmV2aW91cyBYZW4gdmVy
c2lvbnMuDQo+PiArTG9hZHMgUk9NQklPUywgYSAxNi1iaXQgeDg2IGNvbXBhdGlibGUgQklP
Uy4NCj4gDQo+IFRoaXMgb3B0aW9uIGlzIG5vdCB2YWxpZCBhbnltb3JlLCBsaWJ4bCB3aWxs
IGNvbXBsYWluIHdpdGg6DQo+ICAgICAgInFlbXUteGVuIGRvZXMgbm90IHN1cHBvcnQgYmlv
cz1yb21iaW9zLiINCj4gDQo+IEFuZCBJIGhhdmUgbm8gaWRlYSBpZiBpdCBjYW4gd29yayBv
biBub3QsIEkganVzdCBrbm93IHRoYXQgWGVuU2VydmVyDQo+IHN0aWxsIHVzZSBSb21CSU9T
IHdpdGggYSBwYXRjaGVkIFFFTVUuDQoNCkkgZXhwbGljaXRseSBkaWRuJ3QgcmVtb3ZlIFJv
bUJJT1Mgc3VwcG9ydCBkdWUgdG8gYSByZW1hcmsgYnkgQW5kcmV3IHRoYXQNClhlblNlcnZl
ciBpcyBzdGlsbCB1c2luZyBpdC4NCg0KQW55IHN1Z2dlc3Rpb25zIHdoYXQgdG8gZG8/DQoN
Cj4gDQo+PiAgID1pdGVtIEI8c2VhYmlvcz4NCj4+ICAgDQo+PiBAQCAtMTkyNiw4ICsxOTE0
LDcgQEAgT3ZlcnJpZGUgdGhlIHBhdGggdG8gdGhlIGJsb2IgdG8gYmUgdXNlZCBhcyBCSU9T
LiBUaGUgYmxvYiBwcm92aWRlZCBoZXJlIE1VU1QNCj4+ICAgYmUgY29uc2lzdGVudCB3aXRo
IHRoZSBCPGJpb3M9PiB3aGljaCB5b3UgaGF2ZSBzcGVjaWZpZWQuIFlvdSBzaG91bGQgbm90
DQo+PiAgIG5vcm1hbGx5IG5lZWQgdG8gc3BlY2lmeSB0aGlzIG9wdGlvbi4NCj4+ICAgDQo+
PiAtVGhpcyBvcHRpb24gZG9lcyBub3QgaGF2ZSBhbnkgZWZmZWN0IGlmIHVzaW5nIEI8Ymlv
cz0icm9tYmlvcyI+IG9yDQo+PiAtQjxkZXZpY2VfbW9kZWxfdmVyc2lvbj0icWVtdS14ZW4t
dHJhZGl0aW9uYWwiPi4NCj4+ICtUaGlzIG9wdGlvbiBkb2VzIG5vdCBoYXZlIGFueSBlZmZl
Y3QgaWYgdXNpbmcgQjxiaW9zPSJyb21iaW9zIj4uDQo+IA0KPiBUaGlzIGRvZXNuJ3Qgc2Vl
bXMgdG8gYmUgdHJ1ZS4gSSB0aGluayB0aGUgb25seSB3YXkgY3VycmVudGx5IHRvIGhhdmUN
Cj4gYGJpb3NfcGF0aF9vdmVycmlkZWAgYmVlbiBlZmZlY3RpdmUgaXMgdG8gc3RhcnQgYSBn
dWVzdCB3aXRoIHR5cGU9aHZtDQo+IGFuZCBkZXZpY2VfbW9kZWxfdmVyc2lvbj1xZW11LXhl
bi4NCj4gDQo+IFNvIG1heWJlIGluc3RlYWQgd2Ugc2hvdWxkIHdyaXRlICJSZXF1aXJlcw0K
PiBCPGRldmljZV9tb2RlbF92ZXJzaW9uPSJxZW11LXhlbiI+LiIgbGlrZSB3ZSBoYXZlIGZv
ciB0aGUgYmlvcz1vdm1mIG9wdGlvbi4NCg0KRmluZSB3aXRoIG1lLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------2p6zo03RuHEnk6Zz9viN9wx3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------2p6zo03RuHEnk6Zz9viN9wx3--

--------------PQLNfs0wUZBwXS9igmNOilke--

--------------oHFKOKzTnd4Acmx1NPfpkuDQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgPeZgFAwAAAAAACgkQsN6d1ii/Ey+Z
0gf/WoNfyTRD73OO9qhvIhHnm0tEzDye3Ygwo2yoST+B51wTBoF3CPypiGNQH424WFrKBxq8kaCN
ROeAi1xVb0sWkK0T5ZcDf/k4B26xINtjU3zmT/Tx2lMbJaZM2aACIW7SjN1wkO3PD0s+pDMnrcbA
K6m12bi71mDPw/aOJq83X+8DJbdp0Gyyn2e8bVek80+BOaAvmVez2hC/QMTmsZZMtKtcMAIu6CT/
oqmudXxu9D0J4GgePVPgQFWHwm1Ckj+fOMP90UHe553DsuYoVB/YinuK9C3kx3/JiVLsbNVZe/k4
r/uub2XcOB1PDf3wdveLkiWSoYE3toCceoZPCF3EhQ==
=AdoM
-----END PGP SIGNATURE-----

--------------oHFKOKzTnd4Acmx1NPfpkuDQ--

