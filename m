Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A410EAFDF31
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:24:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037629.1410176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNH3-0007lf-8c; Wed, 09 Jul 2025 05:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037629.1410176; Wed, 09 Jul 2025 05:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNH3-0007ia-4R; Wed, 09 Jul 2025 05:23:17 +0000
Received: by outflank-mailman (input) for mailman id 1037629;
 Wed, 09 Jul 2025 05:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cq+0=ZW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uZNH2-0007iU-CB
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:23:16 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ccf25793-5c84-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 07:23:09 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-ad572ba1347so771411466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 22:23:09 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b03203sm1018414566b.131.2025.07.08.22.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 22:23:08 -0700 (PDT)
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
X-Inumbo-ID: ccf25793-5c84-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752038589; x=1752643389; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y6bo6jTBQUZUZij4pFk2/IgHoc0uEVi8AYBcjlGqR1E=;
        b=Lq1ZHBi7rAMZ+PXE99ju7cC/6spGNuO+vrpKaxYYMjXpSbV0hh0qIySxZ1dqQDtVG9
         0O8axV8MuY13VPKhlBxOuRjmNOK6k0Jzdlo0Gx0NjVGXZYmc5YXzZYTX5k4TpAH3i6Dp
         wJnbwM9d3P2Gg7PnlEHPjgLVTC6heAgJxxQ6Uk+oB6oscXUkl+BTRdmM5GKIUX0h8TYJ
         7qw5UPWzlGakCRZuK51iR2G3HCUC+Phb5p3vqYIBGNdskWvDQM9be4rUocBH1HQUylWS
         gGgORvn9Sz2wXTh0s+A142kbK1F0v4QRBlU7bvPYJDz2qbc2qyGCAdcjuqk5tyvbdtOK
         5lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752038589; x=1752643389;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6bo6jTBQUZUZij4pFk2/IgHoc0uEVi8AYBcjlGqR1E=;
        b=j26sIvLSEg+V1ASQ4E8VxXoZiXk+3r7wc7hDSmePczdzIXOY48V35ck3Vx53SP9KlB
         ALid6GxKrKATPpLCZW+WzZIvwkErHWOO4MMkkA+NKxClubykgjZqpFjlHRFsedvt1d1X
         9UQ8dp7qDJFrd4z+Tk/MYFyJv7BomB6XQBosE+SQrxmr4EE9yRbPnW+skUfInEYiQuRR
         s+PneFTRtOaHfVNnoeX3M/UgW4skVvEOU6pbZZVzv9sQMOSwiddMQGiNBAu7S919ieZY
         jdLRGqVjTu9IAonzHIbbihSXS8gCXVTiRb7jIy96ncT1b3mn7rB4itD3wwPCsiMMJEBb
         dW0w==
X-Forwarded-Encrypted: i=1; AJvYcCXGPDw3M9DRL3W07LHew4DeEYA0cvTsnKO2C3ecPB20K8qAMq8K71d1pMjSHjHPedP2hY0QRRrUNwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwumaCGXSW+b/z6i4OVE1MntcV150mfiOwcArZrLb4TsiQVJfZB
	fjuEig2skhw0TXCEmQKId06X9GzF5B9BX2NKlBPWVp0lBEfG0vXnLuLmx8cCYOr1eGE=
X-Gm-Gg: ASbGncti8Hnk1fCGYNxIOo60vSJmYrfKgyvBKbv5N7e8rSik5QI7HqLilsZXCpG9O0F
	t+CuAtnrYixyP1Oi1MdB9kRyOdsygcwFpA4+9VH8ZbT9yRGlRNS4URgKpFPeAmzf0RI37RwgEbH
	ZdtekQ05FZyHLwPSYeZxsiJE/jLGPZYaSK6/dP7n4kGrmiPqx0idDLPX0/bDCdIM6Tp2zp+Vb6u
	ryw48G1njAayPkt6ZJ2PZiMG6MdyP/ow94J5xc8xuUjqlsE7FE5dJeTRu0U+Zpgt2DuadIHwYhG
	zsrjbWJ699lb3dGKfPbTSxuW9nezblH0rSMQBLDneDBWwHwnbfRakY921EYN6x0K9+W2Tj1SBAO
	FeB1wWalMyqFZ28lSTz8CmciwbRz30QJF5d736TEJro9qR0cwa4TF4Q+emqW+vXzyB+SbW0De2C
	6Uf94eL8KwrwvbMYjeXNU=
