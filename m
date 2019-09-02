Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B8A5AD0
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 17:52:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4oZy-0003o9-Aw; Mon, 02 Sep 2019 15:49:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1c4v=W5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i4oZx-0003o2-Du
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 15:49:17 +0000
X-Inumbo-ID: 365e68ce-cd99-11e9-aea4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 365e68ce-cd99-11e9-aea4-12813bfff9fa;
 Mon, 02 Sep 2019 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567439354;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rmWZsTJ0Yg7/DOiL/8rjZRXY8KLjw3wVcRTKXZVbA4g=;
 b=h+i+KqXNTtDqiyUzLk6kqMv0/ynG9y78Bif28izqy78I1/2YCze9k3oK
 lBj7ISutzcoy3h/mcNQ+v+ZWSdoUC91HfBj1Ewxb3ufSMaTIJOiflOxt0
 FeDLN+XV50gX3kgw0JoJwhHZEYOVshBuDfFi6/aPczOPMYDh831UHzrVo Q=;
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
IronPort-SDR: 2JHCnBicUDun/Tv9jSXamKWvdiFlrK7i2hpxocINNRWR4jeZUr/jNTfOAHZlkhM65QdUh5R2+w
 FzljGAfNvoUYRWHuVuTqvWNbY+wvYD63eJwxP9/6uXsvXeohzkfXRJ8GwxzFkqFH2T3KERi9IG
 WfC9V0vBxgRz9yypfbqj6opZKmvpwAIdBqkHGfsoB3jjfKcV6Rb5cmtpclK3VRnKekWjy8QIbg
 luVQlsW+hQQRCqUL3hXFGJ+Ez0X2l1ZpeThuh00Oq8W3urVxqWJ1h1pTJq7vLw3dMI1H8pi+eY
 sH0=
X-SBRS: 2.7
X-MesageID: 5244735
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,459,1559534400"; 
   d="scan'208";a="5244735"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23917.14808.737779.119459@mariner.uk.xensource.com>
Date: Mon, 2 Sep 2019 16:48:40 +0100
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <D8EFC0B6-0FFC-4288-86EC-FD0A0BB8C3BF@citrix.com-0>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <38ac71b4-53c0-9402-2c6f-118f29818f85@citrix.com>
 <FCA290D6-2ECA-4B95-B327-7D263E0E4687@gmail.com>
 <818DA1AE-CE46-4806-B806-0943B79DF725@citrix.com>
 <F76AAD6E-198A-4455-A1DE-EED974DEACA3@citrix.com>
 <23909.26956.404750.684802@mariner.uk.xensource.com>
 <D8EFC0B6-0FFC-4288-86EC-FD0A0BB8C3BF@citrix.com-0>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: George Dunlap <George.Dunlap@citrix.com>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1JGQ10gQ29kZSBvZiBDb25kdWN0
