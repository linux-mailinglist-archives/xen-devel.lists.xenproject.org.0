Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B69C64522
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 14:18:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163902.1490945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKz6z-0003dH-2S; Mon, 17 Nov 2025 13:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163902.1490945; Mon, 17 Nov 2025 13:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKz6y-0003aB-Vu; Mon, 17 Nov 2025 13:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1163902;
 Mon, 17 Nov 2025 13:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vKz6w-0003a5-QU
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 13:17:38 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c91f9822-c3b7-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 14:17:37 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b7277324204so558066566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 05:17:37 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fa81223sm1099575566b.4.2025.11.17.05.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 05:17:36 -0800 (PST)
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
X-Inumbo-ID: c91f9822-c3b7-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763385456; x=1763990256; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m5QAkK9HJ3r6Kvc48MieC0UEFKRy6gqepKNQ3ygFeJI=;
        b=EV0nttCTpE6RBFvt8Ds7nFRp94Ejh8UAIbsaNWtpWtUoxOrwC7tKxguQa+uaFZhYCq
         b29ysjIP2J3mepIENch6xv82YjM5FJ0re3GotSFMEgvFcWIuFHhj5y11Lk7IrM2SjBNg
         8glz3kMqb6yZUCFPQ4TovGGb6ET/nCcZ1oo/rkD+1JzH8o9VQp7UNtleTo+6w4vi91Se
         N1BTSfBrc+CO83qwUCk07/BWAPkVlL7qNCKi97Kw/vcfz7PGZHSonPCef8Id6Q6Ey3Ep
         rAMHZF/omcZEduUwuTRgrXyLwQ3cjKPiMYEl6Rlv7xs87wlZHwzKTs4v1IlJvyGaOtGW
         cXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763385456; x=1763990256;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5QAkK9HJ3r6Kvc48MieC0UEFKRy6gqepKNQ3ygFeJI=;
        b=AdSOx4w6JIfTwICnxif2rbF+VteRrv7kYU7yDBdxxdpgs+dcxxNhVzpJZVH9IqVYcs
         WSAghDKQrSPt01hHzIBWTdmZW1O/bi+UDF2l4sPTC7dczZr0leHsqjKQAg6V5D7n0wif
         6l1YP0NYqDNuuOmNWr372LSDkjkOLgxpGXmvGKtyWHGv/Ol9207aYpYCE2LVFE+CRPBB
         7Khfn4//C4Psy7HKaa2SmcucCd5tNi+wwzL1ddXdt8ySrYZRIHnWqz+AdyyWQcEfiZ8b
         luy63CQVtHs6zV5IfyelxBzRdnSctpZuUZeCbkpozlcsSeUwSG7l1yr1NBW0rUucRNGY
         QDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEL+gn3lj+e8YJpSVBpeIKZwiG5PxuI5xD4SGI5tg7Grv2gVcfAFxBKbRK2Tdjz50oAdQgMjX37D0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu0Z1K4t3S5RCMnb0dJs8gxQQ89pHbu3vvipJZ/L3nz9J1UYDb
	qJ9EsuE7FjygsV6TMu0fmi4zSfVtBFNulvhApE5EHTSriWhaykvDNoUEmgJ0LXgkQUA=
