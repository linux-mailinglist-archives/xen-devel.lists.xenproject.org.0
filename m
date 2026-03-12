Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEWMHZTEsmmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:50:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC83272E69
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252401.1549094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gPi-0004Z8-QA; Thu, 12 Mar 2026 13:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252401.1549094; Thu, 12 Mar 2026 13:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0gPi-0004Xf-Ld; Thu, 12 Mar 2026 13:49:22 +0000
Received: by outflank-mailman (input) for mailman id 1252401;
 Thu, 12 Mar 2026 13:49:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0gPh-0004XZ-2e
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 13:49:21 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 447ab8d4-1e1a-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 14:49:19 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b96f02b4329so167759666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 06:49:19 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9736e2ca31sm103355166b.37.2026.03.12.06.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 06:49:18 -0700 (PDT)
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
X-Inumbo-ID: 447ab8d4-1e1a-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773323359; x=1773928159; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XQnM73uK5SUOCMzPiJWpKm6VsOp+n8sXGISqkUzLwcw=;
        b=McOxHWbTb7wLw86KXR/zdv1uuuANGWzR+o+sjGHVJ0mjkbAwNZnTu+9yTWuCcCgaVP
         1g+jDYKB7FVZBj8+O0bvpZH5JjM2ZT1o7sregWMKvvqybgLefoKEI4K34SeKDlLOsdO2
         l0axXpbtvuLdgCI0gtqutbFzSHPwb3sriJ+fgDYB/cMnar11H+LWkNO0f+mhz1daeHso
         Ll4OSi8hR1G33YZtyVsLSzjNpvmNs5yDcKf3CSstKTBuKwC7Y1XRsKoy7+qUUriIHVQh
         mI4G+vYcW8Poso2mzMvXZi3m0A1IwO6MyxR0PERv8GWHjHmxH7QAVRS1SPOJtUKtf0XT
         DKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323359; x=1773928159;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQnM73uK5SUOCMzPiJWpKm6VsOp+n8sXGISqkUzLwcw=;
        b=KqwnyEmwJx8Z/48LcCXcKoh12BwRDZTVlI5/EcDzVsKOQk4tz94BchVFttFjIGSNlK
         2tyiqt/DTpljFA8Hoi+2Lp8kSHeCIExDG1GyUJbnk7aoLZ2OFwrIAbuIQuzhLV+B4U1A
         IC+GjczjxhGFYuwikMjKT+Sj1dswrlIXsfE+t8dD6nbijrvbINJfMOFW6YFbpLee3dhq
         8sMVA1dfAXtVFpbqc4WEFRHNVn7skFPwoVZXX4eshUB/GbCx9qWcj6W/CsbqiaEtC5As
         WiQ1jzGM4NEaGmJsTBO4Tjawm/Y8RnQkdMzZI8eea78sIzsnSlayzoxzbU18zWg9BocP
         Y2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUsBoKwagk79NBgrGRa7O3lyq8gHQwSQwubwxWXOnm9M1sLxxoV3GqphDJ4CKywEqjbZTEFS824FC0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzjgk24Pi7MKWg/9x9Qbwak6j1qVgl3ZWdAaIwS3C5nKqWFsSPa
	61pPK+TU/+wYO2HofO7PHIYnjesz8WeuBTR1k567m2BDFwA99bdpm5JvNZ5kVAksAog=
X-Gm-Gg: ATEYQzwea2mpxhGU6lOZl2ILAnuk9K8LTySqXN31uu1SiihB+4KWM6vvZLfiO64dZw/
	0WpjNXKBVbNG8cgCts5VzLYQnqwDGTMmA4g9c/O+zdHhcObMy/japk2PopIiknBlFjdgCateRV2
	MyH9TchL9ReIH8K5cxHI9PUb6EAsSl4STprxA+1t4RCXJDPl4Glg+apHT9fCPLITTnFgBtcG2xm
	2eoLRTO5yvcwoTMx45Jl+BcZG7Y8z7xq1Xus4sLZkiL3Dxa9ABSTRWsK57WYwzUhMX6X5YKHr8v
	5sDAK1Qz5PCfj5tIunhfH1f//cZWwwyUQqcJdJ4YzzWsx5bj8kLf9+K9Odh5sDLoAbbVpKLk0tr
	5rnAx/uflYt46vjncXuY2Hk4oRLALTt0sjXufpyJ3uQTBltkgJ1fdak383be6gbVi9Yab/zgJJ8
	T7eltm2ushrZ7ywrvfSpRQB9n1tnemXfyw/QQPtv+qVPolWGzmhWiFmoiAgbCOD+7auUF3Ap9kc
	RwqtsveaxAOSV0HjVEY2r5p8iYO8/B5HnyObHASlPjfDpF1GlCdEuUWaBz1ugKf
X-Received: by 2002:a17:907:70b:b0:b94:1224:c605 with SMTP id a640c23a62f3a-b972e1b1347mr331116166b.19.1773323358559;
        Thu, 12 Mar 2026 06:49:18 -0700 (PDT)
