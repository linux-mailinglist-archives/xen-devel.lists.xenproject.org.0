Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76D14B38B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 12:35:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwP6U-0001zI-G2; Tue, 28 Jan 2020 11:32:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=g73u=3R=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwP6S-0001zD-Rc
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 11:32:20 +0000
X-Inumbo-ID: d6d24448-41c1-11ea-8672-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6d24448-41c1-11ea-8672-12813bfff9fa;
 Tue, 28 Jan 2020 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580211139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Ek/NQ5lgXM3Wxc8P1ZaZqNHo3eiWuvlN/jwZjd0E4ks=;
 b=F9DgkJIc6+DW5Cj4DZc60p4+RyUj4fiJsqposXJMmLq7I6wRD5rXDcws
 qpxu7DqHbH2lu1+LCygjXLB782HmzTN4P+WiMpjnjkh9eQ69x18BajhV5
 qsnTL1IosKAZFCACSjIhvCzAX3VLndYcL2DmQBJrddLSNjtVLl7eYXeYI c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: DhjIC+eC4SUoT85G647GtPZTHcgFs26zMsprX9Y3N9fMJOh47OisB3/B6/hCdSJF5qw7nJlVwj
 WzJTaDVpuaU54SLJJFjsnqKrIH8CMvsV7rACfdgRDAq1gs5yD25wiHRrkHF+D7vPGub9Zt2VGG
 kbyo0H/K/vip2lm1FyOPWTR7/McEPIBfyTruukDvHHC8RPPKSPd3htEyzlVA3oad7dr5WxyaYa
 eRpGOQ4hnUfI+Nq0LwCPf2gFUTfOnLydm/fU5By5c6r48fAKmoO10HwU5+IZ55IBhVB/OByGgl
 w5A=
X-SBRS: 2.7
X-MesageID: 11719827
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,373,1574139600"; d="scan'208";a="11719827"
Date: Tue, 28 Jan 2020 12:32:11 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200128113211.GM57924@desktop-tdan49n.eng.citrite.net>
References: <1580160556-25621-1-git-send-email-igor.druzhinin@citrix.com>
 <20200128104528.GL57924@desktop-tdan49n.eng.citrite.net>
 <c73bbc90-0037-3ce3-e278-3563101d32ea@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c73bbc90-0037-3ce3-e278-3563101d32ea@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMTA6NTU6MDBBTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMjgvMDEvMjAyMCAxMDo0NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+
IE9uIE1vbiwgSmFuIDI3LCAyMDIwIGF0IDA5OjI5OjE2UE0gKzAwMDAsIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+ID4+IC4uLiBhbmQgZW5hYmxlIGl0IGFmdGVyIGV4aXRpbmcgUy1zdGF0ZS4gT3Ro
ZXJ3aXNlIGFjY3VtdWxhdGVkCj4gPj4gb3V0cHV0IGluIHNlcmlhbCBidWZmZXIgbWlnaHQgZWFz
aWx5IHRyaWdnZXIgdGhlIHdhdGNoZG9nIGlmIGl0J3MKPiA+PiBzdGlsbCBlbmFibGVkIGFmdGVy
IGVudGVyaW5nIHN5bmMgdHJhbnNtaXNzaW9uIG1vZGUuCj4gPiAKPiA+IENhbid0IHlvdSBqdXN0
IHByb2Nlc3MgdGhlIHdhdGNoZG9nIGluIHNlcmlhbF9zdGFydF9zeW5jIGluc3RlYWQgb2YKPiA+
IGRpc2FibGluZyBpdD8KPiAKPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGxheWVyaW5nIHZpb2xhdGlv
bi4gUGx1cyBpbiBldmVyeSBvdGhlciBwbGFjZSB3ZSdyZQo+IGVuYWJsaW5nIHN5bmMgbW9kZSB3
ZSdyZSBhbHNvIGRpc2FibGluZyB3YXRjaGRvZyBhcyB3ZWxsLgoKTm90IGluIGV2ZXJ5IHBsYWNl
LCBidXQgaW5kZWVkIHRoZXJlJ3MgcXVpdGUgYSBsb3Qgb2YgY2FsbGVycyB0aGF0CmFscmVhZHkg
ZGlzYWJsZSB0aGUgd2F0Y2hkb2cuCgpJIHdvbmRlciB3aGV0aGVyIHRoaXMgc2hvdWxkIGJlIHB1
dCBpbnNpZGUgb2YgY29uc29sZV9zdGFydF9zeW5jCml0c2VsZiwgYW5kIGEgcGFyYW1ldGVyIGFk
ZGVkIHRvIHRoZSBmdW5jdGlvbiBpZiBub3QgYWxsIGNhbGxlcnMgd2FudAp0aGUgd2F0Y2hkb2cg
ZGlzYWJsZWQgKHNhbWUgZm9yIGNvbnNvbGVfZW5kX3N5bmMpLgoKPiBJIGFsc28gdGhpbmsgaXQn
cyBiZW5lZmljaWFsIHRvIGRpc2FibGUgd2F0Y2hkb2cgYmVmb3JlIGVudGVyaW5nIGZpcm13YXJl
LgoKSSBkb24ndCBoYXZlIG9iamVjdGlvbnMuCgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
