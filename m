Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C5C58743
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 16:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161803.1489655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZUT-0002Jl-0n; Thu, 13 Nov 2025 15:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161803.1489655; Thu, 13 Nov 2025 15:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJZUS-0002II-TU; Thu, 13 Nov 2025 15:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1161803;
 Thu, 13 Nov 2025 15:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lXFW=5V=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vJZUR-0002IC-D4
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 15:44:03 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 938a3e5d-c0a7-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 16:44:01 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-640c6577120so1753122a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 07:44:01 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fed9e9fsm185910466b.69.2025.11.13.07.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 07:44:00 -0800 (PST)
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
X-Inumbo-ID: 938a3e5d-c0a7-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763048641; x=1763653441; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JMzYaMR6CxzxODDnEeUbTts5HV+UmAXYvbn7+BMj/QY=;
        b=BBqjlYVdrAckKQ85iQrqJedfYPuw7AdnPXyxWBvHDoDyW3BOyQ0B0v8eIiZp3mVDHh
         RBVRclSIiyi4G4wkZWLrkyRMoyiC0y5GIcatHtPXUi4dJX8epJsqii7KXzfod5rNVyZG
         dkSfgcFiCrxIfmgk78d35jCEilpIFjC0FG5JXWwxGX7LR/ky53N+CflHYDUrX/+MQPAn
         /GGIBu0UqrEoXwDAcOr6FSx/IgnPMEDbmRPzNevBtJwY1AI/7T0ggb805PVPAPEQNTVz
         Kk+WcB1ur1kJokUR8CQ3s1YqoHdkgb/yUv/iBdMflsg5GEN1MiBh9i7+5sHfVJk8Yk3O
         WvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763048641; x=1763653441;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JMzYaMR6CxzxODDnEeUbTts5HV+UmAXYvbn7+BMj/QY=;
        b=WT+qRBxNNNbpnxJfiU4M1h4SLTMATBQW6BJb2dLalYtjmKZ1miirK+eD9aJcIGVDuw
         rUV0x5G6UjL7WveDjXguVrFFejbq9vFOxoTLOus8gUWKX2Kppeq2B+f+nDwoqqSxx93Z
         hGRKGm/HajktyzL3NA0w9JUw0MPtMH7KhYs58+eU4Z70QlPiRs8qZidSKyfoYq2+hQ/Y
         6NFB8s+88vThI0mlIy8LMF0Wn1S03aWffHeImx+3shJUaXedetLvIfk2/lwEKRpldCDW
         zVpXpd/Ms80DyIsDCPDMdiWs+Qczv5WCdheJn6V0AWviMqSZqUBoJJdoQyLe+t3bQejT
         BAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs2PWfGZNE7xJoZgxERS5uHPNQfsGPUMgElEMWPnR2TTUK9X9c26xvjBtyXiAaGTd3m9DbPimBpTQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3iHK4VeKQqrhMXvBeGloZ+0DCrvtYjrVUX8JKDf/2+I/5JtwH
	HornpvDExpYrpi9DbkTlwhgYF/oQbiZ6FxvMKJY3+4ySRcwylY/mMHLIzZ+nI4kR0R4=
X-Gm-Gg: ASbGncuSb6bAZ+OW4o7aavYRIHJVTmCGF1+rLxN2CL45yy8MoHoh8xPWDodhu5jOt0w
	CGfEroEMtJLt+x3KsxmlQuaR8AyZCH35Mfc8b0GDnqZjrIssjDjT1N5CH8vfH3hR11eST26Ou4B
	1VAZVLbAF+V0QO+uSeXOMA1wJumOYln2BSPAFl9EJ7KfJtXTCJpvJKhMkDcd9SJkDAxEC+IJREg
	ETwT15RHwzbWy9tAcH/6pGZYmHsB9OhbjnOj5MZ3FPztzqWIOS7evhuhfSFYKKzt1m74Hwxcv+l
	6wDrv+7DQsOTYOrpW931Eh6GuJ/Zqk5wNGRCMspkRA08TmgdCpPsiPCABp1Z9O9wGC+Xfpr4xUH
	ShDZthFOND783ZglND16dDi5UWSpzSrsTz/mIB7ka/7JB2f0zan+iI/FEUXNpCkja9fexI1XuY0
	Ly2rzTnFYHGrIbtDOPtENU0tAFWArxLz+b3PnH/Uxdcl1iR3B1lFjCsGCOMbOyzdZl++dLb4h/U
	KV8ae8x2yc6AQioRwrDHTBnMzza
