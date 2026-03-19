Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCu+JVzXu2k4owIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:00:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422FB2C9E14
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 12:00:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256945.1551409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3B76-0001tT-Te; Thu, 19 Mar 2026 11:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256945.1551409; Thu, 19 Mar 2026 11:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3B76-0001rN-QC; Thu, 19 Mar 2026 11:00:28 +0000
Received: by outflank-mailman (input) for mailman id 1256945;
 Thu, 19 Mar 2026 11:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2tj/=BT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w3B75-0001qa-AD
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 11:00:27 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3299483-2382-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 12:00:22 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b9358bc9c50so95620666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 04:00:22 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b97f13e9922sm419151966b.9.2026.03.19.04.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 04:00:20 -0700 (PDT)
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
X-Inumbo-ID: d3299483-2382-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773918021; x=1774522821; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQpku00CgH42XMvtLguDOCAA0sZ1nvl+F1eh0qG8Ixg=;
        b=YDhj1E+Kr+0bWhhNWwfYPGt3bGiEvxzVPSuNapVN6eajiEHDqU/p81zKvXqbu2qx+Y
         /RU4o0roLdD3T2gvy4V6Sn/3gjrZByp5fkKOnBYUblqGDk9v7PMnlYRmQtE7BETQWFQM
         soFtiytOYcaMQAZ4B+Ah2aZGpJOProAcKpnVuKPxyFtfKjdTSYXY2xtR71rgIhhhAjga
         AJGUyJHg/d+4KG9Qphu5Lpmp4efSAQg4yVFI7ej125qjGQmCCq8C+GSvOOczRN4TEWSP
         Iomf+g7+vIFpDgWZkLGnswgJNJ3W/bryNNTQGE1bYMxygJt26h9Go53eYM2HeKB7vkH5
         NTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918021; x=1774522821;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQpku00CgH42XMvtLguDOCAA0sZ1nvl+F1eh0qG8Ixg=;
        b=norUqIRPrHXKBxdqChJRfaRLCaOHQ1DvEwtUnTm3gzv2dsaCQvIQm1zB8LXh9QufGw
         CuwZTa+2TDhTiVoqqwCPLXkWYKbKvQeI2ZDZs+trTngIC2oU/gimfL1LD1ms2DRYFn89
         4T9qnRDLiXmB/ZI365xTTorTV5rNP6fGUml0XEIIacYxFHm8l8AGG7kzDUQHdX55pUA9
         Yia1i0i59j1+PpJYbStbf/udjNkTVOLG3+78rwIqVfqwJtBL1Qh/LKdgm/hLYN5mGW9T
         SSzYacb1mZcfSccQsbuCsLe96f29YXh5hN9s8uE+dpCziCMw+Ncdd7SmUrB/TNqDICor
         xvtQ==
X-Gm-Message-State: AOJu0Yw4ot71Od9Dk/CkcDCRXpMVhyCpokWWNhG8poouZofFs5TJELro
	yU+YJMwiA3bgNBcTEOyFUWkVQ3qDHEWoJ3n5+w/OLI3OgBGnPaPrpdqNVcwmoEAX0qA=
X-Gm-Gg: ATEYQzw+/1AkLp/kRmTZuPhGO2Q4fn9Tt6Ges7KXTzo5XBe+uzulnrWowawuwqiC3rz
	pmiVRo9BfGIZ54t1RF+43l9QzgjYAa09Lp94Ty1+ygReJflVEd0ditBjIBYhQ1G130Fz3VxiNjl
	v0IqShrK0oFmlyGoK6VDBct/n9IrA7us6xhIBxpVIfXmRKQipJCI+PzSGrGFjRMs5MU0rV5d379
	s1pwbiPwOKHdj77HLGELU+hxhq6Bvqv8q45LKEOmvZrPuiHHt00x/iAzk3FeEx68iFuRV30nXbr
	/xVZUWisVmPnp7cxQotEDBZLtYOPeb5shkXmLhjg4V5j6ULPNwLAzHXgq0KNckHzhDGk+Xvo2B+
	lB97Vcu/QF9j2JBHSnFAEVgvdX6xR4xUP1dh5nufihMIC9tk5u01dgI81CI7ivl67LkTjt1ypqw
	goPK/OiA9Aw6ilHyaOQghux8pzAfcj/0zvYS5g/uTfiXVAZg5zo4+FI0ZQ/U6PLxxBhHUcsLZDS
	ghKNBHkp1CVJSy6wxCZfawhqTKj0IbV8wQlef+aGF5nRY4W1tmA8A==
