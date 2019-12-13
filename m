Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F0A11E5EA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:55:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmIU-0007Nw-H8; Fri, 13 Dec 2019 14:52:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mOMl=2D=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifmIS-0007Nr-F5
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:52:00 +0000
X-Inumbo-ID: 18a79a2a-1db8-11ea-b6f1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18a79a2a-1db8-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576248711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tGoiC0bEcoC/vP5spziXHxf3+WdgQ0r0roCD+NaduRo=;
 b=OqLH6AiydUGiCpGIDLE9OE4CPdaW20OCx3bt7dsFHS6pkyd5GklIfFHD
 gv91W3cWpxLvD8ibhZIhmYDR0GuM5uy6UXnl44yc08oDDpzAj25C4hbv0
 urtWoeeRlHel7LMc8oq+L2UaW7arDvxAfbjPd9R77iwu8Cgagz1EuHiU0 c=;
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
IronPort-SDR: tOUC7IYGSu8NH/ljOBCv6tVG7NynJw7MMz8VxZm2YxUyu5PgvuxrHkr3grVeWKEXlLlRew4ezB
 VwHk/gH1pktnUXVgg3mGEwmD2gQIaduvocdXH54TLZTHHImks2kYbtBFuK7u/hoKTZKPKhZ4Sv
 HhbzgXSgnAVFXLBZEV0uc4d611RMqMysd6zSlqfUD80lyZyGx6Ku+B4g6e/8g27V7JSeF/cMhZ
 5SAW0us/3v0ocndep+6EziswJnM06YRHWYDFTDBFoVKLnWCjw7mwyi7aD88NaR06EsiZnWLtSg
 AZ0=
X-SBRS: 2.7
X-MesageID: 10004787
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10004787"
Date: Fri, 13 Dec 2019 14:51:48 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191213145148.GJ1155@perard.uk.xensource.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-2-anthony.perard@citrix.com>
 <f5ae052d-44ed-d191-48a5-28f6d4f9f337@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5ae052d-44ed-d191-48a5-28f6d4f9f337@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH 1/8] Config.mk: Remove unused setvar_dir
 macro
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgMDY6MzA6NDNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8xMi8yMDE5IDE4OjI3LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IGRp
ZmYgLS1naXQgYS9kb2NzL21pc2MvZGlzdHJvX21hcHBpbmcudHh0IGIvZG9jcy9taXNjL2Rpc3Ry
b19tYXBwaW5nLnR4dAo+ID4gaW5kZXggMmU0NjU5MjcyOGUzLi41OTliNmZkMWU5MTIgMTAwNjQ0
Cj4gPiAtLS0gYS9kb2NzL21pc2MvZGlzdHJvX21hcHBpbmcudHh0Cj4gPiArKysgYi9kb2NzL21p
c2MvZGlzdHJvX21hcHBpbmcudHh0Cj4gCj4gSXQgbG9va3MgbGlrZSB0aGlzIGlzIGVudGlyZWx5
IG9ic29sZXRlIHNpbmNlIHdlIHN3aXRjaGVkIHRvIHVzaW5nCj4gLi9jb25maWd1cmUuCj4gCj4g
TWluZCBpZiB3ZSBleHBhbmQgdGhlIHBhdGNoIHRvIGtpbGwgdGhpcyBmaWxlIGZ1bGx5P8KgIChD
YW4gYmUgc29ydGVkIG9uCj4gY29tbWl0IGlmIHlvdSB3YW50LikKCkkgdGhpbmsgaXQgd291bGQg
YmUgYmV0dGVyIHRvIHJlbW92ZSB0aGUgZmlsZSBpbiBhIHNlcGFyYXRlZCBjb21taXQsCndpdGgg
YSBwcm9wZXIgZXhwbGFuYXRpb24uIFByb2JhYmx5IGFib3V0IGhhbGYgb2YgdGhlIGZpbGUgaXMg
c3RpbGwKdHJ1ZSwgSSdtIG5vdCBzdXJlIGFib3V0IHRoZSBvdGhlciBoYWxmLiBUaGF0IGRvY3Vt
ZW50IG1pZ2h0IG5vdCBiZQpyZWxldmFudCBhbnltb3JlLCBzaW5jZSBob3BlZnVsbHkgLi9jb25m
aWd1cmUgLS1oZWxwIGlzIGVub3VnaCwgYnV0CkkgaGF2ZW4ndCBjaGVja2VkLgoKVGhhbmtzLAoK
LS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
