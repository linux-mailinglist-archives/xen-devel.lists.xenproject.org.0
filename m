Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2166FA7BE2C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 15:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938235.1339159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hKU-0005bW-99; Fri, 04 Apr 2025 13:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938235.1339159; Fri, 04 Apr 2025 13:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hKU-0005a4-5l; Fri, 04 Apr 2025 13:43:30 +0000
Received: by outflank-mailman (input) for mailman id 938235;
 Fri, 04 Apr 2025 13:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5J6g=WW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1u0hKT-0005Zt-Aj
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 13:43:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9757e8a-115a-11f0-9ffb-bf95429c2676;
 Fri, 04 Apr 2025 15:43:27 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5ec9d24acfbso5790406a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Apr 2025 06:43:27 -0700 (PDT)
Received: from ?IPV6:2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b?
 (p200300e5873d1a008e99ce06aa4a2e7b.dip0.t-ipconnect.de.
 [2003:e5:873d:1a00:8e99:ce06:aa4a:2e7b])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a9c9sm2491857a12.41.2025.04.04.06.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Apr 2025 06:43:26 -0700 (PDT)
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
X-Inumbo-ID: c9757e8a-115a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743774207; x=1744379007; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q3taBEB4gF0NUKuRN7F/l06mDTLF21MiGHIg7Dd0nBw=;
        b=EaHaoAiNCqR+R08noZjYt+9F/VdZ5eLVmz0yl4wLAgvXCCRqIfWE34Wt6b3a9h2Va/
         bY3MkCcN/zF9FwD0h/YEbfwOEVhwpMClRJtet4vY2EsG/3rQJQc1fNwBaYbWeoilfqC9
         r2kuY/fgqzSSAIhFToazsPNITeZhRqDIJ6QrI/FE7SHoNdVOxTSICo8LvdhyMXYd9BkL
         XdVf39V+rmDFSJPsKJl1W5MtpGMh7ravaEuRi1Sgja3YK4mDT514SIKe94vvvfHL3vlv
         NE+LXpqD4dTYjHOZh/Qe/RxV22DxZFtrE7mjt3WrwAM0CvJwKzKbmIYOXBcD0wn+wLS3
         6vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774207; x=1744379007;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3taBEB4gF0NUKuRN7F/l06mDTLF21MiGHIg7Dd0nBw=;
        b=kSMokrXy+d6JwwS9dBIlEiCXUv+MN29ObrtO4WPMPPuiw89KjKEselM0ez1574k5V9
         aaNK1U0uVLT6XFtmpR9zLq0nddoyO+mZDCoS/dNBvLRJlHN8JQHbb0bIXJ3umrfSUOti
         d1kabhzxyPibWHlamuOqYmpleTZeQCTmiP7PczbQS/215l1hMR3AmZ5aiZLVKrEf/OC9
         Ddhz2WQ0xkQbK+HvTnLTRFurbjhR0y8BK6WUJKdBcnM5FYY2R6ESi3KRrXTJkQg9K/Rw
         dLwVAJQ4qqC7awnytAAEitMkyY1uiHSuHBznhI0WI92M+1hHccTZxmHrMCsqjemIg2kJ
         rLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYG9Vdh38/wLl9xfz2G7AslXw2sQ6jwgIuCzrng7CQ1tw7enFhF/VdROGJsGa4skFJc63RTgTuZX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzojhieGV142Qs4mkHctSKFH7yAe1R/Zj4p+bcCxf9VJHC22+HX
	jWKB46wPvOC/MMg9K2WZSXM53/162nLJqMLLI7oLzgGksukhEg+AjuGPs6CS6jY=
X-Gm-Gg: ASbGncuNzXON5t3dRsFUL7fc91dT5xqd+nJGTXewL17/k0bOlMcmH3bVa8wCIrUjFhp
	cBO12yJnyxtKs6KXrXGMu/5xAwIyIdLFHDoEKVLft6IjyhW4NYp8QYU65PE9pyTZ0zrF/cxLImI
	9lPoYX8pXU3NFkjXJvP/Bv+0hJXhEPMii1dSCNcGGHXzby+foBUABIQVBOnyWd5C4Cz+65ikLQ1
	mKlH4VpT2spsESZzh7jYgVCREpZ8OdEaY0FYcWqieaTb/YNDvMSsBYG97dPOwPiYQcO1FsgjuHV
	kMQUkV/ub+77g7Ym2vtb484LKfwgZYDDk4EqZDIrQU/y9TwMmOWFzViVD3PNixWBy/ArxTgAGNe
	xSCZIxJZcxBKrHhq/1ILp9LZrJGF4Pf13BBt8pPMzeKM5hBZVu6AymGJG7qDkWlyl1qbSTaNbLn
	M5BUCD