X-Received: by 2002:a17:907:3e9a:b0:b97:a428:b3c2 with SMTP id a640c23a62f3a-b97f4796110mr439239966b.4.1773918020543;
        Thu, 19 Mar 2026 04:00:20 -0700 (PDT)
Message-ID: <b07adf74-9d70-4aa9-a14c-854808c9e402@suse.com>
Date: Thu, 19 Mar 2026 12:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] tools/libxl: add functions for retrieving and
 setting xenstore quota
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>,
 George Dunlap <gwd@xenproject.org>
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-9-jgross@suse.com> <abu9165dr7LfLfJf@l14>
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
In-Reply-To: <abu9165dr7LfLfJf@l14>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9EjT0FJce0vmbNa3iHW5k95Q"
X-Spamd-Result: default: False [-1.50 / 15.00];
	SIGNED_PGP(-2.00)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:query timed out];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:enr0n@ubuntu.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 422FB2C9E14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9EjT0FJce0vmbNa3iHW5k95Q
Content-Type: multipart/mixed; boundary="------------rbAoqNWWKpIG0c0s1Nt1JfXm";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>,
 George Dunlap <gwd@xenproject.org>
Message-ID: <b07adf74-9d70-4aa9-a14c-854808c9e402@suse.com>
Subject: Re: [PATCH 08/11] tools/libxl: add functions for retrieving and
 setting xenstore quota
References: <20260305135208.2208663-1-jgross@suse.com>
 <20260305135208.2208663-9-jgross@suse.com> <abu9165dr7LfLfJf@l14>
In-Reply-To: <abu9165dr7LfLfJf@l14>

--------------rbAoqNWWKpIG0c0s1Nt1JfXm
Content-Type: multipart/mixed; boundary="------------LlUuiZnciYRwgBePSmyQtjeO"

