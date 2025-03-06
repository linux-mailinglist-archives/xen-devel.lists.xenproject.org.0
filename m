Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B91A54C0C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 14:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903519.1311478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBCy-0002xu-MK; Thu, 06 Mar 2025 13:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903519.1311478; Thu, 06 Mar 2025 13:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqBCy-0002up-J8; Thu, 06 Mar 2025 13:24:16 +0000
Received: by outflank-mailman (input) for mailman id 903519;
 Thu, 06 Mar 2025 13:24:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqBCw-0002uj-Eo
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 13:24:14 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b945dbd-fa8e-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 14:24:13 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e4f88ea298so1093453a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 05:24:13 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c766a028sm932871a12.50.2025.03.06.05.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:24:12 -0800 (PST)
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
X-Inumbo-ID: 4b945dbd-fa8e-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741267453; x=1741872253; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fTLVsGZfKzSmrsc+ubyAUbS4+I9CmyZc1hR93CQQSC0=;
        b=Yqe7P1WtGXydQbL2gW8sNKqxdMbtr9ktGasdvopqDTVPwuKbF/0APHe/5u61n4ssSD
         Z6RDc1YWAHyLbbPYoT5e1vzNevSe5BSk/vyTqsiw9rch+a10SjK87iEXSE+/iYv/jNn+
         sdoyDnZOzYR8IHu9fMMiJesufxQQgl7qOtQ3pwOWYeaBEHm+uXtYVQa0uWjf+Tv3iCTc
         6g5EYUev5Ab92cMtD+k9HFCQGBmODFq8dn+McG6VQeOKkm9cu4buTdlNRYdfxWQkc+Q2
         X0NHzSr0Es+1IKSLmQ4qkIGlZiQSByxfiiTGxk3REX9ot+N6ixxF1UnKgKq1qIHhZEKV
         ygtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267453; x=1741872253;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTLVsGZfKzSmrsc+ubyAUbS4+I9CmyZc1hR93CQQSC0=;
        b=Y3q2kqtz1a54OqiHS5ByIdNPIhD9Krr82nDpFtJgkRDw8hNTaR7cJiVD0Mcugy6k+E
         yC/17HkQ0xBLO/SWvbJvOHsqh7d69f56m8C2cpOn6Ji4nPlQQKYlpYGWkAB+jMH8tfe4
         wNVEnwxJu91pz6Ksw2IHrPStO2tOweGirNXIuG3R3EA9P8+WOzZWNdrLj7jNntvewprU
         CFm1Fo2F96FjIZjUG9FsrN8r8izpy+OVygXMabOoqO5L4jZ71rpoBoE44aquKFdjpFg1
         y7QyL/DU8OeTlfIM17iG6FHPVip16vZ0nmNuraQgLAoGdRUU1dI+68jyYNTUQU8cXe4+
         3vnw==
X-Forwarded-Encrypted: i=1; AJvYcCXKPuWCQgIVMRa1j6J6HTKHFqJ/LliG/R1bBmqyWRUfLTNPE1CrGjBnVSJIkq2zQLMr2LAHr1maLRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfkFunus+oucXGWOT0hl8JXdAsw+pZoHMQLuLiZXvB/0CweAIg
	tyUcDXAejSARM5OixDoNylLAIrxYDgDUOws2anjx7OlBL0oVv6V4YN9rvV+UGNQ=
X-Gm-Gg: ASbGncv/QVVYXxmeusci9KV6jmMAzZ4IgonGii4ScqKaDiFWs89tkF6KXGQRkxWU5pn
	LcGLBMfIXnX1Xbo5pGKAuwwJAFz8k0FRzn/YcNZpJzv2vGAZI96djfyEN39UWsJH1JvSu1zfnKU
	JMHuJbsmn/VhVqxDM3h2Vz6H56vNknd/sNbcYHVcSx8BlgF/HbEGE+hwxCSCTnjg3X5dfWcteRf
	8RD+7VJg9IER1qspCIT7ADsUbOPNLUFhoNgqivERFEthpLcm83t+xcIWOi/DtSI6sZ/fBL5Budc
	juDmQTRXXvHk67KF18qA5NlK8GCR09N+VlHJk+AMXCtH54bmrPqT0dH+J42zfu+aXOApYwYlni+
	YSQcc0D5EYhsI07S6AVM5ae9JgEEEyBqgjGHp7C2F/i5sWFVJAjwBfS0JO3z3l1AeWOQ=
