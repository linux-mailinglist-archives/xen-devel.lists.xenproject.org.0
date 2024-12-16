Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFD9F3181
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 14:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858033.1270280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBB3-00086M-7K; Mon, 16 Dec 2024 13:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858033.1270280; Mon, 16 Dec 2024 13:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNBB3-00084t-4Q; Mon, 16 Dec 2024 13:30:25 +0000
Received: by outflank-mailman (input) for mailman id 858033;
 Mon, 16 Dec 2024 13:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNBB1-00084n-KQ
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 13:30:23 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6aa2fe5-bbb1-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 14:30:22 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-aab925654d9so491903966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 05:30:22 -0800 (PST)
Received: from ?IPV6:2003:e5:8725:5e00:fa69:c5cb:46d:3e5b?
 (p200300e587255e00fa69c5cb046d3e5b.dip0.t-ipconnect.de.
 [2003:e5:8725:5e00:fa69:c5cb:46d:3e5b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96390cbesm330169366b.158.2024.12.16.05.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 05:30:21 -0800 (PST)
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
X-Inumbo-ID: e6aa2fe5-bbb1-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734355822; x=1734960622; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N9kyEzeL62UYAfA9Mb+PrEZVN4x1XgjhNEltXJTS2Hg=;
        b=dF9/Pikv14UCIIErMC2WI7pS0qW10TSVFVWp9C+a5jhXcEIb4v/s62obDoyI05MiIO
         eZJ9YWYTO/udwUgwo7ZoHP/Y4WhT07UJccmfQG4YR90Ey2cacLTs3T/bs4/xwvtYtz4L
         sC66R1g5oBrQeGUXUaSNNPU82GXA6Wh3FJF6a3MClKE6l/Radz24jcpeVkhTuuPhPVJ8
         eYgCjNqzxvAeUKdLit0QpuAiZgY2V8NdbH3rmHG068ODPElQBNhsCMfOo/oz75oRM6SI
         J6PHvK0c+YCRTtT15rR26s+B3aS6mjdzAtw9LMTHZja4G0T7kM+iPFZHypOhKxeSJzCU
         9c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734355822; x=1734960622;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N9kyEzeL62UYAfA9Mb+PrEZVN4x1XgjhNEltXJTS2Hg=;
        b=EJBEDVdbnapG5qcJ+B35eIATrzBxhnfe97GfcM1BlDSTFnmIw+ivCLYfNSmWNk95h2
         ETI6FnSoameHocUhf65fa6p63jjotDsYsrmqEqqsGYH3oqhuNlS70cKmNXhW/CZG8o9g
         +gNZBPoSTAynqgzhjeaaLWpyjTcw1guPwRTmN2H1FRc1ocWxbQQlz9uKEpPpkpFoPMZD
         RhYZOfCRs/okxBIl4Ju8i1Ao/vSkYHwBSvthMp8IdCsJ2y3c4j6Kox3zPZAwCkRgB8V8
         0VuRA8FrOTPodB70d02j7XcXC9dAt2iOksBZtN6u3TOQL1vu5khcm6qDoD4J+Mdj9OCe
         KWfA==
X-Forwarded-Encrypted: i=1; AJvYcCUebr7wAQz4QHtaTj6a5B1Tlk9w9+VjA683p2mO543ixN2Lha07m7SaidQO3/Q9crspgEc3OUo5xCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxo1BFiH6R1b8eUB/Uk3W1Kq75MZKLriqmEwIG4dGRbF2hpha3C
	ky5t/ANtT9BCiJr/3HGlYbnpj7w66iEGIPNw+fk9oM+iDK+GFT28JPJSepjfCE4=
X-Gm-Gg: ASbGnct2gFclrg2ZbxUoIK9r0nHNzAooAlpSVAOxxikw0YY3WzpdxsbeIsivzlAUfVF
	ISdqd0C+lzbPIRGkhSsu1B8jAqrxlEj801L/fCZHeG5cT1DueWlavXHiIz44i/tkzrhGSrMbn+U
	6pHTIOfVcZNPxQGH2XSaZwScpyZiKkgbzMFcoPOpa+uOgfJ2mM+yarTSn5uZDjT7hu75W0KXy+V
	xucgjYaN4DM01va7P2HxJEr9+4H/LNJEBTKi6M2ZYGSDHvgFmVc8zpB6emCfFb9+TsWSnea26SM
	RQJZxDJNP/0AUyPbwF0pB3r5G/fwwgdTtS/YhP+o9WQDB9Ts6IGVs1ZXTOGWQsuoXgmzziUSLQv
	eDtY=
X-Google-Smtp-Source: AGHT+IHYDolQP0P7oVtgxbOhEE3I6v6SDbNrjfVMS4Z/L15JeyZSnUFyKjkJLzFgkBv0tW8sB7odOA==
X-Received: by 2002:a17:906:f59f:b0:aa6:40a4:b13 with SMTP id a640c23a62f3a-aab77ec4a49mr1432004366b.59.1734355822025;
        Mon, 16 Dec 2024 05:30:22 -0800 (PST)
Message-ID: <0008f33a-74d8-48d7-bd3d-23318eda2fa5@suse.com>
Date: Mon, 16 Dec 2024 14:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] xen: add bitmap to indicate per-domain state
 changes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-5-jgross@suse.com>
 <50258f9a-89e6-4a62-8ed5-63a3bfa668c8@suse.com>
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
In-Reply-To: <50258f9a-89e6-4a62-8ed5-63a3bfa668c8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yRXwyV3ZG0mpYB0ioo7L0UWO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yRXwyV3ZG0mpYB0ioo7L0UWO
Content-Type: multipart/mixed; boundary="------------RVcEsyhOeNHohCRT2m1jquI5";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <0008f33a-74d8-48d7-bd3d-23318eda2fa5@suse.com>
Subject: Re: [PATCH v3 4/7] xen: add bitmap to indicate per-domain state
 changes
References: <20241213162421.16782-1-jgross@suse.com>
 <20241213162421.16782-5-jgross@suse.com>
 <50258f9a-89e6-4a62-8ed5-63a3bfa668c8@suse.com>
In-Reply-To: <50258f9a-89e6-4a62-8ed5-63a3bfa668c8@suse.com>
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

--------------RVcEsyhOeNHohCRT2m1jquI5
Content-Type: multipart/mixed; boundary="------------qCXI1sXhPO0ix8VBjgc14Jod"

--------------qCXI1sXhPO0ix8VBjgc14Jod
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMTIuMjQgMTE6MjEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4xMi4yMDI0
IDE3OjI0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQEAgLTEzOCw2ICsxMzksNjAgQEAg
Ym9vbCBfX3JlYWRfbW9zdGx5IHZtdHJhY2VfYXZhaWxhYmxlOw0KPj4gICANCj4+ICAgYm9v
bCBfX3JlYWRfbW9zdGx5IHZwbXVfaXNfYXZhaWxhYmxlOw0KPj4gICANCj4+ICtzdGF0aWMg
REVGSU5FX1NQSU5MT0NLKGRvbV9zdGF0ZV9jaGFuZ2VkX2xvY2spOw0KPj4gK3N0YXRpYyB1
bnNpZ25lZCBsb25nICpkb21fc3RhdGVfY2hhbmdlZDsNCj4gDQo+IF9fcmVhZF9tb3N0bHk/
DQoNClllcy4NCg0KPiANCj4+ICtpbnQgZG9tYWluX2luaXRfc3RhdGVzKHZvaWQpDQo+PiAr
ew0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpkOw0KPj4gKyAgICBpbnQgcmMgPSAt
RU5PTUVNOw0KPj4gKw0KPj4gKyAgICBzcGluX2xvY2soJmRvbV9zdGF0ZV9jaGFuZ2VkX2xv
Y2spOw0KPj4gKw0KPj4gKyAgICBpZiAoIGRvbV9zdGF0ZV9jaGFuZ2VkICkNCj4+ICsgICAg
ICAgIGJpdG1hcF96ZXJvKGRvbV9zdGF0ZV9jaGFuZ2VkLCBET01JRF9GSVJTVF9SRVNFUlZF
RCk7DQo+PiArICAgIGVsc2UNCj4+ICsgICAgew0KPj4gKyAgICAgICAgZG9tX3N0YXRlX2No
YW5nZWQgPSB4dnphbGxvY19hcnJheSh1bnNpZ25lZCBsb25nLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVRTX1RPX0xPTkdTKERPTUlEX0ZJ
UlNUX1JFU0VSVkVEKSk7DQo+PiArICAgICAgICBpZiAoICFkb21fc3RhdGVfY2hhbmdlZCAp
DQo+PiArICAgICAgICAgICAgZ290byB1bmxvY2s7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsg
ICAgcmN1X3JlYWRfbG9jaygmZG9tbGlzdF9yZWFkX2xvY2spOw0KPj4gKw0KPj4gKyAgICBm
b3JfZWFjaF9kb21haW4gKCBkICkNCj4+ICsgICAgICAgIHNldF9iaXQoZC0+ZG9tYWluX2lk
LCBkb21fc3RhdGVfY2hhbmdlZCk7DQo+IA0KPiBVc2UgdGhlIGNoZWFwZXIgX19zZXRfYml0
KCkgaGVyZT8NCg0KT2theS4NCg0KPiANCj4+ICtzdGF0aWMgdm9pZCBkb21haW5fY2hhbmdl
ZF9zdGF0ZShjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gK3sNCj4+ICsgICAgc3Bpbl9s
b2NrKCZkb21fc3RhdGVfY2hhbmdlZF9sb2NrKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBkb21f
c3RhdGVfY2hhbmdlZCApDQo+PiArICAgICAgICBzZXRfYml0KGQtPmRvbWFpbl9pZCwgZG9t
X3N0YXRlX2NoYW5nZWQpOw0KPiANCj4gQW5kIHBlcmhhcHMgZXZlbiBoZXJlLCBjb25zaWRl
cmluZyBldmVyeXRoaW5nJ3MgdW5kZXIgbG9jayBub3c/DQoNClRydWUuDQoNCj4gDQo+PiAt
LS0gYS94ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9l
dmVudF9jaGFubmVsLmMNCj4+IEBAIC00ODUsNiArNDg1LDEzIEBAIGludCBldnRjaG5fYmlu
ZF92aXJxKGV2dGNobl9iaW5kX3ZpcnFfdCAqYmluZCwgZXZ0Y2huX3BvcnRfdCBwb3J0KQ0K
Pj4gICAgICAgaWYgKCAodiA9IGRvbWFpbl92Y3B1KGQsIHZjcHUpKSA9PSBOVUxMICkNCj4+
ICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsNCj4+ICAgDQo+PiArICAgIGlmICggdmlycSA9
PSBWSVJRX0RPTV9FWEMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICByYyA9IGRvbWFpbl9p
bml0X3N0YXRlcygpOw0KPj4gKyAgICAgICAgaWYgKCByYyApDQo+PiArICAgICAgICAgICAg
Z290byBkZWluaXQ7DQo+PiArICAgIH0NCj4gDQo+IFRoaXMgaXMgdGllZCB0byBWSVJRX0RP
TV9FWEMuIEhvdyBjb21lIC4uLg0KPiANCj4+IEBAIC01MjcsNiArNTM0LDEwIEBAIGludCBl
dnRjaG5fYmluZF92aXJxKGV2dGNobl9iaW5kX3ZpcnFfdCAqYmluZCwgZXZ0Y2huX3BvcnRf
dCBwb3J0KQ0KPj4gICAgb3V0Og0KPj4gICAgICAgd3JpdGVfdW5sb2NrKCZkLT5ldmVudF9s
b2NrKTsNCj4+ICAgDQo+PiArIGRlaW5pdDoNCj4+ICsgICAgaWYgKCByYyApDQo+PiArICAg
ICAgICBkb21haW5fZGVpbml0X3N0YXRlcygpOw0KPj4gKw0KPj4gICAgICAgcmV0dXJuIHJj
Ow0KPj4gICB9DQo+IA0KPiAuLi4gZGUtaW5pdCBoYXBwZW5zIHVwb24gYW55IGVycm9yLCBy
ZWdhcmRsZXNzIG9mIHZJUlE/IEV2ZW4gY2hlY2tpbmcNCj4gdGhlIHZpcnEgaXNuJ3Qgc3Vm
ZmljaWVudCwgYXMgd2UgYWxzbyBuZWVkIHRvIGdyYWNlZnVsbHkgZGVhbCB3aXRoIHRoZQ0K
PiAtRUVYSVNUIHBhdGguDQoNCkdvb2QgY2F0Y2guIFdpbGwgY2hhbmdlIHRoYXQuDQoNCg0K
SnVlcmdlbg0K
--------------qCXI1sXhPO0ix8VBjgc14Jod
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------qCXI1sXhPO0ix8VBjgc14Jod--

--------------RVcEsyhOeNHohCRT2m1jquI5--

--------------yRXwyV3ZG0mpYB0ioo7L0UWO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmdgK20FAwAAAAAACgkQsN6d1ii/Ey/B
yAf/SrP/ntF+i+q1RzMF83F+WMkU1bqThjYeGmsO9RzDU5qFwxMj5iZ2jEnmwfnLF9lfRYp1v+iE
c2XHt96h2YCL2Q/83PhA6nrtLfyJPqJz/WW4RJ/96bcPlO/IQ550wyuGcg8nS01QsF6wj2WBwdEI
mEqrENXCdluDQht5t8ZLKnYx/I4CWdUp4XuTN6S1m51zfpHUm+kxhxG/1VzHlMfm+dohGvIc2sKz
YzgIaamN2XH8f6Z+fTcfhA/wsP2VHrlAFJs88bSKWjBNtj+y5MyeITLQCi2jxJEOwx7EtCVA2rUX
D0lcPI+k35nMxPV+8RWuveapVzbCo0EWwqBGKQ0ykw==
=+nqX
-----END PGP SIGNATURE-----

--------------yRXwyV3ZG0mpYB0ioo7L0UWO--