X-Google-Smtp-Source: AGHT+IFYyjn9qBP3zaSpIjEDWdI4QMzd7JDmZqeIW3bn5PsOkI4i5P1OBkBIFMbSsDQO1qFprS+tWA==
X-Received: by 2002:a17:906:f591:b0:b70:be84:5186 with SMTP id a640c23a62f3a-b7331aec174mr686413366b.44.1763048640976;
        Thu, 13 Nov 2025 07:44:00 -0800 (PST)
Message-ID: <8a57904f-17f2-46f9-9b08-e2287f8fd44c@suse.com>
Date: Thu, 13 Nov 2025 16:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
 <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
 <a17e86e4-f8c1-464d-b30d-42713f793ea5@suse.com>
 <8aa7ddeb-fb2b-42ac-bba6-272b91fc1e8f@suse.com>
 <a36eafd3-35cf-448e-8c46-df063f50b082@epam.com>
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
In-Reply-To: <a36eafd3-35cf-448e-8c46-df063f50b082@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tiZfe5OpSQ1etTKdtNsUg00X"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tiZfe5OpSQ1etTKdtNsUg00X
Content-Type: multipart/mixed; boundary="------------Mi7lixFpgDR6stwLEs04cEBw";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <8a57904f-17f2-46f9-9b08-e2287f8fd44c@suse.com>
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
 <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
 <a17e86e4-f8c1-464d-b30d-42713f793ea5@suse.com>
 <8aa7ddeb-fb2b-42ac-bba6-272b91fc1e8f@suse.com>
 <a36eafd3-35cf-448e-8c46-df063f50b082@epam.com>
In-Reply-To: <a36eafd3-35cf-448e-8c46-df063f50b082@epam.com>
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

--------------Mi7lixFpgDR6stwLEs04cEBw
Content-Type: multipart/mixed; boundary="------------sQiFnd29yurz7Yf01zWH0XSn"

