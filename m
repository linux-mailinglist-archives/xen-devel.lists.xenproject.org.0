Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E128FB01439
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 09:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040564.1411974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua808-0004sg-Ed; Fri, 11 Jul 2025 07:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040564.1411974; Fri, 11 Jul 2025 07:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua808-0004pv-Bd; Fri, 11 Jul 2025 07:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1040564;
 Fri, 11 Jul 2025 07:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7n+=ZY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ua806-0004pI-UN
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 07:16:55 +0000
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [2a00:1450:4864:20::344])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05041d2e-5e27-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 09:16:53 +0200 (CEST)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso21314905e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 00:16:53 -0700 (PDT)
Received: from ?IPV6:2003:e5:8709:f00:6357:915b:11f9:6d20?
 (p200300e587090f006357915b11f96d20.dip0.t-ipconnect.de.
 [2003:e5:8709:f00:6357:915b:11f9:6d20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc22a8sm3814372f8f.34.2025.07.11.00.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jul 2025 00:16:51 -0700 (PDT)
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
X-Inumbo-ID: 05041d2e-5e27-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752218212; x=1752823012; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8c07lq3Kk9BYKYCRee33D6YitV4anarQ7sDXyRLxQKE=;
        b=fRCyopgAxtPpUi/mOaqpwSKKax8fkYPCKmMNk0Af7bcKIsjNP0k3Ewqb7kqLW72a1h
         Kp1XQvvsfw/i7+cOKglMIp1Fzrd2zSyVqdEZ3vWi3Nuor8VH7PiUs6511q14b5SS3iD4
         o+SOXIx7xOSiuuqLkLANVvhdC20nhciqR4GBJwVAt2Q27yGA57gfK97qbydPw9scYr+6
         A+UfFam3zt9ikKayZdxraV/EAgv6i9Ecv1pKl5ILIb/T04hDpL4kzmVXYjGeNZNe8nGq
         MGT+RkSAVafw7qD8GXVZl6XP4zoQ0zfpU7FqnnIngEuo722DAMK7Ofiz4jlcPWHyWMZv
         HtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218212; x=1752823012;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8c07lq3Kk9BYKYCRee33D6YitV4anarQ7sDXyRLxQKE=;
        b=T1PCuTdJnYADesBciiAj/yy+gY/vevWNxIhafxvggNAy0bAjFzMwqQrzvKnfm/yOM1
         rqW/CZVuRzMVPUcnm2+k/hEhtyknmt0qjPxRSIL6EtgES3XfrY0e3Taesf25231GybCI
         h6vlEgQ9QH9Ngr7XDlrcMXC94ZtoeVZId4nB50SIMJdK4/cXX/MdHSO93704/V0zwj0D
         5UNK71gj4BlQSnpm6oouSDz3mxklQ4cY/mRqxSY2tSQZ4O8nw5CHBWsETFJYSAA2Uxff
         evZCaMN+OoyNsYL7DHMES4oxwXO9bR7g8G6TfbzeezQn1PWk7q8jmLtkmHx9cewFYsct
         bzqw==
X-Forwarded-Encrypted: i=1; AJvYcCXCKO4nQxdSJ1m8ytP9sOyxEcv7jrCjDjLZ7ox4UO9RSkTQ7y97jvDuYkMrzkjrTLE8QKsEEIaOI6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGuXTLWyoHEmwczWx8t6nTXQItbIEJ+mlAuuIbk8MDExtDrK/O
	32vs7wDm26zTxqi+RsCKcIhbTUZCFH4Azsijr8a6a8NhW1zuKOdv2tziXKzr8pzYsz8=
X-Gm-Gg: ASbGncsvUMQV/47DHtC8t64x8T6RuTsjYf/F5CFKDRZ/Kn/jhIlZuL+YGsPZgybWHbQ
	NXqDOuE5tl4tn92KLYmXFjcz8FVh8VFSAnBLNTsdnhPzk5Tyfmk1m7IXcu4Za8DKFZb5fZRXH5f
	aOTzqt7RetfRwr7b5vSM0CqHE2OY/az+dC+0KGX/Ml/EC/wRGirqREXN/beJ/mFF8qZDJoSapli
	k7UDxdoQV66fIUNlY/g/VrVYr18yM2My3MMwJ0kFj7V089CrvyxmkRWxGQkmU0ZG1NpXBcZtPuc
	N2BHnbY1WVXdu+B4/VwP+A6lG8G4JEz+R6Ps0/s73SF3LqNXVttwiHuJdXmyqqPlx3DaIa0Ujof
	E9P6w1ws0gwJWMUXimEmmYNK6qyRSWsyE+zfLh0Ofn3OYg9N7ugrAjZdbJM8AS6cc2UEbCU+O7C
	lWbTK7+j8K4ST4HjPWVoOyZGgLLZrL1VIEVI6nM5l3oxFXeyhs2FVRNIg=
X-Google-Smtp-Source: AGHT+IGvyqW92yMuM81wRhL2tPIozt8RuU5MoEtd4s4IcyuqItpHde2tuEb560iV+xbpeb186JeUVw==
X-Received: by 2002:a05:600c:8b64:b0:453:6146:1172 with SMTP id 5b1f17b1804b1-454ec14deccmr16712575e9.3.1752218212289;
        Fri, 11 Jul 2025 00:16:52 -0700 (PDT)
Message-ID: <1a82dcb5-2ccf-4c8b-b0a4-fd055cfe99f1@suse.com>
Date: Fri, 11 Jul 2025 09:16:50 +0200
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
 <287f6b7e-069e-4a79-b72a-ae11be4c235f@suse.com>
 <alpine.DEB.2.22.394.2507101802220.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507101802220.605088@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FEN1ck1FJL6iTUzUfYz00J5y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FEN1ck1FJL6iTUzUfYz00J5y
Content-Type: multipart/mixed; boundary="------------rxYdYISBKm0VEERw7LRxLsK4";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 xen-devel@lists.xenproject.org, Abinash Singh <abinashsinghlalotra@gmail.com>
Message-ID: <1a82dcb5-2ccf-4c8b-b0a4-fd055cfe99f1@suse.com>
Subject: Re: [PATCH] xen/gntdev: remove struct gntdev_copy_batch from stack
References: <20250703073259.17356-1-jgross@suse.com>
 <alpine.DEB.2.22.394.2507081150230.605088@ubuntu-linux-20-04-desktop>
 <287f6b7e-069e-4a79-b72a-ae11be4c235f@suse.com>
 <alpine.DEB.2.22.394.2507101802220.605088@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2507101802220.605088@ubuntu-linux-20-04-desktop>

--------------rxYdYISBKm0VEERw7LRxLsK4
Content-Type: multipart/mixed; boundary="------------1s7eef5IB8O5tFuS77ajesT6"

--------------1s7eef5IB8O5tFuS77ajesT6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjUgMDM6MDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gV2Vk
LCA5IEp1bCAyMDI1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KPj4gT24gMDguMDcuMjUgMjE6
MDEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+PiBPbiBUaHUsIDMgSnVsIDIwMjUs
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IFdoZW4gY29tcGlsaW5nIHRoZSBrZXJuZWwg
d2l0aCBMTFZNLCB0aGUgZm9sbG93aW5nIHdhcm5pbmcgd2FzIGlzc3VlZDoNCj4+Pj4NCj4+
Pj4gICAgIGRyaXZlcnMveGVuL2dudGRldi5jOjk5MTogd2FybmluZzogc3RhY2sgZnJhbWUg
c2l6ZSAoMTE2MCkgZXhjZWVkcw0KPj4+PiAgICAgbGltaXQgKDEwMjQpIGluIGZ1bmN0aW9u
ICdnbnRkZXZfaW9jdGwnDQo+Pj4+DQo+Pj4+IFRoZSBtYWluIHJlYXNvbiBpcyBzdHJ1Y3Qg
Z250ZGV2X2NvcHlfYmF0Y2ggd2hpY2ggaXMgbG9jYXRlZCBvbiB0aGUNCj4+Pj4gc3RhY2sg
YW5kIGhhcyBhIHNpemUgb2YgbmVhcmx5IDFrYi4NCj4+Pj4NCj4+Pj4gRm9yIHBlcmZvcm1h
bmNlIHJlYXNvbnMgaXQgc2hvdWxkbid0IGJ5IGp1c3QgZHluYW1pY2FsbHkgYWxsb2NhdGVk
DQo+Pj4+IGluc3RlYWQsIHNvIGFsbG9jYXRlIGEgbmV3IGluc3RhbmNlIHdoZW4gbmVlZGVk
IGFuZCBpbnN0ZWFkIG9mIGZyZWVpbmcNCj4+Pj4gaXQgcHV0IGl0IGludG8gYSBsaXN0IG9m
IGZyZWUgc3RydWN0cyBhbmNob3JlZCBpbiBzdHJ1Y3QgZ250ZGV2X3ByaXYuDQo+Pj4+DQo+
Pj4+IEZpeGVzOiBhNGNkYjU1NmNhZTAgKCJ4ZW4vZ250ZGV2OiBhZGQgaW9jdGwgZm9yIGdy
YW50IGNvcHkiKQ0KPj4+PiBSZXBvcnRlZC1ieTogQWJpbmFzaCBTaW5naCA8YWJpbmFzaHNp
bmdobGFsb3RyYUBnbWFpbC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMveGVuL2du
dGRldi1jb21tb24uaCB8ICA0ICsrKw0KPj4+PiAgICBkcml2ZXJzL3hlbi9nbnRkZXYuYyAg
ICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+Pj4+
ICAgIDIgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0p
DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9nbnRkZXYtY29tbW9uLmgg
Yi9kcml2ZXJzL3hlbi9nbnRkZXYtY29tbW9uLmgNCj4+Pj4gaW5kZXggOWMyODZiMmExOTAw
Li5hYzhjZTMxNzliYTIgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMveGVuL2dudGRldi1j
b21tb24uaA0KPj4+PiArKysgYi9kcml2ZXJzL3hlbi9nbnRkZXYtY29tbW9uLmgNCj4+Pj4g
QEAgLTI2LDYgKzI2LDEwIEBAIHN0cnVjdCBnbnRkZXZfcHJpdiB7DQo+Pj4+ICAgIAkvKiBs
b2NrIHByb3RlY3RzIG1hcHMgYW5kIGZyZWVhYmxlX21hcHMuICovDQo+Pj4+ICAgIAlzdHJ1
Y3QgbXV0ZXggbG9jazsNCj4+Pj4gICAgKwkvKiBGcmVlIGluc3RhbmNlcyBvZiBzdHJ1Y3Qg
Z250ZGV2X2NvcHlfYmF0Y2guICovDQo+Pj4+ICsJc3RydWN0IGdudGRldl9jb3B5X2JhdGNo
ICpiYXRjaDsNCj4+Pj4gKwlzdHJ1Y3QgbXV0ZXggYmF0Y2hfbG9jazsNCj4+Pj4gKw0KPj4+
PiAgICAjaWZkZWYgQ09ORklHX1hFTl9HUkFOVF9ETUFfQUxMT0MNCj4+Pj4gICAgCS8qIERl
dmljZSBmb3Igd2hpY2ggRE1BIG1lbW9yeSBpcyBhbGxvY2F0ZWQuICovDQo+Pj4+ICAgIAlz
dHJ1Y3QgZGV2aWNlICpkbWFfZGV2Ow0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4v
Z250ZGV2LmMgYi9kcml2ZXJzL3hlbi9nbnRkZXYuYw0KPj4+PiBpbmRleCA2MWZhZWExZjA2
NjMuLjFmMjE2MDc2NTYxOCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2
LmMNCj4+Pj4gKysrIGIvZHJpdmVycy94ZW4vZ250ZGV2LmMNCj4+Pj4gQEAgLTU2LDYgKzU2
LDE4IEBAIE1PRFVMRV9BVVRIT1IoIkRlcmVrIEcuIE11cnJheQ0KPj4+PiA8RGVyZWsuTXVy
cmF5QGNsLmNhbS5hYy51az4sICINCj4+Pj4gICAgCSAgICAgICJHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4iKTsNCj4+Pj4gICAgTU9EVUxFX0RFU0NSSVBUSU9OKCJVc2Vy
LXNwYWNlIGdyYW50ZWQgcGFnZSBhY2Nlc3MgZHJpdmVyIik7DQo+Pj4+ICAgICsjZGVmaW5l
IEdOVERFVl9DT1BZX0JBVENIIDE2DQo+Pj4+ICsNCj4+Pj4gK3N0cnVjdCBnbnRkZXZfY29w
eV9iYXRjaCB7DQo+Pj4+ICsJc3RydWN0IGdudHRhYl9jb3B5IG9wc1tHTlRERVZfQ09QWV9C
QVRDSF07DQo+Pj4+ICsJc3RydWN0IHBhZ2UgKnBhZ2VzW0dOVERFVl9DT1BZX0JBVENIXTsN
Cj4+Pj4gKwlzMTYgX191c2VyICpzdGF0dXNbR05UREVWX0NPUFlfQkFUQ0hdOw0KPj4+PiAr
CXVuc2lnbmVkIGludCBucl9vcHM7DQo+Pj4+ICsJdW5zaWduZWQgaW50IG5yX3BhZ2VzOw0K
Pj4+PiArCWJvb2wgd3JpdGVhYmxlOw0KPj4+PiArCXN0cnVjdCBnbnRkZXZfY29weV9iYXRj
aCAqbmV4dDsNCj4+Pj4gK307DQo+Pj4+ICsNCj4+Pj4gICAgc3RhdGljIHVuc2lnbmVkIGlu
dCBsaW1pdCA9IDY0KjEwMjQ7DQo+Pj4+ICAgIG1vZHVsZV9wYXJhbShsaW1pdCwgdWludCwg
MDY0NCk7DQo+Pj4+ICAgIE1PRFVMRV9QQVJNX0RFU0MobGltaXQsDQo+Pj4+IEBAIC01ODQs
NiArNTk2LDggQEAgc3RhdGljIGludCBnbnRkZXZfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBzdHJ1Y3QNCj4+Pj4gZmlsZSAqZmxpcCkNCj4+Pj4gICAgCUlOSVRfTElTVF9IRUFEKCZw
cml2LT5tYXBzKTsNCj4+Pj4gICAgCW11dGV4X2luaXQoJnByaXYtPmxvY2spOw0KPj4+PiAg
ICArCW11dGV4X2luaXQoJnByaXYtPmJhdGNoX2xvY2spOw0KPj4+PiArDQo+Pj4+ICAgICNp
ZmRlZiBDT05GSUdfWEVOX0dOVERFVl9ETUFCVUYNCj4+Pj4gICAgCXByaXYtPmRtYWJ1Zl9w
cml2ID0gZ250ZGV2X2RtYWJ1Zl9pbml0KGZsaXApOw0KPj4+PiAgICAJaWYgKElTX0VSUihw
cml2LT5kbWFidWZfcHJpdikpIHsNCj4+Pj4gQEAgLTYwOCw2ICs2MjIsNyBAQCBzdGF0aWMg
aW50IGdudGRldl9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdA0KPj4+PiBm
aWxlICpmbGlwKQ0KPj4+PiAgICB7DQo+Pj4+ICAgIAlzdHJ1Y3QgZ250ZGV2X3ByaXYgKnBy
aXYgPSBmbGlwLT5wcml2YXRlX2RhdGE7DQo+Pj4+ICAgIAlzdHJ1Y3QgZ250ZGV2X2dyYW50
X21hcCAqbWFwOw0KPj4+PiArCXN0cnVjdCBnbnRkZXZfY29weV9iYXRjaCAqYmF0Y2g7DQo+
Pj4+ICAgICAgCXByX2RlYnVnKCJwcml2ICVwXG4iLCBwcml2KTsNCj4+Pj4gICAgQEAgLTYy
MCw2ICs2MzUsMTQgQEAgc3RhdGljIGludCBnbnRkZXZfcmVsZWFzZShzdHJ1Y3QgaW5vZGUg
Kmlub2RlLA0KPj4+PiBzdHJ1Y3QgZmlsZSAqZmxpcCkNCj4+Pj4gICAgCX0NCj4+Pj4gICAg
CW11dGV4X3VubG9jaygmcHJpdi0+bG9jayk7DQo+Pj4+ICAgICsJbXV0ZXhfbG9jaygmcHJp
di0+YmF0Y2hfbG9jayk7DQo+Pj4+ICsJd2hpbGUgKHByaXYtPmJhdGNoKSB7DQo+Pj4+ICsJ
CWJhdGNoID0gcHJpdi0+YmF0Y2g7DQo+Pj4+ICsJCXByaXYtPmJhdGNoID0gYmF0Y2gtPm5l
eHQ7DQo+Pj4+ICsJCWtmcmVlKGJhdGNoKTsNCj4+Pj4gKwl9DQo+Pj4+ICsJbXV0ZXhfdW5s
b2NrKCZwcml2LT5iYXRjaF9sb2NrKTsNCj4+Pj4gKw0KPj4+PiAgICAjaWZkZWYgQ09ORklH
X1hFTl9HTlRERVZfRE1BQlVGDQo+Pj4+ICAgIAlnbnRkZXZfZG1hYnVmX2ZpbmkocHJpdi0+
ZG1hYnVmX3ByaXYpOw0KPj4+PiAgICAjZW5kaWYNCj4+Pj4gQEAgLTc4NSwxNyArODA4LDYg
QEAgc3RhdGljIGxvbmcgZ250ZGV2X2lvY3RsX25vdGlmeShzdHJ1Y3QgZ250ZGV2X3ByaXYN
Cj4+Pj4gKnByaXYsIHZvaWQgX191c2VyICp1KQ0KPj4+PiAgICAJcmV0dXJuIHJjOw0KPj4+
PiAgICB9DQo+Pj4+ICAgIC0jZGVmaW5lIEdOVERFVl9DT1BZX0JBVENIIDE2DQo+Pj4+IC0N
Cj4+Pj4gLXN0cnVjdCBnbnRkZXZfY29weV9iYXRjaCB7DQo+Pj4+IC0Jc3RydWN0IGdudHRh
Yl9jb3B5IG9wc1tHTlRERVZfQ09QWV9CQVRDSF07DQo+Pj4+IC0Jc3RydWN0IHBhZ2UgKnBh
Z2VzW0dOVERFVl9DT1BZX0JBVENIXTsNCj4+Pj4gLQlzMTYgX191c2VyICpzdGF0dXNbR05U
REVWX0NPUFlfQkFUQ0hdOw0KPj4+PiAtCXVuc2lnbmVkIGludCBucl9vcHM7DQo+Pj4+IC0J
dW5zaWduZWQgaW50IG5yX3BhZ2VzOw0KPj4+PiAtCWJvb2wgd3JpdGVhYmxlOw0KPj4+PiAt
fTsNCj4+Pj4gLQ0KPj4+PiAgICBzdGF0aWMgaW50IGdudGRldl9nZXRfcGFnZShzdHJ1Y3Qg
Z250ZGV2X2NvcHlfYmF0Y2ggKmJhdGNoLCB2b2lkIF9fdXNlcg0KPj4+PiAqdmlydCwNCj4+
Pj4gICAgCQkJCXVuc2lnbmVkIGxvbmcgKmdmbikNCj4+Pj4gICAgew0KPj4+PiBAQCAtOTUz
LDM2ICs5NjUsNTMgQEAgc3RhdGljIGludCBnbnRkZXZfZ3JhbnRfY29weV9zZWcoc3RydWN0
DQo+Pj4+IGdudGRldl9jb3B5X2JhdGNoICpiYXRjaCwNCj4+Pj4gICAgc3RhdGljIGxvbmcg
Z250ZGV2X2lvY3RsX2dyYW50X2NvcHkoc3RydWN0IGdudGRldl9wcml2ICpwcml2LCB2b2lk
DQo+Pj4+IF9fdXNlciAqdSkNCj4+Pj4gICAgew0KPj4+PiAgICAJc3RydWN0IGlvY3RsX2du
dGRldl9ncmFudF9jb3B5IGNvcHk7DQo+Pj4+IC0Jc3RydWN0IGdudGRldl9jb3B5X2JhdGNo
IGJhdGNoOw0KPj4+PiArCXN0cnVjdCBnbnRkZXZfY29weV9iYXRjaCAqYmF0Y2g7DQo+Pj4+
ICAgIAl1bnNpZ25lZCBpbnQgaTsNCj4+Pj4gICAgCWludCByZXQgPSAwOw0KPj4+PiAgICAg
IAlpZiAoY29weV9mcm9tX3VzZXIoJmNvcHksIHUsIHNpemVvZihjb3B5KSkpDQo+Pj4+ICAg
IAkJcmV0dXJuIC1FRkFVTFQ7DQo+Pj4+ICAgIC0JYmF0Y2gubnJfb3BzID0gMDsNCj4+Pj4g
LQliYXRjaC5ucl9wYWdlcyA9IDA7DQo+Pj4+ICsJbXV0ZXhfbG9jaygmcHJpdi0+YmF0Y2hf
bG9jayk7DQo+Pj4+ICsJaWYgKCFwcml2LT5iYXRjaCkgew0KPj4+PiArCQliYXRjaCA9IGtt
YWxsb2Moc2l6ZW9mKCpiYXRjaCksIEdGUF9LRVJORUwpOw0KPj4+PiArCX0gZWxzZSB7DQo+
Pj4+ICsJCWJhdGNoID0gcHJpdi0+YmF0Y2g7DQo+Pj4+ICsJCXByaXYtPmJhdGNoID0gYmF0
Y2gtPm5leHQ7DQo+Pj4+ICsJfQ0KPj4+PiArCW11dGV4X3VubG9jaygmcHJpdi0+YmF0Y2hf
bG9jayk7DQo+Pj4NCj4+PiBJIGFtIGNvbmNlcm5lZCBhYm91dCB0aGUgcG90ZW50aWFsbHkg
dW5ib3VuZGVkIGFtb3VudCBvZiBtZW1vcnkgdGhhdA0KPj4+IGNvdWxkIGJlIGFsbG9jYXRl
ZCB0aGlzIHdheS4NCj4+DQo+PiBVbmJvdW5kZWQ/IEl0IGNhbiBiZSBhdCBtb3N0IHRoZSBu
dW1iZXIgb2YgdGhyZWFkcyB1c2luZyB0aGUgaW50ZXJmYWNlDQo+PiBjb25jdXJyZW50bHku
DQo+IA0KPiBUaGF0J3Mgd2hhdCBJIG1lYW50DQoNCjEga0IgYWRkaXRpb25hbCBtZW1vcnkg
cGVyIHRocmVhZCB3b24ndCBiZSB0aGUgZW5kIG9mIHRoZSB3b3JsZC4NCkVhY2ggdGhyZWFk
IHdpbGwgY29uc3VtZSBtdWNoIG1vcmUgbWVtb3J5IGZvciBvdGhlciBwdXJwb3NlcyBhbnl3
YXkuDQoNCj4+PiBUaGUgbXV0ZXggaXMgYWxyZWFkeSBhIHBvdGVudGlhbGx5IHZlcnkgc2xv
dyBvcGVyYXRpb24uIENvdWxkIHdlIGluc3RlYWQNCj4+PiBhbGxvY2F0ZSBhIHNpbmdsZSBi
YXRjaCwgYW5kIGlmIGl0IGlzIGN1cnJlbnRseSBpbiB1c2UsIHVzZSB0aGUgbXV0ZXggdG8N
Cj4+PiB3YWl0IHVudGlsIGl0IGJlY29tZXMgYXZhaWxhYmxlPw0KPj4NCj4+IEFzIHRoaXMg
aW50ZXJmYWNlIGlzIGUuZy4gdXNlZCBieSB0aGUgcWVtdSBiYXNlZCBxZGlzayBiYWNrZW5k
LCB0aGUgY2hhbmNlcw0KPj4gYXJlIHZlcnkgaGlnaCB0aGF0IHRoZXJlIGFyZSBjb25jdXJy
ZW50IHVzZXJzLiBUaGlzIHdvdWxkIGh1cnQgbXVsdGktcmluZw0KPj4gcWRpc2sgcXVpdGUg
YmFkbHkhDQo+Pg0KPj4gSXQgd291bGQgYmUgcG9zc2libGUgdG8gcmVwbGFjZSB0aGUgbXV0
ZXggd2l0aCBhIHNwaW5sb2NrIGFuZCBkbyB0aGUga21hbGxvYygpDQo+PiBvdXRzaWRlIHRo
ZSBsb2NrZWQgcmVnaW9uLg0KPj4NCj4+Pg0KPj4+IEkgYW0gYWxzbyBPSyB3aXRoIHRoZSBj
dXJyZW50IGFwcHJvYWNoIGJ1dCBJIHRob3VnaHQgSSB3b3VsZCBhc2suDQo+Pj4NCj4+Pg0K
Pj4+DQo+Pj4NCj4+Pj4gKwlpZiAoIWJhdGNoKQ0KPj4+PiArCQlyZXR1cm4gLUVOT01FTTsN
Cj4+Pj4gKw0KPj4+PiArCWJhdGNoLT5ucl9vcHMgPSAwOw0KPj4+PiArCWJhdGNoLT5ucl9w
YWdlcyA9IDA7DQo+Pj4+ICAgICAgCWZvciAoaSA9IDA7IGkgPCBjb3B5LmNvdW50OyBpKysp
IHsNCj4+Pj4gICAgCQlzdHJ1Y3QgZ250ZGV2X2dyYW50X2NvcHlfc2VnbWVudCBzZWc7DQo+
Pj4+ICAgICAgCQlpZiAoY29weV9mcm9tX3VzZXIoJnNlZywgJmNvcHkuc2VnbWVudHNbaV0s
DQo+Pj4+IHNpemVvZihzZWcpKSkgew0KPj4+PiAgICAJCQlyZXQgPSAtRUZBVUxUOw0KPj4+
PiArCQkJZ250ZGV2X3B1dF9wYWdlcyhiYXRjaCk7DQo+Pj4+ICAgIAkJCWdvdG8gb3V0Ow0K
Pj4+PiAgICAJCX0NCj4+Pj4gICAgLQkJcmV0ID0gZ250ZGV2X2dyYW50X2NvcHlfc2VnKCZi
YXRjaCwgJnNlZywNCj4+Pj4gJmNvcHkuc2VnbWVudHNbaV0uc3RhdHVzKTsNCj4+Pj4gLQkJ
aWYgKHJldCA8IDApDQo+Pj4+ICsJCXJldCA9IGdudGRldl9ncmFudF9jb3B5X3NlZyhiYXRj
aCwgJnNlZywNCj4+Pj4gJmNvcHkuc2VnbWVudHNbaV0uc3RhdHVzKTsNCj4+Pj4gKwkJaWYg
KHJldCA8IDApIHsNCj4+Pj4gKwkJCWdudGRldl9wdXRfcGFnZXMoYmF0Y2gpOw0KPj4+PiAg
ICAJCQlnb3RvIG91dDsNCj4+Pj4gKwkJfQ0KPj4+PiAgICAgIAkJY29uZF9yZXNjaGVkKCk7
DQo+Pj4+ICAgIAl9DQo+Pj4+IC0JaWYgKGJhdGNoLm5yX29wcykNCj4+Pj4gLQkJcmV0ID0g
Z250ZGV2X2NvcHkoJmJhdGNoKTsNCj4+Pj4gLQlyZXR1cm4gcmV0Ow0KPj4+PiArCWlmIChi
YXRjaC0+bnJfb3BzKQ0KPj4+PiArCQlyZXQgPSBnbnRkZXZfY29weShiYXRjaCk7DQo+Pj4+
ICsNCj4+Pj4gKyBvdXQ6DQo+Pj4+ICsJbXV0ZXhfbG9jaygmcHJpdi0+YmF0Y2hfbG9jayk7
DQo+Pj4+ICsJYmF0Y2gtPm5leHQgPSBwcml2LT5iYXRjaDsNCj4+Pj4gKwlwcml2LT5iYXRj
aCA9IGJhdGNoOw0KPj4+PiArCW11dGV4X3VubG9jaygmcHJpdi0+YmF0Y2hfbG9jayk7DQo+
Pj4+ICAgIC0gIG91dDoNCj4+Pj4gLQlnbnRkZXZfcHV0X3BhZ2VzKCZiYXRjaCk7DQo+Pj4N
Cj4+PiBPbmUgY2hhbmdlIGZyb20gYmVmb3JlIGlzIHRoYXQgaW4gY2FzZSBvZiBubyBlcnJv
cnMsIGdudGRldl9wdXRfcGFnZXMgaXMNCj4+PiBub3QgY2FsbGVkIGFueW1vcmUuIERvIHdl
IHdhbnQgdGhhdD8gU3BlY2lmaWNhbGx5LCB3ZSBhcmUgbWlzc2luZyB0aGUNCj4+PiBjYWxs
IHRvIHVucGluX3VzZXJfcGFnZXNfZGlydHlfbG9jaw0KPj4NCj4+IEkgZG9uJ3QgdGhpbmsg
eW91IGFyZSByaWdodC4gVGhlcmUgd2FzIGEgInJldHVybiByZXQiIGJlZm9yZSB0aGUgIm91
dDoiDQo+PiBsYWJlbCBiZWZvcmUgbXkgcGF0Y2guDQo+IA0KPiBZb3UgYXJlIHJpZ2h0LCBJ
IG1pc3NlZCBpdC4NCj4gDQo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+DQoNClRoYW5rcywNCg0KDQpKdWVyZ2VuDQo=
--------------1s7eef5IB8O5tFuS77ajesT6
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------1s7eef5IB8O5tFuS77ajesT6--

--------------rxYdYISBKm0VEERw7LRxLsK4--

--------------FEN1ck1FJL6iTUzUfYz00J5y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmhwumIFAwAAAAAACgkQsN6d1ii/Ey84
Gwf8C57SBtnQq6URDcPMQeS+M6I/FNhW3LEYsx1XhSoenMISxCQggZxqcC/+2JV3gx2JOLt4PBE4
uby1gVdYBDiZzu0Xz9jO5R90GezGIGil0aCOomrJqJG8zwhvr4C+PtwnucHKk/MkxZeQ8xT16Zid
lTvDq8KyH8kqispYvSeUAQqDSxvBJSKOsKSmB6D7Vml2NjBCgxtj4eBashsCQBs948ZColP/vnen
vQ5lyADEtzubrrT1+6UOyOvmVhG246dy4GaFJro6mlr3u8sMvhVksJKI4G4dxBPSEMDHrcgpjXpe
g7AZzg1Vak7zfp3CgDHaVFOHIzLPiltPMJlYcPSWgQ==
=whff
-----END PGP SIGNATURE-----

--------------FEN1ck1FJL6iTUzUfYz00J5y--

