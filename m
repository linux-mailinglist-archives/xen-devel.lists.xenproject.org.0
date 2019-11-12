Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB2F953F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 17:12:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUYkQ-0002Q8-8W; Tue, 12 Nov 2019 16:10:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WcyK=ZE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iUYkP-0002Q2-1M
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 16:10:29 +0000
X-Inumbo-ID: f1152af4-0566-11ea-a21f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1152af4-0566-11ea-a21f-12813bfff9fa;
 Tue, 12 Nov 2019 16:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573575028;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=k9hPj7GuY1NcU8nfB7b/oW6bD+8cj7PetnAX+2DaHqE=;
 b=BbpTC0Qvway3tqym6GaYPGK4e7hs9gFlaYzglqhqmt5V8O6095h9mL4a
 8KwR91ajAnPZqUDeWXH9Tegh349kjNYVtBRzoRaYymlAwnSASTjLQa1YW
 /W349wZqpAfVDzYOtoBeiNhSsn1L56laJIqR4phrhH4HnTmxoduwe7PTZ s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3RCjOHXKG12deTPwuv7jQzCNOQIwlRnDYKHjJ4mzjOAI6mLA8n92ltqc5JadanTa+B5zb42Jff
 u5nM4EqHX7/rmUB4s5eRr3ZP+1A/hUrHlpZqX2CJWRnWQSDb6LnDRNUA/NrKjVJJcJ613d8rkN
 1zUq5AoRxzq4ZbtoxjmOSVZlj9KMo186Dn0020ErKK0IZhSGk76KDWZQ/nWFcGMYYe7Lov02Mz
 DdWHlygE+iPuapht6GeSKEY+01cLHXKYY1a3eotQOCdr8wIi94cE1w4cSNnbHatVdQ2oFrLOEM
 /Mk=
X-SBRS: 2.7
X-MesageID: 8207992
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,297,1569297600"; 
   d="scan'208";a="8207992"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24010.55658.885034.429904@mariner.uk.xensource.com>
Date: Tue, 12 Nov 2019 16:10:18 +0000
To: Jim Fehlig <jfehlig@suse.com>
In-Reply-To: <ac4c8f6f-f38b-bb56-ce6d-e0b6780d0293@suse.com>
References: <20191112120913.25864-1-ian.jackson@eu.citrix.com>
 <20191112120913.25864-2-ian.jackson@eu.citrix.com>
 <ac4c8f6f-f38b-bb56-ce6d-e0b6780d0293@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] ts-libvirt-build: Do an
 out-of-tree build
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkuICBUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4KCkppbSBGZWhsaWcgd3JpdGVzICgiUmU6
IFtPU1NURVNUIFBBVENIIDIvMl0gdHMtbGlidmlydC1idWlsZDogRG8gYW4gb3V0LW9mLXRyZWUg
YnVpbGQiKToKPiBJIGFzc3VtZWQgbGlidmlydCdzIGdyYWR1YWwgbW92ZSBmcm9tIGF1dG90b29s
cyB0byBtZXNvbiB3b3VsZAo+IGFmZmVjdCBPU1NURVNULCBidXQgbGF0ZXIgcmF0aGVyIHRoYW4g
c29vbmVyLiBTb3JyeSBmb3Igbm90Cj4gbWVudGlvbmluZyBpdCBlYXJsaWVyLCBidXQgbm93IHlv
dSBoYXZlIGJlZW4gd2FybmVkIHRoYXQgbGlidmlydCBpcwo+IG1vdmluZyB0byBtZXNvbiA6LSku
IE1lc29uIGhhcyBhIHN0cmljdCBzZXBhcmF0aW9uIGJldHdlZW4gc291cmNlCj4gYW5kIGJ1aWxk
IGRpcmVjdG9yaWVzIGFuZCBzb21lIHByZXBhcmF0b3J5IHBhdGNoZXMgd2VyZSBwdXNoZWQgdGhh
dAo+IGZvcmNlIHNyY2RpciAhPSBidWlsZGRpcgo+IAo+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20v
YXJjaGl2ZXMvbGlidmlyLWxpc3QvMjAxOS1PY3RvYmVyL21zZzAxNjgxLmh0bWwKCkkgcmVhZCB0
aGlzIGFuZCBzb21lIG9mIGl0IGlzIGEgYml0IGNvbmNlcm5pbmcuICBEb2VzIGFsbCBvZiB0aGlz
CiAgc3JjOiBbc3R1ZmZdIGdlbmVyYXRlIHNvdXJjZSBmaWxlcyBpbnRvIGJ1aWxkIGRpcmVjdG9y
eQptZWFuIHRoYXQgcHJldmlvdXNseSBvbmx5IGluLXRyZWUgYnVpbGRzIHdlcmUgc3VwcG9ydGVk
IGFuZCB0aGF0CnRoZXJlZm9yZSB0aGVyZSBpcyBubyBvbmUgc2V0IG9mIGJ1aWxkIHJ1bmVzIHRo
YXQgd2lsbCB3b3JrIGJvdGgKYmVmb3JlIGFuZCBhZnRlciB0aGVzZSBjaGFuZ2VzID8KCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
