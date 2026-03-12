Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PkeLr+8smmvPAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:16:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A7227262F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 14:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252369.1549076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0ftn-0008Bs-5p; Thu, 12 Mar 2026 13:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252369.1549076; Thu, 12 Mar 2026 13:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0ftn-0008AR-31; Thu, 12 Mar 2026 13:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1252369;
 Thu, 12 Mar 2026 13:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QGPq=BM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1w0ftl-0008AL-7E
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 13:16:21 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a89467f4-1e15-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 14:16:19 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6638ce09a31so837385a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 06:16:19 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112?
 (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de.
 [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b972e14dc3asm134768266b.39.2026.03.12.06.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 06:16:18 -0700 (PDT)
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
X-Inumbo-ID: a89467f4-1e15-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773321379; x=1773926179; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3uwHSAWv6v00M47Dk0NabAzM+7r9zNBmpu0MGE9Jeio=;
        b=gpTuYanlnpp9uwoUFYNkg7VYLjib9f5ZEleu4UidFkuCwxO5ZW07KXAU3AcYoOeABR
         A4rIpYdHM7z8w0idHCLx4IPqQ5P2Zr7kWuJqgJOfv9R1dOtEJ3+z0bhJ0YoXRxFp9nSB
         n1rDo6itiVm4Nc52/QkpSzBRJ/NUHlRFQEf4EmpalQK7qw0j6nDDGzlej6sYoAATmHPM
         YWQGLCCd38JHsaMTJq7DRwh2Fz5+rrBUeMGI7uVxb66Qf3tDMTbL+542Bn4tlU2bs2aa
         cGfUGCM3KfGSSeKow6HtfmO1cP+8YBxrkSIHetZGiYVLiCZvQQDB5XF7qMLPUBuVaUZL
         2Itw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321379; x=1773926179;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3uwHSAWv6v00M47Dk0NabAzM+7r9zNBmpu0MGE9Jeio=;
        b=dzJzuB25i4NWUcXjOJAk/V2l7EunIf9HDlUI/Nrbx4yVxNEGK4mqNH5xMlu9q3vXpy
         xLMwEn45KcToyv8+ddDc8fIzirL5tMAakS/KhXSzdIxXPVGHhqIFleRBbB3D6WUP1Ad5
         dKfckVsEgWK702A7RaO6qTuLtNQlaVBA+2Wa9iA/6JvcXQuSIbCgrED6746F+jmuJMLH
         mdlQMgeZ6IF29I9J2Dm0DKqqdQA9JNVZqQfjVRej9ApcYzPSBS3YIKQQg2ZNSSEH/D4U
         gGlSAtxKVTkwCY8pxrhKZ9Kr5azBWSM1Kk2NQmf284Jl+IeGP82usKYdKgjEpMw/vEgs
         vIqg==
X-Forwarded-Encrypted: i=1; AJvYcCVvvKdlR3PRutjMCmqsyS07IHv3rsvYVSeeOMiqd6PmtFQKEoNnvm59pdM8MiBdfnioxBSXawlXbSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzusZsa1yJ4jk2xJI3svD0a130z1d+aiJc2ITnK909tYwtoLvn9
	vAC05gBQywhn9fv/bJjbwumXXoKuuXNhK0o5LjTawMzIPdI5G6cEWUmBJhGS1ARlvQAcF1W44Fn
	JJssI
X-Gm-Gg: ATEYQzxi2WPLcmvDilqxu/zLL9q1hXm6rGt3l9xaBIWunl7yYapH4HNlNbB2CEyI9wI
	XIuCmqh179QydrW1nPtJOm06+BXju8l188Drx69yS49SJsYZUwJihYPAxDItB8Gf0eabBjmgH+f
	/yXCoe9sMI92884p813EXaptDxYM3A2RJJ+ng/ZG7MS/yRBxVhEzHZsTN5gHN5MuC+wb2ZoQI86
	4hXi2Csl+bX6BVUqvWw8BoSnvdKX5tWBAra4jKgyaDRBjp3eiY2ifiKcuSpRF/VZKgBL8w4Shd8
	6vIzTA7Fw8/uEFiQVSqHCsjgkR/gbNa2GF0O+29h8/T7pnur1zR0784yyy3IoX+2zIiN1afTIRb
	mC4UkOYL9bo40bjplu7PcpC15MnqBAEnNTksiKO+fyCcFXZyxvNSki3GUaPiIhoNMraK8sbJxNQ
	wQRnt0WbTeH1yeWjTRE2lnQwlbL4wDZmxovkgwsC2YCwaoJBIsMem63nc7Lf38UqLTTn5QNaR/R
	LVndPdO+y248DwzWP6zoh/fUNTgSq+ohM4KEnNtlwVvn2kigKaRDw==
X-Received: by 2002:a17:907:f815:b0:b94:3836:1672 with SMTP id a640c23a62f3a-b972e2c23acmr383012466b.37.1773321379026;
        Thu, 12 Mar 2026 06:16:19 -0700 (PDT)
Message-ID: <33b5fe0f-d3d0-4823-8a3a-8414365360a7@suse.com>
Date: Thu, 12 Mar 2026 14:16:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] docs: add man page for xenstore-list
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-3-jgross@suse.com>
 <9e9b4a3c-1ccf-41f2-a846-ce855a64f726@citrix.com>
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
In-Reply-To: <9e9b4a3c-1ccf-41f2-a846-ce855a64f726@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IRCvABarFFOIaAwwhrwydgH5"
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,xenproject.org:email,xenproject.org:url];
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
X-Rspamd-Queue-Id: 29A7227262F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IRCvABarFFOIaAwwhrwydgH5
Content-Type: multipart/mixed; boundary="------------DwR84ipFeU0iF7zgyWbaFZTd";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Message-ID: <33b5fe0f-d3d0-4823-8a3a-8414365360a7@suse.com>
Subject: Re: [PATCH 2/4] docs: add man page for xenstore-list
References: <20260312122240.2784725-1-jgross@suse.com>
 <20260312122240.2784725-3-jgross@suse.com>
 <9e9b4a3c-1ccf-41f2-a846-ce855a64f726@citrix.com>
