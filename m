Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21349B8BB3
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 08:03:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828961.1244069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6lh2-00058T-Ib; Fri, 01 Nov 2024 07:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828961.1244069; Fri, 01 Nov 2024 07:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6lh2-00056U-FX; Fri, 01 Nov 2024 07:03:36 +0000
Received: by outflank-mailman (input) for mailman id 828961;
 Fri, 01 Nov 2024 07:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t6lh1-00056O-0g
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 07:03:35 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675198a2-981f-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 08:03:31 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso25584381fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 00:03:31 -0700 (PDT)
Received: from ?IPV6:2003:e5:8706:5100:ddd3:fe18:d0ae:c30d?
 (p200300e587065100ddd3fe18d0aec30d.dip0.t-ipconnect.de.
 [2003:e5:8706:5100:ddd3:fe18:d0ae:c30d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56678a5csm149227966b.192.2024.11.01.00.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 00:03:30 -0700 (PDT)
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
X-Inumbo-ID: 675198a2-981f-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzMiLCJoZWxvIjoibWFpbC1sajEteDIzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY3NTE5OGEyLTk4MWYtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDQ0NjExLjc0MTA2OSwic2VuZGVyIjoiamdyb3NzQHN1c2UuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730444611; x=1731049411; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eJOpMsJi/pv/R0Eg16XHgJwYO5UCTL9vrpwD2MJN8w0=;
        b=ZYThDAcMEk9+Jw3ftn5W+jNzv+eCMu7jGOkq79Q2U37NKH4Ji4Uaoa0/jf+2kyQHlc
         AIk7FTDx7mVDQ9zNUGxPDKKtFLGjMSphfC0EQ5f39Ten8p/t/h7u8x9ed7KYFgBrja5f
         jTUpkX6EtCcBIxeP6H5jK0wje9s8FlGjXbcVI25/fgR5cHZc2BDeCkBCZoHZyJJawvTz
         nhUN1z6ToBF5fZDqR3lL7bUI1kv4zb9Et771B2hEibgaExlKpl7R1Lde2JSENld3DxjH
         M4/kxWnTIIjAMk/1vcqklASgN+AdBWs97gYnBQ0DeOYHVcB9hoZlQEGQtBfrZwWuxZa9
         fkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730444611; x=1731049411;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJOpMsJi/pv/R0Eg16XHgJwYO5UCTL9vrpwD2MJN8w0=;
        b=NIgcMXjZZbj7uGv9PogRERwqzntyN9cvnk/3Efk7ho3+oIJZJOZQwdJf7O6mJi6Rf8
         N03/KftGm1ZDLzWCUsPhwAax02AObFUYfD8k69MWSkGEM3tXTP2piUuFalNFyTXddg31
         I9l0yP0no6rNTRXueP2HQp9owasGgUH9WIK+cBp2wojFPf1WYraOYMX3haDDnM7ns8KJ
         cPBqkbANO1AXpojVUzCUAbszRy9See4EGxVJAHGVEZt6+u4JYg2LDqxcVbZ/ge9EXvLb
         b609gxZwZgAmGekpSPWrghQT7atVgyYW+pWVN8wGwBpa2wdEa6/dre6ewjHSVetvNbiV
         bFjA==
X-Forwarded-Encrypted: i=1; AJvYcCUc5zJkII3vtitP8yppiupdaiiDC8UUwVawow+6A1BsInVlA3KXJ/turbjS84vpXd8x70x8whdJHnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1kG9U3Q5DEr8QVSMSvdVWN3Vtg69tTg7RSYod7qE7N8aYygUv
	Nb/HUPyv9w4Zt8NXQuRTsv0OPFM+41vEcK8MulmrKcIO3ty2YS/jCF21e0P3oUs=
X-Google-Smtp-Source: AGHT+IFEgZYWMwrVeBi2ekK1ksXOMY4DQuofmPpD0wrv9E4vKn8t8pDyCXUqe67QSUOWiY4+TF1TPw==
X-Received: by 2002:a05:651c:890:b0:2fb:510c:7237 with SMTP id 38308e7fff4ca-2fedb83015emr22343671fa.41.1730444610938;
        Fri, 01 Nov 2024 00:03:30 -0700 (PDT)
Message-ID: <19052bbf-1b7e-4282-8018-7f7df41c9c40@suse.com>
Date: Fri, 1 Nov 2024 08:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <f4791b83-67ce-4530-8ea3-581ee8c90631@suse.com>
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
In-Reply-To: <f4791b83-67ce-4530-8ea3-581ee8c90631@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7hv03FoBgGnFUMqGr25GVXDU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7hv03FoBgGnFUMqGr25GVXDU
Content-Type: multipart/mixed; boundary="------------wXdk0cizoWk0Tw2uuwabRIwo";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <19052bbf-1b7e-4282-8018-7f7df41c9c40@suse.com>
Subject: Re: [PATCH 3/6] xen: add new domctl get_changed_domain
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-4-jgross@suse.com>
 <f4791b83-67ce-4530-8ea3-581ee8c90631@suse.com>
In-Reply-To: <f4791b83-67ce-4530-8ea3-581ee8c90631@suse.com>
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

--------------wXdk0cizoWk0Tw2uuwabRIwo
Content-Type: multipart/mixed; boundary="------------ja2pjXv10rLUR9BXuzipJwFH"

--------------ja2pjXv10rLUR9BXuzipJwFH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzEuMTAuMjQgMTI6MTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMy4xMC4yMDI0
IDE1OjEwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2NvbW1vbi9kb21h
aW4uYw0KPj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0KPj4gQEAgLTE1NCw2ICsxNTQs
NTcgQEAgdm9pZCBkb21haW5fcmVzZXRfc3RhdGVzKHZvaWQpDQo+PiAgICAgICByY3VfcmVh
ZF91bmxvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0
aWMgdm9pZCBzZXRfZG9tYWluX3N0YXRlX2luZm8oc3RydWN0IHhlbl9kb21jdGxfZ2V0X2Rv
bWFpbl9zdGF0ZSAqaW5mbywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIGluZm8tPnN0YXRl
ID0gWEVOX0RPTUNUTF9HRVRET01TVEFURV9TVEFURV9FWElTVDsNCj4+ICsgICAgaWYgKCBk
LT5pc19zaHV0X2Rvd24gKQ0KPj4gKyAgICAgICAgaW5mby0+c3RhdGUgfD0gWEVOX0RPTUNU
TF9HRVRET01TVEFURV9TVEFURV9TSFVURE9XTjsNCj4+ICsgICAgaWYgKCBkLT5pc19keWlu
ZyA9PSBET01EWUlOR19kZWFkICkNCj4+ICsgICAgICAgIGluZm8tPnN0YXRlIHw9IFhFTl9E
T01DVExfR0VURE9NU1RBVEVfU1RBVEVfRFlJTkc7DQo+PiArICAgIGluZm8tPnVuaXF1ZV9p
ZCA9IGQtPnVuaXF1ZV9pZDsNCj4+ICt9DQo+PiArDQo+PiAraW50IGdldF9kb21haW5fc3Rh
dGUoc3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZSAqaW5mbywgc3RydWN0IGRv
bWFpbiAqZCkNCj4+ICt7DQo+PiArICAgIHVuc2lnbmVkIGludCBkb207DQo+PiArDQo+PiAr
ICAgIG1lbXNldChpbmZvLCAwLCBzaXplb2YoKmluZm8pKTsNCj4gDQo+IFdvdWxkIHRoaXMg
YmV0dGVyIGdvIGludG8gc2V0X2RvbWFpbl9zdGF0ZV9pbmZvKCk/IEFoLCBubywgeW91IC4u
Lg0KPiANCj4+ICsgICAgaWYgKCBkICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgc2V0X2Rv
bWFpbl9zdGF0ZV9pbmZvKGluZm8sIGQpOw0KPj4gKw0KPj4gKyAgICAgICAgcmV0dXJuIDA7
DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgd2hpbGUgKCAoZG9tID0gZmluZF9maXJzdF9i
aXQoZG9tX3N0YXRlX2NoYW5nZWQsIERPTUlEX01BU0sgKyAxKSkgPA0KPj4gKyAgICAgICAg
ICAgIERPTUlEX0ZJUlNUX1JFU0VSVkVEICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgZCA9
IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb20pOw0KPiANCj4gLi4uIGFjcXVpcmluZyB0aGUg
bG9jayBlYXJseSBhbmQgdGhlbiAuLi4NCj4gDQo+PiArICAgICAgICBpZiAoIHRlc3RfYW5k
X2NsZWFyX2JpdChkb20sIGRvbV9zdGF0ZV9jaGFuZ2VkKSApDQo+PiArICAgICAgICB7DQo+
PiArICAgICAgICAgICAgaW5mby0+ZG9taWQgPSBkb207DQo+PiArICAgICAgICAgICAgaWYg
KCBkICkNCj4+ICsgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgIHNldF9kb21h
aW5fc3RhdGVfaW5mbyhpbmZvLCBkKTsNCj4gDQo+IC4uLiBwb3RlbnRpYWxseSBieXBhc3Np
bmcgdGhlIGNhbGwgKHdpdGgganVzdCB0aGUgZG9taWQgc2V0KSByZXF1aXJlcyBpdA0KPiB0
aGF0IHdheS4NCj4gDQo+IEFzIHRvIHRoZSBwb2ludCBpbiB0aW1lIHdoZW4gdGhlIGxvY2sg
aXMgYWNxdWlyZWQ6IFdoeSBpcyB0aGF0LCBzZWVpbmcgdGhhdA0KPiBpdCBjb21wbGljYXRl
cyB0aGUgdW5sb2NraW5nIGEgbGl0dGxlLCBieSByZXF1aXJpbmcgYSAybmQgdW5sb2NrIGEg
ZmV3DQo+IGxpbmVzIGRvd24/DQoNCkkgYWdyZWUgdGhpcyBjYW4gYmUgc2ltcGxpZmllZC4N
Cg0KPiANCj4+ICsgICAgICAgICAgICAgICAgcmN1X3VubG9ja19kb21haW4oZCk7DQo+PiAr
ICAgICAgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgICAgIHJldHVybiAwOw0KPj4gKyAg
ICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBkICkNCj4+ICsgICAgICAgIHsNCj4+
ICsgICAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCj4+ICsgICAgICAgIH0NCj4g
DQo+IE5pdDogTm8gbmVlZCBmb3IgdGhlIGJyYWNlcy4NCj4gDQo+PiAtLS0gYS94ZW4vY29t
bW9uL2V2ZW50X2NoYW5uZWwuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9ldmVudF9jaGFubmVs
LmMNCj4+IEBAIC05NjksMTEgKzk2OSwxOCBAQCBzdGF0aWMgc3RydWN0IGRvbWFpbiAqZ2xv
YmFsX3ZpcnFfaGFuZGxlcnNbTlJfVklSUVNdIF9fcmVhZF9tb3N0bHk7DQo+PiAgIA0KPj4g
ICBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGdsb2JhbF92aXJxX2hhbmRsZXJzX2xvY2spOw0K
Pj4gICANCj4+ICtzdHJ1Y3QgZG9tYWluICpnZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcih1aW50
MzJfdCB2aXJxKQ0KPj4gK3sNCj4+ICsgICAgQVNTRVJUKHZpcnFfaXNfZ2xvYmFsKHZpcnEp
KTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIGdsb2JhbF92aXJxX2hhbmRsZXJzW3ZpcnFdID86
IGhhcmR3YXJlX2RvbWFpbjsNCj4+ICt9DQo+PiArDQo+PiAgIHZvaWQgc2VuZF9nbG9iYWxf
dmlycSh1aW50MzJfdCB2aXJxKQ0KPj4gICB7DQo+PiAgICAgICBBU1NFUlQodmlycV9pc19n
bG9iYWwodmlycSkpOw0KPj4gICANCj4+IC0gICAgc2VuZF9ndWVzdF9nbG9iYWxfdmlycShn
bG9iYWxfdmlycV9oYW5kbGVyc1t2aXJxXSA/OiBoYXJkd2FyZV9kb21haW4sIHZpcnEpOw0K
Pj4gKyAgICBzZW5kX2d1ZXN0X2dsb2JhbF92aXJxKGdldF9nbG9iYWxfdmlycV9oYW5kbGVy
KHZpcnEpLCB2aXJxKTsNCj4+ICAgfQ0KPiANCj4gSXMgdGhpcyBhIHN0YWxlIGxlZnRvdmVy
IGZyb20gYW4gZWFybGllciB2ZXJzaW9uPyBUaGVyZSdzIG5vIG90aGVyIGNhbGxlciBvZg0K
PiBnZXRfZ2xvYmFsX3ZpcnFfaGFuZGxlcigpIGhlcmUsIGhlbmNlIHRoZSBjaGFuZ2UgbG9v
a3MgdW5tb3RpdmF0ZWQgaGVyZS4NCg0KSSB0aGluayBpdCBpcyBpbmRlZWQgc3RhbGUgbm93
Lg0KDQo+IA0KPj4gQEAgLTEyMzYsNyArMTIzNywzNyBAQCBzdHJ1Y3QgeGVuX2RvbWN0bF9k
dF9vdmVybGF5IHsNCj4+ICAgfTsNCj4+ICAgI2VuZGlmDQo+PiAgIA0KPj4gKy8qDQo+PiAr
ICogWEVOX0RPTUNUTF9nZXRfZG9tYWluX3N0YXRlIChzdGFibGUgaW50ZXJmYWNlKQ0KPj4g
KyAqDQo+PiArICogR2V0IHN0YXRlIGluZm9ybWF0aW9uIG9mIGEgZG9tYWluLg0KPj4gKyAq
DQo+PiArICogSW4gY2FzZSBkb21haW4gaXMgRE9NSURfSU5WQUxJRCwgcmV0dXJuIGluZm9y
bWF0aW9uIGFib3V0IGEgZG9tYWluIGhhdmluZw0KPj4gKyAqIGNoYW5nZWQgc3RhdGUgYW5k
IHJlc2V0IHRoZSBzdGF0ZSBjaGFuZ2UgaW5kaWNhdG9yIGZvciB0aGF0IGRvbWFpbi4gVGhp
cw0KPj4gKyAqIGZ1bmN0aW9uIGlzIHVzYWJsZSBvbmx5IGJ5IGEgZG9tYWluIGhhdmluZyBy
ZWdpc3RlcmVkIHRoZSBWSVJRX0RPTV9FWEMNCj4+ICsgKiBldmVudCAobm9ybWFsbHkgWGVu
c3RvcmUpLg0KPj4gKyAqDQo+PiArICogU3VwcG9ydGVkIGludGVyZmFjZSB2ZXJzaW9uczog
MHgwMDAwMDAwMA0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9HRVRET01TVEFU
RV9WRVJTX01BWCAgICAwDQo+PiArc3RydWN0IHhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0
ZSB7DQo+PiArICAgIGRvbWlkX3QgZG9taWQ7DQo+IA0KPiBEZXNwaXRlIHRoZSBET01JRF9J
TlZBTElEIHNwZWNpYWwgY2FzZSB0aGUgcmVkdW5kYW50IGRvbWlkIGhlcmUgaXMgb2RkLg0K
PiBZb3UgYWN0dWFsbHkgYWRkIHRoZSBuZXcgc3ViLW9wIHRvIHRoZSBzcGVjaWFsIGNhc2lu
ZyBvZiBvcC0+ZG9tYWluIGF0IHRoZQ0KPiB0b3Agb2YgZG9fZG9tY3RsKCksIHNvIHRoZSBz
b2xlIGRpZmZlcmVuY2UgdG8gbW9zdCBvdGhlciBzdWItb3BzIHdvdWxkIGJlDQo+IHRoYXQg
dGhpcyB0aGVuIGlzIGFuIElOL09VVCAocmF0aGVyIHRoYW4gdGhlIGZpZWxkIGhlcmUgYmVp
bmcgYW4gb3V0cHV0DQo+IG9ubHkgd2hlbiBET01JRF9JTlZBTElEIHdhcyBwYXNzZWQgaW4g
dmlhIHRoZSBjb21tb24gZG9taWQgZmllbGQpLg0KDQpUaGUgbWFpbiBpZGVhIHdhcyB0byBo
YXZlIGFsbCBkYXRhIHJldHVybmVkIGJ5IGdldF9kb21haW5fc3RhdGUoKSBpbiBzdHJ1Y3QN
Cnhlbl9kb21jdGxfZ2V0X2RvbWFpbl9zdGF0ZS4gSSdtIGZpbmUgZWl0aGVyIHdheS4NCg0K
QnV0IEkgdGhpbmsgdGhpcyBkaXNjdXNzaW9uIGlzIG1vb3Qgbm93LCBhcyBpdCBzZWVtcyB3
ZSBhcmUgc3dpdGNoaW5nIHRvIGENCm5ldyBoeXBlcmNhbGwgYW55d2F5LCB3aGVyZSB3ZSBw
cm9iYWJseSB3aWxsIGhhdmUgYWxsIGRhdGEgaW4gcGVyIHN1Yi1vcA0Kc3RydWN0cy4NCg0K
PiANCj4+ICsgICAgdWludDE2X3Qgc3RhdGU7DQo+PiArI2RlZmluZSBYRU5fRE9NQ1RMX0dF
VERPTVNUQVRFX1NUQVRFX0VYSVNUICAgICAweDAwMDEgIC8qIERvbWFpbiBpcyBleGlzdGlu
Zy4gKi8NCj4+ICsjZGVmaW5lIFhFTl9ET01DVExfR0VURE9NU1RBVEVfU1RBVEVfU0hVVERP
V04gIDB4MDAwMiAgLyogU2h1dGRvd24gZmluaXNoZWQuICovDQo+PiArI2RlZmluZSBYRU5f
RE9NQ1RMX0dFVERPTVNUQVRFX1NUQVRFX0RZSU5HICAgICAweDAwMDQgIC8qIERvbWFpbiBk
eWluZy4gKi8NCj4+ICsgICAgdWludDMyX3QgcGFkMTsgICAgICAgICAgIC8qIFJldHVybmVk
IGFzIDAuICovDQo+PiArICAgIHVpbnQ2NF90IHVuaXF1ZV9pZDsgICAgICAvKiBVbmlxdWUg
ZG9tYWluIGlkZW50aWZpZXIuICovDQo+PiArICAgIHVpbnQ2NF90IHBhZDJbNl07ICAgICAg
ICAvKiBSZXR1cm5lZCBhcyAwLiAqLw0KPj4gK307DQo+IA0KPiBXaGF0IGFyZSB0aGUgaW50
ZW50aW9ucyB3aXRoIHRoaXMgcGFkZGluZyBhcnJheT8NCg0KVGhlIGlkZWEgd2FzIHRvIGFs
bG93IHRvIHJldHVybiBhZGRpdGlvbmFsIGRvbWFpbiBkYXRhIGluIGZ1dHVyZSB3aXRob3V0
IGhhdmluZw0KdG8gZXh0ZW5kIHRoZSBzdHJ1Y3QuDQoNCg0KSnVlcmdlbg0K
--------------ja2pjXv10rLUR9BXuzipJwFH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ja2pjXv10rLUR9BXuzipJwFH--

--------------wXdk0cizoWk0Tw2uuwabRIwo--

--------------7hv03FoBgGnFUMqGr25GVXDU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmckfUIFAwAAAAAACgkQsN6d1ii/Ey9/
Bwf+PMKu7xR6SnECzeL+mnHbvAWO7PLAJEcwnqnhzFZJeWqXa50bSYZmjVSjhJmR2lvJI7xH2gdr
/w2wzau2UmsvFHySfjAl8gzo3a7rDhMGa29GF7OJxpz27G3pOgbZW+hkR4RMmQB8DgJ4iOayoRd0
Ma5rpJBW3/N8dRnDkdInZmi5dT1h7uNtN2wpIKey6SDAV48vnUCFlOziu+E1oW670YiiJsIsWZyW
OfUWht9R5BZAIjBUHz6s5lEwIyg2nVP9oKH/6biZ1gFUnU4p7DWNaMXU0exnX/ebyyZdzUQ3W2OC
pxEJu1RN8Jgacr8EiLoUwIhbLmdswYRGQXYtPdzLxg==
=CF52
-----END PGP SIGNATURE-----

--------------7hv03FoBgGnFUMqGr25GVXDU--

