Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE0D116C6F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 12:42:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieHO4-0007oJ-4V; Mon, 09 Dec 2019 11:39:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pdib=Z7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ieHO2-0007oE-RU
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 11:39:34 +0000
X-Inumbo-ID: 9211ab46-1a78-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9211ab46-1a78-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575891573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=39CqSIEMZVfOawQ2ymQJQJHkso0RnGhhEsi61vao+jE=;
 b=eJNWy0Arpp85BmQEBNkRUdlRTZLU5+B1Hita6WtJtgYH5y4etAEnW1qy
 /6FG9EqtwjPf9ezrncoDS700FyslRVuMDcaBORgk7MA8pXvK4yscITlPx
 ybvEFKM07CjXZthtK5VCco53h3TczbgqeAR0N2DGzARVWDGKVX+X+xYLx Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QOjjavhu2Xb8XBPsXZWMvhL5aoSyi6XLHS1Pqi7msf0HO36Hi78MF0A3Lo/07gHXRZrdZFJZuu
 MK2J1WMOzg1z6ysUyG8Mc457o9N5/1uYaS6hGJvzzo6zc7uw3KZ22l3SI8rShKtI72dSwHXKeK
 Wqj1EQiO7h9CC8mTUo7SgIQEWKkQaDxRa97qlR0ogD8ngfQ2ISZIqf1DvkVNye1gDF9YPbfAj6
 JSexr7+ea3QfZ6XujNzi0AwHtAz3quhtWWfwmfGMRa9zXoh/c20GzhpoUs0YA1G+u10QZJKxsF
 0g8=
X-SBRS: 2.7
X-MesageID: 9741861
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,294,1571716800"; 
   d="scan'208";a="9741861"
Date: Mon, 9 Dec 2019 12:39:26 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20191209113926.GS980@Air-de-Roger>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205140123.3817-3-pdurrant@amazon.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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

T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDI6MDE6MjFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE9ubHkgZm9yY2Ugc3RhdGUgdG8gY2xvc2VkIGluIHRoZSBjYXNlIHdoZW4gdGhlIHRv
b2xzdGFjayBtYXkgbmVlZCB0bwo+IGNsZWFuIHVwLiBUaGlzIGNhbiBiZSBkZXRlY3RlZCBieSBj
aGVja2luZyB3aGV0aGVyIHRoZSBzdGF0ZSBpbiB4ZW5zdG9yZQo+IGhhcyBiZWVuIHNldCB0byBj
bG9zaW5nIHByaW9yIHRvIGRldmljZSByZW1vdmFsLgoKSSdtIG5vdCBzdXJlIEkgc2VlIHRoZSBw
b2ludCBvZiB0aGlzLCBJIHdvdWxkIGV4cGVjdCB0aGF0IGEgZmFpbHVyZSB0bwpwcm9iZSBvciB0
aGUgcmVtb3ZhbCBvZiB0aGUgZGV2aWNlIHdvdWxkIGxlYXZlIHRoZSB4ZW5idXMgc3RhdGUgYXMK
Y2xvc2VkLCB3aGljaCBpcyBjb25zaXN0ZW50IHdpdGggdGhlIGFjdHVhbCBkcml2ZXIgc3RhdGUu
CgpDYW4geW91IGV4cGxhaW4gd2hhdCdzIHRoZSBiZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZpY2Ug
d2l0aG91dCBhCmRyaXZlciBpbiBzdWNoIHVua25vd24gc3RhdGU/CgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
