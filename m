Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E7A188C8A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 18:51:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEGKu-0008MB-Rl; Tue, 17 Mar 2020 17:49:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+aMz=5C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jEGKt-0008M6-7m
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 17:49:03 +0000
X-Inumbo-ID: 95defc54-6877-11ea-b9a0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95defc54-6877-11ea-b9a0-12813bfff9fa;
 Tue, 17 Mar 2020 17:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584467342;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=O/aEKbE8CUoo8l2bt0zqqM4ZKe3hMJ6V2vQs16Vzxe4=;
 b=fCrv3cHV5kNDWKZgSelhjO5apU2KAxD3kvMyWkqDy/DWq2RahxSdETo8
 C+z7l+LiFvRfsys4Ijif+HF7l75Kf8rK4PBfSOTbMTRNrGbDDL31dcFK4
 Tgc+gtkUjfreKLkyAgIiKedkvITTvAlflCEiZkmR8ffaZIjKlX+GhI23f 8=;
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
IronPort-SDR: eKJTQmwhPit79TiQMDDKzURBvtYozZhJph9jg31sZNiZ6MimzK7zDku6kdl4rjfPHsOD6tki3J
 wShwYxPyNrv1LmvwSbtmOr0GcoG7X7vY1jkx3vQ4FjHs/xSyNnCnyHuL6SBTuStmvgkcgWajX0
 87z2u5mki+k6/SGestNQIK7wpbRMS14zqb2cOydC06lxQAYqHAPMYgqoC2g03pf7UgOtSTzrtf
 0O0yKnQ5+K9nZn4cp7Bpf0C0+wZa+RklRTVUCtDQrydZ44wJQzs8pLcmODd+JQ0GkUmQfD+b19
 voQ=
X-SBRS: 2.7
X-MesageID: 14334783
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,565,1574139600"; d="scan'208";a="14334783"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24177.3458.37966.108055@mariner.uk.xensource.com>
Date: Tue, 17 Mar 2020 17:48:50 +0000
To: "paul@xen.org" <paul@xen.org>
In-Reply-To: <001801d5fc7d$8d742b90$a85c82b0$@xen.org>
References: <20200305121417.16583-1-pdurrant@amzn.com>
 <20200305121417.16583-3-pdurrant@amzn.com>
 <24176.65527.664041.750403@mariner.uk.xensource.com>
 <001801d5fc7d$8d742b90$a85c82b0$@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 2/2] libxl: make creation of xenstore
 'suspend event channel' node optional...
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
Cc: 'Stefano
 Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Paul Durrant' <paul@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, 'Jan
 Beulich' <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIlJFOiBbUEFUQ0ggdjIgMi8yXSBsaWJ4bDogbWFrZSBjcmVh
dGlvbiBvZiB4ZW5zdG9yZSAnc3VzcGVuZCBldmVudCBjaGFubmVsJyBub2RlIG9wdGlvbmFsLi4u
Iik6Cj4gU28sIG5hbWluZy13aXNlLi4uICd4ZW5kX2NvbXBhdCcsIG9yIGlzIHRoYXQgdG9vIHZh
Z3VlPwo+ID4gICAtIHRoZSB+L2RldmljZSB3cml0ZWFiaWxpdHkgaXMgY29udHJvbGxlZCBieSB0
aGUgc2FtZSBjb21wYXQgZmxhZywKPiA+ICAgICAgd2l0aCBjb3JyZXNwb25kaW5nIHVwZGF0ZSB0
byB0aGUgZG9jcyBmb3IgdGhlIGNvbXBhdCBmbGFnCj4gPiAgIC0gYWRkaW5nIGFuIGVudHJ5IGZv
ciB0aGUgdG9wLWxldmVsIH4vZGV2aWNlIHRvCj4gPiAgICAgIHhlbnN0b3JlLXBhdGhzLnBhbmRv
Ywo+ID4gCj4gPiBCdXQgSSBhbSBvcGVuIHRvIG90aGVyIGFwcHJvYWNoZXMuCj4gCj4gVGhhdCBh
bGwgc291bmRzIGZpbmUuCgpXZSBoYWQgdGhpcyBjb252ZXJzYXRpb24gb24gSVJDOgoKMTc6MDEg
ICogRGl6aWV0IHJlYWRzLgoxNzowMiA8RGl6aWV0PiBJIHRoaW5rICJ4ZW5kX2NvbXBhdCIgaXMg
YSBiaXQgb2YgYSB2YWd1ZSBuYW1lLCB5ZXMuICAKICAgICAgICAgICAgICAgInhlbmRfc3VzcGVu
ZF9ldnRjaG5fY29tcGF0IiBtYXliZSA/CjE3OjAzIDxEaXppZXQ+IHhhZGltZ25pazogV291bGQg
aXQgYmUgcG9zc2libGUgdG8gcHV0IGludG8gdGhlIHhsLmNmZyg1KSBkb2MgCiAgICAgICAgICAg
ICAgIGJpdCBmb3IgdGhpcyBzb21ldGhpbmcgYWJvdXQgKndoaWNoKiBwdiBkcml2ZXJzIGFyZSBs
aWtlbHkgdG8gYmUgCiAgICAgICAgICAgICAgIGFmZmVjdGVkID8gIEkgdGhpbmsgdGhhdCB3b3Vs
ZCBoZWxwIHVzZXJzIChhdCB0aGUgdmVyeSBsZWFzdCwgaXQgCiAgICAgICAgICAgICAgIHdvdWxk
IGhlbHAgdGhlbSBkaXNtaXNzIGl0IGlmIGl0IHdhc24ndCByZWxldmFudCB0byB0aGVtKS4KMTc6
MjMgPHhhZGltZ25paz4gRGl6aWV0OiBzdXJlLCBJIGNhbiBhZGQgc29tZSB0ZXh0IGFuZCB0aGUg
bmFtZSBpcyBvawoxNzozMSA8RGl6aWV0PiBUaGFua3MuCjE3OjMxIDxEaXppZXQ+IFNoYWxsIEkg
YyZwIHRoaXMgaW50byBhbiBlbWFpbCBvciB3aWxsIHlvdSBkbyB0aGF0ID8KMTc6MzUgPHhhZGlt
Z25paz4gRGl6aWV0OiBpdCdkIGJlIGhlbHBmdWwgaWYgeW91IGRpZCBpdCwgdGhhbmtzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
