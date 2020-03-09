Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B317E4B8
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 17:24:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBLAF-00035L-PL; Mon, 09 Mar 2020 16:21:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1ca=42=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jBLAE-00035G-Nd
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 16:21:58 +0000
X-Inumbo-ID: 18ffa824-6222-11ea-8cec-bc764e2007e4
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18ffa824-6222-11ea-8cec-bc764e2007e4;
 Mon, 09 Mar 2020 16:21:58 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id h5so2356022edn.5
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 09:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YuPTKGy4oCiy6dhhwQr0Fem4jmpxf5L5m3tmYahh7+8=;
 b=blBg2E8eCB+z5GfK11O6C6EgncDsbBbOyX/ZHIg8287XUsZ3/WopMJUg9NAMSpJ88a
 alkDUiMRvCbzzp9ROBDz/lVO9DG0GgLuxiHEJQZEH2CcOJ0bSnWSl+O+LSephhF46gpd
 MOuDUhjscvUc7XNMMnWCJbuj5fQD2KTqM4MaTtApBr06iboj4e1hpqBKqcaBrc6jYSA9
 nNtxN65gvYiws0yeJ8Svuk6BZt/rY4KM9VrcMHX1gnit/gV1oYFIQ+kVLTwdI6y3FCqL
 YG2pppTpzB/6kAQfAYhmpiRmEKCqApS3xR7yG1Ml3mngRJbdTpoYP9ZT5XgQIRXoJzMT
 sskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YuPTKGy4oCiy6dhhwQr0Fem4jmpxf5L5m3tmYahh7+8=;
 b=sUD+I8P9PXPIz0+/F/SiW1P1RpXIEev7Wnv8i815d1VTC9GLfITP19JNuNO4HxYUt7
 PFLC3QnWLDmyTlUONyAMEcW1+C1hDD2JStuB0ABoZJY/qlr1a4OcKR1rXii70oKfNQU3
 uYPjSVwV4FUVzZFpgjoqnBe7mWuEeKpFDiN+kmq8YYJGbsTKyqXyOB/wytJKddpUUM3G
 RsEuMtbE1Ug03PmZs1ZBpDgMT8n2KAtGhy4T9o6dMcqQZaUhDyyr6Kp/ukIGYkHYhO0a
 200UY57Yok6IhfMRyDVNlz7Osec+kXnd9NRB3oMD5brYCDM/ACD5XyZnMSgLQgrSG/Ab
 JWYQ==
X-Gm-Message-State: ANhLgQ2Pp+woMLFKKLWDPPuVtjMVRR0WFi947E75D6f8iO+JzJjsMVAn
 LGqI3klOBAiExiU2HIAlUXAUFF0jMtg=
X-Google-Smtp-Source: ADFU+vvwLKFfDcZ2u+Xt9p4gp8wTDf79sE7yEujhzz/VPGwU2obKtntaSs9hDzIf/XqiFAfPTf7khg==
X-Received: by 2002:a17:906:33d4:: with SMTP id
 w20mr15952496eja.190.1583770916160; 
 Mon, 09 Mar 2020 09:21:56 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48])
 by smtp.gmail.com with ESMTPSA id x62sm926386ede.55.2020.03.09.09.21.53
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 09:21:54 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id f7so118195wml.4
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2020 09:21:53 -0700 (PDT)
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr91208wmb.154.1583770913453;
 Mon, 09 Mar 2020 09:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <a404fafe-0057-0ea7-93c3-754f96da8743@suse.com>
 <CABfawhnqPqa7BjnNTqv+x7CJrpN9VSrQMycfkPQYgHVLy9u-gA@mail.gmail.com>
 <8d86ba8d-8d53-38e1-4d70-bfb53809e98d@suse.com>
