Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A68A046
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:00:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxAoQ-0004BQ-JX; Mon, 12 Aug 2019 13:56:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2okp=WI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hxAoP-0004BL-B6
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 13:56:37 +0000
X-Inumbo-ID: ffb3e173-bd08-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ffb3e173-bd08-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565618196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L3eM6j20Vzqkrfs3iOf2ibjnYYxlMyQykpIzjiZNzIQ=;
 b=M04ZcRsDJUIJ0wiOBpQMvdmHMKzNW1ZwiqgsYH5CCFL5K8WuCVvIjJzP
 261YUze0bP+wBgaKw+UuKiJKDzotnpdZga0SvCmydjZDiuWSbuVwLslu8
 ktuG7f8G3TzBkjDv8QoTFyqqH/LcCJ8GC6Ia6Z0973z33k68gc3NCPGmL 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rstnBF7ppixKi90ICl9h303m3SkTKrMM4Zdb1tpKK+RlUOuq29tItZMs2d1tVHijoAUEYTEvd6
 Ph/Mil6XNJvhcAKll8YqPB+5kNXX0uv3F84ohGLbQPowUg++p9DGA9/KflCT6P7kG/XSCsy9jf
 mz2TPX5VPhYZb1RNqpM/6BuY+19HDOaus69x5Aqbb2LjKMY0w+GMOd8bF3aHjPX+APDojDnW2O
 VXKzJNge8pd0faszt9hyNeBbgRGsOv7b2P9ZR23FPs00hEuMSuElFQ+2TidQuxtZ8uZoafKzXL
 kA8=
X-SBRS: 2.7
X-MesageID: 4326945
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4326945"
Date: Mon, 12 Aug 2019 15:56:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190812135628.624gtsgv4if2zd6l@Air-de-Roger>
References: <20190802092227.43058-1-roger.pau@citrix.com>
 <8f92a662-d576-8d41-2856-74f38c10c1b3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f92a662-d576-8d41-2856-74f38c10c1b3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMDI6MTc6NTNQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA4LzIvMTkgMTA6MjIgQU0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+IFN3
