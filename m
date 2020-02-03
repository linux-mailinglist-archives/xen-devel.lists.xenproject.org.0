Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D9D150876
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:34:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycmT-0005Ax-K6; Mon, 03 Feb 2020 14:32:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UUio=3X=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iycmS-0005Ap-BZ
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:32:52 +0000
X-Inumbo-ID: 0e8af11a-4692-11ea-b211-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e8af11a-4692-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580740372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ezq0tqKpeXbsJPEOGzy1kHqSwudjIHXu7//Wo7HPZDk=;
 b=ep1hqLoUDjSDLhQsBYS1SCGKfcMT5wcZ1QhSr9uT6nsff9HRvDj/FQ/i
 glJ5P8z3Nb4LNPlcMJ3mgm0ciBa4AIT+IuAEY1W76GBN85lS6mbV2wtn4
 ZYzKHEdKL5B0pOXvNcJID81IH4iJ6WbAXY42e7WuJM38Evl76O5wc6uJU 8=;
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
IronPort-SDR: OCNXvxdjbi3yf0gjgCefpCRtkQ3ARIeidlrj93p1VKiBpdfdHYvzcDfEAdybwNtzR8U8ygpijT
 lMctfOkFMe2wLJ+6eNs4WtGfbAEg6dre5Ql/YIX1bPKJKn5J3rfMGg4D18jij/uBhe4eKkYYHF
 U7MFWyeQihtQ2fSpd3EI+OXMQvDFfebY9pfH+D6ToLwGpAY4pWzwLZj+RqLLw+lK49bWCKNrle
 fWTkadR8O6LER2q0DbT5/2vSEWHTHZzF7FpgSYXlZLmcsieWhRa2oprB7AiBcE0UeI487dvUNR
 N1Q=
X-SBRS: 2.7
X-MesageID: 12023124
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12023124"
Date: Mon, 3 Feb 2020 14:32:48 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200203143248.GG2306@perard.uk.xensource.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200121135916.1140483-3-anthony.perard@citrix.com>
 <85e27563-49c8-1a1e-e2c6-92642492ef21@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <85e27563-49c8-1a1e-e2c6-92642492ef21@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v2.1 15/12] squash! xen/build: have the
 root Makefile generates the CFLAGS
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
Cc: xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDI6MzI6MTNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDEuMjAyMCAxNDo1OSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiBUaGUg
WEVOX0JVSUxEX0VGSSB0ZXN0cyBpbiBhcmNoL3g4Ni9NYWtlZmlsZSB3YXMgZmlsdGVyaW5nIG91
dAo+ID4gQ0ZMQUdTLXksIGJ1dCBhY2NvcmRpbmcgdG8gZGQ0MDE3N2MxYmM4ICgieDg2LTY0L0VG
STogYWRkIENGTEFHUyB0bwo+ID4gY2hlY2sgY29tcGlsZSIpLCBpdCB3YXMgZG9uZSB0byBmaWx0
ZXIgb3V0IC1NRi4gWEVOX0NGTEFHUyBkb2Vzbid0Cj4gPiBoYXZlIHRob3NlIGZsYWdzIGFueW1v
cmUsIHNvIG5vIGZpbHRlcmluZyBpcyBuZWVkZWQuCj4gCj4gQnV0IHRoaXMgc2hvdWxkIHRoZW4g
YmUgcGFydCBvZiBwYXRjaCAxMCwgbm90IDEyLCBJIHdvdWxkIHRoaW5rLgoKU291bmQgZ29vZCwg
SSdsbCBjaGVjayBpZiB0aGF0J3MgZmluZS4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