X-Google-Smtp-Source: AGHT+IGkt/iwIlZigqNIp4GoGftYoaLe427rUWKET4qJfryg54IAyRaRodaL370ygzl75u+br2Uocw==
X-Received: by 2002:a05:6402:4316:b0:5ec:cb95:c3ce with SMTP id 4fb4d7f45d1cf-5f0b284dc8fmr2774876a12.1.1743774206728;
        Fri, 04 Apr 2025 06:43:26 -0700 (PDT)
Message-ID: <64e63ce5-7af1-466e-aa62-7dba89519891@suse.com>
Date: Fri, 4 Apr 2025 15:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20250404133459.16125-1-roger.pau@citrix.com>
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
In-Reply-To: <20250404133459.16125-1-roger.pau@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7EK588fpB7FEU4LWKCZllG5q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7EK588fpB7FEU4LWKCZllG5q
Content-Type: multipart/mixed; boundary="------------3hp3B7PBSRztWCO0n6K4eZQI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Message-ID: <64e63ce5-7af1-466e-aa62-7dba89519891@suse.com>
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
References: <20250404133459.16125-1-roger.pau@citrix.com>
In-Reply-To: <20250404133459.16125-1-roger.pau@citrix.com>

--------------3hp3B7PBSRztWCO0n6K4eZQI
Content-Type: multipart/mixed; boundary="------------DFwldr5icuCE5xC0vZVZc0lE"

