Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CFEABBF48
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989842.1373803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0dv-0007Dp-Vj; Mon, 19 May 2025 13:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989842.1373803; Mon, 19 May 2025 13:34:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0dv-0007Bg-Sz; Mon, 19 May 2025 13:34:59 +0000
Received: by outflank-mailman (input) for mailman id 989842;
 Mon, 19 May 2025 13:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5Al=YD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uH0du-0007Ba-9s
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:34:58 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d4c8519-34b6-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 15:34:56 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5fff52493e0so5122070a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:34:56 -0700 (PDT)
Received: from [192.168.62.38] (server.hotelpassage.eu. [88.146.207.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f2f06sm5763735a12.9.2025.05.19.06.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 06:34:55 -0700 (PDT)
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
X-Inumbo-ID: 0d4c8519-34b6-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747661695; x=1748266495; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G0o0PAMbFl5pa7ainzNmhCd/hGWpG0FUAue9Qou/Yw8=;
        b=Kv4By+aAjP2+LUpl7NYLK1qoAucMFUYeHpU2BAU/GmALzDgVcyJGhjdyq+Jz7HfsJC
         5/CkvEhlZXYlum4B3lSeKQCRHZbdWHSdSfj3KAZR3o/RC5He3cPmxm7Ll4CJTG2euZNO
         kRq1C4jFwdaOsVPpSSEYXXKSRr4J3qRGvRFvZpa7g+e8exKSR9vW9/D64linV/gmNB0D
         1Ap1HMjKQEGb65qcLV2Q7TbPdgIGNdFI9xPMr7rhtq7u3bwDklojaWbUQW08LmL098lu
         WeQS+TlQSR3Gsx0ozNBpB92dFBONFcogswzbb+nJRVAOITcQJqPrcfE2U4PH3BQTCQHf
         JKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661695; x=1748266495;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G0o0PAMbFl5pa7ainzNmhCd/hGWpG0FUAue9Qou/Yw8=;
        b=Q2R5ws9drSXeOHjLvcwtpKgQkvKDTMY5jMyKB4PIi2NVK/U9MNvhg0cSoMI0HM/or6
         ilvPUbIuombgd3cQYPKhXWy/R6ip0GjUqqFieDB/dguw42V7aw8kLlrqCuS7y1XKCCBd
         PWkfg34HqDP26cOJ2k1xnVF0KxE5iKJycB335V0LIsESU4ovaNHzaJfccTLT8u+MMBwf
         xhVqcKWF2zcmo7t+/dbu1qkexy3iMYsd69C8P3BZtuSK4g8ob6NaMr2YxssXoA1x2kNT
         j1tw7nNEWMPnQyAJUyvHeG31cb5rcW6LklRbusJJBAadBEa/tGzGnq9lkZ7MIDh3Jrzx
         JZ2A==
X-Gm-Message-State: AOJu0YyvoYLWPG9lPK1rGcb2vX8wLuAx3VS2i3ZcN340d8Dk4I3Zqo1T
	zXeM7aTfPe+s/kg1YoD2BEDSTjXZTH3q9lpJGglWUwNAuATbOIPwWEvnDzP+sBjUTQ0=
X-Gm-Gg: ASbGnctTfPwpwU2BxUfA6LWedIIDyDOITrK2ymctAkfCrsMDagsgexSSChTwzwkyv0J
	qQGhsPJhp8XEBlipw4n+kXDYOK+A9FVY50CwQ/lwwjDI+6zaevzHSWC5XdYzXlPi8LuQYhkAXgs
	YjBPez1gXFbj7AvDxJ5UL2/1f4PA1Rc6JU0oyMYEuW/X9b1y4dvK4boD9aNbEn1XNqOcGCTlVJD
	pGKg/Ttf/nTvPHVdQA/rQKBqLkeR0LHLuEQlSbGRZUZwnkI2Dlc2VHWQuW97w1pWPxuDeDohj9T
	YqUtnsz4ydgwlqcHVvAL89ymV4FnFO8m3QAPaqXUkfzq4g9deO/lJxfMewQONhz+rxlc38s5
X-Google-Smtp-Source: AGHT+IFlAqqVSi1s6mfWQh91o06qt/MPrzA/bJo2O7vvdNKtSjE5Un2SPH1l3uN7tb2q+l0J2r8tvw==
X-Received: by 2002:a05:6402:26cf:b0:601:8481:3268 with SMTP id 4fb4d7f45d1cf-60184813473mr9452638a12.25.1747661695454;
        Mon, 19 May 2025 06:34:55 -0700 (PDT)
Message-ID: <beafe730-f1f2-4098-9a26-eaecac6bbe34@suse.com>
Date: Mon, 19 May 2025 15:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] tools: remove support for running a guest with
 qemu-traditional
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-3-jgross@suse.com> <aCsyXZyXNcSLq03I@l14>
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
In-Reply-To: <aCsyXZyXNcSLq03I@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rmeP7maN8jl5VkgcndEh9nCs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rmeP7maN8jl5VkgcndEh9nCs
Content-Type: multipart/mixed; boundary="------------FmB8240Jkw8cF0nssYYO7hzp";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <beafe730-f1f2-4098-9a26-eaecac6bbe34@suse.com>
Subject: Re: [PATCH v3 2/4] tools: remove support for running a guest with
 qemu-traditional
References: <20250429110636.30518-1-jgross@suse.com>
 <20250429110636.30518-3-jgross@suse.com> <aCsyXZyXNcSLq03I@l14>
In-Reply-To: <aCsyXZyXNcSLq03I@l14>
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

--------------FmB8240Jkw8cF0nssYYO7hzp
Content-Type: multipart/mixed; boundary="------------S5glhQFy8lNat0AgtftWkJJm"

--------------S5glhQFy8lNat0AgtftWkJJm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDUuMjUgMTU6MzAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUdWUsIEFw
ciAyOSwgMjAyNSBhdCAwMTowNjozMlBNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYmFjcGkvbWtfZHNkdC5jIGIvdG9vbHMvbGliYWNw
aS9ta19kc2R0LmMNCj4+IGluZGV4IDM0ZjY3NTNmNjEuLjIyN2I1Y2VhZmIgMTAwNjQ0DQo+
PiAtLS0gYS90b29scy9saWJhY3BpL21rX2RzZHQuYw0KPj4gKysrIGIvdG9vbHMvbGliYWNw
aS9ta19kc2R0LmMNCj4+IEBAIC0xMDUsNyArODEsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqKmFyZ3YpDQo+PiAgIHsNCj4+ICAgICAgIHVuc2lnbmVkIGludCBjcHUsIG1heF9j
cHVzOw0KPj4gICAjaWYgZGVmaW5lZChDT05GSUdfWDg2KQ0KPj4gLSAgICBkbV92ZXJzaW9u
IGRtX3ZlcnNpb24gPSBRRU1VX1hFTl9UUkFESVRJT05BTDsNCj4+ICsgICAgZG1fdmVyc2lv
biBkbV92ZXJzaW9uID0gUUVNVV9JTlZBTElEOw0KPj4gICAgICAgdW5zaWduZWQgaW50IHNs
b3QsIGRldiwgaW50eCwgbGluazsNCj4+ICAgDQo+PiAgICAgICBtYXhfY3B1cyA9IEhWTV9N
QVhfVkNQVVM7DQo+PiBAQCAtMTYwLDYgKzEzNCwxMSBAQCBpbnQgbWFpbihpbnQgYXJnYywg
Y2hhciAqKmFyZ3YpDQo+PiAgICAgICAgICAgfQ0KPj4gICAgICAgfQ0KPj4gICANCj4+ICsg
ICAgaWYgKGRtX3ZlcnNpb24gPT0gUUVNVV9JTlZBTElEKSB7DQo+IA0KPiBgZG1fdmVyc2lv
bmAgaXMgb25seSBhdmFpbGFibGUgaWYgQ09ORklHX1g4NiBpcyBkZWZpbmVkLCBzbyB0aGF0
IGRvZXNuJ3QNCj4gYnVpbGQgb24gQXJtLg0KPiANCj4+ICsgICAgICAgIGZwcmludGYoc3Rk
ZXJyLCAiLS1kbV92ZXJzaW9uIGlzIGEgbWFuZGF0b3J5IHBhcmFtZXRlci5cbiIpOw0KPj4g
KyAgICAgICAgcmV0dXJuIC0xOw0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgICAvKioqKiBE
U0RUIERlZmluaXRpb25CbG9jayBzdGFydCAqKioqLw0KPj4gICAgICAgLyogKHdlIGFwcGVu
ZCB0byBleGlzdGluZyBEU0RUIGRlZmluaXRpb24gYmxvY2spICovDQo+PiAgICAgICBpbmRl
bnRfbGV2ZWwrKzsNCj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2Rt
LmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX2RtLmMNCj4+IGluZGV4IDQ2Mjc1NjRjMGQu
LjY0NTExOWI2NWEgMTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2Rt
LmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfZG0uYw0KPj4gQEAgLTI0NjMs
MTYgKzIxODksMTUgQEAgdm9pZCBsaWJ4bF9fc3Bhd25fc3R1Yl9kbShsaWJ4bF9fZWdjICpl
Z2MsIGxpYnhsX19zdHViX2RtX3NwYXduX3N0YXRlICpzZHNzKQ0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAiJXMiLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4
bF9iaW9zX3R5cGVfdG9fc3RyaW5nKGd1ZXN0X2NvbmZpZy0+Yl9pbmZvLnUuaHZtLmJpb3Mp
KTsNCj4+ICAgICAgIH0NCj4+IC0gICAgLyogRGlzYWJsZSByZWxvY2F0aW5nIG1lbW9yeSB0
byBtYWtlIHRoZSBNTUlPIGhvbGUgbGFyZ2VyDQo+PiAtICAgICAqIHVubGVzcyB3ZSdyZSBy
dW5uaW5nIHFlbXUtdHJhZGl0aW9uYWwgYW5kIHZOVU1BIGlzIG5vdA0KPj4gLSAgICAgKiBj
b25maWd1cmVkLiAqLw0KPj4gKw0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBEaXNhYmxlIHJl
bG9jYXRpbmcgbWVtb3J5LCBoYXZpbmcgYSBsYWdlciBNTUlPIGhvbGUgaXNuJ3QNCj4gDQo+
IEkgdGhpbmsgeW91IHdhbnRlZCB0byB3cml0ZSAibGFyZ2VyIiBhbmQgbm90ICJsYWdlciIu
DQo+IA0KPj4gKyAgICAgKiBpbXBsZW1lbnRlZCB3aXRoIHFlbXUteGVuLg0KPj4gKyAgICAg
Ki8NCj4+ICAgICAgIGxpYnhsX194c19wcmludGYoZ2MsIFhCVF9OVUxMLA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICBsaWJ4bF9fc3ByaW50ZihnYywgIiVzL2h2bWxvYWRlci9hbGxv
dy1tZW1vcnktcmVsb2NhdGUiLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsaWJ4bF9feHNfZ2V0X2RvbXBhdGgoZ2MsIGd1ZXN0X2RvbWlkKSksDQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgIiVkIiwNCj4+IC0gICAgICAgICAgICAgICAgICAgICBn
dWVzdF9jb25maWctPmJfaW5mby5kZXZpY2VfbW9kZWxfdmVyc2lvbg0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgID09IExJQlhMX0RFVklDRV9NT0RFTF9WRVJTSU9OX1FFTVVfWEVO
X1RSQURJVElPTkFMICYmDQo+PiAtICAgICAgICAgICAgICAgICAgICAgIWxpYnhsX192bnVt
YV9jb25maWd1cmVkKCZndWVzdF9jb25maWctPmJfaW5mbykpOw0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICIwIik7DQo+PiAgICAgICByZXQgPSB4Y19kb21haW5fc2V0X3RhcmdldChj
dHgtPnhjaCwgZG1fZG9taWQsIGd1ZXN0X2RvbWlkKTsNCj4+ICAgICAgIGlmIChyZXQ8MCkg
ew0KPj4gICAgICAgICAgIExPR0VEKEVSUk9SLCBndWVzdF9kb21pZCwgInNldHRpbmcgdGFy
Z2V0IGRvbWFpbiAlZCAtPiAlZCIsDQo+PiBAQCAtMzE5NiwyNiArMjkxNywxOSBAQCBzdGF0
aWMgdm9pZCBkZXZpY2VfbW9kZWxfbGF1bmNoKGxpYnhsX19lZ2MgKmVnYywNCj4+ICAgICAg
ICAgICBsaWJ4bF9feHNfcHJpbnRmKGdjLCBYQlRfTlVMTCwNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvaHZtbG9hZGVyL2Jpb3MiLCBwYXRoKSwNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlcyIsIGxpYnhsX2Jpb3NfdHlwZV90b19z
dHJpbmcoYl9pbmZvLT51Lmh2bS5iaW9zKSk7DQo+PiAtICAgICAgICAvKiBEaXNhYmxlIHJl
bG9jYXRpbmcgbWVtb3J5IHRvIG1ha2UgdGhlIE1NSU8gaG9sZSBsYXJnZXINCj4+IC0gICAg
ICAgICAqIHVubGVzcyB3ZSdyZSBydW5uaW5nIHFlbXUtdHJhZGl0aW9uYWwgYW5kIHZOVU1B
IGlzIG5vdA0KPj4gLSAgICAgICAgICogY29uZmlndXJlZC4gKi8NCj4+ICsgICAgICAgIC8q
DQo+PiArICAgICAgICAgKiBEaXNhYmxlIHJlbG9jYXRpbmcgbWVtb3J5LCBoYXZpbmcgYSBs
YWdlciBNTUlPIGhvbGUgaXNuJ3QNCj4gDQo+IEhlcmUgdG9vLCBJIHRoaW5rIHlvdSB3YW50
ZWQgdG8gd3JpdGUgImxhcmdlciIgYW5kIG5vdCAibGFnZXIiLg0KPiANCj4+ICsgICAgICAg
ICAqIGltcGxlbWVudGVkIHdpdGggcWVtdS14ZW4uDQo+PiArICAgICAgICAgKi8NCj4+ICAg
ICAgICAgICBsaWJ4bF9feHNfcHJpbnRmKGdjLCBYQlRfTlVMTCwNCj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvaHZtbG9hZGVyL2FsbG93LW1lbW9yeS1y
ZWxvY2F0ZSIsIHBhdGgpLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAiJWQiLA0K
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICBiX2luZm8tPmRldmljZV9tb2RlbF92ZXJz
aW9uPT1MSUJYTF9ERVZJQ0VfTU9ERUxfVkVSU0lPTl9RRU1VX1hFTl9UUkFESVRJT05BTCAm
Jg0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAhbGlieGxfX3ZudW1hX2NvbmZpZ3Vy
ZWQoYl9pbmZvKSk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICIwIik7DQo+PiAg
ICAgICAgICAgZnJlZShwYXRoKTsNCj4+ICAgICAgIH0NCj4gDQo+IEFuZCB3aXRoIHRob3Nl
IGZpeGVkOiBSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZh
dGVzLnRlY2g+DQo+IEkgZ3Vlc3MgSSBjYW4gZml4ZWQgdGhvc2Ugb24gY29tbWl0IGlmIHRo
YXQncyBmaW5lIGJ5IHlvdT8NCg0KT2YgY291cnNlIGl0IGlzLg0KDQpUaGFua3MsDQoNCg0K
SnVlcmdlbg0K
--------------S5glhQFy8lNat0AgtftWkJJm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------S5glhQFy8lNat0AgtftWkJJm--

--------------FmB8240Jkw8cF0nssYYO7hzp--

--------------rmeP7maN8jl5VkgcndEh9nCs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgrM34FAwAAAAAACgkQsN6d1ii/Ey/2
4AgAil9CKdI/z4oOVicp6G44BkLCsXhWeVm1h2z/iL1hGVaQ5OKDrwJCYIrk86qJBsPBW1/+tQoQ
fqYqDHs0wS3N0ixyi/FBQoMTWFRUPpPYdGs5mlM6uDp56H/qw1/YJ2h30hCZWD9ZXLohYiPCrKeG
bfDchT3Zv+zowG92I+0dqgM6Ullrmo3Kn2qRaqT4hN4WcpsYLvL9HnJVHNS2OygcY5LE+HejYNO1
mVt8iNWB+hk5vQdpG2s4jMuTrmiUUwpjjYKj7+zBCrZWgpL0O5yikvWjHDZuiPCCcTuTmfAwJGLi
8LNM0sVvq/+q8j2uWF9XZ0p6sM+0SjfQ4U7BV/BgXw==
=LJ0C
-----END PGP SIGNATURE-----

--------------rmeP7maN8jl5VkgcndEh9nCs--

