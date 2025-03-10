Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACEA58F91
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:25:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906318.1313764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZO1-000784-UR; Mon, 10 Mar 2025 09:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906318.1313764; Mon, 10 Mar 2025 09:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZO1-00076Z-QS; Mon, 10 Mar 2025 09:25:25 +0000
Received: by outflank-mailman (input) for mailman id 906318;
 Mon, 10 Mar 2025 09:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6jP+=V5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1trZO0-00076R-DM
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:25:24 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 974a6668-fd91-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 10:25:22 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so4132130a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:25:22 -0700 (PDT)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c733f4c3sm6857766a12.14.2025.03.10.02.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:25:21 -0700 (PDT)
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
X-Inumbo-ID: 974a6668-fd91-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741598722; x=1742203522; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9Xm4DoeAjlL3wO1fwg8IHMAUEWAkH8Rk3I2Za7KFTco=;
        b=YssK5EyJxCtmVOrBt3p0i4UAvIl2/mvmpH93daFE6Xkv6vV3AOqyGu5iKlaXL0pAl9
         XLdFm1WcSSNQY+zqUvVRdj9S3wI5p5mf7jMc84B2iNS1ejTSCe3UAgaGJJc9qff3Dt53
         ifhljnYhxmV79MpE0MzION9cxD8s0YEEKnAa2j3EjEfgfQnO/VROwTGp2JrFZbljigJx
         spfjHRYbshQyilv4Cti1OvgyJO7b7D01VAAAsTt2bqsAMdmXin1WhRYPA1OwegmgoJNz
         xaX107Pxnp3NAkWaTeFijww+g0N1JpnozTG4tqqcmv1hdmmTNFDHtzCENTUPUufXMB+n
         xm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741598722; x=1742203522;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Xm4DoeAjlL3wO1fwg8IHMAUEWAkH8Rk3I2Za7KFTco=;
        b=lthQFVaBIYQVfxys6YF2CIMnlBaUR6ZYZ8+/N+SAHoUR08FdayXiOKl3OxXYLSo43y
         zVb38MH8c8P2sTw8IvyDFhJbMqiY0o9JGCJqMzdNNDGYfmkargcOXQbs3ZhSnTCPp2YB
         9PPGXI+hI8uv++cFDSG2+yApXcuFqWQrpNoug7PWXT4nOD29VaUKfXKu7e7NrFXKgOh6
         ZjmEww22PFWPExd1+KWK5+USHWtx75zmqA1jWPBojHpsaW/wqIp2c0VPIeAfFbhhXQWd
         5jdkJoKyeQCjEo1s3PtLOrARU2j8YjYrYxTIXXm52y1/6B/BHdBnCZSQ2y59rE3jQAI7
         mEug==
X-Forwarded-Encrypted: i=1; AJvYcCWPc/7dFKoWXcyMAGA0Kc/ky9+ZYtIyvDitJXi9pBy+8ccFsngwv5ipY91mIpqSfoYZtt0FdNZkeEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwzY6isBw2OMqXYZWWLhdt8ilnaI1eQSZ36Thw+/PXqJw/ioAv
	kpX895TW9Aao2pdvEO48MC4sedWepKQvWxJVOjk85K3INklq2gM0DjK4RLq7J7A=
X-Gm-Gg: ASbGncug1Q0jb23tZpCj+ejj/mbNeSCre1pqO9+qFp4BW3jln24hJcycdlnjD9skhtd
	pX2taAD1HcPN58Y9ur6JlXZUIqaMDUjGQn/n7m5wsy7KchrZPuEeJ/EqX52Zirzo9hqWC+/Snh4
	mkgSkFiAFiThOw8HwTeNgfvHZbXrKCHMDJd58MhLoE2emXbXPxHxbHu1ntTCCbY41LL+NIlWRuy
	QoCb/+pA6qdY052lS5HtFYzxSBnqf6alu2K+ABwNKavf4FtE38XJT/ElWcNwovLaOgofQ/k2fzV
	lbavr93Ebg14W/O1ry4T1QsSaP16gDk2QlepMIflxLBCtri6BZ+7jUXAI1lcIqEvXPqNFQoGuUx
	ZalqHR2bIBWqmo9FYfh9pyA+S0U66VLOiv8CPk6wDOg+TwMJCQDi3bsogmsZ4SaZcL2Kd/ITnqg
	DQ1w==
