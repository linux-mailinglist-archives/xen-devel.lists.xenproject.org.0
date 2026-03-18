Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNKSN+qXumnSXgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 13:17:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6F2BB533
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2026 13:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256437.1551075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2ppD-000259-U2; Wed, 18 Mar 2026 12:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256437.1551075; Wed, 18 Mar 2026 12:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2ppD-00022Q-Qv; Wed, 18 Mar 2026 12:16:35 +0000
Received: by outflank-mailman (input) for mailman id 1256437;
 Wed, 18 Mar 2026 12:16:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/BnF=BS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w2ppC-00022K-13
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2026 12:16:34 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ce7405d-22c4-11f1-b164-2bf370ae4941;
 Wed, 18 Mar 2026 13:16:32 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-661d20c9787so9944737a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2026 05:16:32 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-667aecbcc17sm1831540a12.5.2026.03.18.05.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2026 05:16:31 -0700 (PDT)
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
X-Inumbo-ID: 4ce7405d-22c4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773836192; x=1774440992; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IDbbWjaUCa/NhBRNgLeh143VaZhNGwq41wrmPpDJO0o=;
        b=OfwVtHZX+5wy2OrHm6Stc0oaWSxK+Pu55akJW2dBJNdhmcFp5Bn+ZqkDq7QiHAFCKt
         4bViGyq8gvk4/fcXaANLhBU/MD5j4I8VA57hg7Uvlzalom7oWFwjJYRRqv24ueytdt57
         Xj7YnPhi/ipe/CPWdqgFY0UMMpipe5+2f5vTBQR8srqdKoUQ0KsmY39phkmRM24XtkLH
         SwRYTCimx4PY/mhQZEdfIBfBLF3dSSpZuex1P01MW4MEqEFh5jV3h21M045cY0xnft3G
         XhOTsE8ZA2QXRIPXw9KXBbTe92YeU5JhP4MeEztpvkiXBmrkzAneTkKU6KVo7ju9VX/O
         7RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773836192; x=1774440992;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDbbWjaUCa/NhBRNgLeh143VaZhNGwq41wrmPpDJO0o=;
        b=f0OkRWI5R4wJu+fLTPpGOz2eDLOhPpgYb70JiZ7btlazS+uYWoJwI9RZMxTpgkiX+f
         7sJsgzEyQHvkD6f6MK7yWRs5LT3d2lW+T/7t6NpdGcLE/uZqZUyy+S5kL6aYBl9Sdr4T
         DNEfeK5WrICw/kMp6R4/jmgKA+SYO/l0hpz5+NpA1/yMbw/GEror7PrnvEgWhcpfP0/k
         ypS+aQbbyjgNuH1jqHOpt354au8z2RZ+wsJbfN91TKmz+0PcrcRT3b4Kf45szA9kQHP2
         eq8TMWM3NBpa+mPYk7Fhn7GbdzSwJrxzdk/GUhYoBltXJzrA5nVSKF/TcCDQgcZK1ePp
         rGQg==
X-Gm-Message-State: AOJu0Yzl1QWZldMM33TlNyfAUXC4JezzR3Fedjt/f0bYN32b3pTLmLGS
	wcwXkSxCGz8940ZaXoI6+ZItF58pzjTP8uD94sBxSOSSsWAgRfG48aLUOqsUtTBtGJoqc+dXvNu
	kPKic
X-Gm-Gg: ATEYQzwMS8ks7o74XVeSrHt/45cfHFoiDhy4LykuR0VGM4VvNc6JmkapzlG94ONjuDz
	O0wjDCisK8ZiQENDOLq2xOkGmDJqgtoJJnQOBsBVsxoMgtNN2/dKso0odpou6KY5Ad/qmG/IGlu
	KQLPD7T9P/Qd05tXgHzauASayehvIaTnqSLDSQ9PbP/Lk7ChbjeKfUGMbdQzAgYWx2iMY9RAmSP
	hYPFSn0Xye0v+h53JFzEiPJwOFhKWTMjIGV1fxFvgh+S7ufbcbeposiyK8C9v3lSjoSG7QpPUHf
	cTGx7z6mgPxMR1CDuIaUnS9ArDqKcx1vIhqtfcY1nt4RurwluROg3hR8ETJcuzX8eQFP5klLeoN
	a1k0YfvhUitIHmXMnsEL2z2ijVNFvxgO+XQX88yfe1lZl+jQ95M2R5XPeZP0Jw+amxNGyFRdVlJ
	bevCEdhJCKdgYkc+H6dDVYA+BaXHhXZJApGqeOelpD9Nkc40uQHUD0MJ/sJgj8qFJ3A0+47RJau
	1k+m1nP8AF7w62tKaAF/TtS2iHts2N7cOg3uEZyKVGjD5MRcmSUUA==
