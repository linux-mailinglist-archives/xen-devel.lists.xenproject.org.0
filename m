Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BA9EB550
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 16:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852794.1266491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2Pb-0007eH-Iy; Tue, 10 Dec 2024 15:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852794.1266491; Tue, 10 Dec 2024 15:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2Pb-0007bE-Fh; Tue, 10 Dec 2024 15:44:35 +0000
Received: by outflank-mailman (input) for mailman id 852794;
 Tue, 10 Dec 2024 15:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2aGN=TD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tL2PZ-0007b7-CX
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 15:44:33 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5a0b50c-b70d-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 16:44:31 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3e6274015so5062470a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 07:44:31 -0800 (PST)
Received: from ?IPV6:2003:e5:8701:7700:f2d:e3aa:8e9e:99bf?
 (p200300e5870177000f2de3aa8e9e99bf.dip0.t-ipconnect.de.
 [2003:e5:8701:7700:f2d:e3aa:8e9e:99bf])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa67f26cff7sm391100966b.57.2024.12.10.07.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 07:44:30 -0800 (PST)
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
X-Inumbo-ID: a5a0b50c-b70d-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733845471; x=1734450271; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dNPnrE7XWnt+zLtq1pKSkvTLF/s7F/MO3dxMCRBovyo=;
        b=FtZYuM2A6JGG8s+K4q2zFyEnHCBZt7MP0CQ96oJkz1LDHbN7ApJCdqE6Jep5sR0goR
         lDpgah6E77YiUgIrb+JnfEJOMIXLsX2058vLemfEQi19B3tTFu+ifdaOfBCAgO/4eocL
         BK0vatLipqyDHMRtSAQiFjmq3Vmu8i17CvwcA+WpT3qq0lZVGak1Y/3KI2qSGlWTF5TB
         p4nm1saINNGM0p5cSTqmYcg2Tn8KjuWQv25f4wSzN0/Jh7bPQ9CoKZE8Yk4fgDioTOWy
         vum2OcxrsmfIylS7iO2iLMKv+HMhPFc7/dmUlbkpHaQkZro+tRxyTAnVUTJIoLVURcuF
         Ejaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733845471; x=1734450271;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dNPnrE7XWnt+zLtq1pKSkvTLF/s7F/MO3dxMCRBovyo=;
        b=pFkbCBjBXl059+2lZ0nSVV1pYDz1cIQCUvhVRHYtf0FcB3P/q6lKn5ZEUEF55Tlvc9
         eUO1xNuMVYTWrSJWYlZOcuFnZjgeUYrXS7GEOH+ZWrNBNqffonX5zBu7vBG1Ht4dYbQ+
         xmQWrZAA2irPJ9cJTUpI677GVlfEuEkj9ORyPuY25f1FMA1yQq8UB+7vHdw4gdJScvNk
         dwn2F6xvuJupsYsXTa+XV8t9gDU4E2OnzVCs6bs537RHpVPMZxulipUKCKNQJ20iTNal
         KXdYXB/I+f8RtGuaTqtmu3Wse1ivvQipldgaQcmxr7wNqNUarXXjNGU/zazmecLPACE3
         lkCg==
X-Forwarded-Encrypted: i=1; AJvYcCXGealukSHS3Xaa5oi9SitMTSd+GJAF2ZK/Mc8Oj5NVga3t7EpqikKhTPdhHio3dUjBlWDvJGwMRJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRTGpMK4wvnDLfa+ctnlqZcHnX5Vgmu/efOhQWm7cb9+W9mOwf
	oT7MQt8oOpL5WL9XP+2O4ZOJp4JDrVDh2piVYWuqmocWOMGjs20S4hVLUrq1aeo=
X-Gm-Gg: ASbGncu61tz5NvNHD0QDiNU49X7aIIr/r74YAZJYGNLdgwPKNj0U24+4fGe+pZytNhq
	dJsAybeXgHZiMPT7ZS9xthg1Rgrz9oN40wyIS/gRw7uTpaslQll5L7VICpYej1GE+zQ6qbvAr3d
	MoV/vvu9ItSKfPmWuymAClE50DR+crwkS2Cv0gbyCNBG2NysxXemduG/BmHxa8RQasOx3Efikcm
	EKEMozbiDoeLxLyvfzxnc0QTD5mx0ujS4kDz1Cx2vMt7kIosY+u8U41PdRV+f0cJ/GMy5xNw+uW
	6aOxuw8InAhHy7+GuMkXXdTFb9BN6U3rU59iB48QPbIRHpfZxaougfScMgBsZRb7Ll+TShYghnv
	P
