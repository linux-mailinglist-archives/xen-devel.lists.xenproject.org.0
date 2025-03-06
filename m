Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34462A54B44
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 13:56:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903464.1311348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAlq-0003Fm-Uf; Thu, 06 Mar 2025 12:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903464.1311348; Thu, 06 Mar 2025 12:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqAlq-0003D7-Qg; Thu, 06 Mar 2025 12:56:14 +0000
Received: by outflank-mailman (input) for mailman id 903464;
 Thu, 06 Mar 2025 12:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TCcn=VZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tqAlp-0003D1-EN
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 12:56:13 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60b7421a-fa8a-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 13:56:10 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e4f88ea298so1043120a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 04:56:10 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5c768f9a4sm906024a12.71.2025.03.06.04.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 04:56:09 -0800 (PST)
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
X-Inumbo-ID: 60b7421a-fa8a-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741265770; x=1741870570; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vGmVxLocPsbojr6/P/80paTESBMwv1fFocHLNAdBhpI=;
        b=DZlNgkhKTX59dWxLbGO5FT7QR3AXMh57GeOwA2hvq5E6zRT1PHepPVAdtBMx0WU/4Z
         6wkOlYJXax3Nd6CntxiEGLCwnrbnT7yThEmQyJYdtgYGqVZJsDtM0O3tGe6f/pzq4EyC
         En7v6/zXmSsa0Ikw2GMNHNb0ofMhe6wUZGB2Zn6jNXVlCnTQ+iLtRHnMRnO5hz7HmyW4
         dThWrBKHLXRQp2VxC9Rex61BiwfFTrN9IHqEdcR209YQ/xmxiKjVSWVrw+BGHBRgIVRK
         L4xFHPtjUU6x+xzwGqTs5W5fMkYOuCcCSAjA6dU0qfVg7jcb0q8bMFEQETWgHx/f8auZ
         aFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741265770; x=1741870570;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGmVxLocPsbojr6/P/80paTESBMwv1fFocHLNAdBhpI=;
        b=nhEJaNuRAIbE9Xe9ozyq4aOcrazo78NDvEpOZqUnDZw9I5WGQE1ZBpA067e4r17EOF
         zyMp421av6tnXzR5PPPJxEYdXpLf54Z9IjQPbcChL4ARzCbG0yTLHt8BY3gBThrjHCDe
         wTk5ELohbOePpdHjpNcgDGA5EkZEUTXZu1DRHxV6ZK9Uyf7+lSae62tk+kmfpA9gh/jw
         d2/ujOLbDG6CYTKgk7oq9aDleo8zT+Y/hTS7+bDeCkOD0FefmjUpG7lyTG+QP9cVEPqb
         1OnqJn9K2DQJvsN/dwETMCjtHeM1PxfneMUpyOP/1ruzshHXPuix9oQw/Cl/tsyN0B7s
         YAxw==
X-Forwarded-Encrypted: i=1; AJvYcCVAQGZxc8wfhc9bPNJgSuBG+JaxcMt05i7NNKoyClVem4UU4IohEVjCvOpV90woe1AOVi0H4NEl5YU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlzkcRB3qcqacyTbGqaSWW+L8gKv1wzEdmIb4g+s+dVRBPlSa+
	31Avk6JBth2vh1mJt4zIZzIXdZa+UomPawCdNpaRnb8Rptq24SMREHCRInRbhfc=
