Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAB0C642E9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 13:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163757.1490823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyhb-00020H-8V; Mon, 17 Nov 2025 12:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163757.1490823; Mon, 17 Nov 2025 12:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKyhb-0001xS-51; Mon, 17 Nov 2025 12:51:27 +0000
Received: by outflank-mailman (input) for mailman id 1163757;
 Mon, 17 Nov 2025 12:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vKyhZ-0001xJ-L8
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 12:51:25 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f420d16-c3b4-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 13:51:23 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so5524476a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 04:51:23 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-644f13ff4d4sm715949a12.12.2025.11.17.04.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 04:51:22 -0800 (PST)
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
X-Inumbo-ID: 1f420d16-c3b4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763383883; x=1763988683; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wdoUjGOxSMU7p6pb37DQiCH+vreffo1ifkKKB64g0dQ=;
        b=QptwqtYKIFLr6aBiBC+qWdIDbijmWjwfxjEMLeQX/uP7K9BWrkFAqWTnx+JQXzb1sK
         qs0odzkYWV+2pT8FZfp4LdV7MCqyxzcdL6K2kzAL7KbNAvFPVVoCaJZvMXOqapCD9TYn
         zvWyhalshQh+xsDIcgsVq0VvmGx6KOpD0JDMK4Jv2Ufwe74LHJZWs+gQvcsuZNc2Jsku
         6H+6cZBwnjNPm5mrqYtZBSul4c07uTUZc+lxAG3vUDnrXCfYKqlsEA6j2PfGXa9mTMrs
         beGNc4n/jpV0V/w3u2UscI3GpRHkYWmglGM0wpMnzT8VIw7iydqkkwf0X75uRrs2Wf/I
         8cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763383883; x=1763988683;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdoUjGOxSMU7p6pb37DQiCH+vreffo1ifkKKB64g0dQ=;
        b=JjM/jxfupd6MLC1OZt1ckXAPMpboV/o+cjplzBKWVvSXyNab5vcf/7PbFL2irCGiCF
         1qi8ufPcbS4Znh1RGxtzA2r+P0jCP1I3e7aT6AQckGGMui24pz2vrVQUtGYKMFX7lio0
         5K276OYo0HUD1SZJSgZxsV58J/l+2A4LhOuYsUyg1ka4pJW7SIHCjOsuNUEOpHx4YKnt
         ssXNhvgi8oIDsJaMH3vaVdmQIzKEICwYVQd/hOa40R6DC7+sfpGao/s+3Z/FCOzymhxW
         uU1Bff6RPRjhHVxgLtyiudoLtIrTYIWfEe07k0Ws+LIU05sk+4bIwAlADO1UnKTnSp/8
         v4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUWBzDRpsGPGs/htt8mlWKWEiJbn1hUfXBC60OfWriKUUYDD85vMSha4Qtmo+j6wxK5zQN9CiMIHhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZgWsnbf9j9z8VCpV0f1z3Dh26kf16EjKcVIMteaNXyk1i07Eo
	73K85iuRkOqvwEXB+UEG5QJOqOJ6qwIKQrcLo5tJauCh0uqN0/vwaP6JbUI/Ay5XpCk=
X-Gm-Gg: ASbGncsw9iITW21mLgxvn3itkIWqusafgbLYMkYWQMN8Xs8ToFB+m+y6wJZeUojNeux
	CmJG4N+hgiP1Zu1fEzH5ZTDNQULJYDV9/dxNCrOTs+LsfSvGmyYGWYgNff0TFCXs21A/N/dxEGP
	kfGM59K1BtIiPctb1LiR4Kmp2x3gYV4yPJx0i+YdtKWVidGj93J5W8t2roaDeelaBgNfKYysPOD
	DxyjI8c00JYswYRtHBSlMyyux07OisJgtCcgOVJlgEvHlfkS/NRTOsuo8+ZkVn2ZrucUOy7fpgz
	9SnuVjpzj5ydWi7VE/WEJlofGUwr4njonCNuN+TCgJySDPZb50QmKvo6+xv8LQSqbA4D+HhMNJ4
	GFWvZXbKv47IvGVRw6Zu3X3gkjucqVBFAnhb709o1StoBeCL9FeZK/zSvTU6F4T3fEQTSEF+3dw
	6Yl0Y2jk64ZKKWDV3ktkn0wSwXHEwKAZAEidHbNh+ni8sESkwJVw1zxBQiOvoq1/LBgizB7y2ko
	0HEat1IUP7hO3Oj91ALEaeiuphLiQ885X2awhVOh7WVYb47AQ==
X-Google-Smtp-Source: AGHT+IFu4pB+xIaWFZYOUrdSjTQn+rmGzGocZWXlq7fsDw08fxkxqp7TMFDQ8n7dEAisu1Q0wic3YQ==
X-Received: by 2002:a05:6402:3494:b0:643:130c:eb0 with SMTP id 4fb4d7f45d1cf-64350e06bbfmr11490964a12.8.1763383882867;
        Mon, 17 Nov 2025 04:51:22 -0800 (PST)
