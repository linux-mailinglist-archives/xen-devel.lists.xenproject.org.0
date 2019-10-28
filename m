Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4289DE7785
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 18:21:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP8g4-0003ET-5B; Mon, 28 Oct 2019 17:19:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=es4G=YV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iP8g3-0003EO-G5
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 17:19:35 +0000
X-Inumbo-ID: 1c400990-f9a7-11e9-beca-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c400990-f9a7-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572283174;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ycua9PuY51CpJWF9NYTaL/L8xc5oCQxtqu9RA5+//Kw=;
 b=MiFO3dTJxaVTDD/SzNxIpGs8ramt8Y31HeVKuLcOsEkmzE/6wB2JqmDx
 9kjtKfo1JyKTXHpUPOx4s0DdizWHpD91mdF1HywPr37wlJl4gnYxnftTi
 uD1k3WTd9qe+c44Ol0jve/y8yFXB74KQRFE7FKsqBszOZnWp4bowe8q0+ U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MG95Ox8+NNr0dAEJOJlhpuClGbZ9fEkxNQyP3CJuXywUVsSGDlIQVb8D8Ax3jb6L2NOiV0HN0l
 xKBY1HlKphTBFYYSDWID1sHupOfUSYVOpjitUMnqo+LonVkL++NQTFKTYTM28mIEHK7JIgKAs4
 ny/gYSRAuKsdxRXpvG911v3TSIDfUSRYUsYV5lPBnmxfwaedp6bsNEbzKr0RyKB5Blcy/4vpZ4
 0Q2dFcDJz/mEGFjcaVFU7I/KMC5QDJjXn2zlKYmUPUImqEoFFT8jZAYvP3L7LW0vjLPnFi/XoC
 XU0=
X-SBRS: 2.7
X-MesageID: 7878902
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7878902"
Date: Mon, 28 Oct 2019 17:19:26 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191028171926.GD1162@perard.uk.xensource.com>
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
 <20191028152948.11900-2-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028152948.11900-2-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 1/3] libxl:
 domain_config_setdefault: Document use of domid
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDM6Mjk6NDZQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2UgYXJlIGdvaW5nIHRvIHdhbnQgdG8gY2FsbCB0aGlzIGZyb20gYSBzaXRlIHdoaWNo
IGhhcyBhIGRvbWlkIHdoaWNoCj4gaXMgZ29vZCBmb3IgbG9nZ2luZyBidXQgbm90IHRoZSBkb21p
ZCBvZiB0aGUgZG9tYWluIHdlIGFyZSBjcmVhdGluZwo+IChuYW1lbHksIHRoZSBzdHViIGRldmlj
ZSBkb21haW4pLgo+IAo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0t
Cj4gIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGli
eGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+IGluZGV4IGQ1
OWFjMmFiMDUuLjMyZDQ1ZGNlZjAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3Jl
YXRlLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwo+IEBAIC04OTEsNyArODkx
LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbGlieGxfX2dldF9yZXF1aXJlZF9pb21tdV9tZW1v
cnkodW5zaWduZWQgbG9uZyBtYXhtZW1fa2IpCj4gIAo+ICBpbnQgbGlieGxfX2RvbWFpbl9jb25m
aWdfc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZpZywKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkIC8qIGZvciBsb2dnaW5nLCBvbmx5
ICovKQoKU2hvdWxkIGxpYnhsX19hcmNoX3Bhc3N0aHJvdWdoX21vZGVfc2V0ZGVmYXVsdCgpIGhh
dmUgdGhlIHNhbWUgY29tbWVudD8KSnVzdCBpbiBjYXNlLCBzaW5jZSBpdCdzIGNhbGxlZCB3aXRo
IHRoYXQgc2FtZSBkb21pZC4KCkJlc2lkZSB0aGF0OgpBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