X-Received: by 2002:a05:6402:2805:b0:667:447d:cbb1 with SMTP id 4fb4d7f45d1cf-667b1e65353mr2289249a12.1.1773836191779;
        Wed, 18 Mar 2026 05:16:31 -0700 (PDT)
Message-ID: <52da8abd-a9d0-4a7d-8213-93a94b489fc6@suse.com>
Date: Wed, 18 Mar 2026 13:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] tools/xenstored: add GLOBAL_QUOTA_DATA record for
 live update
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14>
 <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
Content-Language: en-US
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
In-Reply-To: <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5hoFOdae0TcTYJVx5rAqg2X0"
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:julien@xen.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 47A6F2BB533
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5hoFOdae0TcTYJVx5rAqg2X0
Content-Type: multipart/mixed; boundary="------------XhY50a0RNZgHE0gJpiPK9s3R";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Message-ID: <52da8abd-a9d0-4a7d-8213-93a94b489fc6@suse.com>
Subject: Re: [PATCH 04/11] tools/xenstored: add GLOBAL_QUOTA_DATA record for
 live update
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-5-jgross@suse.com> <abREpWtSt0eLWo4q@l14>
 <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>
In-Reply-To: <c065d0bd-2cbd-438f-adda-9e17a8294727@suse.com>

--------------XhY50a0RNZgHE0gJpiPK9s3R
Content-Type: multipart/mixed; boundary="------------kG9MgR5866jDepR1rRfwxm5u"