X-Google-Smtp-Source: AGHT+IGt3siNw8wCrXWooFfJ5vcgraHSurcHzLoXTUlpcJgDL+HlrGNpIZMOiFdIMokvmXBUKrRgPg==
X-Received: by 2002:a17:906:308a:b0:aa6:650f:cf35 with SMTP id a640c23a62f3a-aa6650fd388mr1212625666b.47.1733845470750;
        Tue, 10 Dec 2024 07:44:30 -0800 (PST)
Message-ID: <32a580a6-4a38-4c8f-b5e6-4166b8cf004f@suse.com>
Date: Tue, 10 Dec 2024 16:44:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-5-jgross@suse.com>
 <8acde5e5-7972-4f7a-ae31-92c3f323669c@suse.com>
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
In-Reply-To: <8acde5e5-7972-4f7a-ae31-92c3f323669c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LyMN4q0w2NWt80ISQEnQ4BY7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LyMN4q0w2NWt80ISQEnQ4BY7
Content-Type: multipart/mixed; boundary="------------0TDIASmdRJDVbbLIpHdE0lhE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <32a580a6-4a38-4c8f-b5e6-4166b8cf004f@suse.com>
Subject: Re: [PATCH v2 4/7] xen: add bitmap to indicate per-domain state
 changes
References: <20241206130221.17773-1-jgross@suse.com>
 <20241206130221.17773-5-jgross@suse.com>
 <8acde5e5-7972-4f7a-ae31-92c3f323669c@suse.com>
In-Reply-To: <8acde5e5-7972-4f7a-ae31-92c3f323669c@suse.com>
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

--------------0TDIASmdRJDVbbLIpHdE0lhE
Content-Type: multipart/mixed; boundary="------------gmp0ElYS7QfKzpkZI0JhRfu3"