X-Google-Smtp-Source: AGHT+IFN9hLL//hnUZwNtmSdbqqlUJd30ZbSJhVU9N8gJ7xDRjDWhZbi+1CZi1XD9q4JosFUCfkdjw==
X-Received: by 2002:a05:6402:5c8:b0:5e4:bf03:e907 with SMTP id 4fb4d7f45d1cf-5e5e22da05bmr15864862a12.19.1741598721723;
        Mon, 10 Mar 2025 02:25:21 -0700 (PDT)
Message-ID: <568c83e7-bf96-4a9f-98d2-19266f052ab0@suse.com>
Date: Mon, 10 Mar 2025 10:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fix INTRODUCE description in xenstore.txt
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250305085201.14258-1-jgross@suse.com>
 <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
 <3f6f680d-3be7-41d8-a599-49521766aa62@suse.com>
 <0a3db119-11d2-4f25-bf50-f84b79a6a246@citrix.com>
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
In-Reply-To: <0a3db119-11d2-4f25-bf50-f84b79a6a246@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Nf2FEPSFXyY4501yTFOlzDp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Nf2FEPSFXyY4501yTFOlzDp
Content-Type: multipart/mixed; boundary="------------n3GWNmgcLcQ0BJpu6UqaCScW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <568c83e7-bf96-4a9f-98d2-19266f052ab0@suse.com>
Subject: Re: [PATCH] docs: fix INTRODUCE description in xenstore.txt
References: <20250305085201.14258-1-jgross@suse.com>
 <499e999a-06d9-4a49-b223-b04bb0c34edb@citrix.com>
 <3f6f680d-3be7-41d8-a599-49521766aa62@suse.com>
 <0a3db119-11d2-4f25-bf50-f84b79a6a246@citrix.com>
In-Reply-To: <0a3db119-11d2-4f25-bf50-f84b79a6a246@citrix.com>
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

--------------n3GWNmgcLcQ0BJpu6UqaCScW
Content-Type: multipart/mixed; boundary="------------030pSoBrfnQJGLt7hQvZEQSl"