--------------kG9MgR5866jDepR1rRfwxm5u
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjYgMDk6MTUsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+IE9uIDEzLjAzLjI2
IDE4OjA4LCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4+IE9uIFRodSwgTWFyIDA1LCAyMDI2
IGF0IDAyOjUyOjAxUE0gKzAxMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC9kb21haW4uYyBiL3Rvb2xzL3hlbnN0b3JlZC9kb21h
aW4uYw0KPj4+IGluZGV4IGFjZGNhYTc2OWUuLjY5NGFlNTg5NzMgMTAwNjQ0DQo+Pj4gLS0t
IGEvdG9vbHMveGVuc3RvcmVkL2RvbWFpbi5jDQo+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmVk
L2RvbWFpbi5jDQo+Pj4gQEAgLTEzMzIsNiArMTMzMiwyNyBAQCBpbnQgZG9fc2V0X2ZlYXR1
cmUoY29uc3Qgdm9pZCAqY3R4LCBzdHJ1Y3QgY29ubmVjdGlvbiANCj4+PiAqY29ubiwNCj4+
PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+IMKgIH0NCj4+PiArc3RhdGljIGJvb2wgcGFy
c2VfcXVvdGFfbmFtZShjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25lZCBpbnQgKnFpZHgsDQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCAqaWR4
KQ0KPj4+ICt7DQo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgcTsNCj4+DQo+PiBXaGF0IGRv
IHlvdSB0aGluayBvZiB1c2luZyBzb21ldGhpbmcgbGlrZToNCj4+IMKgwqDCoMKgIGNvbnN0
IGNoYXIgc29mdF9wcmVmaXhbXSA9ICJzb2Z0LSI7DQo+PiDCoMKgwqDCoCBjb25zdCBzaXpl
X3Qgc29mdF9wcmVmaXhfbGVuID0gc2l6ZW9mKHNvZnRfcHJlZml4KSAtIDE7DQo+PiB0byBl
eHBsYWluIHRoZSBgNWAsIGhlcmUgYW5kIGluIGUuZy4gdGhlIGZ1bmN0aW9uIGJ1aWxkX3F1
b3RhX2RhdGEoKSA/DQo+PiBXZSB1c2VkIHRoaXMgaW4gbGlieGwgaW4gb25lIHBsYWNlOg0K
Pj4gwqDCoMKgwqAgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20veGVuL3Y0LjIxLjAvc291
cmNlL3Rvb2xzL2xpYnMvbGlnaHQvIA0KPj4gbGlieGxfcW1wLmMjTDEyODgNCj4+DQo+PiBC
dXQgaXQncyBmaW5lIHRvIGxlYXZlIGl0IGxpa2UgdGhhdCwgYXMgdGhlICc1J3MgYXJlIGNs
b3NlIGVub3VnaHQgdG8NCj4+IHRoZSBwcmVmaXggdGhhdCB3ZSBjYW4gZ3Vlc3MgZWFzbHkg
ZW5vdWdoLg0KPiANCj4gSSBjYW4gY2hhbmdlIGl0LCBidXQgSSdkIHByZWZlciB0byB1c2Ug
bWFjcm9zIGZvciB0aGF0IHB1cnBvc2UuDQo+IA0KPj4NCj4+PiArDQo+Pj4gK8KgwqDCoCBp
ZiAoc3RybmNtcChuYW1lLCAic29mdC0iLCA1KSkgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCAq
aWR4ID0gUV9JRFhfSEFSRDsNCj4+PiArwqDCoMKgIH0gZWxzZSB7DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgICppZHggPSBRX0lEWF9TT0ZUOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBuYW1lICs9
IDU7DQo+Pj4gK8KgwqDCoCB9DQo+Pj4gK8KgwqDCoCBmb3IgKHEgPSAwOyBxIDwgQUNDX047
IHErKykgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocXVvdGFfYWRtW3FdLm5hbWUgJiYg
IXN0cmNtcChxdW90YV9hZG1bcV0ubmFtZSwgbmFtZSkpIHsNCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqcWlkeCA9IHE7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGZhbHNlOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gK8KgwqDCoCB9DQo+Pj4g
Kw0KPj4+ICvCoMKgwqAgcmV0dXJuIHRydWU7DQo+Pj4gK30NCj4+PiArDQo+Pj4gwqAgc3Rh
dGljIGludCBjbG9zZV94Z3RfaGFuZGxlKHZvaWQgKl9oYW5kbGUpDQo+Pj4gwqAgew0KPj4+
IMKgwqDCoMKgwqAgeGVuZ250dGFiX2Nsb3NlKCooeGVuZ250dGFiX2hhbmRsZSAqKilfaGFu
ZGxlKTsNCj4+PiBAQCAtMjAwMSw2ICsyMDIyLDYxIEBAIHZvaWQgcmVhZF9zdGF0ZV9jb25u
ZWN0aW9uKGNvbnN0IHZvaWQgKmN0eCwgY29uc3Qgdm9pZCANCj4+PiAqc3RhdGUpDQo+Pj4g
wqDCoMKgwqDCoCB9DQo+Pj4gwqAgfQ0KPj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IGdldF9x
dW90YV9zaXplKHN0cnVjdCBxdW90YSAqcXVvdGEsIHVuc2lnbmVkIGludCAqbGVuKQ0KPj4+
ICt7DQo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgcTsNCj4+PiArwqDCoMKgIHVuc2lnbmVk
IGludCBuID0gMDsNCj4+PiArDQo+Pj4gK8KgwqDCoCBmb3IgKHEgPSAwOyBxIDwgQUNDX047
IHErKykgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXF1b3RhX2FkbVtxXS5uYW1lKQ0K
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAocXVvdGFbcV0udmFsW1FfSURYX0hBUkRdICE9IFFfVkFMX0RJU0FCTEVEKSB7
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbisrOw0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICpsZW4gKz0gc3RybGVuKHF1b3RhX2FkbVtxXS5uYW1lKSArIDE7DQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIH0NCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHF1b3RhW3FdLnZh
bFtRX0lEWF9TT0ZUXSAhPSBRX1ZBTF9ESVNBQkxFRCkgew0KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG4rKzsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqbGVuICs9IHN0
cmxlbihxdW90YV9hZG1bcV0ubmFtZSkgKyA1ICsgMTsNCj4+DQo+PiBUaGUgdmFsdWUgNSBo
ZXJlIGlzbid0IGV4cGxhaW5lZC4gQSBjb21tZW50IHdvdWxkIGJlIG5pY2UuDQo+IA0KPiBV
c2luZyB0aGUgbWFjcm8gbWVudGlvbmVkIGFib3ZlIHdpbGwgbWFrZSBpdCBtb3JlIGRlc2Ny
aXB0aXZlLg0KPiANCj4+DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+PiArwqDCoMKgIH0N
Cj4+PiArDQo+Pj4gK8KgwqDCoCByZXR1cm4gbjsNCj4+PiArfQ0KPj4+ICsNCj4+PiArc3Rh
dGljIHZvaWQgYnVpbGRfcXVvdGFfZGF0YShzdHJ1Y3QgcXVvdGEgKnF1b3RhLCB1aW50MzJf
dCAqdmFsLCBjaGFyICpuYW1lKQ0KPj4NCj4+IEkgZ3Vlc3Mgd2Ugd2lsbCBuZWVkIGEgbGVh
cCBvZiBmYWl0aCB0byB0cnVzdCB0aGF0IGB2YWxgIGlzIGJpZyBlbm91Z2gsDQo+PiBhZnRl
ciBmaW5kaW5nIG91dCB0aGF0IGl0J3MgYWN0dWFsbHkgYW4gb3V0cHV0IG9mIG11bHRpcGxl
IHZhbHVlcywgYW5kDQo+PiBub3QgYW4gaW5wdXQgb2YgYSBzaW5nbGUgdmFsdWUuDQo+IA0K
PiBUaGF0J3Mgd2hhdCBnZXRfcXVvdGFfc2l6ZSgpIGlzIGNhbGN1bGF0aW5nLg0KPiANCj4+
DQo+PiBBbmQgYG5hbWVgIHNlZW1zIHRvIGFsc28gYmUgYW4gb3V0cHV0LCBhbmQgdGhpcyBp
cyBhY3R1YWxseSBpbXBvc3NpYmxlDQo+PiB0byBndWVzcyBmcm9tIHRoZSBwcm90b3R5cGUu
DQo+IA0KPiBUcnVlLiBXaGF0IGFib3V0IG5hbWVzPw0KDQpJIGhhdmUgY2hvc2VuIG5hbWVz
X2J1ZiBpbnN0ZWFkLCBtYWtpbmcgaXQgbW9yZSBjbGVhciB0aGF0IHRoaXMgaXMgYW4NCm91
dHB1dCBwYXJhbWV0ZXIgZm9yIG11bHRpcGxlIG5hbWVzLg0KDQo+IA0KPj4NCj4+PiArew0K
Pj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IHE7DQo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQg
biA9IDA7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgZm9yIChxID0gMDsgcSA8IEFDQ19OOyBxKysp
IHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFxdW90YV9hZG1bcV0ubmFtZSkNCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4+PiArwqDCoMKgwqDCoMKgwqAg
aWYgKHF1b3RhW3FdLnZhbFtRX0lEWF9IQVJEXSAhPSBRX1ZBTF9ESVNBQkxFRCkgew0KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhbFtuKytdID0gcXVvdGFbcV0udmFsW1FfSURY
X0hBUkRdOw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cmNweShuYW1lLCBxdW90
YV9hZG1bcV0ubmFtZSk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZSArPSBz
dHJsZW4obmFtZSkgKyAxOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmIChxdW90YVtxXS52YWxbUV9JRFhfU09GVF0gIT0gUV9WQUxfRElTQUJMRUQp
IHsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWxbbisrXSA9IHF1b3RhW3FdLnZh
bFtRX0lEWF9TT0ZUXTsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJjcHkobmFt
ZSwgInNvZnQtIik7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RyY3B5KG5hbWUg
KyA1LCBxdW90YV9hZG1bcV0ubmFtZSk7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bmFtZSArPSBzdHJsZW4obmFtZSkgKyAxOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+Pj4g
K8KgwqDCoCB9DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyB2b2lkIHBhcnNlX3F1b3Rh
X2RhdGEoY29uc3QgdWludDMyX3QgKnZhbCwgY29uc3QgY2hhciAqbmFtZSwNCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG4sIHN0cnVjdCBx
dW90YSAqcXVvdGEpDQo+Pj4gK3sNCj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBpLCBxLCBp
ZHg7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IG47IGkrKykgew0KPj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXBhcnNlX3F1b3RhX25hbWUobmFtZSwgJnEsICZpZHgp
KQ0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHF1b3RhW3FdLnZhbFtpZHhdID0gdmFs
W2ldOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBuYW1lICs9IHN0cmxlbihuYW1lKSArIDE7DQo+
Pg0KPj4gU28gZm9yIGB2YWxgLCB3ZSBoYXZlIGEgc2l6ZS4gQnV0LCB3ZSBkb24ndCBoYXZl
IGEgc2l6ZSBmb3IgYG5hbWVgLCBhcmUNCj4+IHdlIHN1cmUgdGhhdCBpdCdzIHNhZmUgdG8g
a2VlcCByZWFkaW5nIHBhc3QgYE5VTGAgY2hhcmFjdGVycyA/IElzIHRoZQ0KPj4gc2l6ZSBv
ZiBuYW1lIGF2YWlsYWJsZSBzb21ld2hlcmU/DQo+IA0KPiBZZXMuIGdldF9xdW90YV9zaXpl
KCkgY2FsY3VsYXRlZCB0aGF0IGFzIHdlbGwuDQo+IA0KPj4NCj4+PiArwqDCoMKgIH0NCj4+
PiArfQ0KPj4+ICsNCj4+PiDCoCBzdGF0aWMgaW50IGR1bXBfc3RhdGVfZG9tYWluKGNvbnN0
IHZvaWQgKmssIHZvaWQgKnYsIHZvaWQgKmFyZykNCj4+PiDCoCB7DQo+Pj4gwqDCoMKgwqDC
oCBzdHJ1Y3QgZG9tYWluICpkb21haW4gPSB2Ow0KPj4+IEBAIC0yMDQ5LDYgKzIxMjUsNTMg
QEAgdm9pZCByZWFkX3N0YXRlX2RvbWFpbihjb25zdCB2b2lkICpjdHgsIGNvbnN0IHZvaWQg
DQo+Pj4gKnN0YXRlLCB1bnNpZ25lZCBpbnQgdmVyc2lvbikNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZG9tYWluLT5mZWF0dXJlcyA9IHNkLT5mZWF0dXJlczsNCj4+PiDCoCB9DQo+Pj4g
K2NvbnN0IGNoYXIgKmR1bXBfc3RhdGVfZ2xiX3F1b3RhKEZJTEUgKmZwKQ0KPj4+ICt7DQo+
Pj4gK8KgwqDCoCBzdHJ1Y3QgeHNfc3RhdGVfcmVjb3JkX2hlYWRlciAqaGVhZDsNCj4+PiAr
wqDCoMKgIHN0cnVjdCB4c19zdGF0ZV9nbGJfcXVvdGEgKmdsYjsNCj4+PiArwqDCoMKgIHZv
aWQgKnJlY29yZDsNCj4+PiArwqDCoMKgIHVuc2lnbmVkIGludCBuX3F1b3RhOw0KPj4+ICvC
oMKgwqAgdW5zaWduZWQgaW50IGxlbiA9IHNpemVvZigqZ2xiKTsNCj4+PiArwqDCoMKgIHNp
emVfdCByZXQ7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgbl9xdW90YSA9IGdldF9xdW90YV9zaXpl
KHF1b3RhcywgJmxlbik7DQo+Pg0KPj4gU28sIGdldF9xdW90YV9zaXplIGlzIGFjdHVhbGx5
IGFuICJhZGQiIHRoZSBzaXplIHRvIHRoaXMgdmFyaWFibGUsIGFuZA0KPj4gbm90ICJzdG9y
ZSIgdGhlIHNpemUgaW4gdGhpcyB2YXJpYWJsZS4gVGhhdCdzIG5vdCBjb25mdXNpbmcgYXQg
YWxsLg0KPiANCj4gV291bGQgaXQgYmUgYmV0dGVyIGlmIGxlbiBpcyByZW5hbWVkIHRvIG5h
bWVzX2xlbiAoYm90aCBoZXJlIGFuZCB0aGUNCj4gcGFyYW1ldGVyIG9mIGdldF9xdW90YV9z
aXplKCkpPw0KDQpJbiB0aGUgZW5kIEkgaGF2ZSBjaG9zZW4gdG8gYWRkIGEgY29tbWVudCBh
Ym92ZSBnZXRfcXVvdGFfc2l6ZSgpIGFuZA0KcmVuYW1lICJsZW4iIHRvICJyZWNfbGVuIiBp
biBkdW1wX3N0YXRlX2dsYl9xdW90YSgpLg0KDQoNCkp1ZXJnZW4NCg==
--------------kG9MgR5866jDepR1rRfwxm5u
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------kG9MgR5866jDepR1rRfwxm5u--

--------------XhY50a0RNZgHE0gJpiPK9s3R--

--------------5hoFOdae0TcTYJVx5rAqg2X0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm6l58FAwAAAAAACgkQsN6d1ii/Ey9P
IAf/dPRZXxpxOTJkztugGpENUlqFb7WXrFAD3MlREBdxgvgu9hHjzXJ2okxLaSslBojiBLAM4LVm
41hEb30qvB3ncV/9Qsm1wQh+qmPasMXFd+ahI2c/rfF4mbixr3hZUIMNDnsfFWEnx02CtLjoyfO5
vRuJCN28PYyC+atsuexjHJXRVHsjvGFqg3eS5NtZb2x1oBXRVEf7U0h0yVokMmLYzooDEDt/rp6n
uX7M+bwWeREOZDPMzxXdaKjRkxUfKxGwiffwXQ6OI7d3kiP32J1/OWnG27XMrRnhERx3HhGw/XIE
VPTkcpMPUV/g0Ln/SEnSYS19GgXx5JWi3LPUNlRHAw==
=Stnk
-----END PGP SIGNATURE-----

--------------5hoFOdae0TcTYJVx5rAqg2X0--

