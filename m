Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47EAA5F077
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 11:20:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911828.1318220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsffK-0002sj-7U; Thu, 13 Mar 2025 10:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911828.1318220; Thu, 13 Mar 2025 10:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsffK-0002qj-4A; Thu, 13 Mar 2025 10:19:50 +0000
Received: by outflank-mailman (input) for mailman id 911828;
 Thu, 13 Mar 2025 10:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oZoU=WA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tsffI-0002qd-Qc
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 10:19:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0d25c6e-fff4-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 11:19:47 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso4769015e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 03:19:47 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188affdbsm15798055e9.7.2025.03.13.03.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 03:19:46 -0700 (PDT)
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
X-Inumbo-ID: b0d25c6e-fff4-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741861187; x=1742465987; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FFgBD4URUkG2X6df/kZGV3/2UEiBWWrVHi+FFZ9mJRs=;
        b=dnIy2BfAFuteeq/+/rYoaZIvKtE/Zxpe+iE0nQW0QfMVEFhh5uxSGSihujhqFDU0Dn
         lLK83J+zjxsbQ6fhPXC3UCTlqX6cHFykZNUbQG8X5xzXtmC8qod9vHORJhxkC1JDe3Hw
         7B45KUx2BUqUxrWQwN6at8VnH/Qu0lFph4lwvDzvt+/T/71Hd0LkaoOlp2s2VNEqr0S+
         bkrB8vtSBTr35oXvno7hzc/SVPr6+1mpseB9XpVHSEpjkGKKH7p0nyk0JptEwWSLs5jn
         LSdWbaIkmp51krdy/fMmT/QJU8GcOf265CwLEEOK6+frvgWuex9gxS6pnkkAi0fHvXuT
         o5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741861187; x=1742465987;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFgBD4URUkG2X6df/kZGV3/2UEiBWWrVHi+FFZ9mJRs=;
        b=kT7xT3XCdyvvm33G01m1DICiLS1pXSnaa4lVlQJsRe2YsHbJEagv0QL6wLTyxdgThk
         9j0tIHO6YAQXdTsKtctfA3augCDfjSU3iKPSrCBx0PSepITcIxBca0a99f8BW9WywjXG
         +WkNhQXwK6p47ZWv8BWi/XZ5AaVm9x19Bvvh2sk8Qy8VGn7i0nSXCC89ctmQjkCwNUE+
         vbdxsqYLIRwLFsw9Wc1RW4/qn65y+IpugGgaOaq/AOxhlj8d2Ub+jXaDSSPqqQMmulU8
         PBZ1MEIkO3Z6Uh9ItkjXGk954XRiiJYLGsz6YEknrlGWWlPevce1WZ5ZiBkrw2v4oEyE
         bEKg==
X-Gm-Message-State: AOJu0Yw7/1D7OPscRDmTFV3X1rfmSLqBnoc8xAPNFxnLhHd4PHrl+/I/
	IB7QFqiTcpBGqyFQ5LJC9+9n9FGn1JBslryTEOUYY27KECR8ncn0kHAm9btjAac=
X-Gm-Gg: ASbGncuEEWS7+pJu4ontQ0OfKIqxzWcETAulCjtyGvWcrSOB3CarBIFRLd07d1H/Cl9
	iizi8hCLEsPOWYighetuyGDnvSXKshklNrHpAMJqdWzbmQrpaNu1aHU4mU9eG/HytD1TyLeopFd
	fR1HZGCtPPx/M+iQcT9B6E/x6FOP6pk55da3REafSdr7zFHhNvin7rARDkxYO4wVm0OeMrqfZMK
	QgKZivjpu/Yl+8be0mof9j8p/tFhIjxbUAMYq8b9hGrvJqE3JDpWGEI+DeKu2k/8UuQx6NMD2HF
	RwavNaMpGIALU7xZk3TMkwq0zgrNYzGcavrsbPf+1A8EpsSGzbwiM8PV1suS4MJCKaGZJSSgamM
	WMcVOjiZPfoEjTJniNRUd0BHeTC0IqbSg17DWfKjSG3sdE8oF/Xaxu2CLIoAtsoOgTnY=
X-Google-Smtp-Source: AGHT+IHBSlByC9ie1hjlfvelmH4DxxP2LVQhbGEju7OyflfMTBP5+nDr3sIqOeQye1AUYzt3QnsFaA==
X-Received: by 2002:a05:600c:1c04:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-43cf62969f2mr153453935e9.0.1741861187022;
        Thu, 13 Mar 2025 03:19:47 -0700 (PDT)
