Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CFAE761F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 17:29:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP7rG-0006mT-1v; Mon, 28 Oct 2019 16:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=es4G=YV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iP7rE-0006mO-Ez
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 16:27:04 +0000
X-Inumbo-ID: c612436e-f99f-11e9-a531-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c612436e-f99f-11e9-a531-bc764e2007e4;
 Mon, 28 Oct 2019 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572280024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XHnzTWBIF1hguVfGsrYZWREqTpSp1mk4Cc294gYRwLI=;
 b=dSY84CDj+3gJxzeI2dgwuRgnHYXHjvkZUZy0AnYGYc3PEFLCP4o8NB/0
 R2Rpbj9C4KtILW77AU7A91o5HI2ZAiYKBbgJ0NF2Nhi9AIHnCfACNWh4I
 8b+Q7zR3ycTgDM7TNXEuFDzIehgr00zQ6ciqnl2nvK3J11YBmJ/NC2rd+ E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iIQmCqhRngYGqQfck63gFyAfVpithjf9Vwgnh8ljeM+7KLpkXTJeXSKhazjqkvpWfgwJljCcX8
 qMZpOcFG0ejrww8lCv/vIrcdCIusmSj6eDPRdHZxj4H7j5Rsdu5SsDV87YifeTByO1VmLqSQBL
 TX65pDudnWjF0B0IA5R8CALwGBVQxEI31RimQnw2wdXPWr8m3rKU5FgmXAUWxvfYYMpmzLcPcJ
 ZodVR5fFY4hBzzOJ0QOhOWSAgF2mx0AF08hojEI8LgjCV58vbSMIkvq7fg+bv0JtCyOo+lwTpj
 Kyk=
