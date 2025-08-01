Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FE6B17C53
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 07:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066804.1431869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhiIE-0006V9-Cb; Fri, 01 Aug 2025 05:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066804.1431869; Fri, 01 Aug 2025 05:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhiIE-0006TM-8a; Fri, 01 Aug 2025 05:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1066804;
 Fri, 01 Aug 2025 05:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zRMe=2N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uhiIC-0006TC-Fh
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 05:26:56 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22d49b7b-6e98-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 07:26:54 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b792b0b829so356074f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 22:26:54 -0700 (PDT)
Received: from ?IPV6:2003:e5:872d:3c00:27e3:fc0:fb5:67a3?
 (p200300e5872d3c0027e30fc00fb567a3.dip0.t-ipconnect.de.
 [2003:e5:872d:3c00:27e3:fc0:fb5:67a3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee4f0f8sm50821145e9.15.2025.07.31.22.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 22:26:53 -0700 (PDT)
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
X-Inumbo-ID: 22d49b7b-6e98-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754026014; x=1754630814; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xyc8VfwE+9GoTYTlyessa6tXeEN09Y4rCFfq14fq/+k=;
        b=M2ulkEhrItK9s5B42Sa8ZR6VH8D+0BNE3WKb+H6YhaH0SAd6LtPCePk967EZ0K8F7J
         oCdcoDBh5CCv17P9WWcPntPCcasi7fD0NlOf8qmKcMPB6T7TlslsLormtSPdhlYe2qY9
         DUGHTbyg94WPgGPhYKA/OcErtorTEsWGnmyKopQjtmZO7GMQjkfX+c0Cf2yP2vmWhLuX
         Ruzk4yy3lNSd/omm37WAo2XTCF+lNSA5xF/EX8E7SAf0g7SEUvudYbOie2ORyNlxdA9N
         KN+GBbsWZhAD6jgG+TVpUM29061o60jrdEphiQ+uX1ckIsdB/zheqSZIBwYf2ihVhhj2
         Gp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754026014; x=1754630814;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyc8VfwE+9GoTYTlyessa6tXeEN09Y4rCFfq14fq/+k=;
        b=g40VFEutP2hq8RE3Qs6xK5Zhi4QjAL/OXf8hvPXvb6cBPzn60KgqXvJzGFJaNfMpj0
         bpkzLvinf4LFyaniLIE7uN9GfFvRKdOnAsdddx4bdhtNSGKS+gmS/ritcFVBHNb7PJ20
         WwvfakGQyeTqzLLksuNEaJGPesPKqu32apVCvD484ENXRlVpWrnNisjMO9ub3Yzwe0h4
         FP0x96EXMs2rA4gQNXzBgpCIU45WUe7o1JPy6gMHfDf5UEWDDu/AsmZ7Ay0wobhjEJcS
         +Br+UTva3SLW1C+0I1vYmj2xU1315d22Q8smQgs6ePCedd1n+JCYSWQijV5sEb0d6bBj
         hNXA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ742zLZ/d8UGm8fV3piWh4ve0udSaOBwHz3k3KtqiEloi/WawiQ48alSSNNOLdfPGgEreHiL6i10=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweP31ZKarLOk/g/SCOrJUq9YjkBHkKBRFWhMl8p0rQEsdm2slQ
	LqhuQIdEUToPOMpq5rCkRUzrdgULWMEP/k/KRJxuEdvE0b2zvZq/M44ICAVxAfrpUCs=
X-Gm-Gg: ASbGncsdaGVFZ1De6UVoPe/h9s1CInTjGKKaU7M+x4zpezzTNRwsy+qiHBXJ02BacQB
	AOFMJ5RWEKhF/5mtJx3vK/KKZdANeeXzgpsHg9KKfLcw4CNcMzKGuGCqz43zb/g4JSfhP3sCiSO
	a2BnU0sRpyteLVP6P2xWzMIjQ9RWxELZkAEwbw1+LM8c/j+KALUad9m9pzVRphLR3ZkFDjQVx1g
	NGR6kuFSPtYEpaYg6WBWPm0WaaVKkdPbNhc+/KoCgYbCxB9vJFDUkGZ7LZyffzxLvHIQEXlbLDk
	SOl3NPuoUg0jm6Hd66GcXX979UPLzYkulXGsKXmNr6Wcp3b/0fxxBsmOVqkuaoYlEh8VX55RI4h
	+N3DzuJ9r2SNYdUydnGWh2VjIsZr56qofTs5nfhBb4Ae5x5ncII7VMe/ZDoY+VhGV/n2x6Cu42e
	xlnaZkMN8FZy9WLzENocehH2YrW+/vActH9BoRQRkQww==
X-Google-Smtp-Source: AGHT+IEkhhECVd/9Q9WcSDDtqAO+UydUniWZXbdW6cAtkTYsNoggy7Q/0cFNREp9robtYztteWpPNw==
X-Received: by 2002:a5d:5f85:0:b0:3b7:87be:d9d8 with SMTP id ffacd0b85a97d-3b79500ef36mr7394064f8f.43.1754026014166;
        Thu, 31 Jul 2025 22:26:54 -0700 (PDT)
Message-ID: <2dd66d50-0804-4c4b-b5e9-5dd8efb27da1@suse.com>
Date: Fri, 1 Aug 2025 07:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <34320c56-8c79-45d4-910c-2faa5ed4ac0b@suse.com>
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
In-Reply-To: <34320c56-8c79-45d4-910c-2faa5ed4ac0b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dgUcIXRa1XjzNC9A0HdOtVz2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dgUcIXRa1XjzNC9A0HdOtVz2
Content-Type: multipart/mixed; boundary="------------kv3oNgFE2TsryMcUjS7I9f2s";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <2dd66d50-0804-4c4b-b5e9-5dd8efb27da1@suse.com>
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <34320c56-8c79-45d4-910c-2faa5ed4ac0b@suse.com>
In-Reply-To: <34320c56-8c79-45d4-910c-2faa5ed4ac0b@suse.com>
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

--------------kv3oNgFE2TsryMcUjS7I9f2s
Content-Type: multipart/mixed; boundary="------------tN95QAGW1W4FT3ZXMOFobS74"

--------------tN95QAGW1W4FT3ZXMOFobS74
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMDcuMjUgMTc6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMS4wNy4yMDI1
IDE3OjE2LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vZ3Vlc3Rjb3B5LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9ndWVzdGNvcHkuYw0KPj4g
QEAgLTEwOSwyNyArMTA5LDMxIEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGNvcHlfZ3Vlc3Qo
dm9pZCAqYnVmLCB1aW50NjRfdCBhZGRyLCB1bnNpZ25lZCBpbnQgbGVuLA0KPj4gICANCj4+
ICAgdW5zaWduZWQgbG9uZyByYXdfY29weV90b19ndWVzdCh2b2lkICp0bywgY29uc3Qgdm9p
ZCAqZnJvbSwgdW5zaWduZWQgaW50IGxlbikNCj4+ICAgew0KPj4gKyAgICBzdHJ1Y3QgdmNw
dSAqY3VycmVudF92Y3B1ID0gY3VycmVudDsNCj4gDQo+IFRoZSBjb21tb25seSB1c2VkIG5h
bWUgZm9yIHRoaXMga2luZCBvZiB2YXJpYWJsZSBpcyBjdXJyLiBBbHNvIHdoZXJldmVyDQo+
IHlvdSBpbnRyb2R1Y2Ugb25lIGFuZXcsIGl0IHdvdWxkIHByZWZlcmFibHkgYmUgcG9pbnRl
ci10by1jb25zdCB3aGVuDQo+IHBvc3NpYmxlLiAoVGhpcyBpc24ndCBhIHJlcXVlc3QgdG8g
cmVuYW1lIG9yIHJlLXR5cGUgZXhpc3RpbmcgdmFyaWFibGVzDQo+IHJpZ2h0IGhlcmUuKQ0K
PiANCj4+IEBAIC0xODk5LDYgKzE4OTksNyBAQCB0eXBlZGVmIGxvbmcgcmV0X3Q7DQo+PiAg
IHJldF90IGRvX3NjaGVkX29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9p
ZCkgYXJnKQ0KPj4gICB7DQo+PiAgICAgICByZXRfdCByZXQgPSAwOw0KPj4gKyAgICBzdHJ1
Y3QgdmNwdSAqdiA9IGN1cnJlbnQ7DQo+IA0KPiBJIHdvbmRlciBpZiB0aGlzIHdhc24ndCBi
ZXR0ZXIgaW50cm9kdWNlZCBpbiB0aGUgdHdvIHNjb3BlcyB0aGF0IGFjdHVhbGx5DQo+IG5l
ZWQgaXQuDQoNCkknZCBiZSBpbiBmYXZvciBvZiBrZWVwaW5nIGl0IGluIGZ1bmN0aW9uIHNj
b3BlLCBidXQgd2l0aCByZXBsYWNpbmcgYWxsDQpyZWZlcmVuY2VzIG9mICJjdXJyZW50IiBp
biB0aGlzIGZ1bmN0aW9uIHdpdGggInYiLiBEb2luZyB0aGUgc2FtZSBpbg0KdmNwdV95aWVs
ZCgpIHNob3dzIHRoZSBmb2xsb3dpbmcgY29kZSByZWR1Y3Rpb25zOg0KDQpibG9hdC1vLW1l
dGVyIGNvcmUtb3JpZy5vIGNvcmUubw0KYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAw
LzMgdXAvZG93bjogMC8tMTYwICgtMTYwKQ0KRnVuY3Rpb24gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQ0KdmNwdV95aWVsZCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDU1ICAgICA0NDkgICAgICAtNg0KZG9f
c2NoZWRfb3AgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAxMjE2ICAgIDExMzkg
ICAgIC03Nw0KY29tcGF0X3NjaGVkX29wICAgICAgICAgICAgICAgICAgICAgICAgICAgICAx
MjExICAgIDExMzQgICAgIC03Nw0KVG90YWw6IEJlZm9yZT0zNjE3NCwgQWZ0ZXI9MzYwMTQs
IGNoZyAtMC40NCUNCg0KRG15dHJvLCB3aXRoIEFuZHJldydzIHJlc3BvbnNlIHJlZ2FyZGlu
ZyB0aGUgTWlzcmEgInZpb2xhdGlvbiIgd2l0aCAiY3VycmVudCIsDQppdHMgdXAgdG8geW91
IHdoZXRoZXIgeW91IHdhbnQgdG8gc2VuZCBhbm90aGVyIHBhdGNoIGZvciBjb21tb24vc2No
ZWQvY29yZS5jLg0KDQpJbiBjYXNlIHlvdSBkb24ndCB3YW50IHRvIGRvIHRoYXQsIHBsZWFz
ZSB0ZWxsIG1lIGFuZCBJJ2xsIHNlbmQgdGhhdCBwYXRjaC4NCg0KDQpKdWVyZ2VuDQo=
--------------tN95QAGW1W4FT3ZXMOFobS74
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------tN95QAGW1W4FT3ZXMOFobS74--

--------------kv3oNgFE2TsryMcUjS7I9f2s--

--------------dgUcIXRa1XjzNC9A0HdOtVz2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiMUBwFAwAAAAAACgkQsN6d1ii/Ey/3
HwgAmgKZ+K69YPBlTBs6lvbYCr2+GVfaycim7/JRBo+bb4wySij9JjoGDrSjEcmxkk6ULKukseLn
gBg22J3rvObgC86IfopP073uDVp6SYPniU2VI98sBqa/Sy0q/JNU8fEDszEjgfcfJcZYF5hFuQYV
Xuln+dW/DlNcWJxSjzBNRWalOhUsp21XKf2iOF9BMtYMmIXr+RfeCbEteijo3h1GPWy8QByYtwx9
2PLELOde63Abu43oekd6Z+G87FHwiB5bR02OM3dJ7lg1HtcraPXro8N5/zbNcRJZqfk66ggzMM7Z
9rwlMZJzTTLgG5k0QG5ymp96ipR99MiWlFjePerCiA==
=5Mmq
-----END PGP SIGNATURE-----

--------------dgUcIXRa1XjzNC9A0HdOtVz2--

