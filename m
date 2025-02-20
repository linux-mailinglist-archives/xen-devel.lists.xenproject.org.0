Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA00A3D4CA
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893716.1302579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2tg-0001vp-VE; Thu, 20 Feb 2025 09:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893716.1302579; Thu, 20 Feb 2025 09:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2tg-0001tE-SZ; Thu, 20 Feb 2025 09:31:08 +0000
Received: by outflank-mailman (input) for mailman id 893716;
 Thu, 20 Feb 2025 09:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tl2tf-0001t8-Ju
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:31:07 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67c76d41-ef6d-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 10:31:04 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38f5fc33602so378743f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 01:31:04 -0800 (PST)
Received: from ?IPV6:2003:e5:8714:500:2aea:6ec9:1d88:c1ef?
 (p200300e5871405002aea6ec91d88c1ef.dip0.t-ipconnect.de.
 [2003:e5:8714:500:2aea:6ec9:1d88:c1ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f561bee3esm5475183f8f.21.2025.02.20.01.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 01:31:03 -0800 (PST)
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
X-Inumbo-ID: 67c76d41-ef6d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740043864; x=1740648664; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VQ/ALFaUGsiEPcBiB66l7a73T8RnpBsIO148PHgRdvs=;
        b=cM9E4GOn28eD8JAN07OKJk12HrCVXJbr0Du/3e6bTNlBaxfLPeFxDCFjyqN4cxV2qz
         dlhfLMoeiQQOb1h6ERF8QYTg6OnOdkH2q+Voh4D/iEvIrh3knnTsG8MoRQW/tpsnLh2D
         7Tp9qKMcyBimeckjRheVQTyoT491Uv7R8gdtLgSRKTKbNaRP5tltzauiEdrRzEJcCcuZ
         Fqykg2bWmoT26h9EHF9X71kxxdd+pq3Bwv3w3Rn8EiQrCV7KIeoB1utMMnvE7DUCndb9
         qLKHWfZSXO+4690otsrfkA0yyahm7Fg6KtzBwU+OKKCknniQ/lFU9fgDqB9bduH8NrYq
         raCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043864; x=1740648664;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQ/ALFaUGsiEPcBiB66l7a73T8RnpBsIO148PHgRdvs=;
        b=edGY58D0waY/Q4xDIUOhyl1NDujJrQJQcUJE9xf2x0khdqqELvgLFE5Qb7cD4v5EXN
         qUsAiG6c4f77Yx0xgUUZwFN+0cQ9PR1dgM8ggo/xkrL6owiGWVDkb5PgP9ErEThzqhny
         fTDQ9xNKPgkdOdEaEjFjbwx+tFCvlBvH6VSpojIMQs9mX5h9262Lt/p5t2T+SnfsrXFS
         R9og2yzpPPvYj0Wf9O6dIyRWMi8PGgIaIqUH2qRV5B0JW3EcIFHk+6zj0Xku3213VyWv
         0OKlJamoPBDfDG2ih0AWNjawPWZjfdY7spFsCHNLg/fmw0OfpAPWmmf5EV4R1LGkSW7k
         +wYA==
X-Gm-Message-State: AOJu0YxGBWObkzR7fEbN91tSVF/BhtkYKX50c1YI1khpd9b0FfSCQiaQ
	06t6KfOy9jquba2Zs+QUbQ7foE7BOXhnW/0fEv4n0CuRrVVnAsEURKnf/xh3PBU=
X-Gm-Gg: ASbGncs6fy3KgQ+w74mkch769IDvkxeM1X0wgjmqhz9DGxRm31RKl0NA0FQRORX9UiC
	xlLaZ7Z7tHK6kz4WRJmk9iJnlhjd8efXUoN0ecgEtHF0cHZZTXSHAiNIo4YE1UbuWPD/Own+DyH
	Th3bwUYKGG1w8er6wa2EPCGuEA80wo98QfT2uyEjKyWiUt5FR8WsEDUGHj9DgsqIqOql3cwvBmY
	84nK73GwSbiq6qR1lvJ7Qaw6RrQ94Nq/thC3vxWEWLafDUhbIFeF3jGat+hsmrP7+GnVm41c2H1
	jRF6TtqBVwM+nnBK3nza0rruRsHTI2XuHd60bJjYCBeoULtAGFCDc3mqMvZSy0FIC9xsJM+JNd6
	GSAubWafqUHNxEkyN6t8bNxf0drwJRb9W1oMNNA==
X-Google-Smtp-Source: AGHT+IHwdS3MhicFemhlxRQN/7w9QRq+24gM4Yolc9lln0damLtXK9mRUZtYHtmVlmP5Mql6ouZ65g==
X-Received: by 2002:a5d:6c63:0:b0:38f:64da:99fe with SMTP id ffacd0b85a97d-38f64da9d3dmr1217471f8f.29.1740043863778;
        Thu, 20 Feb 2025 01:31:03 -0800 (PST)
Message-ID: <23b12ff3-717f-4321-b3be-9c39367b8d14@suse.com>
Date: Thu, 20 Feb 2025 10:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Pawe=C5=82_Srokosz?= <pawel.srokosz@cert.pl>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
 <Z7RWdPpUde9ZoaZu@macbook.local>
 <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
 <Z7bzAeb4UQTQUOsk@macbook.local>
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
In-Reply-To: <Z7bzAeb4UQTQUOsk@macbook.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NKz8LUeziTkm2OsVi0ywJEf0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NKz8LUeziTkm2OsVi0ywJEf0
Content-Type: multipart/mixed; boundary="------------hrTawuapCD0YcgN83pb5DJ2S";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Pawe=C5=82_Srokosz?= <pawel.srokosz@cert.pl>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 andrew cooper3 <andrew.cooper3@citrix.com>, JBeulich@suse.com
Message-ID: <23b12ff3-717f-4321-b3be-9c39367b8d14@suse.com>
Subject: Re: Memory corruption bug with Xen PV Dom0 and BOSS-S1 RAID card
References: <1050214476.1105853.1739823581696.JavaMail.zimbra@cert.pl>
 <Z7RWdPpUde9ZoaZu@macbook.local>
 <1001969494.1457790.1739990267113.JavaMail.zimbra@cert.pl>
 <Z7bzAeb4UQTQUOsk@macbook.local>
In-Reply-To: <Z7bzAeb4UQTQUOsk@macbook.local>
Autocrypt-Gossip: addr=JBeulich@suse.com; keydata=
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

--------------hrTawuapCD0YcgN83pb5DJ2S
Content-Type: multipart/mixed; boundary="------------u5nTJ0Jt00MjlbmowM3feHkz"

--------------u5nTJ0Jt00MjlbmowM3feHkz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjUgMTA6MTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdlZCwg
RmViIDE5LCAyMDI1IGF0IDA3OjM3OjQ3UE0gKzAxMDAsIFBhd2XFgiBTcm9rb3N6IHdyb3Rl
Og0KPj4gSGVsbG8sDQo+Pg0KPj4+IFNvIHRoZSBpc3N1ZSBkb2Vzbid0IGhhcHBlbiBvbiBk
ZWJ1Zz15IGJ1aWxkcz8gVGhhdCdzIHVuZXhwZWN0ZWQuICBJIHdvdWxkDQo+Pj4gZXhwZWN0
IHRoZSBvcHBvc2l0ZSwgdGhhdCBzb21lIGNvZGUgaW4gTGludXggYXNzdW1lcyB0aGF0IHBm
biArIDEgPT0gbWZuICsNCj4+PiAxLCBhbmQgaGVuY2UgYnJlYWtzIHdoZW4gdGhlIHJlbGF0
aW9uIGlzIHJldmVyc2VkLg0KPj4NCj4+IEl0IHdhcyBhbHNvIHN1cnByaXNpbmcgZm9yIG1l
IGJ1dCBJIHRoaW5rIHRoZSBrZXkgdGhpbmcgaXMgdGhhdCBkZWJ1Zz15DQo+PiBjYXVzZXMg
d2hvbGUgbWFwcGluZyB0byBiZSByZXZlcnNlZCBzbyBlYWNoIFBGTiBsYW5kcyBvbiBjb21w
bGV0ZWx5IGRpZmZlcmVudA0KPj4gTUZOIGUuZy4gTUZOPTB4MTMwMDAwMCBpcyBtYXBwZWQg
dG8gUEZOPTB4MjBlNTBjIGluIG5kZWJ1ZywgYnV0IGluIGRlYnVnDQo+PiBpdCdzIG1hcHBl
ZCB0byBQRk49MHg1RkZGRkYuIEkgZ3Vlc3MgdGhhdCdzIHdoeSBJIGNhbid0IHJlcHJvZHVj
ZSB0aGUNCj4+IHByb2JsZW0uDQo+Pg0KPj4+IENhbiB5b3Ugc2VlIGlmIHlvdSBjYW4gcmVw
cm9kdWNlIHdpdGggZG9tMC1pb21tdT1zdHJpY3QgaW4gdGhlIFhlbiBjb21tYW5kDQo+Pj4g
bGluZT8NCj4+DQo+PiBVbmZvcnR1bmF0ZWx5LCBpdCBkb2Vzbid0IGhlbHAuIEJ1dCBJIGhh
dmUgZmV3IG1vcmUgb2JzZXJ2YXRpb25zLg0KPj4NCj4+IEZpcnN0bHksIEkgY2hlY2tlZCB0
aGUgInhlbi1tZm5kdW1wIGR1bXAtbTJwIiBvdXRwdXQgYW5kIGZvdW5kIHRoYXQgbWlzcmVh
ZA0KPj4gYmxvY2tzIGFyZSBtYXBwZWQgdG8gc3VzcGljaW91c2x5IHJvdW5kIE1GTnMuIEkg
aGF2ZSBkaWZmZXJlbnQgdmVyc2lvbnMgb2YNCj4+IFhlbiBhbmQgTGludXgga2VybmVsIG9u
IGVhY2ggbWFjaGluZSBhbmQgSSBzZWUgc29tZSBjb2luY2lkZW5jZS4NCj4+DQo+PiBJJ20g
d3JpdGluZyBmZXcgaHVnZSBmaWxlcyB3aXRob3V0IFhlbiB0byBlbnN1cmUgdGhhdCB0aGV5
IGhhdmUgYmVlbiB3cml0dGVuDQo+PiBjb3JyZWN0bHkgKGJlY2F1c2UgdW5kZXIgWGVuIGJv
dGggcmVhZCBhbmQgd3JpdGViYWNrIGlzIGFmZmVjdGVkKS4gVGhlbiBJJ20NCj4+IGJvb3Rp
bmcgdG8gWGVuLCBtZW1vcnktbWFwcGluZyB0aGUgZmlsZXMgYW5kIHJlYWRpbmcgZWFjaCBw
YWdlLiBJIHNlZSB0aGF0IHdoZW4NCj4+IGJsb2NrIGlzIGNvcnJ1cHRlZCwgaXQgaXMgbWFw
cGVkIG9uIHJvdW5kIE1GTiBlLmcuIHBmbj0weDUwOTVkOS9tZm49MHgxNjAwMDAwLA0KPj4g
YW5vdGhlciBvbiBwZm49MHg0MDk1ZDkvbWZuPTB4MTUwMDAwMCBldGMuDQo+Pg0KPj4gT24g
YW5vdGhlciBtYWNoaW5lIHdpdGggZGlmZmVyZW50IExpbnV4L1hlbiB2ZXJzaW9uIHRoZXNl
IGZhdWx0cyBhcHBlYXIgb24NCj4+IHBmbj0weDIwZTUwYy9tZm49MHgxMzAwMDAwLCBwZm49
MHgzMGU1MGMvbWZuPTB4MTQwMDAwMCBldGMuDQo+Pg0KPj4gSSBhbHNvIG5vdGljZWQgdGhh
dCBkdXJpbmcgcmVhZCBvZiBwYWdlIHRoYXQgaXMgbWFwcGVkIHRvDQo+PiBwZm49MHgyMGU1
MGMvbWZuPTB4MTMwMDAwMCwgSSdtIGdldHRpbmcgdGhlc2UgZmF1bHRzIGZyb20gRE1BUjoN
Cj4+DQo+PiBgYGANCj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBk
ZXZpY2UgWzAwMDA6NjU6MDAuMF0gZmF1bHQgYWRkciAxMjAwMDAwMDAwDQo+PiAoWEVOKSBb
VlQtRF1ETUFSOiByZWFzb24gMDUgLSBQVEUgV3JpdGUgYWNjZXNzIGlzIG5vdCBzZXQNCj4+
IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6NjU6
MDAuMF0gZmF1bHQgYWRkciAxMjAwMDAxMDAwDQo+PiAoWEVOKSBbVlQtRF1ETUFSOiByZWFz
b24gMDUgLSBQVEUgV3JpdGUgYWNjZXNzIGlzIG5vdCBzZXQNCj4+IChYRU4pIFtWVC1EXURN
QVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6NjU6MDAuMF0gZmF1bHQgYWRk
ciAxMjAwMDA2MDAwDQo+PiAoWEVOKSBbVlQtRF1ETUFSOiByZWFzb24gMDUgLSBQVEUgV3Jp
dGUgYWNjZXNzIGlzIG5vdCBzZXQNCj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0g
UmVxdWVzdCBkZXZpY2UgWzAwMDA6NjU6MDAuMF0gZmF1bHQgYWRkciAxMjAwMDA4MDAwDQo+
PiAoWEVOKSBbVlQtRF1ETUFSOiByZWFzb24gMDUgLSBQVEUgV3JpdGUgYWNjZXNzIGlzIG5v
dCBzZXQNCj4+IChYRU4pIFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2Ug
WzAwMDA6NjU6MDAuMF0gZmF1bHQgYWRkciAxMjAwMDA5MDAwDQo+PiAoWEVOKSBbVlQtRF1E
TUFSOiByZWFzb24gMDUgLSBQVEUgV3JpdGUgYWNjZXNzIGlzIG5vdCBzZXQNCj4+IChYRU4p
IFtWVC1EXURNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6NjU6MDAuMF0g
ZmF1bHQgYWRkciAxMjAwMDBhMDAwDQo+PiAoWEVOKSBbVlQtRF1ETUFSOiByZWFzb24gMDUg
LSBQVEUgV3JpdGUgYWNjZXNzIGlzIG5vdCBzZXQNCj4+IChYRU4pIFtWVC1EXURNQVI6W0RN
QSBXcml0ZV0gUmVxdWVzdCBkZXZpY2UgWzAwMDA6NjU6MDAuMF0gZmF1bHQgYWRkciAxMjAw
MDBjMDAwDQo+PiAoWEVOKSBbVlQtRF1ETUFSOiByZWFzb24gMDUgLSBQVEUgV3JpdGUgYWNj
ZXNzIGlzIG5vdCBzZXQNCj4+IGBgYA0KPiANCj4gVGhhdCdzIGludGVyZXN0aW5nLCBpdCBz
ZWVtcyB0byBtZSB0aGF0IExpbnV4IGlzIGFzc3VtaW5nIHRoYXQgcGFnZXMNCj4gYXQgY2Vy
dGFpbiBib3VuZGFyaWVzIGFyZSBzdXBlcnBhZ2VzLCBhbmQgdGh1cyBpdCBjYW4ganVzdCBp
bmNyZWFzZQ0KPiB0aGUgbWZuIHRvIGdldCB0aGUgbmV4dCBwaHlzaWNhbCBwYWdlLg0KDQpJ
J20gbm90IHN1cmUgdGhpcyBpcyB0cnVlLiBTZWUgYmVsb3cuDQoNCj4+IGFuZCBldmVyeSB0
aW1lIEknbSBkcm9wcGluZyB0aGUgY2FjaGUgYW5kIHJlYWRpbmcgdGhpcyByZWdpb24sIEkn
bSBnZXR0aW5nDQo+PiBETUFSIGZhdWx0cyBvbiBmZXcgcmFuZG9tIGFkZHJlc3NlcyBmcm9t
IDEyMDAwMDAwMDAtMTIwMDAwZjAwMCByYW5nZSAoSSBndWVzcw0KPj4gTUZOcyAweDEyMDAw
MDAtMTIwMDAwZikuIE1GTnMgMHgxMjAwMDAwLTB4MTIwMDBmZiBhcmUgbm90IG1hcHBlZCB0
byBhbnkgUEZOIGluDQo+PiBEb20wIChiYXNlZCBvbiB4ZW4tbWZuZHVtcCBvdXRwdXQuKS4N
Cj4gDQo+IEl0IHdvdWxkIGJlIHZlcnkgaW50ZXJlc3RpbmcgdG8gZmlndXJlIG91dCB3aGVy
ZSB0aG9zZSByZXF1ZXN0cw0KPiBvcmlnaW5hdGUsIGlvdzogd2hpY2ggZW50aXR5IGluIExp
bnV4IGNyZWF0ZXMgdGhlIGJpb3Mgd2l0aCB0aGUNCj4gZmF1bHRpbmcgYWRkcmVzcyhlcyku
DQoNCkkgX3RoaW5rXyB0aGlzIGlzIHJlbGF0ZWQgdG8gdGhlIGtlcm5lbCB0cnlpbmcgdG8g
Z2V0IHNvbWUgY29udGlndW91cyBhcmVhcw0KZm9yIHRoZSBidWZmZXJzIHVzZWQgYnkgdGhl
IEkvT3MuIEFzIHRob3NlIGFyZWFzIGFyZSBiZWluZyBnaXZlbiBiYWNrIGFmdGVyDQp0aGUg
SS9PLCB0aGV5IGRvbid0IGFwcGVhciBpbiB0aGUgbWZuZHVtcC4NCg0KPiBJdCdzIGEgd2ls
ZCBndWVzcywgYnV0IGNvdWxkIHlvdSB0cnkgdG8gYm9vdCBMaW51eCB3aXRoIHN3aW90bGI9
Zm9yY2UNCj4gb24gdGhlIGNvbW1hbmQgbGluZSBhbmQgYXR0ZW1wdCB0byB0cmlnZ2VyIHRo
ZSBpc3N1ZT8gIEkgd29uZGVyDQo+IHdoZXRoZXIgaW1wb3NpbmcgdGhlIHVzYWdlIG9mIHRo
ZSBzd2lvdGxiIHdpbGwgc3VyZmFjZSB0aGUgaXNzdWVzIGFzDQo+IENQVSBhY2Nlc3Nlcywg
cmF0aGVyIHRoZW4gSU9NTVUgZmF1bHRzLCBhbmQgdGhhdCBjb3VsZCBnZXQgdXMgYSB0cmFj
ZQ0KPiBpbnNpZGUgTGludXggb2YgaG93IHRob3NlIHJlcXVlc3RzIGFyZSBnZW5lcmF0ZWQu
DQo+IA0KPj4gT24gdGhlIG90aGVyIGhhbmQsIEknbSBub3QgZ2V0dGluZyB0aGVzZSBETUFS
IGZhdWx0cyB3aGlsZSByZWFkaW5nIG90aGVyIHJlZ2lvbnMuDQo+PiBBbHNvIEkgY2FuJ3Qg
dHJpZ2dlciB0aGUgYnVnIHdpdGggcmV2ZXJzZWQgRG9tMCBtYXBwaW5nLCBldmVuIGlmIEkg
ZmlsbCB0aGUgcGFnZQ0KPj4gY2FjaGUgd2l0aCByZWFkcy4NCj4gDQo+IFRoZXJlJ3MgcG9z
c2libHkgc29tZSBjb25kaXRpb24gd2UgYXJlIG1pc3NpbmcgdGhhdCBjYXVzZXMgYSBjb21w
b25lbnQNCj4gaW4gTGludXggdG8gYXNzdW1lIHRoZSBuZXh0IGFkZHJlc3MgaXMgbWZuICsg
MSwgaW5zdGVhZCBvZiBkb2luZyB0aGUNCj4gZnVsbCBhZGRyZXNzIHRyYW5zbGF0aW9uIGZy
b20gdGhlIGxpbmVhciBvciBwZm4gc3BhY2UuDQoNCk15IHRoZW9yeSBpczoNCg0KVGhlIGtl
cm5lbCBpcyBzZWVpbmcgdGhlIHVzZWQgYnVmZmVyIHRvIGJlIGEgcGh5c2ljYWxseSBjb250
aWd1b3VzIGFyZWEsDQpzbyBpdCBpcyBfbm90XyB1c2luZyBhIHNjYXR0ZXItZ2F0aGVyIGxp
c3QgKGl0IGRvZXMgaW4gdGhlIGRlYnVnIFhlbiBjYXNlLA0KcmVzdWx0aW5nIGluIGl0IG5v
dCB0byBzaG93IGFueSBlcnJvcnMpLiBVbmZvcnR1bmF0ZWx5IHRoZSBidWZmZXIgaXMgbm90
DQphbGlnbmVkIHRvIGl0cyBzaXplLCBzbyBzd2lvdGxiLXhlbiB3aWxsIHJlbWFwIHRoZSBi
dWZmZXIgdG8gYSBzdWl0YWJseQ0KYWxpZ25lZCBvbmUuIFRoZSBkcml2ZXIgd2lsbCB0aGVu
IHVzZSB0aGUgcmV0dXJuZWQgbWFjaGluZSBhZGRyZXNzIGZvcg0KSS9PcyB0byBib3RoIHRo
ZSBkZXZpY2VzIG9mIHRoZSBSQUlEIGNvbmZpZ3VyYXRpb24uIFdoZW4gdGhlIGZpcnN0IEkv
TyBpcw0KZG9uZSwgdGhlIGRyaXZlciBwcm9iYWJseSBpcyBjYWxsaW5nIHRoZSBETUEgdW5t
YXAgb3IgZGV2aWNlIHN5bmMgZnVuY3Rpb24NCmFscmVhZHksIGNhdXNpbmcgdGhlIGludGVy
bWVkaWF0ZSBjb250aWd1b3VzIHJlZ2lvbiB0byBiZSBkZXN0cm95ZWQgYWdhaW4NCih0aGlz
IGlzIHRoZSB0aW1lIHdoZW4gdGhlIERNQVIgZXJyb3JzIHNob3VsZCBzaG93IHVwIGZvciB0
aGUgMm5kIEkvTyBzdGlsbA0KcnVubmluZykuDQoNClNvIHRoZSBtYWluIGlzc3VlIElNSE8g
aXMsIHRoYXQgYSBETUEgYnVmZmVyIG1hcHBlZCBmb3Igb25lIGRldmljZSBpcyB1c2VkDQpm
b3IgMiBkZXZpY2VzIGluc3RlYWQuDQoNCg0KSnVlcmdlbg0K
--------------u5nTJ0Jt00MjlbmowM3feHkz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------u5nTJ0Jt00MjlbmowM3feHkz--

--------------hrTawuapCD0YcgN83pb5DJ2S--

--------------NKz8LUeziTkm2OsVi0ywJEf0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAme29lYFAwAAAAAACgkQsN6d1ii/Ey8I
3gf/QTZ3/sPeb03verM36gKJMZkXUJIePKKGMlcNB2FHTjsPbrguzvE2wzZedsWfTS3osXubot6g
R2pvCuOqyyU1djjdGe/o4nZKM+TTsXHEH9VkIdwMgfDN2XLvR749nZrLUX/wJGUutckxhYSA4eJV
jt064wd78s13Nzd2PMrMss7HPPB7+amxxap5y7K0SSTe+zvYtW7b8AzTIEQ5uUjIsJSIF3U8hHaX
Xx7l0sjDzmhtUha/gFsjUgrq6ntSpSeBU5RzxPlylo4PPSeuv03IGtnePs8xwsfV1j1kVrB2gSQB
4oZ5hlKDSrawDGtBcmCiVOPy1DAAaDRAv6Q7JGhatg==
=6VLR
-----END PGP SIGNATURE-----

--------------NKz8LUeziTkm2OsVi0ywJEf0--