Message-ID: <4e721924-d28b-4d7e-9aee-d55cd5e7878f@suse.com>
Date: Mon, 17 Nov 2025 13:51:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
 <d3528e7b-a811-47ca-a508-c0aa0746d9f3@citrix.com>
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
In-Reply-To: <d3528e7b-a811-47ca-a508-c0aa0746d9f3@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5uLPqbE6IiONInTZx4aKLiqm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5uLPqbE6IiONInTZx4aKLiqm
Content-Type: multipart/mixed; boundary="------------ZsooZRKM6zhNrkiGTb9rt4oo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <4e721924-d28b-4d7e-9aee-d55cd5e7878f@suse.com>
Subject: Re: [PATCH v2 1/4] build: add make macro for making file from file.in
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-2-jgross@suse.com>
 <468c6686-43e5-4c35-8366-58558f199e22@citrix.com>
 <cc90d18b-f88e-49d9-a55f-b7035ce43167@suse.com>
 <113c9cc1-5e39-4a54-88de-dd2b70b90a49@suse.com>
 <d3528e7b-a811-47ca-a508-c0aa0746d9f3@citrix.com>
In-Reply-To: <d3528e7b-a811-47ca-a508-c0aa0746d9f3@citrix.com>
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

--------------ZsooZRKM6zhNrkiGTb9rt4oo
Content-Type: multipart/mixed; boundary="------------npUqLT6pytv6MVNZjmUgshoJ"