aXRjaCBybXJyX2lkZW50aXR5X21hcHBpbmcgdG8gdXNlIGlvbW11X3t1bn1tYXAgaW4gb3JkZXIg
dG8KPiA+IGVzdGFibGlzaCBSTVJSIG1hcHBpbmdzIGZvciBQViBkb21haW5zLCBsaWtlIGl0J3Mg
ZG9uZSBpbgo+ID4gYXJjaF9pb21tdV9od2RvbV9pbml0LiBUaGlzIHNvbHZlcyB0aGUgaXNzdWUg
b2YgYSBQViBoYXJkd2FyZSBkb21haW4KPiA+IG5vdCBnZXR0aW5nIFJNUlIgbWFwcGluZ3MgYmVj
YXVzZSB7c2V0L2NsZWFyfV9pZGVudGl0eV9wMm1fZW50cnkgd2FzCj4gPiBub3QgcHJvcGVybHkg
dXBkYXRpbmcgdGhlIGlvbW11IHBhZ2UgdGFibGVzLgo+IAo+IFNvcnJ5LCBJIHRoaW5rIHRoaXMg
ZGVzY3JpcHRpb24gaXMgc29tZXdoYXQgYmFja3dhcmRzOiB5b3UncmUgc2F5aW5nCj4gd2hhdCB5
b3UncmUgZG9pbmcgZmlyc3QsIGFuZCB0aGVuIHNheWluZyB3aGF0IHRoZSBwcm9ibGVtYXRpYyBi
ZWhhdmlvcgo+IHdhcywgYnV0IG5vdCBhY3R1YWxseSBzYXlpbmcgd2hhdCB3YXMgY2F1c2luZyB0
aGUgcHJvYmxlbWF0aWMgYmVoYXZpb3IuCj4gCj4gV2h5IHdhcyB7c2V0LGNsZWFyfV9pZGVudGl0
eV9wMm0gbm90IHVwZGF0aW5nIHRoZSBwYWdlIHRhYmxlcz8KPiAKPiBJIGFncmVlIHdpdGggSmFu
LCB0aGF0IGZpZ3VyaW5nIHRoYXQgb3V0IGlzIGEgcHJlcmVxdWlzaXRlIGZvciBhbnkga2luZAo+
IG9mIGZpeDogaWYgYG5lZWRfaW9tbXVfcHRfc3luYygpYCBpcyBmYWxzZSBhdCB0aGF0IHBvaW50
IGZvciB0aGUKPiBoYXJkd2FyZSBkb21haW4sIHRoZW4gdGhlcmUncyBhIGJpZ2dlciBwcm9ibGVt
IHRoYW4gUk1SUnMgbm90IGJlaW5nCj4gYWRqdXN0ZWQgcHJvcGVybHkuCgpuZWVkX2lvbW11X3B0
X3N5bmMgaXMgaW5kZWVkIGZhbHNlIGZvciBhIFBWIGhhcmR3YXJlIGRvbWFpbiBub3QKcnVubmlu
ZyBpbiBzdHJpY3QgbW9kZSwgc2VlOgoKaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9
eGVuLmdpdDthPWJsb2I7Zj14ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jO2g9ZjhjM2Jm
NTNiZDE3OTNkZjkzZDdkZGVhNjU2NGRjOTI5ZjQwYzE1NjtoYj1IRUFEI2wxOTIKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAx
NTQ3Lmh0bWwKClRoaXMgaXMgZmluZSBmb3IgYSBub24tc3RyaWN0IFBWIGhhcmR3YXJlIGRvbWFp
biwgc2luY2UgaXQgaGFzIGFsbCB0aGUKaG9zdCBtZW1vcnkgKG1pbnVzIG1lbW9yeSB1c2VkIGJ5
IFhlbikgbWFwcGVkIGluIHRoZSBpb21tdSBwYWdlIHRhYmxlcwpleGNlcHQgZm9yIFJNUlIgcmVn
aW9ucyBub3QgbWFya2VkIGFzIHJlc2VydmVkIGluIHRoZSBlODIwIG1lbW9yeSBtYXAsCndoaWNo
IGFyZSBhZGRlZCB1c2luZyBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5LgoKVGhlIGlzc3VlIGhlcmUg
aXMgdGhhdCB0aGlzIHBhdGNoIGFsb25lIGRvZXNuJ3QgZml4IHRoZSBpc3N1ZSBmb3IgdGhlCnJl
cG9ydGVyLCBhbmQgdGhlcmUgc2VlbXMgdG8gYmUgYW4gYWRkaXRpb25hbCBmbHVzaCByZXF1aXJl
ZCBpbiBvcmRlcgp0byBnZXQgdGhlIGlzc3VlIHNvbHZlZCBvbiBoaXMgZW5kOgoKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA4L21zZzAw
NTI2Lmh0bWwKCk15IHRoZW9yeSBpcyB0aGF0IHRoZSBzeXN0ZW0gUm9tYW4gaXMgdXNpbmcgaXMg
Ym9vdGluZyB3aXRoIERNQQpyZW1hcHBpbmcgZW5hYmxlZCBpbiB0aGUgaW9tbXUsIGFuZCBzb21l
aG93IHRoZSBjYWxsIHRvCmlvbW11X2ZsdXNoX2FsbCBpbiBpbnRlbF9pb21tdV9od2RvbV9pbml0
IGRvZXNuJ3Qgc2VlbSB0byB3b3JrCnByb3Blcmx5LCB3aGlsZSBjYWxsaW5nIGlvbW11X2lvdGxi
X2ZsdXNoX2FsbCBkb2VzIHNlZW0gdG8gZG8gdGhlCnJpZ2h0IHRoaW5nLiBJJ20gc3RpbGwgd2Fp
dGluZyBmb3IgUm9tYW4gdG8gY29tZSBiYWNrIHdpdGggdGhlIHJlc3VsdApvZiBteSBsYXN0IGRl
YnVnIHBhdGNoZXMgaW4gb3JkZXIgdG8gZmlndXJlIG91dCB3aGV0aGVyIG15IGh5cG90aGVzaXMK
YWJvdmUgaXMgdHJ1ZS4KClRoaXMgaG93ZXZlciB3b24ndCBzdGlsbCBleHBsYWluIHRoZSB3ZWly
ZCBiZWhhdmlvdXIgb2YKaW9tbXVfZmx1c2hfYWxsLCBhbmQgZnVydGhlciBkZWJ1Z2dpbmcgd2ls
bCBzdGlsbCBiZSByZXF1aXJlZC4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
