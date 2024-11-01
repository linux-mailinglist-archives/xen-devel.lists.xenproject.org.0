Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF89B8B58
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 07:48:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828954.1244060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6lSC-0001rk-B7; Fri, 01 Nov 2024 06:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828954.1244060; Fri, 01 Nov 2024 06:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6lSC-0001oZ-7z; Fri, 01 Nov 2024 06:48:16 +0000
Received: by outflank-mailman (input) for mailman id 828954;
 Fri, 01 Nov 2024 06:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t6lSA-0001oT-Os
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 06:48:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 420b9c00-981d-11ef-99a3-01e77a169b0f;
 Fri, 01 Nov 2024 07:48:10 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso13231835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 23:48:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431b43ab29csm96212715e9.0.2024.10.31.23.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 23:48:09 -0700 (PDT)
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
X-Inumbo-ID: 420b9c00-981d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQyMGI5YzAwLTk4MWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwNDQzNjkwLjM2NTc5LCJzZW5kZXIiOiJqZ3Jvc3NAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730443690; x=1731048490; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GuhMa+CTVdUdvC1OJ9ceEoQ3Vm5ra1p1KWx5hpWZL58=;
        b=Q1kIovHfWxIWlMFKGjBeHhECfLPksEPfgpB4jMbrIUQPfWPQPs5mwvQtIxQjasQ5rr
         l58sJpbiWHbeSewEvkGTcYKV+a9MBltnoF9cPwz7NyGUy2mvdSj6vhhSyXxdW7v2ajgI
         vhbBJUrgVS0y0npHCCE787BIvLlAaWkMKTiosxZ2zw9XHbrbP+ehmcY+JIZiv2mkM70b
         8uoih6+aanp6LjxFQXqAzN/ohL8gDg7TL9lNwlLPAavrJN5z9ASIGzNlcdBpgJCW96id
         KtC17bN+i27weEaXA722hEECkZnf0hE8AOROn+q6eV1di4qv7bSv5POWqZayBZS5/spC
         VwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730443690; x=1731048490;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuhMa+CTVdUdvC1OJ9ceEoQ3Vm5ra1p1KWx5hpWZL58=;
        b=AIQ21zdurT1pwDCBrR4afHs6CCKO5ECAsn2xw/5/W982A4UoRe5Mqp7F1diEvzA+sE
         W8LI9um3xdIUSa+QfQ0+apFs5lxy3FF0KK04QNz0wBEm7cTvx4WFe2C4SZEkUr/f2C0c
         e0Zn1/zU2hNdRWWfvZG2cAN+wjXMASgL4pur/id5FUUN+ohYwIX60iTxw0AHSvoLc+IU
         9sqdFdYPTdTAbVuATwBPFHSN+PnpOlw2o28pmOR+Qoxk+A9CPEuqen4nea3eIopMr1Rk
         l4BlMR+hFvTEND52BzfZ/eUmllbEoHmlNWCmkaQgp6EIoMGx4XUe+WsVI3WkrZ7mzDee
         oT0w==
X-Forwarded-Encrypted: i=1; AJvYcCXCQoWdlyXWnf/+zp6cJOr/bcLZIhdWjPiCNUleMv6Olq8PV26Vj/ilMS1eGfURL6Vj4x5xoeLEhEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzg1LN0jWBonK/qz3mg16q9H+vn59yt0BpQxAWk2jBWR/S3ZjU9
	d4O96fnpMTkE0I6CXsaeg1/ACf5FuIuQah/wmMaLvJIw8++5m1Lxjea+zRZOgTs=
X-Google-Smtp-Source: AGHT+IEAs7KZ66W5MvBX6Rf2Cn4toav3U4ObBntEDvTrwo/DCRKe2E+c7yrmBVZW1XN5HmvKJcCaYg==
X-Received: by 2002:a05:600c:3c8c:b0:426:60b8:d8ba with SMTP id 5b1f17b1804b1-4319ad04990mr183077475e9.28.1730443689531;
        Thu, 31 Oct 2024 23:48:09 -0700 (PDT)
