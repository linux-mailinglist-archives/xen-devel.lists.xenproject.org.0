Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMTXJxW3t2mpUgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 08:53:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60A295DCA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 08:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255441.1550403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w22lo-0007jB-C1; Mon, 16 Mar 2026 07:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255441.1550403; Mon, 16 Mar 2026 07:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w22lo-0007h4-85; Mon, 16 Mar 2026 07:53:48 +0000
Received: by outflank-mailman (input) for mailman id 1255441;
 Mon, 16 Mar 2026 07:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6b3Y=BQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w22lm-0007gy-OR
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 07:53:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4241da30-210d-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 08:53:45 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b976536806cso492979266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 00:53:45 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b976cc2b902sm515317166b.29.2026.03.16.00.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 00:53:44 -0700 (PDT)
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
X-Inumbo-ID: 4241da30-210d-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773647625; x=1774252425; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AudLTosuD+ocYQ1uQtgEW+nhyiQn8yLaW0KwnVQnOHs=;
        b=TPcXcv03HZWhFJput/CpPQ9SOTpCqtZxfrYDe/S1+uTTH5N7YeKcp9GSdkVnf3FwSC
         7xliav1M4CmPWp2SkmwwfvdvGiLoJ34e82BJzBrgrr36n/mykchxN8oo4toF9ofTQDyt
         97a6y+7sGnEWhmfuQbvhJbIp+WJ7aUpUNiNxifvm3jPJXlumWQoThXzmhmSYU8DOR1+i
         P2bUZ4OwNjS8xt/SCXgahdruwh/Kx6i0UteHbGfq4BFjqCJXM1fYm7EMEPJDxdXt6VgN
         8rQ+fkp+yZAbe2IKouKI4/7UnJ2ogRUEcQqZKZPaQe82SpQvlD0bTbywrEpA6MjQsRj4
         NlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773647625; x=1774252425;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AudLTosuD+ocYQ1uQtgEW+nhyiQn8yLaW0KwnVQnOHs=;
        b=jqOmjvpthjZuFoLeNlmgwCqDpppglsiNBKD4kM+hgR12SFAmwnNE90AW4zV1pFMo/9
         DzkTdg7k+vwTdm3C9Qv1LNLVNNIY9/qpUinrRQFCWYpWKz9XexNGVaEWIFn6BoIaLqDl
         RarCdrIQ8hPL3abyvHVXA+zmHgS5rGmFx/+hBOuSQIcIhkSL+55PKA+IbS2ZSRO+ATx+
         HG85+q59FJ2tScn4mdNAE5oxMxAm3FXHGPbLPQjWVrYB4qkWWtPYbZSBGc67shYoo1fs
         //XwQPqbE2yRc68HTsGTn4Mlclvfhvp+7I91emBIVii0SYgV9fAWHE5FlQF6XedwPPPZ
         KEhw==
X-Gm-Message-State: AOJu0Ywi3hgz/9WCupgaPzNNAeFdsguZp5rcDPTKWsde8HetX7jY0/cD
	Z6HYHeg88ZJusijAsS7JxgDkZMTH20KFmElC/cPdrZfSd3v2U27aoVUIFp/hQCquPs8=
X-Gm-Gg: ATEYQzwaCFwHIYXpIVDzWACS9adBTbbT/9oLA0PgM53KmV1Xvri8JYFUntzGpIiPJ56
	4I7qtLsXiaqwbckCHQnPGHJe9y7ZKWh26BOayBoaA/VO6lr6P8UuXFTFaNEmVRVyxJVKbLTBREQ
	qIO3erbYgTFXOBdniu6eJhOVIfV9+ZOUEA+A9+7yMFgBLJ9cxof8XqeTZRCNadqPNRS9lRuP1GZ
	TXD69mIkUqSZ6SyzSmGVYdFcq67Y2vf+sP2HUQztLrirFyQ4MskDFlGGkUhBy5KLt4PJPOUvVYu
	NTaGLUvgOMwRL70P2Metf+E66Rv0Il78fjHY9mW/sXEsC+HA2ETJHCYoJXugsZeIC3TNFT4sI20
	ftxRXAYCrPvTrWBxxWK9cChvvvQeaAocPybq4JtqChmEnROPur0dqqpnuVsgKNzR6X1pN3J5HYo
	Wd6P36aJIWPHPRhsLRm5UdLQGSaZto+u++pQdWWORN8e56dHDIyvvutQN+fvYrQcI7Wez8DEtZc
	lgj79l0tt5GfNFDxWLnK1ofsW1RAhUiTyrU8l/D9KXfm6yGCobMA42m9Nq5WetX
