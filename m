Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D80A32461
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 12:11:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886309.1295978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAeO-0002bz-Fv; Wed, 12 Feb 2025 11:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886309.1295978; Wed, 12 Feb 2025 11:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiAeO-0002Zk-DI; Wed, 12 Feb 2025 11:11:28 +0000
Received: by outflank-mailman (input) for mailman id 886309;
 Wed, 12 Feb 2025 11:11:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y4oX=VD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tiAeM-0002Ze-2w
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 11:11:26 +0000
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18691742-e932-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 12:11:24 +0100 (CET)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-5deb0ea1129so926556a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 03:11:24 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de62512da4sm7569845a12.81.2025.02.12.03.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:11:22 -0800 (PST)
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
X-Inumbo-ID: 18691742-e932-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739358683; x=1739963483; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1qkKFaMka4B2D8P7AN6cVZ5mTLxCqhwubFloG/acTCE=;
        b=Vxjn5d9qFkGRcNNnjmF2Rxehq+o5GPsjCjXPNS0qXITrltex390GlhMWt8uomQilcz
         qpbQ5psQHBG6RlrF0l1Ajid3Tp3ZswJa/e/J+ma0vc/cwltTxF8XSPfAhNT5ZiV7xN4J
         IIPUEPLC45GK+M2DWle//mwOJBd1a+o8fZipQSNLg5am/9LkWmxLFUSPBQ0OE9+DqqBG
         9+qBuyxUJVMh0jihHHWgzEVqhISLU+U/bAV2k/j//BJ88V9V9kqwOG4TFGJL+4iNpNHn
         w6J8ew0lZG6Q2e4rERnP0ZiYzYUBqhpHpAvrGh2xt6J9CIhAb+GL3hrW0FMzMi66GCMM
         jjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739358683; x=1739963483;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qkKFaMka4B2D8P7AN6cVZ5mTLxCqhwubFloG/acTCE=;
        b=KhQTlZz9FdvJyH8weFfhTANuJYB721SjZTl2wJyhuqqi2dpNv0eTNkMePU0tcdYC61
         EQKxw96gMlLehaQnL19D2OV8JwzeA0YhozKj33iK5I8nltzJXK/So95ol0FhhE7zA1Ak
         Z27PB4zjIo5GdtX5lZmORHTswxvBeTEfqMORHNliHbCerxjfKsJETNti1/0bfPIh4dwM
         cr4KAfvEAkUniajdjA05rdFVQNdiSiCQJZ+vkhW8E2OjSJP6eK37IWetFPDQYQB6CI/6
         BC5NqeRNSQp8x30o+zydvz5E4Dp4K7J840NkkCSRvs6lukwcYDk+yTHw0qYEwfTbtvqa
         JAXw==
X-Forwarded-Encrypted: i=1; AJvYcCUCMqJN+z7KwzVaoDCkzXZRhqgdEGXzEDF4bWjk65IWt3FxAnffb9yMtESJ55oUXKgxkoVu0+zJbo0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjsNioOR25SW+HWY7t2HfHoeLvlpB9ddbHNhf6AgTC6Hnq16Zr
	OsJ5JTeAywzY4B84TeVYBy90gm4qn/RY1VPo0FOGJR7C3VbfR32W1/LPscYYJqY=
X-Gm-Gg: ASbGncv2U0RL6Gq2WtHitDoNiJqL6Q5dbYFjwnypFr/tgm4iE57UL2S8V5kfTkuLVTs
	BRQA+qTiNfCBv3jdJ/bOPUp2ewaXJEI8z3ttsCR/b5Qt/eJi8fnZ6lpggXlxJkXFA3JfIZUHbBv
	MBJ5fU6gKh9Wt00W1QMQpBrH2Kbxo9mW3tEEKAml4f5JFNBhBQQGvelB5badMDR8rT8mfDCQZSJ
	eYIlRQVXSPqaF8W/ceY9V6tmyIFx7AfQ9Mumwy1Z6SuWrhFJn4GFP+YlM97lsBkMgywPMWFdJjI
	wfcL4cPN6m2NlXXnLGpSDYO6g39+cAnYTxexl9DzG1AkBNJfxuyDn3bmjDfBSCRTwI0DgWlPivC
	Rvz3L/GOqhMaU8zswEokSljNpDmQyuDlClYBl1w==
