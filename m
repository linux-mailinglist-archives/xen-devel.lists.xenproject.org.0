Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E9FA54CB1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 14:56:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903575.1311532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBi6-0002r2-9j; Thu, 06 Mar 2025 13:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903575.1311532; Thu, 06 Mar 2025 13:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBi6-0002oI-6O; Thu, 06 Mar 2025 13:56:26 +0000
Received: by outflank-mailman (input) for mailman id 903575;
 Thu, 06 Mar 2025 13:56:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqBi5-0002oC-Av
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 13:56:25 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca8d5d40-fa92-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 14:56:24 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abf5e1a6cd3so120374466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 05:56:24 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23988e584sm100554566b.146.2025.03.06.05.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:56:23 -0800 (PST)
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
X-Inumbo-ID: ca8d5d40-fa92-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741269384; x=1741874184; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=liU28cGLCjyVNVJPx6S6CtMOMSmPsvTQX/ZJLxRxnyg=;
        b=fJDo1JTNZK9WqGNfCPKNoMiz2n0bhJgBMGTC5fCBIXeFP1/NPN43v/x6qWUxE5Wiou
         TBNzBeKxSCKHS9DSIstht0rt3WOYBW15wJ/gAQMR9aeZcIaXqzrHn84WTTPX650+hf/8
         7aAmiZdV2TaXBl9u+av5lELYo/iotDh5a8sZoHkowZJM1CRK+XMcSDP8zk03lbV8Tr/J
         7N7/V42Ww9ZMqEAFxxQRlKMMonWI7eK4VzIjoPUxqlHnV/Blz056R/BH68u1VvJSfGyF
         +OUTDJIQ0qSwBUqh+nkdLBuastt4y289dkaf3GYR6aMF7SGw+JChmohFQdWtFN5jYb+X
         FK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741269384; x=1741874184;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=liU28cGLCjyVNVJPx6S6CtMOMSmPsvTQX/ZJLxRxnyg=;
        b=S2hXPIXHSx/ho74SD9Fiaq7bfm5PPwY3YEQwPk/tNjlNyV39ysHYNNd4tyLYGgaeha
         ZdBn58Fei601yPLYksnaFfEARUZlXjq8QhGkl50piTWznyVqUvszlVUbZ3AcyxGM6c8y
         IGjEXzUswed77GNwkQTO8P8XIvvGYKpFPWdOj31EDxKhW5xa+9Du9/gFzRnfQ2anCpcO
         KYVjzB2BFiwC+N5xygqP72Y9I7boNPFgmGl5OhaFwtdtN4/5Pw46p2EMXORELWpIk9bJ
         lqySPZQHu0+QfOdubaS2f+xUgHYgEJ9k77ZxFOsHqVzVeb3H/GIW6Nxs7MreR96KnCyp
         0sew==
X-Gm-Message-State: AOJu0YyT0h2ZcqKzNb4RR3mUQ9knU72NR4ERX9sPcIrhcbkpGMCWwNq9
	UmAf0arTCccvUXU6U4/t3MccXLG5BXVS+7D6qjd5BjfT4O5Nao6IYzdwUf2bBc0=
X-Gm-Gg: ASbGncuFpj7bw8X2LuDYvMHFMXR/FDKIUGYfmekTk04Yks5TA7A08MDfwAlX+MSAYxA
	XxJWj2YladxFnw2drlj/qCFI4Ak0abRgUVss+elRS0kPYmV3X15L6wRp/UVtDVsZzcjzOczPpUK
	OQurQV7s1GZt42rjW7aS9MkG+p2BjbGpkvF1nQo8SlTWjK8PLu2252arDB626gueNsIoNkAmBWf
	YK2L7l+mXEj5panKJwFvEaG+iRfcbB10W7bA38wuYBigi8MTu8zijB78AB2MKGQP6GYMlDz7dlZ
	NL/r0yW55DgjPBsuRm9I+MZSbktLRogCymKDZgNIv2RAa8MSSBwUQ4G3Xcpk/CgEtFARzNvSTJB
	RfXisxWfvk/IbHZb+duy7/sODI9dgCceuEwa3bxb50XdjYDQ4VSkTQ4FA1CQXjlIA1m0=
