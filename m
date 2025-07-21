Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF0B0C2C2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 13:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051382.1419714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udoat-0000oj-KM; Mon, 21 Jul 2025 11:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051382.1419714; Mon, 21 Jul 2025 11:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udoat-0000nI-Hg; Mon, 21 Jul 2025 11:22:07 +0000
Received: by outflank-mailman (input) for mailman id 1051382;
 Mon, 21 Jul 2025 11:22:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1udoas-0000nC-8r
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 11:22:06 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee0f184a-6624-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 13:22:04 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2438614f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Jul 2025 04:22:04 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca48991sm10127930f8f.44.2025.07.21.04.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 04:22:03 -0700 (PDT)
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
X-Inumbo-ID: ee0f184a-6624-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753096924; x=1753701724; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ECIhpB50oQRvu0+PKD07KhxMxyEkXkbHboJc03y7hC0=;
        b=aPGaQNC3DUAaZWxq7E7Xk69Z4zOid9ByOuIF+CTknQvCO8SJi2oe+O1lf/82BNVXNZ
         tIHKVL/oPjJFz42zq+IPnO/Yy+/U8iLRR6DMyiSQq/HRphWsBGcUMAG1sDDGVJscJfCy
         3I+1POdrRfLj093TdqN4OAt9XMnxttDULlXdvYX/vowXapyqEFRq3X2LaMWz77TPxBG4
         xgRMjeiW/yjP5PDTSLs/9n5hnSZXzYewV6PRDpR68WVM52DVhqT4IEdAlt1rQteR/EX6
         cpld/qYz7qg3u2NYzVkSYl7EoNkLtU8MBk43K8VeXltkWSlrujNZL7zl1/JCO5dass6j
         ny2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096924; x=1753701724;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECIhpB50oQRvu0+PKD07KhxMxyEkXkbHboJc03y7hC0=;
        b=SBA72lRKmY2VSNAlzRV/n5aNB+89gw/m9/SHerLS8pyaO0WLw5dhCKI9WNoAT9LfQu
         gScpTIK33rvb2MM5vilRDfqchMKlN+ZVWr7MzX+bWDLgelfijLTiS3QvHFiEkUtUERYs
         lUtYYJx/Jgn70IuTRKP877UvO4Wn1AU7va7AK9i+rykNqBbTlK20fVMhXNUpcZcJkOLE
         HLTS2/92wnXV7xLNzYN5KYNynVoYDkmY7sWnhFI3TDqh9jLZi2CzvTjdPGcB9rTO9/AX
         F/Fz7yjJPBoT1Xc9gTu6d1U9DlZtTmRtO2gJcuJ/yIoltVOWNIyE0R0Qi+ZPEV/jKVii
         F/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVXkIVpS3xA+Ig7M/oEzy4xGgHdvcI3PSRbRI/2H7Q+vTYKSU4ZmmVkEKzGFjwb8Lpw7JtVUhS8n6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQZj5QYqtulb65jqs081j2S/XaVkPArIRkT+2DqRUqEaTmGFiv
	sPIfcq4CyMkn55PGNxILbgN4xxqGTLzplCBMzhz7ZVEu3gQOMU/CiGy1x+Ha4v1Nh80=
X-Gm-Gg: ASbGncsYbYdUEUUOQk6o6Qi/uyOUA9TV7BCtZQmFUEyF5zr4TEJstT/maYlJKRqHvJu
	FtGxCx2iyNt0NR848VEeZA7jwJNYx92rJ/evWtylZ4a4Q91Pj/Of0xDiWajRVpC35gKxfQN5+xV
	6C+zjl/iUxs7dyTGkxaXuhjBXz2uJi4eUW1RhnnvLOj9LrjURV7lYXnSLoI5Hn5plmODhorEjd5
	4x2wTaQenIuNjYdVspJbow02ttJV12RTh3AYQbZXjxcWtlA+MIgSlSq8uZ/WFZ5jls3XSD7qOkW
	5t+nWQZ7jxIdSjXx84YG0Pm5x6sFGuH2XrEPS1FvGc6VZcTaTfAnfzVYAsspFRgKyLA1tYUANTm
	hchTcTz+IfbjFobd6TpEZDpAzNDas+btG4B6ziO4PEdFYcqbAP/ftH6ZhgYiEkxqk2rdn8Mzu/p
	kYtVOZ2nabD9FxaJtSFTRrejrL/tDwNrjijHqgUvAqtMWG