Message-ID: <fb001622-e2b2-490c-ab19-f56a36304baa@suse.com>
Date: Thu, 12 Mar 2026 14:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] docs: add man page for xenstore-rm
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-4-jgross@suse.com>
 <0748a784-eaf0-47d9-b683-067c28eeb44c@citrix.com>
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
In-Reply-To: <0748a784-eaf0-47d9-b683-067c28eeb44c@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hAtZdAzSVGSEgSdwKB0B0LQ0"
X-Spamd-Result: default: False [-2.37 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:email,xenproject.org:url,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: CCC83272E69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hAtZdAzSVGSEgSdwKB0B0LQ0
Content-Type: multipart/mixed; boundary="------------mEwUuV7lKvjhYdm1DdoQZUYW";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <fb001622-e2b2-490c-ab19-f56a36304baa@suse.com>
Subject: Re: [PATCH 3/4] docs: add man page for xenstore-rm
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-4-jgross@suse.com>
 <0748a784-eaf0-47d9-b683-067c28eeb44c@citrix.com>
In-Reply-To: <0748a784-eaf0-47d9-b683-067c28eeb44c@citrix.com>

--------------mEwUuV7lKvjhYdm1DdoQZUYW
Content-Type: multipart/mixed; boundary="------------vxLnf8KexsL7jOqVo8i2LW5n"

--------------vxLnf8KexsL7jOqVo8i2LW5n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjYgMTQ6MjIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEyLzAzLzIw
MjYgMTI6MjIgcG0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBUaGVyZSBpcyBubyBtYW4g
cGFnZSBmb3IgeGVuc3RvcmUtcm0sIGFkZCBpdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+ICAgZG9jcy9tYW4v
eGVuc3RvcmUtcm0uMS5wb2QgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykNCj4+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRvY3MvbWFuL3hlbnN0b3JlLXJtLjEucG9kDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Rv
Y3MvbWFuL3hlbnN0b3JlLXJtLjEucG9kIGIvZG9jcy9tYW4veGVuc3RvcmUtcm0uMS5wb2QN
Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi5hODViOTcx
MTEzDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9kb2NzL21hbi94ZW5zdG9yZS1ybS4x
LnBvZA0KPj4gQEAgLTAsMCArMSwyNCBAQA0KPj4gKz1oZWFkMSBOQU1FDQo+PiArDQo+PiAr
eGVuc3RvcmUtcm0gLSByZW1vdmUgWGVuc3RvcmUga2V5cw0KPj4gKw0KPj4gKz1oZWFkMSBT
WU5PUFNJUw0KPj4gKw0KPj4gK0I8eGVuc3RvcmUtcm0+IFtJPE9QVElPTj5dLi4uIFtJPFBB
VEg+XS4uLg0KPj4gKw0KPj4gKz1oZWFkMSBERVNDUklQVElPTg0KPj4gKw0KPj4gK1JlbW92
ZSBvbmUgb3IgbW9yZSBYZW5zdG9yZSBCPFBBVEg+cy4NCj4+ICsNCj4+ICs9b3Zlcg0KPj4g
Kw0KPj4gKz1pdGVtIEI8LXQ+DQo+PiArDQo+PiArVGlkeSB1cCBYZW5zdG9yZSBrZXlzIHdo
aWNoIGdvdCBhbGwgY2hpbGRyZW4gcmVtb3ZlZC4NCj4+ICsNCj4+ICs9YmFjaw0KPj4gKw0K
Pj4gKz1oZWFkMSBCVUdTDQo+PiArDQo+PiArU2VuZCBidWdzIHRvIHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZywgc2VlDQo+PiAraHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3Jn
L3dpa2kvUmVwb3J0aW5nX0J1Z3NfYWdhaW5zdF9YZW5fUHJvamVjdCBvbiBob3cgdG8gc2Vu
ZCBidWcgcmVwb3J0cy4NCj4gDQo+ICMgeGVuc3RvcmUtcm0NCj4geGVuc3RvcmUtcm06IFVz
YWdlOiB4ZW5zdG9yZS1ybSBbLWhdIFstdF0ga2V5IFsuLi5dDQo+IA0KPiBMb29raW5nIGF0
IHhlbnN0b3JlX2NsaWVudC5jLCB0aGlzIGlzIGNvbW1vbiB0byBhbGwuwqAgU2hvdWxkbid0
IGl0IGJlDQo+IGluY2x1ZGVkIGluIHRoZSBtYW5wYWdlcyA/DQoNCkhtbSwgbWF5YmUgYSBn
b29kIGlkZWEuDQoNCkknbGwgYWRkIGEgcGF0Y2ggYWRkaW5nIGl0IHRvIHRoZSBhbHJlYWR5
IGV4aXN0aW5nIG1hbiBwYWdlcyBhbmQgYWRkIGl0DQppbiBlYWNoIG9mIHRoZSA0IG5ldyBt
YW4gcGFnZXMuDQoNCg0KSnVlcmdlbg0KDQo=
--------------vxLnf8KexsL7jOqVo8i2LW5n
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------vxLnf8KexsL7jOqVo8i2LW5n--

--------------mEwUuV7lKvjhYdm1DdoQZUYW--

--------------hAtZdAzSVGSEgSdwKB0B0LQ0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmyxF4FAwAAAAAACgkQsN6d1ii/Ey+W
RAf/WmRYpS1qhLAgn5geDPXeMdROfD+JpLn97JVYZC6sYilM9HGt9+W3U9XaF5T2QUHWqNM52WIE
bcSQhbzH0Qi0vhtrz0lI1cNQrUEUYCN36TbeQmNMvnyrsladIEy1RS0rDB1yCgUkK6+9DNCZGwLw
uVabjCKvt5N9m8QH1/7ZNbIAvgijQ1cjDwwAOT5eXYkXYJoY/S6HNpB62UIpXVrhgwfDuhfqtSF5
hsbGk5aCnEs9CU14nq8QJ5GZ5+u62joaRaW+BIzXMRUt4Ei+/aWZFqcFWBzg57fy3fKvNfbbzzuV
c9X961phfix5j8G+kCGr33IEP5Wq0dMdYW98gvJuFg==
=HExR
-----END PGP SIGNATURE-----

--------------hAtZdAzSVGSEgSdwKB0B0LQ0--