Message-ID: <d3a012d6-87d9-4a22-9918-c1e2033c4e0b@suse.com>
Date: Thu, 13 Mar 2025 11:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: specify numerical values of Xenstore commands
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250312084143.14045-1-jgross@suse.com> <Z9G6dXyhM01MFD_q@l14>
 <ade9e905-f9d5-468c-bad6-acc996378f06@suse.com> <Z9Kwgqe9FUgrpSUs@l14>
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
In-Reply-To: <Z9Kwgqe9FUgrpSUs@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hPwaqXVCUvYXcMLBipzzLMm0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hPwaqXVCUvYXcMLBipzzLMm0
Content-Type: multipart/mixed; boundary="------------aHc9XOJPzUV4BFr1yVzK2tjV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <d3a012d6-87d9-4a22-9918-c1e2033c4e0b@suse.com>
Subject: Re: [PATCH v3] docs: specify numerical values of Xenstore commands
References: <20250312084143.14045-1-jgross@suse.com> <Z9G6dXyhM01MFD_q@l14>
 <ade9e905-f9d5-468c-bad6-acc996378f06@suse.com> <Z9Kwgqe9FUgrpSUs@l14>
In-Reply-To: <Z9Kwgqe9FUgrpSUs@l14>
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

--------------aHc9XOJPzUV4BFr1yVzK2tjV
Content-Type: multipart/mixed; boundary="------------M0bjHR0wHf0z2AINqwvLPwWR"

