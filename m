Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B4E8A17F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 16:48:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBZR-0000UJ-3U; Mon, 12 Aug 2019 14:45:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SvGD=WI=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxBZO-0000UA-R7
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 14:45:10 +0000
X-Inumbo-ID: c7e8e544-bd0f-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c7e8e544-bd0f-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565621110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8LpCWNDEppu4zSi1KULQfGaE8LtZjXPeWGyd8nTtnlw=;
 b=T5lFRmV5N0fkEMIki8GPQ2df/IdItWPTQYgsEj5WnZtaBpHyD7g3K/4G
 mj+xlYx2D6vSVdOoNuTO6GGu2bY/UbWiFcjgfuv4U3aOmABsTijCUaVsj
 OmQ0NPiPjUnyohwJ4CXgFch96P6NirrJHLHCZaRgR9f1ILVWKtT8l9LtZ M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YyIoMticQ3ijvYXG0duzSw86KOHl67AXGgoFvwIU1YpO6bBwI9lDmr6JvcIs0aKdNlljZCI/Ju
 jrfS6w0Y8SBLFo2s1kgqK6JC/N3ePNdjF3hGS7yRXJ3hGFIiGTk41Uwu651Jo4ksFyo9FzJhEg
 YBwgydEYNRwdojetHrvNgIpJs0pHFt93g/+uj0GgwQs6lsP7+fxyvAqmluVpiQ5U5kQzKeKYcG
 69tUvxwPGLwuiBvy0mbhWIJZfbRlsPkTT3NLEILvMX+BMqzvjMKrZDQkzf8NXN24H7v4RY762m
 wtI=
X-SBRS: 2.7
X-MesageID: 4169836
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4169836"
Date: Mon, 12 Aug 2019 15:45:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190812144500.GA1289@perard.uk.xensource.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-30-anthony.perard@citrix.com>
 <20190807155451.pkld6zhcxljzx6d7@Air-de-Roger>
 <20190808132832.GU1242@perard.uk.xensource.com>
 <20190808134423.ybqg3qkpw5ucfzk4@Air-de-Roger>
 <20190808142641.GX1242@perard.uk.xensource.com>
 <20190808151815.nwup2kwu2qhm54ch@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808151815.nwup2kwu2qhm54ch@Air-de-Roger>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 29/35] OvmfPkg/OvmfXen:
 Override PcdFSBClock to Xen vLAPIC timer frequency
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDU6MTg6MTVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUaHUsIEF1ZyAwOCwgMjAxOSBhdCAwMzoyNjo0MVBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IFNvIEVES0lJIGRvZXNuJ3QgaGF2ZSB0aGF0IGNhcGFiaWxp
dHksIEZTQkNsb2NrIGlzIGEgYnVpbGQgdGltZSB2YWx1ZQo+ID4gYW5kIGNhbid0IGJlIGNoYW5n
ZWQgYXQgcnVuIHRpbWUuIEJ1dCBPVk1GIChvbiBLVk0gb3IgSFZNKSBkb2Vzbid0IHVzZQo+ID4g
dGhhdCB2YWx1ZSBhdCBhbGwsIGl0IHVzZXMgdGhlIEFDUEkgdGltZXIgaW5zdGVhZC4KPiAKPiBC
dXQgYWZ0ZXIgeW91ciBzZXJpZXMgYm90aCBQVkggYW5kIEhWTSB3aWxsIHVzZSB0aGUgbGFwaWMg
dGltZXIKPiBpbnN0ZWFkIG9mIHRoZSBBQ1BJIHRpbWVyLCBhbmQgdGh1cyByZWx5IG9uIHRoZSB2
YWx1ZSBvZiBGU0JDbG9jaz8KClNob3J0IGFuc3dlciwgWWVzLgoKTG9uZ3VlciBhbnN3ZXIsIGFm
dGVyIHRoZSBzZXJpZXMgaXMgYXBwbGllZCwgdGhlcmUgd2lsbCBiZSBhIG5ldwpwbGF0Zm9ybSwg
Ik92bWZYZW4iIHdoaWNoIHdpbGwgYmUgZm9yIGJvdGggWGVuIFBWSCBhbmQgWGVuIEhWTSwgYnV0
IHRoZQpPVk1GIHRoYXQgd2Uga25vdyAoT3ZtZlBrZ1g2NCB0aGF0IHhlbi5naXQgYnVpbGRzKSB3
aWxsIHN0aWxsIGJlCmNhcGFibGUgb2YgcnVubmluZyBvbiBYZW4gSFZNIGZvciBhIHNob3J0IHdo
aWxlIGFuZCB3aWxsIHN0aWxsIHVzZSB0aGUKQUNQSSB0aW1lci4KCi0tIApBbnRob255IFBFUkFS
RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