X-Google-Smtp-Source: AGHT+IF+ZLg0gDLYW8fCRyScwjmM52gD2yWx9Ujot2Tmm0ISpVoiMl8Nw9VQqjR8TxtW2foud14ytg==
X-Received: by 2002:a05:6402:430f:b0:5e4:cfb0:f651 with SMTP id 4fb4d7f45d1cf-5e59f385a07mr7878106a12.6.1741267452593;
        Thu, 06 Mar 2025 05:24:12 -0800 (PST)
Message-ID: <b087c884-d220-4787-a51e-c1f6348998fe@suse.com>
Date: Thu, 6 Mar 2025 14:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: specify numerical values of Xenstore commands
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250306122426.4351-1-jgross@suse.com>
 <70436c18-a916-46d9-befd-56e1780d92a4@suse.com>
 <9f096156-05c6-4b05-8b67-5370b4079d02@suse.com>
 <b96c2600-735a-4767-9ed6-5cbb89e103af@suse.com>
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
In-Reply-To: <b96c2600-735a-4767-9ed6-5cbb89e103af@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LjLgwWatB64v0LHqE2OfIQ4d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LjLgwWatB64v0LHqE2OfIQ4d
Content-Type: multipart/mixed; boundary="------------4Ems178pIOmI1MGz2v0ChLE0";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <b087c884-d220-4787-a51e-c1f6348998fe@suse.com>
Subject: Re: [PATCH] docs: specify numerical values of Xenstore commands
References: <20250306122426.4351-1-jgross@suse.com>
 <70436c18-a916-46d9-befd-56e1780d92a4@suse.com>
 <9f096156-05c6-4b05-8b67-5370b4079d02@suse.com>
 <b96c2600-735a-4767-9ed6-5cbb89e103af@suse.com>
In-Reply-To: <b96c2600-735a-4767-9ed6-5cbb89e103af@suse.com>
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

--------------4Ems178pIOmI1MGz2v0ChLE0
Content-Type: multipart/mixed; boundary="------------J0FB8snBw5ML5WPr4hHbancq"

