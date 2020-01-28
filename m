Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07614B9C6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 15:36:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwRwf-0003iO-Fh; Tue, 28 Jan 2020 14:34:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z4m8=3R=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iwRwe-0003iJ-4X
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 14:34:24 +0000
X-Inumbo-ID: 46cea7f8-41db-11ea-8396-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46cea7f8-41db-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580222064;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=gf2FTXuVh8vP+LrpT8ZPM5jj/1UqMY1mRmtgNBoJNNI=;
 b=VZeMNB9PE7WjljMgKVg0YIse4CaN9Uq5wdH0s9f9CBA048EXeNRmqENu
 zvKlzn+g8uMjYu58kVVWfTQG9HUZTMdm+5Y5Un/8Lew9Wbo6ZUcUU22ic
 ewe+7kBF4d+alYp9ueedAbqPTUSR/MTsvId9tQSzNwr7XQy/5Dmt32S5N M=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: V9v4Pt5GFdFkqHJN7Ia1R7lABRaNiGWUj/iu1pPjTxsr7qPR0/yuOsYyaqmdAebUT9Vl5+fcjZ
 XexDttZ62t92wkh+jWHK9Yit8u/mSWCpWdvABKf38hVXxkiA/E8/Bb9fgAsR5xnrIBywjMvPt6
 bHfqvWCeKkzm9LTftsiz08AHi9TD3gxdHYZNVOEYcTYYvvcgcKPIlZn+6XVyOtqB5X98jFA3sV
 0L2qyHg3eugsvvRpn04fH50NPTi3URXTqIbnFWKivVTYEcOxyPT/6nWu802OQJYIXF9afCTLBc
 tkY=
X-SBRS: 2.7
X-MesageID: 11568920
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,374,1574139600"; d="scan'208";a="11568920"
To: Jan Beulich <jbeulich@suse.com>
References: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
 <361d6176-f8b6-2655-b8ca-3e12fbb44e66@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <90e40f7a-e464-4df1-4152-94ccb98704a2@citrix.com>
Date: Tue, 28 Jan 2020 14:34:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <361d6176-f8b6-2655-b8ca-3e12fbb44e66@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/suspend: disable watchdog before
 calling console_start_sync()
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

T24gMjgvMDEvMjAyMCAxMzozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDEuMjAyMCAy
MjoyOSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IEBAIC0yMjMsNiArMjI0LDcgQEAgc3RhdGlj
IGludCBlbnRlcl9zdGF0ZSh1MzIgc3RhdGUpCj4+ICAKPj4gICAgICBhY3BpX3NsZWVwX3ByZXBh
cmUoc3RhdGUpOwo+PiAgCj4+ICsgICAgd2F0Y2hkb2dfZGlzYWJsZSgpOwo+PiAgICAgIGNvbnNv
bGVfc3RhcnRfc3luYygpOwo+PiAgICAgIHByaW50aygiRW50ZXJpbmcgQUNQSSBTJWQgc3RhdGUu
XG4iLCBzdGF0ZSk7Cj4+ICAKPj4gQEAgLTI4MSw2ICsyODMsNyBAQCBzdGF0aWMgaW50IGVudGVy
X3N0YXRlKHUzMiBzdGF0ZSkKPj4gICAgICAgICAgdGJvb3RfczNfZXJyb3IoZXJyb3IpOwo+PiAg
Cj4+ICAgICAgY29uc29sZV9lbmRfc3luYygpOwo+PiArICAgIHdhdGNoZG9nX2VuYWJsZSgpOwo+
PiAgCj4+ICAgICAgbWljcm9jb2RlX3VwZGF0ZV9vbmUodHJ1ZSk7Cj4gCj4gQmV0d2VlbiB0aGVz
ZSB0d28gdGhlcmUncyBhICJnb3RvIGRvbmU7IiB3aGljaCBhbHNvIHdhbnRzCj4gd2F0Y2hkb2df
ZW5hYmxlKCkgYWRkZWQgdGhlbi4KCkluZGVlZCwgdGhhbmtzIGZvciBub3RpY2luZy4gV2lsbCBz
ZW5kIHYyIHNob3J0bHkuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
