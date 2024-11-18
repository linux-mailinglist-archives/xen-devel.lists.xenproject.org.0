Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544F29D0A4E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 08:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839079.1254886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCwFI-00050M-Ti; Mon, 18 Nov 2024 07:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839079.1254886; Mon, 18 Nov 2024 07:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCwFI-0004xl-Qt; Mon, 18 Nov 2024 07:32:28 +0000
Received: by outflank-mailman (input) for mailman id 839079;
 Mon, 18 Nov 2024 07:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4K+I=SN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tCwFG-0004xf-LI
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 07:32:26 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4060b356-a57f-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 08:32:23 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so7061065a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 17 Nov 2024 23:32:23 -0800 (PST)
Received: from ?IPV6:2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c?
 (p200300e5872eb100d3c7e0c05e3baa1c.dip0.t-ipconnect.de.
 [2003:e5:872e:b100:d3c7:e0c0:5e3b:aa1c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e086098sm508016866b.190.2024.11.17.23.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Nov 2024 23:32:22 -0800 (PST)
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
X-Inumbo-ID: 4060b356-a57f-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQwNjBiMzU2LWE1N2YtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTE1MTQzLjI5Mjc5NSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731915143; x=1732519943; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zLIvsukK/TRFzi7ebaNIhME/PBunNQ8Ehs6kzslE2nQ=;
        b=ZijYfFni0M1LgYTmnkOvVvx7QOTME0DoMzJDTKvz/zYq1a6CqJ0h8WgSAycH0FAQ/X
         76/sVzPnF2v//R1CdOi8I9nAaRVcFcCfhqzx4R+9QtK5UxYa78vTPVrvV1tSHJHttN8z
         neYws9Puwj0JptGRKipXYGkUKCC3y3tP5nRLMNRF4PqvkaeWLSxZVsYCNTz4Hd2SZ1a+
         PCBN4b7EvepZMG4ute4ILPhGL09KJMtQYFgUIFvgGFTDF5D/p9GqC4qOOkKU45bKi+vM
         yURTN4IV1wvPsjnZdzc0YG8eQwGakknegqN/3YtCOxuXaC1W+LvmjPjEGE95eH08v/33
         rG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731915143; x=1732519943;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLIvsukK/TRFzi7ebaNIhME/PBunNQ8Ehs6kzslE2nQ=;
        b=mPsjwIQyn0WfBXt+v/9+DthYTTTjV3g99TGJfKABrHfMMtFyrHzYE2AzfF+DQcZ7HH
         Pp4ODFYuabgNhFvEmmMAtYpi0a4DE98RZOi97kKvAj+l0vqTpcID7TK8PwblEDuTSN7Z
         bIosT6DgwbQge+yphW2sQOyUFcAVjA0XXXYJTNJcrm2yaXQqyhd5vGpCIWWiydoATC3q
         lR8Q8ctADBKRapSXLK+9gGMYikF1gHxZ+PxBEM474EriUSc/z+9b4X+ntWYrmVvfkSy8
         Mpf4ng5dBwNXdHBkDUcdf/CYybqVjOj6i5NUoQhrH1xuGfv35pxp535z22mms3bdP1Ex
         8LtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGSyCoImZTgKy3LJLtB0h1YQg6VWi1DOodtzw0doQVRrNYTZv3IvlPUGN6xclXp62XVwPwI+7kCKE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvqGii/TntK+BAcJ8LEnXjoXpdsp4fbUm9joSLp1cgL3PpG4hh
	SWV89cVqTWCXGVDkQBhcWEtJfq2ROH6Xq4JwZ+Got9kn6xV5VjSTAe6u/XFVC/0=
X-Google-Smtp-Source: AGHT+IEkUNlJ4/YI/S3/igh2YyXNljfz+UTEX1ise8GURprVq1NFrV5WBa/mdDco2poYqN3HqKJGWQ==
X-Received: by 2002:a17:906:a98a:b0:aa4:a810:79c3 with SMTP id a640c23a62f3a-aa4a8107ccbmr356640466b.26.1731915142687;
        Sun, 17 Nov 2024 23:32:22 -0800 (PST)
Message-ID: <9c3f36b2-020e-4b4b-a8c7-97130a5f0945@suse.com>
Date: Mon, 18 Nov 2024 08:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-3-jgross@suse.com>
 <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
 <fadbb6da-a314-4f1b-8a59-92c1c201dd09@suse.com>
 <7b4015a0-9d02-40a9-9919-10e7bdd73291@suse.com>
 <f583e39d-8da4-4cb3-a698-3d982843eafe@xen.org>
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
In-Reply-To: <f583e39d-8da4-4cb3-a698-3d982843eafe@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c0wLo2M2c4Kd3X1nh1o7NY6J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c0wLo2M2c4Kd3X1nh1o7NY6J
Content-Type: multipart/mixed; boundary="------------KdHbKg09o9hx0HB4Ie3V0g0M";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <9c3f36b2-020e-4b4b-a8c7-97130a5f0945@suse.com>
Subject: Re: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-3-jgross@suse.com>
 <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
 <fadbb6da-a314-4f1b-8a59-92c1c201dd09@suse.com>
 <7b4015a0-9d02-40a9-9919-10e7bdd73291@suse.com>
 <f583e39d-8da4-4cb3-a698-3d982843eafe@xen.org>
In-Reply-To: <f583e39d-8da4-4cb3-a698-3d982843eafe@xen.org>
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

--------------KdHbKg09o9hx0HB4Ie3V0g0M
Content-Type: multipart/mixed; boundary="------------RRRq9Kgc9XtGCYEKu9uL2kN0"

--------------RRRq9Kgc9XtGCYEKu9uL2kN0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTEuMjQgMTI6MDEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSmFuICYgSnVl
cmdlbiwNCj4gDQo+IE9uIDA0LzExLzIwMjQgMDk6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4gT24gMDEuMTEuMjAyNCAwNzo0OCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAz
MS4xMC4yNCAxMTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDIzLjEwLjIwMjQg
MTU6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+PiBBZGQgYSBiaXRtYXAgd2l0aCBv
bmUgYml0IHBlciBwb3NzaWJsZSBkb21pZCBpbmRpY2F0aW5nIHRoZSByZXNwZWN0aXZlDQo+
Pj4+PiBkb21haW4gaGFzIGNoYW5nZWQgaXRzIHN0YXRlIChjcmVhdGVkLCBkZWxldGVkLCBk
eWluZywgY3Jhc2hlZCwNCj4+Pj4+IHNodXRkb3duKS4NCj4+Pj4+DQo+Pj4+PiBSZWdpc3Rl
cmluZyB0aGUgVklSUV9ET01fRVhDIGV2ZW50IHdpbGwgcmVzdWx0IGluIHNldHRpbmcgdGhl
IGJpdHMgZm9yDQo+Pj4+PiBhbGwgZXhpc3RpbmcgZG9tYWlucyBhbmQgcmVzZXR0aW5nIGFs
bCBvdGhlciBiaXRzLg0KPj4+Pg0KPj4+PiBUaGF0J3MgZnVydGhlcmluZyB0aGUgInRoZXJl
IGNhbiBiZSBvbmx5IG9uZSBjb25zdW1lciIgbW9kZWwgdGhhdCBhbHNvDQo+Pj4+IGlzIHVz
ZWQgZm9yIFZJUlFfRE9NX0VYQyBpdHNlbGYuIEkgY29uc2lkZXIgdGhlIGV4aXN0aW5nIG1v
ZGVsIGZsYXdlZA0KPj4+PiAobm90aGluZyBrZWVwcyBhIDJuZCBwYXJ0eSB3aXRoIHN1ZmZp
Y2llbnQgcHJpdmlsZWdlIGZyb20gaW52b2tpbmcNCj4+Pj4gWEVOX0RPTUNUTF9zZXRfdmly
cV9oYW5kbGVyIGEgMm5kIHRpbWUsIHRha2luZyBhd2F5IHRoZSBub3RpZmljYXRpb24NCj4+
Pj4gZnJvbSB3aG9ldmVyIGhhZCBmaXJzdCByZXF1ZXN0ZWQgaXQpLCBhbmQgaGVuY2UgSSBk
aXNsaWtlIHRoaXMgYmVpbmcNCj4+Pj4gZXh0ZW5kZWQuIENvbmNlaXZhYmx5IG11bHRpcGxl
IHBhcnRpZXMgbWF5IGluZGVlZCBiZSBpbnRlcmVzdGVkIGluDQo+Pj4+IHRoaXMga2luZCBv
ZiBpbmZvcm1hdGlvbi4gQXQgd2hpY2ggcG9pbnQgcmVzZXR0aW5nIHN0YXRlIHdoZW4gdGhl
IHZJUlENCj4+Pj4gaXMgYm91bmQgaXMgcXVlc3Rpb25hYmxlIChvciB0aGUgZGF0YSB3b3Vs
ZCBuZWVkIHRvIGJlY29tZSBwZXItZG9tYWluDQo+Pj4+IHJhdGhlciB0aGFuIGdsb2JhbCwg
b3IgZXZlbiB5ZXQgbW9yZSBmaW5lLWdyYWluZWQsIGFsYmVpdA0KPj4+PiAtPnZpcnFfdG9f
ZXZ0Y2huW10gaXMgYWxzbyBwZXItZG9tYWluLCB3aGVuIGNvbnNpZGVyaW5nIGdsb2JhbCB2
SVJRLXMpLg0KPj4+DQo+Pj4gVGhlIGJpdG1hcCBpcyBkaXJlY3RseSB0aWVkIHRvIHRoZSBW
SVJRX0RPTV9FWEMgYW55d2F5LCBhcyBpdCBpcyB0aGF0DQo+Pj4gZXZlbnQgd2hpY2ggbWFr
ZXMgdGhlIGNvbnN1bWVyIGxvb2sgaW50byB0aGUgYml0bWFwIHZpYSB0aGUgbmV3IGh5cGVy
Y2FsbC4NCj4+Pg0KPj4+IElmIHdlIGRlY2lkZSB0byBhbGxvdyBtdWx0aXBsZSBjb25zdW1l
cnMgb2YgVklSUV9ET01fRVhDLCB3ZSdsbCBuZWVkIHRvDQo+Pj4gaGF2ZSBvbmUgYml0bWFw
IHBlciBjb25zdW1lciBvZiB0aGUgZXZlbnQuIFRoaXMgaXMgbm90IHZlcnkgaGFyZCB0bw0K
Pj4+IG1vZGlmeS4NCj4gDQo+IFdoaWxlIGluIHByaW5jaXBsZSBJIGFncmVlIHRoYXQgaGF2
aW5nIG11bHRpcGxlIGNvbnN1bWVycyBvZiBWSVJRX0RPTV9FWEMgd291bGQgDQo+IGJlIGdy
ZWF0LiBJIGhhdmUgc29tZSBzY2FsYWJpbGl0eSBjb25jZXJuIGJlY2F1c2Ugbm93IHdlIHdv
dWxkIGVuZCB1cCB0byBoYXZlIHRvIA0KPiB1cGRhdGUgTiBiaXRtYXAgZXZlcnkgdGltZS4g
U28gd2Ugd291bGQgbmVlZCB0byBwdXQgYSBsaW1pdCB0byBOLiBJIGRvbid0IHRoaW5rIA0K
PiB0aGVyZSBpcyBhIGdvb2QgbGltaXQuLi4NCg0KVGhlIHNhbWUgYXBwbGllcyByZWdhcmRp
bmcgc2VuZGluZyBhbiBldmVudC4gSSBkb24ndCB0aGluayB0aGUgYWRkaXRpb25hbA0Kc2V0
dGluZyBvZiBhIGJpdCBpcyBhZGRpbmcgYSByZWxldmFudCBhbW91bnQgb2YgcHJvY2Vzc2lu
ZyB0aW1lLg0KDQpJIGFncmVlIHRoYXQgYSBsaW1pdCBpcyBoYXJkIHRvIGZpbmQsIGJ1dCBp
dCBjb3VsZCBiZSByYXRoZXIgaGlnaC4NCg0KPiBTbyBvdmVyYWxsLCBJIGFtIG5vdCBlbnRp
cmVseSBjb252aW5jZWQgaXQgaXMgd29ydGggdGhlIHRyb3VibGUuDQoNClRoZSBvbmx5IHJl
YWwgcmVhc29uIEkgY291bGQgc2VlIHdvdWxkIGJlIGEgc2V0dXAgd2l0aG91dCBYZW5zdG9y
ZS4gUmVhc29uDQppcyB0aGF0IHdpdGggWGVuc3RvcmUgYWxsIGludGVyZXN0ZWQgcGFydGll
cyBjb3VsZCByZWdpc3RlciBhIHdhdGNoIGV2ZW50DQppbnN0ZWFkIG9mIGRpcmVjdGx5IGNv
bnN1bWluZyB0aGUgVklSUV9ET01fRVhDIGV2ZW50Lg0KDQpXZSBoYXZlbid0IG5lZWRlZCBt
dWx0aXBsZSBWSVJRX0RPTV9FWEMgY29uc3VtZXJzIHVwIHRvIG5vdywgc28gSSBkb24ndA0K
dGhpbmsgd2Ugc2hvdWxkIG92ZXItZW5naW5lZXIgdGhlIGludGVyZmFjZS4gQXQgbGVhc3Qg
dGhlcmUgaXMgYSB0aGVvcmV0aWNhbA0Kc29sdXRpb24gZm9yIG11bHRpcGxlIGNvbnN1bWVy
cywgc28gbXkgcGF0Y2ggc2VyaWVzIHdvdWxkbid0IGludHJvZHVjZSBhDQpuby1nbyBmb3Ig
bXVsdGlwbGUgY29uc3VtZXJzLg0KDQoNCkp1ZXJnZW4NCg==
--------------RRRq9Kgc9XtGCYEKu9uL2kN0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RRRq9Kgc9XtGCYEKu9uL2kN0--

--------------KdHbKg09o9hx0HB4Ie3V0g0M--

--------------c0wLo2M2c4Kd3X1nh1o7NY6J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmc67YUFAwAAAAAACgkQsN6d1ii/Ey+6
XQgAja+++sYCZJCCEHhjeP23q7FgwNQ/6Dhk/+eSZiRhvcWrS8DsIhkWAsqVPauynQs1utiIUVvo
sVYg0CKjiVo4y7yQlYnND5e66O7sxF29XgEEIr+0osDn/2gNSkUGy9MhSqeVsAp7gMGvnRFPtoqL
5J1NmeMmsIyQHfLP0KBnXFUGxJ8uBuUAWxcUJpTBjJWwMW86Ip7kjWdJt1znjuScf4y2ckHrgybr
AoEBzjRBof4or8ChRBP43SCT5hlIBidP8qS4yCMGT9f+3AH7EqDqYa5j7PWYebPWRP6BPXzP0GIX
SdDFcaiqw95Mz51bKOjjYm7Q3Vf/bGApjNg6fZzQGw==
=1TXg
-----END PGP SIGNATURE-----

--------------c0wLo2M2c4Kd3X1nh1o7NY6J--

