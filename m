Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB7A54C25
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 14:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903532.1311487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBFr-0003XV-6E; Thu, 06 Mar 2025 13:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903532.1311487; Thu, 06 Mar 2025 13:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBFr-0003VK-3U; Thu, 06 Mar 2025 13:27:15 +0000
Received: by outflank-mailman (input) for mailman id 903532;
 Thu, 06 Mar 2025 13:27:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqBFp-0003VC-H1
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 13:27:13 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b64c9173-fa8e-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 14:27:12 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so4113605e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 05:27:12 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4293250sm49599035e9.16.2025.03.06.05.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:27:09 -0800 (PST)
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
X-Inumbo-ID: b64c9173-fa8e-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741267632; x=1741872432; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qm7FII8ejyTEOEL7EUUziK4xeiKBkOI3nh0XCvTONjk=;
        b=UniSsTs7FXl0Sn4V4I8FZkEQ+7lCQTbdxE40t461PEChUPCOeB+DU5Jm/Cj0AXmrfe
         9LqOqh+BeJAPgeOSzQXP+Egq+R5CFYLy9UoyDzHw6mDIX3zuDr83E/KwtFOFqSzaCSNO
         qwFxT0TG2tMn+ufT+DP3HaKl9NH7uVkEY9u2bwp8TMzNHgVH213wQHBOJNgnJldBtRVN
         fRxRDii/gUYXH614jLIQ7LXQMZzxEjkDLFi/xQOk0gt0qu08Lf+NqCbgOSXrYQWQ0Af2
         8KwTFfmS5D5fHvqA3F4+K2IJmZ2k74gZ2K4clJtkqEEca4IxC8tFxVIIrT26avTZ5LtZ
         /dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267632; x=1741872432;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qm7FII8ejyTEOEL7EUUziK4xeiKBkOI3nh0XCvTONjk=;
        b=RD7fUwARL2M96QdcxJNU9/OVAOKJl1kAjisc+qNirwvdxVJvQGr19xK7qOai60gjcb
         RfpCP07ozJKn3RS0EKpmyD7mOkVJWF2EJv9ZnD0x0j6enDBCj/cK0ux5igItfe+dfWH1
         Te8Oqs4CCzkH+KrNmR4T9ZVnZVlm+AobhdhoskBqQHK52IbOv47qDYxGERiFDFl0Le4N
         yVSZFJYGpXLyWx65+og11ky7P2FO0c6vI/sgds73kZ97pt0lInvPBNarWJK/+Ukdczjj
         HvsT9belgOQHKRvo6H3q7TL8Bt1xt1ezdqZ3+59RHqDtTYGET4AzG5+SoavUQlUScZne
         bd1Q==
X-Gm-Message-State: AOJu0Yz9tK/za51K46MGqoPbFxYOxJSmZeEQKntRm3OMkvdDl+Ip8wXn
	O5y/xptR5gONMRW713GvCxfmKdPK9tn2K7LV2cSOdfCkfdSUZMCWcYoy8F2Anz4=
X-Gm-Gg: ASbGncsF+TML9wl0KSO/Rk0wLL2T5AcROiBKWb61dPC8exr+Sk0yeoD8F2onRj9Ec6J
	pMeGI0DbnPF8VNx3kGQSzLlViT3785M6ecEHJNd8TpAUyM3zTLRBVPQE1VNSgAlnqXqRS736A30
	Oi7PH5ivim+wBF5iaKrBeCZbjenK8cD8mbz6w9IjdbyUYMeaKW41QfpoR20gEpiYZcrhYqko434
	iUyClccEw4SksU2JL0MflZE50S5GMyTe7FYZRqhYH/FHhyZF9CKiSXLCQ+IEMIErxRZvvmaE4jN
	cgbxWxl5UEyRqlERDqmMdY1JH1QPdxPn9Bnk2uGntMx9jHNTCS3AJP76/nU92cv/0B2iqgkPSSc
	rriHFoRG1SMZvnb5cFYly4nPlXfNcYHkmkc3bWQ7KauR4OyLPBbnVm8t8Vcr2tKwl8A4=
