Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611DC2074A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:52:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFpx-0002vC-Jf; Thu, 16 May 2019 12:50:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRFpw-0002uq-3m
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:50:16 +0000
X-Inumbo-ID: 26747d50-77d9-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26747d50-77d9-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:50:15 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: kdhFfFrKw/hSUi9g0vNOMdLm/XErYPY3+zo2Esig3xh5obq7fyN1zkTxzcjmGtQG5AljBDIdCi
 HlAHjTuKL+GLl3yhoyicirsFdShDPKZJKtPO6kX90GePozHbwkLdU+C1VdOLrj+RkU9S+BXxcw
 6/4WeEYrglmav6eJIKOQ7va2MSOtY6CRk1xcf2/C8MOqdlG4MbsRKkMQtwI3CzJhd8iQIKwCCP
 du9K8VL0tHEDTacGBWeKl2zbxiT0NqLfG3M6didgt1KgaqRD0fMWh19/qF4qXGa1Qu4NyhrJHU
 Eik=
X-SBRS: 2.7
X-MesageID: 511868
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,476,1549947600"; 
   d="scan'208";a="511868"
Date: Thu, 16 May 2019 13:50:11 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Olaf Hering <ohering@suse.com>
Message-ID: <20190516125011.GE2798@zion.uk.xensource.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
 <20190516125735.6c1bf1ca.ohering@suse.com>
 <20190516112450.GW2798@zion.uk.xensource.com>
 <20190516133857.742e4f13.ohering@suse.com>
 <20190516115043.GB2798@zion.uk.xensource.com>
 <20190516140451.06cfcbfe.ohering@suse.com>
 <20190516141805.281f972e.ohering@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516141805.281f972e.ohering@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDI6MTg6MDVQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVGh1LCAxNiBNYXkgMjAxOSAxNDowNDo1MSArMDIwMAo+IHNjaHJpZWIgT2xhZiBI
ZXJpbmcgPG9oZXJpbmdAc3VzZS5jb20+Ogo+IAo+ID4gVGhlcmUgYXJlIHF1aXRlIGEgZmV3IGNo
ZWNrcyBmb3IgZGV2aWNlX21vZGVsX3ZlcnNpb24sIHRoZXkgd291bGQgYmUgYWxsCj4gPiB3cm9u
ZyBpZiB0aGUgYXNzZXJ0IGlzIHJlbW92ZWQsIG9yIGNoYW5nZWQgYmFjayB0byBRRU1VX1hFTi4g
UGVyaGFwcyB3ZQo+ID4gY2FuIGNvbnRpbnVlIHRvIGxpdmUgd2l0aCB0aGF0IGVycm9yLiBkZXZp
Y2VfbW9kZWxfdmVyc2lvbiBjb3VsZCBiZWNvbWUKPiA+IGEgbG9jYWwgdmFyaWFibGUuIElmIGl0
IGlzIG5vdCBzZXQsIGFzc3VtZSB0aGUgY2FsbGVyIGp1c3Qgd2FudHMgdGhlCj4gPiBtZW1vcnkg
c2l6ZSBhbmQgZW5mb3JjZSBRRU1VX1hFTiBhZ2FpbiB3aXRoaW4gdGhhdCBmdW5jdGlvbi4KPiAK
PiBJIHRoaW5rIHRoYXQgaXMgd2hhdCBzaG91bGQgYmUgZG9uZSwganVzdCBmb3IgdGhlIHNha2Ug
b2YKPiBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkuIElmIGFuIGluY29tcGxldGUgYl9pbmZvIGlz
IHByb3ZpZGVkLCBhc3N1bWUKPiBkZXZpY2VfbW9kZWxfdmVyc2lvbj1RRU1VX1hFTiwgbWFpbnRh
aW4gdGhhdCBzdGF0ZSBpbiBhIGxvY2FsIHZhcmlhYmxlLgoKSSBjaGVja2VkLCBsaWJ4bF9kb21h
aW5fbmVlZF9tZW1vcnkgaXMgYWN0dWFsbHkgdGhlIG9ubHkgcHVibGljIEFQSQp3aGljaCB0YWtl
cyBiX2luZm8uCgpTbyB0aGlzIHNob3VsZCB3b3JrIC0tIHdlIGp1c3QgbmVlZCB0byBmaXggdGhh
dCBvbmUgQVBJIHRvIHJldGFpbiBpdHMKb3JpZ2luYWwgYmVoYXZpb3VyLgoKPiBJZiB3ZSB3YW50
IHRvIHByb3ZpZGUgYW5vdGhlciBuZXcgcHVibGljIEFQSSB0byBmaWxsIG1pc3NpbmcgZGVmYXVs
dHMsCj4gdGhhdCBjb3VsZCBzdGlsbCBiZSBkb25lIGluIGEgc2VwYXJhdGUgcGF0Y2guCj4gCgpZ
ZXMuCgpXZWkuCgo+IE9sYWYKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