In-Reply-To: <9e9b4a3c-1ccf-41f2-a846-ce855a64f726@citrix.com>

--------------DwR84ipFeU0iF7zgyWbaFZTd
Content-Type: multipart/mixed; boundary="------------vP0He5e0E20IM0eylkQpww4L"

--------------vP0He5e0E20IM0eylkQpww4L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDMuMjYgMTM6NTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDEyLzAzLzIw
MjYgMTI6MjIgcG0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBUaGVyZSBpcyBubyBtYW4g
cGFnZSBmb3IgeGVuc3RvcmUtbGlzdCwgYWRkIGl0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICBkb2NzL21h
bi94ZW5zdG9yZS1saXN0LjEucG9kIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkb2NzL21hbi94ZW5zdG9yZS1saXN0LjEucG9kDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RvY3MvbWFuL3hlbnN0b3JlLWxpc3QuMS5wb2QgYi9kb2NzL21hbi94ZW5zdG9yZS1s
aXN0LjEucG9kDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAw
MC4uNGJjMWZmOTg0Ng0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZG9jcy9tYW4veGVu
c3RvcmUtbGlzdC4xLnBvZA0KPj4gQEAgLTAsMCArMSwyNCBAQA0KPj4gKz1oZWFkMSBOQU1F
DQo+PiArDQo+PiAreGVuc3RvcmUtbGlzdCAtIGxpc3QgWGVuc3RvcmUga2V5IGNoaWxkcmVu
DQo+PiArDQo+PiArPWhlYWQxIFNZTk9QU0lTDQo+PiArDQo+PiArQjx4ZW5zdG9yZS1saXN0
PiBbSTxPUFRJT04+XS4uLiBbSTxQQVRIPl0uLi4NCj4+ICsNCj4+ICs9aGVhZDEgREVTQ1JJ
UFRJT04NCj4+ICsNCj4+ICtMaXN0IGRpcmVjdCBjaGlsZHJlbiBvZiBvbmUgb3IgbW9yZSBY
ZW5zdG9yZSBJPFBBVEg+cywgb25lIGNoaWxkIHBlciBsaW5lLg0KPj4gKw0KPj4gKz1vdmVy
DQo+PiArDQo+PiArPWl0ZW0gQjwtcD4NCj4+ICsNCj4+ICtMaXN0IHRoZSBmdWxsIFhlbnN0
b3JlIHBhdGggb2YgZWFjaCBsaXN0ZWQgcGF0aC4NCj4+ICsNCj4+ICs9YmFjaw0KPj4gKw0K
Pj4gKz1oZWFkMSBCVUdTDQo+PiArDQo+PiArU2VuZCBidWdzIHRvIHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZywgc2VlDQo+PiAraHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3Jn
L3dpa2kvUmVwb3J0aW5nX0J1Z3NfYWdhaW5zdF9YZW5fUHJvamVjdCBvbiBob3cgdG8gc2Vu
ZCBidWcgcmVwb3J0cy4NCj4gDQo+IEkgaGFkIG5vIGlkZWEgd2UgZXZlbiBoYWQgdGhpcy4u
LsKgIFdoeSBvbiBlYXJ0aCBkbyB3ZSBoYXZlIGJvdGgNCj4geGVuc3RvcmUtbHMgYW5kIHhl
bnN0b3JlLWxpc3QsIGFuZCBmb3IgdGhlbSB0byBiZSBkaWZmZXJlbnQ/DQoNCkkgd291bGQg
dGhpbmsgdGhlIHVzZSBjYXNlcyBhcmUgZGlmZmVyZW50LCBidXQgdGhpcyBpcyBwdXJlIHNw
ZWN1bGF0aW9uLg0KDQp4ZW5zdG9yZS1saXN0IG1pZ2h0IGJlIGludGVuZGVkIHRvIGJlIHVz
ZWQgYnkgc2NyaXB0cywgd2hpbGUgeGVuc3RvcmUtbHMNCnNlZW1zIHRvIHRhcmdldCBodW1h
biByZWFkZXJzIG9mIHRoZSBvdXRwdXQuDQoNCj4gRXZlbiBmb3IgdGhlIG9wdGlvbnM7IHhl
bnN0b3JlLWxzIHVzZXMgLWYgZm9yIGZ1bGwgcGF0aCBhbmQgLXAgZm9yDQo+IHBlcm1pc3Np
b25zLg0KDQpZZXMsIHRoaXMgaXMgd2VpcmQuIEFuZCAieGVuc3RvcmUtbGlzdCAtcCAvIiB3
aWxsIHByaW50Og0KDQovL2xvY2FsDQovL3Rvb2xzDQoNCndoaWNoIGlzIG5vdCB3aGF0IEkn
ZCBleHBlY3QuIDotKA0KDQo+IEhhdmluZyBib3RoIGlzIGdyb3NzIGVycm9yIG9uIGJlaGFs
ZiBvZiB3aG9tZXZlciBhY2NlcHRlZCB0aGUgY29kZSBpbg0KPiB0aGUgZmlyc3QgcGxhY2Uu
wqAgSXQncyBhIGJhZCBlbm91Z2ggdXNhYmlsaXR5IHByb2JsZW0gdGhhdCBJIHRoaW5rIHdl
DQo+IHNob3VsZCBzZXJpb3VzbHkgY29uc2lkZXIgZGVsZXRpbmcgdGhlIGJpbmFyeSByYXRo
ZXIgdGhhbiBhbGxvd2luZw0KPiBhY2NlcHRpbmcgaXQncyBleGlzdGFuY2UuDQo+IA0KPiBC
dXQgYXMgSSBleHBlY3QgdGhhdCB0byBiZSBjb250cm92ZXJzaWFsLCBhdCBhIG1pbmltdW0g
Ym90aCBvZiB0aGUNCj4gbWFucGFnZXMgbmVlZCBzb21lIGtpbmQgb2YgImRvIG5vdCBjb25m
dXNlICRUSElTIHdpdGggJE9USEVSIiB3YXJuaW5nLg0KDQpJdHMgbm90IGFzIGlmIG9uZSBv
ZiB0aG9zZSB3b3VsZCBjYXVzZSBhbnkgaGFybS4NCg0KDQpKdWVyZ2VuDQo=
--------------vP0He5e0E20IM0eylkQpww4L
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------vP0He5e0E20IM0eylkQpww4L--

--------------DwR84ipFeU0iF7zgyWbaFZTd--

--------------IRCvABarFFOIaAwwhrwydgH5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmyvKIFAwAAAAAACgkQsN6d1ii/Ey/B
pwf/TK8w0mtyu7kDWTQlgszGCmMlB4V157RZTCaaGbIEomp6VXHpQ7gry9Z0Ou2k9UNMc3dYufd5
3/HNvKcjpXjNU9je35DX3+L5eIRlmmJ/X7pLUSXbMVwfCQqKqVahenJfDDAAfnoiSO/WOAahxk55
qtCsFfy+6VMnwqzeg0A20SmnrSccSSS6WOCNHC0l34+sqjRNci7yfWVXJTpzLpjRxblNCa6yF3Ze
MyFB7fDafPLAkeH4bGOWc0A1+xsJ/oYCD5hbUUt2zBj01uOko60An6IXelX/VO4KMLs1heTj+13Q
EYJ7exnpT3JRa5XKc+BJ5SntMPkwWOqz5QZrINtVGw==
=DXBW
-----END PGP SIGNATURE-----

--------------IRCvABarFFOIaAwwhrwydgH5--

