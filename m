Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAA411E719
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:52:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnCS-0004dx-I2; Fri, 13 Dec 2019 15:49:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mOMl=2D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifnCQ-0004ds-Vs
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:49:51 +0000
X-Inumbo-ID: 311e5f99-1dc0-11ea-8f4f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 311e5f99-1dc0-11ea-8f4f-12813bfff9fa;
 Fri, 13 Dec 2019 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576252190;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F6yIkLgWhx+SG4DfPYLBGcRjFQte61MhtE0eGSLLbqU=;
 b=Wnr+5tWFNTM5jwl0cAkOzhBMq3W6Cv5jMr/6iQgOEWDMecnw/79/jR10
 uRLKOCF3Sx87wr0DuvdPapXb/plRmdStCfL1DsRSZ/bBH/E1fObSM/IAO
 859WdvkXJDBJLZGWqOBrS0ImsEHNyV/vp9EWI7MzlWkAP8nXvb9dMXwja Y=;
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
IronPort-SDR: 6hf5xeLjyJp2s7DQH8LPnU+Rmls9dBSnBAuA8asNX7xWv4Okwxikk0UMhVefz11y5mnrw0x98a
 2b1Uh3yxDf9ZH8OGezQ4Lc7QC14YW5dxjI9e+zt9Wy9lM4nNO/BQ6lxbTs/n0kA+iFhrHy9iO5
 Ru2V+LrMyofe8YZYuMY5KlXyMBcFoSSVZHvkz2t970H/5n0KBGXizHPs8IP/4zHnL0Ix4Kage8
 koZan+qvgbQGzz6WPGvQoBqMld6xJBgL3bmtdYW1PBDqbyGP2SGHe3XCKyf9d2fsTPOqHG6k+I
 vsM=
X-SBRS: 2.7
X-MesageID: 10066079
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10066079"
Date: Fri, 13 Dec 2019 15:49:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191213154946.GM1155@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
 <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMTI6MDU6MTFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSnVzdCB0d28gbWlub3IgcmVtYXJrczoKPiAKPiBPbiAxMi4xMi4yMDE5IDE5OjI3LCBB
bnRob255IFBFUkFSRCB3cm90ZToKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RvY3MvbWlz
Yy9rY29uZmlnLW1hY3JvLWxhbmd1YWdlLnJzdApbLi4uXQo+ID4gK1RoZW4sIEtjb25maWcgbW92
ZXMgb250byB0aGUgZXZhbHVhdGlvbiBzdGFnZSB0byByZXNvbHZlIGludGVyLXN5bWJvbAo+ID4g
K2RlcGVuZGVuY3kgYXMgZXhwbGFpbmVkIGluIGtjb25maWctbGFuZ3VhZ2UudHh0Lgo+IAo+IC5y
c3QgPwoKTG9va3MgbGlrZSBpdCwgYnV0IHRoYXQncyBhbiB1cHN0cmVhbSBidWcuIEknbGwgdHJ5
IHRvIHNlbmQgYSBwYXRjaAp1cHN0cmVhbS4KCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi94
ZW4vLmdpdGlnbm9yZQo+ID4gQEAgLTAsMCArMSwyIEBACj4gPiArKi5sZXguYwo+ID4gKyoudGFi
LltjaF0KPiAKPiBXaHkgZG8gdGhlc2UgZ2V0IG1vdmVkIGhlcmUgZnJvbSAuLi4KPiAKPiA+IC0t
LSBhL3hlbi90b29scy9rY29uZmlnLy5naXRpZ25vcmUKPiA+ICsrKyBiL3hlbi90b29scy9rY29u
ZmlnLy5naXRpZ25vcmUKPiA+IEBAIC0xLDEyICsxLDggQEAKPiA+ICAjCj4gPiAgIyBHZW5lcmF0
ZWQgZmlsZXMKPiA+ICAjCj4gPiAtY29uZmlnKgo+ID4gLSoubGV4LmMKPiA+IC0qLnRhYi5jCj4g
PiAtKi50YWIuaAo+ID4gLXpjb25mLmhhc2guYwo+ID4gICoubW9jCj4gPiArKmNvbmYtY2ZnCj4g
Cj4gaGVyZT8KCldlbGwsIGl0J3MgbW9yZSBsaWtlIHRoZXkgbW92ZSBmcm9tIGxpbnV4LmdpdC9z
Y3JpcHRzL2tjb25maWcvLmdpdGlnbm9yZQp0byBsaW51eC5naXQvLmdpdGlnbm9yZQoKVGhhbmtz
LAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