X-Gm-Gg: ASbGncvBOhrX+ALSIj3oxtTUHBcICrFtbFDb8yOiZTV5E6HB8VP8S5GyNq0YM74Zw8C
	kNqBQbdQlcOKAObSKPi9aZL6xoUoiFEjHJePOyNtb4slVRubVycdx9G/2xL6BC6NGEHFaEm3t/d
	L8VlXgG+vUK/NpVPD2qjaBwhP59SZ3pdiiwJUzPlVWbqIdJ3Qq0Jre0eq/v0IZ4JoPdQQg6JLVK
	GuMw4PlmFWCQgDmu1U+Za2MbGKr+wMrr2Nyb6zTZNn92/2qd2IWyoEBg5xDC9KeSBjQW7qq9ps6
	HpTerj8sr0Vi6kFvZN+jxKCB3voJp5343t9lHb/QdWW/uxIW3NnqKWFHo/UlCLRxSXdUdFHumtH
	vucvIoCYAyeiFqkQFtOAx8YI8xMJ1be4GWHUf71P7PzSVDpdaN37COS8PRKHf3m8p56h5w3UMjg
	3dGF76yL1tiHlDdze+hiGcz8Fl9Q/mXHtoYcmDdtfv1QDNZdIJcecHJu13S4IH6KRd0qUJg5rJq
	wcGVJf4UxnDPO+5arpl1iN9kttbrX7mYRW/ENk=
X-Google-Smtp-Source: AGHT+IHZnFAOPlu79GVJDsns6EVEVp5BbAFNEYPf2reJQXu7e8Wj3rS0uws4D/Qd4Ps03+oYas8oGg==
X-Received: by 2002:a17:906:7305:b0:b72:c103:88db with SMTP id a640c23a62f3a-b736780a895mr1182402466b.9.1763385456362;
        Mon, 17 Nov 2025 05:17:36 -0800 (PST)
Message-ID: <d0f7a82a-b3f9-4716-a5a0-a8605da65243@suse.com>
Date: Mon, 17 Nov 2025 14:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
 <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
 <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
 <0ed9b152-6465-4736-be59-352d68b77e6f@suse.com>
 <45c6d3dd-3901-4609-918b-ba6b685d6496@suse.com>
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
In-Reply-To: <45c6d3dd-3901-4609-918b-ba6b685d6496@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ioJNvAX588Hz4fqGP8Fy7y6N"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ioJNvAX588Hz4fqGP8Fy7y6N
Content-Type: multipart/mixed; boundary="------------p2Nn0Sk0YgPkzEit00oBSXJM";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <d0f7a82a-b3f9-4716-a5a0-a8605da65243@suse.com>
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
 <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
 <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
 <0ed9b152-6465-4736-be59-352d68b77e6f@suse.com>
 <45c6d3dd-3901-4609-918b-ba6b685d6496@suse.com>
In-Reply-To: <45c6d3dd-3901-4609-918b-ba6b685d6496@suse.com>
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

--------------p2Nn0Sk0YgPkzEit00oBSXJM
Content-Type: multipart/mixed; boundary="------------9IIyGmLB01KfAMZ8J1Tz3mV4"