Message-ID: <fadbb6da-a314-4f1b-8a59-92c1c201dd09@suse.com>
Date: Fri, 1 Nov 2024 07:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-3-jgross@suse.com>
 <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
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
In-Reply-To: <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lJLlPK55tdgeLDHyzKHgvXdB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lJLlPK55tdgeLDHyzKHgvXdB
Content-Type: multipart/mixed; boundary="------------uiWOMzxdurhS00Ka09GIvmut";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <fadbb6da-a314-4f1b-8a59-92c1c201dd09@suse.com>
Subject: Re: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-3-jgross@suse.com>
 <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
In-Reply-To: <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
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

--------------uiWOMzxdurhS00Ka09GIvmut
Content-Type: multipart/mixed; boundary="------------RcYY6GT8YXfb1gEF2H4O6AVd"

--------------RcYY6GT8YXfb1gEF2H4O6AVd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMTAuMjQgMTE6NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4xMC4yMDI0
IDE1OjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgYml0bWFwIHdpdGggb25l
IGJpdCBwZXIgcG9zc2libGUgZG9taWQgaW5kaWNhdGluZyB0aGUgcmVzcGVjdGl2ZQ0KPj4g
ZG9tYWluIGhhcyBjaGFuZ2VkIGl0cyBzdGF0ZSAoY3JlYXRlZCwgZGVsZXRlZCwgZHlpbmcs
IGNyYXNoZWQsDQo+PiBzaHV0ZG93bikuDQo+Pg0KPj4gUmVnaXN0ZXJpbmcgdGhlIFZJUlFf
RE9NX0VYQyBldmVudCB3aWxsIHJlc3VsdCBpbiBzZXR0aW5nIHRoZSBiaXRzIGZvcg0KPj4g
YWxsIGV4aXN0aW5nIGRvbWFpbnMgYW5kIHJlc2V0dGluZyBhbGwgb3RoZXIgYml0cy4NCj4g
DQo+IFRoYXQncyBmdXJ0aGVyaW5nIHRoZSAidGhlcmUgY2FuIGJlIG9ubHkgb25lIGNvbnN1
bWVyIiBtb2RlbCB0aGF0IGFsc28NCj4gaXMgdXNlZCBmb3IgVklSUV9ET01fRVhDIGl0c2Vs
Zi4gSSBjb25zaWRlciB0aGUgZXhpc3RpbmcgbW9kZWwgZmxhd2VkDQo+IChub3RoaW5nIGtl
ZXBzIGEgMm5kIHBhcnR5IHdpdGggc3VmZmljaWVudCBwcml2aWxlZ2UgZnJvbSBpbnZva2lu
Zw0KPiBYRU5fRE9NQ1RMX3NldF92aXJxX2hhbmRsZXIgYSAybmQgdGltZSwgdGFraW5nIGF3
YXkgdGhlIG5vdGlmaWNhdGlvbg0KPiBmcm9tIHdob2V2ZXIgaGFkIGZpcnN0IHJlcXVlc3Rl
ZCBpdCksIGFuZCBoZW5jZSBJIGRpc2xpa2UgdGhpcyBiZWluZw0KPiBleHRlbmRlZC4gQ29u
Y2VpdmFibHkgbXVsdGlwbGUgcGFydGllcyBtYXkgaW5kZWVkIGJlIGludGVyZXN0ZWQgaW4N
Cj4gdGhpcyBraW5kIG9mIGluZm9ybWF0aW9uLiBBdCB3aGljaCBwb2ludCByZXNldHRpbmcg
c3RhdGUgd2hlbiB0aGUgdklSUQ0KPiBpcyBib3VuZCBpcyBxdWVzdGlvbmFibGUgKG9yIHRo
ZSBkYXRhIHdvdWxkIG5lZWQgdG8gYmVjb21lIHBlci1kb21haW4NCj4gcmF0aGVyIHRoYW4g
Z2xvYmFsLCBvciBldmVuIHlldCBtb3JlIGZpbmUtZ3JhaW5lZCwgYWxiZWl0DQo+IC0+dmly
cV90b19ldnRjaG5bXSBpcyBhbHNvIHBlci1kb21haW4sIHdoZW4gY29uc2lkZXJpbmcgZ2xv
YmFsIHZJUlEtcykuDQoNClRoZSBiaXRtYXAgaXMgZGlyZWN0bHkgdGllZCB0byB0aGUgVklS
UV9ET01fRVhDIGFueXdheSwgYXMgaXQgaXMgdGhhdA0KZXZlbnQgd2hpY2ggbWFrZXMgdGhl
IGNvbnN1bWVyIGxvb2sgaW50byB0aGUgYml0bWFwIHZpYSB0aGUgbmV3IGh5cGVyY2FsbC4N
Cg0KSWYgd2UgZGVjaWRlIHRvIGFsbG93IG11bHRpcGxlIGNvbnN1bWVycyBvZiBWSVJRX0RP
TV9FWEMsIHdlJ2xsIG5lZWQgdG8NCmhhdmUgb25lIGJpdG1hcCBwZXIgY29uc3VtZXIgb2Yg
dGhlIGV2ZW50LiBUaGlzIGlzIG5vdCB2ZXJ5IGhhcmQgdG8NCm1vZGlmeS4NCg0KSWYgeW91
J2QgbGlrZSB0aGF0IGJldHRlciwgSSBjYW4gZHluYW1pY2FsbHkgYWxsb2NhdGUgdGhlIGJp
dG1hcCBvbg0KYmluZGluZyBWSVJRX0RPTV9FWEMgYW5kIGZyZWVpbmcgaXQgYWdhaW4gd2hl
biB1bmJpbmRpbmcgaXMgZG9uZS4NCg0KPiANCj4+IC0tLSBhL3hlbi9jb21tb24vZG9tYWlu
LmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4+IEBAIC0xMzgsNiArMTM4LDIy
IEBAIGJvb2wgX19yZWFkX21vc3RseSB2bXRyYWNlX2F2YWlsYWJsZTsNCj4+ICAgDQo+PiAg
IGJvb2wgX19yZWFkX21vc3RseSB2cG11X2lzX2F2YWlsYWJsZTsNCj4+ICAgDQo+PiArc3Rh
dGljIERFQ0xBUkVfQklUTUFQKGRvbV9zdGF0ZV9jaGFuZ2VkLCBET01JRF9NQVNLICsgMSk7
DQo+IA0KPiBXaGlsZSBpdCB3b24ndCBhbHRlciB0aGUgc2l6ZSBvZiB0aGUgYXJyYXksIEkg
dGhpbmsgRE9NSURfRklSU1RfUkVTRVJWRUQNCj4gd291bGQgYmUgbW9yZSBsb2dpY2FsIHRv
IHVzZSBoZXJlIGFuZCAuLi4NCj4gDQo+PiArdm9pZCBkb21haW5fcmVzZXRfc3RhdGVzKHZv
aWQpDQo+PiArew0KPj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkOw0KPj4gKw0KPj4gKyAgICBi
aXRtYXBfemVybyhkb21fc3RhdGVfY2hhbmdlZCwgRE9NSURfTUFTSyArIDEpOw0KPiANCj4g
Li4uIGhlcmUuDQoNCkZpbmUgd2l0aCBtZS4NCg0KPiANCj4+ICsgICAgcmN1X3JlYWRfbG9j
aygmZG9tbGlzdF9yZWFkX2xvY2spOw0KPj4gKw0KPj4gKyAgICBmb3JfZWFjaF9kb21haW4g
KCBkICkNCj4+ICsgICAgICAgIHNldF9iaXQoZC0+ZG9tYWluX2lkLCBkb21fc3RhdGVfY2hh
bmdlZCk7DQo+IA0KPiBkIGlzIHVzZWQgb25seSBoZXJlLCBzbyBjb3VsZCBiZSBwb2ludGVy
LXRvLWNvbnN0Pw0KDQpBZ3JlZWQuDQoNCj4gDQo+PiAtLS0gYS94ZW4vY29tbW9uL2V2ZW50
X2NoYW5uZWwuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVsLmMNCj4+IEBA
IC0xMjk2LDYgKzEyOTYsOCBAQCBsb25nIGRvX2V2ZW50X2NoYW5uZWxfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICAgcmMgPSBl
dnRjaG5fYmluZF92aXJxKCZiaW5kX3ZpcnEsIDApOw0KPj4gICAgICAgICAgIGlmICggIXJj
ICYmIF9fY29weV90b19ndWVzdChhcmcsICZiaW5kX3ZpcnEsIDEpICkNCj4+ICAgICAgICAg
ICAgICAgcmMgPSAtRUZBVUxUOyAvKiBDbGVhbmluZyB1cCBoZXJlIHdvdWxkIGJlIGEgbWVz
cyEgKi8NCj4+ICsgICAgICAgIGlmICggIXJjICYmIGJpbmRfdmlycS52aXJxID09IFZJUlFf
RE9NX0VYQyApDQo+PiArICAgICAgICAgICAgZG9tYWluX3Jlc2V0X3N0YXRlcygpOw0KPiAN
Cj4gZXZ0Y2huX2JpbmRfdmlycSgpIGlzbid0IHN0YXRpYywgc28gY2FsbGVycyBiZXlvbmQg
dGhlIHByZXNlbnQgb25lcyBjb3VsZA0KPiBhcHBlYXIgd2l0aG91dCBub3RpY2luZyB0aGUg
bmVlZCBmb3IgdGhpcyBzcGVjaWFsIGNhc2luZy4gSXMgdGhlcmUgYSByZWFzb24NCj4gdGhl
IGNoZWNrIGNhbid0IG1vdmUgaW50byB0aGUgZnVuY3Rpb24/IERvaW5nIHRoZSBjaGVjayBp
biBzcGl0ZSBvZiB0aGUNCj4gY29weS1vdXQgZmFpbGluZyBpcyBpbW8gc3RpbGwgcmVhc29u
YWJsZSBiZWhhdmlvci4NCg0KTW92aW5nIHRoZSB0ZXN0IGludG8gZXZ0Y2huX2JpbmRfdmly
cSgpIHNob3VsZCB3b3JrLiBJJ2xsIGNoYW5nZSB0aGF0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------RcYY6GT8YXfb1gEF2H4O6AVd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RcYY6GT8YXfb1gEF2H4O6AVd--

--------------uiWOMzxdurhS00Ka09GIvmut--

--------------lJLlPK55tdgeLDHyzKHgvXdB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmckeagFAwAAAAAACgkQsN6d1ii/Ey+s
FAf/S8s4NkqsdlzsUtRxUXawT3riuF8AxweF73fsqFxHFv6wWPKjsErAh2IYDgQYSowR9FYHOo17
XJAPt0WdL2uPy8H9Ey7EhxcTC8m0CommEjPTKqLz1yciZn01EGo+kCG72Q/LkiHSI2h4IG7mjeaj
2gXTTJl0dnSx07ExU4RjR8FHow+F2R13SZmZGlI8lEoyTfT0GULEHsAVKEGPzgR+Z7j11yYME9At
xuBjpk9gHPPR0eLwNLrcVQHbRBQkoFxWoVMpGXThtqqNPze0BzX3lv9X/5cwW0wDi6WK3scaaxOj
zp+6NYNe215jEG60+uOdcEiVqm+jtsqg6vr5YLKE2A==
=j6Hx
-----END PGP SIGNATURE-----

--------------lJLlPK55tdgeLDHyzKHgvXdB--