--------------npUqLT6pytv6MVNZjmUgshoJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMTEuMjUgMTM6MzAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDE3LzExLzIw
MjUgMTI6MjQgcG0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMTQuMTEuMjAyNSAxMzo1
NCwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAxNC4xMS4yNSAxMjo0MiwgQW5kcmV3
IENvb3BlciB3cm90ZToNCj4+Pj4gT24gMTQvMTEvMjAyNSAxMTozMiBhbSwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+Pj4+IGRpZmYgLS1naXQgYS9Db25maWcubWsgYi9Db25maWcubWsN
Cj4+Pj4+IGluZGV4IGUxNTU2ZGZiZmEuLmQyMWQ2Nzk0NWEgMTAwNjQ0DQo+Pj4+PiAtLS0g
YS9Db25maWcubWsNCj4+Pj4+ICsrKyBiL0NvbmZpZy5taw0KPj4+Pj4gQEAgLTE1OSw2ICsx
NTksMTkgQEAgZGVmaW5lIG1vdmUtaWYtY2hhbmdlZA0KPj4+Pj4gICAgCWlmICEgY21wIC1z
ICQoMSkgJCgyKTsgdGhlbiBtdiAtZiAkKDEpICQoMik7IGVsc2Ugcm0gLWYgJCgxKTsgZmkN
Cj4+Pj4+ICAgIGVuZGVmDQo+Pj4+PiAgICANCj4+Pj4+ICtQQVRIX0ZJTEVTIDo9IFBhdGhz
DQo+Pj4+PiArSU5DX0ZJTEVTIDo9ICQoZm9yZWFjaCBmLCAkKFBBVEhfRklMRVMpLCAkKFhF
Tl9ST09UKS9jb25maWcvJChmKS5taykNCj4+Pj4+ICsNCj4+Pj4+ICtpbmNsdWRlICQoSU5D
X0ZJTEVTKQ0KPj4+Pj4gKw0KPj4+Pj4gK0JVSUxEX01BS0VfVkFSUyA6PSAkKGZvcmVhY2gg
ZiwgJChQQVRIX0ZJTEVTKSwgJChzaGVsbCBhd2sgJyQkMiA9PSAiOj0iIHsgcHJpbnQgJCQx
OyB9JyAkKFhFTl9ST09UKS9jb25maWcvJChmKS5tay5pbikpDQo+Pj4+PiArDQo+Pj4+PiAr
IyBSZXBsYWNlIEB4eHhAIG1hcmtlcnMgaW4gJCgxKS5pbiB3aXRoICQoeHh4KSB2YXJpYWJs
ZSBjb250ZW50cywgd3JpdGUgdG8gJCgxKQ0KPj4+Pj4gK2RlZmluZSBhcHBseS1idWlsZC12
YXJzDQo+Pj4+PiArICQoMSk6ICQoMSkuaW4NCj4+Pj4+ICsJc2VkICQkKGZvcmVhY2ggdiwg
JCQoQlVJTERfTUFLRV9WQVJTKSwgLWUgJ3MjQCQkKHYpQCMkJCgkJCh2KSkjZycpIDwkJDwg
PiQkQA0KPj4+Pj4gK2VuZGVmDQo+Pj4+IFNob3VsZG4ndCB0aGlzIHdyaXRlIHRvIGEgdG1w
IGZpbGUsIGFuZCB1c2UgbW92ZS1pZi1jaGFuZ2VkP8KgIE1vc3Qgb2YNCj4+Pj4gdGhlIHRp
bWUgdGhlIG1hcmtlcnMgd29uJ3QgaGF2ZSBjaGFuZ2VkLCBhbmQgd2UnbGwgd2FudCB0byBz
aG9ydCBjaXJjdWl0DQo+Pj4+IGRlcGVuZGVudCBydWxlcy4NCj4+PiBJIGNhbiBzZWUgdGhp
cyBiZWluZyBhbiBhZHZhbnRhZ2Ugd2hlbiBlLmcuIGdlbmVyYXRpbmcgaGVhZGVyIGZpbGVz
LCBhcw0KPj4+IHRob3NlIGJlaW5nIGdlbmVyYXRlZCBhZ2FpbiB3b3VsZCBwb3RlbnRpYWxs
eSBjYXVzZSBsb3RzIG9mIHJlYnVpbGRzLg0KPj4+DQo+Pj4gSW4gdGhpcyBjYXNlIEkgY2Fu
IGhhcmRseSBzZWUgYW55IGNhc2Ugd2hlcmUgbWFrZSB3b3VsZG4ndCBkbyB0aGUgcmlnaHQN
Cj4+PiB0aGluZyBhbHJlYWR5LiBFaXRoZXIgdGhlICouaW4gZmlsZSBpcyBuZXdlciB0aGFu
IHRoZSBnZW5lcmF0ZWQgZmlsZSBkdWUNCj4+PiB0byBhIGdpdCB1cGRhdGUgb3IgYSBtYW51
YWwgZWRpdCwgc28gbWFrZSB3aWxsIHJlZ2VuZXJhdGUgdGhlIHRhcmdldCAoYW5kDQo+Pj4g
dGhpcyBpcyB3aGF0IHdlIHdhbnQpLCBvciB0aGUgKi5pbiBmaWxlIGhhc24ndCBjaGFuZ2Vk
LCBzbyBtYWtlIHdvbid0DQo+Pj4gcmVnZW5lcmF0ZSB0aGUgZmlsZSBhcyBpdCBpcyBuZXdl
ciB0aGFuIHRoZSAqLmluIGZpbGUgYWxyZWFkeS4NCj4+Pg0KPj4+IE9yIGRpZCBJIG1pc3Mg
c29tZSBhc3BlY3Q/DQo+PiBBcmVuJ3Qgc29tZSBvZiB0aGUgZ2VuZXJhdGVkIGZpbGVzIE1h
a2VmaWxlIGZyYWdtZW50cz8gVGhlbSBiZWluZyByZS1nZW5lcmF0ZWQNCj4+IG1lYW5zIG1h
a2UgcmUtaW52b2tpbmcgaXRzZWxmLCB3aGljaCBjb3VsZCBiZSBhdm9pZGVkIGlmIHRoZSBj
b250ZW50cyBkb24ndA0KPj4gcmVhbGx5IGNoYW5nZS4gKFRoaXMgaXNuJ3QganVzdCBhIHBl
cmZvcm1hbmNlIGNvbmNlcm47IHRoaXMgcmUtaW52b2NhdGlvbiBoYXMNCj4+IGJlZW4gdGhl
IHNvdXJjZSBvZiwgd2VsbCwgc3VycHJpc2luZyBiZWhhdmlvciBpbiBjZXJ0YWluIGNhc2Vz
LikNCj4gDQo+IEhhdmluZyB0aG91Z2h0IGFib3V0IHRoaXMgc29tZSBtb3JlLCBpdCBuZWVk
cyB0byBiZSBGT1JDRSBhbmQNCj4gbW92ZS1pZi1jaGFuZ2VkLCBvciB0byBleHByZXNzIGEg
ZGVwZW5kZW5jeSBvbiBQYXRocy5taw0KDQpJIHNhaWQgdGhhdCBhbHJlYWR5IGluIHRoZSBw
YXJhZ3JhcGgganVzdCBhZnRlciB0aGUgcGFydCBvZiBteSByZXNwb25zZSB5b3UNCmNpdGVk
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------npUqLT6pytv6MVNZjmUgshoJ
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

--------------npUqLT6pytv6MVNZjmUgshoJ--

--------------ZsooZRKM6zhNrkiGTb9rt4oo--

--------------5uLPqbE6IiONInTZx4aKLiqm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkbGkoFAwAAAAAACgkQsN6d1ii/Ey/c
dAf/TZ4QrgbAu++0T8Udfk4EqnqCAlZ3FKMcA+yBSZGzAgyHI2xAZclMnFOgMjbembnfe57V3sVz
5bFqEzeiYiAUaWCo/z0M454sSEgMfHh1kS/o1kwOhGxQhwQuDwk3nmCfJT0SVk6eqDjGscwmEY09
FF2xugPq4RJjUV9fullE6WvTQO7F52j6YzNN6Xwg8F2CrgQbV35g67nY5sSp9Kyo9CDv3aHhV9Bj
0/D+FrmUyTTbyT2VTWZWBW9/rK37qz67jZEALkvdWAhOUUKj/MfiYcbafQ6x2BwcWkSABMqH5PtU
+S58P0O+/Jix3MxnlwXcEHDrTn/3y8OlHktJIjTagQ==
=F/I5
-----END PGP SIGNATURE-----

--------------5uLPqbE6IiONInTZx4aKLiqm--