X-Google-Smtp-Source: AGHT+IElQJQxw7rbBZxuQCSuuwChrIVDYVLGeeXHHH8O5rq5JCFSkxUpAeH8R+mQEXw7bVLUzJpmcQ==
X-Received: by 2002:a17:907:3f15:b0:abf:5fa3:cf96 with SMTP id a640c23a62f3a-ac20daad2a9mr677755166b.14.1741269383610;
        Thu, 06 Mar 2025 05:56:23 -0800 (PST)
Message-ID: <85d4f6f1-7fd0-4555-9ad9-c92469f8c8fc@suse.com>
Date: Thu, 6 Mar 2025 14:56:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
 <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
 <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
 <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
 <0ef805d0-68f1-4fb2-a6bb-5901304270bd@suse.com>
 <98ed1cc8-48e9-4db0-8d0c-78c63fc2e4fe@suse.com>
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
In-Reply-To: <98ed1cc8-48e9-4db0-8d0c-78c63fc2e4fe@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d5PvF9eSABHcuh4CnKq8Wjq0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------d5PvF9eSABHcuh4CnKq8Wjq0
Content-Type: multipart/mixed; boundary="------------6evQufgbRvbZynEHiH7j0rOs";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <85d4f6f1-7fd0-4555-9ad9-c92469f8c8fc@suse.com>
Subject: Re: [PATCH v8 0/9] remove libxenctrl usage from xenstored
References: <20250204113407.16839-1-jgross@suse.com>
 <6e63a858-9554-440b-92f1-55dc34256e0b@suse.com>
 <9c8f50d4-9139-4541-8acb-ff407b61ef97@suse.com>
 <alpine.DEB.2.22.394.2503051531380.1303386@ubuntu-linux-20-04-desktop>
 <c26a91be-8f13-4e22-be87-a96b81df0aa4@suse.com>
 <0ef805d0-68f1-4fb2-a6bb-5901304270bd@suse.com>
 <98ed1cc8-48e9-4db0-8d0c-78c63fc2e4fe@suse.com>
In-Reply-To: <98ed1cc8-48e9-4db0-8d0c-78c63fc2e4fe@suse.com>
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

--------------6evQufgbRvbZynEHiH7j0rOs
Content-Type: multipart/mixed; boundary="------------Hv9OqfVZvBujihxODLW0fS0h"