X-Google-Smtp-Source: AGHT+IGp1XmhEe7bFYBwJckVwwuH8YHzgzt1G4MGHFa1Wp7fm4ZV4RFYSUK+60nzA3y9C4xdtwEyWQ==
X-Received: by 2002:a05:6402:40c1:b0:5dc:d913:f89e with SMTP id 4fb4d7f45d1cf-5deade0b204mr2387262a12.22.1739358683283;
        Wed, 12 Feb 2025 03:11:23 -0800 (PST)
Message-ID: <ce7320b6-68f3-43b1-8812-3a5bbd75c9c6@suse.com>
Date: Wed, 12 Feb 2025 12:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/swiotlb: don't destroy contiguous region in all
 cases
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux.dev
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-3-jgross@suse.com>
 <abe2138d-b1a7-4e53-ae5f-ea3c393d50c5@suse.com>
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
In-Reply-To: <abe2138d-b1a7-4e53-ae5f-ea3c393d50c5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T0V8pYgiTd1fxp8HhqGKc2mh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------T0V8pYgiTd1fxp8HhqGKc2mh
Content-Type: multipart/mixed; boundary="------------a04EqXeNz0kYSi0WJAEccu6Z";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 x86@kernel.org, iommu@lists.linux.dev
Message-ID: <ce7320b6-68f3-43b1-8812-3a5bbd75c9c6@suse.com>
Subject: Re: [PATCH 2/2] xen/swiotlb: don't destroy contiguous region in all
 cases
References: <20250211120432.29493-1-jgross@suse.com>
 <20250211120432.29493-3-jgross@suse.com>
 <abe2138d-b1a7-4e53-ae5f-ea3c393d50c5@suse.com>
In-Reply-To: <abe2138d-b1a7-4e53-ae5f-ea3c393d50c5@suse.com>
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

--------------a04EqXeNz0kYSi0WJAEccu6Z
Content-Type: multipart/mixed; boundary="------------00ZtQIvLOpTNF0T4lhqryuc6"