--------------LlUuiZnciYRwgBePSmyQtjeO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDMuMjYgMTA6MTEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBUaHUsIE1h
ciAwNSwgMjAyNiBhdCAwMjo1MjowNVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvbGlieGwuaCBiL3Rvb2xzL2luY2x1ZGUv
bGlieGwuaA0KPj4gaW5kZXggYmMzNWU0MTJkYS4uYTcwZDlkMzQ3ZiAxMDA2NDQNCj4+IC0t
LSBhL3Rvb2xzL2luY2x1ZGUvbGlieGwuaA0KPj4gKysrIGIvdG9vbHMvaW5jbHVkZS9saWJ4
bC5oDQo+PiBAQCAtMTUzNyw2ICsxNTM3LDE4IEBAIHZvaWQgbGlieGxfbWFjX2NvcHkobGli
eGxfY3R4ICpjdHgsIGxpYnhsX21hYyAqZHN0LCBjb25zdCBsaWJ4bF9tYWMgKnNyYyk7DQo+
PiAgICAqLw0KPj4gICAjZGVmaW5lIExJQlhMX0hBVkVfWEVOX1BMQVRGT1JNX1BDSV9CQVJf
VUMNCj4+ICAgDQo+PiArLyoNCj4+ICsgKiBMSUJYTF9IQVZFX1hFTlNUT1JFX1FVT1RBDQo+
PiArICoNCj4+ICsgKiBJZiB0aGlzIGlzIGRlZmluZWQgdGhlIFhlbnN0b3JlIHF1b3RhIHJl
bGF0ZWQgZnVuY3Rpb25zDQo+PiArICogbGlieGxfeHNxdW90YV9nbG9iYWxfZ2V0KCkNCj4+
ICsgKiBsaWJ4bF94c3F1b3RhX2dsb2JhbF9zZXQoKQ0KPj4gKyAqIGxpYnhsX3hzcXVvdGFf
ZG9tYWluX2dldCgpDQo+PiArICogbGlieGxfeHNxdW90YV9kb21haW5fc2V0KCkNCj4+ICsg
KiBhcmUgYXZhaWxhYmxlLg0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgTElCWExfSEFWRV9YRU5T
VE9SRV9RVU9UQQ0KPj4gKw0KPj4gICB0eXBlZGVmIGNoYXIgKipsaWJ4bF9zdHJpbmdfbGlz
dDsNCj4+ICAgdm9pZCBsaWJ4bF9zdHJpbmdfbGlzdF9kaXNwb3NlKGxpYnhsX3N0cmluZ19s
aXN0ICpzbCk7DQo+PiAgIGludCBsaWJ4bF9zdHJpbmdfbGlzdF9sZW5ndGgoY29uc3QgbGli
eGxfc3RyaW5nX2xpc3QgKnNsKTsNCj4+IEBAIC0zMDExLDYgKzMwMjMsMTQgQEAgc3RhdGlj
IGlubGluZSBpbnQgbGlieGxfcWVtdV9tb25pdG9yX2NvbW1hbmRfMHgwNDEyMDAobGlieGxf
Y3R4ICpjdHgsDQo+PiAgICNkZWZpbmUgbGlieGxfcWVtdV9tb25pdG9yX2NvbW1hbmQgbGli
eGxfcWVtdV9tb25pdG9yX2NvbW1hbmRfMHgwNDEyMDANCj4+ICAgI2VuZGlmDQo+PiAgIA0K
Pj4gKy8qIEdldC9zZXQgZ2xvYmFsIGFuZCBwZXItZG9tYWluIFhlbnN0b3JlIHF1b3RhLiAq
Lw0KPj4gK2ludCBsaWJ4bF94c3F1b3RhX2dsb2JhbF9nZXQobGlieGxfY3R4ICpjdHgsIGxp
YnhsX3hzX3F1b3RhX3NldCAqcSk7DQo+IA0KPiBDb3VsZCB5b3UgcmVuYW1lIHRoZSBzZWNv
bmQgYXJnIGFzICJxX3IiIG9yICJxX291dCIgPw0KPiANCj4+ICtpbnQgbGlieGxfeHNxdW90
YV9nbG9iYWxfc2V0KGxpYnhsX2N0eCAqY3R4LCBsaWJ4bF94c19xdW90YV9zZXQgKnEpOw0K
Pj4gK2ludCBsaWJ4bF94c3F1b3RhX2RvbWFpbl9nZXQobGlieGxfY3R4ICpjdHgsIHVpbnQz
Ml90IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfeHNf
cXVvdGFfc2V0ICpxKTsNCj4gDQo+IFNhbWUgaGVyZS4NCj4gDQo+PiAraW50IGxpYnhsX3hz
cXVvdGFfZG9tYWluX3NldChsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF94c19xdW90YV9zZXQgKnEpOw0K
PiANCj4gQ291bGQgd2UgcHJlZml4IHRoZW0gYWxsIHdpdGggImxpYnhsX3hzX3F1b3RhXyIg
PyBJIHdvdWxkIHJhdGhlciB0aGF0IHdlDQo+IG9ubHkgdXNlICJ4c19xdW90YSIgb3IgInhz
cXVvdGEiLg0KPiANCj4+ICsNCj4+ICAgI2luY2x1ZGUgPGxpYnhsX2V2ZW50Lmg+DQo+PiAg
IA0KPj4gICAvKg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvTWFrZWZpbGUg
Yi90b29scy9saWJzL2xpZ2h0L01ha2VmaWxlDQo+PiBpbmRleCBiYzYwYzQ2NTU4Li5jYTIy
YTQwYzZjIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9NYWtlZmlsZQ0KPj4g
KysrIGIvdG9vbHMvbGlicy9saWdodC9NYWtlZmlsZQ0KPj4gQEAgLTEwNiw2ICsxMDYsNyBA
QCBPQkpTLXkgKz0gbGlieGxfcHZjYWxscy5vDQo+PiAgIE9CSlMteSArPSBsaWJ4bF92c25k
Lm8NCj4+ICAgT0JKUy15ICs9IGxpYnhsX3ZrYi5vDQo+PiAgIE9CSlMteSArPSBsaWJ4bF92
aXJ0aW8ubw0KPj4gK09CSlMteSArPSBsaWJ4bF94c3F1b3RhLm8NCj4+ICAgT0JKUy15ICs9
IGxpYnhsX2dlbmlkLm8NCj4+ICAgT0JKUy15ICs9IF9saWJ4bF90eXBlcy5vDQo+PiAgIE9C
SlMteSArPSBsaWJ4bF9mbGFzay5vDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9saWdo
dC9saWJ4bF90eXBlcy5pZGwgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0K
Pj4gaW5kZXggZDY0YTU3M2ZmMy4uYzVkZGM0MGYzNSAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsDQo+PiArKysgYi90b29scy9saWJzL2xpZ2h0
L2xpYnhsX3R5cGVzLmlkbA0KPj4gQEAgLTU3NCw2ICs1NzQsMTUgQEAgbGlieGxfYWx0cDJt
X21vZGUgPSBFbnVtZXJhdGlvbigiYWx0cDJtX21vZGUiLCBbDQo+PiAgICAgICAoMywgImxp
bWl0ZWQiKSwNCj4+ICAgICAgIF0sIGluaXRfdmFsID0gIkxJQlhMX0FMVFAyTV9NT0RFX0RJ
U0FCTEVEIikNCj4+ICAgDQo+PiArbGlieGxfeHNfcXVvdGFfaXRlbSA9IFN0cnVjdCgieHNf
cXVvdGFfaXRlbSIsIFsNCj4+ICsgICAgKCJuYW1lIiwgc3RyaW5nKSwNCj4+ICsgICAgKCJ2
YWwiLCAgdWludDMyKSwNCj4+ICsgICAgXSkNCj4+ICsNCj4+ICtsaWJ4bF94c19xdW90YV9z
ZXQgPSBTdHJ1Y3QoInhzX3F1b3RhX3NldCIsIFsNCj4gDQo+IENvdWxkIHlvdSB1c2UgIl9s
aXN0IiBhcyBhIHN1ZmZpeCBpbnN0ZWFkPyBJdCdzIGEgYml0IGNvbmZ1c2luZyB0byBoYXZl
DQo+IHRoZSB3b3JkICJzZXQiIGFzIGEgZG91YmxlIG1lYW5pbmcsIHdpdGggYSBfc2V0KCkg
ZnVuY3Rpb24gdGhhdCB0YWtlcyBhDQo+IHNldC4NCj4gDQo+PiArICAgICgicXVvdGEiLCBB
cnJheShsaWJ4bF94c19xdW90YV9pdGVtLCAibnVtX3F1b3RhIikpDQo+PiArICAgIF0pDQo+
PiArDQo+PiAgIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvID0gU3RydWN0KCJkb21haW5fYnVp
bGRfaW5mbyIsWw0KPj4gICAgICAgKCJtYXhfdmNwdXMiLCAgICAgICBpbnRlZ2VyKSwNCj4+
ICAgICAgICgiYXZhaWxfdmNwdXMiLCAgICAgbGlieGxfYml0bWFwKSwNCj4+IGRpZmYgLS1n
aXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX3hzcXVvdGEuYyBiL3Rvb2xzL2xpYnMvbGln
aHQvbGlieGxfeHNxdW90YS5jDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXgg
MDAwMDAwMDAwMC4uYjlhZmExYzkxNA0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvdG9v
bHMvbGlicy9saWdodC9saWJ4bF94c3F1b3RhLmMNCj4+IEBAIC0wLDAgKzEsMTAyIEBADQo+
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExHUEwtMi4xLW9ubHkgKi8NCj4+ICsN
Cj4+ICsvKiBYZW5zdG9yZSBxdW90YSBoYW5kbGluZyBmdW5jdGlvbnMuICovDQo+PiArDQo+
PiArI2luY2x1ZGUgImxpYnhsX2ludGVybmFsLmgiDQo+PiArDQo+PiArc3RhdGljIGludCBn
ZXRfcXVvdGEobGlieGxfY3R4ICpjdHgsIHVuc2lnbmVkIGludCBkb21pZCwgbGlieGxfeHNf
cXVvdGFfc2V0ICpxLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgIGJvb2wgKGZ1bmMpKHN0
cnVjdCB4c19oYW5kbGUgKmgsIHVuc2lnbmVkIGludCBkb21pZCwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpxdW90YSwgdW5zaWduZWQgaW50ICp2YWx1
ZSkpDQo+PiArew0KPj4gKyAgICBjaGFyICoqbmFtZXM7DQo+PiArICAgIHVuc2lnbmVkIGlu
dCBudW0sIGk7DQo+PiArICAgIGludCByYyA9IDA7DQo+IA0KPiBXZSBkb24ndCBpbml0IGBy
Y2AgdmFyaWFibGUgaW4gbGlieGwgZnVuY3Rpb24uIFNldCBgcmNgIHRvIDAganVzdCBiZWZv
cmUNCj4gdGhlICJvdXQiIGxhYmVsLg0KPiANCj4+ICsgICAgR0NfSU5JVChjdHgpOw0KPj4g
Kw0KPj4gKyAgICBuYW1lcyA9IHhzX2dldF9xdW90YV9uYW1lcyhjdHgtPnhzaCwgJm51bSk7
DQo+PiArICAgIGlmICghbmFtZXMpIHsNCj4+ICsgICAgICAgIC8qIFhlbnN0b3JlIHF1b3Rh
IHN1cHBvcnQgaXMgb3B0aW9uYWwhICovDQo+PiArICAgICAgICBpZiAoZXJybm8gIT0gRU5P
U1lTKQ0KPj4gKyAgICAgICAgICAgIHJjID0gRVJST1JfRkFJTDsNCj4+ICsgICAgICAgIHEt
Pm51bV9xdW90YSA9IDA7DQo+IA0KPiBJdCBmZWVscyB3cm9uZyB0byBtYWtlIGNoYW5nZXMg
dG8gdGhlIG91dHB1dCBhcmd1bWVudCBvbiBlcnJvciwgaWYgd2UNCj4gY2FuIGF2b2lkIGl0
LiBBbmQgaGVyZSwgSSBkb24ndCBzZWUgYW55IHJlYXNvbiB0byBjaGFuZ2UgYHFgLg0KPiAN
Cj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPj4gKyAgICB9DQo+PiArDQo+IA0KPiBDYW4geW91
IGNhbGwgbGlieGxfeHNfcXVvdGFfc2V0X2luaXQoKSBmaXJzdD8gQXMgeW91IGNhbGwgX2Rp
c3Bvc2UoKQ0KPiBsYXRlci4NCj4gDQo+PiArICAgIHEtPm51bV9xdW90YSA9IG51bTsNCj4+
ICsgICAgcS0+cXVvdGEgPSBsaWJ4bF9fY2FsbG9jKE5PR0MsIG51bSwgc2l6ZW9mKCpxLT5x
dW90YSkpOw0KPj4gKyAgICBmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsNCj4+ICsgICAg
ICAgIHEtPnF1b3RhW2ldLm5hbWUgPSBsaWJ4bF9fc3RyZHVwKE5PR0MsIG5hbWVzW2ldKTsN
Cj4+ICsgICAgICAgIGlmICghZnVuYyhjdHgtPnhzaCwgZG9taWQsIHEtPnF1b3RhW2ldLm5h
bWUsICZxLT5xdW90YVtpXS52YWwpKSB7DQo+IA0KPiBDb3VsZCB5b3Ugc3RvcmUgdGhlIHJl
dHVybiB2YWx1ZSBvZiBgZnVuYygpYCBpbiBgb2tgLCBhbmQgdGVzdCBgb2tgIGluIHRoZQ0K
PiBpZiBpbnN0ZWFkPw0KPiANCj4+ICsgICAgICAgICAgICBsaWJ4bF94c19xdW90YV9zZXRf
ZGlzcG9zZShxKTsNCj4+ICsgICAgICAgICAgICByYyA9IEVSUk9SX0ZBSUw7DQo+PiArICAg
ICAgICAgICAgYnJlYWs7DQo+IA0KPiBUaGlzIGNhbiBiZSBgZ290byBvdXRgIG9uY2UgZnJl
ZShuYW1lcykgaXMgbW92ZWQgdG8gdGhlIG91dCBsYWJlbC4NCj4gDQo+PiArICAgICAgICB9
DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgZnJlZShuYW1lcyk7DQo+IA0KPiBDb3VsZCB5
b3UgZG8gdGhhdCBhZnRlciB0aGUgIm91dCIgbGFiZWw/IEFuZCBpbml0IGBuYW1lc2AgdG8g
TlVMTC4NCj4gDQo+PiArDQo+PiArIG91dDoNCj4+ICsgICAgR0NfRlJFRTsNCj4+ICsgICAg
cmV0dXJuIHJjOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IHNldF9xdW90YShsaWJ4
bF9jdHggKmN0eCwgdW5zaWduZWQgaW50IGRvbWlkLCBsaWJ4bF94c19xdW90YV9zZXQgKnEs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgYm9vbCAoZnVuYykoc3RydWN0IHhzX2hhbmRs
ZSAqaCwgdW5zaWduZWQgaW50IGRvbWlkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNoYXIgKnF1b3RhLCB1bnNpZ25lZCBpbnQgdmFsdWUpKQ0KPj4gK3sNCj4+
ICsgICAgdW5zaWduZWQgaW50IGk7DQo+PiArICAgIGludCByYyA9IDA7DQo+PiArICAgIEdD
X0lOSVQoY3R4KTsNCj4+ICsNCj4+ICsgICAgZm9yIChpID0gMDsgaSA8IHEtPm51bV9xdW90
YTsgaSsrKSB7DQo+PiArICAgICAgICBpZiAoIWZ1bmMoY3R4LT54c2gsIGRvbWlkLCBxLT5x
dW90YVtpXS5uYW1lLCBxLT5xdW90YVtpXS52YWwpKSB7DQo+PiArICAgICAgICAgICAgcmMg
PSBFUlJPUl9GQUlMOw0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gSXQgd291bGQg
YmUgYmV0dGVyIHRvIHdyaXRlIGBnb3RvIG91dGAgaW5zdGVhZC4NCj4gDQo+PiArICAgICAg
ICB9DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgR0NfRlJFRTsNCj4+ICsgICAgcmV0dXJu
IHJjOw0KPj4gK30NCg0KVG8gYWxsIHlvdXIgcmVtYXJrczogeWVzLCB3aWxsIGRvLg0KDQoN
ClRoYW5rcywNCg0KSnVlcmdlbg0K
--------------LlUuiZnciYRwgBePSmyQtjeO
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

--------------LlUuiZnciYRwgBePSmyQtjeO--

--------------rbAoqNWWKpIG0c0s1Nt1JfXm--

--------------9EjT0FJce0vmbNa3iHW5k95Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmm710IFAwAAAAAACgkQsN6d1ii/Ey/o
zgf8CR5d+CfLd8/2g9TJHRNZQ3kvWj+ABwPpX39ajFMDbc8JtxgN/gwZQ+0/EFoQoULQNj+2+O0z
R+fpDUQSLXfDf8YwRDmvS4nU7pNtJsiyrYbQHjk/PkHBSeTIgrttLwyxzZEFN80PFsEfKusN6CK/
g7/FXJ1fDWhxETAtlX0MNadb0pEGm9JMMQEMpJn6kjOIjkKyq10qb1kT2NhuT3l1+WAiIO87ALTQ
Hzhtv1i3acz24GaSPDx3Ksa2CTehk1EfnhiO03XQNM/xvSWihRr30oiFDQ+pP1+OUWzxEYENXT3Q
xA25slitMEFFRccaBnAFp+/YoIz7bi0uOdB8S/qmBg==
=WAbV
-----END PGP SIGNATURE-----

--------------9EjT0FJce0vmbNa3iHW5k95Q--

