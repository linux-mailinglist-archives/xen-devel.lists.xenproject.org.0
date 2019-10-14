Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B8CD67B7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 18:51:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK3WL-0005zc-9o; Mon, 14 Oct 2019 16:48:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fu8Z=YH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iK3WK-0005zS-73
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 16:48:32 +0000
X-Inumbo-ID: 73de7d54-eea2-11e9-9383-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73de7d54-eea2-11e9-9383-12813bfff9fa;
 Mon, 14 Oct 2019 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571071711;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=U6hMphnQNrEsZXMQzMdDOcHQsw19C9wURvi6SqfWAVo=;
 b=gWRha736Ru0FR24t6MA7QRXTQpu5ENBTNYdHW5IDdpAWF1yl8jYkH/ZO
 +wiDhyblT2jNfXRyuhXe0GomSOHPtMUp5b94tX7Bn0yqfXQQSZR21rX6g
 +xUmMKGb1PkAczp4m0G4t+iebEj21FvxAW0WP45Vt+xehNgOP9xDtE/8i g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w5lGIhFyqPofrywEy1YOo30hItGWAVrA/JucfZq5CJyN6bbBsO4iSBy0ddiJdhh9P+F/2XEAfe
 2aXk5Y3GBAsxQr6sHGueguoKUpCQyy/9TzrEVdvQFwE8xXzIYLU7/1bM19AXpq02PJpOd05NsN
 UDIzFV0u2ckqi3zKRwIme8GgtWd6WZuRH6VEwopmgygfN9fmbJZRhGopPqxA9/gZL79oawa2LO
 kmEx4g6V1OUo3WC1zNhG2pc84KreioEZmjgW9Ek0HQ6K60UGXBV/o9iAGzu2k27YKe3XwiaMDk
 Ni0=
X-SBRS: 2.7
X-MesageID: 6940970
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,296,1566878400"; 
   d="scan'208";a="6940970"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23972.42710.205681.915082@mariner.uk.xensource.com>
Date: Mon, 14 Oct 2019 17:48:22 +0100
To: Wei Liu <wl@xen.org>
In-Reply-To: <20191014164429.ltk64qeoo2ckzwet@debian>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
 <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
 <23968.44828.940652.851219@mariner.uk.xensource.com>
 <CACCGGhAqS+hQybfin6v7durB0jn-gX6oMYyr050-8_=uf0wQ1A@mail.gmail.com>
 <23972.40372.377662.700932@mariner.uk.xensource.com>
 <20191014164429.ltk64qeoo2ckzwet@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA5
LzldIGxpYnhsL3hsOiBPdmVyaGF1bCBwYXNzdGhyb3VnaCBzZXR0aW5nIGxvZ2ljIik6Cj4gT24g
TW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6MDk6MjRQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiAgQmlrZXNoZWQgY29sb3VyICBQYXVsIEp1ZXJnZW4gR2VvcmdlIElhbiBBbnRob255IFdl
aSAjYWxyZWFkeQo+ID4gCj4gPiAgdW5rbm93biAgICAgICAgICAgPyAgICAgID8gICAgIC0xICAg
ICsyICAgID8gICAgID8gICAgMTcKPiA+ICBkZWZhdWx0ICAgICAgICAgICA/ICAgICAgPyAgICAg
PyAgICAgIDAgICAgPyAgICAgPyAgICAgMgo+ID4gIGF1dG8gICAgICAgICAgICAgIC0xICAgICA/
ICAgICArMSAgICAgMCAgICA/ICAgICA/ICAgICAxCj4gPiAgdW5zcGVjaWZpZWQgICAgICAgLTEg
ICAgICsxICAgID8gICAgICAwICAgID8gICAgID8gICAgIDAKPiA+IAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsIG1haW50YWluZXJzCj4gCj4gKzEgdG8g
InVua25vd24iLiBJIHByZWZlciBjb25zaXN0ZW5jeS4KPiAKPiAwIHRvIGFsbCBvdGhlcnMuCgpU
aGFua3MuCgo+ID4gT24gdGhpcyBiYXNpcyBJTU8gY2xlYXJseSB0aGlzIHNob3VsZCBnbyBiYWNr
IHRvICJ1bmtub3duIi4KPiA+IEkgd2lsbCBkbyB0aGF0IGluIGEgcmVzcGluIChvciBtYXliZSBv
biBjb21taXQpIGJ1dCByaWdodCBub3cgSSB0aGluawo+ID4gSSBhbSBzdGlsbCBhd2FpdGluZyBh
IHJldmlldyBmb3IgdGhpcyBwYXRjaC4KPiAKPiBJIHRoaW5rIGEgcmVzcGluIGlzIHJlcXVpcmVk
IC0tIGluIG9uZSBvZiB0aGUgbWFpbHMgeW91ciBzYWlkIHlvdSB3b3VsZAo+IG5lZWQgdG8gcHV0
IHNvbWUgbG9naWMgaW50byBhcmNoLXNwZWNpZmljIGZ1bmN0aW9uLgoKWWVzLiAgQWxyZWFkeSBk
b25lLgoKVGhpcyBpcyBjb25mdXNpbmcgYmVjYXVzZSB3ZSBhcmUgaW4gdGhlIHRocmVhZCByZSB2
Miwgd2hpY2ggaXMgd2hlcmUKdGhpcyBiaWtlc2hlZCBjb252ZXJzYXRpb24gaXMgaGFwcGVuaW5n
LgoKQnV0IHRoZXJlIGlzIGFsc28gYSB2Mywgc2VlOgoKICBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1hFTiBQQVRDSCBmb3ItNC4xMyB2MyAxMC8xMF0gbGlieGwveGw6IE92ZXJoYXVsCiAgICAg
ICAgICAgcGFzc3Rocm91Z2ggc2V0dGluZyBsb2dpYwoKVGhhdCdzIGJlZW4gUi1CIEFudGhvbnkg
YnV0IEkgaGF2ZSBub3cgY2hhbmdlZCAidW5zcGVjaWZpZWQiIGJhY2sgdG8KInVua25vd24iLi4u
CgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
