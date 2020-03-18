Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E34189A5E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 12:16:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEWew-0006CY-S3; Wed, 18 Mar 2020 11:14:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lnqk=5D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jEWev-0006CL-SC
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 11:14:49 +0000
X-Inumbo-ID: ae376718-6909-11ea-bac2-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae376718-6909-11ea-bac2-12813bfff9fa;
 Wed, 18 Mar 2020 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584530088;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7hBnZ3Fvt7Ln/J12F9iCP5MBa497TCbye4b/Ep8PqeM=;
 b=CqunyqNW8dWNTzLIU8/K1zOJE81SEviTsWJZZB8KdoGRU2K3xK7y9CU+
 /XeJX68yJ7cHiMBRexLrEuvDnkSgjqM3BomoJ5AGyqTSmIfvXDyA4QeY0
 Y/5a/99UQiIF7cCq6L7Aid80MBJtl82b8dsEljS2ewFKVu68+nurIFTHd 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1yFGXLNw+JEOi+Z7c++k42+/Sp87QzsTOudy0g5Ezaw7UH8ojFYeKN2026HcfUkT1tcfNXb8jZ
 jLUaT4uvzdf7LQMummC77Dz6Zth8EPRi3qhgZGkEvkwIoxDtYanewh6tlmksqiwGTgUCtb0saH
 HNHfjiSqkXQoh9A6hk2c8sOXLLMWg2RvuVlvMldD/NxDDsuH1v6/CFITbt2wbv+EZDS7dZZS7n
 3KFTSVZCBjkO5I6D8xyCNy7JYn+cJlbvFdhgfSeiDkdCgUP94/RtpU30l75mEptvNIRWaTiPIa
 +HQ=
X-SBRS: 2.7
X-MesageID: 14834261
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,567,1574139600"; d="scan'208";a="14834261"
Date: Wed, 18 Mar 2020 11:14:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200318111444.GF4088@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-20-anthony.perard@citrix.com>
 <25d5c758-3234-eff8-4627-66cb5b232f78@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25d5c758-3234-eff8-4627-66cb5b232f78@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 19/23] xen/build: Use
 if_changed_rules with %.o:%.c targets
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDU6MDk6MTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiArZGVm
aW5lIHJ1bGVfY2Nfb19jCj4gPiArICAgICQoY2FsbCBjbWRfYW5kX3JlY29yZCxjY19vX2MpCj4g
PiArICAgICQoY2FsbCBjbWQsb2JqY29weV9maXhfc3ltKQo+IAo+IFRoZSBtYWNoaW5lcnkgaXMg
cmVzaWxpZW50IHRvIGEgY29tbWFuZCAoaGVyZTogY21kX29iamNvcHlfZml4X3N5bSkKPiBub3Qg
YmVpbmcgZGVmaW5lZCwgYW5kIHdpbGwgbmVpdGhlciBwcm9kdWNlIGFueSB1bmR1ZSBvdXRwdXQg
bm9yCj4gZWxzZSBpbmN1ciBhbnkgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQ/CgpZZXMsIGl0J3MgZmlu
ZSB3aGVuIGNtZF9vYmpjb3B5X2ZpeF9zeW0gaXNuJ3QgZGVmaW5lZCwgbm90aGluZyBnZXRzCnBy
aW50ZWQgb24gdGhlIGNvbnNvbGUsIGFuZCB0aGVyZSBpcyBubyBlcnJvci4KCkFzIGZvciB1bm5l
Y2Vzc2FyeSBvdmVyaGVhZCwgSSBkb24ndCBrbm93LiBUaGUgbWFjcm8gc3RpbGwgZXhwYW5kIHRv
CiJAc2V0IC1lOyIuIEJ1dCBMaW51eCB1c2VzIHRoYXQgYSBsb3QgKGhhdmluZyB1bmRlZmluZWQg
Y21kXyopLCBzbyBJCmd1ZXNzIGl0J3Mgbm90IHRvbyBiYWQuCgotLSAKQW50aG9ueSBQRVJBUkQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