X-SBRS: 2.7
X-MesageID: 7611284
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7611284"
Date: Mon, 28 Oct 2019 16:27:00 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191028162700.GB1162@perard.uk.xensource.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <23990.53286.572469.441064@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23990.53286.572469.441064@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 0/4] Fix: libxl workaround,
 multiple connection to single QMP socket
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMTE6MjU6MjZBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSGkuICBUaGFua3MgZm9yIHRhY2tsaW5nIHRoaXMgc3dhbXAuICBBbGwgdmVyeSB1bmZv
cnR1bmF0ZS4KPiAKPiBBbnRob255IFBFUkFSRCB3cml0ZXMgKCJbUkZDIFhFTiBQQVRDSCBmb3It
NC4xMyAwLzRdIEZpeDogbGlieGwgd29ya2Fyb3VuZCwgbXVsdGlwbGUgY29ubmVjdGlvbiB0byBz
aW5nbGUgUU1QIHNvY2tldCIpOgo+ID4gQWx0ZXJuYXRpdmVseSB0byB0aGlzIGNyYXppbmVzcywg
aXQgbWlnaHQgYmUgcG9zc2libGUgdG8gaW5jcmVhc2UKPiA+IHRoZSBgYmFja2xvZycgdmFsdWUg
YnkgaGF2aW5nIGxpYnhsIG9wZW5pbmcgdGhlIFFNUCBzb2NrZXQgb24gYmVoYWxmCj4gPiBvZiBR
RU1VLiBCdXQgdGhpcyBpcyBvbmx5IHBvc3NpYmxlIHdpdGggYSByZWNlbnQgdmVyc2lvbiBvZiBR
RU1VCj4gPiAoMi4xMiBvciBuZXdlciwgcmVsZWFzZWQgaW4gQXByIDIwMTgsIG9yIHFlbXUteGVu
LTQuMTIgb3IgbmV3ZXIpLiBJdAo+ID4gd291bGQgaW52b2x2ZSB0byBkaXNjb3ZlciBRRU1VJ3Mg
Y2FwYWJpbGl0eSBiZWZvcmUgd2Ugc3RhcnQgdGhlIERNLAo+ID4gd2hpY2ggbGlieGwgaXNuJ3Qg
Y2FwYWJsZSB5ZXQuCj4gCj4gSSBoYXZlIGFuIGFuY2llbnQgdW5hcHBsaWVkIHBhdGNoIHNvbWV3
aGVyZSB3aGljaCBydW5zIHFlbXUgLS1oZWxwCj4gYW5kIGdyZXBzIHRoZSBvdXRwdXQuICBJZiB5
b3Ugd291bGQgbGlrZSwgSSBjYW4gZGlnIGl0IG91dC4KPiAKPiBCdXQgb25lIHByb2JsZW0gd2l0
aCB0aGF0IGFwcHJvYWNoIGlzIHRoaXM6IHdpdGhvdXQgdGhhdCBmZWF0dXJlIGluCj4gcWVtdSwg
d2hhdCB3b3VsZCB3ZSBkbyA/ICBMaXZlIHdpdGggdGhlIGJ1ZyB3aGVyZSBkb21haW4gY3JlYXRp
b24KPiBmYWlscyA/ICBCb2RnZSBpdCBieSBzZXJpYWxpc2luZyB3aXRoaW4gZG9tYWluIGNyZWF0
ZSAoYXdrd2FyZGF0aW5nCj4gdGhlIGNvZGUpID8KPiAKPiBJIGhhdmUgc29tZSBvdGhlciBzdWdn
ZXN0aW9ucyB3aGljaCBvdWdodCB0byBiZSBjb25zaWRlcmVkOgo+IAo+IAo+IDEuIFNlbmQgYSBw
YXRjaCB0byBxZW11IHVwc3RyZWFtIHRvIGFsbG93IHNwZWNpZnlpbmcgdGhlIHNvY2tldCBsaXN0
ZW4KPiBxdWV1ZS4KPiAKPiAxKGEpIEV4cGVjdCBkaXN0cm9zIHRvIGFwcGx5IHRoYXQgcGF0Y2gg
dG8gb2xkZXIgcWVtdXMsIGlmIHRoZXkgc2hpcAo+IG9sZGVyIHFlbXVzLiAgSGF2ZSBsaWJ4bCB1
bmNvbmRpdGlvbmFsbHkgc3BlY2lmeSB0aGF0IGFyZ3VtZW50Lgo+IAo+IDEoYikgZ3JlcCB0aGUg
aGVscCBvdXRwdXQgKGFzIEkgcHJvcG9zZSBhYm92ZSkgYW5kIGlmIHRoZSBwYXRjaCBpcyBub3QK
PiBwcmVzZW50LCB1c2UgTERfUFJFTE9BRCB0byB3cmFwIGxpc3RlbigyKS4KPiAKPiAKPiAyLiBT
ZW5kIGEgcGF0Y2ggdG8gcWVtdSB1cHN0cmVhbSB0byBjaGFuZ2UgdGhlIGZpeGVkIHF1ZXVlIGxl
bmd0aCBmcm9tCj4gMSB0byAxMDAwMC4gIEV4cGVjdCBkaXN0cm9zIHRvIGFwcGx5IHRoYXQgcGF0
Y2ggdG8gb2xkZXIgcWVtdXMgKGV2ZW4sCj4gcGVyaGFwcywgaWYgaXQgaXMgbm90IGFjY2VwdGVk
IHVwc3RyZWFtISkgIENoYW5nZSBsaWJ4bCB0byBkZXRlY3QKPiBFQUdBSU4gZnJvbSBxbXAgY29u
bmVjdCgpIGFuZCBwcmludCBhIG1lc3NhZ2UgZXhwbGFpbmluZyB3aGF0IHBhdGNoIGlzCj4gbWlz
c2luZy4KClRob3NlIHN1Z2dlc3Rpb25zIGFyZSBpbnRlcmVzdGluZyBpZGVhLCBidXQgSSB3b3Vs
ZCBwcmVmZXIgdG8gaGF2ZSBsaWJ4bApiZWVuIGFibGUgdG8gZGVhbCB3aXRoIGFueSB2ZXJzaW9u
IG9mIFFFTVUsIHNvIHdpdGhvdXQgaGF2aW5nIHRvIHBhdGNoClFFTVUuIEJlc2lkZSBzZXJpYWxp
c2luZyBRTVAgYWNjZXNzIGluIHRoZSBjb2RlLCBmb3JrL2xvY2sgc3RyYXRlZ3kKbWlnaHQgYmUg
dGhlIG9ubHkgb3RoZXIgd2F5LiAoV2VsbCB0aGVyZSBpcyBhbHNvIGZvcmsvY29ubmVjdCB3aXRo
IGEKYmxvY2tpbmcgZmQsIGJ1dCB3ZSBhbHJlYWR5IGhhdmUgY29kZSBmb3IgZm9yay9sb2NrLikK
ClNvIEknbGwga2VlcCB3b3JraW5nIG9uIHRoZSBmb3JrL2xvY2sgc3RyYXRlZ3kuCgo+IFNpbmNl
IHlvdSBoYXZlIHByb3ZpZGVkIGFuIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmb3JrL2xvY2sgc3Ry
YXRlZ3ksCj4gSSdsbCBub3cgZ28gYW5kIGRvIGEgZGV0YWlsZWQgcmV2aWV3IG9mIHRoYXQuCgpU
aGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
