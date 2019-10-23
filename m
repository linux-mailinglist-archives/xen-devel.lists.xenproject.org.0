Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFACE1E12
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:26:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHXp-0000F3-Vy; Wed, 23 Oct 2019 14:23:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNHXo-0000Es-5W
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:23:24 +0000
X-Inumbo-ID: a8d045ce-f5a0-11e9-947f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8d045ce-f5a0-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571840599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nbRShBHHXdrhVdyGM1y3vQId7EFFwOOSAvwpfO8mSn4=;
 b=gRDKWvWWnp3P5+SNEfEhNZ3p2gsOqz1Yyfk6mSmJc4G6iYoejoRqUVfm
 W+PG0PPC3bYeOVHxNQMbiQCefMs4dUjInd5rfpeTjSdvIKf2wT4ZMInme
 WXVf1aufSzjqm6jNoUuCRtN0fJ6PgtbIJmH6sXft0yJk2w2C/WHZ57nn6 U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gQN0zBgwMi+9WSAU7vrTbRzqYu5RyE/4ykC0lSiMrSZ9uYR5eSRTutzAZZpxB4nJOaWrJvwRvq
 nMEaElj3n5H+ul3JokorFIaeXircz1B/17BJ3EzPioueDuITV7bKmKbplGRhSEBW/bYepVkM6k
 jNobbicztqC2/0JiFkXWxQIItCtqQqE9arguRHS2VFExR2wf92ScaVk7yrAqRuWOPhhw3D5SX4
 igouHw9guNtlLjJIOrVPEd0g0Yl6WCUMB7+svhAo0b5mPYirZbm3fqKMXtfaXj+6RFdgjSpmO0
 l9k=
X-SBRS: 2.7
X-MesageID: 7630561
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7630561"
Date: Wed, 23 Oct 2019 15:22:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191023142258.GK1138@perard.uk.xensource.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
 <20191023130013.32382-11-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023130013.32382-11-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v7 10/11] libxl/xl: Overhaul
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDI6MDA6MTJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gTElCWExfUEFTU1RIUk9VR0hfVU5LTk9XTiAoYWthICJFTkFCTEVEIiBpbiBhbiBlYXJs
aWVyIHVuY29tbWl0dGVkCj4gdmVyc2lvbiBvZiB0aGlzIGNvZGUpIGlzIGRvaW5nIGRvdWJsZSBk
dXR5LiAgV2UgYWN0dWFsbHkgbmVlZCBhbGwgb2YKPiB0aGUgZm9sbG93aW5nIHRvIGJlIHNwZWNp
ZmlhYmxlOgo+ICAgKiAiZGVmYXVsdCI6IGVuYWJsZSBQVCBpZmYgd2UgaGF2ZSBkZXZpY2VzIHRv
Cj4gICAgIHBhc3MgdGhyb3VnaCBzcGVjaWZpZWQgaW4gdGhlIGluaXRpYWwgY29uZmlnIGZpbGUu
Cj4gICAqICJlbmFibGVkIiAoYW5kIGZhaWwgaWYgdGhlIHBsYXRmb3JtIGRvZXNuJ3Qgc3VwcG9y
dCBpdCkuCj4gICAqICJkaXNhYmxlZCIgKGFuZCByZWplY3QgZnV0dXJlIFBUIGhvdHBsdWcpLgo+
ICAgKiAic2hhcmVfcHQiLyJzeW5jX3B0IjogZW5hYmxlIFBUIGFuZCBzZXQgYSBzcGVjaWZpYyBQ
VCBtb2RlLgo+IAo+IERlZmF1bHRpbmcgYW5kIGVycm9yIGNoZWNraW5nIHNob3VsZCBiZSBkb25l
IGluIGxpYnhsLiAgU28sIHdlIG1ha2UKPiBzZXZlcmFsIGNoYW5nZXMgaGVyZS4KPiAKPiBXZSBp
bnRyb2R1Y2UgImVuYWJsZWQiLCBhbmQgcmVuYW1lICJ1bmtub3duIiB0byAiZGVmYXVsdCIuCj4g
Cj4gV2UgbW92ZSBhbGwgb2YgdGhlIGVycm9yIGNoZWNraW5nIGFuZCBkZWZhdWx0aW5nIGNvZGUg
ZnJvbSB4bCBpbnRvCj4gbGlieGwuICBOb3csIGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1
bHQgaGFzIGFsbCBvZiB0aGUgbmVjZXNzYXJ5Cj4gaW5mb3JtYXRpb24gdG8gZ2V0IHRoaXMgcmln
aHQuICBTbyB3ZSBjYW4gZG8gaXQgYWxsIHRoZXJlLiAgQ2hvb3NpbmcKPiB0aGUgc3BlY2lmaWMg
bW9kZSBpcyBhcmNoLXNwZWNpZmljLgo+IAo+IFdlIGNhbiBhbHNvIGFycmFuZ2UgdG8gaGF2ZSBv
bmx5IG9uZSBwbGFjZSBlYWNoIHdoaWNoIGNhbGN1bGF0ZXMKPiAoaSkgd2hldGhlciBwYXNzdGhy
b3VnaCBuZWVkcyB0byBiZSBlbmFibGVkIGJlY2F1c2UgcHQgZGV2aWNlcyB3ZXJlCj4gc3BlY2lm
aWVkIChpaSkgd2hldGhlciBwdF9zaGFyZSBjYW4gYmUgdXNlZCAoZm9yIGVhY2ggYXJjaCkuCj4g
Cj4geGwgbm93IG9ubHkgaGFzIHRvIHBhcnNlIHRoZSBlbnVtIGluIHRoZSBzYW1lIHdheSBhcyBp
dCBwYXJzZXMgYWxsCj4gb3RoZXIgZW51bXMuCj4gCj4gVGhpcyBjaGFuZ2UgZml4ZXMgYSByZWdy
ZXNzaW9uIGZyb20gZWFybGllciA0LjEzLXByZTogdW50aWwgcmVjZW50Cj4gY2hhbmdlcywgcGFz
c3Rocm91Z2ggd2FzIG9ubHkgZW5hYmxlZCBieSBkZWZhdWx0IGlmIHBhc3N0aHJvdWdoCj4gZGV2
aWNlcyB3ZXJlIHNwZWNpZmllZC4gIFdlIHJlc3RvcmUgdGhpcyBiZWhhdmlvdXIuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpBY2tl
ZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3Ms
CgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