Iik6Cj4gSSBhdHRhY2hlZCBhIHJlZGxpbmUgdmVyc2lvbiBvZiBib3RoIHRoZSBvcmlnaW5hbCAo
YmFzZWQgb24gdGhlIExGIGV2ZW50cyBDb0MpIGFuZCBhIHJlZGxpbmUgdmVyc2lvbiBiYXNlZCBv
biB0aGUgY292ZW5hbnQgZ2l2ZW4gdGhlIGNvbnN0cmFpbnRzIHdlIGFncmVlZC4gQWthCj4gWzFd
IFhlbiBDb0MgQ29udHJpYnV0b3IgQ292ZW5hbnQgYmFzZWxpbmUgKHJlZGxpbmUpLnBkZiAKPiBb
Ml0gWGVuIENvQyBMRiBldmVudHMgYmFzZWxpbmUgKHJlZGxpbmUpLnBkZgo+IAo+IEkgbWluaW1p
emVkIGNoYW5nZXMgdG8gWzJdLiAKCkkgbGlrZSBib3RoIG9mIHRoZXNlLiAgSSB3b3VsZCBiZSBo
YXBweSB0byBhZG9wdCBlaXRoZXIuICBJIHByZWZlciB0aGUKQ29udHJpYnV0b3IgQ292ZW5hbnQg
YmFzZWQgdmVyc2lvbi4KCgpJIGhhdmUgdHdvIGNvbW1lbnRzLiAgVGhlIGZpcnN0IGlzIHZlcnkg
bWlub3I6CgpUaGUgTEYgRXZlbnRzIG9uZSBoYXMgb25lIGRpZmZlcmVudCBzZWN0aW9uIHRpdGxl
LiAgSW5zdGVhZCBvZgogICAgICAgIEVuZm9yY2VtZW50Cml0IGhhcwogICAgICAgIFdoYXQgVG8g
RG8gSWYgWW91IFdpdG5lc3MgT3IgQXJlIFN1YmplY3QgVG8gVW5hY2NlcHRhYmxlCiAgICAgICAg
QmVoYXZpb3IgCndoaWNoIGlzIHVud2llbGR5IGJ1dCBiZXR0ZXIgaW4gb3RoZXIgd2F5cyAtIG1v
cmUgcG9zaXRpdmUgYW5kCmNvbnN0cnVjdGl2ZS4gIEknbSBub3Qgc3VyZSBpZiB0aGVyZSBpcyBh
IGhhcHB5IG1pZGRsZSBncm91bmQuCkkgYW0gaGFwcHkgdG8gYWRvcHQgZWl0aGVyIHZlcnNpb24g
d2l0aCBlaXRoZXIgdGl0bGUuICBJIG1lbnRpb24gaXQgaW4KY2FzZSBhbnlvbmUgaGFzIGJldHRl
ciBpZGVhcyBldGMuCgoKTXkgc2Vjb25kIGNvbW1lbnQgaXMgbW9yZSBzdWJzdGFudGlhbC4gIEl0
IHNob3VsZCBub3QgYmUgcmVnYXJkZWQgYXMgYQpibG9ja2VyLCBidXQgSSB3b3VsZCBsaWtlIHRv
IHNlZSBpdCBhZGRyZXNzZWQgZWl0aGVyIG5vdyBvciBhZnRlciBDb0MKYWRvcHRpb24uCgpUaGUg
cm9vdCBpc3N1ZSBpcyB0aGUgZGlmZmljdWx0IG9uZSBvZiB3aGF0IHRvIGRvIGFib3V0IHBvc3Np
YmxlCmludm9sdmVtZW50IGluIGFidXNlIGJ5IG1lbWJlcnMgb2YgdGhlIGNvbmR1Y3RAIGFkZHJl
c3MuCgpJIHdvdWxkIGxpa2UgdG8gc2VlIHR3byBjaGFuZ2VzOiBmaXJzdGx5LCB3ZSBzaG91bGQg
cHVibGlzaCB0aGUgbGlzdApvZiBwZW9wbGUgdGhhdCB0aGUgY29uZHVjdCBhbGlhcyBnb2VzIHRv
LiAgVGhlIENvQyBzaG91bGQgY29udGFpbiBhCnJlZmVyZW5jZSB0byB0aGUgcGxhY2Ugd2hlcmUg
dGhpcyBjYW4gYmUgZm91bmQuICAiVGhlIG1lbWJlcnNoaXAgb2YKdGhlIGNvbmR1Y3RAIGFsaWFz
IGlzIHB1YmxpY2x5IGRvY3VtZW50ZWQgaW4gW2xvY2F0aW9uXSIuCgpTZWNvbmRseSwgd2Ugc2hv
dWxkIGV4cGxpY2l0bHkgcHJvdmlkZSBhIHJvdXRlIGZvciBzb21lb25lIHdobwpkaXN0cnVzdHMg
bWVtYmVyKHMpIG9mIGNvbmR1Y3RALiAgSG93IGFib3V0OgoKICBJZiB5b3UgaGF2ZSBjb25jZXJu
cyBhYm91dCBhbnkgb2YgdGhlIG1lbWJlcnMgb2YgdGhlIGNvbmR1Y3RAIGFsaWFzLAogIHlvdSBh
cmUgd2VsY29tZSB0byBjb250YWN0IHByZWNpc2VseSB0aGUgQ29uZHVjdCBUZWFtIG1lbWJlcihz
KSBvZgogIHlvdXIgY2hvaWNlLgoKVGhlIHRlYW0gc2hvdWxkIGJlIGxhcmdlIGFuZCBkaXZlcnNl
IGVub3VnaCB0aGF0IHRoaXMgaXMgYSBwcmFjdGljYWxseQp1c2VmdWwgcmVjb21tZW5kYXRpb24s
IGJ1dCBpdCBzaG91bGQgbm90IGJlIHVud2llbGR5LgoKClRoYW5rcyBmb3IgZHJpdmluZyB0aGlz
LgoKUmVnYXJkcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
