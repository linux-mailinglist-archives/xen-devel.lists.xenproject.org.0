Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BAB15D9C0
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 15:49:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2cF7-0003Gl-GU; Fri, 14 Feb 2020 14:46:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lgAG=4C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2cF6-0003Gg-0R
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 14:46:56 +0000
X-Inumbo-ID: d7eec316-4f38-11ea-ba7f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7eec316-4f38-11ea-ba7f-12813bfff9fa;
 Fri, 14 Feb 2020 14:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581691615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HtIm1//SBm2v/yHL8d8u+ZnsOy+NQL0Tljn0pznYXsI=;
 b=TqgX4avS+gFPWdGzdK5WhHAV+NXMEgY35GyhzQw8+9e5GC6S7mBjpfsD
 i42y2/7fwXyZ9j7rBPY3MCJ7AsESt9R6XtnAD++jcAQQdNZnHrRf0i0vZ
 88swWero+pZeeyKIuG0qwN6Ua9wImfE8Uic18VvRzRtoNWxnJP4duXmAe A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1lSmAlp/NF66I80Tmws0i+TIDOh1oHT6DH9OUFJV24MtqCK50PkR5aZAHeM0qJPBYe9sqKiRUd
 entlsS96BO69x3T7YULpSmy50427ZpP0YQPWwWGgkCwXjRuLuSPp/Xbluxabzgw9xIqWS6jGYM
 u+cy5oFr1enA51c+2Cbd5qCS44mWfOZfzfidX1HqNg5FwhhrPExtvb3AluMiD0Hj6rX69e6YOM
 PhrlrJw3gaadA2t0RZfIrG/nGtE/cmoy4/G+hHHWq+9JJNM8hPXNa2crjSVlA2WXjqvlRxrez8
 OVY=
X-SBRS: 2.7
X-MesageID: 12834810
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,440,1574139600"; d="scan'208";a="12834810"
Date: Fri, 14 Feb 2020 15:46:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200214144647.GD4679@Air-de-Roger>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214123430.4942-3-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMTI6MzQ6MjlQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBJbXBsZW1lbnQgYSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2guIFRoZSBo
b29rIG5lZWRzIHRvCj4gY2hlY2sgaWYgcHJlcmVxdWlzaXRlcyBhcmUgbWV0LiBJZiB0aGV5IGFy
ZSBub3QgbWV0LCBpdCByZXR1cm5zIGFuIGVycm9yCj4gbnVtYmVyIHRvIGZhbGwgYmFjayB0byBu
YXRpdmUgZmx1c2hlcy4KPiAKPiBJbnRyb2R1Y2UgYSBuZXcgdmFyaWFibGUgdG8gaW5kaWNhdGUg
aWYgaHlwZXJjYWxsIHBhZ2UgaXMgcmVhZHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8
bGl1d2VAbWljcm9zb2Z0LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KCkp1c3Qgb25lIGNvbW1lbnQgYmVsb3cuCgo+IC0tLQo+ICB4ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlICB8ICAxICsKPiAgeGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9oeXBlcnYuYyAgfCAxNyArKysrKysrKysrKysKPiAgeGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysKPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
di90bGIuYyAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA0IGZpbGVz
IGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUK
PiBpbmRleCA2ODE3MDEwOWE5Li4xODkwMmMzM2U5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L01ha2VmaWxlCj4gQEAgLTEgKzEsMiBAQAo+ICBvYmoteSArPSBoeXBlcnYubwo+ICtvYmoteSAr
PSB0bGIubwo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5j
IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+IGluZGV4IDcwZjRjZDVhZTAu
LmY5ZDFmMTFhZTMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiBAQCAtMzMs
NiArMzMsOCBAQCBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X2lucHV0X3Bh
Z2UpOwo+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7
Cj4gIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGludCwgaHZfdnBfaW5kZXgp
Owo+ICAKPiArc3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBodl9oY2FsbF9wYWdlX3JlYWR5OwoK
U2luY2UgdGhpcyBpcyBzdGF0aWMsIEkgd291bGQgZHJvcCB0aGUgaHZfIHByZWZpeC4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
