Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B2162509
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 11:56:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40Vk-00069P-Hw; Tue, 18 Feb 2020 10:53:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9Xbw=4G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j40Vi-00069K-Vd
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:53:51 +0000
X-Inumbo-ID: f1d718c6-523c-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1d718c6-523c-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582023229;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=6icNyj3T8rcQCU2JOE5WxqQYwwb0lehF3aEb5evJoes=;
 b=Ak7bFxPVpbSsHnPyjh8YK0SuXxo8yXCI1m0oT1/dzJhIgB5crLHkczY+
 Ezg1q+trcGhgj3nOXxVieGDPmzjEOH7Pgezmk5gjpEsfGLBQofq/5gVqV
 h/bhYCO+TOiZTyXj8Ewg4tO/CEsFeXYhc3lnDThrdCI+8AhINNJc5qcf6 E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c25SutkA5HwTz4EuSyj1ZsmW5obRCgA3knjToKTZjUTWfVRpsMEod7pJS58NgmqWVmgT8YjTuI
 2OzrQKFs1lgheTEGTH7IZ87QQJTimIo5Kfne+tKGuVWFlSV3NsjuJ6WFsPU3VYHAtDcZsavkMO
 WWRc1CpGYbmAbkBQTtlGAzewwLX0QxMWbZQP/zAVECQ56tPtPisxg9X6NlEsld8akrar2jafGD
 siHAKYSouhJvEuiFI29Sm9gbhPa5SnrtHJeRKAeqHW8buzudsJ6/z6xDtrXBx1WXFwYPAfNNi0
 O4E=
X-SBRS: 2.7
X-MesageID: 12971146
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,456,1574139600"; d="scan'208";a="12971146"
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <20200217184324.73762-6-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8faffe76-2ab2-170a-4d42-228254fc57ed@citrix.com>
Date: Tue, 18 Feb 2020 10:53:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217184324.73762-6-roger.pau@citrix.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 5/6] x86/smp: use a dedicated scratch
 cpumask in send_IPI_mask
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
Cc: Sander Eikelenboom <linux@eikelenboom.it>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDIvMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC02Nyw3ICs2
OCwyMCBAQCBzdGF0aWMgdm9pZCBzZW5kX0lQSV9zaG9ydGN1dCh1bnNpZ25lZCBpbnQgc2hvcnRj
dXQsIGludCB2ZWN0b3IsCj4gIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1h
c2ssIGludCB2ZWN0b3IpCj4gIHsKPiAgICAgIGJvb2wgY3B1c19sb2NrZWQgPSBmYWxzZTsKPiAt
ICAgIGNwdW1hc2tfdCAqc2NyYXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7Cj4gKyAg
ICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKPiArICAg
IHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwo+ICsgICAgaWYgKCBpbl9tYygpIHx8IGluX25taSgp
ICkKPiArICAgIHsKPiArICAgICAgICAvKgo+ICsgICAgICAgICAqIFdoZW4gaW4gI01DIG9yICNN
TkkgY29udGV4dCBYZW4gY2Fubm90IHVzZSB0aGUgcGVyLUNQVSBzY3JhdGNoIG1hc2sKPiArICAg
ICAgICAgKiBiZWNhdXNlIHdlIGhhdmUgbm8gd2F5IHRvIGF2b2lkIHJlZW50cnksIHNvIGRvIG5v
dCB1c2UgdGhlIEFQSUMKPiArICAgICAgICAgKiBzaG9ydGhhbmQuCj4gKyAgICAgICAgICovCj4g
KyAgICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoZ2VuYXBpYy5zZW5kX0lQSV9tYXNrLCBtYXNrLCB2
ZWN0b3IpOwo+ICsgICAgICAgIHJldHVybjsKClRoZSBzZXQgb2YgdGhpbmdzIHlvdSBjYW4gc2Fm
ZWx5IGRvIGluIGFuIE5NSS9NQ0UgaGFuZGxlciBpcyBzbWFsbCwgYW5kCmRvZXMgbm90IGluY2x1
ZGUgc2VuZGluZyBJUElzLsKgIChJbiByZWFsaXR5LCBpZiB5b3UncmUgdXNpbmcgeDJhcGljLCBp
dAppcyBzYWZlIHRvIHNlbmQgYW4gSVBJIGJlY2F1c2UgdGhlcmUgaXMgbm8gcmlzayBvZiBjbG9i
YmVyaW5nIElDUjIKYmVoaW5kIHlvdXIgb3V0ZXIgY29udGV4dCdzIGJhY2spLgoKSG93ZXZlciwg
aWYgd2UgZXNjYWxhdGUgZnJvbSBOTUkvTUNFIGNvbnRleHQgaW50byBjcmFzaCBjb250ZXh0LCB0
aGVuCmFueXRoaW5nIGdvZXMuwqAgSW4gcmVhbGl0eSwgd2Ugb25seSBldmVyIHNlbmQgTk1JcyBm
cm9tIHRoZSBjcmFzaCBwYXRoLAphbmQgdGhhdCBpcyBub3QgcGVybWl0dGVkIHRvIHVzZSBhIHNo
b3J0aGFuZCwgbWFraW5nIHRoaXMgY29kZSBkZWFkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