--------------gmp0ElYS7QfKzpkZI0JhRfu3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMTIuMjQgMTc6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMi4yMDI0
IDE0OjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQWRkIGEgYml0bWFwIHdpdGggb25l
IGJpdCBwZXIgcG9zc2libGUgZG9taWQgaW5kaWNhdGluZyB0aGUgcmVzcGVjdGl2ZQ0KPj4g
ZG9tYWluIGhhcyBjaGFuZ2VkIGl0cyBzdGF0ZSAoY3JlYXRlZCwgZGVsZXRlZCwgZHlpbmcs
IGNyYXNoZWQsDQo+PiBzaHV0ZG93bikuDQo+Pg0KPj4gUmVnaXN0ZXJpbmcgdGhlIFZJUlFf
RE9NX0VYQyBldmVudCB3aWxsIHJlc3VsdCBpbiBzZXR0aW5nIHRoZSBiaXRzIGZvcg0KPj4g
YWxsIGV4aXN0aW5nIGRvbWFpbnMgYW5kIHJlc2V0dGluZyBhbGwgb3RoZXIgYml0cy4NCj4+
DQo+PiBSZXNldHRpbmcgYSBiaXQgd2lsbCBiZSBkb25lIGluIGEgZnV0dXJlIHBhdGNoLg0K
Pj4NCj4+IFRoaXMgaW5mb3JtYXRpb24gaXMgbmVlZGVkIGZvciBYZW5zdG9yZSB0byBrZWVw
IHRyYWNrIG9mIGFsbCBkb21haW5zLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4gDQo+IFdoYXQgSSdtIHN0aWxsIG1pc3Npbmcg
aXMgYXQgbGVhc3QgbWVudGlvbiBvZiB0aGUgZ2xvYmFsLW5lc3Mgb2YgYWxsIG9mDQo+IHRo
aXMsIGFuZCB3aHkgdGhhdCdzIGRlZW1lZCBva2F5IGZvciBub3cuDQoNCkknbGwgYWRkOg0K
DQogICBBcyB0aGUgdXNhZ2Ugb2YgdGhpcyBiaXRtYXAgaXMgdGlnaHRseSBjb3VwbGVkIHdp
dGggdGhlIFZJUlFfRE9NX0VYQyBldmVudCwNCiAgIGl0IGlzIG1lYW50IHRvIGJlIHVzZWQg
b25seSBieSBhIHNpbmdsZSBjb25zdW1lciBpbiB0aGUgc3lzdGVtLCBqdXN0IGxpa2UNCiAg
IHRoZSBWSVJRX0RPTV9FWEMgZXZlbnQuDQoNCj4gDQo+PiAtLS0gYS94ZW4vY29tbW9uL2Rv
bWFpbi5jDQo+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jDQo+PiBAQCAtMTM4LDYgKzEz
OCw2MCBAQCBib29sIF9fcmVhZF9tb3N0bHkgdm10cmFjZV9hdmFpbGFibGU7DQo+PiAgIA0K
Pj4gICBib29sIF9fcmVhZF9tb3N0bHkgdnBtdV9pc19hdmFpbGFibGU7DQo+PiAgIA0KPj4g
K3N0YXRpYyBERUZJTkVfU1BJTkxPQ0soZG9tX3N0YXRlX2NoYW5nZWRfbG9jayk7DQo+PiAr
c3RhdGljIHVuc2lnbmVkIGxvbmcgKmRvbV9zdGF0ZV9jaGFuZ2VkOw0KPj4gKw0KPj4gK2lu
dCBkb21haW5faW5pdF9zdGF0ZXModm9pZCkNCj4+ICt7DQo+PiArICAgIGNvbnN0IHN0cnVj
dCBkb21haW4gKmQ7DQo+PiArICAgIGludCByYyA9IC1FTk9NRU07DQo+PiArDQo+PiArICAg
IHNwaW5fbG9jaygmZG9tX3N0YXRlX2NoYW5nZWRfbG9jayk7DQo+PiArDQo+PiArICAgIGlm
ICggZG9tX3N0YXRlX2NoYW5nZWQgKQ0KPj4gKyAgICAgICAgYml0bWFwX3plcm8oZG9tX3N0
YXRlX2NoYW5nZWQsIERPTUlEX0ZJUlNUX1JFU0VSVkVEKTsNCj4+ICsgICAgZWxzZQ0KPj4g
KyAgICB7DQo+PiArICAgICAgICBkb21fc3RhdGVfY2hhbmdlZCA9IHh6YWxsb2NfYXJyYXko
dW5zaWduZWQgbG9uZywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBCSVRTX1RPX0xPTkdTKERPTUlEX0ZJUlNUX1JFU0VSVkVEKSk7DQo+IA0KPiBO
ZXcgY29kZSB3YW50cyB0byB1c2UgeHZtYWxsb2MoKSBldCBhbC4NCg0KT2theS4NCg0KPiAN
Cj4+IC0tLSBhL3hlbi9jb21tb24vZXZlbnRfY2hhbm5lbC5jDQo+PiArKysgYi94ZW4vY29t
bW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4gQEAgLTQ4NSwyMCArNDg1LDI3IEBAIGludCBldnRj
aG5fYmluZF92aXJxKGV2dGNobl9iaW5kX3ZpcnFfdCAqYmluZCwgZXZ0Y2huX3BvcnRfdCBw
b3J0KQ0KPj4gICAgICAgaWYgKCAodiA9IGRvbWFpbl92Y3B1KGQsIHZjcHUpKSA9PSBOVUxM
ICkNCj4+ICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsNCj4+ICAgDQo+PiArICAgIGlmICgg
dmlycSA9PSBWSVJRX0RPTV9FWEMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICByYyA9IGRv
bWFpbl9pbml0X3N0YXRlcygpOw0KPj4gKyAgICAgICAgaWYgKCByYyApDQo+PiArICAgICAg
ICAgICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICAgIHdyaXRlX2xvY2so
JmQtPmV2ZW50X2xvY2spOw0KPj4gICANCj4+ICAgICAgIGlmICggcmVhZF9hdG9taWMoJnYt
PnZpcnFfdG9fZXZ0Y2huW3ZpcnFdKSApDQo+PiAgICAgICB7DQo+PiAgICAgICAgICAgcmMg
PSAtRUVYSVNUOw0KPj4gICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiRVZU
Q0hOT1AgZmFpbHVyZTogZXJyb3IgJWRcbiIsIHJjKTsNCj4+IC0gICAgICAgIGdvdG8gb3V0
Ow0KPj4gKyAgICAgICAgZ290byB1bmxvY2s7DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gICAg
ICAgcG9ydCA9IHJjID0gZXZ0Y2huX2dldF9wb3J0KGQsIHBvcnQpOw0KPj4gICAgICAgaWYg
KCByYyA8IDAgKQ0KPj4gICAgICAgew0KPj4gICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19X
QVJOSU5HLCAiRVZUQ0hOT1AgZmFpbHVyZTogZXJyb3IgJWRcbiIsIHJjKTsNCj4+IC0gICAg
ICAgIGdvdG8gb3V0Ow0KPj4gKyAgICAgICAgZ290byB1bmxvY2s7DQo+PiAgICAgICB9DQo+
PiAgIA0KPj4gICAgICAgcmMgPSAwOw0KPj4gQEAgLTUyNCw5ICs1MzEsMTMgQEAgaW50IGV2
dGNobl9iaW5kX3ZpcnEoZXZ0Y2huX2JpbmRfdmlycV90ICpiaW5kLCBldnRjaG5fcG9ydF90
IHBvcnQpDQo+PiAgICAgICAgKi8NCj4+ICAgICAgIHdyaXRlX2F0b21pYygmdi0+dmlycV90
b19ldnRjaG5bdmlycV0sIHBvcnQpOw0KPj4gICANCj4+IC0gb3V0Og0KPj4gKyB1bmxvY2s6
DQo+PiAgICAgICB3cml0ZV91bmxvY2soJmQtPmV2ZW50X2xvY2spOw0KPj4gICANCj4+ICsg
b3V0Og0KPj4gKyAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIGRvbWFpbl9kZWluaXRfc3Rh
dGVzKCk7DQo+PiArDQo+PiAgICAgICByZXR1cm4gcmM7DQo+PiAgIH0NCj4gDQo+IFJlbmFt
aW5nIHRoZSBwcmlvciBsYWJlbCAoYW5kIGhlbmNlIG5lZWRpbmcgdG8gZmlkZGxlIHdpdGgg
ZXhpc3RpbmcgZ290by1zKQ0KPiBmZWVscyBhIGxpdHRsZSBmcmFnaWxlLiBIb3cgYWJvdXQg
a2VlcGluZyAib3V0IiBhcyBpcyBhbmQgaW50cm9kdWNpbmcgImRlaW5pdCINCj4gb3Igc29t
ZSBzdWNoPw0KDQpGaW5lIHdpdGggbWUuDQoNCg0KSnVlcmdlbg0K
--------------gmp0ElYS7QfKzpkZI0JhRfu3
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------gmp0ElYS7QfKzpkZI0JhRfu3--

--------------0TDIASmdRJDVbbLIpHdE0lhE--

--------------LyMN4q0w2NWt80ISQEnQ4BY7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdYYd0FAwAAAAAACgkQsN6d1ii/Ey8O
Jgf+Ls6KGXP/x+wv+chOgsbEmSoTyChIoNbHXg+cFs8FAPweZhL8LKuKmR0p5TTjaBewGeP8e4ID
vHCs3npLg+5aLs/8thgiozYMhFFtS4y1PrgM4qgO/Yo+NEkUAXJilY8MV+FOyTA0nJCiv+BA9VMe
rURYenU+ib//n+jxWh65hhbu9EX7fWytQvF/5rznAfGFrH7SiKmPDXKN4A7gYEZcs91NzJzC94/O
NER1Zus/oo+U0m62UFvxUQN5+942uTkpkEz3Qubi10RMoGTBxPb7NbsbElt33V42ri5Jm6YeW/iB
y1xE/WlH0SB9+CcVxWhV69OZ0o9cKumUDEamDO4j1Q==
=11aP
-----END PGP SIGNATURE-----

--------------LyMN4q0w2NWt80ISQEnQ4BY7--

