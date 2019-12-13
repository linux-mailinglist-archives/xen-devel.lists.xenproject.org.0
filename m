Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D4111E5BF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:39:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifm4w-0005RR-EW; Fri, 13 Dec 2019 14:38:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mOMl=2D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifm4v-0005RL-QQ
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:38:01 +0000
X-Inumbo-ID: 293f1702-1db6-11ea-8f23-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 293f1702-1db6-11ea-8f23-12813bfff9fa;
 Fri, 13 Dec 2019 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576247881;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZhQ+CdxALzG3Uw7ozAvwkBMoraXWYv4EfcmNNHpzVUk=;
 b=IkT5pTB2sEEMWDeJ74o1Kmj86GJ7SR1vbpNWoZOPs6DKxah/Ejz9jST0
 0rimvoZDCesPE/zrRUYJ11REDIwJnVJpew502itdqDIwsk0v/XGlYeo2x
 756JBe5xlt4JzrjDB5iz1w8rdAYUiDLPbdOery3nJkjdMk/RtmSUHFq6C E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: M/ri4x2XOp8JIGIxZEg/z4AtQQ07NglGQ7xpGCw3UJ9s7CPsYuw4pVDVpn6e/j91+UPJCoh4iE
 CWAUd3ciYGouyTcrQvYQyaiftsy3w3sKPXrtjChOej8bWjO1UR0z4vo5JLhtrs+BYoOrrjkclw
 CP4R0oZlgkfVP3Oy6eSVN+/7dvBFnG0K0b3eVlzBiZSLxEEfEqxKJs88d/yvjdSo58X2Pv5KRm
 i4I5WX3DSmnjfcAMZD+kktDHTJkDAjeb77xo/VLyeQqiwCDdX80zjcPdj/+eQN2kVqg+7iYK91
 O+0=
X-SBRS: 2.7
X-MesageID: 9651813
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9651813"
Date: Fri, 13 Dec 2019 14:37:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191213143757.GI1155@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-8-anthony.perard@citrix.com>
 <7aa6cf71-f527-10fa-9eb3-421052501b19@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7aa6cf71-f527-10fa-9eb3-421052501b19@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH 7/8] xen: Use $(CONFIG_CC_IS_CLANG)
 instead of $(clang) in Makefile
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDc6MDA6MzVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8xMi8yMDE5IDE4OjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IEtj
b25maWcgY2FuIGNoZWNrIGlmICQoQ0MpIGlzIGNsYW5nIG9yIG5vdCwgaWYgaXQgaXMKPiA+IENP
TkZJR19DQ19JU19DTEFORyB3aWxsIGJlIHNldC4KPiA+Cj4gPiBXaXRoIHRoYXQgcGF0Y2gsIHRo
ZSBoeXBlcnZpc29yIGNhbiBiZSBidWlsdCB1c2luZyBjbGFuZyBieSBydW5uaW5nCj4gPiBgbWFr
ZSBDQz1jbGFuZyBDWFg9Y2xhbmcrK2Agd2l0aG91dCBuZWVkZWQgdG8gcHJvdmlkZSBhbiBleHRy
YSBjbGFuZwo+ID4gcGFyYW1ldGVyLgo+ID4KPiA+IGBtYWtlIGNsYW5nPXlgIHN0aWxsIHdvcmtz
IGFzIENvbmZpZy5tayB3aWxsIHNldCBDQyBhbmQgQ1hYLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IEFja2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IAo+IFRoaXMgaXMg
YSBtYXNzaXZlIGltcHJvdmVtZW50IG9uIHRoZSBzdGF0dXMgcXVvLgo+IAo+IERvIHdlIHBlcmhh
cHMgd2FudCB0byB0d2VhayB0aGUgcmVsZXZhbnQgQ0kgc2NyaXB0cyBhbmQgb3RoZXIgYnVpbGQK
PiBpbnN0cnVjdGlvbnMgbm93IHRoYXQgY2xhbmc9eSBpcyBvYnNvbGV0ZT8KCk5vLCBjbGFuZz15
IGlzbid0IG9ic29sZXRlIHlldC4gV2UgbmVlZCB0byBjaGFuZ2UgdGhlIHRvb2xzIHNpZGUgYXMg
d2VsbCwKdGhlcmUncyBhIGZldyAkKGNsYW5nKSBpbiB0aGVyZS4gU28gd2UgbmVlZCBvbmUgbW9y
ZSBwYXRjaCB0byByZW1vdmUKdGhlbS4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