--------------9IIyGmLB01KfAMZ8J1Tz3mV4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTEuMjUgMTQ6MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4xMS4yMDI1
IDEzOjU1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMTcuMTEuMjUgMTM6MzMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE0LjExLjIwMjUgMTQ6MDAsIErDvHJnZW4gR3Jv
w58gd3JvdGU6DQo+Pj4+IE9uIDE0LjExLjI1IDEyOjQwLCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4+Pj4gT24gMTQvMTEvMjAyNSAxMTozMiBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToN
Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZG9jcy9NYWtlZmlsZSBiL2RvY3MvTWFrZWZpbGUNCj4+
Pj4+PiBpbmRleCAzNzc3NmQzMDNjLi5lNWY0YThjYTg2IDEwMDY0NA0KPj4+Pj4+IC0tLSBh
L2RvY3MvTWFrZWZpbGUNCj4+Pj4+PiArKysgYi9kb2NzL01ha2VmaWxlDQo+Pj4+Pj4gQEAg
LTgsOCArOCwxMSBAQCBEQVRFCQk6PSAkKGNhbGwgZGF0ZSwiKyVZLSVtLSVkIikNCj4+Pj4+
PiAgICAgRE9DX0FSQ0hFUyAgICAgIDo9IGFybSBwcGMgcmlzY3YgeDg2XzMyIHg4Nl82NA0K
Pj4+Pj4+ICAgICBNQU5fU0VDVElPTlMgICAgOj0gMSA1IDcgOA0KPj4+Pj4+ICAgICANCj4+
Pj4+PiArSU5fRklMRVMgOj0gbWFuL3hsLWRpc2stY29uZmlndXJhdGlvbi41LnBvZCBtYW4v
eGwtbmV0d29yay1jb25maWd1cmF0aW9uLjUucG9kDQo+Pj4+Pj4gK0lOX0ZJTEVTICs9IG1h
bi94bC4xLnBvZCBtYW4veGwuY2ZnLjUucG9kIG1hbi94bC5jb25mLjUucG9kDQo+Pj4+Pg0K
Pj4+Pj4gU29ycnksIEkgbWVhbnQgdG8gc2F5IHRoaXMgb24gdGhlIHByZXZpb3VzIHJldmlz
aW9uLsKgIENhbiB3ZSBwbGVhc2UgbGlzdA0KPj4+Pj4gdGhlc2Ugb25lIHBlciBsaW5lLCBm
b3IgdGhlIGZ1dHVyZSBlYXNlIG9mIGluc2VydGluZy9yZW1vdmluZy4NCj4+Pj4NCj4+Pj4g
T2theS4NCj4+Pj4NCj4+Pj4+IElzIElOX0ZJTEVTIHJlYWxseSBjb3JyZWN0P8KgIFRoZXNl
IGFyZSB0aGUgZ2VuZXJhdGVkIChub24tLmluKSBmaWxlcywNCj4+Pj4+IHJhdGhlciB0aGFu
IHRoZSAuaW4gZmlsZXMgdGhlbXNlbHZlcy7CoCBHRU5fRklMRVMgZnJvbSB2MSB3b3VsZCBz
ZWVtIHRvDQo+Pj4+PiBiZSBhIGJldHRlciBmaXQuDQo+Pj4+DQo+Pj4+IEkgd2FudGVkIHRv
IG1ha2UgY2xlYXIgdGhpcyBpcyByZWxhdGVkIHRvICouaW4gZmlsZXMuIEFuZCBJTUhPIEdF
Tl9GSUxFUw0KPj4+PiB3YXMgdG9vIGdlbmVyaWMgb24gYSBzZWNvbmQgdGhvdWdodC4NCj4+
Pj4NCj4+Pj4gR0VORVJBVEVEX0ZST01fSU5fU1VGRklYRURfRklMRVMgc2VlbXMgYSBsaXR0
bGUgYml0IGNsdW1zeS4gOy0pDQo+Pj4+IFNlcmlvdXNseSwgaWYgeW91IGhhdmUgYW55IGJl
dHRlciBuYW1lLCBJJ2QgYmUgaGFwcHkgdG8gdXNlIGl0Lg0KPj4+DQo+Pj4gR0VOX1BPRF9G
SUxFUywgc2VlaW5nIHRoZXkncmUgYWxsICoucG9kPw0KPj4NCj4+IEZvciB0aGlzIGNhc2Us
IG1heWJlLiBPVE9IIGluIGNhc2Ugc29tZW9uZSBhZGRzIGEgLnBvZG1hbiBmaWxlIHdlJ2Qg
bmVlZA0KPj4gdG8gcmVuYW1lIGFnYWluLg0KPj4NCj4+IEFuZCBJIHRoaW5rIHVzaW5nIHRo
ZSBzYW1lIG1ha2UgdmFyaWFibGUgbmFtZSBpbiBhbGwgTWFrZWZpbGVzIG5lZWRpbmcgdG8N
Cj4+IHNwZWNpZnkgKi5pbiBkZXJpdmVkIGZpbGVzIHdvdWxkIGJlIHByZWZlcmFibGUuDQo+
Pg0KPj4gTWF5YmUgSU5fVEFSR0VUUz8NCj4gDQo+IEJldHRlciB0aGFuIElOX0ZJTEVTLCBi
dXQgc3RpbGwgcG90ZW50aWFsbHkgYW1iaWd1b3VzLiBIb3cgYWJvdXQgc3RpY2tpbmcNCj4g
dG8gSU5fRklMRVMgYnV0IGluZGVlZCBlbnVtZXJhdGluZyB0aGUgLmluIHRoZXJlICh6YXBw
aW5nIHRoZSBzdWZmaXggdXBvbg0KPiB1c2UpPyBBbmQvb3Igd291bGQgJCh3aWxkY2FyZCA8
cGF0aD4vKi5pbikgcGVyaGFwcyBtYWtlIHNlbnNlIHRvIHVzZT8NCg0KWmFwcGluZyB0aGUg
c3VmZml4IHVwb24gdXNlIHdvdWxkIGJlIHBvc3NpYmxlLCBidXQgbW9yZSBjbHVtc3kgKHRo
ZXJlIGFyZQ0Kbm9ybWFsbHkgYXQgbGVhc3QgMyBkaXJlY3QgdXNlcyBvZiBJTl9GSUxFUyBp
biBlYWNoIGFmZmVjdGVkIE1ha2VmaWxlLCB3aGlsZQ0KdGhlcmUgYXJlIDAgdXNlIGNhc2Vz
IG9mIHRoZSAuaW4gc3VmZml4ZWQgc291cmNlIGZpbGVzKS4NCg0KVXNpbmcgYSBsb2NhbCBt
YWtlIHZhcmlhYmxlIGZvciBzcGVlZGluZyB0aGF0IHVwIHdvdWxkIGhhdmUgdGhlIHNhbWUg
cHJvYmxlbQ0KYXMgYmVmb3JlOiBob3cgdG8gbmFtZSBpdD8NCg0KQW5kIHVzaW5nICQod2ls
ZGNhcmQgPHBhdGg+LyouaW4pIGlzIG5vdCBhbiBvcHRpb24sIGFzIHRoYXQgd291bGQgcmVp
bnRyb2R1Y2UNCnRoZSBuZWVkIHRvIGRpc3Rpbmd1aXNoIHRoZSBjb25maWd1cmUtdGltZSBh
bmQgYnVpbGQtdGltZSAqLmluIGZpbGVzLCB3aGljaA0KSSBzb2x2ZWQgaW4gVjEgb2YgbXkg
c2VyaWVzIGJ5IHJlbmFtaW5nIHRoZSBidWlsZC10aW1lIG9uZXMgdG8gKi5zcmMuDQoNCg0K
SnVlcmdlbg0K
--------------9IIyGmLB01KfAMZ8J1Tz3mV4
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------9IIyGmLB01KfAMZ8J1Tz3mV4--

--------------p2Nn0Sk0YgPkzEit00oBSXJM--

--------------ioJNvAX588Hz4fqGP8Fy7y6N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkbIG8FAwAAAAAACgkQsN6d1ii/Ey+F
1Qf/d7f3K4hUwiSapvxrq8SZF4gods0A0Bf69TqTEcTogswoSwm9AHS9uxG6bPgXoCAM8vyIBN6K
876lRAwvxwtULlzY0Tm+9X8I62Egr4vnTyNgrV3EraU9mwn1WSxcT0HZ5kM78TDDNuqae2RkgOFf
qgKh6jG2U/FLKUQthBhV+KZ9DHOjdgtu44PmPmOLW6c0WCSKz7wT4hUqZCNHPd4WcW49w1SIs/1B
hKgtHnApGFxLFo6rHA71jmH+YbDPBxC6aTswAfJyrFYTlRv9R/rpoaM30YZtOUhT3kLDdrjU9v0+
RcRwRUIwGz8ZB0ehoQ3BJYEsq+Mqj/OKeOio4Y13rw==
=Fsde
-----END PGP SIGNATURE-----

--------------ioJNvAX588Hz4fqGP8Fy7y6N--

