Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F92111A8A2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 11:10:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieytX-0000kL-9J; Wed, 11 Dec 2019 10:06:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=irg7=2B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieytW-0000kG-4v
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 10:06:58 +0000
X-Inumbo-ID: f651bade-1bfd-11ea-8ae8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f651bade-1bfd-11ea-8ae8-12813bfff9fa;
 Wed, 11 Dec 2019 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576058817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5u5G6DvrHHYulwWxXP6RstYPZT7qaXjQ0DriMESzSyA=;
 b=KWsbXkBEYgZat9eFD0pM1erZhstiJ49OSCwcnDw5wAAoHemIeVEFOFi6
 +T5ZImLRYsC21uT7OxHtAkTKpUTvhVISYNfxYTCSF4BjwgUNi6zRjUprm
 fPw5GJB2LJxgh3TsUxOUIjoasbTorFRgJ0HBuZ/stwg78qCi7Hw03OVk7 w=;
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
IronPort-SDR: h/++TCBi6C1mtA3r2r4COIFU7QXU1SxGYa0kvs/AAIA/HzuKOgPkJTwyZ2lmqLf9XKazfUwH7c
 xINyLWFzaAoDqJ593kmfWd85AhzpISMMLYjKcm8czhMmqnA50DPrKQjrZXl8VN5Hm+mR3gEdMK
 5CcgFiAZwpk8sYzqoJ38tPrchGtds4tWqkNkJpJ8sdb3UZWXIffyt+i4nmndyyvr7IwhjjiTCe
 H0gSssg35mwqkGBizjBWCehbnDyILPqGmgzL61k3AnZgBT6XMMYO4DkShwJKPdc3Zx/px8l0eM
 5Ps=
X-SBRS: 2.7
X-MesageID: 9642862
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,301,1571716800"; 
   d="scan'208";a="9642862"
Date: Wed, 11 Dec 2019 11:06:27 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191211100627.GI980@Air-de-Roger>
References: <20191210113347.3404-1-pdurrant@amazon.com>
 <20191210113347.3404-3-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210113347.3404-3-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2 2/4] xenbus: limit when state is forced
 to closed
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMTE6MzM6NDVBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IElmIGEgZHJpdmVyIHByb2JlKCkgZmFpbHMgdGhlbiBsZWF2ZSB0aGUgeGVuc3RvcmUg
c3RhdGUgYWxvbmUuIFRoZXJlIGlzIG5vCj4gcmVhc29uIHRvIG1vZGlmeSBpdCBhcyB0aGUgZmFp
bHVyZSBtYXkgYmUgZHVlIHRvIHRyYW5zaWVudCByZXNvdXJjZQo+IGFsbG9jYXRpb24gaXNzdWVz
IGFuZCBoZW5jZSBhIHN1YnNlcXVlbnQgcHJvYmUoKSBtYXkgc3VjY2VlZC4KPiAKPiBJZiB0aGUg
ZHJpdmVyIHN1cHBvcnRzIHJlLWJpbmRpbmcgdGhlbiBvbmx5IGZvcmNlIHN0YXRlIHRvIGNsb3Nl
ZCBkdXJpbmcKPiByZW1vdmUoKSBvbmx5IGluIHRoZSBjYXNlIHdoZW4gdGhlIHRvb2xzdGFjayBt
YXkgbmVlZCB0byBjbGVhbiB1cC4gVGhpcyBjYW4KPiBiZSBkZXRlY3RlZCBieSBjaGVja2luZyB3
aGV0aGVyIHRoZSBzdGF0ZSBpbiB4ZW5zdG9yZSBoYXMgYmVlbiBzZXQgdG8KPiBjbG9zaW5nIHBy
aW9yIHRvIGRldmljZSByZW1vdmFsLgo+IAo+IE5PVEU6IFJlLWJpbmQgc3VwcG9ydCBpcyBpbmRp
Y2F0ZWQgYnkgbmV3IGJvb2xlYW4gaW4gc3RydWN0IHhlbmJ1c19kcml2ZXIsCj4gICAgICAgd2hp
Y2ggZGVmYXVsdHMgdG8gZmFsc2UuIFN1YnNlcXVlbnQgcGF0Y2hlcyB3aWxsIGFkZCBzdXBwb3J0
IHRvCj4gICAgICAgc29tZSBiYWNrZW5kIGRyaXZlcnMuCgpNeSBpbnRlbnRpb24gd2FzIHRvIHNw
ZWNpZnkgd2hldGhlciB5b3Ugd2FudCB0byBjbG9zZSB0aGUKYmFja2VuZHMgb24gdW5iaW5kIGlu
IHN5c2ZzLCBzbyB0aGF0IGFuIHVzZXIgY2FuIGRlY2lkZSBhdCBydW50aW1lLApyYXRoZXIgdGhh
biBoYXZpbmcgYSBoYXJkY29kZWQgdmFsdWUgaW4gdGhlIGRyaXZlci4KCkFueXdheSwgSSdtIGxl
c3Mgc3VyZSB3aGV0aGVyIHN1Y2ggcnVudGltZSB0dW5hYmxlIGlzIHVzZWZ1bCBhdCBhbGwsCnNv
IGxldCdzIGxlYXZlIGl0IG91dCBhbmQgY2FuIGFsd2F5cyBiZSBhZGRlZCBhZnRlcndhcmRzLiBB
dCB0aGUgZW5kCm9mIGRheSBhIHVzZXIgd3JvbmdseSBkb2luZyBhIHJtbW9kIGJsa2JhY2sgY2Fu
IGFsd2F5cyByZWNvdmVyCmdyYWNlZnVsbHkgYnkgbG9hZGluZyBibGtiYWNrIGFnYWluIHdpdGgg
eW91ciBwcm9wb3NlZCBhcHByb2FjaCB0bwpsZWF2ZSBjb25uZWN0aW9ucyBvcGVuIG9uIG1vZHVs
ZSByZW1vdmFsLgoKU29ycnkgZm9yIHRoZSBleHRyYSB3b3JrLgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