--------------sQiFnd29yurz7Yf01zWH0XSn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjUgMTY6MzIsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPiBIaSBKw7xy
Z2VuLA0KPiANCj4gT24gMTMuMTEuMjUgMTY6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+
PiBPbiAxMy4xMS4yNSAxNTozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAxMy4x
MS4yNSAxNDoyMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDEzLjExLjIwMjUgMTQ6
MTgsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPj4+Pj4gT24gMTMuMTEuMjUgMTQ6MzAs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDExLjExLjIwMjUgMTg6NTQsIEdyeWdv
cmlpIFN0cmFzaGtvIHdyb3RlOg0KPj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5
cGVyY2FsbC5jDQo+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMN
Cj4+Pj4+Pj4gQEAgLTI5LDEwICsyOSwxMiBAQCBsb25nIGh2bV9tZW1vcnlfb3AodW5zaWdu
ZWQgbG9uZyBjbWQsIA0KPj4+Pj4+PiBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFy
ZykNCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9TWVM7DQo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoCB9DQo+Pj4+Pj4+IC3CoMKgwqAgaWYgKCAhdmNwdV9pc19oY2Fs
bF9jb21wYXQoY3VycmVudCkgKQ0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcmMgPSBkb19t
ZW1vcnlfb3AoY21kLCBhcmcpOw0KPj4+Pj4+PiAtwqDCoMKgIGVsc2UNCj4+Pj4+Pj4gKyNp
ZmRlZiBDT05GSUdfQ09NUEFUDQo+Pj4+Pj4+ICvCoMKgwqAgaWYgKCB2Y3B1X2lzX2hjYWxs
X2NvbXBhdChjdXJyZW50KSApDQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJjID0g
Y29tcGF0X21lbW9yeV9vcChjbWQsIGFyZyk7DQo+Pj4+Pj4+ICvCoMKgwqAgZWxzZQ0KPj4+
Pj4+PiArI2VuZGlmDQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByYyA9IGRvX21lbW9yeV9v
cChjbWQsIGFyZyk7DQo+Pj4+Pj4NCj4+Pj4+PiBXaHkgd291bGQgdGhpcyBiZSBuZWVkZWQg
d2hlbiB2Y3B1X2lzX2hjYWxsX2NvbXBhdCgpIGFscmVhZHkgaG9ub3JzIA0KPj4+Pj4+IENP
TkZJR19DT01QQVQ/DQo+Pj4+Pj4gKFNhbWUgcXVlc3Rpb24gdGhlbiBhcHBsaWVzIGVsc2V3
aGVyZSwgb2YgY291cnNlLikNCj4+Pj4+DQo+Pj4+PiBUaGlzIEkgZG8gbm90IGxpa2UgYnkg
bXlzZWxmLCBidXQgSSB3YXMgbm90IGFibGUgdG8gZmluZCBvdGhlciBvcHRpb25zIDooDQo+
Pj4+Pg0KPj4+Pj4gaHlwZXJjYWxsLWRlZnMuaCBpcyBhdXRvZ2VuZXJhdGVkIGFuZCBpdCdz
IHRoZSBvbmx5IG9uZSBwbGFjZSB3aGVyZSBmdW5jdGlvbnMNCj4+Pj4+IGRlY2xhcmF0aW9u
cyBsaWtlIGRvX3hfb3AoKSBhcmUgYXBwZWFyZWQgb3IgZGlzYXBwZWFyZWQuDQo+Pj4+PiBT
byBidWlsZCBpcyBmYWlsaW5nIHdpdGhvdXQgaWZkZWZzIGFzIGNvbXBpbGVyIGNhbid0IGZp
bmQgY29tcGF0X21lbW9yeV9vcCgpDQo+Pj4+PiBkZWNsYXJhdGlvbi4NCj4+Pj4NCj4+Pj4g
T2gsIEkgc2VlOyBJIGhhZG4ndCB0aG91Z2h0IG9mIHRoYXQgYXNwZWN0LiBJIHdvbmRlciBp
ZiB3ZSB3b3VsZG4ndCBiZXR0ZXIgdGFrZQ0KPj4+PiBjYXJlIG9mIHRoYXQgaW4gdGhlIG1h
Y2hpbmVyeSB0aGVyZS4gQ2MtaW5nIErDvHJnZW4sIHdobyBkaWQgaW50cm9kdWNlIHRoaXMN
Cj4+Pj4gb3JpZ2luYWxseS4gTWF5YmUgaGUgaGFzIGNvbmNyZXRlIGFyZ3VtZW50cyBhZ2Fp
bnN0IHVzIGRvaW5nIHNvLg0KPj4+DQo+Pj4gTm8gYXJndW1lbnRzIGFnYWluc3QgaXQuDQo+
Pj4NCj4+PiBZb3UgcHJvYmFibHkgd2lsbCBuZWVkIGEgbmV3IFByZWZpeCBkZWZpbmVkIChl
LmcuIGNvbXBhdF9hbHdheXMpIGFuZCBzZXQgaXQgdmlhDQo+Pj4NCj4+PiAjZGVmaW5lIFBS
RUZJWF9jb21wYXRfYWx3YXlzIGNvbXBhdA0KPj4+DQo+Pj4gdW5jb25kaXRpb25hbGx5LiBU
aGVuIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBoYXZlDQo+Pj4NCj4+PiBQcmVmaXg6IGNv
bXBhdF9hbHdheXMNCj4+PiBtZW1vcnlfb3AoLi4uKQ0KPj4+DQo+Pj4gb3V0c2lkZSBvZiAj
aWZkZWZzIGFuZCBkcm9wIHRoZSBtZW1vcnlfb3AoKSBpbiB0aGUgI2lmZGVmIENPTkZJR19D
T01QQVQgc2VjdGlvbi4NCj4+DQo+PiBPaCwgdGhpcyBtaWdodCBiZSB3cm9uZywgYXMgdGhp
cyB3aWxsIGJyZWFrIHRoZSBQVjMyIG1lbW9yeV9vcCgpIGh5cGVyY2FsbC4NCj4+DQo+PiBZ
b3UgbmVlZCB0byBrZWVwIHRoZSBjdXJyZW50IG1lbW9yeV9vcCgpIGluIHRoZSAjaWZkZWYg
Q09ORklHX0NPTVBBVCBzZWN0aW9uDQo+PiBhbmQgbW92ZSB0aGUgY29tcGF0X2Fsd2F5cyBz
dHVmZiBpbnRvIGFuICNlbHNlIHBhcnQgb2YgdGhlIENPTkZJR19DT01QQVQuDQo+Pg0KPj4+
DQo+Pj4gVGhpcyBzaG91bGQgcmVzdWx0IGluIHRoZSBjb21wYXRfbWVtb3J5X29wKCkgcHJv
dG90eXBlIHRvIGJlIGFsd2F5cyBhdmFpbGFibGUuDQo+Pj4gSGF2aW5nIG5vIHJlbGF0ZWQg
ZnVuY3Rpb24gc2hvdWxkIGJlIG5vIHByb2JsZW0gZHVlIHRvIERDTyBpbiBjYXNlIENPTkZJ
R19DT01QQVQNCj4+PiBpc24ndCBkZWZpbmVkLg0KPiANCj4gU210aCBsaWtlIHRoaXMsIHJp
Z2h0Pw0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2h5cGVyY2FsbC1kZWZzLmMg
Yi94ZW4vaW5jbHVkZS9oeXBlcmNhbGwtZGVmcy5jDQo+IGluZGV4IDMzOGQ3YWZlMzA0OC4u
ZTg1OTQzMzIwYmQyIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS9oeXBlcmNhbGwtZGVm
cy5jDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2h5cGVyY2FsbC1kZWZzLmMNCj4gQEAgLTgwLDYg
KzgwLDggQEAgcmV0dHlwZTogY29tcGF0IGludA0KPiAgwqAjZGVmaW5lIFBSRUZJWF9jb21w
YXQNCj4gIMKgI2VuZGlmDQo+IA0KPiArI2RlZmluZSBQUkVGSVhfY29tcGF0X2Fsd2F5cyBj
b21wYXQNCj4gKw0KPiAgwqAjaWZkZWYgQ09ORklHX0FSTQ0KPiAgwqAjZGVmaW5lIFBSRUZJ
WF9kZXAgZGVwDQo+ICDCoCNkZWZpbmUgUFJFRklYX2RvX2FybSBkb19hcm0NCj4gQEAgLTE1
Niw2ICsxNTgsOSBAQCBwbGF0Zm9ybV9vcChjb21wYXRfcGxhdGZvcm1fb3BfdCAqdV94ZW5w
Zl9vcCkNCj4gIMKgI2lmZGVmIENPTkZJR19LRVhFQw0KPiAgwqBrZXhlY19vcCh1bnNpZ25l
ZCBpbnQgb3AsIHZvaWQgKnVhcmcpDQo+ICDCoCNlbmRpZg0KPiArI2Vsc2UNCj4gK3ByZWZp
eDogUFJFRklYX2NvbXBhdF9hbHdheXMNCg0KVGhpcyBzaG91bGQgYmU6DQoNCitwcmVmaXg6
IGNvbXBhdF9hbHdheXMNCg0KPiArbWVtb3J5X29wKHVuc2lnbmVkIGludCBjbWQsIHZvaWQg
KmFyZykNCj4gIMKgI2VuZGlmIC8qIENPTkZJR19DT01QQVQgKi8NCg0KDQpKdWVyZ2VuDQo=

