Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635F6CCCDA3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 17:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189951.1510668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWH9s-0004i2-Kx; Thu, 18 Dec 2025 16:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189951.1510668; Thu, 18 Dec 2025 16:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWH9s-0004fG-Ga; Thu, 18 Dec 2025 16:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1189951;
 Thu, 18 Dec 2025 16:47:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2jZQ=6Y=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vWH9q-0004f4-Tj
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 16:47:19 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3517b486-dc31-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 17:47:15 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso7612465e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 08:47:15 -0800 (PST)
Received: from ?IPV6:2003:e5:8704:4800:66fd:131f:60bd:bc29?
 (p200300e58704480066fd131f60bdbc29.dip0.t-ipconnect.de.
 [2003:e5:8704:4800:66fd:131f:60bd:bc29])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43244934cf5sm6040130f8f.1.2025.12.18.08.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 08:47:14 -0800 (PST)
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
X-Inumbo-ID: 3517b486-dc31-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766076434; x=1766681234; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FB3d2UXrn6QNPu2RU+HOWmQ9NcPnXZYajbjLYUnejoA=;
        b=fJOjuZIRcaoEYb7EBPDcZl4K5TmggkIgqWpgFLE10g6YyMALMk95caHO+xrHsT/UAP
         QFvBJ9/xczwoSkvE2xm/JW7Byk3fukJSuJLfDwYq5F5eXTfqixeWY9ErmqGh95sV5Jh4
         e/ovqhMUJa4qxoNSue03A5AC5zU4lISMCj9hbcKCJ476Me+OjPoN7M93XrPivMCkgfAk
         V9LSt7tmeO+0fFBh6FxhQd7E0+Dxgs5gn/yFI5RjEc5W4HMK0HeOmif9eC6DnUnecRvl
         8zNZjb/kQjZ+7u+L/PUPeClqRzDK8+5WlPLilzmv1RmrZRUgaJu+PZR5Cfp4xeO40RGX
         FuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766076434; x=1766681234;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FB3d2UXrn6QNPu2RU+HOWmQ9NcPnXZYajbjLYUnejoA=;
        b=m+trPit1L9AmoqFjeZ4HlUQHW1DWWu6b47hYB+LzVrTgpVcIIvu7XZclrWlzOu4x+0
         Dkc0PQb2vBpvglT38oUKac5FqhmybV3BpGY+kjcOwkq0BXzaKSa5QPK6de84+8EV5orb
         pnwJgf8FkzIS20i2+cqZx+8dEW7bKwr2aL3N2NMGUhwtRPzJH+h9idYobkTVeTXngyou
         8mfmgQzWGhmyyZBhzMvC2R6U69uCNJtQ/2D7sHBijaP5HZ3x0aCCCxlt9ytEKWPJlKMM
         ErlxdIa4QIObZdQafA6+3904qI85FXJSze6gSJI6IhXU8DdxMN8cjG0bjim/P71tgQrq
         GrQg==
X-Forwarded-Encrypted: i=1; AJvYcCUNc/VtOOi4xH5O8j7fFLrDiieguKAaakUWuM8Jh8PROQDBgzU2LBmclgNIj9ku4D2yDEu+tEL7BKE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8NzXrHT6pS5hWDdkpBFHvAUhCdLH7HDKFu849iuYpkIlBFtwu
	YQpDTvdh9W9yr6bGlP1jpXT8V63iwwFUKcStrZhpmet9aDnilFBWnw3/iD5Mlj5Bqyc=
X-Gm-Gg: AY/fxX7o+GWtsmv99ikG2ljLKAItoCenx7vOlLbdzTiKfD9UfUfF+0Ttt7k7TF08hIE
	KHzNPp3ygq8CYg3txaCQ10zIm+TwhKPJgXgS5wQlyqCQTdL2PZ4Q9iBMszWd2pHDd4Y4375buMM
	MRCbA9WfMAk8VoqFKVIMF4/W0tqRBqMtQWmvehHvazInSLxaJ7BdvfmOj/gZSU8Jr1AKJwfFuUY
	iiJfYylOdio5+arFwdXX4zld8bmBMx45prowgoL46WRHSd0Yz9XjRr7KvVSErWv3FjGvf1EBv4e
	lOiIsh7Wx4IpXHKCr3E96qY16+sBkemJ35gvwQt97BXKdUDykh2dow1fnZU/O8ZY6cO1VebBAgo
	6B529O7L+5FJUbRAAVqc3t73ln7enHLBItZIVkXVmTJdbbefiCAnAO7BXDmYqdWLIVW5+GjlXDT
	E/TJgyCYL5bOp1tD4Vf3odXGbYPY4emsXvKUfZvWFZtrthk/CJxLl4A9hPQ5TDdo4juxXNj11sD
	xH4EPDl1M/Qq1o+Ia86+HnSDu7jtu+CD0Z35Xw=
X-Google-Smtp-Source: AGHT+IE19V69WUGKEdt+kxyVhn1H0rirTiz0lfBE7JtW6AZv7hmL/cks2d7b/BnbGmdaq3yAXERfXQ==
X-Received: by 2002:a05:6000:188e:b0:430:fb26:3409 with SMTP id ffacd0b85a97d-4324e703d95mr117946f8f.63.1766076434486;
        Thu, 18 Dec 2025 08:47:14 -0800 (PST)
