Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C30CFC35
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 16:18:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHqHr-0007Hu-PF; Tue, 08 Oct 2019 14:16:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pQDQ=YB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iHqHq-0007Hp-58
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 14:16:26 +0000
X-Inumbo-ID: 35c27bcc-e9d6-11e9-80e3-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35c27bcc-e9d6-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 14:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570544185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NITeqnhYhknMjKNN6dIfHS2QWGI4UoZKobl4/ruUQw0=;
 b=bJlzbUMrq0JJo73zoppyOGb0aCTlHmpwF6d1X1/awmbvUD1Jojmy2zIT
 uwpYfkjsmdEt2YynP3BJsmHOQbHlLXISde5jRy99jVZ9TzvE56tHpsH0D
 E8BLAZ3RLfCmx83CJ2Tmz9fHQBE38R9VIgWFo7ahKte0hlpQtJrdAQN38 w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6If7/dXZeVjx2glCIBdgl47BvppGO4faVtVmh7v6gsmulcogf8KT8OfiuDpr+7Oaqb9QhAmlnr
 zhHiiwcPKPAketJ/g5sqK+mTKPoRBLTY+vEu7zDtzdL7uXOwRsD7kGGtyj2NgUUfnfMkZBvkkD
 uKb6bMyExA2jdWM/0f3ltWcPCQwUQm2s+l5HU6+1P8f1FqsjT8urL+WgYeRe3+qvpbitznZyui
 RmY7HC1s4EDAu3yMIlmhGwoVVb7UZhoCeuwsFwudrn4CyWY9ADkRE1/tzlce9YMuUDrg7XRDFN
 Uq4=
X-SBRS: 2.7
X-MesageID: 6607158
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,270,1566878400"; 
   d="scan'208";a="6607158"
Date: Tue, 8 Oct 2019 16:16:15 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191008141615.GF66437@Air-de-Roger>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
 <20191008092344.GB66437@Air-de-Roger>
 <1a8d42d4-a456-ad55-d063-6099a7b735e8@suse.com>
 <20191008110901.GC66437@Air-de-Roger>
 <9ea4ba56-ffd6-0b4a-47d0-cfac5291d49b@suse.com>
 <20191008131425.GE66437@Air-de-Roger>
 <7db8ed62-44a7-fac5-dd54-3d1bed2e4dab@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7db8ed62-44a7-fac5-dd54-3d1bed2e4dab@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDM6MzI6MjVQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDguMTAuMjAxOSAxNToxNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwMToyODo0OVBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAwOC4xMC4yMDE5IDEzOjA5LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gR2l2ZW4gdGhhdCBhcyB5b3UgY29ycmVjdGx5IHBvaW50IG91dCBtYXNrYWxsIGlzIHVuc2V0
IGFmdGVyIGRldmljZQo+ID4+PiByZXNldCwgSSBmZWVsIHRoYXQgb3B0aW9uIDQgaXMgdGhlIGJl
c3Qgb25lIHNpbmNlIGl0IG1hdGNoZXMgdGhlIHN0YXRlCj4gPj4+IG9mIHRoZSBoYXJkd2FyZSBh
ZnRlciByZXNldC4KPiA+Pgo+ID4+IFJpZ2h0LCB0aGF0J3MgdGhlIHZhcmlhbnQgY29taW5nIGNs
b3Nlc3QgdG8gd2hhdCBoYXJkd2FyZSBzdGF0ZQo+ID4+IG91Z2h0IHRvIGJlIGF0IHRoYXQgcG9p
bnQuIFdlJ2QgbmVlZCB0byBkb3VibGUgY2hlY2sgdGhhdCB0aGUKPiA+PiBwZXItZW50cnkgbWFz
ayBiaXRzIGFyZSBhbGwgc2V0IGF0IHRoYXQgcG9pbnQuCj4gPiAKPiA+IEknbSBub3Qgc2F5aW5n
IHN1Y2ggY2hlY2sgaXMgbm90IHdvcnRoIGRvaW5nLCBidXQgd2h5IGRvIGl0IGluIHRoaXMKPiA+
IGNhc2UgYnV0IG5vdCB3aGVuIGFsc28gY2xlYXJpbmcgdGhlIG1hc2thbGwgKGluIG1zaXhfY2Fw
YWJpbGl0eV9pbml0KQo+ID4gd2hlbiBjYWxsZWQgZnJvbSBwcmVwYXJlX21zaXg/Cj4gCj4gQnkg
ImRvdWJsZSBjaGVjayIgSSBtZWFudCBpbnNwZWN0IHRoZSBzb3VyY2UsIG5vdCB0byBhZGQgY2hl
Y2tpbmcgbG9naWMuCgpPaCwgSSBpbXBsaWVkIHlvdSB3YW50ZWQgdG8gaXRlcmF0ZSBvdmVyIGFs
bCBlbnRyaWVzIGFuZCBjaGVjayB0aGF0CnRoZSBtYXNrIGJpdCBpcyBzZXQgZm9yIGVhY2guCgpJ
dCdzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCBYZW4gcmVsaWVzIG9uIGRvbTAgaGF2aW5nIGRvbmUg
YSBkZXZpY2UKcmVzZXQgYmVmb3JlIGl0IGJlaW5nIGFzc2lnbmVkLCB3aGljaCBtYXNrcyBhbGwg
ZW50cmllcy4gSSd2ZSBjaGVja2VkCnRoZSBwY2liYWNrIGNvZGUgYW5kIHRoZSByZXNldCBpcyBw
ZXJmb3JtZWQgd2hlbiB0aGUgZGV2aWNlIGlzCmFzc2lnbmVkIHRvIGRvbTAgKGllOiBndWVzdCBz
aHV0ZG93biBvciBob3QtdW5wbHVnKSwgYW5kIGhlbmNlIHdoZW4KdGhlIGRldmljZSBpcyBhc3Np
Z25lZCB0byBhIGRpZmZlcmVudCBkb21haW4gdGhlIHN0YXRlIG9mIGl0IHNob3VsZCBiZQp0aGUg
YWZ0ZXIgcmVzZXQgb25lLgoKSSBjYW4gYWRkIGEgY29tbWVudCBpbiBhc3NpZ25fZGV2aWNlIHRo
YXQgWGVuIGV4cGVjdHMgdGhlIGRldmljZSBzdGF0ZQp0byBiZSB0aGUgYWZ0ZXIgcmVzZXQgb25l
LCBhbmQgaGVuY2UgaG9zdF9tYXNrYWxsID0gZ3Vlc3RfbWFza2FsbCA9CmZhbHNlIGFuZCBhbGwg
ZW50cmllcyBzaG91bGQgaGF2ZSB0aGUgbWFzayBiaXQgc2V0LgoKUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
