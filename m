Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A55611E69D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:34:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmue-0002h8-8E; Fri, 13 Dec 2019 15:31:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mOMl=2D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifmuc-0002h3-J3
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:31:26 +0000
X-Inumbo-ID: 9f766dec-1dbd-11ea-8f3c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f766dec-1dbd-11ea-8f3c-12813bfff9fa;
 Fri, 13 Dec 2019 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576251085;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xI9Xn6LhGwtA2yxwF/3zgnsCOUWrOWQ/WgeSKy1Z2DY=;
 b=YFTsmnOttoWdW5Y5ie6tUxA8cL4qE/6PHLuy1pcsAW+nYVZATQ9iPbo0
 Gjvy2Tdyw79xHl4ifVCyzWIBR9iO73FxFFwoI/mxtUUpUWvwdDw2hrFy5
 Z30mRBMTUwYfZVpOI938xUj0nHQPPHhXmI36b67N4KJkMEkOXTdK+VKOm U=;
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
IronPort-SDR: g7XujzIC4U7uiOhhSX+1jgYlhPPDqnKgb5MrmOlsvi8QpZCaaMhdCrazVFP0/SI93fnWi2dCp3
 jTDwKxfRD6qbV9VsEhFOK0B2VWPHVNOLBs3nYwGGGuQ8bM6WV8MTkvwEU6kVWAnE7gllL+mIIh
 Uqb27YtGw0hEaNDflwF+ZrHCf3C/XYIkE3PqoqHjM6alP9jd7rz3UYl03IQTY2XaSoE52xWopd
 8aZ4djV/yomacFRHH21efSdXUKerIJKg+evVtTYrDHtH5gGChMgnd1EIdSKpz4GoQOdJpXORKG
 i7U=
X-SBRS: 2.7
X-MesageID: 10065035
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10065035"
Date: Fri, 13 Dec 2019 15:31:22 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191213153122.GL1155@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
 <beee342b-0d81-f0bb-0a56-2b4eb4b2df67@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <beee342b-0d81-f0bb-0a56-2b4eb4b2df67@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDY6NDU6MDJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8xMi8yMDE5IDE4OjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IERl
cGVuZGVuY3kgY2hhbmdlOgo+ID4gLSBOb3cgZGVwZW5kcyBvbiBmbGV4L2Jpc29uLCBtYXliZSB3
ZSBjb3VsZCBfc2hpcHBlZCB0aG9zZSBmaWxlcyBsaWtlCj4gPiAgIGJlZm9yZS4gTGludXggZG9l
c24ndCBkbyB0aGF0IGFueW1vcmUuCj4gCj4gQ29udGVudCBsaWtlIHRoYXQgc2hvdWxkIG5vdCBi
ZSBjaGVja2VkIGluIHRvIGJlaW5nIHdpdGgsIGFuZCBJIHRoaW5rIGl0Cj4gaXMgZW50aXJlbHkg
cmVhc29uYWJsZSB0byByZXF1aXJlIGZsZXgvYmlzb24gaW4gYSBidWlsZCBlbnZpcm9ubWVudC4K
PiAKPiBJbmRlZWQsIFJFQURNRSBsaXN0cyB0aGVtIGFzIG1hbmRhdG9yeSByZXF1aXJlbWVudHMu
CgpIb3BlZnVsbHksIG5vIG9uZSB3aWxsIG5vdGljZSB0aGF0LCBldmVuIHNvIHRoZXkgYXJlIG1h
bmRhdG9yeSBvbiBwYXBlciwKeW91IGNvdWxkIGJ1aWxkIFhlbiAod2l0aCB0aGUgdG9vbHMpIHdp
dGhvdXQgbmVlZGVkIGZsZXgvYmlzb24uIDotKQpCdXQgeWVzLCBJIHRoaW5rIGZsZXgvYmlzb24g
aXMgbGlrZSBtYWtlLCB0aGV5IGFyZSBwcm9iYWJseSBwYXJ0IG9mIHRoZQptaW5pbXVtIGxpc3Qg
b2YgcGFja2FnZXMgdGhhdCBuZWVkcyB0byBiZSBpbnN0YWxsZWQgd2hlbiBidWlsZGluZwphbnl0
aGluZyBvbiBtYW55IGRpc3Ryby4KCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