--------------sQiFnd29yurz7Yf01zWH0XSn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------sQiFnd29yurz7Yf01zWH0XSn--

--------------Mi7lixFpgDR6stwLEs04cEBw--

--------------tiZfe5OpSQ1etTKdtNsUg00X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkV/MAFAwAAAAAACgkQsN6d1ii/Ey8c
Pwf+OD+/oM3J/6pY4t8ypNYjLefqjmOkSOx/y4TH5BCgwtKQOEQ3GTG47RaKIguKaBacFNMZXINm
XyfCnEIkSTnDG6GIYcnyyNH6ebjLzyQdPshBQXqGeIEIu7AWxHjsr+yuaWaBI/wgAimhPQiUieJk
xkDR6ap6cC89q+SV1DqiqlPdGpCZsBmu1rvddy25BW2hvqTXAmZ1EgvM5TwkaxPwrBs5mJ/jyl9D
cbA3D+Su9ZNxlSTTaf1sSsgnjCnv/mtEqrPPuIKCRg0tJxhDjYkwmoa3R368Dr+paVYtc5nCZMZY
JKOB8olGqVnlmRcFDCwZ8zlr55SI5HqvxkOwmH/ZTw==
=7Hcf
-----END PGP SIGNATURE-----

--------------tiZfe5OpSQ1etTKdtNsUg00X--

