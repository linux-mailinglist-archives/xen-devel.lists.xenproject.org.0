Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C064CBDC64
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:48:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD4mi-0003GC-IF; Wed, 25 Sep 2019 10:44:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD4mh-0003G5-4K
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:44:35 +0000
X-Inumbo-ID: 765b4baa-df81-11e9-97fb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 765b4baa-df81-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 10:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569408274;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eTN8GQccsOHcqcH8zIRjU85kRnxj47fcY6nBqI0WQTs=;
 b=CCmRLQRDtRHPq+iaf43Cxr4ZyBgDnwx6/duotQko8EQjgOpn+ilghFXS
 LjqaQWqoWQkE+Qwrv5a7XVypi0O8h99GRfLsE1RmE5p0pOSvblnGQC0da
 Qnz0vApQ5cEYSJJNTNCXykUxjW0D7M1Ur84KNcnnhHkBe9l9niwDWWtxG Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2+oX0YBBrCg/vyb23DHy1vwrRgOKyiB3fhbO20ceCAJb3Qx872mnLuExbsYzoYNXEMcMoDZ/BY
 VTkcAT+LP+5oY9OykwWcabQ1xLfnFST5pYjlHubgil+4Uy4jVcimiLom59GlbLCclbGOnZkPaV
 ueoRF9LRpHI8FTKyIZ2H6jOOnYqc7l3a0x4HpNk6n92rUhInWMSsiDqwrQaIaPYcAhZyMGlJSs
 Dv1FdIdPJXLmSkX7Sr7b5Gq/9QA+B5CD2OKMHEgyTDIGymjGtXs7NtpArGrzmfcLlfJmSGyQC6
 xZI=
X-SBRS: 2.7
X-MesageID: 6105736
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6105736"
Date: Wed, 25 Sep 2019 12:44:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925104427.vdatdc77twikmdtp@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-7-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-7-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 6/8] x86: make probe_xen return
 boolean value
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjlBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBXZSBuZWVkIGluZGljYXRpb24gd2hldGhlciBpdCBoYXMgc3VjY2VlZGVkIG9yIG5vdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgoKVGhlIGNvZGUg
TEdUTSwgSSBoYXZlIGp1c3QgYSBzdWdnZXN0aW9uIG9uIHRoZSBhcHByb2FjaC4KCj4gLS0tCj4g
IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgfCA1ICsrKystCj4gIHhlbi9hcmNoL3g4
Ni9ndWVzdC94ZW4veGVuLmMgICAgfCA3ICsrKystLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC94ZW4uaCB8IDQgKystLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnZpc29yLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gaW5kZXggYjBhNzI0
YmYxMy4uZmI1NzJiMDQwMiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+IEBAIC0zNCw3
ICszNCwxMCBAQCB2b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpCj4gICAgICBpZiAo
ICEoY3B1aWRfZWN4KDEpICYgY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpKSAp
Cj4gICAgICAgICAgcmV0dXJuOwo+ICAKPiAtICAgIHByb2JlX3hlbigpOwo+ICsgICAgaWYgKCBw
cm9iZV94ZW4oKSApCj4gKyAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgIC8qIEh5cGVyLVYgcHJv
YmluZyB0byBmb2xsb3cuICovCgpJbnN0ZWFkIG9mIGhhdmluZyB0byBhcHBlbmQgYSBuZXcgcHJv
YmVfZm9vIGhlcmUgZXZlcnkgdGltZSBzdXBwb3J0IGZvcgpydW5uaW5nIG9uIGEgbmV3IGh5cGVy
dmlzb3IgaXMgYWRkZWQsIHlvdSBjb3VsZCBkbyBzb21ldGhpbmcgc2ltaWxhcgp0byB3aGF0J3Mg
ZG9uZSBpbiBSRUdJU1RFUl9WUENJX0lOSVQsIHdoZXJlIGVhY2ggaHlwZXJ2aXNvciB3b3VsZApy
ZWdpc3RlciBpdCdzIG93biBzZXQgb2YgaGVscGVycyBhbmQgcHJvYmUgZnVuY3Rpb24gaW4gYSBz
cGVjaWZpYwpzZWN0aW9uLCBhbmQgdGhlbiB5b3Ugd291bGQganVzdCBpdGVyYXRlIG92ZXIgYWxs
IHRoZSBndWVzdCBzdXBwb3J0CnRoYXQncyBjb21waWxlZCBpbiBYZW4uCgpUaGF0IHdvdWxkIGFs
c28gcHJldmVudCB5b3UgZnJvbSBoYXZpbmcgdG8gZXhwb3J0IGEgZHVtbXkgcHJvYmVfeGVuCmhl
bHBlciBpZiBDT05GSUdfWEVOX0dVRVNUIGlzIG5vdCBkZWZpbmVkLgoKQW55d2F5LCBtYXliZSB0
aGF0J3Mgb3ZlcmtpbGwuLi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