X-Gm-Gg: ASbGnctYde42SI3tzJuUOB4cjdyveOThDrvRP9o4sfZ8sDB+vKlHOdVekW6rGVZDm0x
	wTMBP84qELpmeAdeoZ9gk2LVXnCEaEjkvNvBZV9KzpHz2BRl7wnhuCSZDxJVC5XQP6CbkumSSAF
	dGPW6htSW337FUjKRIgiMiBv5CzWzhB6aTiM/j4y8L4nIbeUISlTCyhAc+l7hBM8QIARQvou1vz
	ch2mP3DBzPql2DMQeIXdZ/wFWoleOkDpLFNbjZs0i0M64H4hbK0ww3gC72r3EPh2RqUmpei1AG8
	7lHFo/o4bNXV2PSEYnkd6WU35a2aOFRHzSuLGSCLxn4By+mC9X5hYak1d6xOFp16xPxa6/9Srao
	zBLV1EW6Kl2XHlrByEmPnIV0eRSa66Ie5/Pv3scI3pCZFh58K85pV6pLcg6QkviugptI=
X-Google-Smtp-Source: AGHT+IE6xEv8BxOnvpE0+B8aGaDTh5EHzDnaXucnOO8j9Ij2xp1KJ6los5aVIVLzrNkHLnqidFrBew==
X-Received: by 2002:a05:6402:2348:b0:5d0:e563:4475 with SMTP id 4fb4d7f45d1cf-5e59f4fc86bmr6688699a12.29.1741265770128;
        Thu, 06 Mar 2025 04:56:10 -0800 (PST)
Message-ID: <9f096156-05c6-4b05-8b67-5370b4079d02@suse.com>
Date: Thu, 6 Mar 2025 13:56:08 +0100
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
In-Reply-To: <70436c18-a916-46d9-befd-56e1780d92a4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------20stfQrevP39AjvadhGT0eSk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------20stfQrevP39AjvadhGT0eSk
Content-Type: multipart/mixed; boundary="------------v0IqyPRnFfg7DUm6Q02EHf9u";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <9f096156-05c6-4b05-8b67-5370b4079d02@suse.com>
Subject: Re: [PATCH] docs: specify numerical values of Xenstore commands
References: <20250306122426.4351-1-jgross@suse.com>
 <70436c18-a916-46d9-befd-56e1780d92a4@suse.com>
In-Reply-To: <70436c18-a916-46d9-befd-56e1780d92a4@suse.com>
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

--------------v0IqyPRnFfg7DUm6Q02EHf9u
Content-Type: multipart/mixed; boundary="------------M1W1Qq3H6tS09uNJvwn0zyz8"