X-Google-Smtp-Source: AGHT+IEL1ciZDIadEiOnNaY3zATlwR5PH9VdDZRQ69lXbCIhVNHxXVP0Yk9/kdt1hktjREAdXoW8Pg==
X-Received: by 2002:a17:907:6e9f:b0:ae3:ce75:afd8 with SMTP id a640c23a62f3a-ae6cf78cbdemr98427966b.30.1752038588598;
        Tue, 08 Jul 2025 22:23:08 -0700 (PDT)
Message-ID: <287f6b7e-069e-4a79-b72a-ae11be4c235f@suse.com>
Date: Wed, 9 Jul 2025 07:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/gntdev: remove struct gntdev_copy_batch from stack
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 xen-devel@lists.xenproject.org, Abinash Singh <abinashsinghlalotra@gmail.com>
References: <20250703073259.17356-1-jgross@suse.com>
 <alpine.DEB.2.22.394.2507081150230.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507081150230.605088@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6N4e3vytxwGdIuo0Bs0tiwNj"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6N4e3vytxwGdIuo0Bs0tiwNj
Content-Type: multipart/mixed; boundary="------------yNRAhQ00pt0J0yxQqc1Nhv2I";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 xen-devel@lists.xenproject.org, Abinash Singh <abinashsinghlalotra@gmail.com>
Message-ID: <287f6b7e-069e-4a79-b72a-ae11be4c235f@suse.com>
Subject: Re: [PATCH] xen/gntdev: remove struct gntdev_copy_batch from stack
References: <20250703073259.17356-1-jgross@suse.com>
 <alpine.DEB.2.22.394.2507081150230.605088@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2507081150230.605088@ubuntu-linux-20-04-desktop>

--------------yNRAhQ00pt0J0yxQqc1Nhv2I
Content-Type: multipart/mixed; boundary="------------CYRylcUoVD0qj02p6wFAPnxP"

