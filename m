Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D818D193
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:54:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFJ0a-0002v2-K5; Fri, 20 Mar 2020 14:52:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFJ0Z-0002uu-Ja
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:52:23 +0000
X-Inumbo-ID: 6598a533-6aba-11ea-bd99-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6598a533-6aba-11ea-bd99-12813bfff9fa;
 Fri, 20 Mar 2020 14:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584715941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rQ/UZNea7apH26BxMPMpJRHQhIXHhcUJKW7hu95r7XU=;
 b=CbVLf5dX6QYtXtG6EQBBVdynbj2WjykOEMS6K2czLvCznFvxLw0XET8H
 y6WNk39Wvi+Y21rFA+vmjaEgVnzsS34rAI3/YwwtmMDIIROvSS2MSswbV
 9bPleGXGwu1RbZrJBTdmSO4HovfV7GP1F7h83SBtIbT5PipnlDjII5U2z Q=;
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
IronPort-SDR: SYucR/CYqOqOQCmm5T9piUswNw+NonYZwgpcCbn441FPPuQbkmIy6aMnNR5wbLKrzuHih361au
 oKhIbBaJuPntyRT/nD/PIj0MsqQ57CPR9px+ktNUkG0W8oU50R+A00irNttBvAZpZsaPeOPQg9
 yMz2s6s7wUW1BA0YTa28r8c2cRjGo31tqZAhMQSrSIvACmnR2TgRF7oTrerxsXqXooiWWPNXDp
 hMlFU1ldpXtYjyXdoIlQZ+kTd5gJG2dS0G+rKUJRXV7OeKDvD3/lr8UEKuecew4r4vIuUluGe1
 9L4=
X-SBRS: 2.7
X-MesageID: 14558431
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14558431"
Date: Fri, 20 Mar 2020 15:52:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200320145211.GZ24458@Air-de-Roger.citrite.net>
References: <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <9f6c3b5b-13e7-05aa-1ff6-930724674323@suse.com>
 <20200320142214.GX24458@Air-de-Roger.citrite.net>
 <ec3d0416-22a0-bde0-1e92-174b41612bda@xen.org>
 <53ee969a-5d24-f6e6-2dd5-5f03118326c5@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53ee969a-5d24-f6e6-2dd5-5f03118326c5@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDI6NDM6MzhQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDIwLzAzLzIwMjAgMTQ6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToK
PiA+IAo+ID4gCj4gPiBPbiAyMC8wMy8yMDIwIDE0OjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Ogo+ID4gPiBzdGF0aWMgaW5saW5lIHZvaWQgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sodWludDMy
X3QgdGxiZmx1c2hfdGltZXN0YW1wKQo+ID4gPiB7Cj4gPiA+IMKgwqDCoMKgIGNwdW1hc2tfdCBt
YXNrOwo+ID4gPiAKPiA+ID4gwqDCoMKgwqAgY3B1bWFza19jb3B5KCZtYXNrLCAmY3B1X29ubGlu
ZV9tYXApOwo+ID4gPiDCoMKgwqDCoCB0bGJmbHVzaF9maWx0ZXIoJm1hc2ssIHRsYmZsdXNoX3Rp
bWVzdGFtcCk7Cj4gPiA+IMKgwqDCoMKgIGlmICggIWNwdW1hc2tfZW1wdHkoJm1hc2spICkKPiA+
ID4gwqDCoMKgwqAgewo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIHBlcmZjX2luY3IobmVlZF9mbHVz
aF90bGJfZmx1c2gpOwo+ID4gPiAjaWYgQ09ORklHX1g4Ngo+ID4gPiDCoMKgwqDCoMKgwqDCoMKg
IC8qCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrIGlz
IHVzZWQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBwMm0gaW4KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
ICogcG9wdWxhdGVfcGh5c21hcCwgWGVuIG5lZWRzIHRvIHRyaWdnZXIgYW4gQVNJRCB0aWNrbGUg
YXMKPiA+ID4gdGhpcyBpcyBhCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIHJlcXVpcmVtZW50
IG9uIEFNRCBoYXJkd2FyZS4KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiAKPiA+IEkg
ZG9uJ3QgdGhpbmsgdGhpcyBjb21tZW50IGlzIGNvcnJlY3QuIHBvcHVsYXRlX3BoeXNtYXAoKSBp
cyBvbmx5IGdvaW5nCj4gPiB0byBhZGQgZW50cnkgaW4gdGhlIFAyTSBhbmQgdGhlcmVmb3JlIGZs
dXNoIHNob3VsZCBub3QgYmUgbmVlZGVkLgo+IAo+IEkgc2hvdWxkIGhhdmUgcHJvYmFibHkgc2Fp
ZCAiaW4gbW9zdCBvZiB0aGUgY2FzZXMuLi4iIGFuZCAuLi4KPiAKPiA+IAo+ID4gVGhlIG9ubHkg
cmVhc29uIHRoZSBmbHVzaCB3b3VsZCBoYXBwZW4gaW4gcG9wdWxhdGVfcGh5c21hcCgpIGlzIGJl
Y2F1c2UKPiA+IHdlIGFsbG9jYXRlZCBhIHBhZ2UgdGhhdCB3YXMgcmVxdWlyZWQgdG8gYmUgZmx1
c2ggKHNlZQo+ID4gZnJlZS5uZWVkX3RiZmx1c2gpLgo+IAo+IC4uLiBleHRlbmQgdGhpcyBjb21t
ZW50IGEgYml0IG1vcmUuIFRoZSBmbHVzaCB3aWxsIGhhcHBlbiB3aGVuIHRoZSBwYWdlIHVzZWQK
PiB0byBoYXZlIGFuIG93bmVyLiBTbyBpZiB0aGVyZSBpcyBubyBvd25lciwgdGhlcmUgaXMgbm8g
Zmx1c2guCj4gCj4gVGhlcmVmb3JlIHdlIGNhbid0IHJlbHkgb24gaXQgaWYgd2UgcmVhbGx5IHdh
bnRlZCB0byB0cmlnZ2VyIGFuIEFTSUQgdGlja2xlCj4gYWZ0ZXIgYSBQMk0gdXBkYXRlLgoKUmln
aHQsIHNvIEkgY2FuIGxlYXZlIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYXNrIGFzLWlzLiBXaWxsIHBy
ZXBhcmUgYQpuZXcgcGF0Y2guCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