Message-ID: <0b286e09-ec6d-4736-b339-98b8f6540cbf@suse.com>
Date: Thu, 18 Dec 2025 17:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2 3/4] x86: hvm: factor out COMPAT code under ifdefs
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <20251119192916.1009549-4-grygorii_strashko@epam.com>
 <389a5a3f-59c4-4292-847b-6c73fb9cd345@epam.com>
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
In-Reply-To: <389a5a3f-59c4-4292-847b-6c73fb9cd345@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p0v0fdwKvs3zvUNyxGqsCfFv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p0v0fdwKvs3zvUNyxGqsCfFv
Content-Type: multipart/mixed; boundary="------------DPPNFVKMaRQKzHnahC5hwiLY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <0b286e09-ec6d-4736-b339-98b8f6540cbf@suse.com>
Subject: Re: [XEN][PATCH v2 3/4] x86: hvm: factor out COMPAT code under ifdefs
References: <20251119192916.1009549-1-grygorii_strashko@epam.com>
 <20251119192916.1009549-4-grygorii_strashko@epam.com>
 <389a5a3f-59c4-4292-847b-6c73fb9cd345@epam.com>
In-Reply-To: <389a5a3f-59c4-4292-847b-6c73fb9cd345@epam.com>
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

--------------DPPNFVKMaRQKzHnahC5hwiLY
Content-Type: multipart/mixed; boundary="------------UgQWf7EhY45yGFdAm7Yq0uXI"

--------------UgQWf7EhY45yGFdAm7Yq0uXI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjUgMTk6NDcsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPiBIaSBKw7xy
Z2VuLA0KPiANCj4gV291bGQgaXQgYmUgcG9zc2libGUgZm9yIHlvdSB0byB0YWtlIGEgbG9v
ayBhdCBoeXBlcmNhbGwtZGVmcy5jIGNoYW5nZXM/DQo+IA0KPiBPbiAxOS4xMS4yNSAyMToz
MCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6DQo+PiBGcm9tOiBHcnlnb3JpaSBTdHJhc2hr
byA8Z3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20+DQo+Pg0KPj4gRmFjdG9yIG91dCBDT01Q
QVQgSFZNIGNvZGUgdW5kZXIgaWZkZWZzIGluIHByZXBhcmF0aW9uIGZvciBtYWtpbmcgSFZN
DQo+PiBDT01QQVQgY29kZSBvcHRpb25hbC4NCj4+DQo+PiAtIGh5cGVyY2FsbC1kZWZzLmMg
dXBkYXRlZCB0byBhbHdheXMgcHJvdmlkZSBjb21wYXQgZGVjbGFyYXRpb24gZm9yOg0KPj4g
cGh5c2Rldl9vcCwgZ3JhbnRfdGFibGVfb3AsIGdyYW50X3RhYmxlX29wLiBUaGlzIHJlZHVj
ZXMgbnVtYmVyIG9mIENPTVBBVA0KPj4gaWZkZWZzIGluIEhWTSBjb2RlIGFuZCBsZXRzIGNv
bXBpbGVyIERDRSBkbyB0aGUgam9iLg0KPj4NCj4+IC0gT25seSA2NC1iaXQgc2hpbmZvIGlz
IHN1cHBvcnRlZCB3aXRoIENPTVBBVD1uLCBzbyBzdHJ1Y3QNCj4+IGFyY2hfZG9tYWluLT5o
YXNfMzJiaXRfc2hpbmZvIGZpZWxkIGlzIG1vdmVkIHVuZGVyIENPTVBBVCBpZmRlZiBhbmQN
Cj4+IGhhc18zMmJpdF9zaGluZm8oKSBpcyB1cGRhdGVkIHRvIGFjY291bnQgZm9yIENPTVBB
VD1uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEdyeWdvcmlpIFN0cmFzaGtvIDxncnlnb3Jp
aV9zdHJhc2hrb0BlcGFtLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4gIyB4ZW4vaW5jbHVkZS9oeXBlcmNhbGwtZGVmcy5jDQoNCg0KSnVl
cmdlbg0K
--------------UgQWf7EhY45yGFdAm7Yq0uXI
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------UgQWf7EhY45yGFdAm7Yq0uXI--

--------------DPPNFVKMaRQKzHnahC5hwiLY--

--------------p0v0fdwKvs3zvUNyxGqsCfFv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmlEMBEFAwAAAAAACgkQsN6d1ii/Ey/2
fwf/ZAM7ybjqCiBMCTULVAnhfGwqSG03pKI7rPX2M0yqUzGtLdnUykA10OofLzGZC7JgdTU2O8IH
Z4bNuACFikSWoRPMpkx/gl0SDvZC5CdPLxxk12WLWNdWNB+52hlSKVg1e/qifp1tQTPQ7qXsOorb
qQ4KRU9lgwjIUW+PPdY1hYXmn1QcFjs3ihL4Sia7LQvNePqoqiX/JVVjmKELEnd5CdAHYKkjvPd9
9hmqOAwd1YebRUHOzRwx39KETTpLygaa3QxnhD7I+v0BtFg7aSgJCCt/iyDLBhfQutq3IlZgrmn8
jI51nxnm33A1Szm+BlyzCgi3RVIk+DNKaUXOFbiviQ==
=tIvv
-----END PGP SIGNATURE-----

--------------p0v0fdwKvs3zvUNyxGqsCfFv--