--------------M0bjHR0wHf0z2AINqwvLPwWR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDMuMjUgMTE6MTYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAxMywgMjAyNSBhdCAxMDo1MTowNkFNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0K
Pj4gT24gMTIuMDMuMjUgMTc6NDYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IE9uIFdl
ZCwgTWFyIDEyLCAyMDI1IGF0IDA5OjQxOjQzQU0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6DQo+Pj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuc3RvcmUudHh0IGIvZG9jcy9t
aXNjL3hlbnN0b3JlLnR4dA0KPj4+PiBpbmRleCA3ZTFmMDMxNTIwLi43MmRiNzNkZWVmIDEw
MDY0NA0KPj4+PiAtLS0gYS9kb2NzL21pc2MveGVuc3RvcmUudHh0DQo+Pj4+ICsrKyBiL2Rv
Y3MvbWlzYy94ZW5zdG9yZS50eHQNCj4+Pj4gQEAgLTg2LDYgKzg2LDY3IEBAIHBhcnRzIG9m
IHhlbnN0b3JlIGluYWNjZXNzaWJsZSB0byBzb21lIGNsaWVudHMuICBJbiBhbnkgY2FzZSBw
YXNzaW5nDQo+Pj4+ICtYU19DT05UUk9MICAgICAgICAgICAgICAgMCAgICBvcHRpb25hbA0K
Pj4+PiArICAgIElmIG5vdCBzdXBwb3J0ZWQsIHhlbnN0b3JlLWNvbnRyb2wgY29tbWFuZCB3
aWxsIG5vdCB3b3JrLg0KPj4+PiArICAgIFhTX0RFQlVHIGlzIGEgZGVwcmVjYXRlZCBhbGlh
cyBvZiBYU19DT05UUk9MLg0KPj4+PiArWFNfRElSRUNUT1JZICAgICAgICAgICAgIDENCj4+
Pj4gK1hTX1JFQUQgICAgICAgICAgICAgICAgICAyDQo+Pj4+ICtYU19HRVRfUEVSTVMgICAg
ICAgICAgICAgMw0KPj4+DQo+Pj4gVGhpcyBuZXcgdGFibGUgcHJlZml4IG1lc3NhZ2UgdHlw
ZSBuYW1lcyB3aXRoICJYU18iLCBidXQgdGhlIHJlc3Qgb2YgdGhlDQo+Pj4gZG9jdW1lbnQg
ZGVzY3JpYmUgZWFjaCB0eXBlIHdpdGhvdXQgdGhlIHByZWZpeC4gSXNuJ3QgaXQgZ29pbmcg
dG8gYmUNCj4+PiBjb25mdXNpbmcsIGFuZCBtYWtlIGl0IHNsaWdodGx5IGhhcmRlciB0byBs
aW5rIHRoaXMgdGFibGUgdG8gcmVzdCBvZiB0aGUNCj4+PiBkb2N1bWVudD8gKEkgb2Z0ZW4g
c2VhcmNoIGJ5IGZ1bGwgd29yZCwgbGlrZSAnXDxHRVRfUEVSTVNcPicsIGJlY2F1c2UNCj4+
PiB0aGF0IG9uZSBrZXkgc3Ryb2tlIGluIHZpbSAnKicsIHNvIGhhdmluZyBkaWZmZXJlbnQg
cHJlZml4IG1ha2VzIGl0DQo+Pj4gaGFyZGVyIHRvIHNlYXJjaCkNCj4+DQo+PiBRdWVzdGlv
biBpcywgc2hvdWxkIEkgY2hhbmdlIHRoZSB0YWJsZSB0byBkcm9wICJYU18iLCBvciB0aGUg
cmVzdCBkb2N1bWVudA0KPj4gdG8gYWRkICJYU18iIGluc3RlYWQ/IEFmdGVyIGFsbCB4c193
aXJlLmggaXMgZGVmaW5pbmcgdGhlIG5hbWVzIHdpdGggIlhTXyIuDQo+Pg0KPj4gSSdtIHNs
aWdodGx5IGxlYW5pbmcgdG93YXJkcyBhIHByZXBhcmF0b3J5IHBhdGNoIGFkZGluZyAiWFNf
Ii4NCj4gDQo+IFdlbGwsIEknbSBhY3R1YWxseSBmb3IgZHJvcHBpbmcgdGhlIHByZWZpeCBm
cm9tIHRoZSB0YWJsZS4gVGhlIHByZWZpeCBpcw0KPiBtb3JlIG9mIGEgQyBzcGVjaWZpYyBu
YW1lc3BhY2UgdGhhbiBhbnl0aGluZyBlbHNlLiBUaGUgb2NhbWwNCj4gaW1wbGVtZW50YXRp
b24gaW4gdHJlZSBkb2Vzbid0IHVzZSB0aGlzIHByZWZpeCwgYnV0IGEgZGlmZmVyZW50IG9u
ZSAoaWYNCj4gd2UgaWdub3JlIHRoZSBkaWZmZXJlbnQgY2FzZToNCj4+IFhlbmJ1cy5YYi5P
cC5XYXRjaA0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS94ZW4vdjQuMjAuMC9zb3Vy
Y2UvdG9vbHMvb2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwjTDYzMg0KPiBBbmQgaGF2ZSBh
IGxpbmsgdG8gYSBzdHJpbmcgd2l0aG91dCB0aGUgcHJlZml4Og0KPj4gfCBXYXRjaAkJCS0+
ICJXQVRDSCINCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20veGVuL3Y0LjIwLjAvc291
cmNlL3Rvb2xzL29jYW1sL2xpYnMveGIvb3AubWwjTDQ5DQo+IA0KPiBUaGVyZSdzIGFsc28g
YSB2ZXJzaW9uIGluIFJ1c3Qgd2hpY2ggYWxzbyB1c2UgYSBkaWZmZXJlbnQgcHJlZml4LA0K
PiAiWHNNZXNzYWdlVHlwZTo6Ii4NCj4gaHR0cHM6Ly9naXRodWIuY29tL1dlbnplbC94ZW5z
dG9yZS9ibG9iL2Y4MmJkNDVjYmNkMWFhOTgzMDZjNTdkMzU4NDdlM2Q3N2Y3Y2M4ZWUvc3Jj
L3dpcmUucnMjTDU1DQo+IA0KPiBTbyB0aGUgcHJlZml4IGlzIHJlYWxseSBwcm9ncmFtbWlu
ZyBsYW5ndWFnZSBzcGVjaWZpYyBhbmQgSSBkb24ndCB0aGluaw0KPiBpbnRyb2R1Y2luZyBp
dCB0byB0aGlzIGRvY3VtZW50IHdvdWxkIGJlIHVzZWZ1bC4NCg0KRmFpciBlbm91Z2guIFN0
YXkgdHVuZWQgZm9yIFY0LiA6LSkNCg0KDQpKdWVyZ2VuDQo=
--------------M0bjHR0wHf0z2AINqwvLPwWR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------M0bjHR0wHf0z2AINqwvLPwWR--

--------------aHc9XOJPzUV4BFr1yVzK2tjV--

--------------hPwaqXVCUvYXcMLBipzzLMm0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfSsUEFAwAAAAAACgkQsN6d1ii/Ey+/
xQf+NkfYhJNjd2lnbMY/3OnjjHvqsGfNGqzuMm6pNF8mFpU+w51YknNtaa5ZCtMgHlOzrhHPEztr
l5Gza2EHMEfVf8pUq/n+Wsgtu0POKv+qqIwuWOlZGPFzxDK0RwKtkcFxMsuIU1XYGvlIhDOo4coo
H3StNsnHEjkeZOksVelWb7NS+e7ygIfbj+y9UG4l0kE3jLmZ8LC1Stm/IeX9n+CM0PcgQEwZMjg9
mpGobV/0v4pGqJNXG0MOEJkviFzG+IEH0vqWfLZvpWjZ0P8ld2xMA7jvmZc9BVDUTraEp5jghSWk
vbcQfyJoq5SV1V0gXRd0EvnkpQAtcu+LnTvBq9HtiQ==
=LFsF
-----END PGP SIGNATURE-----

--------------hPwaqXVCUvYXcMLBipzzLMm0--

