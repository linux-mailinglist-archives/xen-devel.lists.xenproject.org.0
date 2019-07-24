Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D747343D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 18:53:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqKRn-0003QW-1D; Wed, 24 Jul 2019 16:48:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5Jwp=VV=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hqKRm-0003QR-7s
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 16:48:58 +0000
X-Inumbo-ID: ed2544ac-ae32-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ed2544ac-ae32-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 16:48:56 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id f4so91041127ioh.6
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2019 09:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=g3lPm/t9ozAVIInoc0K9QqT2XwBK8t3bgsKVgPzPu38=;
 b=KyoTEMUAVWpjmYrebe/Q30OTTubjF294q6fQd4/6shbokiiORJsYUxq/Yo5kSnxS4v
 kB3+zAAd0Em0eZbmDwrjMV0j2aAqTZaDPa/ayEqvDNNrZfib2nwGtL/PilKIscGwJ1VC
 YuPwLdiemYpv4pI8Yz1XTwCXNvnuY0sKJ0V60hnyYLc7tUVSv40O7ZKFROjpYhikOTqT
 vnxhdcUpPxzlQnbB1jlzoBg+D4lKjTwkndh2X0sfLk0loiKXdYFaUsdjs3KehYqCeGhZ
 1Fl1cgKsYrkH9E3ngWjUKNeAkKEQIbJBGEW2TS4pcmEOcUvDtqxtqUXo2nsnSVvMbGns
 7ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=g3lPm/t9ozAVIInoc0K9QqT2XwBK8t3bgsKVgPzPu38=;
 b=YLLWdmVdneh80S0Yk7Eb2oKF2jzVK6Vy+2Vis0jInvDwJOzYRcsGjtc2UVR5CNjZG/
 WAlDghNBD03W+Iz/ku/IHnJcjr5nv74SYB3XK756JNqO4TAptyoBoQYaDAmbtzqfzWpt
 YmQtkop4+WcPWaqQMS3qmIO2oTmC2J6GQSXQkz+5xPIAjYqVvfd30GPkx4c/zs7/825W
 SdkFAH+1cQ15GIMBWQVQlNH6bd953+XzyudlIToANrRtdFo/Lh4d5vp9MychFN91KWdk
 znUTI/zbIyO934NShuC9yEgrI3aI01Se8mOMo2cLGgXwLbO4Nlo5OsF+xMjNhowLrXrZ
 IwBg==
X-Gm-Message-State: APjAAAXKLHKMJxUDk/Nb90EbzY2ND8+yH7j7Lgu28kc4wYYn59Yga1Ah
 Dj0pBCBCFAF/2XVYgml11Wg=
X-Google-Smtp-Source: APXvYqyQMW2DpQKHckXH4Svumop1RP+EjGneIQWzgnFGoezL9YwJhEdQ1IaBKU8UN5wAr3rXYEwqMw==
X-Received: by 2002:a02:69d1:: with SMTP id
 e200mr31247798jac.138.1563986935830; 
 Wed, 24 Jul 2019 09:48:55 -0700 (PDT)
Received: from [100.64.73.44] ([205.185.206.117])
 by smtp.gmail.com with ESMTPSA id t14sm39260058ioi.60.2019.07.24.09.48.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 09:48:54 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <CAMmSBy_0KsjQ_e7S=nVxCEuowtEjfMOZ9Rf_DgHcgM6am3vCdQ@mail.gmail.com>
Date: Wed, 24 Jul 2019 12:48:53 -0400
Message-Id: <B92482B8-3A93-4085-9A6A-26D457261076@gmail.com>
References: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
 <20190723205929.GK3433@reaktio.net>
 <CAMmSBy_0KsjQ_e7S=nVxCEuowtEjfMOZ9Rf_DgHcgM6am3vCdQ@mail.gmail.com>
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: [Xen-devel] preparations for 4.12.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBKdWwgMjMsIDIwMTksIGF0IDE3OjA1LCBSb21hbiBTaGFwb3NobmlrIDxyb21hbkB6ZWRl
ZGEuY29tPiB3cm90ZToKPiAKPj4gT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMjowMCBQTSBQYXNp
IEvDpHJra8OkaW5lbiA8cGFzaWtAaWtpLmZpPiB3cm90ZToKPj4gCj4+IEhpLAo+PiAKPj4+IE9u
IEZyaSwgSnVsIDE5LCAyMDE5IGF0IDAyOjIzOjQ0UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4gQWxsLAo+Pj4gCj4+PiB0aGUgcmVsZWFzZSBpcyBkdWUgaW4gZWFybHkgQXVndXN0LiBQ
bGVhc2UgcG9pbnQgb3V0IGJhY2twb3J0cyB5b3UKPj4+IGZpbmQgbWlzc2luZyBmcm9tIHRoZSBy
ZXNwZWN0aXZlIHN0YWdpbmcgYnJhbmNoLCBidXQgd2hpY2ggeW91Cj4+PiBjb25zaWRlciByZWxl
dmFudC4gVGhlIG9uZSBjb21taXQgSSd2ZSBxdWV1ZWQgYWxyZWFkeSBvbiB0b3Agb2YKPj4+IHdo
YXQgd2FzIGp1c3QgcHVzaGVkIGlzCj4+PiAKPj4+IGVjMmFiNDkxYjUgICAgeDg2L2VwdDogcGFz
cyBjb3JyZWN0IGxldmVsIHRvIHAybV9lbnRyeV9tb2RpZnkKPj4+IAo+PiAKPj4gSSdkIGxpa2Ug
dG8gcmVxdWVzdCBiYWNrcG9ydCBvZiB0aGUgZm9sbG93aW5nIGNvbW1pdCBmb3IgNC4xMi4xOgo+
PiAKPj4gImxpYnhsOiBmaXggcGNpIGRldmljZSByZS1hc3NpZ25pbmcgYWZ0ZXIgZG9tYWluIHJl
Ym9vdCI6Cj4+IGNvbW1pdCAgYzE5NDM0ZDkyODRlOTNlNmY5YWFlYzlhNzBmNWYzNjFhZGJmYWJh
Ngo+PiAKPj4gaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1jb21t
aXQ7aD1jMTk0MzRkOTI4NGU5M2U2ZjlhYWVjOWE3MGY1ZjM2MWFkYmZhYmE2Cj4gCj4gRldJVzog
SSdkIGxpa2UgdG8gc2Vjb25kIHRoYXQuCj4gCj4gVGhhbmtzLAo+IFJvbWFuLgoKQW5vdGhlciB2
b3RlIGZvciB0aGlzIGJhY2twb3J0LCBmb3IgcmVib290aW5nIHN0YXRlbGVzcywgbWVhc3VyZWQg
bmV0d29yayBkcml2ZXIgZG9tYWlucyB3aGljaCBoYXZlIG1vcmUgdGhhbiBvbmUgTklDLgoKUmlj
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