--------------J0FB8snBw5ML5WPr4hHbancq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjUgMTQ6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDI1
IDEzOjU2LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDYuMDMuMjUgMTM6MzIsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA2LjAzLjIwMjUgMTM6MjMsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+IC0tLSBhL2RvY3MvbWlzYy94ZW5zdG9yZS50eHQNCj4+Pj4gKysr
IGIvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4+PiBAQCAtODYsNiArODYsNjUgQEAgcGFy
dHMgb2YgeGVuc3RvcmUgaW5hY2Nlc3NpYmxlIHRvIHNvbWUgY2xpZW50cy4gIEluIGFueSBj
YXNlIHBhc3NpbmcNCj4+Pj4gICAgYnVsayBkYXRhIHRocm91Z2ggeGVuc3RvcmUgaXMgbm90
IHJlY29tbWVuZGVkIGFzIHRoZSBwZXJmb3JtYW5jZQ0KPj4+PiAgICBwcm9wZXJ0aWVzIGFy
ZSBwb29yLg0KPj4+PiAgICANCj4+Pj4gKy0tLS0tLS0tLS0gRGVmaW5lZCBYZW5zdG9yZSBt
ZXNzYWdlIHR5cGVzIC0tLS0tLS0tLS0NCj4+Pj4gKw0KPj4+PiArQmVsb3cgaXMgYSB0YWJs
ZSB3aXRoIGFsbCBkZWZpbmVkIFhlbnN0b3JlIG1lc3NhZ2UgdHlwZXMgKHR5cGUgbmFtZQ0K
Pj4+PiArYW5kIGl0cyBhc3NvY2lhdGVkIG51bWVyaWNhbCB2YWx1ZSkuDQo+Pj4+ICsNCj4+
Pj4gK1NvbWUgdHlwZXMgYXJlIG9wdGlvbmFsIHRvIGJlIHN1cHBvcnRlZCBieSBhIHNwZWNp
ZmljIFhlbnN0b3JlDQo+Pj4+ICtpbXBsZW1lbnRhdGlvbi4gIElmIGFuIG9wdGlvbmFsIHR5
cGUgaXMgbm90IHN1cHBvcnRlZCBieSBhIFhlbnN0b3JlDQo+Pj4+ICtpbXBsZW1lbnRhdGlv
biwgWGVuIHRvb2xzIHdpbGwgY29udGludWUgdG8gd29yaywgbWF5YmUgd2l0aCBzbGlnaHRs
eQ0KPj4+PiArcmVkdWNlZCBmdW5jdGlvbmFsaXR5LiAgQSBtYW5kYXRvcnkgdHlwZSBub3Qg
YmVpbmcgc3VwcG9ydGVkIHdpbGwNCj4+Pj4gK3Jlc3VsdCBpbiBzZXZlcmVseSByZWR1Y2Vk
IGZ1bmN0aW9uYWxpdHksIGxpa2UgaW5hYmlsaXR5IHRvIGNyZWF0ZQ0KPj4+PiArZG9tYWlu
cy4gIEluIGNhc2UgYSB0eXBlIGlzIG9wdGlvbmFsLCB0aGlzIGlzIHN0YXRlZCBpbiB0aGUg
dGFibGUgd2l0aA0KPj4+PiArdGhlIGxvc3QgZnVuY3Rpb25hbGl0eSBpbiBjYXNlIFhlbnN0
b3JlIGRvZXNuJ3Qgc3VwcG9ydCB0aGF0IHR5cGUuDQo+Pj4+ICsNCj4+Pj4gK1hTX0NPTlRS
T0wJCTAJb3B0aW9uYWwNCj4+Pj4gKwlJZiBub3Qgc3VwcG9ydGVkLCB4ZW5zdG9yZS1jb250
cm9sIGNvbW1hbmQgd2lsbCBub3Qgd29yay4NCj4+Pj4gKwlYU19ERUJVRyBpcyBhIGRlcHJl
Y2F0ZWQgYWxpYXMgb2YgWFNfQ09OVFJPTC4NCj4+Pj4gK1hTX0RJUkVDVE9SWQkJMQ0KPj4+
PiArWFNfUkVBRAkJCTINCj4+Pj4gK1hTX0dFVF9QRVJNUwkJMw0KPj4+PiArWFNfV0FUQ0gJ
CTQNCj4+Pj4gK1hTX1VOV0FUQ0gJCTUNCj4+Pj4gK1hTX1RSQU5TQUNUSU9OX1NUQVJUCTYN
Cj4+Pj4gK1hTX1RSQU5TQUNUSU9OX0VORAk3DQo+Pj4+ICtYU19JTlRST0RVQ0UJCTgNCj4+
Pj4gK1hTX1JFTEVBU0UJCTkNCj4+Pj4gK1hTX0dFVF9ET01BSU5fUEFUSAkxMA0KPj4+PiAr
WFNfV1JJVEUJCTExDQo+Pj4+ICtYU19NS0RJUgkJMTINCj4+Pj4gK1hTX1JNCQkJMTMNCj4+
Pj4gK1hTX1NFVF9QRVJNUwkJMTQNCj4+Pj4gK1hTX1dBVENIX0VWRU5UCQkxNQ0KPj4+PiAr
CU5vdCB2YWxpZCBpbiBjbGllbnQgc2VudCBtZXNzYWdlcy4NCj4+Pj4gKwlPbmx5IHZhbGlk
IGluIFhlbnN0b3JlIHJlcGxpZXMuDQo+Pj4+ICtYU19FUlJPUgkJMTYNCj4+Pj4gKwlOb3Qg
dmFsaWQgaW4gY2xpZW50IHNlbnQgbWVzc2FnZXMuDQo+Pj4+ICsJT25seSB2YWxpZCBpbiBY
ZW5zdG9yZSByZXBsaWVzLg0KPj4+PiArWFNfSVNfRE9NQUlOX0lOVFJPRFVDRUQJMTcNCj4+
Pj4gK1hTX1JFU1VNRQkJMTgNCj4+Pj4gK1hTX1NFVF9UQVJHRVQJCTE5DQo+Pj4+ICtYU19S
RVNUUklDVAkJMjAJbm8gbG9uZ2VyIHN1cHBvcnRlZA0KPj4+PiArCVhTX1JFU1RSSUNUIGhh
cyBiZWVuIHJlbW92ZWQsIHRoZSB0eXBlIHZhbHVlIDIwIGlzIGludmFsaWQuDQo+Pj4+ICtY
U19SRVNFVF9XQVRDSEVTCTIxDQo+Pj4+ICtYU19ESVJFQ1RPUllfUEFSVAkyMglvcHRpb25h
bA0KPj4+PiArCUlmIG5vdCBzdXBwb3J0ZWQsIHRoZSBvdXRwdXQgb2YgeGVuc3RvcmUtbHMg
bWlnaHQgYmUgaW5jb21wbGV0ZQ0KPj4+PiArCXdpdGggbW/FlWUgdGhhbiBjYS4gMTAwMCBk
b21haW5zIGFjdGl2ZS4NCj4+Pg0KPj4+IE5pdDogT2RkICfFlScgaGVyZS4NCj4+DQo+PiBU
aGFua3MgZm9yIHNwb3R0aW5nLg0KPj4NCj4+PiBBbHNvIHRoZSAxMDAwIGRvbWFpbnMgYm91
bmRhcnkgaXMganVzdCBhbiBleGFtcGxlIGFpdWksIHNvIHlvdSBtYXkgd2FudA0KPj4+IHRv
IGFkZCAiZS5nLiIuDQo+Pg0KPj4gVGhlIGJvdW5kYXJ5IGlzIHJlbGF0ZWQgdG8gdGhlIGFt
b3VudCBvZiBkYXRhIHJldHVybmVkIGJ5IFhTX0RJUkVDVE9SWQ0KPj4gZm9yICIvbG9jYWwv
ZG9tYWluIi4gQXMgc29vbiBhcyB0aGUgc3VtIG9mIChzdHJsZW4oZG9taWRfc3RyaW5nKSAr
IDEpDQo+PiBvZiBhbGwgZG9tYWlucyBpcyBsYXJnZXIgdGhhbiA0MDgwIChYRU5TVE9SRV9Q
QVlMT0FEX01BWCAtIHNpemVvZihzdHJ1Y3QNCj4+IHhzZF9zb2NrbXNnKSksIFhTX0RJUkVD
VE9SWSB3b24ndCBiZSBhYmxlIHRvIHJldHVybiB0aGUgbGlzdCBvZiBjaGlsZHJlbg0KPj4g
Zm9yICIvbG9jYWwvZG9tYWluIi4gVGhlIGxpbWl0IHdpbGwgZGVwZW5kIG9uIHRoZSBkb21p
ZCBkaXN0cmlidXRpb246DQo+PiBpbiB0aGUgd29yc3QgY2FzZSBpdCBjYW4gYmUgNjQwIChh
bGwgZG9taWRzIDUgZGlnaXRzKSwgaW4gdGhlIGJlc3QgY2FzZQ0KPj4gaXQgd2lsbCBiZSAx
MDM4IChhbGwgZG9taWRzIGJlbG93IDEwMDAgcHJlc2VudCwgdGhlIHJlc3QgYmVsb3cgMTAw
MDApLg0KPiANCj4gQW5kIGVsc2V3aGVyZSB0aGVyZSBjYW4ndCBiZSB2ZXJ5IG1hbnkgbm9k
ZXMgcmVzdWx0aW5nIGluIGEgc2ltaWxhcg0KPiBzaXR1YXRpb24/DQoNCk5vdCB3aXRob3V0
IHNvbWVvbmUgdHJ5aW5nIHRvIGZvcmNlIHRoaXMgYnkgd2lsbCAob25seSBwb3NzaWJsZSBi
eSBhDQpyb290IHVzZXIgb2YgZG9tMCwgZS5nLiB2aWEgY3JlYXRpbmcgbG90cyBvZiBub2Rl
cyBpbiB0aGUgc2FtZSBkaXJlY3RvcnkNCnZpYSAieGVuc3RvcmUtd3JpdGUiKS4NCg0KSGF2
aW5nIGxvdHMgb2YgZG9tYWlucyBpcyBhbiAiZWFzeSIgd2F5IHRvIGNyZWF0ZSB0aGlzIHNj
ZW5hcmlvIHZpYQ0KcGVyZmVjdGx5IHZhbGlkIGFuZCBzZW5zaWJsZSBvcGVyYXRpb25zLg0K
DQo+IA0KPj4+IEknbSBmdXJ0aGVyIHVuY2VydGFpbiBoZXJlIHJlZ2FyZGluZyB5b3VyIHVz
ZSBvZiBoYXJkIHRhYnMuDQo+Pg0KPj4gSSdtIGZvbGxvd2luZyB0aGUgc3R5bGUgb2YgdGhl
IHJlc3Qgb2YgdGhlIGRvY3VtZW50LCB3aGljaCBpcyBtYWtpbmcgdXNlDQo+PiBvZiBoYXJk
IHRhYnMgYXMgd2VsbC4gSSBjYW4gc3dpdGNoIHRvIHNwYWNlcyBpZiB5b3Ugd2FudC4NCj4g
DQo+IEknbSBub3QgZGVtYW5kaW5nIGEgY2hhbmdlLiBJJ2QgbGlrZSBpdCB0byBiZSBjb25z
aWRlcmVkIHRob3VnaCB0aGF0IHBlb3BsZQ0KPiBtYXkgaW4gcHJpbmNpcGxlIGJlIHVzaW5n
IGRpZmZlcmVudCB0YWItdG8tbnItb2YtYmxhbmtzIG1hcHBpbmdzLCB3aGljaA0KPiBjYXVz
ZXMgdGFidWxhciBhcnJhbmdlbWVudHMgbGlrZSB0aGUgYWJvdmUgb25lIHRvIGNvbWUgb3V0
IGRpc3RvcnRlZC4NCg0KRmFpciBlbm91Z2guDQoNCkknbSBnb2luZyB0byBzd2l0Y2ggdG8g
YmxhbmtzIGZvciB0aGUgdGFibGUuDQoNCg0KSnVlcmdlbg0K
--------------J0FB8snBw5ML5WPr4hHbancq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------J0FB8snBw5ML5WPr4hHbancq--

--------------4Ems178pIOmI1MGz2v0ChLE0--

--------------LjLgwWatB64v0LHqE2OfIQ4d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfJofsFAwAAAAAACgkQsN6d1ii/Ey9L
bgf9GoEu+qVzOH9XS+ZA0vefW2SyAbZ8PZcjwd+CDXmvUW7+CXkBDhE1gltUvWfXb0clnUm1mE5c
V5EVUJAm6Htv5ThzjtGzuEroV8ZRLSfEWdyVbk5cBzzWZZRVbJWqYvYSGL8AdpZm5OI9U9qDmuTR
m5ojuwdc2d8n1UpFbAeLH1A48Y5bObdfJfczBNXSl54fo99cyZPx9cAgpYCy/N3F6onoh1WbNkKk
LFF+XmIFu5dHgsghAXqbFGM/cXyFbieEIVdkHvkjfNAnoAgMazYepfE+4ux2PRFMrV0+h8Wqz44f
yM7Ba9dQ2TnQshjgsiISuhEoKnGAjNmxtPcrsU0gXA==
=Zqm8
-----END PGP SIGNATURE-----

--------------LjLgwWatB64v0LHqE2OfIQ4d--

