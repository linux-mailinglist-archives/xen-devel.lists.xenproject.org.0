Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AADAD79B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7HS8-000760-94; Mon, 09 Sep 2019 11:03:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KiN8=XE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7HS6-00075l-F7
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:03:22 +0000
X-Inumbo-ID: 6eef60fa-d2f1-11e9-ac0a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6eef60fa-d2f1-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568027000;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=I+AV+DsW4X39ixrs+TwfKblGWBai+4cA57/aO7S3Fy4=;
 b=L+1Vy99f8dClxu2ENrtpa5hvzol0BPsK0YhmFAdKSHPlhTYf5Iyi/+ZB
 TBomMqM6bMd72Uiq90diCxhz4Qx5azyOB+M7SuZ6L3PYVYlWNzf6cAYV+
 aWS0moadnb/OaAZaIw7BUD3knRRUgF3LWwktq/y8yDSRfOB/3TXx9ugAQ 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 71zUcc4mXMxpZvoDF1QVvQSbfeWBUSwzBfJZh8G/ghdCpCytkmW3zd4VCBmZF/CrFPfUAvPDRU
 GkR26aKA20br/TYz3bq92VkzTfT1be/FWr6Gmt4U03J57YSuiI8BYtLeKrMCjzHUv4KVE3brN1
 SNWP5f7gz5k+UvolppGZP9ls8laypgiLq6bMgJDWviyRzjDV4kE8U+m1HR/xvra+PiVN8iKc5Y
 KKT+UA1iycH1YJtX9e3X5JczMoWdwKSZ//hMY+nJg7mA1IGNVCWdTaOlgd36VQKTb/XqTel/WL
 NkU=
X-SBRS: 2.7
X-MesageID: 5544402
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5544402"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23926.12631.330650.505179@mariner.uk.xensource.com>
Date: Mon, 9 Sep 2019 12:02:47 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <0eee7e6e-a3d9-ea86-d93b-7da6fb282ddb@citrix.com>
References: <20190722192056.15816-1-andrew.cooper3@citrix.com>
 <0eee7e6e-a3d9-ea86-d93b-7da6fb282ddb@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: todo/wishlist
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIXSBkb2NzL3NwaGlueDogdG9kby93aXNo
bGlzdCIpOgo+IEl0IGhhcyBiZWVuIHBvaW50ZWQgb3V0IHRoYXQgY2FsbGluZyB0aGlzIHRoZSB3
aXNobGlzdCBpcyBhIHBvb3IgbmFtZS7CoAo+IEEgYmV0dGVyIG5hbWUgd291bGQgYmUgdGhlIHRl
Y2huaWNhbCBkZWJ0IGxpc3QuwqAgSSB3b24ndCByZXNlbmQgZm9yIGp1c3QKPiB0aGlzLCBidXQg
cGxlYXNlIGJlYXIgaXQgaW4gbWluZCB3aGVuIGNvbnNpZGVyaW5nIHRoZSBzdWdnZXN0aW9uLgoK
SSBhcHByb3ZlIG9mIHRoZSBpZGVhIG9mIHJlY29yZGluZyB0ZWNobmljYWwgZGVidCBpbi10cmVl
LgoKQnV0LCBkbyB3ZSB3YW50IGl0IGFzIGEgY2VudHJhbGlzZWQgbGlzdCBsaWtlIHRoaXMgPyAg
SSB0aGluayB3ZQpjdXJyZW50bHkgaGF2ZSB0ZWNobmljYWwgZGVidCBtYXJrZWQgYXMgY29tbWVu
dHMgbmVhcmJ5IGluIHRoZQpyZWxldmFudCBjb2RlIG9yIGludGVyZmFjZSBkZWZpbml0aW9ucy4g
IFRoYXQgaXMgb2Z0ZW4gbW9yZSBuYXR1cmFsCndoZW4gZGV2ZWxvcGluZy4KCkhvdyBhYm91dCBp
bnN0ZWFkIG9mIHRoaXMsIHdlIGludmVudCBhIGZpeGVkIHN0cmluZyB3aGljaCB3ZSBjYW4gZ3Jl
cApmb3IsIHdoaWNoIHdlIGFyZSB0byBwdXQgbmV4dCB0byBwb29yIGFyZWFzIG9mIGludGVyZmFj
ZSBvciBjb2RlLgoKU28gaW4gdGhpcyBjYXNlIHlvdSB3b3VsZCBhZGQgYSBjb21tZW50IG5lYXIg
QGludHJvZHVjZURvbWFpbiBvcgpzb21ldGhpbmcuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
