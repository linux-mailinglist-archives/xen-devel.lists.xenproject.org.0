Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EE5180540
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 18:46:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBiuW-00088D-N4; Tue, 10 Mar 2020 17:43:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GfWC=43=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jBiuV-000887-0k
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 17:43:19 +0000
X-Inumbo-ID: 9fd5fe00-62f6-11ea-ae0c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fd5fe00-62f6-11ea-ae0c-12813bfff9fa;
 Tue, 10 Mar 2020 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583862197;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3uTe9XTu3cEL33hrUba3QZJdRcYWIORVgtUxRaMtdvM=;
 b=EyRtiBq3kFzSd8SmiR5Sh6AWvw/Vy1c5JfX+cbFtCoI/+aNmePUAg8fT
 GMZtNJNGUccf/NU29aeVfZydvTzP3bECGm0ruIy0xp7nn9UG6YAdZYsfP
 aFxJs2n22MggCjGnzg/vi7QhXBpiOnM6tHtZhngfEjZqfhNHSy7Iy8+OH s=;
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
IronPort-SDR: cRYOWN1J+tb20q/xBu5toCmRv32BiLGxZP6F2QqmYi8kpXvvdh8u1elumvft9HFU6ct6dmXDoB
 uI7xTbrFLMkGHaX043ZaqafL98eu3IMFdnFjmcfT42C4RE9lerlDd9z5BV+e1F3bQbE35Q0gV9
 i4dkgZ654izlXw4zJjkVrxYo7OpG747rgXZmHFW+2T22zt7KeyLFC3eClvWqeV8x5mkmZ7YqAy
 lc2mC69PiQ5ctoy/EC8wWfQRXijJSNkcgVdNvWK7agyjstT3PZ7b2nTWwzt5iVhdVhlaJuish6
 qpY=
X-SBRS: 2.7
X-MesageID: 14057279
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,537,1574139600"; d="scan'208";a="14057279"
Date: Tue, 10 Mar 2020 17:43:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200310174313.GF2152@perard.uk.xensource.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-15-anthony.perard@citrix.com>
 <42459c8d-7912-297a-ea68-ea07e12b03c7@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42459c8d-7912-297a-ea68-ea07e12b03c7@suse.com>
Subject: Re: [Xen-devel] [XEN PATCH v3 14/23] xen/build: use new $(c_flags)
 and $(a_flags) instead of $(CFLAGS)
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Roger
 Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDM6NDI6MzZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiAtLS0g
YS94ZW4vc2NyaXB0cy9LYnVpbGQuaW5jbHVkZQo+ID4gKysrIGIveGVuL3NjcmlwdHMvS2J1aWxk
LmluY2x1ZGUKPiA+IEBAIC0xMCw3ICsxMCw3IEBAIERFUFNfSU5DTFVERSA9ICQoYWRkc3VmZml4
IC5kMiwgJChiYXNlbmFtZSAkKHdpbGRjYXJkICQoREVQUykpKSkKPiA+ICAjIGFzLWluc246IENo
ZWNrIHdoZXRoZXIgYXNzZW1ibGVyIHN1cHBvcnRzIGFuIGluc3RydWN0aW9uLgo+ID4gICMgVXNh
Z2U6IGNmbGFncy15ICs9ICQoY2FsbCBhcy1pbnNuLENDIEZMQUdTLCJpbnNuIixvcHRpb24teWVz
LG9wdGlvbi1ubykKPiA+ICBhcy1pbnNuID0gJChpZiAkKHNoZWxsIGVjaG8gJ3ZvaWQgXyh2b2lk
KSB7IGFzbSB2b2xhdGlsZSAoICQoMikgKTsgfScgXAo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgfCAkKGZpbHRlci1vdXQgLU0lICUuZCAtaW5jbHVkZSAlL2luY2x1ZGUveGVuL2NvbmZpZy5o
LCQoMSkpIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHwgJChmaWx0ZXItb3V0IC1pbmNs
dWRlICUvaW5jbHVkZS94ZW4vY29uZmlnLmgsJCgxKSkgXAo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC1jIC14IGMgLW8gL2Rldi9udWxsIC0gMj4mMSksJCg0KSwkKDMpKQo+IAo+
IEknbSBzb3JyeSwgd2hpbGUgaXQgd2FzIG1lIHRvIHN1Z2dlc3QgdGhpcyBjaGFuZ2UgLSBpcyB0
aGlzCj4gY29ycmVjdD8gVGhlIHZhcmlhYmxlIHRvIG1vZGlmeSBpcyBhIHBhcmFtZXRlciBvZiB0
aGlzIG1hY3JvLAo+IGkuZS4gdGhpbmdzIGFyZW4ndCBsaW1pdGVkIHRvIENGTEFHUyBoZXJlLiBJ
ZiB3ZSB3YW50IHRvCj4gZGlzYWxsb3cgdXNlIHdpdGggZS5nLiBjX2ZsYWdzIG9yIGFueXRoaW5n
IGRlcml2ZWQgZnJvbSBpdCwKPiB0aGVuIHdlIHNob3VsZCBmaW5kIHNvbWUgd2F5IHRvIGFjdHVh
bGx5IGVuZm9yY2UgdGhpcyAobGlrZQo+IGRyb3BwaW5nIHRoZSByZXNwZWN0aXZlIHBhcmFtZXRl
cjsgSSdtIHVuY2VydGFpbiB0aG91Z2ggd2hldGhlcgo+IHdlIHdvdWxkbid0IHJlZ3JldCB0aGlz
IGlmIHdlIGV2ZXIgZ290IHRvIHRoZSBwb2ludCB3aGVyZSB3ZQo+IHdhbnRlZCB0byB1c2UgYSBu
ZXdlciBpbnNuIGluIGEgLlMgZmlsZSkuCgpJdCBpcyBwcm9iYWJseSBiZXR0ZXIgdG8gbGVhdmUg
dGhlIG1hY3JvIGFzIGl0IGlzIGZvciBub3cuIEknbGwgZHJvcAp0aGlzIGh1bmsuCgpJIHRoaW5r
IGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSB0aGUgbWFjcm8gdXNlIGRpcmVjdGx5IENGTEFHUyAo
b3IKWEVOX0NGTEFHUyksIGJ1dCBzaW5jZSB0aGUgbWFjcm8gaXMgdXNlZCB3aXRoaW4gYXMtb3B0
aW9uLWFkZCwgd2hpY2gKbmVlZHMgdGhlIGZsYWdzIHZhcmlhYmxlIG5hbWUgYXMgcGFyYW1ldGVy
LCB3ZSBjYW4ndCByZWFsbHkgY2hhbmdlIHRoZQp3YXkgYXMtaW5zbiB3b3Jrcy4KCldlIGNvdWxk
IGNvbWUgYmFjayB0byB0aGF0IGxhdGVyLCByZW1vdmUgdGhlIHVzZSBvZiBhcy1vcHRpb24tYWRk
LCBhbmQKaGF2ZSBhcy1pbnNuIHVzZSBDRkxBR1MgKG9yIEFGTEFHUykgZGlyZWN0bHkuIFRoYXQn
cyBob3cgdGhlIG1hY3JvCmFzLWluc3RyIG9mIExpbnV4IHdvcmtzLCB0aGUgbWFjcm8gYWx3YXlz
IHVzZXMgS0JVSUxEX0FGTEFHUy4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