X-Received: by 2002:a17:906:c109:b0:b97:bffb:b265 with SMTP id a640c23a62f3a-b97bffc38b1mr116533566b.36.1773647624983;
        Mon, 16 Mar 2026 00:53:44 -0700 (PDT)
Message-ID: <5709c947-9063-46df-b8cc-6f6d7cfe9910@suse.com>
Date: Mon, 16 Mar 2026 08:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tools/xenstored: add central quota check functions
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-3-jgross@suse.com> <abQm4h7nmKvYSSxl@l14>
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
In-Reply-To: <abQm4h7nmKvYSSxl@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NJiO5i11Gu0dwDRyE0cj05I8"
X-Spamd-Result: default: False [-1.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0E60A295DCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NJiO5i11Gu0dwDRyE0cj05I8
Content-Type: multipart/mixed; boundary="------------nAAXU0m0peaFQ1kCYmHslrA7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-ID: <5709c947-9063-46df-b8cc-6f6d7cfe9910@suse.com>
Subject: Re: [PATCH 02/11] tools/xenstored: add central quota check functions
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-3-jgross@suse.com> <abQm4h7nmKvYSSxl@l14>
In-Reply-To: <abQm4h7nmKvYSSxl@l14>

--------------nAAXU0m0peaFQ1kCYmHslrA7
Content-Type: multipart/mixed; boundary="------------z8J0GGE0Xrdcmss56Jd3ZFMs"

--------------z8J0GGE0Xrdcmss56Jd3ZFMs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMDMuMjYgMTY6MDEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MTo1OVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gQWRkIGNlbnRyYWwgZnVuY3Rpb25zIGZvciBjaGVja2luZyBhIHZhbHVlIChlaXRoZXIg
YW4gYWJzb2x1dGUgb25lIG9yDQo+PiB0aGUgY3VycmVudCBkb21haW4gdmFsdWUgcGx1cyBh
biBvZmZzZXQpIGFnYWluc3QgYSBzcGVjaWZpYyBxdW90YS4NCj4+DQo+PiBUaGlzIGlzIGlu
IHByZXBhcmF0aW9uIG9mIGludHJvZHVjaW5nIHBlci1kb21haW4gcXVvdGEuDQo+Pg0KPj4g
VGhlIHJlcXVpcmVkIGNoYW5nZXMgYWxsb3cgdG8gZHJvcCB0aGUgInVwZGF0ZSIgcGFyYW1l
dGVyIGZyb20NCj4+IGRvbWFpbl9uYmVudHJ5X2ZpeCgpLg0KPiANCj4gVGhpcyBwYXRjaCBj
aGFuZ2VzIHRoZSByZXR1cm4gdmFsdWUgb2YgZG9fd2F0Y2goKSwgZnJvbSBFMkJJRyB0byBF
Tk9TUEMsDQo+IGJ1dCB0aGF0J3Mgbm90IG1lbnRpb24uDQoNCkkgY2FuIGFkZCBhIHJlbWFy
ayB0byB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
eGVuc3RvcmVkL2RvbWFpbi5jIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+PiBpbmRl
eCBlNDUzYjMwNjFmLi4xZGY5MjY1YWQ1IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3Rv
cmVkL2RvbWFpbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWluLmMNCj4+IEBA
IC00OTAsMTAgKzUwOSw5IEBAIHN0YXRpYyBib29sIGRvbWFpbl9jYW5fcmVhZChzdHJ1Y3Qg
Y29ubmVjdGlvbiAqY29ubikNCj4+ICAgCWlmIChkb21haW5faXNfdW5wcml2aWxlZ2VkKGNv
bm4pKSB7DQo+PiAgIAkJaWYgKGRvbWFpbi0+d3JsX2NyZWRpdCA8IDApDQo+PiAgIAkJCXJl
dHVybiBmYWxzZTsNCj4+IC0JCWlmIChkb21haW4tPmFjY1tBQ0NfT1VUU1RdLnZhbCA+PSBo
YXJkX3F1b3Rhc1tBQ0NfT1VUU1RdLnZhbCkNCj4+ICsJCWlmIChkb21haW5fY2hlY2tfcXVv
dGFfYWRkKGRvbWFpbiwgQUNDX09VVFNULCAwKSkNCj4gDQo+IElzIHRoaXMgY2hhbmdlIGZp
eGluZyBhIHBvdGVudGlhbCBidWc/IEFzIG5vdyB3ZSBjaGVjayBpZiB0aGVyZSdzIGENCj4g
cXVvdGEgZm9yIE9VVFNULg0KDQpUaGlzIGlzIGp1c3QgY2hhbmdpbmcgaG93IHRoZSBxdW90
YSBpcyB0ZXN0ZWQuDQoNCj4gDQo+PiAgIAkJCXJldHVybiBmYWxzZTsNCj4+IC0JCWlmIChk
b21haW4tPmFjY1tBQ0NfTUVNXS52YWwgPj0gaGFyZF9xdW90YXNbQUNDX01FTV0udmFsICYm
DQo+PiAtCQkgICAgaGFyZF9xdW90YXNbQUNDX01FTV0udmFsKQ0KPj4gKwkJaWYgKGRvbWFp
bl9jaGVja19xdW90YV9hZGQoZG9tYWluLCBBQ0NfTUVNLCAwKSkNCj4+ICAgCQkJcmV0dXJu
IGZhbHNlOw0KPj4gICAJfQ0KPj4gICANCj4+IGRpZmYgLS1naXQgYS90b29scy94ZW5zdG9y
ZWQvd2F0Y2guYyBiL3Rvb2xzL3hlbnN0b3JlZC93YXRjaC5jDQo+PiBpbmRleCBiNjZhOWYx
YTM5Li4zNmU0ZDMzZjIyIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmVkL3dhdGNo
LmMNCj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlZC93YXRjaC5jDQo+PiBAQCAtMjIwLDggKzIy
MCw4IEBAIGludCBkb193YXRjaChjb25zdCB2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9u
ICpjb25uLCBzdHJ1Y3QgYnVmZmVyZWRfZGF0YSAqaW4pDQo+PiAgIAkJCXJldHVybiBFRVhJ
U1Q7DQo+PiAgIAl9DQo+PiAgIA0KPj4gLQlpZiAoZG9tYWluX3dhdGNoKGNvbm4pID4gaGFy
ZF9xdW90YXNbQUNDX1dBVENIXS52YWwpDQo+PiAtCQlyZXR1cm4gRTJCSUc7DQo+PiArCWlm
IChkb21haW5fY2hlY2tfcXVvdGFfYWRkKGNvbm4tPmRvbWFpbiwgQUNDX1dBVENILCAxKSkN
Cj4+ICsJCXJldHVybiBFTk9TUEM7DQo+IA0KPiBDaGFuZ2Ugb2YgcmV0dXJuIHZhbHVlIGhl
cmUgbm90IG1lbnRpb25uZWQsIGV2ZW4gaWYgaXQgbm93IGFsaWduZWQgd2l0aA0KPiB0aGUg
dmFsdWUgcmV0dXJuZWQgaW4gb3RoZXIgcGxhY2VzLg0KPiANCj4+ICAgDQo+PiAgIAl3YXRj
aCA9IGFkZF93YXRjaChjb25uLCB2ZWNbMF0sIHZlY1sxXSwgcmVsYXRpdmUsIGZhbHNlKTsN
Cj4+ICAgCWlmICghd2F0Y2gpDQo+IA0KPiBQYXRjaCBsb29rcyBmaW5lIHRvIG1lOg0KPiBS
ZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
DQoNClRoYW5rcw0KDQoNCkp1ZXJnZW4NCg==
--------------z8J0GGE0Xrdcmss56Jd3ZFMs
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------z8J0GGE0Xrdcmss56Jd3ZFMs--

--------------nAAXU0m0peaFQ1kCYmHslrA7--

--------------NJiO5i11Gu0dwDRyE0cj05I8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm3twgFAwAAAAAACgkQsN6d1ii/Ey/1
GQgAg5DVqG897rC2iHela59nLUrB1Pwp7/D9NkbnDH0FshxNU3qBZSC60zHAwTunAZPrSo3bRMCf
rBIyYtiVHUTpOjyPjwrHZMehdZHhcYRxJ4D/b6N73JjsD12kA57Bp5nVAi86isiceXejNOdMpVNY
LmbNkTHVTV46z+Q9a21vPhH21KYWakVuORk3QXgnaWziZD6Zj87lz3BVPkQh97hLFj7ClOl1RVDQ
czgXp6pds8C/ffqIUmpxWphstev32O2gMX7JjItrcGzf8NZzVfFJtJ8N/QH2ezSV8PK70P3/VRTW
SUkIe/ENjFulZ2UhhDIJGFHDKogBwqgSVsySgqTmRA==
=Xyy2
-----END PGP SIGNATURE-----

--------------NJiO5i11Gu0dwDRyE0cj05I8--

