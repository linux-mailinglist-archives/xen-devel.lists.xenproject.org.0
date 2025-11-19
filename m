Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A9C6E589
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 12:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165912.1492568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgnU-0001Rg-Kl; Wed, 19 Nov 2025 11:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165912.1492568; Wed, 19 Nov 2025 11:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLgnU-0001PH-Gh; Wed, 19 Nov 2025 11:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1165912;
 Wed, 19 Nov 2025 11:56:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZQwi=53=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vLgnS-0001P9-3A
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 11:56:26 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c54e9b67-c53e-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 12:56:23 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b73669bdcd2so925353266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 03:56:23 -0800 (PST)
Received: from ?IPV6:2003:e5:871a:de00:dd24:7204:f00a:bf44?
 (p200300e5871ade00dd247204f00abf44.dip0.t-ipconnect.de.
 [2003:e5:871a:de00:dd24:7204:f00a:bf44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8d69sm1580851066b.50.2025.11.19.03.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 03:56:22 -0800 (PST)
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
X-Inumbo-ID: c54e9b67-c53e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763553383; x=1764158183; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FYRFuhnLohUDhchuPxPl647lREljhNHqqsqQufM/jwM=;
        b=EYZ9wBTf6J6ryboL91M4/eYiQulbAlMY/hmVb588NndJ4ArgUtYFUOaPzXwhL27q+8
         YnoH9M2vTEmq6NaG8xhtZCl3Wc5URw+1JQfoXdr+TfkVwm5gJ689QsrpOQq9auupI7OP
         LoDYHL/wbaTZ6TQ6hFV37aIL5t56cgfg6FLnZa3OG8DC1dlxPmOmkE8BC+pQN4hMdnym
         dAqK9XxQPfi7CWp6iyZ0Jis3VIVAJ5PD6Vvk99JFOooPTIzGy35J8Ih3F+wIx+BlWvam
         rX+DGDvsaq88fl0UAP8wM3vbV9eHJhWz6a8VF9sOJomkJL5kbr1lr/ZatAGEqRecGoMv
         56bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763553383; x=1764158183;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYRFuhnLohUDhchuPxPl647lREljhNHqqsqQufM/jwM=;
        b=V6EGRZqdlT38injo0v/1FW/h3N89eXf7T6YYCQ/d2gj9+4OWAQfmcfydtXTcUB2kaP
         HmlNYbrI5pcID6PhKlG/CSYOBuWWu/urDFdau8G/ZANAnbvyCZxPt+KyprzX38Ky8ZCx
         IcGDXjNkQVolcZGQFjueAKAGDxK5Lv6lyxA4htY5iV2nIX3FshHwzd10noF0PCJLAXx0
         /G/6Q3VevYq8l1cgNvqnGUAEFj/jL2bM/gcv4PzbtocdnrjfwpSEEcQTN/GfUgOEsbFT
         sT7nPPTAIRk81t/Xm69dAtvgrX5CjDYoSRIIDMD9k4lO6RtGTvEFL6802wVnMeFfGnK4
         Pq7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdaEg85AAGajnfR2ZGgWtJQHX0U5BzvvAybqxiR+e2zTTlr99WROl1R4M9OfO3r8Twex+bT6Hzrfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmZOzHhsGbHw7BSaLiX6gGq8vOlvqsMbx0AfzHj8YrpE4skvuO
	ztlRQdqfqhmQD+t7zBftvqI+Sg4l13bvAGii1S8iKm4PYLXAnIghQU3ygTg4JfXHIPo=
X-Gm-Gg: ASbGncuvqMieQwQLdh0QBkEwSC6uO0lRYFJ6KWfk1eVH8VzatNXWNPB3hYWnB3aahxE
	jjWB0MiCauVJKGYjDnTIz7+ehGY+WV3xy+XM5T8yZ2JD0SJ5uHSETDkHul5dvxjeDHBbrzFFJpv
	GPjVLlEW/1CGWrB37YWIsxtr5lC+HHWrENRSvf5vK49kufJhkF1eEyx2lMT3YoHHHO+N1zUAdeV
	e29St6/aMWyfcm1A7A0xurpu2+2f2pVkQ/2oA0SKLKTDPwBKjorkLhASXEnRfm4qj7KEO1tHClM
	XfHWSllzulHo/IGMLmaFsOOA47SY8+TirmItFEzQDEWpIwQcnRzY8DWmMALxbyf8q+kNJaRKlDn
	hYQzXHchfLDJ7rax4G3fIg+yMQxP6yltnaP/lPIFei8jgwN7M+2Xj1ZafMno+nSzo1Tnv01vuZv
	dvdeeQsutmdCQWuaoxlT4Q7y7Wr4uC3+9gaP8EQ8FqeEHm0b6adfWjRyHQ99sOM2JSe9ZRSbSad
	PdHEZAqsPjoxWPfQz9ro1i+FsBuItVomCHziWbuK83pImAukg==
X-Google-Smtp-Source: AGHT+IF3sN6MGyMRLKS3V8/vC/hp5l13zG+XUSKs2up3QZmrOAO+PMb5DZxBVx/BOK5+PeNYeHx8qQ==
X-Received: by 2002:a17:907:3f05:b0:b73:4fbb:37a8 with SMTP id a640c23a62f3a-b7367880f9dmr2183670566b.12.1763553383112;
        Wed, 19 Nov 2025 03:56:23 -0800 (PST)
Message-ID: <ade173bc-5247-46eb-aac1-3aa92999e0b6@suse.com>
Date: Wed, 19 Nov 2025 12:56:22 +0100
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
 <8a57904f-17f2-46f9-9b08-e2287f8fd44c@suse.com>
 <9d5f30c9-1a9e-45d2-93f9-3af20f105a69@epam.com>
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
In-Reply-To: <9d5f30c9-1a9e-45d2-93f9-3af20f105a69@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lXR8L9LJEqNtg6oDM8T34rpq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lXR8L9LJEqNtg6oDM8T34rpq
Content-Type: multipart/mixed; boundary="------------eapoUKOgYX70TRIRP1U7FERe";
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
Message-ID: <ade173bc-5247-46eb-aac1-3aa92999e0b6@suse.com>
Subject: Re: [XEN][PATCH 3/5] x86: hvm: factor out compat code under ifdefs
References: <20251111175413.3540690-1-grygorii_strashko@epam.com>
 <20251111175413.3540690-4-grygorii_strashko@epam.com>
 <af736490-5f04-4fa8-9b73-4071b72e1c33@suse.com>
 <4e4aa540-514b-458f-8036-7941a0ecf268@epam.com>
 <be6f958b-ae23-4cd0-9dd7-c096ae36d39b@suse.com>
 <a17e86e4-f8c1-464d-b30d-42713f793ea5@suse.com>
 <8aa7ddeb-fb2b-42ac-bba6-272b91fc1e8f@suse.com>
 <a36eafd3-35cf-448e-8c46-df063f50b082@epam.com>
 <8a57904f-17f2-46f9-9b08-e2287f8fd44c@suse.com>
 <9d5f30c9-1a9e-45d2-93f9-3af20f105a69@epam.com>
In-Reply-To: <9d5f30c9-1a9e-45d2-93f9-3af20f105a69@epam.com>
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

--------------eapoUKOgYX70TRIRP1U7FERe
Content-Type: multipart/mixed; boundary="------------GYOi2GCi0j5yWHtCR0WpzUvT"

--------------GYOi2GCi0j5yWHtCR0WpzUvT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMTEuMjUgMTI6NDgsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPiBIaSBKw7xy
Z2VuLA0KPiANCj4gT24gMTMuMTEuMjUgMTc6NDMsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+
PiBPbiAxMy4xMS4yNSAxNjozMiwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6DQo+Pj4gSGkg
SsO8cmdlbiwNCj4+Pg0KPj4+IE9uIDEzLjExLjI1IDE2OjQ2LCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOg0KPj4+PiBPbiAxMy4xMS4yNSAxNTozOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+
Pj4+IE9uIDEzLjExLjI1IDE0OjIzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAx
My4xMS4yMDI1IDE0OjE4LCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToNCj4+Pj4+Pj4gT24g
MTMuMTEuMjUgMTQ6MzAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMTEuMTEu
MjAyNSAxODo1NCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6DQo+Pj4+Pj4+Pj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+Pj4+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4+Pj4+PiBAQCAtMjksMTAgKzI5LDEyIEBAIGxv
bmcgaHZtX21lbW9yeV9vcCh1bnNpZ25lZCBsb25nIGNtZCwgDQo+Pj4+Pj4+Pj4gWEVOX0dV
RVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FTk9TWVM7DQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIH0NCj4+Pj4+
Pj4+PiAtwqDCoMKgIGlmICggIXZjcHVfaXNfaGNhbGxfY29tcGF0KGN1cnJlbnQpICkNCj4+
Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgcmMgPSBkb19tZW1vcnlfb3AoY21kLCBhcmcpOw0K
Pj4+Pj4+Pj4+IC3CoMKgwqAgZWxzZQ0KPj4+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX0NPTVBB
VA0KPj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKCB2Y3B1X2lzX2hjYWxsX2NvbXBhdChjdXJyZW50
KSApDQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmMgPSBjb21wYXRfbWVtb3J5
X29wKGNtZCwgYXJnKTsNCj4+Pj4+Pj4+PiArwqDCoMKgIGVsc2UNCj4+Pj4+Pj4+PiArI2Vu
ZGlmDQo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJjID0gZG9fbWVtb3J5X29wKGNtZCwg
YXJnKTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBXaHkgd291bGQgdGhpcyBiZSBuZWVkZWQgd2hl
biB2Y3B1X2lzX2hjYWxsX2NvbXBhdCgpIGFscmVhZHkgaG9ub3JzIA0KPj4+Pj4+Pj4gQ09O
RklHX0NPTVBBVD8NCj4+Pj4+Pj4+IChTYW1lIHF1ZXN0aW9uIHRoZW4gYXBwbGllcyBlbHNl
d2hlcmUsIG9mIGNvdXJzZS4pDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgSSBkbyBub3QgbGlr
ZSBieSBteXNlbGYsIGJ1dCBJIHdhcyBub3QgYWJsZSB0byBmaW5kIG90aGVyIG9wdGlvbnMg
OigNCj4+Pj4+Pj4NCj4+Pj4+Pj4gaHlwZXJjYWxsLWRlZnMuaCBpcyBhdXRvZ2VuZXJhdGVk
IGFuZCBpdCdzIHRoZSBvbmx5IG9uZSBwbGFjZSB3aGVyZSANCj4+Pj4+Pj4gZnVuY3Rpb25z
DQo+Pj4+Pj4+IGRlY2xhcmF0aW9ucyBsaWtlIGRvX3hfb3AoKSBhcmUgYXBwZWFyZWQgb3Ig
ZGlzYXBwZWFyZWQuDQo+Pj4+Pj4+IFNvIGJ1aWxkIGlzIGZhaWxpbmcgd2l0aG91dCBpZmRl
ZnMgYXMgY29tcGlsZXIgY2FuJ3QgZmluZCBjb21wYXRfbWVtb3J5X29wKCkNCj4+Pj4+Pj4g
ZGVjbGFyYXRpb24uDQo+Pj4+Pj4NCj4+Pj4+PiBPaCwgSSBzZWU7IEkgaGFkbid0IHRob3Vn
aHQgb2YgdGhhdCBhc3BlY3QuIEkgd29uZGVyIGlmIHdlIHdvdWxkbid0IGJldHRlciANCj4+
Pj4+PiB0YWtlDQo+Pj4+Pj4gY2FyZSBvZiB0aGF0IGluIHRoZSBtYWNoaW5lcnkgdGhlcmUu
IENjLWluZyBKw7xyZ2VuLCB3aG8gZGlkIGludHJvZHVjZSB0aGlzDQo+Pj4+Pj4gb3JpZ2lu
YWxseS4gTWF5YmUgaGUgaGFzIGNvbmNyZXRlIGFyZ3VtZW50cyBhZ2FpbnN0IHVzIGRvaW5n
IHNvLg0KPj4+Pj4NCj4+Pj4+IE5vIGFyZ3VtZW50cyBhZ2FpbnN0IGl0Lg0KPj4+Pj4NCj4+
Pj4+IFlvdSBwcm9iYWJseSB3aWxsIG5lZWQgYSBuZXcgUHJlZml4IGRlZmluZWQgKGUuZy4g
Y29tcGF0X2Fsd2F5cykgYW5kIHNldCBpdCANCj4+Pj4+IHZpYQ0KPj4+Pj4NCj4+Pj4+ICNk
ZWZpbmUgUFJFRklYX2NvbXBhdF9hbHdheXMgY29tcGF0DQo+Pj4+Pg0KPj4+Pj4gdW5jb25k
aXRpb25hbGx5LiBUaGVuIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBoYXZlDQo+Pj4+Pg0K
Pj4+Pj4gUHJlZml4OiBjb21wYXRfYWx3YXlzDQo+Pj4+PiBtZW1vcnlfb3AoLi4uKQ0KPj4+
Pj4NCj4+Pj4+IG91dHNpZGUgb2YgI2lmZGVmcyBhbmQgZHJvcCB0aGUgbWVtb3J5X29wKCkg
aW4gdGhlICNpZmRlZiBDT05GSUdfQ09NUEFUIA0KPj4+Pj4gc2VjdGlvbi4NCj4+Pj4NCj4+
Pj4gT2gsIHRoaXMgbWlnaHQgYmUgd3JvbmcsIGFzIHRoaXMgd2lsbCBicmVhayB0aGUgUFYz
MiBtZW1vcnlfb3AoKSBoeXBlcmNhbGwuDQo+Pj4+DQo+Pj4+IFlvdSBuZWVkIHRvIGtlZXAg
dGhlIGN1cnJlbnQgbWVtb3J5X29wKCkgaW4gdGhlICNpZmRlZiBDT05GSUdfQ09NUEFUIHNl
Y3Rpb24NCj4+Pj4gYW5kIG1vdmUgdGhlIGNvbXBhdF9hbHdheXMgc3R1ZmYgaW50byBhbiAj
ZWxzZSBwYXJ0IG9mIHRoZSBDT05GSUdfQ09NUEFULg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+IFRo
aXMgc2hvdWxkIHJlc3VsdCBpbiB0aGUgY29tcGF0X21lbW9yeV9vcCgpIHByb3RvdHlwZSB0
byBiZSBhbHdheXMgYXZhaWxhYmxlLg0KPj4+Pj4gSGF2aW5nIG5vIHJlbGF0ZWQgZnVuY3Rp
b24gc2hvdWxkIGJlIG5vIHByb2JsZW0gZHVlIHRvIERDTyBpbiBjYXNlIA0KPj4+Pj4gQ09O
RklHX0NPTVBBVA0KPj4+Pj4gaXNuJ3QgZGVmaW5lZC4NCj4+Pg0KPj4+IFNtdGggbGlrZSB0
aGlzLCByaWdodD8NCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9oeXBlcmNh
bGwtZGVmcy5jIGIveGVuL2luY2x1ZGUvaHlwZXJjYWxsLWRlZnMuYw0KPj4+IGluZGV4IDMz
OGQ3YWZlMzA0OC4uZTg1OTQzMzIwYmQyIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9pbmNsdWRl
L2h5cGVyY2FsbC1kZWZzLmMNCj4+PiArKysgYi94ZW4vaW5jbHVkZS9oeXBlcmNhbGwtZGVm
cy5jDQo+Pj4gQEAgLTgwLDYgKzgwLDggQEAgcmV0dHlwZTogY29tcGF0IGludA0KPj4+IMKg
wqAjZGVmaW5lIFBSRUZJWF9jb21wYXQNCj4+PiDCoMKgI2VuZGlmDQo+Pj4NCj4+PiArI2Rl
ZmluZSBQUkVGSVhfY29tcGF0X2Fsd2F5cyBjb21wYXQNCj4+PiArDQo+Pj4gwqDCoCNpZmRl
ZiBDT05GSUdfQVJNDQo+Pj4gwqDCoCNkZWZpbmUgUFJFRklYX2RlcCBkZXANCj4+PiDCoMKg
I2RlZmluZSBQUkVGSVhfZG9fYXJtIGRvX2FybQ0KPj4+IEBAIC0xNTYsNiArMTU4LDkgQEAg
cGxhdGZvcm1fb3AoY29tcGF0X3BsYXRmb3JtX29wX3QgKnVfeGVucGZfb3ApDQo+Pj4gwqDC
oCNpZmRlZiBDT05GSUdfS0VYRUMNCj4+PiDCoMKga2V4ZWNfb3AodW5zaWduZWQgaW50IG9w
LCB2b2lkICp1YXJnKQ0KPj4+IMKgwqAjZW5kaWYNCj4+PiArI2Vsc2UNCj4+PiArcHJlZml4
OiBQUkVGSVhfY29tcGF0X2Fsd2F5cw0KPj4NCj4+IFRoaXMgc2hvdWxkIGJlOg0KPj4NCj4+
ICtwcmVmaXg6IGNvbXBhdF9hbHdheXMNCj4gDQo+IFVuZm9ydHVuYXRlbHksIF4gaXMgbm90
IHdvcmtpbmcgaXQgZ2VuZXJhdGVzDQo+IGxvbmcgY29tcGF0X2Fsd2F5c19tZW1vcnlfb3Ao
dW5zaWduZWQgaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpOw0K
PiANCj4gTXkgdmVyc2lvbiB3b3JrcyAicHJlZml4OiBQUkVGSVhfY29tcGF0X2Fsd2F5cyIN
Cj4gDQoNCk9oLCBJIHN0YW5kIGNvcnJlY3RlZCB0aGVuLg0KDQoNCkp1ZXJnZW4NCg==
--------------GYOi2GCi0j5yWHtCR0WpzUvT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------GYOi2GCi0j5yWHtCR0WpzUvT--

--------------eapoUKOgYX70TRIRP1U7FERe--

--------------lXR8L9LJEqNtg6oDM8T34rpq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmkdsGYFAwAAAAAACgkQsN6d1ii/Ey/w
VQf+NFP76hssanfAbVfJWtUxSNohBn+G4iJ3Pa5PN8mMY63oPCVvYx/P7fp7h8dFURE77x8p5G96
oF+ijknYTawgTLrllRZ5w+7g5Vj0159G4ZsARnd41lf18hjx63qkKZiYxEjCgkRMx0uKvCZwmDQR
WFOUMmAuwOpeliqROluImxxIAKQAqK97v62isY0bHmOGK39Gj0I2WwSxCS1jAmBDjc0L4hWwwYVt
0LuFZQE3827v89f0PwCIWh44NToRmc7B/8RuD4U1lUSsQw9C1OFMH2oGI/MF8baGAyoRBHpU4xoa
/n11X8Hyv9tLxvluaNsZ/VYvIzrtGAGFYlJewNB0OQ==
=j5G8
-----END PGP SIGNATURE-----

--------------lXR8L9LJEqNtg6oDM8T34rpq--

