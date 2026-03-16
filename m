Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D/OD40huGmdZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:28:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9400629C56B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 16:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255636.1550538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w29rD-0001Dc-Pq; Mon, 16 Mar 2026 15:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255636.1550538; Mon, 16 Mar 2026 15:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w29rD-0001C5-Lo; Mon, 16 Mar 2026 15:27:51 +0000
Received: by outflank-mailman (input) for mailman id 1255636;
 Mon, 16 Mar 2026 15:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6b3Y=BQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w29rB-0001Bz-TZ
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 15:27:50 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae4fcf9b-214c-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 16:27:45 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b9795ca4e6dso359056566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 08:27:45 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b97b3f4bc31sm245305266b.20.2026.03.16.08.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 08:27:44 -0700 (PDT)
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
X-Inumbo-ID: ae4fcf9b-214c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773674865; x=1774279665; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cJkrp9pq6DJe33OGIuAmiRaPG/VeME2Suru45EBKzDE=;
        b=Pk3XTOlCi0lBgeRelnLEIPbaikbWBb1jV//aasbAIZOXUH8Z7q1XKaPHUvtXDlJGZ9
         u4AakG4ke1xE+8XOffWlDSilfn3x/k6NbEmGQv1FrIHLgOGq3RKO2xzvgHJSSpzNnkkV
         Hz62H0JY8XoYBf6dPuYC8vHXDsgwjQnbOoqVp16mytKJaueO9Vs5WffYedwIHzt9OC66
         CT/o/K+WRALCB2CRq4fJ4w0cUAj3kN/lRHNmTRsO84yb7+7EcpzrrJO1WMipkim/VzIx
         sGwHykeZRnpMyRB2kGdUxnOWyw9ev4MNMOZixm0xWKfPlAstD0fSkaMm2tKS5//+0lyi
         X/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674865; x=1774279665;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJkrp9pq6DJe33OGIuAmiRaPG/VeME2Suru45EBKzDE=;
        b=km+i1SRY+JQDDJEIdzv3F01lKdIJuseYhDwIRpH1bUu5dbtt/2PNDL1jk/G1DCpKI8
         5fSFLVorPboKVyGWvG2R0Caxp4wmPD6b9LYUquAs+s3Ntxb8Kdv7l7kwogJe2hB2fcgh
         YAxzJFIvgd0hc8/+swTG49V/iiVSEK0AcveMgBRgmDeWyO1gA3xILN0RNy1YnNG8iz70
         sy0JCByIlGaemvLQ1PzWPstjKTgVykxxF845Nx9rxK1IvhPZ5H2CdOhLKQcYJXurVdB+
         1z4gmGtpVqnKiQULdS24htRh/bcN0qWmAOAbD81yk3Wx8huNdB+M91LPnXQoqei+7ibB
         N9Ow==
X-Gm-Message-State: AOJu0YxZEwEgV7YzWV3cgVhJxsNpDLG/sCeX2mt195471mp/QnKPXGgI
	9jo8xkHNmJQi6TLz47cw5FFBV0hnLW6fD/JpRcyN1AAq8Nvgy1GWtjKh5eYMv+T5YCw=
X-Gm-Gg: ATEYQzz4b5gdSL50f0L88GXyZQWEemxrqe5KywfLHMUxX82DNj3huF9shuPPNPuQ6Hv
	9vMtPsQlbIE7p99SJzn7vF7CcNmel+KqDkj0DipnjVX+h+fjZJ5B1DASiLfl4w4tQ7NggKyvPMg
	vRdADX8o6jAdlFhamB72efCxASM6MLCbeRa7Hm6dxM97KoiWac8ff3iMCSu8dlo75938yJ3brCS
	iwq0UBhE1QYzE5yGJxc1LFEILX8VJRNCMeUG9CgDR+0NUw37gFMAA/GQeeHAqz8QaZ47AndRiop
	z7Ro0IL+MbsQHrgC3MoHQyUJVMXn2YMdpJABrMXv8bpzZOWC5Vs2Y7Rl1T4Y7fmI2iT/m4wGQBj
	EKwEN7m4wX+z+US5Lzp/zNDwUJpSpSMBNiVyEJV8hHShiud9KCsQ8b5b/VH9bc2BPe3f50n1ONK
	sxzLyKK11MIehCFIcY6rvfmjFdLfs6cpYI38/x3mcs/moZfHGu+hS2WUmMzw4OmBvc/AT9nHMaD
	i1L07ZoVuZMbaGj55U2vTNK6dqq15CMlBevUxEF7MuI77CZ7ZQuOg==
