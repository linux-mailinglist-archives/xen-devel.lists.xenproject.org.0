Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A391EBD9
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 12:11:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqqc-00049p-Jw; Wed, 15 May 2019 10:09:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ez+k=TP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQqqa-00049R-Th
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:09:16 +0000
X-Inumbo-ID: 7d708b3a-76f9-11e9-ae96-5f3bda6a6f23
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d708b3a-76f9-11e9-ae96-5f3bda6a6f23;
 Wed, 15 May 2019 10:09:14 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: g3A1nTekBgfIeEbEEgx3LJdwm4FWakuXKyPi6KdbiaquHiS3t9Ij6dg8jFXTcYtrH1QRJ6L8yv
 59YIPfA1rRVcHt8kdKpOzbNDLx4OzcYsOUcPKCi8X/155Drd/+f7uPsDDlh43U0V2TbvU3fMLq
 Uu2ALZtCRvtYtu5Z4Ud+7FKwLxNZBlhTa/PkXHzi5kYXMMY3ia6RVDdbfdXxew9fL6Xqz7PG1N
 Q/w6Pn6PERzqWC1vnvENV05ZddJYREjAbVGY8kZSCw/ra/xmUOJcF6nHh+tEWi0Sva8P62EtSY
 k9Y=
X-SBRS: 2.7
X-MesageID: 439217
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="439217"
Date: Wed, 15 May 2019 12:09:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190515100901.4psea2vmmugrkigl@Air-de-Roger>
References: <5CDBD157020000780022F1EA@prv1-mh.provo.novell.com>
 <20190515094435.fgcqzbmj7gbqfgmj@Air-de-Roger>
 <fb2114ce-79d0-fcb1-5b4e-c540aecb360b@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb2114ce-79d0-fcb1-5b4e-c540aecb360b@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] page-alloc: accompany BUG() with printk()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien
 Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTA6NTk6MjBBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNS8wNS8yMDE5IDEwOjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDI6NDQ6MDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4gTG9nIGluZm9ybWF0aW9uIGxpa2VseSByZWxldmFudCBmb3IgdW5kZXJzdGFuZGlu
ZyB3aHkgdGhlIEJVRygpcyB3ZXJlCj4gPiBXaHkgbm90IHVzZSBwYW5pYyBpbnN0ZWFkIG9mIHBy
aW50ayArIEJVRz8KPiAKPiBCZWNhdXNlIHRoZSBiYWNrdHJhY2UgaXMgdXNlZnVsIGEgbG90IG9m
IHRoZSB0aW1lLgoKT2gsIHBhbmljIGhhcyBubyBiYWNrdHJhY2UsIHRoYXQncyBub3QgdmVyeSB1
c2VmdWwuIE1heWJlIHdlIGNvdWxkIGFkZAphIHBhbmljX3RyYWNlIHZlcnNpb24gdG8gYXZvaWQg
aGF2aW5nIHRvIGRvIGEgcHJpbnRrICsgQlVHLiBJbiBhbnkKY2FzZToKClJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywgUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
