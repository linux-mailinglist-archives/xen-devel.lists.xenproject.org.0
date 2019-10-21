Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8777BDF101
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:14:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZLM-0003l7-Oi; Mon, 21 Oct 2019 15:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMZLK-0003l2-P1
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:11:34 +0000
X-Inumbo-ID: 113d4fb8-f415-11e9-9452-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 113d4fb8-f415-11e9-9452-12813bfff9fa;
 Mon, 21 Oct 2019 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571670693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FhB4Kn2n+AuJmAbUDbd9/II0tu0Y9bUj+OpdEKPEaA4=;
 b=EcaE9bBcFWu5SA/D9Qrh6TL9JglRzpEbDkpzuqezXcFSmd2UfbTV2AfA
 83lV4clDRa/AXeLTRmCz6AzCLxUBBaODu4/7zZlMAPV62+DugY+K9LM9H
 M5aZL1E8XpcwnsTowjgNxUizqA+Gkt1eSYekJQuAfjDQPN3ddS3PaQvSV g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lRSfAlM1TRfaoqtILFDhv1r47lE7+tbwSRKvTNZLUPpio1nyvcXO2x+mqU2848rLQFr5CyDQl3
 7bSxs1TAREv6Cs0i2sqtAUSCYimLJquELnQHFNd8rUEZ103U0WrZM9iU7tGrsCCZynubW+e/h3
 Jn19OK3GWluCiNWl6DrU2bRVnFv5MDJQrPtB9z35Ya7xnDLnxUA9uKOUWMYt15qfZk9PtVOFBF
 A2t1kLHz9JZCCzYCyPItrl5zgjJcLw/0HYKXbam8B8hl5e/amQu0wcZU6GjM3AFh5NGG8TPJdI
 +H4=
X-SBRS: 2.7
X-MesageID: 7544861
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7544861"
Date: Mon, 21 Oct 2019 17:11:26 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20191021151126.GM17494@Air-de-Roger>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-10-liuwe@microsoft.com>
 <20191021102225.GH17494@Air-de-Roger>
 <20191021145651.a2oxvh25kzbccy5n@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021145651.a2oxvh25kzbccy5n@debian>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-next v2 9/9] x86: introduce
 CONFIG_HYPERV and detection code
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDM6NTY6NTFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCAxMjoyMjoyNVBNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+IFsuLi5dCj4gPiA+ICtib29sIF9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkK
PiA+ID4gK3sKPiA+ID4gKyAgICB1aW50MzJfdCBlYXgsIGVieCwgZWN4LCBlZHg7Cj4gPiA+ICsg
ICAgYm9vbCBoeXBlcnZfZ3Vlc3QgPSBmYWxzZTsKPiA+IAo+ID4gSSBkb24ndCB0aGluayB5b3Ug
bmVlZCB0aGlzIGxvY2FsIHZhcmlhYmxlLCB5b3UgY2FuIHJldHVybiB0cnVlIGluIGlmCj4gPiB0
aGUgaWYgY29uZGl0aW9uIG1hdGNoZXMsIGFuZCBmYWxzZSBvdGhlcndpc2UuCj4gPiAKPiAKPiBT
dXJlLiBJIGNhbiBkcm9wIGl0IGZvciBub3cgYW5kIHJlaW50cm9kdWNlIGl0IHdoZW4gbmVjZXNz
YXJ5Lgo+IAo+ID4gPiArCj4gPiA+ICsgICAgY3B1aWQoMHg0MDAwMDAwMCwgJmVheCwgJmVieCwg
JmVjeCwgJmVkeCk7Cj4gPiA+ICsgICAgaWYgKCAoZWJ4ID09IDB4NzI2MzY5NGQpICYmIC8qICJN
aWNyIiAqLwo+ID4gPiArICAgICAgICAgKGVjeCA9PSAweDY2NmY3MzZmKSAmJiAvKiAib3NvZiIg
Ki8KPiA+ID4gKyAgICAgICAgIChlZHggPT0gMHg3NjQ4MjA3NCkgKSAgLyogInQgSHYiICovCj4g
PiAKPiA+IEkgZ3Vlc3MgdGhlcmUgYXJlIG5vIEh5cGVyViBoZWFkZXJzIHRvIGltcG9ydCB0aGF0
IGhhdmUgdGhvc2UgdmFsdWVzCj4gPiBkZWZpbmVkPwo+ID4gCj4gCj4gTm90IHlldC4gSSBoYXZl
IHBsYW4gdG8gaW1wb3J0IGEgaGVhZGVyIGZyb20gTGludXguIFdoZW4gdGhhdCdzIGRvbmUKPiB0
aGVzZSB3aWxsIGJlIHJlcGxhY2VkIGJ5IHNvbWUgbWFjcm9zLgo+IAo+IFNvIEkgd2lsbCBrZWVw
IHRoaXMgYXMtaXMgZm9yIG5vdy4KCklzIGl0IHJlYWxseSBjdW1iZXJzb21lIHRvIGludHJvZHVj
ZSB0aGUgaGVhZGVyIG5vdz8KCklNTyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYXZvaWQgZGVmZXJy
aW5nIHRoaXMgdG8gd2hlbiB5b3UgaW50cm9kdWNlCnRoZSBoZWFkZXIsIHNpbmNlIGl0J3MgZWFz
eSB0byBtaXNzIGl0LgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
