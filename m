Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80C119ED
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 15:18:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMBYJ-0002n0-7h; Thu, 02 May 2019 13:15:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bVeI=TC=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMBYH-0002ms-LN
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 13:15:05 +0000
X-Inumbo-ID: 4c7ed9a8-6cdc-11e9-843c-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4c7ed9a8-6cdc-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 13:15:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556802904; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=Bgj/gvseJe5HqcP7K4IhShqlCZbvQnVNb08l/qUxdnE=;
 b=T7snZniewwUg5MwTNMhXlne0F8t3m1Qi5eon5r4uSLvuImcE5OolD9ymWn/aeTrAPlAkSNx/
 In3ENr/QN1bOlEj6kRU+B6F+zYz0V4NDXpHvUcZ+zLv6LYJ+vmAYTuACuZdHalHCrX22aANi
 K6GMoyKP3GR1nJK+CjeiyS+bw9U=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mxa.mailgun.org with ESMTP id 5ccaed57.7fb0a3bc85b0-smtp-out-n03;
 Thu, 02 May 2019 13:15:03 -0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id j13so2791930wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2019 06:15:03 -0700 (PDT)
X-Gm-Message-State: APjAAAXUdiOnzBGP356EfsAPvf7R4SEzNo4DJw4VqqbFQjAEA9t4zLVt
 Nfh4WIu3iAZkPX7GJ56H2T9VNzQc+lY02ri2SJs=
X-Google-Smtp-Source: APXvYqzs3Fvxv8J4wDlfJwUOZZ32iDIL/Iq3UixDj/ygL4PW2GhE8zZLjCnHOF6AugzcDaSwuYbvRR0HWL6A+uadnCk=
X-Received: by 2002:a1c:cc10:: with SMTP id h16mr2415258wmb.39.1556802902782; 
 Thu, 02 May 2019 06:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190501235203.1179-1-tamas@tklengyel.com>
 <3b239422-9639-2691-19fe-2a7a00f7a52f@citrix.com>
In-Reply-To: <3b239422-9639-2691-19fe-2a7a00f7a52f@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 2 May 2019 07:14:25 -0600
X-Gmail-Original-Message-ID: <CABfawh=8KdyEgnW8kdy02JrLpW-MJE0X2JYGJ0EsWEdV_J8csQ@mail.gmail.com>
Message-ID: <CABfawh=8KdyEgnW8kdy02JrLpW-MJE0X2JYGJ0EsWEdV_J8csQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMiwgMjAxOSBhdCA0OjQ2IEFNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDIvMDUvMjAxOSAwMDo1MiwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+IGluZGV4IDI4M2ViN2IzNGQuLjUxNTRl
Y2MyYTggMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+ID4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+IEBAIC03NzksMTIgKzc3OSwxNyBAQCBz
dGF0aWMgdm9pZCB2bXhfbG9hZF9jcHVfc3RhdGUoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1f
aHdfY3B1ICpkYXRhKQo+ID4KPiA+ICBzdGF0aWMgdm9pZCB2bXhfc2F2ZV92bWNzX2N0eHQoc3Ry
dWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpjdHh0KQo+ID4gIHsKPiA+ICsgICAgaWYg
KCB2ID09IGN1cnJlbnQgKQo+ID4gKyAgICAgICAgdm14X3NhdmVfZ3Vlc3RfbXNycyh2KTsKPiA+
ICsKPiA+ICAgICAgdm14X3NhdmVfY3B1X3N0YXRlKHYsIGN0eHQpOwo+ID4gICAgICB2bXhfdm1j
c19zYXZlKHYsIGN0eHQpOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIGludCB2bXhfbG9hZF92bWNz
X2N0eHQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCBodm1faHdfY3B1ICpjdHh0KQo+ID4gIHsKPiA+
ICsgICAgQVNTRVJUKHYgIT0gY3VycmVudCk7Cj4KPiBJJ2QgbGVhdmUgYSBjb21tZW50IGFsb25n
IHRoZSBsaW5lcyBvZiAvKiBOb3QgY3VycmVudGx5IHNhZmUgdG8gdXNlIGluCj4gY3VycmVudCBj
b250ZXh0LiAqLwo+Cj4gQ2FuIGJlIGZpeGVkIHVwIG9uIGNvbW1pdC4KPgo+IFRoaXMgdmVyc2lv
biBpcyBtdWNoIGNsZWFuZXIsIGFyY2hpdGVjdHVyYWxseSBzcGVha2luZywgc28gUmV2aWV3ZWQt
Ynk6Cj4gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPgo+IEknbGwg
ZHJvcCB0aGUgcHJldmlvdXMgdmVyc2lvbiBvdXQgb2YgeDg2LW5leHQuCgpUaGFua3MsClRhbWFz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
