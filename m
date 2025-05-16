Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D14AB9A91
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:53:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986983.1372482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsgW-000569-S1; Fri, 16 May 2025 10:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986983.1372482; Fri, 16 May 2025 10:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsgW-00052o-OI; Fri, 16 May 2025 10:53:00 +0000
Received: by outflank-mailman (input) for mailman id 986983;
 Fri, 16 May 2025 10:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uFsgV-00052i-AH
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:52:59 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed33d398-3243-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:52:57 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a36463b9cbso891f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 03:52:57 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b?
 (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de.
 [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a79asm2427307f8f.25.2025.05.16.03.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 03:52:56 -0700 (PDT)
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
X-Inumbo-ID: ed33d398-3243-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747392777; x=1747997577; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weo89IvxzIJ17K6wDX/z8/tGq3bym/lJJsmhQ7vaQS8=;
        b=EgAvey1w5N14U2VlkBXBhet2p2kzMmWNkiqsY62OPGiJzoqQ0WqbRAeZDCgJo+19p7
         xjMQw/RCexNI3WooXe3r9Ogm7dfiVmFlNJ1X+9ULChXgTTqIQLUcXFG2aTj/h82uPTkc
         q5IOKSMwJ45XrWDumyQXyeP56+NaGuOzr8yWpLe06NRvDjPL11HxpEfqxuZlCXWltzOt
         ObqLcDn3Wr6QGMHAbaPduTxqCOm5XoQXwVAa0iTeLKCgHsTRwPnca1RGpWbj2gswcByu
         HmiEDxyZSiWbwxBiLQmAnUCLLB+umFjqJCq6+Clav0toHr9QRxy/4/32z9Ku3zTBGkhQ
         x+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747392777; x=1747997577;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weo89IvxzIJ17K6wDX/z8/tGq3bym/lJJsmhQ7vaQS8=;
        b=EnN0dYPtrgPS+XYGdd0yKhFW0nPPRpLzu+3XaVBQC51Cfdzp7SPFK+PBlbGrPyqsYX
         NT8/n3cWnBxkxS0DZZEolGnMpU2kFHGZ4bxaFI7IHyRTlAsCmsLBb5OHGYds+wBXiDFA
         LWdZLR1QTjuYvV7JocBHy7r2nTSs9hB8HDsx/KHVgfC03uJB7P0Pw+rGYCxUSF9Y5GHY
         igYygqKdhFWQUyOJtRRblhDVNEbMW5sPC+3orzXbeo5irvU/8hUW+VgpaQa3Bo1dpjRT
         4QaJW2+ii2AwJ9/KqtVJZZRYqp1CpqEbidjZPIyJNXvlx4ZIfnVVpn78A+2ymzGNfcG8
         vnUg==
X-Forwarded-Encrypted: i=1; AJvYcCVWaYpQtH/EmFSzEihGc1os3hKgK/9MZEQUf/gxkvhFOKfEozH9w8NXIsy8vNFbSj0VrDb7PPiS9aw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxm1aaFInBcwyY0JNh9ZDgWAB7ZF9utbxo0OdFxnkZtBRUG0wpe
	/MvUGeHWGLP1htsYswYw8VplfwtP9V0BHoHjeGZFw7GSEBT9MstOJCZOaXnxVM64+ts=
X-Gm-Gg: ASbGncuwV28yxF+NEMpYuXoK4aawaib7NuOf6WE4cYBlCvefyz1Xo9wdHKXObTpdpUC
	rhS53GJA78Enro7tTMPwgQoHYure4rdYNchqPLl0/DBnCL+PraXpZu3mWxfGupEn4fMyyK4frsq
	fNrQy8jJqfNoabtoYBnqTT2YU8um/IW606LzFcYfWNlVaBSvGbeRifi5/9MN1byHVwR0bDjNqA5
	MwbF/Fiefrn8cOjCZY59BrSsJHzGsSLFenCWkNWsKjUrY0FxL2PCUbUnRUyjnD7MMX4vlgmvMgV
	kmbLiy3Tu4mR7jQG0ryLtKFEs+coDcxRRI3CeO5v1CT/oOPJ7g4dqhbBz34SrC9bKR2qasLn8cl
	cvC7rn4S8lSnjNoL2zWA7tmjzzPRX91gbAk0Ypc0+SKHnaG6nqTWcqM4Nd66IF+0dcrG3jf5Ejt
	6O0NN7NPSDCSs=
X-Google-Smtp-Source: AGHT+IF98JhISrZ0lgkdRvAyGosXiCU/LronDUQKmMW124UUxdtcxgQgTTjVB2kb+wqi9BU2ujvXkw==
X-Received: by 2002:a05:6000:2dc6:b0:3a2:1d3:defb with SMTP id ffacd0b85a97d-3a35c840cf0mr2780740f8f.36.1747392776650;
        Fri, 16 May 2025 03:52:56 -0700 (PDT)
Message-ID: <7dc4c08e-b80c-4ee9-a5d7-716ba3a9cfc0@suse.com>
Date: Fri, 16 May 2025 12:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] Confidential computing and AMD SEV support
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <cover.1747312394.git.teddy.astie@vates.tech>
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
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VAIB1AK8d0r0OuwNb3yhx0P8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VAIB1AK8d0r0OuwNb3yhx0P8
Content-Type: multipart/mixed; boundary="------------5J8HISwiSrOYDbYMpCdK8ezu";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Message-ID: <7dc4c08e-b80c-4ee9-a5d7-716ba3a9cfc0@suse.com>
Subject: Re: [RFC PATCH 00/16] Confidential computing and AMD SEV support
References: <cover.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
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

--------------5J8HISwiSrOYDbYMpCdK8ezu
Content-Type: multipart/mixed; boundary="------------k1pjn5j8J81P1i6gIRVn20B7"

--------------k1pjn5j8J81P1i6gIRVn20B7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDUuMjUgMTE6MzEsIFRlZGR5IEFzdGllIHdyb3RlOg0KPiBIZWxsbywNCj4gDQo+
IFRoaXMgc2VyaWVzIGludHJvZHVjZSBzdXBwb3J0IGZvciBjb25maWRlbnRpYWwgY29tcHV0
aW5nIGFsb25nIHdpdGggYQ0KPiBBTUQgU0VWIGltcGxlbWVudGF0aW9uLiBJdCBhbHNvIGJ1
bmRsZXMgc29tZSBvZiB0aGUgZnVuY3Rpb25hbA0KPiByZXF1aXJlbWVudHMgKEFTSUQgc2No
ZW1lLCBBQkksIC4uLikgd2hpY2ggY291bGQgYmUgc2VwYXJhdGVkIGlmIG5lZWRlZC4NCj4g
DQo+IChJIGJ1bmRsZWQgZXZlcnl0aGluZyBpbiB0aGlzIHNlcmllIHRvIGhhdmUgYSBjb21w
bGV0ZSBjb2hlcmVudCBzZXJpZSkNCj4gDQo+IFRoaXMgd29yayByZWNlaXZlcyBmdW5kaW5n
IGJ5IHRoZSBIeXBlciBPcGVuIFggY29uc29ydGl1bSAoRnJhbmNlIDIwMzApLg0KPiANCj4g
IyBDb25jZXB0cw0KPiANCj4gQSBjb25maWRlbnRpYWwgZ3Vlc3QgaXMgYSBiaXQgc3BlY2lh
bCBhcyA6DQo+ICAgLSBpdHMgbWVtb3J5IGlzIGJ5IGRlZmF1bHQgZW5jcnlwdGVkIG9yIG5v
dCBkaXJlY3RseSBhY2Nlc3NpYmxlIGJ5IHRoZQ0KPiAgICAgaHlwZXJ2aXNvciwgdGh1cyBv
dGhlciBkb21haW5zL2RvbTAgYXMgd2VsbDsgaXQgbXVzdCBiZSBleHBsaWNpdGVseQ0KPiAg
ICAgc2hhcmVkIGJ5IHRoZSBndWVzdCBpdHNlbGYNCj4gICAtIHNvIGl0cyBwYWdlLXRhYmxl
cyBhcmUgYWxzbyBub3QgYWNjZXNzaWJsZQ0KPiANCj4gIyBJbXBsZW1lbnRhdGlvbg0KPiAN
Cj4gQ29uZmlkZW50aWFsIGNvbXB1dGluZyBpcyBleHBvc2VkIGluIGEgdW5pZm9ybSB3YXkg
cmVnYXJkbGVzcyBvZiBhY3R1YWwNCj4gaW1wbGVtZW50YXRpb24gKFNFViwgVERYLCBSTUUs
IC4uLikgdGhyb3VnaCB0aGUgY29jb19vcCBoeXBlcmNhbGwgKG1vc3RseQ0KPiBmb3IgdXNl
IGJ5IHRoZSBEb20wIHRvb2xzdGFjaykuIFRoaXMgaW50ZXJmYWNlIHByb3ZpZGVzIGEgd2F5
IHRvIHF1ZXJ5DQo+IGluZm9ybWF0aW9ucyBvbiB0aGUgY29jbyBwbGF0Zm9ybSAoc3VwcG9y
dCBzdGF0dXMsIGZlYXR1cmVzICh1bilzYWZldHksDQo+IC4uLiksIGFuZCBwcmVwYXJlIGlu
aXRpYWwgZ3Vlc3QgbWVtb3J5Lg0KPiBPbmx5IEhWTSBkb21haW5zIGhhdmUgc3VwcG9ydCBm
b3IgY29uZmlkZW50aWFsIGNvbXB1dGluZy4NCj4gKGluIHRoZSBmdXR1cmUsIHdlIG1heSB3
YW50IHRvIGhhdmUgYXR0ZXN0YXRpb24gc3VwcG9ydCkNCj4gDQo+IEluIG9yZGVyIHRvIGNy
ZWF0ZSBhIGNvbmZpZGVudGlhbCBjb21wdXRpbmcgZG9tYWluLCB0aGUgcHJvY2VzcyBpcyBm
b2xsb3cgOg0KPiAgIC0gY3JlYXRlIGEgSFZNL1BWSCBkb21haW4gd2l0aCBYRU5fRE9NQ1RM
X0NERl9jb2NvDQo+ICAgLSBwb3B1bGF0ZSBpbml0aWFsIG1lbW9yeSBhcyB1c3VhbA0KPiAg
IC0gYXBwbHkgY29jb19wcmVwYXJlX2luaXRpYWxfbWVtIG9uIGFsbCBpbml0aWFsIHBhZ2Vz
DQo+ICAgICAodW5kZXIgU0VWLCB0aGlzIHdpbGwgZW5jcnlwdCBtZW1vcnkpDQo+IA0KPiBV
bmRlciB4bCwgaXQgaXMgZXhwb3NlZCB0aHJvdWdoIHRoZSBgY29jb2AgcGFyYW1ldGVyICgi
Y29jbyA9IDEiKS4NCg0KV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBhbGxvdyBzcGVjaWZ5
aW5nIHRoZSBraW5kIG9mIGRvbWFpbg0KKFNFViwgU0VWLUVTLCBTRVYtU05QLCBURFgpIGxp
a2UgS1ZNIGRvZXM/DQoNCkl0IG1pZ2h0IG5vdCBiZSBuZWVkZWQgcmlnaHQgbm93LCBidXQg
aW4gZnV0dXJlIHRoaXMgY291bGQgYmUgbmVlZGVkDQooZS5nLiB3aGVuIGFsbG93aW5nIG1p
Z3JhdGlvbiBiZXR3ZWVuIGhvc3RzIHdpdGggZGlmZmVyZW50IFNFVg0KZmVhdHVyZXMpLg0K
DQpJIGRvbid0IHRoaW5rIHRoaXMgaXMgaW1wb3J0YW50IGR1cmluZyBSRkMgcGhhc2UsIGJ1
dCB0aGUgZmluYWwNCmNvbmZpZ3VyYXRpb24gYW5kIGh5cGVydmlzb3IgaW50ZXJmYWNlcyBv
ZiB0aGlzIHNlcmllcyBzaG91bGQgYWxsb3cNCnRoYXQuDQoNCg0KSnVlcmdlbg0K
--------------k1pjn5j8J81P1i6gIRVn20B7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------k1pjn5j8J81P1i6gIRVn20B7--

--------------5J8HISwiSrOYDbYMpCdK8ezu--

--------------VAIB1AK8d0r0OuwNb3yhx0P8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgnGQcFAwAAAAAACgkQsN6d1ii/Ey+M
5Af/dAYwFPVWmnvEB120xcz3t1l8LsgMQcX+WFrK8uZFYvTFRXbsP7ZkLWQ89H3QsWGVIZ9XLBsM
U7kNsqX+R2OfAus0YfGX80f8UEgJvDPjZ7YJe9q4GZ1zb5vcuyXve70jMBkWLCT6V1lRPYFVgKDz
eXdpglVNBjhp5jVuL0Ea/55c47cERTwPaYSNXgmy/Xs92SlXLw+Is+ylSxO+yz2ZQ5JWkCvttJXV
6/bltCmV/uMrvI3ETz5uaDCwgD2xv8st+I6W0b4YUVAhtBuFsDT704xZCGd+/678vuowv384lzuo
aI9QA8iZMNPZSwpLPVU6jQV+Gv7T5OXrTCqx3rkqOw==
=BXLL
-----END PGP SIGNATURE-----

--------------VAIB1AK8d0r0OuwNb3yhx0P8--