X-Google-Smtp-Source: AGHT+IEIS6NcXC9cinAKVbD9S25GFVMA/Pwc33UsK8WQ3eRqrYOu5KM3z3ny2kN/P8hts+QNGfN4yQ==
X-Received: by 2002:a05:6000:64a:b0:3b6:1a2c:2543 with SMTP id ffacd0b85a97d-3b61a2c2743mr8504057f8f.6.1753096924127;
        Mon, 21 Jul 2025 04:22:04 -0700 (PDT)
Message-ID: <0e0502fb-9579-4929-9780-ea4999d35409@suse.com>
Date: Mon, 21 Jul 2025 13:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/core: For a new metric, add
 vcpu->nonaffine_time
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
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
In-Reply-To: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mOCfZk0xlr2pWBn2QEtk79C1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mOCfZk0xlr2pWBn2QEtk79C1
Content-Type: multipart/mixed; boundary="------------OJOv0RgqZqIYurWFQaWwmth5";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <0e0502fb-9579-4929-9780-ea4999d35409@suse.com>
Subject: Re: [PATCH 1/2] sched/core: For a new metric, add
 vcpu->nonaffine_time
References: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
In-Reply-To: <20250721094951.2006-1-bernhard.kaindl@cloud.com>
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

--------------OJOv0RgqZqIYurWFQaWwmth5
Content-Type: multipart/mixed; boundary="------------ZB7Ec7awlWAgkkWV41JKljP2"

