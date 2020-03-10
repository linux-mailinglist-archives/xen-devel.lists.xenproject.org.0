Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B940318027B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:53:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhAT-0003cA-Ea; Tue, 10 Mar 2020 15:51:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ti7X=43=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jBhAS-0003bv-F3
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:51:40 +0000
X-Inumbo-ID: 07162be1-62e7-11ea-add6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07162be1-62e7-11ea-add6-12813bfff9fa;
 Tue, 10 Mar 2020 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583855499;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=iT6wQ57E9qtMgvy9YhoucgFCpOW97YKiBCtjEEiRekY=;
 b=U6x20yRLeElfeVd89MO8oZLZJ7dF5zyG1Yrra4tjBcK7YYH95oinlGVk
 S/Nj6oy6PhXhLHs2Oc3yk2NWi8HdITq5DsUdum6UWHfN0XdFrIJGk6RHj
 y2TrNYkcu2bJuQ09AiyYvTDWvkaJBiSTur62lK/ARQhYX1DSRjq+8GS/T A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kBP1t7XrWFhm/CA/1uAhE5FTqumnl5eMECfL98F9cth9Ifhf7K2QDuctnVKCO3BPiscEVBgxbg
 dFdZAhRpO4jSFdWusnvK36is6Jvx6hxvSHLWsfoFNAP5yQ60Ww7P9kl5WPS95T4Lv8efnbCB3+
 2rM05PNp8PNszcuEJkzYV0SzsuO+RLJwLjT+gR5ZClC4NHz2eaZ4AweyMqx/pm0uP7/uoSA2yi
 zy23E3+WWmOHk86+Fq39K7NpMZZDxkVSeVyJRxlr3KDryzJF5WP6pFToIkdxcPuOM/Iv5GBcWT
 nH0=
X-SBRS: 2.7
X-MesageID: 14334391
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="14334391"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24167.46982.390819.472400@mariner.uk.xensource.com>
Date: Tue, 10 Mar 2020 15:51:34 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200310134635.99810-1-roger.pau@citrix.com>
References: <20200310134635.99810-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v2 1/2] examine: detect IOMMU
 availability and add it as a hostflag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCBPU1NURVNUIHYyIDEvMl0gZXhhbWluZTog
