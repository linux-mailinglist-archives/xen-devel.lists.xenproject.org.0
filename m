Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KS4Cgmh52nw+QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 18:08:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545143D25F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 18:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289169.1569366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDdy-0000bb-GN; Tue, 21 Apr 2026 16:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289169.1569366; Tue, 21 Apr 2026 16:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDdy-0000ZZ-Dl; Tue, 21 Apr 2026 16:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1289169;
 Tue, 21 Apr 2026 16:08:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wFDdw-0000ZQ-MR
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:08:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFDdv-00Bpkb-Hc
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 18:08:07 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69e7a0e0-2eae-0a2a0a5409dd-0a2a4504aab6-10
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 18:08:07 +0200
Received: from [209.85.218.52] (helo=mail-ej1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69e7a0e7-1dec-0a2a45040019-d155da34e18f-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 18:08:07 +0200
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-ba699316b42so434391466b.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:08:07 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ba451210e26sm461865166b.8.2026.04.21.09.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 09:08:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776787687; x=1777392487; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DpUR3zpwNe6NYFxvptwhn5vqTKVHQ8cRrINo7qEViDQ=;
        b=LtP/oI7SEgBpsJgn7Azw2R4yM+zcszav+fB7foJgnd5v82EVO7PaTO65C0Wy3nX6uR
         1ORUGyrUPamYqJXCYrH+VtyY2c3eIfS/vZ6ORSZUMRT348oRWG+Q/RnhbxPtz0vLx+5n
         FVQ95pz/2f1aBV/zh1HHUvUeH8hfRhkKIIOrEe8K6i6hxzv++xS01aK8uybPnPLiQ+jl
         aPZU+tF4CqltdCZlTaDniEQnuFMwsTlFHebkSR1fKx4TArbHmsrzZ+F5C61ouszWxFd/
         eXsHBtuwwshcKVcyuyq68XKzOsZh8n6IsN+H38sJONNMSPNFTKs0Vq5a1TvBM5ZIl9Mq
         AzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787687; x=1777392487;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpUR3zpwNe6NYFxvptwhn5vqTKVHQ8cRrINo7qEViDQ=;
        b=AZTgBWAfI9/WX0RuSIoDdnXRb/V0Nntm6kK0iHnWoZwWNgwQ0FLJmA+vRyiwFTVg7n
         tzIBVkRdhnTHNj1SEqad9GWfO+JSPbEkwVQP07X+uNJPU/Ls3loFHjoU4kuuTiXAllMM
         iMou6tyrMaGI5UVDsrb4+na2g1DrlolZ98ja31lz5KvqF0IVng/a0Xb5j0ukwuHj6vye
         q4sTKLB9xI0kSVsl64/efa9TGfVfOJA3iQLnsZYqd74mWLljRN5ruM2lzAwTImeJKigY
         h7j1HVcj7dzVtqDOxkbSzIp7MHxr+jzg4Vh/U4AiAp5ra31qRE1Y4Hk7BCS9LJ0SXuH8
         sU7w==
X-Forwarded-Encrypted: i=1; AFNElJ//AR0krzlNoe/KBG71prhUBfJzIC527Rr6HTDiMLIPRDxGo/krVwdMadtMChpiHz5NzTK5lFt4Cmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHm9HZKDO0MrHVziHeHkQgCrl2jGJMMSJWHvohvTVR39jk5pcr
	yADtM6PJcen0FO7bNbq+s+ORMS8kA9N4/zijASY05NEKYFAmK6qSpQ+3vVAlAe287VMismV/FOU
	Nd6FniVw=
X-Gm-Gg: AeBDies+Fikbrqsm7oqdlVeTbs6hOyRPj3F9Ftplzht/IaftgHXsDy/MxUzBMIXyW2Q
	uWklj2ky0ktbKNCAPa62+4ntFkDVj/tHau3dRB1ah/dbKMDKdOH0JdoZJ3WBVkj+XzYy942TSRU
	l0LjfY4D9+80U+92ooNXPym1s335RGv2TChz+7Gja302v08XjRZBSpHicAb2pYySdF3vdUQ3HwC
	JCJwkslacGdSUp1HGJywV+8wRf03OwCd6ClCG1eMLV/xoMSFDvOw3phVF00Y/jVA6tc371IZ3tP
	ejIYkw0MX9n4bqGS5zvsQTYEy/gFgwR6Aja6KBaq64DZ45D4oNjjzjjmvYiANU6WtAup03ZjUYV
	/hgQvffpx8O/HtGyWc0dm+THQR02t2iKGJkFXFIO8riW4ovyxmogaMZ6QRljxqHU7RhdetgggSu
	haakKcGwpjnjVNgrfQ0cf86iT5xljLomnH+8T4nXll5DzAzY+SVY52oe0M/y8T8iAW4W52i0cxH
	Dv9obbEIyd4p0F9Q0NzN0A6m1fd8o8elNxQ7NVuMfm+eK8DCHFwCoZApKxLmAOVdroJ6t4ZdYY=
X-Received: by 2002:a17:907:3c89:b0:ba8:8094:f7af with SMTP id a640c23a62f3a-ba88094fbc4mr374198766b.18.1776787686549;
        Tue, 21 Apr 2026 09:08:06 -0700 (PDT)
Message-ID: <be385a95-79ed-486d-8676-9a83dc2c7799@suse.com>
Date: Tue, 21 Apr 2026 18:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] tools/libs/store: add support to use watches with
 a depth parameter
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
References: <20260421074211.308473-1-jgross@suse.com>
 <20260421074211.308473-4-jgross@suse.com>
 <df1be497-ff9b-4f08-ad83-54df9799dd1b@amd.com>
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
In-Reply-To: <df1be497-ff9b-4f08-ad83-54df9799dd1b@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tNrAKuoyg0AsY90OCqZRp0zv"
X-purgate-ID: tlsNG-ebf023/1776787687-324733FF-75D075D2/0/0
X-purgate-type: clean
X-purgate-size: 8371
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
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:julien@xen.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4545143D25F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tNrAKuoyg0AsY90OCqZRp0zv
Content-Type: multipart/mixed; boundary="------------pkBYri3VE4GWdcG0NY5QG9D6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>
Message-ID: <be385a95-79ed-486d-8676-9a83dc2c7799@suse.com>
Subject: Re: [PATCH v2 3/9] tools/libs/store: add support to use watches with
 a depth parameter