--------------ZB7Ec7awlWAgkkWV41JKljP2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDcuMjUgMTE6NDksIEJlcm5oYXJkIEthaW5kbCB3cm90ZToNCj4gVG8gbW9uaXRv
ciB0aGUgZWZmZWN0aXZlbmVzcyBvZiB2Q1BVIHNvZnQtYWZmaW5pdHkgb24gTlVNQSBob3N0
cywNCj4gd2UnZCBsaWtlIHRvIGNyZWF0ZSBhIHZDUFUgbWV0cmljIHRoYXQgYWNjdW11bGF0
ZXMgdGhlIGFtb3VudCBvZg0KPiB2Q1BVIHRpbWUgcnVubmluZyBvdXRzaWRlIG9mIHRoZSBz
b2Z0IGFmZmluaXR5IG1hc2sgb2YgdGhlIHNjaGVkLXVuaXQ6DQo+IA0KPiAtIEFkZCBhIG5l
dyB0aW1lIGNvdW50ZXIsIG5vbmFmZmluZV90aW1lIHRvIHN0cnVjdCB2Y3B1Lg0KPiANCj4g
LSBBY2N1bXVsYXRlIHRoZSBub25hZmZpbmVfdGltZSBvbiB2Y3B1X3J1bnN0YXRlX2NoYW5n
ZSgpOg0KPiAgICBBY2NvdW50IHRoZSB0aW1lIHNwZW50IGluIHRoZSBSVU5TVEFURV9ydW5u
aW5nIHN0YXRlIG91dHNpZGUNCj4gICAgb2YgdW5pdC0+Y3B1X3NvZnRfYWZmaW5pdHk6IEl0
IGlzIGFsd2F5cyBpbml0aWFsaXplZCBhbmQgZGVmYXVsdHMNCj4gICAgdG8gY3B1bWFza19h
bGwgKGJpdHMgZm9yIGFsbCBOUl9DUFVTIHNldCksIHNvIHdlIG9ubHkgYWNjdW11bGF0ZQ0K
PiAgICBub25hZmZpbmUgdGltZSB3aGVuIHRoZSB2Q1BVIHJ1bnMgb24gYW4gdW5zZXQgQ1BV
IChub24tYWZmaW5lKS4NCj4gDQo+IEluIHRoZSBuZXh0IHBhdGNoLCB0aGlzIGZpZWxkIGNh
biBiZSB1c2VkIHRvIHJldHJpZXZlIHRoZSBhY2N1bXVsYXRlZA0KPiBub25hZmZpbmUgcnVu
bmluZyB0aW1lIGUuZy4gdXNpbmcgdmNwdV9ydW5zdGF0ZV9nZXQoKS4NCg0KUGxlYXNlIGF2
b2lkIHBocmFzZXMgbGlrZSAiaW4gdGhlIG5leHQgcGF0Y2giIGluIGNvbW1pdCBtZXNzYWdl
cy4NClRoZXJlIGlzIG5vIGd1YXJhbnRlZSBhIHNlcmllcyB3aWxsIGJlIGNvbW1pdHRlZCBp
biBvbmUgZ28uDQoNCkknZCBqdXN0IGRyb3AgdGhpcyBsYXN0IHNlbnRlbmNlLg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBLYWluZGwgPGJlcm5oYXJkLmthaW5kbEBjbG91
ZC5jb20+DQo+IC0tLQ0KPiAgIHhlbi9jb21tb24vc2NoZWQvY29yZS5jIHwgMjAgKysrKysr
KysrKysrKysrKysrKysNCj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDExICsrKysr
KysrKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZC9jb3JlLmMgYi94ZW4vY29tbW9uL3NjaGVk
L2NvcmUuYw0KPiBpbmRleCAxM2ZkZjU3ZTU3Li40ODkyNTViOWM2IDEwMDY0NA0KPiAtLS0g
YS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYw0KPiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2Nv
cmUuYw0KPiBAQCAtMjYwLDYgKzI2MCwyMyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmNwdV91
cmdlbnRfY291bnRfdXBkYXRlKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgICB9DQo+ICAgfQ0K
PiAgIA0KPiArLyoNCj4gKyAqIEZvciBhY2NvdW50aW5nIG5vbi1hZmZpbmUgcnVubmluZyB0
aW1lIG9mIGEgdkNQVSwgcmV0dXJuIHRydWUgaWYNCj4gKyAqIHRoZSB2Q1BVIGlzIHJ1bm5p
bmcgaW4gUlVOU1RBVEVfcnVubmluZyBzdGF0ZSB3aGlsZSBub3Qgb24gYSBDUFUNCj4gKyAq
IGluIHVuaXQtPmNwdV9zb2Z0X2FmZmluaXR5Lg0KDQoidGhlIHZDUFUgaXMgcnVubmluZyBp
biBSVU5TVEFURV9ydW5uaW5nIHN0YXRlIiBpcyBhIHdlaXJkIHN0YXRlbWVudC4NCldoZW4g
cnVubmluZyBpdCB3aWxsIGFsd2F5cyBiZSBpbiB0aGUgUlVOU1RBVEVfcnVubmluZyBzdGF0
ZS4gSSdkIHdyaXRlDQoidGhlIHZDUFUgaXMgaW4gUlVOU1RBVEVfcnVubmluZyBzdGF0ZSIu
DQoNCj4gKyAqLw0KPiArc3RhdGljIGlubGluZSBib29sIG5vbmFmZmluZShjb25zdCBzdHJ1
Y3QgdmNwdSAqdiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3Ry
dWN0IHNjaGVkX3VuaXQgKnVuaXQpDQo+ICt7DQo+ICsgICAgLyoNCj4gKyAgICAgKiB1bml0
LT5jcHVfc29mdF9hZmZpbml0eSBpcyBhbHdheXMgaW5pdGlhbGl6ZWQgYW5kIGRlZmF1bHRz
IHRvDQo+ICsgICAgICogY3B1bWFza19hbGwgKGJpdHMgZm9yIGFsbCBOUl9DUFVTIHNldCks
IHNvIHdlIG9ubHkgYWNjdW11bGF0ZQ0KPiArICAgICAqIG5vbmFmZmluZSB0aW1lIHdoZW4g
dGhlIHZDUFUgcnVucyBvbiBhbiB1bnNldCBDUFUgKG5vbi1hZmZpbmUpLg0KPiArICAgICAq
Lw0KPiArICAgIHJldHVybiB2LT5ydW5zdGF0ZS5zdGF0ZSA9PSBSVU5TVEFURV9ydW5uaW5n
ICYmDQo+ICsgICAgICAgICAgICFjcHVtYXNrX3Rlc3RfY3B1KHYtPnByb2Nlc3NvciwgdW5p
dC0+Y3B1X3NvZnRfYWZmaW5pdHkpOw0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGlubGluZSB2
b2lkIHZjcHVfcnVuc3RhdGVfY2hhbmdlKA0KPiAgICAgICBzdHJ1Y3QgdmNwdSAqdiwgaW50
IG5ld19zdGF0ZSwgc190aW1lX3QgbmV3X2VudHJ5X3RpbWUpDQo+ICAgew0KPiBAQCAtMjg1
LDYgKzMwMiw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgN
Cj4gICAgICAgew0KPiAgICAgICAgICAgdi0+cnVuc3RhdGUudGltZVt2LT5ydW5zdGF0ZS5z
dGF0ZV0gKz0gZGVsdGE7DQo+ICAgICAgICAgICB2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90
aW1lID0gbmV3X2VudHJ5X3RpbWU7DQo+ICsNCj4gKyAgICAgICAgaWYgKCBub25hZmZpbmUo
diwgdW5pdCkgKSAvKiBXaGVuIHJ1bm5pbmcgbm9uYWZmaW5lLCBhZGQgZGVsdGEgKi8NCj4g
KyAgICAgICAgICAgIHYtPm5vbmFmZmluZV90aW1lICs9IGRlbHRhOw0KPiAgICAgICB9DQoN
CklzIHRoaXMgcmVhbGx5IGNvcnJlY3Q/IEltYWdpbmUgYSB2Y3B1IHJ1bm5pbmcgZm9yIHZl
cnkgbG9uZyB0aW1lIG9uDQphIHBoeXNpY2FsIGNwdSB3aXRob3V0IGxvc2luZyBpdCAoUlVO
U1RBVEVfcnVubmluZyBmb3IgbWludXRlcywgaG91cnMNCm9yIGV2ZW4gZGF5cykuIE5vdyBz
b21lb25lIGlzIGNoYW5naW5nIHRoZSBzb2Z0LWFmZmluaXR5IG9mIHRoZSB2Y3B1DQphbmQg
YXMgYSByZXN1bHQgaXQgd2lsbCBiZSBtb3ZlZCB0byBhbm90aGVyIHBoeXNpY2FsIGNwdS4g
WW91IHdpbGwgYWRkDQphbGwgdGhlIGxvbmcgdGltZSB0aGUgdmNwdSB3YXMgcnVubmluZyB0
byB2LT5ub25hZmZpbmVfdGltZSBpbiBzcGl0ZSBvZg0KdGhlIGFmZmluaXR5IGNoYW5nZSBo
YXZpbmcgaGFwcGVuZWQgb25seSBuYW5vc2Vjb25kcyBiZWZvcmUuDQoNCj4gICAgICAgdi0+
cnVuc3RhdGUuc3RhdGUgPSBuZXdfc3RhdGU7DQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IGluZGV4IGZlNTNk
NGZhYjcuLmFiYTYwYWZkNGYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+IEBAIC0xOTgsNyArMTk4
LDE4IEBAIHN0cnVjdCB2Y3B1DQo+ICAgDQo+ICAgICAgIHN0cnVjdCBzY2hlZF91bml0ICpz
Y2hlZF91bml0Ow0KPiAgIA0KPiArICAgIC8qDQo+ICsgICAgICogVGhlIHN0cnVjdCB2Y3B1
X3J1bnN0YXRlX2luZm8gY29udGFpbnMgdGhlIHZDUFUgdGltZSBzcGVudA0KPiArICAgICAq
IGluIGVhY2ggcnVuc3RhdGUgYW5kIHRoZSBlbnRyeSB0aW1lIG9mIHRoZSBjdXJyZW50IHJ1
bnN0YXRlLg0KPiArICAgICAqDQo+ICsgICAgICogTm90ZTogVGhpcyBmaWVsZCBpcyB1c2Vk
IGZvciB0aGUgZ3Vlc3QgcnVuc3RhdGUgc2hhcmVkIG1lbW9yeSBhcmVhLg0KPiArICAgICAq
IFRoZXJlZm9yZSwgaXQgaXMgcGFydCBvZiB0aGUgZnJvemVuIGd1ZXN0IEFQSSBhbmQgY2Fu
bm90IGJlIGNoYW5nZWQuDQo+ICsgICAgICovDQoNCnMvZnJvemVuL3B1YmxpYy8NCg0KSW4g
dGhlIGVuZCBJJ20gbm90IHJlYWxseSBzdXJlIHRoaXMgY29tbWVudCBpcyBhZGRpbmcgbXVj
aCB2YWx1ZS4NCkJ1dCBtYXliZSBJJ20gYmlhc2VkIGFzIEkndmUgd29ya2VkIHdpdGggdGhp
cyBjb2RlIGEgbG90Lg0KDQo+ICAgICAgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gcnVu
c3RhdGU7DQo+ICsNCj4gKyAgICAvKiB2Q1BVIHRpbWUgcnVubmluZyBvdXRzaWRlIHRoZSBz
Y2hlZHVsaW5nIHVuaXQncyBzb2Z0X2FmZmluaXR5IG1hc2sgKi8NCj4gKyAgICB1aW50NjRf
dCAgICAgICAgIG5vbmFmZmluZV90aW1lOw0KPiArDQo+ICAgI2lmbmRlZiBDT05GSUdfQ09N
UEFUDQo+ICAgIyBkZWZpbmUgcnVuc3RhdGVfZ3Vlc3QodikgKCh2KS0+cnVuc3RhdGVfZ3Vl
c3QpDQo+ICAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNwdV9ydW5zdGF0ZV9pbmZvX3QpIHJ1
bnN0YXRlX2d1ZXN0OyAvKiBndWVzdCBhZGRyZXNzICovDQoNCg0KSnVlcmdlbg0KDQo=
--------------ZB7Ec7awlWAgkkWV41JKljP2
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ZB7Ec7awlWAgkkWV41JKljP2--

--------------OJOv0RgqZqIYurWFQaWwmth5--

--------------mOCfZk0xlr2pWBn2QEtk79C1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmh+ItoFAwAAAAAACgkQsN6d1ii/Ey80
ggf7B5yfFS7s6Vjs9XH9YCRH1S13Uhat1kXgEvOk2Oxnaj6gYdZ0WQAT297A8JuGqt8bvZBntVDF
mHwAz8Jw5pgiBGDwzlAW9W+woz95Ur5xVmyHZEulo3rZMyo33ZqQICDZbi5QsZXQCua7qUTpoMKF
FtsZQA6h65/HqmRaddm92weU8VDa+v/K/k+10qhzcp8ZSAWo0xxbc+IzGP+qHzfMjkbAR482ypN5
WycOxCxMHn4vBIUrdgNAbj5GpFDCHoB5XE3w4EqIqEtA6K0KD1HWKGw218xO6MQpIA5n02wssMHE
YBbJmVCu4tWJu/2ZqSC116r39qBkkxjxFjyW1AlAPA==
=a7F3
-----END PGP SIGNATURE-----

--------------mOCfZk0xlr2pWBn2QEtk79C1--

