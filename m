Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BAB84EC8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:32:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvMvk-0000DV-IX; Wed, 07 Aug 2019 14:28:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K7BD=WD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvMvj-0000DQ-PG
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:28:43 +0000
X-Inumbo-ID: a689b2ae-b91f-11e9-a3de-dbeda82b6c43
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a689b2ae-b91f-11e9-a3de-dbeda82b6c43;
 Wed, 07 Aug 2019 14:28:40 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hQYCQbWIZnordqryp9+l1l5LaN4Sr3AU1hoH+2odvoIQX9MKqwZyOWMFVKvj+WkXq9s4G0SF9x
 WnD3Et7O703brtDWLhfN70AnOe176oHEex+ucN38lVdxjzE0JEe75Vqf7e6CEuq76+zXulwx+G
 HiHcy4EG9fehFdZTLw/aBOoPPFRZoahFZGsHz2mBSeGjMXTtcxudTeCpccIz6Avw9KwqHaNe5t
 9O8kFrlvtOPYVU8f9CN+H+MynqCrgt4iPLnj0OkyAeZ6Z2gdpOYRu2pInzSMALY1fsPrG6AdFt
 Oag=
X-SBRS: 2.7
X-MesageID: 4113115
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,357,1559534400"; 
   d="scan'208";a="4113115"
Date: Wed, 7 Aug 2019 16:25:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190807142514.hhfniahggy5npll6@Air-de-Roger>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-10-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153944.24239-10-anthony.perard@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 09/35] OvmfPkg/OvmfXen: use a TimerLib
 instance that depends only on the CPU
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDQ6Mzk6MThQTSArMDEwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gVGhlIEFDUEkgVGltZXIgaXNuJ3QgcHJlc2VudCBpbiBhIFBWSCBndWVzdCwgYnV0
IGxvY2FsIEFQSUMgd29ya3Mgb24KPiBib3RoIFBWSCBhbmQgSFZNLgo+IAo+IE5vdGUgdGhhdCB0
aGUgdXNlIG9mIFNlY1BlaUR4ZVRpbWVyTGliQ3B1IG1pZ2h0IGJlIGFuIGlzc3VlIHdpdGggYQo+
IGRyaXZlciBvZiB0eXBlIERYRV9SVU5USU1FX0RSSVZFUi4gSSd2ZSBhdHRlbXB0ZWQgdG8gZmlu
ZCBvdXQgd2hpY2ggb2YKPiB0aGUgRFhFX1JVTlRJTUVfRFJJVkVSIHVzZXMgdGhlIFRpbWVyTGli
IGF0IHJ1bnRpbWUuIEkndmUgZG9uZSB0aGF0IGJ5Cj4gcmVwbGFjaW5nIHRoZSBUaW1lckxpYiBl
dmFsdWF0aW9uIGluCj4gW0xpYnJhcnlDbGFzc2VzLmNvbW1vbi5EWEVfUlVOVElNRV9EUklWRVJd
IGJ5IGEgZGlmZmVyZW50IG9uZSBhbmQKPiBjaGVja2luZyBldmVyeSBtb2R1bGUgdGhhdCB1c2Vz
IGl0ICh3aXRoIHRoZSAtLXJlcG9ydC1maWxlPXJlcG9ydAo+IGJ1aWxkIG9wdGlvbikuCj4gCj4g
UmVzZXRTeXN0ZW1SdW50aW1lRHhlIGlzIGNhbGxpbmcgdGhlIFRpbWVyTGliIEFQSSBhdCBydW50
aW1lIHRvIGRvIHRoZQo+IG9wZXJhdGlvbiAiRWZpUmVzZXRDb2xkIiwgc28gdGhpcyBtYXkgbmV2
ZXIgY29tcGxldGUgaWYgdGhlIE9TIGhhdmUKPiBkaXNhYmxlZCB0aGUgTG9jYWwgQVBJQyBUaW1l
ci4KPiAKPiBSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9MTY4OQo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgo+IEFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgo+
IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2NDoKPiAgICAgLSByZXdvcmRlZCB0aGUgZmlyc3Qgc2Vu
dGVuY2UsIHVzZSAibm90IHByZXNlbnQiIGluc3RlYWQgb2YgImRvbid0IHdvcmsiLgoKVGhhbmtz
LCBJJ20gYWZyYWlkIEkgY2Fubm90IGNvbW1lbnQgb24gdGhlIGNoYW5nZSBpdHNlbGYsIGJ1dCB0
aGUKY29tbWVudCBtZXNzYWdlIGlzIGFjY3VyYXRlIG5vdyA6KS4KClJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