In-Reply-To: <8d86ba8d-8d53-38e1-4d70-bfb53809e98d@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 9 Mar 2020 10:21:17 -0600
X-Gmail-Original-Message-ID: <CABfawhntHDdKMa5BruP1q8YHdzbJwvjzqNR4hq1FXvP7i_-JHw@mail.gmail.com>
Message-ID: <CABfawhntHDdKMa5BruP1q8YHdzbJwvjzqNR4hq1FXvP7i_-JHw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] memaccess: reduce include dependencies
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXIgOSwgMjAyMCBhdCAxMDowMyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMDkuMDMuMjAyMCAxNjo1MSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gTW9uLCBNYXIgOSwgMjAyMCBhdCA1OjQ5IEFNIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9tZW1f
YWNjZXNzLmgKPiA+PiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL21lbV9hY2Nlc3MuaAo+ID4+
IEBAIC0xNyw5ICsxNywxMSBAQAo+ID4+ICAjaWZuZGVmIF9BU01fQVJNX01FTV9BQ0NFU1NfSAo+
ID4+ICAjZGVmaW5lIF9BU01fQVJNX01FTV9BQ0NFU1NfSAo+ID4+Cj4gPj4gK3N0cnVjdCB2bV9l
dmVudF9zdDsKPiA+PiArCj4gPj4gIHN0YXRpYyBpbmxpbmUKPiA+PiAgYm9vbCBwMm1fbWVtX2Fj
Y2Vzc19lbXVsYXRlX2NoZWNrKHN0cnVjdCB2Y3B1ICp2LAo+ID4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgdm1fZXZlbnRfcmVzcG9uc2VfdCAqcnNwKQo+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHZtX2V2ZW50X3N0
ICpyc3ApCj4gPj4gIHsKPiA+PiAgICAgIC8qIE5vdCBzdXBwb3J0ZWQgb24gQVJNLiAqLwo+ID4+
ICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX2Fj
Y2Vzcy5oCj4gPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fYWNjZXNzLmgKPiA+PiBA
QCAtMjYsNiArMjYsOCBAQAo+ID4+ICAjaWZuZGVmIF9fQVNNX1g4Nl9NRU1fQUNDRVNTX0hfXwo+
ID4+ICAjZGVmaW5lIF9fQVNNX1g4Nl9NRU1fQUNDRVNTX0hfXwo+ID4+Cj4gPj4gK3N0cnVjdCB2
bV9ldmVudF9zdDsKPiA+Cj4gPiBXb3VsZG4ndCBpdCBtYWtlIG1vcmUgc2Vuc2UgdG8gZGVmaW5l
IHRoaXMgaW4geGVuL21lbV9hY2Nlc3MuaCBpbnN0ZWFkCj4gPiBvZiBoYXZpbmcgdG8gZG8gaXQg
aW4gYm90aCBhc20gdmVyc2lvbnM/IE5vdGhpbmcgZGlyZWN0bHkgaW5jbHVkZXMKPiA+IGFzbS9t
ZW1fYWNjZXNzLmgsIGFsbCB1c2VycyBpbmNsdWRlIHhlbi9tZW1fYWNjZXNzLmgKPgo+IElmIHRo
YXQncyB3aGF0IHlvdSBwcmVmZXIgLSBJIGNhbiBjZXJ0YWlubHkgZG8gc28uIEl0J2xsIGxvb2sg
YQo+IGxpdHRsZSBvZGQgdGhlbiwgYXMgdGhlIGZvcndhcmQgZGVjbGFyYXRpb24gaGFzIHRvIGNv
bWUgYWhlYWQgb2YKPgo+ICNpbmNsdWRlIDxhc20vbWVtX2FjY2Vzcy5oPgo+Cj4gSnVzdCBsZXQg
bWUga25vdyBpZiB5b3UgcmVhbGx5IHByZWZlciBpdCB0aGF0IHdheS4KCldlbGwsIEkgZmluZCBp
dCB1Z2x5IGVpdGhlciB3YXkuIEkgd291bGQgcHJlZmVyIGlmIGl0J3MgZm9yd2FyZApkZWNsYXJl
ZCBqdXN0IGF0IG9uZSBzcG90LCB3aXRoIGEgY29tbWVudCBleHBsYWluaW5nIHdoeSBpdCdzCm5l
ZWRlZC9kb25lIHRoYXQgd2F5LgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