--------------Hv9OqfVZvBujihxODLW0fS0h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjUgMTQ6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDI1
IDE0OjI3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDYuMDMuMjUgMTQ6MTMsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA2LjAzLjIwMjUgMDA6MzIsIFN0ZWZhbm8gU3Rh
YmVsbGluaSB3cm90ZToNCj4+Pj4gT24gV2VkLCA1IE1hciAyMDI1LCBKdWVyZ2VuIEdyb3Nz
IHdyb3RlOg0KPj4+Pj4gT24gMjUuMDIuMjUgMTI6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6
DQo+Pj4+Pj4gUGluZz8gRXNwZWNpYWxseSAuLi4NCj4+Pj4+Pg0KPj4+Pj4+IE9uIDA0LjAy
LjI1IDEyOjMzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+PiBYZW5zdG9yZWQgaXMg
dXNpbmcgbGlieGVuY3RybCBmb3Igb25seSBvbmUgcHVycG9zZTogdG8gZ2V0IGluZm9ybWF0
aW9uDQo+Pj4+Pj4+IGFib3V0IHN0YXRlIG9mIGRvbWFpbnMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+
IFRoaXMgcGF0Y2ggc2VyaWVzIGlzIHJlbW92aW5nIHRoYXQgZGVwZW5kZW5jeSBieSBpbnRy
b2R1Y2luZyBhIG5ldw0KPj4+Pj4+PiBzdGFibGUgaW50ZXJmYWNlIHdoaWNoIGNhbiBiZSB1
c2VkIGJ5IHhlbnN0b3JlZCBpbnN0ZWFkLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGVyZSB3YXMg
YSBSRkMgc2VyaWVzIHNlbnQgb3V0IDMgeWVhcnMgYWdvLCB3aGljaCBJIGhhdmUgdGFrZW4g
YXMgYQ0KPj4+Pj4+PiBiYXNlIGFuZCBieSBhZGRyZXNzaW5nIGFsbCBjb21tZW50cyBmcm9t
IGJhY2sgdGhlbi4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gVGhlIG1haW4gZGlmZmVyZW5jZXMgc2lu
Y2UgdGhhdCBSRkMgc2VyaWVzIGFyZToNCj4+Pj4+Pj4NCj4+Pj4+Pj4gLSBJbnN0ZWFkIG9m
IGludHJvZHVjaW5nIGFuIG5ldyBtYWluIGh5cGVyY2FsbCBmb3IgYSBzdGFibGUgbWFuYWdl
bWVudA0KPj4+Pj4+PiAgIMKgwqAgaW50ZXJmYWNlIEkgaGF2ZSBqdXN0IGFkZGVkIGEgbmV3
IGRvbWN0bCBzdWItb3AsIGFzIHJlcXVlc3RlZCBpbiAyMDIxLg0KPj4+Pj4+Pg0KPj4+Pj4+
PiAtIEkgaGF2ZSBhZGRlZCBhIG5ldyBsaWJyYXJ5IGxpYnhlbm1hbmFnZSBmb3IgZWFzeSB1
c2Ugb2YgdGhlIG5ldw0KPj4+Pj4+PiAgIMKgwqAgc3RhYmxlIGh5cGVydmlzb3IgaW50ZXJm
YWNlLiBNYWluIG1vdGl2YXRpb24gZm9yIGFkZGluZyB0aGUgbGlicmFyeQ0KPj4+Pj4+PiAg
IMKgwqAgd2FzIHRoZSByZWNlbnQgYXR0ZW1wdCB0byBkZWNvdXBsZSBveGVuc3RvcmVkIGZy
b20gdGhlIFhlbiBnaXQgdHJlZS4NCj4+Pj4+Pj4gICDCoMKgIEJ5IHVzaW5nIHRoZSBuZXcg
bGlicmFyeSwgb3hlbnN0b3JlZCBjb3VsZCBiZW5lZml0IGluIHRoZSBzYW1lIHdheSBhcw0K
Pj4+Pj4+PiAgIMKgwqAgeGVuc3RvcmVkIGZyb20gdGhlIG5ldyBpbnRlcmZhY2U6IGl0IHdv
dWxkIGJlIHBvc3NpYmxlIHRvIHJlbHkgb24NCj4+Pj4+Pj4gICDCoMKgIHN0YWJsZSBsaWJy
YXJpZXMgb25seS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gLSBNaW5pLU9TIGhhcyBnYWluZWQgc29t
ZSBtb3JlIGNvbmZpZyBvcHRpb25zIHJlY2VudGx5LCBzbyBpdCB3YXMgcmF0aGVyDQo+Pj4+
Pj4+ICAgwqDCoCBlYXN5IHRvIG1ha2UgeGVuc3RvcmVbcHZoXS1zdHViZG9tIGluZGVwZW5k
ZW50IGZyb20gbGlieGVuY3RybCwgdG9vLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBQbGVhc2Ugbm90
ZSB0aGF0IHRoZSBsYXN0IDQgcGF0Y2hlcyBjYW4gYmUgY29tbWl0dGVkIG9ubHkgYWZ0ZXIg
dGhlDQo+Pj4+Pj4+IHJlbGF0ZWQgTWluaS1PUyBwYXRjaCAiY29uZmlnOiBhZGQgc3VwcG9y
dCBmb3IgbGlieGVubWFuYWdlIiBoYXMgZ29uZSBpbg0KPj4+Pj4+PiBBTkQgdGhlIE1pbmkt
T1MgY29tbWl0LWlkIGhhcyBiZWVuIHVwZGF0ZWQgaW4gQ29uZmlnLm1rIGFjY29yZGluZ2x5
ISBUaGUNCj4+Pj4+Pj4gTWluaS1PUyBwYXRjaCBoYXMgYmVlbiBBY2tlZCBhbHJlYWR5LCBz
byBpdCBjYW4gZ28gaW4gYXMgc29vbiBhcyBwYXRjaA0KPj4+Pj4+PiA1IG9mIHRoaXMgc2Vy
aWVzICh0aGUgb25lIGludHJvZHVjaW5nIGxpYnhlbm1hbmFnZSkgaGFzIGJlZW4gY29tbWl0
dGVkLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBBcyBwYXRjaGVzIDEgYW5kIDIgY2hhbmdlIGN1cnJl
bnQgYmVoYXZpb3IsIEphbiBkaWRuJ3Qgd2FudCB0byBnaXZlIGhpcw0KPj4+Pj4+PiBBY2sg
KGhlIGRpZG4ndCByZWplY3QgdGhlIHBhdGNoIGVpdGhlcikuIFNvIEknbSBhc2tpbmcgb3Ro
ZXIgIlJlc3QiDQo+Pj4+Pj4+IG1haW50YWluZXJzIHRvIGxvb2sgYXQgdGhvc2UgcGF0Y2hl
cyBzcGVjaWZpY2FsbHkuDQo+Pj4+Pj4NCj4+Pj4+PiAuLi4gcGF0Y2hlcyAxIGFuZCAyIGNv
dWxkIG5lZWQgYW4gYWRkaXRpb25hbCBvcGluaW9uLg0KPj4+Pj4NCj4+Pj4+IEFuZCBhbm90
aGVyIHBpbmcuDQo+Pj4+Pg0KPj4+Pj4gT25lIG9mIEFuZHJldywgU3RlZmFubywgSnVsaWVu
LCBSb2dlciwgQW50aG9ueSwgTWljYWw6IFBsZWFzZSBoYXZlIGEgbG9vay4NCj4+Pj4+DQo+
Pj4+PiBUaGUgcmVsYXRlZCBkaXNjdXNzaW9uIGJldHdlZW4gSmFuIGFuZCBtZSBjYW4gYmUg
Zm91bmQgaGVyZSAocGF0Y2hlcyAyIGFuZCAzKToNCj4+Pj4+DQo+Pj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAyNTAxMDcxMDE3MTEuNTk4MC0xLWpncm9zc0Bz
dXNlLmNvbS8NCj4+Pj4NCj4+Pj4gSSBkaWRuJ3QgZG8gYW4gaW4tZGV0YWlscyByZXZpZXcg
YnV0IGJhc2VkIG9uIEphbidzIGNvbW1lbnRzIGFuZCB5b3VyDQo+Pj4+IHJlcGxpZXMsIEkg
dGhpbmsgdGhleSBhcmUgYW4gaW1wcm92ZW1lbnQuIElmIHNvbWVvbmUgZWxzZSB3YW50cyB0
byBkbyBhDQo+Pj4+IHByb3BlciByZXZpZXcsIHRoZXkgd291bGQgYmUgd2VsY29tZS4NCj4+
Pj4NCj4+Pj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4NCj4+Pg0KPj4+IEkndmUgdGFrZW4gdGhlIGNvbnNlcnZhdGl2ZSBhcHByb2Fj
aCBhbmQgaW50ZXJwcmV0ZWQgdGhpcyBhcyBhbiBhY2sgZm9yIHRoZQ0KPj4+IHR3byBwYXRj
aGVzIGluIHF1ZXN0aW9uIG9ubHksIHJhdGhlciB0aGFuIHRoZSBlbnRpcmUgc2VyaWVzLiBQ
bGVhc2UgaW5kaWNhdGUNCj4+PiBpZiBpdCB3YXMgbWVhbnQgdGhlIG90aGVyIHdheSBhcm91
bmQsIGFzIHRoZW4gdGhlIGZpbmFsIDMgcGF0Y2hlcyBjb3VsZCBhbHNvDQo+Pj4gZ28gaW4u
DQo+Pg0KPj4gU29ycnksIGJ1dCBwbGVhc2UgcmV2ZXJ0IHRoZSBsYXN0IHBhdGNoIG9mIHRo
aXMgc2VyaWVzIHlvdSd2ZSBjb21taXR0ZWQNCj4+IGFscmVhZHkuIEFzIHN0YXRlZCBpbiB0
aGUgY292ZXIgbGV0dGVyIEFORCB0aGF0IHBhdGNoLCBhIE1pbmktT1MgcGF0Y2ggYW5kDQo+
PiB0aGUgYnVtcCBvZiB0aGUgTWluaS1PUyBjb21taXQgaW4gQ29uZmlnLm1rIGFyZSByZXF1
aXJlZCBpbiBvcmRlciB0byBhdm9pZA0KPj4gYnVpbGQgZmFpbHVyZXMgd2hlbiB0cnlpbmcg
dG8gYnVpbGQgdGhlIFhlbnN0b3JlLXN0dWJkb20gYmluYXJpZXMuDQo+IA0KPiBJbmRlZWQs
IEkgb3Zlcmxvb2tlZCB0aGlzIHdoaWxlIHByZXBhcmluZyB3aGF0IHRvIGNvbW1pdCAod2hp
bGUgSSByZW1lbWJlcg0KPiBub3RpY2luZyBpdCBlYXJsaWVyIG9uKS4gU3RpbGwgaXQncyBw
cm9iYWJseSBzdWItb3B0aW1hbCB0byBoYXZlIGEgc2VyaWVzDQo+IHNwbGl0IGluIHRoZSBt
aWRkbGUgbGlrZSB0aGlzLg0KDQpJbiBmdXR1cmUgSSdsbCB1c2UgMiBzZXJpZXMgaW4gc3Vj
aCBhIGNhc2UuDQoNCj4gDQo+IEluc3RlYWQgb2YgcmV2ZXJ0aW5nLCBsZXQncyBidW1wIHRo
ZSBNaW5pT1MgcmVmIGluIHN0YWdpbmcgaW5zdGVhZCwgYXMgeW91DQo+IGRpZCBzdWdnZXN0
IG9uIE1hdHJpeC4NCg0KWWVhaCwgcGF0Y2ggaGFzIGJlZW4gc2VudCBhbHJlYWR5Lg0KDQoN
Ckp1ZXJnZW4NCg==
--------------Hv9OqfVZvBujihxODLW0fS0h
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Hv9OqfVZvBujihxODLW0fS0h--

--------------6evQufgbRvbZynEHiH7j0rOs--

--------------d5PvF9eSABHcuh4CnKq8Wjq0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfJqYYFAwAAAAAACgkQsN6d1ii/Ey8u
GQgAh95h23n6djsKh16trULsb7kDqREt/X6rzqXedjGKQ5Aeo+TURjuuVzndjPOENLXJljq41GaE
PLDArwMYKxiTMy2SfjpTZ8jULU4+E7AYu5MHLO5vcgzviKCEiO1kpdX0Dx92y787RoExWx3oPeWb
YJ7evxEvUXmDgygcNQfTF8xL4igGyehG/JUMSxYJ/gwG/Lp9alJ+9I5+a7d3biuXbjl4lBifCi8A
+o6I7GuTxbLiCFwQ+WpOgX8/lPKMMCsAnQChXi3eFuYOPrJZ1YnByv3Gjsqse+jvn2tznEj5yV2x
XmSOp/F7lPLh4TSHS+ubXlAfNZhcLdNk0brO1Ss/1w==
=eGmk
-----END PGP SIGNATURE-----

--------------d5PvF9eSABHcuh4CnKq8Wjq0--