--------------030pSoBrfnQJGLt7hQvZEQSl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMDMuMjUgMDE6MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA2LzAzLzIw
MjUgNzowOSBhbSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+IE9uIDA1LjAzLjI1IDIzOjU3
LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDA1LzAzLzIwMjUgODo1MiBhbSwgSnVl
cmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gVGhlIGRlc2NyaXB0aW9uIG9mIHRoZSBYZW5zdG9y
ZSBJTlRST0RVQ0UgY29tbWFuZCBpcyBzdGlsbCByZWZlcmVuY2luZw0KPj4+PiB4ZW5kLiBG
aXggdGhhdC4NCj4+Pj4NCj4+Pj4gV2hpbGUgYXQgaXQsIG1ha2UgY2xlYXIgdGhhdCB0aGUg
WGVuc3RvcmUgaW1wbGVtZW50YXRpb24gaXMgYWxsb3dlZA0KPj4+PiB0byBpZ25vcmUgdGhl
IHNwZWNpZmllZCBnZm4gYW5kIHVzZSB0aGUgWGVuc3RvcmUgcmVzZXJ2ZWQgZ3JhbnQgaWQN
Cj4+Pj4gR05UVEFCX1JFU0VSVkVEX1hFTlNUT1JFIGluc3RlYWQuDQo+Pj4+DQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+ICDCoCBkb2NzL21pc2MveGVuc3RvcmUudHh0IHwgNiArKysrKy0NCj4+Pj4gIMKg
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4N
Cj4+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQgYi9kb2NzL21pc2Mv
eGVuc3RvcmUudHh0DQo+Pj4+IGluZGV4IDM4MDE1ODM1YjEuLmQ4OTRkMjRkMTEgMTAwNjQ0
DQo+Pj4+IC0tLSBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4+Pj4gKysrIGIvZG9jcy9t
aXNjL3hlbnN0b3JlLnR4dA0KPj4+PiBAQCAtMjg2LDcgKzI4Niw3IEBAIFRSQU5TQUNUSU9O
X0VORMKgwqDCoMKgwqDCoMKgIEZ8DQo+Pj4+ICDCoCBJTlRST0RVQ0XCoMKgwqDCoMKgwqDC
oCA8ZG9taWQ+fDxnZm4+fDxldnRjaG4+fD8NCj4+Pj4gIMKgwqDCoMKgwqAgTm90aWZpZXMg
eGVuc3RvcmVkIHRvIGNvbW11bmljYXRlIHdpdGggdGhpcyBkb21haW4uDQo+Pj4+ICDCoCAt
wqDCoMKgIElOVFJPRFVDRSBpcyBjdXJyZW50bHkgb25seSB1c2VkIGJ5IHhlbmQgKGR1cmlu
ZyBkb21haW4NCj4+Pj4gK8KgwqDCoCBJTlRST0RVQ0UgaXMgY3VycmVudGx5IG9ubHkgdXNl
ZCBieSB4ZW4gdG9vbHMgKGR1cmluZyBkb21haW4NCj4+Pj4gIMKgwqDCoMKgwqAgc3RhcnR1
cCBhbmQgdmFyaW91cyBmb3JtcyBvZiByZXN0b3JlIGFuZCByZXN1bWUpLCBhbmQNCj4+Pj4g
IMKgwqDCoMKgwqAgeGVuc3RvcmVkIHByZXZlbnRzIGl0cyB1c2Ugb3RoZXIgdGhhbiBieSBk
b20wLg0KPj4+PiAgwqAgQEAgLTI5OSw2ICsyOTksMTAgQEAgSU5UUk9EVUNFwqDCoMKgwqDC
oMKgwqAgPGRvbWlkPnw8Z2ZuPnw8ZXZ0Y2huPnw/DQo+Pj4+ICDCoMKgwqDCoMKgIGZvciBl
eGFtcGxlIHBhc3NpbmcgYSBoaWdoLWJpdC1zZXQgMzItYml0IGdmbiBhcyBhbiB1bnNpZ25l
ZA0KPj4+PiAgwqDCoMKgwqDCoCBkZWNpbWFsIHdpbGwgYXR0ZW1wdCB0byB1c2UgMHg3ZmZm
ZmZmZiBpbnN0ZWFkICghKS4NCj4+Pj4gIMKgICvCoMKgwqAgWGVuc3RvcmVkIG1pZ2h0IGln
bm9yZSB0aGUgPGdmbj4gdmFsdWUgYW5kIHVzZSB0aGUgcmVzZXJ2ZWQNCj4+Pj4gK8KgwqDC
oCBncmFudCB0YWJsZSBlbnRyeSBHTlRUQUJfUkVTRVJWRURfWEVOU1RPUkUgaW5zdGVhZCBm
b3IgbWFwcGluZw0KPj4+PiArwqDCoMKgIHRoZSBYZW5zdG9yZSBpbnRlcmZhY2UgcGFnZSBv
ZiB0aGUgZ3Vlc3QuDQo+Pj4NCj4+PiBJJ2Qgc3VnZ2VzdCBtYWtpbmcgYSBzdHJvbmdlciBz
dGF0ZW1lbnQgdGhhbiB0aGlzLg0KPj4+DQo+Pj4gLS0tDQo+Pj4gVGhlIDxnZm4+IGZpZWxk
IGlzIHVzZWQgYnkgeGVuc3RvcmVkcyB3aGljaCB1c2UgZm9yZWlnbiBtYXBwaW5nIHRvDQo+
Pj4gYWNjZXNzIHRoZSByaW5nIHBhZ2UuDQo+Pj4NCj4+PiBBbHRlcm5hdGl2ZWx5LCBHcmFu
dCAxIChHTlRUQUJfUkVTRVJWRURfWEVOU1RPUkUpIGlzIHJlc2VydmVkIGZvciB0aGUNCj4+
PiBzYW1lIHB1cnBvc2UsIGFuZCBpcyBwb3B1bGF0ZWQgYnkgdGhlIGRvbWFpbiBidWlsZGVy
IG9uIGJlaGFsZiBvZiB0aGUNCj4+PiBndWVzdC7CoCBUaGlzIG1lY2hhbmlzbSBpcyBwcmVm
ZXJyZWQgYmVjYXVzZSByZWR1Y2VzIHRoZSBwZXJtaXNzaW9ucyB0aGF0DQo+Pj4geGVuc3Rv
cmVkIG5lZWRzIGluIG9yZGVyIHRvIGZ1bmN0aW9uLg0KPj4+DQo+Pj4gQm90aCA8Z2ZuPiBh
bmQgR3JhbnQgMSBuZWVkIHRvIGFncmVlLCBiZWNhdXNlIGltcGxlbWVudGF0aW9ucyBvZg0K
Pj4+IHhlbnN0b3JlZCB3aWxsIHVzZSBvbmUgYW5kIGlnbm9yZSB0aGUgb3RoZXIuDQo+Pg0K
Pj4gRmluZSB3aXRoIG1lLg0KPiANCj4gQXJlIHlvdSBoYXBweSBmb3IgbWUgdG8gYWRqdXN0
IG9uIGNvbW1pdCwgb3IgZG8geW91IHdhbnQgYSB2MiBzZW5kaW5nIG91dD8NCj4gDQo+IH5B
bmRyZXcNCg0KSSBkaWQgc2VuZCBvdXQgVjI6DQoNCmh0dHBzOi8vbGlzdHMueGVuLm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDI1LTAzL21zZzAwMjQ4Lmh0bWwNCg0KDQpKdWVy
Z2VuDQo=
--------------030pSoBrfnQJGLt7hQvZEQSl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R3/CwO0EGAEIACAWIQSFEmdy6PYElKXQl/ew3p3W
KL8TLwUCWt3w0AIbAgCBCRCw3p3WKL8TL3YgBBkWCAAdFiEEUy2wekH2OPMeOLge
gFxhu0/YY74FAlrd8NAACgkQgFxhu0/YY75NiwD/fQf/RXpyv9ZX4n8UJrKDq422
bcwkujisT6jix2mOOwYBAKiip9+mAD6W5NPXdhk1XraECcIspcf2ff5kCAlG0DIN
aTUH/RIwNWzXDG58yQoLdD/UPcFgi8GWtNUp0Fhc/GeBxGipXYnvuWxwS+Qs1Qay
7/Nbal/v4/eZZaWs8wl2VtrHTS96/IF6q2o0qMey0dq2AxnZbQIULiEndgR625EF
RFg+IbO4ldSkB3trsF2ypYLij4ZObm2casLIP7iB8NKmQ5PndL8Y07TtiQ+Sb/wn
g4GgV+BJoKdDWLPCAlCMilwbZ88Ijb+HF/aipc9hsqvW/hnXC2GajJSAY3Qs9Mib
4Hm91jzbAjmp7243pQ4bJMfYHemFFBRaoLC7ayqQjcsttN2ufINlqLFPZPR/i3IX
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------030pSoBrfnQJGLt7hQvZEQSl--

--------------n3GWNmgcLcQ0BJpu6UqaCScW--

--------------0Nf2FEPSFXyY4501yTFOlzDp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfOsAAFAwAAAAAACgkQsN6d1ii/Ey+t
Lgf/YMhRjgjrYWmzulByXCO1EdG6aB04gIY6egIRONe0iSc1LW4Mm6mbxoLEivW3SW9zk3k/9byC
wRlKIUSS6c6Dy6M8IJbcqHXFpEX5HlNwTyWtEGIyUyJP7vp1kDiZ8rSOH2+ikJYTuS7A+N4WrOVk
VInQm6GBTLrU0Wc4kfSQ+PT83FWaH38NRTckRrPBtp38wDN4W3tSrRXQIVwgoP3ZkFacWIGjwDXR
ScHWFATgXD2aVOmNEummh+znBu93CxRQB/430++k1LCZmNGwZ9nCg9ylgXLr0eW6z0fYXXHs+48h
Ol2n1wqReikSNvk4zJyykadwo5rwExMfg2U1FbiAYA==
=pfg/
-----END PGP SIGNATURE-----

--------------0Nf2FEPSFXyY4501yTFOlzDp--