--------------M1W1Qq3H6tS09uNJvwn0zyz8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDMuMjUgMTM6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4wMy4yMDI1
IDEzOjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEvZG9jcy9taXNjL3hlbnN0
b3JlLnR4dA0KPj4gKysrIGIvZG9jcy9taXNjL3hlbnN0b3JlLnR4dA0KPj4gQEAgLTg2LDYg
Kzg2LDY1IEBAIHBhcnRzIG9mIHhlbnN0b3JlIGluYWNjZXNzaWJsZSB0byBzb21lIGNsaWVu
dHMuICBJbiBhbnkgY2FzZSBwYXNzaW5nDQo+PiAgIGJ1bGsgZGF0YSB0aHJvdWdoIHhlbnN0
b3JlIGlzIG5vdCByZWNvbW1lbmRlZCBhcyB0aGUgcGVyZm9ybWFuY2UNCj4+ICAgcHJvcGVy
dGllcyBhcmUgcG9vci4NCj4+ICAgDQo+PiArLS0tLS0tLS0tLSBEZWZpbmVkIFhlbnN0b3Jl
IG1lc3NhZ2UgdHlwZXMgLS0tLS0tLS0tLQ0KPj4gKw0KPj4gK0JlbG93IGlzIGEgdGFibGUg
d2l0aCBhbGwgZGVmaW5lZCBYZW5zdG9yZSBtZXNzYWdlIHR5cGVzICh0eXBlIG5hbWUNCj4+
ICthbmQgaXRzIGFzc29jaWF0ZWQgbnVtZXJpY2FsIHZhbHVlKS4NCj4+ICsNCj4+ICtTb21l
IHR5cGVzIGFyZSBvcHRpb25hbCB0byBiZSBzdXBwb3J0ZWQgYnkgYSBzcGVjaWZpYyBYZW5z
dG9yZQ0KPj4gK2ltcGxlbWVudGF0aW9uLiAgSWYgYW4gb3B0aW9uYWwgdHlwZSBpcyBub3Qg
c3VwcG9ydGVkIGJ5IGEgWGVuc3RvcmUNCj4+ICtpbXBsZW1lbnRhdGlvbiwgWGVuIHRvb2xz
IHdpbGwgY29udGludWUgdG8gd29yaywgbWF5YmUgd2l0aCBzbGlnaHRseQ0KPj4gK3JlZHVj
ZWQgZnVuY3Rpb25hbGl0eS4gIEEgbWFuZGF0b3J5IHR5cGUgbm90IGJlaW5nIHN1cHBvcnRl
ZCB3aWxsDQo+PiArcmVzdWx0IGluIHNldmVyZWx5IHJlZHVjZWQgZnVuY3Rpb25hbGl0eSwg
bGlrZSBpbmFiaWxpdHkgdG8gY3JlYXRlDQo+PiArZG9tYWlucy4gIEluIGNhc2UgYSB0eXBl
IGlzIG9wdGlvbmFsLCB0aGlzIGlzIHN0YXRlZCBpbiB0aGUgdGFibGUgd2l0aA0KPj4gK3Ro
ZSBsb3N0IGZ1bmN0aW9uYWxpdHkgaW4gY2FzZSBYZW5zdG9yZSBkb2Vzbid0IHN1cHBvcnQg
dGhhdCB0eXBlLg0KPj4gKw0KPj4gK1hTX0NPTlRST0wJCTAJb3B0aW9uYWwNCj4+ICsJSWYg
bm90IHN1cHBvcnRlZCwgeGVuc3RvcmUtY29udHJvbCBjb21tYW5kIHdpbGwgbm90IHdvcmsu
DQo+PiArCVhTX0RFQlVHIGlzIGEgZGVwcmVjYXRlZCBhbGlhcyBvZiBYU19DT05UUk9MLg0K
Pj4gK1hTX0RJUkVDVE9SWQkJMQ0KPj4gK1hTX1JFQUQJCQkyDQo+PiArWFNfR0VUX1BFUk1T
CQkzDQo+PiArWFNfV0FUQ0gJCTQNCj4+ICtYU19VTldBVENICQk1DQo+PiArWFNfVFJBTlNB
Q1RJT05fU1RBUlQJNg0KPj4gK1hTX1RSQU5TQUNUSU9OX0VORAk3DQo+PiArWFNfSU5UUk9E
VUNFCQk4DQo+PiArWFNfUkVMRUFTRQkJOQ0KPj4gK1hTX0dFVF9ET01BSU5fUEFUSAkxMA0K
Pj4gK1hTX1dSSVRFCQkxMQ0KPj4gK1hTX01LRElSCQkxMg0KPj4gK1hTX1JNCQkJMTMNCj4+
ICtYU19TRVRfUEVSTVMJCTE0DQo+PiArWFNfV0FUQ0hfRVZFTlQJCTE1DQo+PiArCU5vdCB2
YWxpZCBpbiBjbGllbnQgc2VudCBtZXNzYWdlcy4NCj4+ICsJT25seSB2YWxpZCBpbiBYZW5z
dG9yZSByZXBsaWVzLg0KPj4gK1hTX0VSUk9SCQkxNg0KPj4gKwlOb3QgdmFsaWQgaW4gY2xp
ZW50IHNlbnQgbWVzc2FnZXMuDQo+PiArCU9ubHkgdmFsaWQgaW4gWGVuc3RvcmUgcmVwbGll
cy4NCj4+ICtYU19JU19ET01BSU5fSU5UUk9EVUNFRAkxNw0KPj4gK1hTX1JFU1VNRQkJMTgN
Cj4+ICtYU19TRVRfVEFSR0VUCQkxOQ0KPj4gK1hTX1JFU1RSSUNUCQkyMAlubyBsb25nZXIg
c3VwcG9ydGVkDQo+PiArCVhTX1JFU1RSSUNUIGhhcyBiZWVuIHJlbW92ZWQsIHRoZSB0eXBl
IHZhbHVlIDIwIGlzIGludmFsaWQuDQo+PiArWFNfUkVTRVRfV0FUQ0hFUwkyMQ0KPj4gK1hT
X0RJUkVDVE9SWV9QQVJUCTIyCW9wdGlvbmFsDQo+PiArCUlmIG5vdCBzdXBwb3J0ZWQsIHRo
ZSBvdXRwdXQgb2YgeGVuc3RvcmUtbHMgbWlnaHQgYmUgaW5jb21wbGV0ZQ0KPj4gKwl3aXRo
IG1vxZVlIHRoYW4gY2EuIDEwMDAgZG9tYWlucyBhY3RpdmUuDQo+IA0KPiBOaXQ6IE9kZCAn
xZUnIGhlcmUuDQoNClRoYW5rcyBmb3Igc3BvdHRpbmcuDQoNCj4gQWxzbyB0aGUgMTAwMCBk
b21haW5zIGJvdW5kYXJ5IGlzIGp1c3QgYW4gZXhhbXBsZSBhaXVpLCBzbyB5b3UgbWF5IHdh
bnQNCj4gdG8gYWRkICJlLmcuIi4NCg0KVGhlIGJvdW5kYXJ5IGlzIHJlbGF0ZWQgdG8gdGhl
IGFtb3VudCBvZiBkYXRhIHJldHVybmVkIGJ5IFhTX0RJUkVDVE9SWQ0KZm9yICIvbG9jYWwv
ZG9tYWluIi4gQXMgc29vbiBhcyB0aGUgc3VtIG9mIChzdHJsZW4oZG9taWRfc3RyaW5nKSAr
IDEpDQpvZiBhbGwgZG9tYWlucyBpcyBsYXJnZXIgdGhhbiA0MDgwIChYRU5TVE9SRV9QQVlM
T0FEX01BWCAtIHNpemVvZihzdHJ1Y3QNCnhzZF9zb2NrbXNnKSksIFhTX0RJUkVDVE9SWSB3
b24ndCBiZSBhYmxlIHRvIHJldHVybiB0aGUgbGlzdCBvZiBjaGlsZHJlbg0KZm9yICIvbG9j
YWwvZG9tYWluIi4gVGhlIGxpbWl0IHdpbGwgZGVwZW5kIG9uIHRoZSBkb21pZCBkaXN0cmli
dXRpb246DQppbiB0aGUgd29yc3QgY2FzZSBpdCBjYW4gYmUgNjQwIChhbGwgZG9taWRzIDUg
ZGlnaXRzKSwgaW4gdGhlIGJlc3QgY2FzZQ0KaXQgd2lsbCBiZSAxMDM4IChhbGwgZG9taWRz
IGJlbG93IDEwMDAgcHJlc2VudCwgdGhlIHJlc3QgYmVsb3cgMTAwMDApLg0KDQo+PiArWFNf
R0VUX0ZFQVRVUkUJCTIzCW9wdGlvbmFsDQo+PiArWFNfU0VUX0ZFQVRVUkUJCTI0CW9wdGlv
bmFsDQo+PiArCVhTX0dFVF9GRUFUVVJFIGFuZCBYU19TRVRfRkVBVFVSRSBtdXN0IGVpdGhl
ciBiZSBib3RoIHN1cHBvcnRlZA0KPj4gKwlvciBib3RoIHVuc3VwcG9ydGVkLg0KPj4gKwlJ
ZiB1bnN1cHBvcnRlZCwgc2V0dGluZyBhdmFpbGFiaWxpdHkgb2YgWGVuc3RvcmUgZmVhdHVy
ZXMgcGVyDQo+PiArCWRvbWFpbiBpcyBub3QgcG9zc2libGUuDQo+IA0KPiBXaHkgd291bGQg
R0VUX0ZFQVRVUkVTIGFsb25lIG5vdCBiZSBwZXJtaXR0ZWQ/DQoNCkkgY2FuIGFsbG93IHRo
YXQuIFRoZXJlIG1pZ2h0IGJlIHRoZSB1c2UgY2FzZSB0byBxdWVyeSBhdmFpbGFiaWxpdHkg
b2YNCmEgZmVhdHVyZSB2aWEgYSBkb20wIHNvY2tldCBjb25uZWN0aW9uLg0KDQo+PiArWFNf
R0VUX1FVT1RBCQkyNQlvcHRpb25hbA0KPj4gK1hTX1NFVF9RVU9UQQkJMjYJb3B0aW9uYWwN
Cj4+ICsJWFNfR0VUX1FVT1RBIGFuZCBYU19TRVRfUVVPVEEgbXVzdCBlaXRoZXIgYmUgYm90
aCBzdXBwb3J0ZWQNCj4+ICsJb3IgYm90aCB1bnN1cHBvcnRlZC4NCj4+ICsJSWYgdW5zdXBw
b3J0ZWQsIHNldHRpbmcgb2YgWGVuc3RvcmUgcXVvdGEgcGVyIGRvbWFpbiBpcyBub3QNCj4+
ICsJcG9zc2libGUuDQo+IA0KPiBTYW1lLCBtYXliZSB0byBsZXNzZXIgZGVncmVlLCBmb3Ig
R0VUX1FVT1RBLg0KDQpUZWNobmljYWxseSBwb3NzaWJsZSwgdG9vLiBTbyBJIGNhbiBhbGxv
dyB0aGlzIG9uZSBhcyB3ZWxsLg0KDQo+IEknbSBmdXJ0aGVyIHVuY2VydGFpbiBoZXJlIHJl
Z2FyZGluZyB5b3VyIHVzZSBvZiBoYXJkIHRhYnMuDQoNCkknbSBmb2xsb3dpbmcgdGhlIHN0
eWxlIG9mIHRoZSByZXN0IG9mIHRoZSBkb2N1bWVudCwgd2hpY2ggaXMgbWFraW5nIHVzZQ0K
b2YgaGFyZCB0YWJzIGFzIHdlbGwuIEkgY2FuIHN3aXRjaCB0byBzcGFjZXMgaWYgeW91IHdh
bnQuDQoNCg0KSnVlcmdlbg0K
--------------M1W1Qq3H6tS09uNJvwn0zyz8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------M1W1Qq3H6tS09uNJvwn0zyz8--

--------------v0IqyPRnFfg7DUm6Q02EHf9u--

--------------20stfQrevP39AjvadhGT0eSk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfJm2gFAwAAAAAACgkQsN6d1ii/Ey/G
Egf8D3DiQ/NkmUm9BstpDpqJpb3opoFlJEAVXGkJiKX8U2l+EJql1U7ivNiN9GCWnZ7eRNVDH6he
7HX3uPRqgOe0eWWcGBTNo0x3YAREL+giCF04MgBTzuMmpfhoLrPM4Mb8iiUl+E+Ga/QE7voZyZnn
pO5OlWl+w7yWKUoydtvmCntWidhLoyDCVx8BGOJ+QQt4jYkGxZoA+T9fW8YaGz33yROGMh6vhO94
tBng+kIPfmM9+LMqnPSSMBm0LlxAm9LnMFGQ0tHxto+TQcwjSRk5MsN90i0cg9cxavPCR1mfTOp4
RXroRcW0sBoFusypjFEdPvPmffKlMrtNEDSEjmeqLw==
=FWiV
-----END PGP SIGNATURE-----

--------------20stfQrevP39AjvadhGT0eSk--