ZGV0ZWN0IElPTU1VIGF2YWlsYWJpbGl0eSBhbmQgYWRkIGl0IGFzIGEgaG9zdGZsYWciKToKPiBJ
bnRyb2R1Y2UgYSBuZXcgdGVzdCB0byBjaGVjayBmb3IgaW9tbXUgYXZhaWxhYmlsaXR5IGFuZCBh
ZGQgaXQgYXMgYQo+IGhvc3RmbGFnIGlmIGZvdW5kLgoKVGhhbmtzLgoKPiArc3ViIHNldF9mbGFn
KCQkJCkgewoKRmlyc3RseSwgY2FuIHlvdSBicmVhayB0aGlzIG5ldyBjb2RlIG91dCBpbnRvIGl0
cyBvd24gcGF0Y2ggPwoKPiArICAgIG15ICgkaGQsICRobywgJGZsYWcpID0gQF87CgpTZWNvbmRs
eSwgdGhpcyBkb2Vzbid0IHRha2UgYSBib29sZWFuaXNoIGZvciB5ZXMvbm8uICBJIHRoaW5rIGl0
CnNob3VsZC4gIEllLCBpdCBzaG91bGQgYmUgY2FwYWJsZSBvZiBib3RoIHNldHRpbmcgYW5kIGNs
ZWFyaW5nLgpJIHRoaW5rIGxlYXZpbmcgdGhhdCBmdW5jdGlvbmFsaXR5IG91dCBub3cgaXMgdG9v
IGNsb3NlIHRvIEV4dHJlbWUKUHJvZ3JhbW1pbmcgZm9yIG15IHRhc3RlLCBldmVuIGZvciBvc3N0
ZXN0IDotKS4KCj4gKyAgICBteSAkcm1xID0gJGRiaF90ZXN0cy0+cHJlcGFyZSg8PEVORCk7Cj4g
KyAgICAgICAgREVMRVRFIEZST00gaG9zdGZsYWdzIFdIRVJFIGhvc3RuYW1lPT8gQU5EIGhvc3Rm
bGFnPT8KPiArRU5ECj4gKyAgICBteSAkYWRkcSA9ICRkYmhfdGVzdHMtPnByZXBhcmUoPDxFTkQp
Owo+ICsgICAgICAgIElOU0VSVCBJTlRPIGhvc3RmbGFncyAoaG9zdG5hbWUsaG9zdGZsYWcpIFZB
TFVFUyAoPyw/KQo+ICtFTkQKPiArICAgIG15ICRibGVzc2luZyA9IGludGVuZGVkX2JsZXNzaW5n
KCk7Cj4gKwo+ICsgICAgZGllICJBdHRlbXB0aW5nIHRvIG1vZGlmeSBob3N0IGZsYWdzIHdpdGgg
aW50ZW5kZWQgYmxlc3NpbmcgJGJsZXNzaW5nICE9IHJlYWwiCj4gKyAgICAgICAgaWYgJGJsZXNz
aW5nIG5lICJyZWFsIjsKCk11Y2ggb2YgdGhpcyBjb2RlIGlzIGlkZW50aWNhbCB0byB0aGF0IGlu
IHNldF9wcm9wZXJ0eS4KSSB0aGluayBtYXliZSB5b3UgY291bGQgaW50cm9kdWNlCgogICBzdWIg
bW9kaWZ5X2hvc3QgKCQkJCkgewogICAgICAgbXkgKCRoZCwgJGhvLCAkZm4pID0gQF87Cgp3aGlj
aCBjb250YWlucyB0aGUgY2FsbCB0byBpbnRlbmRlZF9ibGVzc2luZyBhbmQgcGFzc2VzIGl0cyAk
Zm4KYXJndW1lbnQgdG8gZGJfcmV0cnkgPwoKPiArKysgYi9Pc3N0ZXN0L0hvc3REQi9TdGF0aWMu
cG0KLi4uCj4gK3N1YiBzZXRfcHJvcGVydHkoJCQkKSB7Cj4gKyAgICBteSAoJGhkLCAkaG8sICRm
bGFnKSA9IEBfOwo+ICsKPiArICAgIGRpZSAiQ2Fubm90IHNldCBmbGFncyBpbiBzdGFuZGFsb25l
IG1vZGUgZm9yICRoby0+e05hbWV9ICRmbGFnXG4iOwo+ICt9CgpJIGNvbnNpZGVyZWQgd2hldGhl
ciB0aGlzIG1lYW50IHRoYXQgbW9kaWZ5X2hvc3Qgb3VnaHQgdG8gYmUgcGFydCBvZgpzb21lIGJh
c2UgY2xhc3MgYnV0ICRybXEgZXRjLiB3b3VsZCBuZWVkIHNldHRpbmcgdXAgYW5kIHBsdW1iaW5n
CnRocm91Z2ggc28gdGhhdCBzZWVtcyBib3RoIHRvbyBhbm5veWluZyBhbmQgdG8gbWFrZSB0aGlu
Z3MgdG9vCmFic3RyYWN0LiAgQnV0IGlmIHlvdSB0aGluayB5b3UgY2FuIGFuZCB3b3VsZCBsaWtl
IHRvLCBwbGVhc2UgZG8uLi4KCj4gZGlmZiAtLWdpdCBhL3RzLWV4YW1pbmUtaW9tbXUgYi90cy1l
eGFtaW5lLWlvbW11Cj4gbmV3IGZpbGUgbW9kZSAxMDA3NTUKPiBpbmRleCAwMDAwMDAwMC4uYWU5
MWQ0ZDIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvdHMtZXhhbWluZS1pb21tdQo+IEBAIC0wLDAg
KzEsMzEgQEAKPiArIyEvdXNyL2Jpbi9wZXJsIC13Ci4uLgo+ICtvdXIgJGhhc19pb21tdSA9ICF0
YXJnZXRfY21kX3Jvb3Rfc3RhdHVzKCRobywgJ3hsIGluZm98Z3JlcCBkaXJlY3RpbycsIDEwKTsK
ClBsZWFzZSBmZXRjaCB0aGUgb3V0cHV0IG9mIHhsIGluZm8gYW5kIGRvIHRoZSBncmVwcGluZyBp
biBwZXJsLgoKVGhlIHdheSB5b3UgZG8gaXQgaGVyZSB3aWxsIG1pc3MgYSBzaXR1YXRpb24gd2hl
cmUgeGwgaW5mbyBmYWlscwpjb21wbGV0ZWx5LCB3aGljaCBvdWdodCB0byBiZSBmYXRhbCwgbm90
IHRyZWF0ZWQgYXMgIm5vIGlvbW11Ii4KCkFwYXJ0IGZyb20gdGhlc2UgdGhpbmdzLCB0aGUgY29k
ZSBhbGwgTEdUTS4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
