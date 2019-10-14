Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD5D67F3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 19:05:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3gx-0007GP-BT; Mon, 14 Oct 2019 16:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R0Yg=YH=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iK3gw-0007GK-Kr
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:59:30 +0000
X-Inumbo-ID: fc409e24-eea3-11e9-9383-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc409e24-eea3-11e9-9383-12813bfff9fa;
 Mon, 14 Oct 2019 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571072369;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i5g4kOnaafq27M+3JsCfWeLHPGZS0ytWSFsg7pCbVLI=;
 b=hBqZGluuMpFyp0vQ5t7bqEZPgSWJZ1/4XuOeJnXpxBlFQI0QWPcKiPtA
 /YBkQqVQkloRH9Rmjro9kh6ywzRe3P4g9L8wFmsaRO6cLIzsL2I1Vwuhz
 wnPavTCNtxoKq0gbzZqIs6rXUxhKtOtOV6aZasyTVYgimIA9Tqrwd3LkT 4=;
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
IronPort-SDR: nDxZGShhTFVNaNEoYk+T3wAT7UHUJQ2lLtwpccEd/mCZORTAlVKIHSMz4nKYXFmj3XXaKzoDPm
 CjQ7G/kfrQNB1/bIyBryf7SBRRnpyN2ih3X5N9wfNRGuScH1GaxdSqP9oTu7U0IGjeMELXLS8d
 GkoFPE1Fl7mynhzuqSjKzbpnXSipYw+bTuk0XJdNwxxRwtaA4br75yFB2WQktJPGuBgOkqvpZZ
 vx1R4Ut9NcP97oGmREMKnq7O+tEvGutQCKwq5dtPnLBGSQitK94FnLpJ7+EKz08Fy5qofxqZ4f
 6Ig=
X-SBRS: 2.7
X-MesageID: 6941399
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="6941399"
Date: Mon, 14 Oct 2019 17:59:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191014165926.GB1138@perard.uk.xensource.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
 <23968.44828.940652.851219@mariner.uk.xensource.com>
 <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
 <23972.40372.377662.700932@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23972.40372.377662.700932@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6MDk6MjRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUGF1bCBEdXJyYW50IHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbWEVOIFBBVENIIGZv
ci00LjEzIHYyIDkvOV0gbGlieGwveGw6IE92ZXJoYXVsIHBhc3N0aHJvdWdoIHNldHRpbmcgbG9n
aWMiKToKPiA+IE9uIEZyaSwgMTEgT2N0IDIwMTkgYXQgMTc6MzQsIElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSsO8cmdlbiBHcm/DnyB3cml0
ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA5LzldIGxpYnhsL3hs
OiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2ljIik6Cj4gPiA+ID4gT24gMTEuMTAu
MTkgMTU6MzEsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gPiA+ID4gSSBkbyBub3QgaGF2ZSBhIHN0
cm9uZyBvcGluaW9uIGFib3V0IHRoaXMuICBJIHdvdWxkIGJlIGhhcHB5IHdpdGgKPiA+ID4gPiA+
ICJhdXRvIiAob3IgImRlZmF1bHQiIG1heWJlKS4KPiA+ID4gPgo+ID4gPiA+ICJ1bnNwZWNpZmll
ZCI/Cj4gPiA+Cj4gPiA+IFRoYXQgaXMgSU1PIHRoZSBiZXN0IHN1Z2dlc3Rpb24gc28gZmFyIHNv
IEkgd2lsbCBnbyB3aXRoIHRoYXQgaW4gbXkKPiA+ID4gdjMuCj4gPiAKPiA+IFNlZW1zIG9kZCB0
byBzcGVjaWZ5IGEgcGFyYW1ldGVyIHdpdGggYSB2YWx1ZSBvZiAndW5zcGVjaWZpZWQnIDstKQo+
IAo+IEkgaGF2ZSB0cmllZCB0byBpbmZlciArMS8tMS8wIG51bWJlcnMgZnJvbSB0aGUgbWFpbCB0
aHJlYWQuICBJIGhhdmUKPiBhbHNvIGxvb2tlZCBhdCBsaWJ4bF90eXBlcy5pZGwgdG8gc2VlIGhv
dyBtYW55IHRpbWVzIHdlIGFyZSB1c2luZwo+IHdoYXQgbmFtZSB0byByZXByZXNlbnQgcm91Z2hs
eSB0aGlzIGNvbmNlcHQ6Cj4gCj4gIEJpa2VzaGVkIGNvbG91ciAgUGF1bCBKdWVyZ2VuIEdlb3Jn
ZSBJYW4gQW50aG9ueSBXZWkgI2FscmVhZHkKPiAKPiAgdW5rbm93biAgICAgICAgICAgPyAgICAg
ID8gICAgIC0xICAgICsyICAgID8gICAgID8gICAgMTcKPiAgZGVmYXVsdCAgICAgICAgICAgPyAg
ICAgID8gICAgID8gICAgICAwICAgID8gICAgID8gICAgIDIKPiAgYXV0byAgICAgICAgICAgICAg
LTEgICAgID8gICAgICsxICAgICAwICAgID8gICAgID8gICAgIDEKPiAgdW5zcGVjaWZpZWQgICAg
ICAgLTEgICAgICsxICAgID8gICAgICAwICAgID8gICAgID8gICAgIDAKPiAKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl4KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsIG1haW50YWluZXJzCgpNYXliZSAidW5r
bm93biIgaXMgbW9yZSB1c2VkIGluIHRoZSBBUEksIGJ1dCB3aGVuIEkgbG9vayBhdCB0aGUgbWFu
cGFnZQoidW5rbm93biIgdmFsdWUgYXMgbmV2ZXIgYmVlbiB1c2VkIGJlZm9yZS4gT24gdGhlIG90
aGVyIGhhbmQgImRlZmF1bHQiCmFzIGJlZW4gdXNlZCB0d2ljZSBpbiB0aGUgbWFuIHBhZ2UuIChh
bmQgb25lICJkZWZhdWx0cyIgYW5kIHR3byBvdGhlcgoiZGVmYXVsdCIgdGhhdCBJJ20gbm90IHN1
cmUgaWYgdGhleSBjYW4gYmUgaW4gdGhlIGNvbmZpZyBmaWxlLikKClNvIEkgd291bGQgc2F5ICsy
IGZvciBkZWZhdWx0IGFuZCArMSBmb3IgdW5rbm93bi4KCi0tIApBbnRob255IFBFUkFSRAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