References: <20260421074211.308473-1-jgross@suse.com>
 <20260421074211.308473-4-jgross@suse.com>
 <df1be497-ff9b-4f08-ad83-54df9799dd1b@amd.com>
In-Reply-To: <df1be497-ff9b-4f08-ad83-54df9799dd1b@amd.com>

--------------pkBYri3VE4GWdcG0NY5QG9D6
Content-Type: multipart/mixed; boundary="------------x2aiDDPG0TzvigxCyVX2DDy8"

--------------x2aiDDPG0TzvigxCyVX2DDy8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDQuMjYgMTU6NTQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIDIwMjYtMDQt
MjEgMDM6NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBBZGQgYSBuZXcgeHNfd2F0Y2hf
ZGVwdGgoKSBmdW5jdGlvbiB0byBsaWJ4ZW5zdG9yZSBhbGxvd2luZyB0byBsaW1pdA0KPj4g
dGhlIHNjb3BlIG9mIGEgWGVuc3RvcmUgd2F0Y2guIEl0IGNhbiBiZSB1c2VkIG9ubHkgaW4g
Y2FzZSBYZW5zdG9yZSBpcw0KPj4gc3VwcG9ydGluZyB0aGUgWEVOU1RPUkVfU0VSVkVSX0ZF
QVRVUkVfV0FUQ0hERVBUSCBmZWF0dXJlLg0KPj4NCj4+IEZvciBjb252ZW5pZW5jZSBhZGQg
YSB4c193YXRjaF90cnlfZGVwdGgoKSB3cmFwcGVyLCB3aGljaCB3aWxsIGNhbGwNCj4+IHhz
X3dhdGNoX2RlcHRoKCkgaWYgc3VwcG9ydGVkIGFuZCB4c193YXRjaCgpIG90aGVyd2lzZS4N
Cj4+DQo+PiBDYWNoZSB0aGUgc3VwcG9ydGVkIGZlYXR1cmVzIG9mIFhlbnN0b3JlIGluIG9y
ZGVyIG5vdCBoYXZpbmcgdG8gZ2V0DQo+PiB0aGVtIGZyb20gWGVuc3RvcmUgZm9yIGVhY2gg
Y2FsbCBvZiBvbmUgb2YgdGhlIG5ldyBmdW5jdGlvbnMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gDQo+PiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlicy9zdG9yZS94cy5jIGIvdG9vbHMvbGlicy9zdG9yZS94cy5jDQo+
PiBpbmRleCAwNjQ2MjQ0NWUwLi5jYjM1MDhhODZhIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMv
bGlicy9zdG9yZS94cy5jDQo+PiArKysgYi90b29scy9saWJzL3N0b3JlL3hzLmMNCj4gDQo+
PiBAQCAtMTAwMSw4ICs5OTMsOCBAQCBib29sIHhzX3dhdGNoKHN0cnVjdCB4c19oYW5kbGUg
KmgsIGNvbnN0IGNoYXIgKnBhdGgsIA0KPj4gY29uc3QgY2hhciAqdG9rZW4pDQo+PiDCoCAj
IGRlZmluZSBQVEhSRUFEX1NUQUNLX01JTiAwDQo+PiDCoCAjZW5kaWYNCj4+IC0jZGVmaW5l
IFJFQURfVEhSRUFEX1NUQUNLU0laRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXA0KPj4gLcKgwqDCoCAoKERFRkFVTFRfVEhSRUFEX1NUQUNLU0laRSA8IFBU
SFJFQURfU1RBQ0tfTUlOKSA/wqDCoMKgwqAgXA0KPj4gKyNkZWZpbmUgUkVBRF9USFJFQURf
U1RBQ0tTSVpFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4g
K8KgwqDCoCAoKERFRkFVTFRfVEhSRUFEX1NUQUNLU0laRSA8IFBUSFJFQURfU1RBQ0tfTUlO
KSA/wqDCoMKgIFwNCj4gDQo+IFRoaXMgaXMgYW4gdW5yZWxhdGVkIHdoaXRlc3BhY2UgY2hh
bmdlLCBhbmQgbm90IG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IA0KPiBtZXNzYWdlLsKgIEl0
IHNob3VsZCBwcm9iYWJseSBiZSBkcm9wcGVkIHNpbmNlIHRoZSBzdXJyb3VuZGluZyBsaW5l
cyBhcmUgbm8gDQo+IGxvbmdlciB0b3VjaGVkLsKgIEFsdGVybmF0aXZlbHkga2VwdCBhbmQg
bWVudGlvbmVkLsKgIFdpdGggZWl0aGVyIG9mIHRob3NlOg0KPiANCj4gUmV2aWV3ZWQtYnk6
IEphc29uIEFuZHJ5dWsgPGphc29uLmFuZHJ5dWtAYW1kLmNvbT4NCg0KVGhhbmtzLg0KDQpX
aG9ldmVyIGlzIGNvbW1pdHRpbmcgdGhpczogSSdkIHJhdGhlciBleHBhbmQgdGhlIGNvbW1p
dCBtZXNzYWdlIHdpdGg6DQoNCldoaWxlIHRvdWNoaW5nIHRoZSBmaWxlIGZpeCBhIHdoaXRl
c3BhY2UgaXNzdWUuDQoNClNoYWxsIEkgcmVzdWJtaXQgdGhpcyBwYXRjaCwgb3IgY2FuIHRo
aXMgYmUgYW1lbmRlZCB3aGlsZSBjb21taXR0aW5nPw0KDQoNCkp1ZXJnZW4NCg==
--------------x2aiDDPG0TzvigxCyVX2DDy8
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------x2aiDDPG0TzvigxCyVX2DDy8--

--------------pkBYri3VE4GWdcG0NY5QG9D6--

--------------tNrAKuoyg0AsY90OCqZRp0zv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmnnoOUFAwAAAAAACgkQsN6d1ii/Ey+E
UQf6AvimrCjT+qeS/EMALzX54pVz4XVR4Ic+oP0KoC9I6M1lZDdj/u47Q8df8+eKMm7E7Skcx/M3
/yV4ISbhNbJjo4F87ZAcPvhhHhdjEA9G/mMjORYdynKdpTaCZ+ARhv9wfOkBABsG4nQ2vnZjNb7O
oWLJvtqusHz+AzCzm++NE0C/MO6aulSoLvXYiLAUD58jZdHRBFsPNCSsDn/QHtMeLlkBq9beJPnR
pvHQ/+Ll+kbqyD8d2SMMb/TKAMHiQYK4mxgHRZ9klAAdHHXaOEWoRvi6GuMg6hb3Qm3vtFcIQo9x
GiGWltqXWTMqYURuZARJAYIpVIB+0/8QwWUrzqD1yA==
=E4br
-----END PGP SIGNATURE-----

--------------tNrAKuoyg0AsY90OCqZRp0zv--

