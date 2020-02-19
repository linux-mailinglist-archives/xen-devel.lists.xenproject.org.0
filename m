Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF0164E2C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 19:55:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4USZ-0000q3-4N; Wed, 19 Feb 2020 18:52:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tz6x=4H=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j4USX-0000pw-TX
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 18:52:33 +0000
X-Inumbo-ID: fc704426-5348-11ea-bc8e-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc704426-5348-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 18:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582138352;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YRGFE28Qd3tMb1QjIF7cvg6gmdiZW3q1CUiuOiPltM8=;
 b=g+Q1VixcjOgORXT+c/CAiQ/3ZskOgAjNUeMt3aNIqRqf5G8Gh4ntUZkZ
 lgptz/2kDoSKS+4rEidRjk4y+jtgm1peEwH1fKv3XGv3Wy+mgVUl6E3h6
 8b0w2ZfQFGEGrRqANZRBYiXjOCZI8jWmLZ7gcxKllg7iBqBtQuxNsl28h o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hvfetSvLyJ2NS9pr0tCzFa5QiSQx9zz++UOjsTLbFIvw53mcW1ihXjTF/r5g0Q6fppGGIhi+XG
 fai9u6uIn0StohBVYR/Kt7ymwEaQKaCAgYSqoslk0E2Im7rvydmSWEVNSHA0N6nszBEW/UAYoV
 7W3LPRQpaqLLl+WCUWDi3eF0Vd6gsqlU5enGnNb5UEwYWzuHt9ApcR3joNR86mGUq4jFcyEn74
 oAlWVT3olGaz8Imu00EzNFC+71EAC3HinsB7yzany4h/g2hUnRxa/+CmU6E+bhuqcNxsLv+DT1
 8NM=
X-SBRS: 2.7
X-MesageID: 13068713
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,461,1574139600"; d="scan'208";a="13068713"
To: Jan Beulich <jbeulich@suse.com>
References: <1576877960-12767-1-git-send-email-igor.druzhinin@citrix.com>
 <98c80514-a3cc-9e4f-d84c-3a12b08feaf2@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <6d3b8fed-538f-9c9b-d33e-3ccb94935bf0@citrix.com>
Date: Wed, 19 Feb 2020 18:52:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <98c80514-a3cc-9e4f-d84c-3a12b08feaf2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/vpt: update last_guest_time with
 cmpxchg and drop pl_time_lock
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com, wl@xen.org,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDIvMjAyMCAwNzo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjAuMTIuMjAxOSAy
MjozOSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IEBAIC0zOCwyNCArMzcsMjIgQEAgdm9pZCBo
dm1faW5pdF9ndWVzdF90aW1lKHN0cnVjdCBkb21haW4gKmQpCj4+ICB1aW50NjRfdCBodm1fZ2V0
X2d1ZXN0X3RpbWVfZml4ZWQoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQ2NF90IGF0X3RzYykK
Pj4gIHsKPj4gICAgICBzdHJ1Y3QgcGxfdGltZSAqcGwgPSB2LT5kb21haW4tPmFyY2guaHZtLnBs
X3RpbWU7Cj4+IC0gICAgdTY0IG5vdzsKPj4gKyAgICBzX3RpbWVfdCBvbGQsIG5ldywgbm93ID0g
Z2V0X3NfdGltZV9maXhlZChhdF90c2MpICsgcGwtPnN0aW1lX29mZnNldDsKPj4gIAo+PiAgICAg
IC8qIENhbGxlZCBmcm9tIGRldmljZSBtb2RlbHMgc2hhcmVkIHdpdGggUFYgZ3Vlc3RzLiBCZSBj
YXJlZnVsLiAqLwo+PiAgICAgIEFTU0VSVChpc19odm1fdmNwdSh2KSk7Cj4+ICAKPj4gLSAgICBz
cGluX2xvY2soJnBsLT5wbF90aW1lX2xvY2spOwo+PiAtICAgIG5vdyA9IGdldF9zX3RpbWVfZml4
ZWQoYXRfdHNjKSArIHBsLT5zdGltZV9vZmZzZXQ7Cj4+IC0KPj4gICAgICBpZiAoICFhdF90c2Mg
KQo+PiAgICAgIHsKPj4gLSAgICAgICAgaWYgKCAoaW50NjRfdCkobm93IC0gcGwtPmxhc3RfZ3Vl
c3RfdGltZSkgPiAwICkKPj4gLSAgICAgICAgICAgIHBsLT5sYXN0X2d1ZXN0X3RpbWUgPSBub3c7
Cj4+IC0gICAgICAgIGVsc2UKPj4gLSAgICAgICAgICAgIG5vdyA9ICsrcGwtPmxhc3RfZ3Vlc3Rf
dGltZTsKPj4gKyAgICAgICAgZG8gewo+PiArICAgICAgICAgICAgb2xkID0gcGwtPmxhc3RfZ3Vl
c3RfdGltZTsKPj4gKyAgICAgICAgICAgIG5ldyA9IG5vdyA+IHBsLT5sYXN0X2d1ZXN0X3RpbWUg
PyBub3cgOiBvbGQgKyAxOwo+PiArICAgICAgICB9IHdoaWxlICggY21weGNoZygmcGwtPmxhc3Rf
Z3Vlc3RfdGltZSwgb2xkLCBuZXcpICE9IG9sZCApOwo+IAo+IEkgd29uZGVyIHdoZXRoZXIgeW91
IHdvdWxkbid0IGJldHRlciByZS1pbnZva2UgZ2V0X3NfdGltZSgpIGluCj4gY2FzZSB5b3UgbmVl
ZCB0byByZXRyeSBoZXJlLiBTZWUgaG93IHRoZSBmdW5jdGlvbiBwcmV2aW91c2x5Cj4gd2FzIGNh
bGxlZCBvbmx5IGFmdGVyIHRoZSBsb2NrIHdhcyBhbHJlYWR5IGFjcXVpcmVkLgoKSWYgdGhlcmUg
aXMgYSBjb25jdXJyZW50IHdyaXRlciwgd291bGRuJ3QgaXQganVzdCB1cGRhdGUgcGwtPmxhc3Rf
Z3Vlc3RfdGltZQp3aXRoIHRoZSBuZXcgZ2V0X3NfdGltZSgpIGFuZCB0aGVuIHdlIHN1YnNlcXVl
bnRseSB3b3VsZCBqdXN0IHVzZSB0aGUgbmV3CnRpbWUgb24gcmV0cnk/IFdlIHVzZSB0aGUgc2Ft
ZSBsb2dpYyBpbiBwdl9zb2Z0X3JkdHNjKCkgYW5kIHNvIGZhciBpdApwcm92ZWQgdG8gYmUgc2Fm
ZS4KCklnb3IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