--------------CYRylcUoVD0qj02p6wFAPnxP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDcuMjUgMjE6MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gVGh1
LCAzIEp1bCAyMDI1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gV2hlbiBjb21waWxpbmcg
dGhlIGtlcm5lbCB3aXRoIExMVk0sIHRoZSBmb2xsb3dpbmcgd2FybmluZyB3YXMgaXNzdWVk
Og0KPj4NCj4+ICAgIGRyaXZlcnMveGVuL2dudGRldi5jOjk5MTogd2FybmluZzogc3RhY2sg
ZnJhbWUgc2l6ZSAoMTE2MCkgZXhjZWVkcw0KPj4gICAgbGltaXQgKDEwMjQpIGluIGZ1bmN0
aW9uICdnbnRkZXZfaW9jdGwnDQo+Pg0KPj4gVGhlIG1haW4gcmVhc29uIGlzIHN0cnVjdCBn
bnRkZXZfY29weV9iYXRjaCB3aGljaCBpcyBsb2NhdGVkIG9uIHRoZQ0KPj4gc3RhY2sgYW5k
IGhhcyBhIHNpemUgb2YgbmVhcmx5IDFrYi4NCj4+DQo+PiBGb3IgcGVyZm9ybWFuY2UgcmVh
c29ucyBpdCBzaG91bGRuJ3QgYnkganVzdCBkeW5hbWljYWxseSBhbGxvY2F0ZWQNCj4+IGlu
c3RlYWQsIHNvIGFsbG9jYXRlIGEgbmV3IGluc3RhbmNlIHdoZW4gbmVlZGVkIGFuZCBpbnN0
ZWFkIG9mIGZyZWVpbmcNCj4+IGl0IHB1dCBpdCBpbnRvIGEgbGlzdCBvZiBmcmVlIHN0cnVj
dHMgYW5jaG9yZWQgaW4gc3RydWN0IGdudGRldl9wcml2Lg0KPj4NCj4+IEZpeGVzOiBhNGNk
YjU1NmNhZTAgKCJ4ZW4vZ250ZGV2OiBhZGQgaW9jdGwgZm9yIGdyYW50IGNvcHkiKQ0KPj4g
UmVwb3J0ZWQtYnk6IEFiaW5hc2ggU2luZ2ggPGFiaW5hc2hzaW5naGxhbG90cmFAZ21haWwu
Y29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMveGVuL2dudGRldi1jb21tb24uaCB8ICA0ICsrKw0K
Pj4gICBkcml2ZXJzL3hlbi9nbnRkZXYuYyAgICAgICAgfCA3MSArKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
eGVuL2dudGRldi1jb21tb24uaCBiL2RyaXZlcnMveGVuL2dudGRldi1jb21tb24uaA0KPj4g
aW5kZXggOWMyODZiMmExOTAwLi5hYzhjZTMxNzliYTIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL3hlbi9nbnRkZXYtY29tbW9uLmgNCj4+ICsrKyBiL2RyaXZlcnMveGVuL2dudGRldi1j
b21tb24uaA0KPj4gQEAgLTI2LDYgKzI2LDEwIEBAIHN0cnVjdCBnbnRkZXZfcHJpdiB7DQo+
PiAgIAkvKiBsb2NrIHByb3RlY3RzIG1hcHMgYW5kIGZyZWVhYmxlX21hcHMuICovDQo+PiAg
IAlzdHJ1Y3QgbXV0ZXggbG9jazsNCj4+ICAgDQo+PiArCS8qIEZyZWUgaW5zdGFuY2VzIG9m
IHN0cnVjdCBnbnRkZXZfY29weV9iYXRjaC4gKi8NCj4+ICsJc3RydWN0IGdudGRldl9jb3B5
X2JhdGNoICpiYXRjaDsNCj4+ICsJc3RydWN0IG11dGV4IGJhdGNoX2xvY2s7DQo+PiArDQo+
PiAgICNpZmRlZiBDT05GSUdfWEVOX0dSQU5UX0RNQV9BTExPQw0KPj4gICAJLyogRGV2aWNl
IGZvciB3aGljaCBETUEgbWVtb3J5IGlzIGFsbG9jYXRlZC4gKi8NCj4+ICAgCXN0cnVjdCBk
ZXZpY2UgKmRtYV9kZXY7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZ250ZGV2LmMg
Yi9kcml2ZXJzL3hlbi9nbnRkZXYuYw0KPj4gaW5kZXggNjFmYWVhMWYwNjYzLi4xZjIxNjA3
NjU2MTggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3hlbi9nbnRkZXYuYw0KPj4gKysrIGIv
ZHJpdmVycy94ZW4vZ250ZGV2LmMNCj4+IEBAIC01Niw2ICs1NiwxOCBAQCBNT0RVTEVfQVVU
SE9SKCJEZXJlayBHLiBNdXJyYXkgPERlcmVrLk11cnJheUBjbC5jYW0uYWMudWs+LCAiDQo+
PiAgIAkgICAgICAiR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Iik7DQo+PiAg
IE1PRFVMRV9ERVNDUklQVElPTigiVXNlci1zcGFjZSBncmFudGVkIHBhZ2UgYWNjZXNzIGRy
aXZlciIpOw0KPj4gICANCj4+ICsjZGVmaW5lIEdOVERFVl9DT1BZX0JBVENIIDE2DQo+PiAr
DQo+PiArc3RydWN0IGdudGRldl9jb3B5X2JhdGNoIHsNCj4+ICsJc3RydWN0IGdudHRhYl9j
b3B5IG9wc1tHTlRERVZfQ09QWV9CQVRDSF07DQo+PiArCXN0cnVjdCBwYWdlICpwYWdlc1tH
TlRERVZfQ09QWV9CQVRDSF07DQo+PiArCXMxNiBfX3VzZXIgKnN0YXR1c1tHTlRERVZfQ09Q
WV9CQVRDSF07DQo+PiArCXVuc2lnbmVkIGludCBucl9vcHM7DQo+PiArCXVuc2lnbmVkIGlu
dCBucl9wYWdlczsNCj4+ICsJYm9vbCB3cml0ZWFibGU7DQo+PiArCXN0cnVjdCBnbnRkZXZf
Y29weV9iYXRjaCAqbmV4dDsNCj4+ICt9Ow0KPj4gKw0KPj4gICBzdGF0aWMgdW5zaWduZWQg
aW50IGxpbWl0ID0gNjQqMTAyNDsNCj4+ICAgbW9kdWxlX3BhcmFtKGxpbWl0LCB1aW50LCAw
NjQ0KTsNCj4+ICAgTU9EVUxFX1BBUk1fREVTQyhsaW1pdCwNCj4+IEBAIC01ODQsNiArNTk2
LDggQEAgc3RhdGljIGludCBnbnRkZXZfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgZmlsZSAqZmxpcCkNCj4+ICAgCUlOSVRfTElTVF9IRUFEKCZwcml2LT5tYXBzKTsNCj4+
ICAgCW11dGV4X2luaXQoJnByaXYtPmxvY2spOw0KPj4gICANCj4+ICsJbXV0ZXhfaW5pdCgm
cHJpdi0+YmF0Y2hfbG9jayk7DQo+PiArDQo+PiAgICNpZmRlZiBDT05GSUdfWEVOX0dOVERF
Vl9ETUFCVUYNCj4+ICAgCXByaXYtPmRtYWJ1Zl9wcml2ID0gZ250ZGV2X2RtYWJ1Zl9pbml0
KGZsaXApOw0KPj4gICAJaWYgKElTX0VSUihwcml2LT5kbWFidWZfcHJpdikpIHsNCj4+IEBA
IC02MDgsNiArNjIyLDcgQEAgc3RhdGljIGludCBnbnRkZXZfcmVsZWFzZShzdHJ1Y3QgaW5v
ZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmxpcCkNCj4+ICAgew0KPj4gICAJc3RydWN0IGdu
dGRldl9wcml2ICpwcml2ID0gZmxpcC0+cHJpdmF0ZV9kYXRhOw0KPj4gICAJc3RydWN0IGdu
dGRldl9ncmFudF9tYXAgKm1hcDsNCj4+ICsJc3RydWN0IGdudGRldl9jb3B5X2JhdGNoICpi
YXRjaDsNCj4+ICAgDQo+PiAgIAlwcl9kZWJ1ZygicHJpdiAlcFxuIiwgcHJpdik7DQo+PiAg
IA0KPj4gQEAgLTYyMCw2ICs2MzUsMTQgQEAgc3RhdGljIGludCBnbnRkZXZfcmVsZWFzZShz
dHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmxpcCkNCj4+ICAgCX0NCj4+ICAg
CW11dGV4X3VubG9jaygmcHJpdi0+bG9jayk7DQo+PiAgIA0KPj4gKwltdXRleF9sb2NrKCZw
cml2LT5iYXRjaF9sb2NrKTsNCj4+ICsJd2hpbGUgKHByaXYtPmJhdGNoKSB7DQo+PiArCQli
YXRjaCA9IHByaXYtPmJhdGNoOw0KPj4gKwkJcHJpdi0+YmF0Y2ggPSBiYXRjaC0+bmV4dDsN
Cj4+ICsJCWtmcmVlKGJhdGNoKTsNCj4+ICsJfQ0KPj4gKwltdXRleF91bmxvY2soJnByaXYt
PmJhdGNoX2xvY2spOw0KPj4gKw0KPj4gICAjaWZkZWYgQ09ORklHX1hFTl9HTlRERVZfRE1B
QlVGDQo+PiAgIAlnbnRkZXZfZG1hYnVmX2ZpbmkocHJpdi0+ZG1hYnVmX3ByaXYpOw0KPj4g
ICAjZW5kaWYNCj4+IEBAIC03ODUsMTcgKzgwOCw2IEBAIHN0YXRpYyBsb25nIGdudGRldl9p
b2N0bF9ub3RpZnkoc3RydWN0IGdudGRldl9wcml2ICpwcml2LCB2b2lkIF9fdXNlciAqdSkN
Cj4+ICAgCXJldHVybiByYzsNCj4+ICAgfQ0KPj4gICANCj4+IC0jZGVmaW5lIEdOVERFVl9D
T1BZX0JBVENIIDE2DQo+PiAtDQo+PiAtc3RydWN0IGdudGRldl9jb3B5X2JhdGNoIHsNCj4+
IC0Jc3RydWN0IGdudHRhYl9jb3B5IG9wc1tHTlRERVZfQ09QWV9CQVRDSF07DQo+PiAtCXN0
cnVjdCBwYWdlICpwYWdlc1tHTlRERVZfQ09QWV9CQVRDSF07DQo+PiAtCXMxNiBfX3VzZXIg
KnN0YXR1c1tHTlRERVZfQ09QWV9CQVRDSF07DQo+PiAtCXVuc2lnbmVkIGludCBucl9vcHM7
DQo+PiAtCXVuc2lnbmVkIGludCBucl9wYWdlczsNCj4+IC0JYm9vbCB3cml0ZWFibGU7DQo+
PiAtfTsNCj4+IC0NCj4+ICAgc3RhdGljIGludCBnbnRkZXZfZ2V0X3BhZ2Uoc3RydWN0IGdu
dGRldl9jb3B5X2JhdGNoICpiYXRjaCwgdm9pZCBfX3VzZXIgKnZpcnQsDQo+PiAgIAkJCQl1
bnNpZ25lZCBsb25nICpnZm4pDQo+PiAgIHsNCj4+IEBAIC05NTMsMzYgKzk2NSw1MyBAQCBz
dGF0aWMgaW50IGdudGRldl9ncmFudF9jb3B5X3NlZyhzdHJ1Y3QgZ250ZGV2X2NvcHlfYmF0
Y2ggKmJhdGNoLA0KPj4gICBzdGF0aWMgbG9uZyBnbnRkZXZfaW9jdGxfZ3JhbnRfY29weShz
dHJ1Y3QgZ250ZGV2X3ByaXYgKnByaXYsIHZvaWQgX191c2VyICp1KQ0KPj4gICB7DQo+PiAg
IAlzdHJ1Y3QgaW9jdGxfZ250ZGV2X2dyYW50X2NvcHkgY29weTsNCj4+IC0Jc3RydWN0IGdu
dGRldl9jb3B5X2JhdGNoIGJhdGNoOw0KPj4gKwlzdHJ1Y3QgZ250ZGV2X2NvcHlfYmF0Y2gg
KmJhdGNoOw0KPj4gICAJdW5zaWduZWQgaW50IGk7DQo+PiAgIAlpbnQgcmV0ID0gMDsNCj4+
ICAgDQo+PiAgIAlpZiAoY29weV9mcm9tX3VzZXIoJmNvcHksIHUsIHNpemVvZihjb3B5KSkp
DQo+PiAgIAkJcmV0dXJuIC1FRkFVTFQ7DQo+PiAgIA0KPj4gLQliYXRjaC5ucl9vcHMgPSAw
Ow0KPj4gLQliYXRjaC5ucl9wYWdlcyA9IDA7DQo+PiArCW11dGV4X2xvY2soJnByaXYtPmJh
dGNoX2xvY2spOw0KPj4gKwlpZiAoIXByaXYtPmJhdGNoKSB7DQo+PiArCQliYXRjaCA9IGtt
YWxsb2Moc2l6ZW9mKCpiYXRjaCksIEdGUF9LRVJORUwpOw0KPj4gKwl9IGVsc2Ugew0KPj4g
KwkJYmF0Y2ggPSBwcml2LT5iYXRjaDsNCj4+ICsJCXByaXYtPmJhdGNoID0gYmF0Y2gtPm5l
eHQ7DQo+PiArCX0NCj4+ICsJbXV0ZXhfdW5sb2NrKCZwcml2LT5iYXRjaF9sb2NrKTsNCj4g
DQo+IEkgYW0gY29uY2VybmVkIGFib3V0IHRoZSBwb3RlbnRpYWxseSB1bmJvdW5kZWQgYW1v
dW50IG9mIG1lbW9yeSB0aGF0DQo+IGNvdWxkIGJlIGFsbG9jYXRlZCB0aGlzIHdheS4NCg0K
VW5ib3VuZGVkPyBJdCBjYW4gYmUgYXQgbW9zdCB0aGUgbnVtYmVyIG9mIHRocmVhZHMgdXNp
bmcgdGhlIGludGVyZmFjZQ0KY29uY3VycmVudGx5Lg0KDQo+IFRoZSBtdXRleCBpcyBhbHJl
YWR5IGEgcG90ZW50aWFsbHkgdmVyeSBzbG93IG9wZXJhdGlvbi4gQ291bGQgd2UgaW5zdGVh
ZA0KPiBhbGxvY2F0ZSBhIHNpbmdsZSBiYXRjaCwgYW5kIGlmIGl0IGlzIGN1cnJlbnRseSBp
biB1c2UsIHVzZSB0aGUgbXV0ZXggdG8NCj4gd2FpdCB1bnRpbCBpdCBiZWNvbWVzIGF2YWls
YWJsZT8NCg0KQXMgdGhpcyBpbnRlcmZhY2UgaXMgZS5nLiB1c2VkIGJ5IHRoZSBxZW11IGJh
c2VkIHFkaXNrIGJhY2tlbmQsIHRoZSBjaGFuY2VzDQphcmUgdmVyeSBoaWdoIHRoYXQgdGhl
cmUgYXJlIGNvbmN1cnJlbnQgdXNlcnMuIFRoaXMgd291bGQgaHVydCBtdWx0aS1yaW5nDQpx
ZGlzayBxdWl0ZSBiYWRseSENCg0KSXQgd291bGQgYmUgcG9zc2libGUgdG8gcmVwbGFjZSB0
aGUgbXV0ZXggd2l0aCBhIHNwaW5sb2NrIGFuZCBkbyB0aGUga21hbGxvYygpDQpvdXRzaWRl
IHRoZSBsb2NrZWQgcmVnaW9uLg0KDQo+IA0KPiBJIGFtIGFsc28gT0sgd2l0aCB0aGUgY3Vy
cmVudCBhcHByb2FjaCBidXQgSSB0aG91Z2h0IEkgd291bGQgYXNrLg0KPiANCj4gDQo+IA0K
PiANCj4+ICsJaWYgKCFiYXRjaCkNCj4+ICsJCXJldHVybiAtRU5PTUVNOw0KPj4gKw0KPj4g
KwliYXRjaC0+bnJfb3BzID0gMDsNCj4+ICsJYmF0Y2gtPm5yX3BhZ2VzID0gMDsNCj4+ICAg
DQo+PiAgIAlmb3IgKGkgPSAwOyBpIDwgY29weS5jb3VudDsgaSsrKSB7DQo+PiAgIAkJc3Ry
dWN0IGdudGRldl9ncmFudF9jb3B5X3NlZ21lbnQgc2VnOw0KPj4gICANCj4+ICAgCQlpZiAo
Y29weV9mcm9tX3VzZXIoJnNlZywgJmNvcHkuc2VnbWVudHNbaV0sIHNpemVvZihzZWcpKSkg
ew0KPj4gICAJCQlyZXQgPSAtRUZBVUxUOw0KPj4gKwkJCWdudGRldl9wdXRfcGFnZXMoYmF0
Y2gpOw0KPj4gICAJCQlnb3RvIG91dDsNCj4+ICAgCQl9DQo+PiAgIA0KPj4gLQkJcmV0ID0g
Z250ZGV2X2dyYW50X2NvcHlfc2VnKCZiYXRjaCwgJnNlZywgJmNvcHkuc2VnbWVudHNbaV0u
c3RhdHVzKTsNCj4+IC0JCWlmIChyZXQgPCAwKQ0KPj4gKwkJcmV0ID0gZ250ZGV2X2dyYW50
X2NvcHlfc2VnKGJhdGNoLCAmc2VnLCAmY29weS5zZWdtZW50c1tpXS5zdGF0dXMpOw0KPj4g
KwkJaWYgKHJldCA8IDApIHsNCj4+ICsJCQlnbnRkZXZfcHV0X3BhZ2VzKGJhdGNoKTsNCj4+
ICAgCQkJZ290byBvdXQ7DQo+PiArCQl9DQo+PiAgIA0KPj4gICAJCWNvbmRfcmVzY2hlZCgp
Ow0KPj4gICAJfQ0KPj4gLQlpZiAoYmF0Y2gubnJfb3BzKQ0KPj4gLQkJcmV0ID0gZ250ZGV2
X2NvcHkoJmJhdGNoKTsNCj4+IC0JcmV0dXJuIHJldDsNCj4+ICsJaWYgKGJhdGNoLT5ucl9v
cHMpDQo+PiArCQlyZXQgPSBnbnRkZXZfY29weShiYXRjaCk7DQo+PiArDQo+PiArIG91dDoN
Cj4+ICsJbXV0ZXhfbG9jaygmcHJpdi0+YmF0Y2hfbG9jayk7DQo+PiArCWJhdGNoLT5uZXh0
ID0gcHJpdi0+YmF0Y2g7DQo+PiArCXByaXYtPmJhdGNoID0gYmF0Y2g7DQo+PiArCW11dGV4
X3VubG9jaygmcHJpdi0+YmF0Y2hfbG9jayk7DQo+PiAgIA0KPj4gLSAgb3V0Og0KPj4gLQln
bnRkZXZfcHV0X3BhZ2VzKCZiYXRjaCk7DQo+IA0KPiBPbmUgY2hhbmdlIGZyb20gYmVmb3Jl
IGlzIHRoYXQgaW4gY2FzZSBvZiBubyBlcnJvcnMsIGdudGRldl9wdXRfcGFnZXMgaXMNCj4g
bm90IGNhbGxlZCBhbnltb3JlLiBEbyB3ZSB3YW50IHRoYXQ/IFNwZWNpZmljYWxseSwgd2Ug
YXJlIG1pc3NpbmcgdGhlDQo+IGNhbGwgdG8gdW5waW5fdXNlcl9wYWdlc19kaXJ0eV9sb2Nr
DQoNCkkgZG9uJ3QgdGhpbmsgeW91IGFyZSByaWdodC4gVGhlcmUgd2FzIGEgInJldHVybiBy
ZXQiIGJlZm9yZSB0aGUgIm91dDoiDQpsYWJlbCBiZWZvcmUgbXkgcGF0Y2guDQoNCg0KSnVl
cmdlbg0K
--------------CYRylcUoVD0qj02p6wFAPnxP
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

--------------CYRylcUoVD0qj02p6wFAPnxP--

--------------yNRAhQ00pt0J0yxQqc1Nhv2I--

--------------6N4e3vytxwGdIuo0Bs0tiwNj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmht/LsFAwAAAAAACgkQsN6d1ii/Ey9O
hQf+LRW8NcSWZaGwBSomAFRDMUUKfz6VmBeTg+J3jVEFs0cuIpEOqq5yaGAnLZv4oUlMsxBnsEEc
DCKNHcRwC5P86TZeqt1aiQGDpMP1HO9nXs9e7On/YGdi3E9XL9qxGOddNjfjMo9VEnDy2oQHj3jh
RD8I7e1HGhVTjjTnTInVtBtKyZ4kuR97+1L+PwhdkksPBWvQ/raFhn2Gbh4x6WRR+7b/NzU+LRxL
IMSBG8xSwsptJvkvaIxM15iJXJEjmZ8EnFlsYLh9RWvd5j4xGA20uzsW3Gw0LVU0/sRxRygErkBD
Kal7hhCES3gO1MuaR3ETp7eGeozHsFrjLP/3CPqLoQ==
=1482
-----END PGP SIGNATURE-----

--------------6N4e3vytxwGdIuo0Bs0tiwNj--

