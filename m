Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A0145840
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:55:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHNM-00023n-B4; Wed, 22 Jan 2020 14:53:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0WY=3L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iuHNK-000233-U7
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:52:58 +0000
X-Inumbo-ID: e0b1bc20-3d26-11ea-bc6c-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0b1bc20-3d26-11ea-bc6c-12813bfff9fa;
 Wed, 22 Jan 2020 14:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579704777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+FmYaQf1NpwHE8HX3Z0f5fqOOmZAjsaKZ/WRl3LfV/Y=;
 b=Fi8BkJ3rVIra35KIOoKiQOr0e5RcbRGWpHgewKvdW2kIH9O/blMMOBjg
 IXx0tax0FqApVoxCO620XwKD3ja3mEC1Le4pVmwsWhm6LJhXO8/0LFk6W
 oAeBa+JLhLiWJV0BuwpCCn3noCLKpmZw+5t2xYBYTzZWSNF8sNSJafrau 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sSULhXcJLzgd+RxtQjr7mgwtrVnvaBBXukLKV+zvTxAWtfYEvb/n7hEjHla6eIbfTeBF8C5LJ/
 7nG7nxNWdaLWygtxeU0rxG2pJoDYq5FE89Rf77wn2kqNiNta9/XYqEGfN60hsODDC+1jSjmm+H
 T61FJICHaUKO/QBsa27GA4xufEv4nZt1XRPzTnFywSfmNA1KB6VMELL0Ktc/9EovXS7qyiAyk8
 CwGFmumCFhwpDcvjSX4tid+JkR7RM3Xah4o0UhuLoIG/gLCtfVF+1y+a9r3FuNpSr8uo+LIGbS
 Nrk=
X-SBRS: 2.7
X-MesageID: 11869411
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,350,1574139600"; d="scan'208";a="11869411"
Date: Wed, 22 Jan 2020 14:52:48 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200122145248.GB57924@desktop-tdan49n.eng.citrite.net>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122144446.919-2-pdurrant@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMDI6NDQ6NDBQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEN1cnJlbnRseSBib3RoIHhsIGFuZCBsaWJ4bCBoYXZlIGludGVybmFsIGRlZmluaXRp
b25zIG9mIElOVkFMSURfRE9NSUQKPiB3aGljaCBoYXBwZW4gdG8gYmUgaWRlbnRpY2FsLiBIb3dl
dmVyLCBmb3IgdGhlIHB1cnBvc2VzIG9mIGRlc2NyaWJpbmcgdGhlCj4gYmVoYXZpb3VyIG9mIGxp
YnhsX2RvbWFpbl9jcmVhdGVfbmV3L3Jlc3RvcmUoKSBpdCBpcyB1c2VmdWwgdG8gaGF2ZSBhCj4g
c3BlY2lmaWVkIGludmFsaWQgdmFsdWUgZm9yIGEgZG9tYWluIGlkLgo+IAo+IFRoaXMgcGF0Y2gg
dGhlcmVmb3JlIG1vdmVzIHRoZSBsaWJ4bCBkZWZpbml0aW9uIGZyb20gbGlieGxfaW50ZXJuYWwu
aCB0bwo+IGxpYnhsLmggYW5kIHJlbW92ZXMgdGhlIGludGVybmFsIGRlZmluaXRpb24gZnJvbSB4
bF91dGlscy5oLiBUaGUgaGFyZGNvZGVkCj4gJy0xJyBwYXNzZWQgYmFjayB2aWEgZG9tY3JlYXRl
X2NvbXBsZXRlKCkgaXMgdGhlbiB1cGRhdGVkIHRvIElOVkFMSURfRE9NSUQKPiBhbmQgY29tbWVu
dCBhYm92ZSBsaWJ4bF9kb21haW5fY3JlYXRlX25ldy9yZXN0b3JlKCkgaXMgYWNjb3JkaW5nbHkK
PiBtb2RpZmllZC4KClVyZywgaXQncyBraW5kIG9mIHVnbHkgdG8gYWRkIGFub3RoZXIgZGVmaW5p
dGlvbiBvZiBpbnZhbGlkIGRvbWlkIHdoZW4KdGhlcmUncyBhbHJlYWR5IERPTUlEX0lOVkFMSUQg
aW4gdGhlIHB1YmxpYyBoZWFkZXJzLiBJIGd1ZXNzIHRoZXJlJ3MgYQpyZWFzb24gSSdtIG1pc3Np
bmcgZm9yIG5vdCB1c2luZyBET01JRF9JTlZBTElEIGluc3RlYWQgb2YgaW50cm9kdWNpbmcKYSBu
ZXcgdmFsdWU/CgpJZiBzbyBjb3VsZCB0aGlzIGJlIG1lbnRpb25lZCBpbiB0aGUgY29tbWl0IG1l
c3NhZ2U/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