X-Google-Smtp-Source: AGHT+IFa25BHHB8MAmxkz8AwZ3WD/8vN7e6aEwm3qY5PJ9FBGehSsqybC/O6VIeVaO01P1pn5w1jnQ==
X-Received: by 2002:a05:6000:1f8b:b0:390:f400:2083 with SMTP id ffacd0b85a97d-3911f58fa13mr7085845f8f.0.1741267630252;
        Thu, 06 Mar 2025 05:27:10 -0800 (PST)
Message-ID: <0ef805d0-68f1-4fb2-a6bb-5901304270bd@suse.com>
Date: Thu, 6 Mar 2025 14:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
 <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
 <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
 <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
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
In-Reply-To: <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0xI7sKtU8K0Wdv9oTLvy08D5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0xI7sKtU8K0Wdv9oTLvy08D5
Content-Type: multipart/mixed; boundary="------------9x93gIaY5EK5T06Hw6M4rZh4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <0ef805d0-68f1-4fb2-a6bb-5901304270bd@suse.com>
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
 <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
 <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
 <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
In-Reply-To: <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
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

--------------9x93gIaY5EK5T06Hw6M4rZh4
Content-Type: multipart/mixed; boundary="------------RU0HKtp4PAZIGvROSUVQ4mSK"

--------------RU0HKtp4PAZIGvROSUVQ4mSK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjUgMTQ6MTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDI1
IDAwOjMyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBXZWQsIDUgTWFyIDIw
MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gT24gMjUuMDIuMjUgMTI6MTAsIEp1ZXJn
ZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IFBpbmc/IEVzcGVjaWFsbHkgLi4uDQo+Pj4+DQo+Pj4+
IE9uIDA0LjAyLjI1IDEyOjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4gWGVuc3Rv
cmVkIGlzIHVzaW5nIGxpYnhlbmN0cmwgZm9yIG9ubHkgb25lIHB1cnBvc2U6IHRvIGdldCBp
bmZvcm1hdGlvbg0KPj4+Pj4gYWJvdXQgc3RhdGUgb2YgZG9tYWlucy4NCj4+Pj4+DQo+Pj4+
PiBUaGlzIHBhdGNoIHNlcmllcyBpcyByZW1vdmluZyB0aGF0IGRlcGVuZGVuY3kgYnkgaW50
cm9kdWNpbmcgYSBuZXcNCj4+Pj4+IHN0YWJsZSBpbnRlcmZhY2Ugd2hpY2ggY2FuIGJlIHVz
ZWQgYnkgeGVuc3RvcmVkIGluc3RlYWQuDQo+Pj4+Pg0KPj4+Pj4gVGhlcmUgd2FzIGEgUkZD
IHNlcmllcyBzZW50IG91dCAzIHllYXJzIGFnbywgd2hpY2ggSSBoYXZlIHRha2VuIGFzIGEN
Cj4+Pj4+IGJhc2UgYW5kIGJ5IGFkZHJlc3NpbmcgYWxsIGNvbW1lbnRzIGZyb20gYmFjayB0
aGVuLg0KPj4+Pj4NCj4+Pj4+IFRoZSBtYWluIGRpZmZlcmVuY2VzIHNpbmNlIHRoYXQgUkZD
IHNlcmllcyBhcmU6DQo+Pj4+Pg0KPj4+Pj4gLSBJbnN0ZWFkIG9mIGludHJvZHVjaW5nIGFu
IG5ldyBtYWluIGh5cGVyY2FsbCBmb3IgYSBzdGFibGUgbWFuYWdlbWVudA0KPj4+Pj4gIMKg
wqAgaW50ZXJmYWNlIEkgaGF2ZSBqdXN0IGFkZGVkIGEgbmV3IGRvbWN0bCBzdWItb3AsIGFz
IHJlcXVlc3RlZCBpbiAyMDIxLg0KPj4+Pj4NCj4+Pj4+IC0gSSBoYXZlIGFkZGVkIGEgbmV3
IGxpYnJhcnkgbGlieGVubWFuYWdlIGZvciBlYXN5IHVzZSBvZiB0aGUgbmV3DQo+Pj4+PiAg
wqDCoCBzdGFibGUgaHlwZXJ2aXNvciBpbnRlcmZhY2UuIE1haW4gbW90aXZhdGlvbiBmb3Ig
YWRkaW5nIHRoZSBsaWJyYXJ5DQo+Pj4+PiAgwqDCoCB3YXMgdGhlIHJlY2VudCBhdHRlbXB0
IHRvIGRlY291cGxlIG94ZW5zdG9yZWQgZnJvbSB0aGUgWGVuIGdpdCB0cmVlLg0KPj4+Pj4g
IMKgwqAgQnkgdXNpbmcgdGhlIG5ldyBsaWJyYXJ5LCBveGVuc3RvcmVkIGNvdWxkIGJlbmVm
aXQgaW4gdGhlIHNhbWUgd2F5IGFzDQo+Pj4+PiAgwqDCoCB4ZW5zdG9yZWQgZnJvbSB0aGUg
bmV3IGludGVyZmFjZTogaXQgd291bGQgYmUgcG9zc2libGUgdG8gcmVseSBvbg0KPj4+Pj4g
IMKgwqAgc3RhYmxlIGxpYnJhcmllcyBvbmx5Lg0KPj4+Pj4NCj4+Pj4+IC0gTWluaS1PUyBo
YXMgZ2FpbmVkIHNvbWUgbW9yZSBjb25maWcgb3B0aW9ucyByZWNlbnRseSwgc28gaXQgd2Fz
IHJhdGhlcg0KPj4+Pj4gIMKgwqAgZWFzeSB0byBtYWtlIHhlbnN0b3JlW3B2aF0tc3R1YmRv
bSBpbmRlcGVuZGVudCBmcm9tIGxpYnhlbmN0cmwsIHRvby4NCj4+Pj4+DQo+Pj4+PiBQbGVh
c2Ugbm90ZSB0aGF0IHRoZSBsYXN0IDQgcGF0Y2hlcyBjYW4gYmUgY29tbWl0dGVkIG9ubHkg
YWZ0ZXIgdGhlDQo+Pj4+PiByZWxhdGVkIE1pbmktT1MgcGF0Y2ggImNvbmZpZzogYWRkIHN1
cHBvcnQgZm9yIGxpYnhlbm1hbmFnZSIgaGFzIGdvbmUgaW4NCj4+Pj4+IEFORCB0aGUgTWlu
aS1PUyBjb21taXQtaWQgaGFzIGJlZW4gdXBkYXRlZCBpbiBDb25maWcubWsgYWNjb3JkaW5n
bHkhIFRoZQ0KPj4+Pj4gTWluaS1PUyBwYXRjaCBoYXMgYmVlbiBBY2tlZCBhbHJlYWR5LCBz
byBpdCBjYW4gZ28gaW4gYXMgc29vbiBhcyBwYXRjaA0KPj4+Pj4gNSBvZiB0aGlzIHNlcmll
cyAodGhlIG9uZSBpbnRyb2R1Y2luZyBsaWJ4ZW5tYW5hZ2UpIGhhcyBiZWVuIGNvbW1pdHRl
ZC4NCj4+Pj4+DQo+Pj4+PiBBcyBwYXRjaGVzIDEgYW5kIDIgY2hhbmdlIGN1cnJlbnQgYmVo
YXZpb3IsIEphbiBkaWRuJ3Qgd2FudCB0byBnaXZlIGhpcw0KPj4+Pj4gQWNrIChoZSBkaWRu
J3QgcmVqZWN0IHRoZSBwYXRjaCBlaXRoZXIpLiBTbyBJJ20gYXNraW5nIG90aGVyICJSZXN0
Ig0KPj4+Pj4gbWFpbnRhaW5lcnMgdG8gbG9vayBhdCB0aG9zZSBwYXRjaGVzIHNwZWNpZmlj
YWxseS4NCj4+Pj4NCj4+Pj4gLi4uIHBhdGNoZXMgMSBhbmQgMiBjb3VsZCBuZWVkIGFuIGFk
ZGl0aW9uYWwgb3Bpbmlvbi4NCj4+Pg0KPj4+IEFuZCBhbm90aGVyIHBpbmcuDQo+Pj4NCj4+
PiBPbmUgb2YgQW5kcmV3LCBTdGVmYW5vLCBKdWxpZW4sIFJvZ2VyLCBBbnRob255LCBNaWNh
bDogUGxlYXNlIGhhdmUgYSBsb29rLg0KPj4+DQo+Pj4gVGhlIHJlbGF0ZWQgZGlzY3Vzc2lv
biBiZXR3ZWVuIEphbiBhbmQgbWUgY2FuIGJlIGZvdW5kIGhlcmUgKHBhdGNoZXMgMiBhbmQg
Myk6DQo+Pj4NCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyNTAx
MDcxMDE3MTEuNTk4MC0xLWpncm9zc0BzdXNlLmNvbS8NCj4+DQo+PiBJIGRpZG4ndCBkbyBh
biBpbi1kZXRhaWxzIHJldmlldyBidXQgYmFzZWQgb24gSmFuJ3MgY29tbWVudHMgYW5kIHlv
dXINCj4+IHJlcGxpZXMsIEkgdGhpbmsgdGhleSBhcmUgYW4gaW1wcm92ZW1lbnQuIElmIHNv
bWVvbmUgZWxzZSB3YW50cyB0byBkbyBhDQo+PiBwcm9wZXIgcmV2aWV3LCB0aGV5IHdvdWxk
IGJlIHdlbGNvbWUuDQo+Pg0KPj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gDQo+IEkndmUgdGFrZW4gdGhlIGNvbnNlcnZhdGl2
ZSBhcHByb2FjaCBhbmQgaW50ZXJwcmV0ZWQgdGhpcyBhcyBhbiBhY2sgZm9yIHRoZQ0KPiB0
d28gcGF0Y2hlcyBpbiBxdWVzdGlvbiBvbmx5LCByYXRoZXIgdGhhbiB0aGUgZW50aXJlIHNl
cmllcy4gUGxlYXNlIGluZGljYXRlDQo+IGlmIGl0IHdhcyBtZWFudCB0aGUgb3RoZXIgd2F5
IGFyb3VuZCwgYXMgdGhlbiB0aGUgZmluYWwgMyBwYXRjaGVzIGNvdWxkIGFsc28NCj4gZ28g
aW4uDQoNClNvcnJ5LCBidXQgcGxlYXNlIHJldmVydCB0aGUgbGFzdCBwYXRjaCBvZiB0aGlz
IHNlcmllcyB5b3UndmUgY29tbWl0dGVkDQphbHJlYWR5LiBBcyBzdGF0ZWQgaW4gdGhlIGNv
dmVyIGxldHRlciBBTkQgdGhhdCBwYXRjaCwgYSBNaW5pLU9TIHBhdGNoIGFuZA0KdGhlIGJ1
bXAgb2YgdGhlIE1pbmktT1MgY29tbWl0IGluIENvbmZpZy5tayBhcmUgcmVxdWlyZWQgaW4g
b3JkZXIgdG8gYXZvaWQNCmJ1aWxkIGZhaWx1cmVzIHdoZW4gdHJ5aW5nIHRvIGJ1aWxkIHRo
ZSBYZW5zdG9yZS1zdHViZG9tIGJpbmFyaWVzLg0KDQoNCkp1ZXJnZW4NCg==
--------------RU0HKtp4PAZIGvROSUVQ4mSK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------RU0HKtp4PAZIGvROSUVQ4mSK--

--------------9x93gIaY5EK5T06Hw6M4rZh4--

--------------0xI7sKtU8K0Wdv9oTLvy08D5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfJoq0FAwAAAAAACgkQsN6d1ii/Ey+f
TQf/SNcsU0LijYZ/w/rd1mQH5jW5lEF417Oc+IDsjHaVPmFz2k722T+CGcLhKwKbzwUkQhPdHz6a
882sqCt61rZbo/fJgTBeMbgL1ZfUcVnei84+3QYEJGexy5C29ORqnKd995wypAooSfYUCM7A0qeU
kFzrGUXwIl53r/F+1MsM43u+0uExyiELu0gq1C96G1cym6xoQWKyrd9icmr3BSNIoE7EXiLA6q8i
AF7YFHJmqicnNugWJjQbgTlpI4sCTevyvTMowGgDhOqAqb6YctXOVVV/FhtniRcmweRJOAp2GhGU
mFjQkriZ1Dsk1Ma+yX3wk76oroRv9MlqzI2z2IJAkQ==
=slPE
-----END PGP SIGNATURE-----

--------------0xI7sKtU8K0Wdv9oTLvy08D5--