--------------DFwldr5icuCE5xC0vZVZc0lE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDQuMjUgMTU6MzQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gUFZIIGRvbTAg
cmUtdXNlcyBsb2dpYyBmcm9tIFBWIGRvbTAsIGluIHdoaWNoIFJBTSByYW5nZXMgbm90IGFz
c2lnbmVkIHRvDQo+IGRvbTAgYXJlIHJlLXVzZWQgYXMgc2NyYXRjaCBtZW1vcnkgdG8gbWFw
IGZvcmVpZ24gYW5kIGdyYW50IHBhZ2VzLiAgU3VjaA0KPiBsb2dpYyByZWxpZXMgb24gcmVw
b3J0aW5nIHRob3NlIHVucG9wdWxhdGVkIHJhbmdlcyBhcyBSQU0gdG8gTGludXgsIGFuZA0K
PiBtYXJrIHRoZW0gYXMgcmVzZXJ2ZWQuICBUaGlzIHdheSBMaW51eCBjcmVhdGVzIHRoZSB1
bmRlcmx5aW5nIHBhZ2UNCj4gc3RydWN0dXJlcyByZXF1aXJlZCBmb3IgbWV0YWRhdGEgbWFu
YWdlbWVudC4NCj4gDQo+IFN1Y2ggYXBwcm9hY2ggd29ya3MgZmluZSBvbiBQViBiZWNhdXNl
IHRoZSBpbml0aWFsIGJhbGxvb24gdGFyZ2V0IGlzDQo+IGNhbGN1bGF0ZWQgdXNpbmcgc3Bl
Y2lmaWMgWGVuIGRhdGEsIHRoYXQgZG9lc24ndCB0YWtlIGludG8gYWNjb3VudCB0aGUNCj4g
bWVtb3J5IHR5cGUgY2hhbmdlcyBkZXNjcmliZWQgYWJvdmUuICBIb3dldmVyIG9uIEhWTSBh
bmQgUFZIIHRoZSBpbml0aWFsDQo+IGJhbGxvb24gdGFyZ2V0IGlzIGNhbGN1bGF0ZWQgdXNp
bmcgZ2V0X251bV9waHlzcGFnZXMoKSwgYW5kIHRoYXQgZnVuY3Rpb24NCj4gZG9lcyB0YWtl
IGludG8gYWNjb3VudCB0aGUgdW5wb3B1bGF0ZWQgUkFNIHJlZ2lvbnMgdXNlZCBhcyBzY3Jh
dGNoIHNwYWNlDQo+IGZvciByZW1vdGUgZG9tYWluIG1hcHBpbmdzLg0KPiANCj4gVGhpcyBs
ZWFkcyB0byBQVkggZG9tMCBoYXZpbmcgYW4gaW5jb3JyZWN0IGluaXRpYWwgYmFsbG9vbiB0
YXJnZXQsIHdoaWNoDQo+IGNhdXNlcyBtYWxmdW5jdGlvbiAoZXhjZXNzaXZlIG1lbW9yeSBm
cmVlaW5nKSBvZiB0aGUgYmFsbG9vbiBkcml2ZXIgaWYgdGhlDQo+IGRvbTAgbWVtb3J5IHRh
cmdldCBpcyBsYXRlciBhZGp1c3RlZCBmcm9tIHRoZSB0b29sc3RhY2suDQo+IA0KPiBGaXgg
dGhpcyBieSB1c2luZyB4ZW5fcmVsZWFzZWRfcGFnZXMgdG8gYWNjb3VudCBmb3IgYW55IHBh
Z2VzIHRoYXQgYXJlIHBhcnQNCj4gb2YgdGhlIG1lbW9yeSBtYXAsIGJ1dCBhcmUgYWxyZWFk
eSB1bnBvcHVsYXRlZCB3aGVuIHRoZSBiYWxsb29uIGRyaXZlciBpcw0KPiBpbml0aWFsaXpl
ZC4gIFRoaXMgYWNjb3VudHMgZm9yIGFueSByZWdpb25zIHVzZWQgZm9yIHNjcmF0Y2ggcmVt
b3RlDQo+IG1hcHBpbmdzLg0KPiANCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gdW5pZnkg
UFYgd2l0aCBQVkgvSFZNIGd1ZXN0cyByZWdhcmRpbmcgdGhlIHVzYWdlIG9mDQo+IGdldF9u
dW1fcGh5c3BhZ2VzKCksIGFzIHRoYXQgYXZvaWRzIGhhdmluZyB0byBhZGQgZGlmZmVyZW50
IGxvZ2ljIGZvciBQViB2cw0KPiBQVkggaW4gYm90aCBiYWxsb29uX2FkZF9yZWdpb25zKCkg
YW5kIGFyY2hfeGVuX3VucG9wdWxhdGVkX2luaXQoKS4NCj4gDQo+IE11Y2ggbGlrZSBhNmFh
NGViOTk0ZWUsIHRoZSBjb2RlIGluIHRoaXMgY2hhbmdlc2V0IHNob3VsZCBoYXZlIGJlZW4g
cGFydCBvZg0KPiAzODYyMGZjNGU4OTMuDQo+IA0KPiBGaXhlczogYTZhYTRlYjk5NGVlICgn
eGVuL3g4NjogYWRkIGV4dHJhIHBhZ2VzIHRvIHVucG9wdWxhdGVkLWFsbG9jIGlmIGF2YWls
YWJsZScpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KDQoNCkp1ZXJnZW4NCg==
--------------DFwldr5icuCE5xC0vZVZc0lE
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

--------------DFwldr5icuCE5xC0vZVZc0lE--

--------------3hp3B7PBSRztWCO0n6K4eZQI--

--------------7EK588fpB7FEU4LWKCZllG5q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmfv4f0FAwAAAAAACgkQsN6d1ii/Ey9x
mAf/fcD0rEBbzoVnM7fYo6GTmWfGmmImgguikzh8EGpP0dYnHaa/rMKodf5Pblh9iNg9O+w/RHyi
8gi8gjM90gafJg84Sr77h2y0sAvvUrVMD/9h7p4UjmnmId39JkmAeuxRgBkIoqRDNX73ks1i17qx
VFJSddgloJS5FPUV9MoEDQ1veg+d+N15CTgxtM58ICRugnU8I/i4ZLChL2Z5ZjcB+HbWl6v/hSBU
T1b59MAEXhCxDYE0A0OWuZgqRk/UGT+2MV4N6LGYIu7vnUOu4LHnGUSY5fXvd7JCSmhdxml67hEV
tl3bZoQbCOC1IS7aWlLNWtHhnm/lYn+DZWG93hCdOw==
=wJb+
-----END PGP SIGNATURE-----

--------------7EK588fpB7FEU4LWKCZllG5q--

