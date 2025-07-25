Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F5B11897
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 08:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057331.1425254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufC7N-0005kM-1C; Fri, 25 Jul 2025 06:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057331.1425254; Fri, 25 Jul 2025 06:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufC7M-0005gr-TH; Fri, 25 Jul 2025 06:41:20 +0000
Received: by outflank-mailman (input) for mailman id 1057331;
 Fri, 25 Jul 2025 06:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugva=2G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ufC7L-0005gl-22
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 06:41:19 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59523288-6922-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 08:41:09 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ae3b336e936so345508366b.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 23:41:10 -0700 (PDT)
Received: from ?IPV6:2003:e5:8728:2b00:e047:1b8:d101:cf8e?
 (p200300e587282b00e04701b8d101cf8e.dip0.t-ipconnect.de.
 [2003:e5:8728:2b00:e047:1b8:d101:cf8e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f44df92sm222698266b.69.2025.07.24.23.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 23:41:08 -0700 (PDT)
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
X-Inumbo-ID: 59523288-6922-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753425669; x=1754030469; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bgR4qePvu+Ik+Z/q5Zn+qA7MlIhKK0yl2jjxbjI3Tl8=;
        b=VUtJfFSwYOA8KxcMEWvWQ6IhpA/PwAP0GWPwdjhg2Pa55NN5h21HpA8pv09VrJbY2r
         /pGvY9CNgOP6vuqjG+g8+xw2JTFuOFJQCrErECjn8JbiegU1pp/3hIhOpXJYuXhroLSe
         xcCpUkUGkv3GUrzqZP+j4RDb26fVAKH0/RVZIQL6gBfv95CVOsaXCZN0bDhw/JGxM0uW
         F0Qnc7uFYdAAFTBtK+K93PttvuYC2GRmmdHsoVYNki6OrwUbPUlIcsSphYlQl8Wxb55Y
         WwBnN9Zo3MNg7EMLMmGRiSzdmoPLEUQbklZTfzOu8VLTBhLN320Dt2/5CDnwmjzArh/h
         ZWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753425669; x=1754030469;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bgR4qePvu+Ik+Z/q5Zn+qA7MlIhKK0yl2jjxbjI3Tl8=;
        b=u4NxUbr8Ss3GtZ6BGAIt7PQvtUW3oxODHhzSvdo+wzXXBNqHnbVhOnQVhw9UhpgTOP
         y1UKIjmftk58ax6tS8vIqChDrdQSTO1sN4m9kl+hSYfUKtNpKrru8EqxHaGvObZ7IEoQ
         HiO4enXVGb/Aj21gU3K6pvaJs1XgL40YJZZPFwGWeijTRoUOrtVnG/T+2c97FibkdkIk
         BUPUCWx0VhDyLEyGqEdQQzof80jXiTSYgyGCZVcX/smdRj5RnOTS/Xr1CQRbGCj97A4a
         Nz/X6N4OcYtDyFtzJIASyg+IU24eVmwJgMWzseMfZmrp0JUt0rAonM+2KEujxo8SgLIs
         P/8A==
X-Forwarded-Encrypted: i=1; AJvYcCVYO3SA2hK4DFnwbjx3yggn2nc27NxDZui15YMUqDKR4bMGlWn8y2/FWWgSzFPEnkjk20iaOvhFqXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhBD4GXkOjFGpXKXb/yDYStoYuv3IHTd4+cqLQ4Ie7+JpNTxIz
	AV0dZIosdANdMQgugJpiO30Vc6yA/4+jfBwUoWwM9wGkwU3KopPgi6RSVPjkJFdZhyU=
X-Gm-Gg: ASbGnctJxbv2InN+9cmJbH9enWPMQWtc/JSq7sNKGhj+jf9I/9DHMT6vywphLSNI8fJ
	yBU4RZefD1kzMC5drSMiPHEBSy6zm7IAW9GFkcl/9B9qiKB/Z+NBMVKQpjIXVaNnCFVwjVdzO91
	QRtagyY+BxpKS3x/Hx13DDl5/WRoUGG6+S1CViwNpiHB0FalBiBDe8Yer98F/9LGuvDyvtjjMBp
	BNanq55nCQ0tKtM08ucwAEmW3/wwwHuNgKde7lZliv2b7heRFtFuJPrV8AFleGXpXDMbkSYTkh/
	AqLOXMbzPRjw5nCO7SZDzn1tJbqM3/Nkl3s//pvurZBWZY2Oki03xskyyh38jqWJuh+Cms7LwbD
	ll6e/TzJ2+XQkI4D0fLf3ferKOr0kDtqqtH1h+2/eQAT5Q5F2ZLp28AhGim6BP+sTs5FvbH0IIa
	MBEoe+he5tDZx4wt1VH0E3mPoXzIVL3sKC+ICUhkNpdpjP
X-Google-Smtp-Source: AGHT+IGzNd9WMbQ0F6T0XxB5qYq6z14vXOsFbc/AXjupXTEcVsqxgdUGnEz3uLkSJy/n/eSF4ESQ8w==
X-Received: by 2002:a17:906:9f90:b0:ade:4339:9367 with SMTP id a640c23a62f3a-af61ce92d56mr106557866b.26.1753425669296;
        Thu, 24 Jul 2025 23:41:09 -0700 (PDT)
Message-ID: <0f63f37d-112e-4267-b4a2-8ae740b2b3b2@suse.com>
Date: Fri, 25 Jul 2025 08:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] tools/xenstored: Add get_domain_evtchn() to find
 evtchn
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-7-jason.andryuk@amd.com>
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
In-Reply-To: <20250725022812.466897-7-jason.andryuk@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JwIzMYqmOEPzz0UiDFGijaYE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JwIzMYqmOEPzz0UiDFGijaYE
Content-Type: multipart/mixed; boundary="------------TqyfSRzHG5rsaHVut32YevaJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <0f63f37d-112e-4267-b4a2-8ae740b2b3b2@suse.com>
Subject: Re: [PATCH v4 06/12] tools/xenstored: Add get_domain_evtchn() to find
 evtchn
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-7-jason.andryuk@amd.com>
In-Reply-To: <20250725022812.466897-7-jason.andryuk@amd.com>

--------------TqyfSRzHG5rsaHVut32YevaJ
Content-Type: multipart/mixed; boundary="------------ndzn830U80zwYvHgT666vo4j"

--------------ndzn830U80zwYvHgT666vo4j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDcuMjUgMDQ6MjgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IEFkZCBhIGhlbHBl
ciB0byBsb29rdXAgdGhlIGV2ZW50IGNoYW5uZWwgZm9yIGEgZG9taWQuICBUaGlzIGhpZGVz
IHNvbWUNCj4gb2YgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gZG9tMCBhbmQgc3R1YmRvbSB4
ZW5zdG9yZWQuDQo+IA0KPiBJdCBoaWdobGlnaHRzIHRoZSBkaWZmZXJlbnQgbWVhbmluZ3Mg
YmV0d2VlbiBnZXRfeGVuYnVzX2V2dGNobigpIGluIGENCj4gc3R1YmRvbSwgd2hlcmUgaXQg
bG9va3MgdXAgZG9tMCdzIGV2ZW50IGNoYW5uZWwsIGFuZCBkb20wLCB3aGVyZSBpdA0KPiBs
b29rcyB1cCB0aGUgbG9jYWwgZXZlbnQgY2hhbm5lbC4NCj4gDQo+IFRoZSBkZWZhdWx0IHJl
dHVybiAwIHdpbGwgYmUgZmluZSBhcyBhbnkgb3RoZXIgYXV0by1pbnRyb2R1Y2VkIGRvbWFp
bg0KPiB3aWxsIG5lZWRzIHRoZSBldmVudCBjaGFubmVsIHBvcHVsYXRlZCBpbiB0aGUgZ3Jh
bnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYXNvbi5hbmRyeXVr
QGFtZC5jb20+DQo+IC0tLQ0KPiAgIHRvb2xzL3hlbnN0b3JlZC9kb21haW4uYyB8IDM4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5j
DQo+IGluZGV4IDEyNDFmOGM3M2UuLjFjNTIyNTRiYTggMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L3hlbnN0b3JlZC9kb21haW4uYw0KPiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMN
Cj4gQEAgLTEyNTEsMTIgKzEyNTEsNDEgQEAgY29uc3QgY2hhciAqZ2V0X2ltcGxpY2l0X3Bh
dGgoY29uc3Qgc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4pDQo+ICAgCXJldHVybiBjb25uLT5k
b21haW4tPnBhdGg7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAqIGRvbTAgeGVuc3RvcmVk
IChwb3NpeC5jKSB1c2VzIGdldF94ZW5idXNfZXZ0Y2huKCkgdG8gbG9va3VwIHdpdGgNCj4g
KyAqIFhFTlNUT1JFRF9QT1JUX0RFVi4NCj4gKyAqDQo+ICsgKiBtaW5pb3Mgc3R1YmRvbSB1
c2VzIGdldF94ZW5idXNfZXZ0Y2huKCkgdG8gbG9vayB1cCBkb20wJ3MgZXZlbnQgY2hhbm5l
bA0KPiArICogZnJvbSB0aGUgY29tbWFuZCBsaW5lICgtLWV2ZW50KS4gIFRoZSBzdHViZG9t
J3Mgb3duIGV2ZW50IGNoYW5uZWwgaXMNCj4gKyAqIHJldHVybmVkIGRpcmVjdGx5Lg0KPiAr
ICoNCj4gKyAqIEFueSBvdGhlciBleGlzdGluZyBkb21haW5zIGZyb20gZG9tMGxlc3MvSHlw
ZXJsYXVuY2ggd2lsbCBoYXZlDQo+ICsgKiB0aGUgZXZlbnQgY2hhbm5lbCBpbiB0aGUgeGVu
c3RvcmUgcGFnZSwgc28gbG9va3VwIGhlcmUgaXNuJ3QgbmVjZXNzYXJ5Lg0KPiArICogLS1l
dmVudCB3b3VsZCBub3QgYmUgc2V0LCBzbyBpdCB3b3VsZCBkZWZhdWx0IHRvIDAuDQo+ICsg
Ki8NCj4gK2V2dGNobl9wb3J0X3QgZ2V0X2RvbWFpbl9ldnRjaG4oZG9taWRfdCBkb21pZCkN
Cj4gK3sNCj4gKyNpZmRlZiBfX01JTklPU19fDQo+ICsJaWYgKGRvbWlkID09IHN0dWJfZG9t
aWQpIHsNCj4gKwkJcmV0dXJuIHhlbmJ1c19ldnRjaG47DQo+ICsJfSBlbHNlIGlmIChkb21p
ZCA9PSBwcml2X2RvbWlkKSB7DQo+ICsJCXJldHVybiBnZXRfeGVuYnVzX2V2dGNobigpOw0K
PiArCX0NCj4gKyNlbHNlDQo+ICsJaWYgKGRvbWlkID09IHhlbmJ1c19tYXN0ZXJfZG9taWQo
KSkgew0KPiArCQlyZXR1cm4gZ2V0X3hlbmJ1c19ldnRjaG4oKTsNCj4gKwl9DQo+ICsjZW5k
aWYNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQoNCkknZCBwcmVmZXIgdG8gaGF2
ZSAyIGdldF9kb21haW5fZXZ0Y2huKCkgdmFyaWFudHMsIG9uZSBpbiBwb3NpeC5jIGFuZA0K
b25lIGluIG1pbmlvcy5jLiBUaGlzIHdheSB5b3UgY2FuIGF2b2lkIHRoZSAjaWZkZWYuDQoN
Cj4gICB2b2lkIGRvbTBfaW5pdCh2b2lkKQ0KPiAgIHsNCj4gICAJZXZ0Y2huX3BvcnRfdCBw
b3J0Ow0KPiAgIAlzdHJ1Y3QgZG9tYWluICpkb20wOw0KPiAgIA0KPiAtCXBvcnQgPSBnZXRf
eGVuYnVzX2V2dGNobigpOw0KPiArCXBvcnQgPSBnZXRfZG9tYWluX2V2dGNobih4ZW5idXNf
bWFzdGVyX2RvbWlkKCkpOw0KPiAgIAlpZiAocG9ydCA9PSAtMSkNCj4gICAJCWJhcmZfcGVy
cm9yKCJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBkb20wIHBvcnQiKTsNCj4gICANCj4gQEAgLTEy
NzEsMTEgKzEzMDAsMTYgQEAgdm9pZCBzdHViZG9tX2luaXQodm9pZCkNCj4gICB7DQo+ICAg
I2lmZGVmIF9fTUlOSU9TX18NCj4gICAJc3RydWN0IGRvbWFpbiAqc3R1YmRvbTsNCj4gKwll
dnRjaG5fcG9ydF90IHBvcnQ7DQo+ICAgDQo+ICAgCWlmIChzdHViX2RvbWlkIDwgMCkNCj4g
ICAJCXJldHVybjsNCj4gICANCj4gLQlzdHViZG9tID0gaW50cm9kdWNlX2RvbWFpbihOVUxM
LCBzdHViX2RvbWlkLCB4ZW5idXNfZXZ0Y2huLCBmYWxzZSk7DQo+ICsJcG9ydCA9IGdldF9k
b21haW5fZXZ0Y2huKHN0dWJfZG9taWQpOw0KPiArCWlmIChwb3J0ID09IC0xKQ0KPiArCQli
YXJmX3BlcnJvcigiRmFpbGVkIHRvIGluaXRpYWxpemUgZG9tMCBwb3J0Iik7DQoNCnMvZG9t
MC9zdHViZG9tLw0KDQo+ICsNCj4gKwlzdHViZG9tID0gaW50cm9kdWNlX2RvbWFpbihOVUxM
LCBzdHViX2RvbWlkLCBwb3J0LCBmYWxzZSk7DQo+ICAgCWlmICghc3R1YmRvbSkNCj4gICAJ
CWJhcmZfcGVycm9yKCJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBzdHViZG9tIik7DQo+ICAgDQoN
Ckp1ZXJnZW4NCg==
--------------ndzn830U80zwYvHgT666vo4j
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------ndzn830U80zwYvHgT666vo4j--

--------------TqyfSRzHG5rsaHVut32YevaJ--

--------------JwIzMYqmOEPzz0UiDFGijaYE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmiDJwQFAwAAAAAACgkQsN6d1ii/Ey/+
Rgf/YnGkYCcwESqM8GOZpc7P2xR8NzuytzAt2dp/X2MwYD7ZW1h/m7Ca9s2nBJRFJFM9+aKZJEVw
AinhJcM0FDNirOGeBRWGQ8EPz6VzV5GvORdRMvdhI/PZ0YnRZ+0zqACgxLHAgGtOwTgwynV/rjcd
fLUVvrlmi4O43UfxwH6nTggI3SSuxktvUxzpjqRacbgszTxn2wESb0AvDotD6hG+8Lvo008ll1+k
tPc02hiaYLV2WiVO8wTSaO/0plyHqPC0yE1iPHCvlxDSr5T0Vrq/CqkGFhic3Ry70lsVRAvMunJ7
uQAfTzEIlE+ocAG9YL/PQWLxHG6A6+5twrUwpWEvoA==
=AVhe
-----END PGP SIGNATURE-----

--------------JwIzMYqmOEPzz0UiDFGijaYE--