--------------00ZtQIvLOpTNF0T4lhqryuc6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDIuMjUgMDg6MzgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMS4wMi4yMDI1
IDEzOjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gSW4gY2FzZSB4ZW5fc3dpb3RsYl9h
bGxvY19jb2hlcmVudCgpIG5lZWRlZCB0byBjcmVhdGUgYSBjb250aWd1b3VzDQo+PiByZWdp
b24gb25seSBmb3Igb3RoZXIgcmVhc29uIHRoYW4gdGhlIG1lbW9yeSBub3QgYmVpbmcgY29t
cGxpYW50IHdpdGgNCj4+IHRoZSBkZXZpY2UncyBETUEgbWFzaywgdGhlcmUgaXMgbm8gcmVh
c29uIHdoeSB0aGlzIGNvbnRpZ3VvdXMgcmVnaW9uDQo+PiBzaG91bGQgYmUgZGVzdHJveWVk
IGJ5IHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoKSBsYXRlci4gRGVzdHJveWluZw0KPj4g
dGhpcyByZWdpb24gc2hvdWxkIGJlIGRvbmUgb25seSwgaWYgdGhlIG1lbW9yeSBvZiB0aGUg
cmVnaW9uIHdhcw0KPj4gYWxsb2NhdGVkIHdpdGggbW9yZSBzdHJpbmdlbnQgcGxhY2VtZW50
IHJlcXVpcmVtZW50cyB0aGFuIHRoZSBtZW1vcnkNCj4+IGl0IGRpZCByZXBsYWNlLg0KPiAN
Cj4gSSdtIG5vdCBjb252aW5jZWQgb2YgdGhpczogRXZlbiB0aGUgbWVyZSBwcm9wZXJ0eSBv
ZiBiZWluZyBjb250aWd1b3VzDQo+IG1heSBhbHJlYWR5IGJlIGVub3VnaCB0byB3YXJyYW50
IGZyZWVpbmcgd2hlbiBwb3NzaWJsZS4gVGhlIGh5cGVydmlzb3INCj4gbWF5IG5vdCBoYXZl
IHRoYXQgbWFueSBjb250aWd1b3VzIGFyZWFzIGF2YWlsYWJsZS4gVGhlIGJpZ2dlciB0aGUN
Cj4gY2h1bmssIHRoZSBtb3JlIGltcG9ydGFudCB0byBnaXZlIGl0IGJhY2sgb25jZSBubyBs
b25nZXIgbmVlZGVkIGluDQo+IHRoaXMgc2hhcGUuDQoNClJlYWxseT8gV2hlbiBjcmVhdGlu
ZyBhIGRvbWFpbiBYZW4gdHJpZXMgdG8gdXNlIEdCIHBhZ2VzIGFuZCAyTUIgcGFnZXMgYXMN
Cm11Y2ggYXMgcG9zc2libGUuIFdoeSB3b3VsZCB0aGlzIHNwZWNpYWwgY2FzZSBoZXJlIGhh
dmUgbW9yZSByZXN0cmljdGlvbnM/DQoNCj4gUGx1cyBhbHNvIHRha2UgaW50byBhY2NvdW50
IGhvdyBYZW4gYmVoYXZlcyBoZXJlOiBJdCBzcGVjaWZpY2FsbHkgdHJpZXMNCj4gdG8gaG9s
ZCBiYWNrLCBkdXJpbmcgYm9vdCwgbG93ZXIgYWRkcmVzc2VkIG1lbW9yeSB0byBsYXRlciBz
YXRpc2Z5IHN1Y2gNCj4gcmVxdWVzdHMuIEhlbmNlIGV2ZW4gaWYgeW91IGRvbid0IGFzayBm
b3IgYWRkcmVzcyByZXN0cmljdGVkIG1lbW9yeSwNCj4geW91IG1heSBnZXQgYmFjayBzdWNo
LiBZb3UnZCBuZWVkIHRvIGNvbXBhcmUgaW5wdXQgYW5kIG91dHB1dCBhZGRyZXNzZXMsDQo+
IG5vdCBpbnB1dCBhZGRyZXNzZXMgYW5kIHJlcXVlc3RlZCByZXN0cmljdGlvbiB0byBhbGxl
dmlhdGUgdGhpcy4NCg0KRmFpciBlbm91Z2guDQoNCj4gDQo+PiAtLS0gYS9hcmNoL3g4Ni94
ZW4vbW11X3B2LmMNCj4+ICsrKyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYw0KPj4gQEAgLTIy
MDgsMTkgKzIyMDgsMjIgQEAgdm9pZCBfX2luaXQgeGVuX2luaXRfbW11X29wcyh2b2lkKQ0K
Pj4gICBzdGF0aWMgdW5zaWduZWQgbG9uZyBkaXNjb250aWdfZnJhbWVzWzE8PE1BWF9DT05U
SUdfT1JERVJdOw0KPj4gICANCj4+ICAgI2RlZmluZSBWT0lEX1BURSAobWZuX3B0ZSgwLCBf
X3BncHJvdCgwKSkpDQo+PiAtc3RhdGljIHZvaWQgeGVuX3phcF9wZm5fcmFuZ2UodW5zaWdu
ZWQgbG9uZyB2YWRkciwgdW5zaWduZWQgaW50IG9yZGVyLA0KPj4gLQkJCQl1bnNpZ25lZCBs
b25nICppbl9mcmFtZXMsDQo+PiAtCQkJCXVuc2lnbmVkIGxvbmcgKm91dF9mcmFtZXMpDQo+
PiArc3RhdGljIGludCB4ZW5femFwX3Bmbl9yYW5nZSh1bnNpZ25lZCBsb25nIHZhZGRyLCB1
bnNpZ25lZCBpbnQgb3JkZXIsDQo+PiArCQkJICAgICB1bnNpZ25lZCBsb25nICppbl9mcmFt
ZXMsDQo+PiArCQkJICAgICB1bnNpZ25lZCBsb25nICpvdXRfZnJhbWVzKQ0KPj4gICB7DQo+
PiAgIAlpbnQgaTsNCj4+ICsJdTY0IGFkZHJlc3NfYml0cyA9IDA7DQo+IA0KPiBGaXJzdCBJ
IHdhcyBpbmNsaW5lZCB0byBzdWdnZXN0IHRvIHVzZSBwYWRkcl90IGhlcmUsIGJ1dCAuLi4N
Cj4gDQo+PiAgIAlzdHJ1Y3QgbXVsdGljYWxsX3NwYWNlIG1jczsNCj4+ICAgDQo+PiAgIAl4
ZW5fbWNfYmF0Y2goKTsNCj4+ICAgCWZvciAoaSA9IDA7IGkgPCAoMVVMPDxvcmRlcik7IGkr
KywgdmFkZHIgKz0gUEFHRV9TSVpFKSB7DQo+PiAgIAkJbWNzID0gX194ZW5fbWNfZW50cnko
MCk7DQo+PiAgIA0KPj4gLQkJaWYgKGluX2ZyYW1lcykNCj4+ICsJCWlmIChpbl9mcmFtZXMp
IHsNCj4+ICAgCQkJaW5fZnJhbWVzW2ldID0gdmlydF90b19tZm4oKHZvaWQgKil2YWRkcik7
DQo+PiArCQkJYWRkcmVzc19iaXRzIHw9IGluX2ZyYW1lc1tpXSA8PCBQQUdFX1NISUZUOw0K
PiANCj4gLi4uIHdoeSBkbyBhIHNoaWZ0IG9uIGV2ZXJ5IGxvb3AgaXRlcmF0aW9uIHdoZW4g
eW91IGNhbiAuLi4NCj4gDQo+PiArCQl9DQo+PiAgIA0KPj4gICAJCU1VTFRJX3VwZGF0ZV92
YV9tYXBwaW5nKG1jcy5tYywgdmFkZHIsIFZPSURfUFRFLCAwKTsNCj4+ICAgCQlfX3NldF9w
aHlzX3RvX21hY2hpbmUodmlydF90b19wZm4oKHZvaWQgKil2YWRkciksIElOVkFMSURfUDJN
X0VOVFJZKTsNCj4+IEBAIC0yMjI5LDYgKzIyMzIsOCBAQCBzdGF0aWMgdm9pZCB4ZW5femFw
X3Bmbl9yYW5nZSh1bnNpZ25lZCBsb25nIHZhZGRyLCB1bnNpZ25lZCBpbnQgb3JkZXIsDQo+
PiAgIAkJCW91dF9mcmFtZXNbaV0gPSB2aXJ0X3RvX3Bmbigodm9pZCAqKXZhZGRyKTsNCj4+
ICAgCX0NCj4+ICAgCXhlbl9tY19pc3N1ZSgwKTsNCj4+ICsNCj4+ICsJcmV0dXJuIGZsczY0
KGFkZHJlc3NfYml0cyk7DQo+IA0KPiAuLi4gc2ltcGx5IGFkZCBpbiBQQUdFX1NISUZUIGhl
cmUsIG9uY2U/DQoNClRydWUuDQoNCj4gDQo+PiBAQCAtMjMyMSw3ICsyMzI2LDggQEAgc3Rh
dGljIGludCB4ZW5fZXhjaGFuZ2VfbWVtb3J5KHVuc2lnbmVkIGxvbmcgZXh0ZW50c19pbiwg
dW5zaWduZWQgaW50IG9yZGVyX2luLA0KPj4gICANCj4+ICAgaW50IHhlbl9jcmVhdGVfY29u
dGlndW91c19yZWdpb24ocGh5c19hZGRyX3QgcHN0YXJ0LCB1bnNpZ25lZCBpbnQgb3JkZXIs
DQo+PiAgIAkJCQkgdW5zaWduZWQgaW50IGFkZHJlc3NfYml0cywNCj4+IC0JCQkJIGRtYV9h
ZGRyX3QgKmRtYV9oYW5kbGUpDQo+PiArCQkJCSBkbWFfYWRkcl90ICpkbWFfaGFuZGxlLA0K
Pj4gKwkJCQkgdW5zaWduZWQgaW50ICphZGRyZXNzX2JpdHNfaW4pDQo+PiAgIHsNCj4+ICAg
CXVuc2lnbmVkIGxvbmcgKmluX2ZyYW1lcyA9IGRpc2NvbnRpZ19mcmFtZXMsIG91dF9mcmFt
ZTsNCj4+ICAgCXVuc2lnbmVkIGxvbmcgIGZsYWdzOw0KPj4gQEAgLTIzMzYsNyArMjM0Miw3
IEBAIGludCB4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFy
dCwgdW5zaWduZWQgaW50IG9yZGVyLA0KPj4gICAJc3Bpbl9sb2NrX2lycXNhdmUoJnhlbl9y
ZXNlcnZhdGlvbl9sb2NrLCBmbGFncyk7DQo+PiAgIA0KPj4gICAJLyogMS4gWmFwIGN1cnJl
bnQgUFRFcywgcmVtZW1iZXJpbmcgTUZOcy4gKi8NCj4+IC0JeGVuX3phcF9wZm5fcmFuZ2Uo
dnN0YXJ0LCBvcmRlciwgaW5fZnJhbWVzLCBOVUxMKTsNCj4+ICsJKmFkZHJlc3NfYml0c19p
biA9IHhlbl96YXBfcGZuX3JhbmdlKHZzdGFydCwgb3JkZXIsIGluX2ZyYW1lcywgTlVMTCk7
DQo+IA0KPiBOaXQ6IENvbnZlcnRpbmcgcGxhaW4gaW50IHRvIHVuc2lnbmVkIGludCwgd2hl
biB0aGVyZSdzIG5vIHJlYWwgcmVhc29uDQo+IHRvIGRvIGFueSBjb252ZXJzaW9uLiBTaW5j
ZSB4ZW5femFwX3Bmbl9yYW5nZSgpIGNhbid0IHJldHVybiBhIG5lZ2F0aXZlDQo+IHZhbHVl
IGZvciB0aGUgY2FsbGVyIGNhcmluZyBhYm91dCB0aGUgcmV0dXJuIHZhbHVlICh5ZXQgbW9y
ZSBvYnZpb3VzbHkNCj4gc28gd2l0aCB0aGUgc3VnZ2VzdGVkIGFkanVzdG1lbnQsIGFuZCB0
aGVuIHRydWUgZm9yIGJvdGggY2FsbGVycyksIHRoZQ0KPiBmdW5jdGlvbiBjb3VsZCBlYXNp
bHkgcmV0dXJuIHVuc2lnbmVkIGludC4NCg0KV2lsbCBjaGFuZ2UgdGhhdC4NCg0KDQpKdWVy
Z2VuDQo=
--------------00ZtQIvLOpTNF0T4lhqryuc6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------00ZtQIvLOpTNF0T4lhqryuc6--

--------------a04EqXeNz0kYSi0WJAEccu6Z--

--------------T0V8pYgiTd1fxp8HhqGKc2mh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmesgdoFAwAAAAAACgkQsN6d1ii/Ey9P
5Qf/QNcDFZkg+EKV3cbYUfb7UtB+T5lgIRtmob44g/TUtbkQPGnub7oNFC0Sggrydw5pIMDTwcx9
827GmDYg6HCgUgChZ8alKwXNcfOIMmlhI9Hm3iRo3d0xboYD5jaoFT3+Gze9kUvwX0csJ1mW8tWC
k+bmgF3UVN03hSdhlS5H93tb27OHaJDrTNRy477kfYS+djJyvnZAtGwLO/T++45gcrBK65M7Ap6Y
9FM9/S5jxdlofpfz6y3vLqnVzJc2lunZspXTF6eM0isZ3TTCAA1zaA3cznImkB5MmxdnYECi1pFN
HKi6Ygpex4xj3qUOT45cHYq+lu33EySYeUmPNa+/3w==
=AFS7
-----END PGP SIGNATURE-----

--------------T0V8pYgiTd1fxp8HhqGKc2mh--