X-Received: by 2002:a17:907:2d90:b0:b97:b03d:d264 with SMTP id a640c23a62f3a-b97b03dd8d2mr322135266b.4.1773674864423;
        Mon, 16 Mar 2026 08:27:44 -0700 (PDT)
Message-ID: <b0c02185-1ce0-416f-8bff-34b57de57e8f@suse.com>
Date: Mon, 16 Mar 2026 16:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] tools/xenstored: implement the GET/SET_QUOTA
 commands
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-8-jgross@suse.com> <abgc1Azehzw_m9Ff@l14>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
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
In-Reply-To: <abgc1Azehzw_m9Ff@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uMGZF4063yCugDi0LfUFJzYh"
X-Spamd-Result: default: False [-2.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9400629C56B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uMGZF4063yCugDi0LfUFJzYh
Content-Type: multipart/mixed; boundary="------------wVkoSJuDoqeUhvQH39Md02eL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-ID: <b0c02185-1ce0-416f-8bff-34b57de57e8f@suse.com>
Subject: Re: [PATCH 07/11] tools/xenstored: implement the GET/SET_QUOTA
 commands
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-8-jgross@suse.com> <abgc1Azehzw_m9Ff@l14>
In-Reply-To: <abgc1Azehzw_m9Ff@l14>

--------------wVkoSJuDoqeUhvQH39Md02eL
Content-Type: multipart/mixed; boundary="------------IrHlqgskTrdNRN77Ax9QwgiV"

--------------IrHlqgskTrdNRN77Ax9QwgiV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjYgMTY6MDgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MjowNFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMgYi90b29scy94ZW5zdG9y
ZWQvY29yZS5jDQo+PiBpbmRleCA4YTA2YjM1ODA4Li5lMjgzZDQ3MTg0IDEwMDY0NA0KPj4g
LS0tIGEvdG9vbHMveGVuc3RvcmVkL2NvcmUuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmVk
L2NvcmUuYw0KPj4gQEAgLTIwMzQsNiArMjAzNCwxMCBAQCBzdGF0aWMgc3RydWN0IHsNCj4+
ICAgCSAgICB7ICJHRVRfRkVBVFVSRSIsICAgZG9fZ2V0X2ZlYXR1cmUsICBYU19GTEFHX1BS
SVYgfSwNCj4+ICAgCVtYU19TRVRfRkVBVFVSRV0gICAgICAgPQ0KPj4gICAJICAgIHsgIlNF
VF9GRUFUVVJFIiwgICBkb19zZXRfZmVhdHVyZSwgIFhTX0ZMQUdfUFJJViB9LA0KPj4gKwlb
WFNfR0VUX1FVT1RBXSAgICAgICAgID0NCj4+ICsJICAgIHsgIkdFVF9RVU9UQSIsICAgICBk
b19nZXRfcXVvdGEsICAgIFhTX0ZMQUdfUFJJViB9LA0KPj4gKwlbWFNfU0VUX1FVT1RBXSAg
ICAgICAgID0NCj4+ICsJICAgIHsgIlNFVF9RVU9UQSIsICAgICBkb19zZXRfcXVvdGEsICAg
IFhTX0ZMQUdfUFJJViB9LA0KPj4gICB9Ow0KPj4gICANCj4+ICAgc3RhdGljIGNvbnN0IGNo
YXIgKnNvY2ttc2dfc3RyaW5nKGVudW0geHNkX3NvY2ttc2dfdHlwZSB0eXBlKQ0KPj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBiL3Rvb2xzL3hlbnN0b3JlZC9k
b21haW4uYw0KPj4gaW5kZXggOGU1MjM1MTY5NS4uYzBiYzhhM2ViNyAxMDA2NDQNCj4+IC0t
LSBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmVk
L2RvbWFpbi5jDQo+PiBAQCAtMTM2Myw2ICsxMzYzLDExMiBAQCBzdGF0aWMgYm9vbCBwYXJz
ZV9xdW90YV9uYW1lKGNvbnN0IGNoYXIgKm5hbWUsIHVuc2lnbmVkIGludCAqcWlkeCwNCj4+
ICAgCXJldHVybiB0cnVlOw0KPj4gICB9DQo+PiAgIA0KPj4gK2ludCBkb19nZXRfcXVvdGEo
Y29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+ICsJCSBzdHJ1
Y3QgYnVmZmVyZWRfZGF0YSAqaW4pDQo+PiArew0KPj4gKwljb25zdCBjaGFyICp2ZWNbMl07
DQo+PiArCXVuc2lnbmVkIGludCBuX3BhcnM7DQo+PiArCXVuc2lnbmVkIGludCBkb21pZDsN
Cj4+ICsJdW5zaWduZWQgaW50IHE7DQo+PiArCXVuc2lnbmVkIGludCBpZHg7DQo+PiArCWNo
YXIgKnJlc3A7DQo+PiArCWNvbnN0IGNoYXIgKm5hbWU7DQo+PiArCWNvbnN0IHN0cnVjdCBx
dW90YSAqcXVvdGE7DQo+PiArCWNvbnN0IHN0cnVjdCBkb21haW4gKmRvbWFpbjsNCj4+ICsN
Cj4+ICsJbl9wYXJzID0gZ2V0X3N0cmluZ3MoaW4sIHZlYywgQVJSQVlfU0laRSh2ZWMpKTsN
Cj4+ICsNCj4+ICsJaWYgKG5fcGFycyA+IDIpDQo+PiArCQlyZXR1cm4gRUlOVkFMOw0KPj4g
Kw0KPj4gKwlpZiAobl9wYXJzID09IDApIHsNCj4+ICsJCXJlc3AgPSB0YWxsb2NfYXNwcmlu
dGYoY3R4LCAiJXMiLCAiIik7DQo+IA0KPiBUaGlzIGNvdWxkIGJlIHdyaXR0ZW4gd2l0aCB0
YWxsb2Nfc3RyZHVwKCkgaW5zdGVhZCwgc2luY2UgdGhlcmUncyBubw0KPiBmb3JtYXR0aW5n
IGludm9sdmUuDQoNClJpZ2h0Lg0KDQo+IA0KPj4gKwkJaWYgKCFyZXNwKQ0KPj4gKwkJCXJl
dHVybiBFTk9NRU07DQo+PiArCQlmb3IgKHEgPSAwOyBxIDwgQUNDX047IHErKykgew0KPj4g
KwkJCWlmICghcXVvdGFfYWRtW3FdLm5hbWUpDQo+PiArCQkJCWNvbnRpbnVlOw0KPj4gKwkJ
CWlmIChxdW90YXNbcV0udmFsW1FfSURYX0hBUkRdICE9IFFfVkFMX0RJU0FCTEVEKSB7DQo+
IA0KPiBIYXZpbmcgc2V0IGludGVybmFsbHkgYSB2YWx1ZSBvZiBRX1ZBTF9ESVNBQkxFRCwg
ZG9lcyBpdCBtZWFuIHRoZSBuYW1lZA0KPiBxdW90YSBpcyB1bnN1cHBvcnRlZD8NCg0KWWVz
LiBSaWdodCBub3cgYWxsIGhhcmQgcXVvdGEgYXJlIHN1cHBvcnRlZCBhbmQgb25seSBvbmUg
c29mdCBxdW90YQ0KaXMgc3VwcG9ydGVkLg0KDQo+IA0KPj4gKwkJCQlyZXNwID0gdGFsbG9j
X2FzcHJpbnRmX2FwcGVuZChyZXNwLCAiJXMlcyIsDQo+PiArCQkJCQkqcmVzcCA/ICIgIiA6
ICIiLCBxdW90YV9hZG1bcV0ubmFtZSk7DQo+PiArCQkJCWlmICghcmVzcCkNCj4+ICsJCQkJ
CXJldHVybiBFTk9NRU07DQo+PiArCQkJfQ0KPj4gKwkJCWlmIChxdW90YXNbcV0udmFsW1Ff
SURYX1NPRlRdICE9IFFfVkFMX0RJU0FCTEVEKSB7DQo+PiArCQkJCXJlc3AgPSB0YWxsb2Nf
YXNwcmludGZfYXBwZW5kKHJlc3AsICIlc3NvZnQtJXMiLA0KPj4gKwkJCQkJKnJlc3AgPyAi
ICIgOiAiIiwgcXVvdGFfYWRtW3FdLm5hbWUpOw0KPj4gKwkJCQlpZiAoIXJlc3ApDQo+PiAr
CQkJCQlyZXR1cm4gRU5PTUVNOw0KPj4gKwkJCX0NCj4+ICsJCX0NCj4+ICsJfSBlbHNlIHsN
Cj4+ICsJCWlmIChuX3BhcnMgPT0gMSkgew0KPj4gKwkJCXF1b3RhID0gcXVvdGFzOw0KPj4g
KwkJCW5hbWUgPSB2ZWNbMF07DQo+PiArCQl9IGVsc2Ugew0KPj4gKwkJCWRvbWlkID0gYXRv
aSh2ZWNbMF0pOw0KPiANCj4gU2hhbGwgd2UgY2hlY2sgdGhhdCB2ZWNbMF0gYWN0dWFsbHkg
Y29udGFpbiBhIHBsYXVzaWJsZSBkb21pZD8gKEFuDQo+IGludGVnZXIgYmV0d2VlbiAwLi42
NTUzNSkuIFJpZ2h0IG5vdywgdGhpcyBhY2NlcHQgZXZlcnl0aGluZywgYW5kIHdvdWxkDQo+
IHJldHVybiAwIGlmIHRoZXJlJ3Mgbm90IGEgc2luZ2xlIGRpZ2l0Lg0KDQpJIGhhdmUgZm9s
bG93ZWQgdGhlIHBhdHRlcm4gdXNlZCBpbiBvdGhlciBwbGFjZXMgd2hlcmUgYSBkb21pZCBp
cyBleHBlY3RlZC4NCg0KSW4gdGhlIGVuZCBub3RoaW5nIHdpbGwgcmVhbGx5IGJyZWFrLg0K
DQpBbnkgaW50ZWdlciBub3QgYmVpbmcgYSBkb21pZCB3aWxsIHJlc3VsdCBpbiBFTk9FTlQs
IHdoaWxlIHRoZSBjYXNlIG9mIG5vdA0KYSBkaWdpdCBpcyBhIGJ1ZyBpbiBwcml2aWxlZ2Vk
IHNvZnR3YXJlIChkb21pZHMgY2FuIGJlIHNwZWNpZmllZCBieSBkb20wDQpvbmx5KS4NCg0K
PiANCj4+ICsJCQlkb21haW4gPSBmaW5kX29yX2FsbG9jX2V4aXN0aW5nX2RvbWFpbihkb21p
ZCk7DQo+PiArCQkJaWYgKCFkb21haW4pDQo+PiArCQkJCXJldHVybiBFTk9FTlQ7DQo+PiAr
CQkJcXVvdGEgPSBkb21haW4tPmFjYzsNCj4+ICsJCQluYW1lID0gdmVjWzFdOw0KPj4gKwkJ
fQ0KPj4gKw0KPj4gKwkJaWYgKHBhcnNlX3F1b3RhX25hbWUobmFtZSwgJnEsICZpZHgpKQ0K
Pj4gKwkJCXJldHVybiBFSU5WQUw7DQo+PiArDQo+PiArCQlyZXNwID0gdGFsbG9jX2FzcHJp
bnRmKGN0eCwgIiV1IiwgcXVvdGFbcV0udmFsW2lkeF0pOw0KPiANCj4gV2h5IGRvIHdlIHJl
dHVybiA0Mjk0OTY3Mjk1IGZvciBkaXNhYmxlZCBxdW90YSBjaGVjayB3aGVuIHRoZSBzcGVj
IHNheQ0KPiB0byByZXR1cm4gIjAiIHdoZW4gYSBxdW90YSBjaGVjayBpcyBkaXNhYmxlZD8g
VGhhdCBpcyBmb3IgcXVvdGEgbmFtZXMNCj4gdGhhdCBhcmUgc3VwcG9zZWQgdG8gYmUgbm90
IHN1cHBvcnRlZCAoaWYgd2UgYXNrICJHRVRfUVVPVEEiIGZpcnN0KS4NCg0KcGFyc2VfcXVv
dGFfbmFtZSgpIHNob3VsZCBoYXZlIHJldHVybmVkIHRydWUgaW4gdGhpcyBjYXNlLCBzbyBF
SU5WQUwgc2hvdWxkDQpiZSByZXR1cm5lZC4NCg0KV2lsbCBmaXggdGhhdC4NCg0KPiANCj4+
ICsJCWlmICghcmVzcCkNCj4+ICsJCQlyZXR1cm4gRU5PTUVNOw0KPj4gKwl9DQo+PiArDQo+
PiArCXNlbmRfcmVwbHkoY29ubiwgWFNfR0VUX1FVT1RBLCByZXNwLCBzdHJsZW4ocmVzcCkg
KyAxKTsNCj4+ICsNCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK2ludCBkb19z
ZXRfcXVvdGEoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+
ICsJCSBzdHJ1Y3QgYnVmZmVyZWRfZGF0YSAqaW4pDQo+PiArew0KPj4gKwljb25zdCBjaGFy
ICp2ZWNbM107DQo+PiArCXVuc2lnbmVkIGludCBuX3BhcnM7DQo+PiArCXVuc2lnbmVkIGlu
dCBkb21pZDsNCj4+ICsJdW5zaWduZWQgaW50IHE7DQo+PiArCXVuc2lnbmVkIGludCBpZHg7
DQo+PiArCWNvbnN0IGNoYXIgKm5hbWU7DQo+PiArCXVuc2lnbmVkIGludCB2YWw7DQo+PiAr
CXN0cnVjdCBxdW90YSAqcXVvdGE7DQo+PiArCXN0cnVjdCBkb21haW4gKmRvbWFpbjsNCj4+
ICsNCj4+ICsJbl9wYXJzID0gZ2V0X3N0cmluZ3MoaW4sIHZlYywgQVJSQVlfU0laRSh2ZWMp
KTsNCj4+ICsNCj4+ICsJaWYgKG5fcGFycyA8IDIgfHwgbl9wYXJzID4gMykNCj4+ICsJCXJl
dHVybiBFSU5WQUw7DQo+PiArDQo+PiArCWlmIChuX3BhcnMgPT0gMikgew0KPj4gKwkJcXVv
dGEgPSBxdW90YXM7DQo+PiArCQluYW1lID0gdmVjWzBdOw0KPj4gKwkJdmFsID0gYXRvaSh2
ZWNbMV0pOw0KPiANCj4gV2Ugc2hvdWxkIGNoZWNrIHRoYXQgdmVjWzFdIGlzIGEgdmFsaWQg
cXVvdGEgdmFsdWUsIGFuZCBhbHNvIG5vdCBhbg0KPiBpbnRlcm5hbCB2YWx1ZS4gT3RoZXJ3
aXNlLCB3ZSBjYW4ganVzdCBoYXZlICItMSIgb24gdGhlIHdpcmUsIGFuZCBoYXZlDQo+IHVu
ZXhwZWN0ZWQgY2hhbmdlcyBmb3IgZXhhbXBsZS4gT25seSAiMCIgaXMgZG9jdW1lbnRlZCBh
cyBhIHF1b3RhIGJlZW4NCj4gZGlzYWJsZWQsICItMSIgb3IgIjQyOTQ5NjcyOTUiIGlzbid0
Lg0KDQpSaWdodCwgSSdsbCBjaGVjayBmb3IgdmFsICE9IFFfVkFMX0RJU0FCTEVELg0KDQo+
IA0KPj4gKwl9IGVsc2Ugew0KPj4gKwkJZG9taWQgPSBhdG9pKHZlY1swXSk7DQo+PiArCQlk
b21haW4gPSBmaW5kX29yX2FsbG9jX2V4aXN0aW5nX2RvbWFpbihkb21pZCk7DQo+PiArCQlp
ZiAoIWRvbWFpbikNCj4+ICsJCQlyZXR1cm4gRU5PRU5UOw0KPj4gKwkJcXVvdGEgPSBkb21h
aW4tPmFjYzsNCj4+ICsJCW5hbWUgPSB2ZWNbMV07DQo+PiArCQl2YWwgPSBhdG9pKHZlY1sy
XSk7DQo+PiArCX0NCj4+ICsNCj4+ICsJaWYgKHBhcnNlX3F1b3RhX25hbWUobmFtZSwgJnEs
ICZpZHgpKQ0KPj4gKwkJcmV0dXJuIEVJTlZBTDsNCj4+ICsNCj4+ICsJcXVvdGFbcV0udmFs
W2lkeF0gPSB2YWw7DQo+PiArDQo+PiArCXNlbmRfYWNrKGNvbm4sIFhTX1NFVF9RVU9UQSk7
DQo+PiArDQo+PiArCXJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIGludCBj
bG9zZV94Z3RfaGFuZGxlKHZvaWQgKl9oYW5kbGUpDQo+PiAgIHsNCj4+ICAgCXhlbmdudHRh
Yl9jbG9zZSgqKHhlbmdudHRhYl9oYW5kbGUgKiopX2hhbmRsZSk7DQo+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5oIGIvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5o
DQo+PiBpbmRleCA2MmNlM2IzMTY2Li42YTA2YjBkMWFmIDEwMDY0NA0KPj4gLS0tIGEvdG9v
bHMveGVuc3RvcmVkL2RvbWFpbi5oDQo+PiArKysgYi90b29scy94ZW5zdG9yZWQvZG9tYWlu
LmgNCj4+IEBAIC05Myw2ICs5MywxNCBAQCBpbnQgZG9fZ2V0X2ZlYXR1cmUoY29uc3Qgdm9p
ZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+ICAgaW50IGRvX3NldF9mZWF0
dXJlKGNvbnN0IHZvaWQgKmN0eCwgc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sDQo+PiAgIAkJ
ICAgc3RydWN0IGJ1ZmZlcmVkX2RhdGEgKmluKTsNCj4+ICAgDQo+PiArLyogR2V0IHF1b3Rh
IG5hbWVzIG9yIHZhbHVlICovDQo+IA0KPiBUaGlzIGNvdWxkIHNheSAiaW1wbGVtZW50IEdF
VF9RVU9UQSIgb3Igc29tZXRoaW5nIGluc3RlYWQuIEJ1dCBhDQo+IGNvbW1lbnQgaGVyZSBp
c24ndCBnb2luZyB0byBnaXZlIG11Y2ggdmFsdWUgZm9yIGludGVybmFsIGZ1bmN0aW9ucy4N
Cg0KSWYgbm9ib2R5IG9iamVjdHMgSSdsbCBkcm9wIHRoZSBjb21tZW50Lg0KDQo+IA0KPj4g
K2ludCBkb19nZXRfcXVvdGEoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAq
Y29ubiwNCj4+ICsJCSBzdHJ1Y3QgYnVmZmVyZWRfZGF0YSAqaW4pOw0KPj4gKw0KPj4gKy8q
IFNldCBxdW90YSB2YWx1ZSAqLw0KPj4gK2ludCBkb19zZXRfcXVvdGEoY29uc3Qgdm9pZCAq
Y3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+ICsJCSBzdHJ1Y3QgYnVmZmVyZWRf
ZGF0YSAqaW4pOw0KPj4gKw0KPj4gICB2b2lkIGRvbWFpbl9lYXJseV9pbml0KHZvaWQpOw0K
Pj4gICB2b2lkIGRvbWFpbl9pbml0KGludCBldnRmZCk7DQo+PiAgIHZvaWQgaW5pdF9kb21h
aW5zKGJvb2wgbGl2ZV91cGRhdGUpOw0KDQpUaGFua3MsDQoNCg0KSnVlcmdlbg0K
--------------IrHlqgskTrdNRN77Ax9QwgiV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------IrHlqgskTrdNRN77Ax9QwgiV--

--------------wVkoSJuDoqeUhvQH39Md02eL--

--------------uMGZF4063yCugDi0LfUFJzYh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm4IW8FAwAAAAAACgkQsN6d1ii/Ey/p
ZAf/Z9tO0KcVojJ/PUiDvkDwJXCAYnwqDMzmEy5c/38adX9WoibAVbZQGJb9XtQmSFbwQwAiF4x3
qiwYApbEQtvETl+41Ib4ipAR2rK0FjhlSnHC84baPymNEwT0ARjfi0Y6DKS+ia+xsTW2tnMxfhhx
cPsLi3rD7oC6yWtC1Wgfs+iWIPXcD8/d4J3mdxRhf2+rVAYcJQs+3kO62amnPN1QYrSCU8M1yTsK
B31tOmWdxRs8Crh6ruNGvHJxKW3DV6EodTHBLm5IkrX4iCDP2a/7xnrWt6/lW9QvJyk8YLCOLAT5
B8FJkXUmDZF3M1r4796t7PNpWq3pJs0nzrBaJSAg4w==
=pAES
-----END PGP SIGNATURE-----

--------------uMGZF4063yCugDi0LfUFJzYh--

