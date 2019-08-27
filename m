Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9D59F1BF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 19:36:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2fLd-0001HX-AZ; Tue, 27 Aug 2019 17:33:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eSIj=WX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i2fLc-0001HN-9h
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 17:33:36 +0000
X-Inumbo-ID: cae02472-c8f0-11e9-ae37-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cae02472-c8f0-11e9-ae37-12813bfff9fa;
 Tue, 27 Aug 2019 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566927213;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=I2SaYIS7btgnXO7gTiQ8C6mRnmaRE4DigeGv1LDOjN8=;
 b=Rto5c82Js7+x3Xv3GhkUPcuq/SOMSoqRVtIeBZNGeIa/wxZaay8i4Iph
 7Wcpbb9T+PXYbGm3B9U+d3n6ICSfHYLXdAOlNoBMcCOGkEe6292OPEZOf
 Xdu5EuIlCv6aPE5rSHkinZcU3C7I/9Ey2VSpBDOuLLdxsWEkm3j5DeVSj U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: k6FLsASAERaPXi9E+lXvTTrdAzPxqx5xF1HsUM0I6B1lutTWPTDlu8rVoCbEFgPc2eT05XGhwv
 Hb7+VijuKgl3ayqUY2wNqlcwYAKjvBzJX73Jn4tfn3AMzT+LdQ6LzjTgFz3lL52qpkJjC5kU0V
 PLmATQ36LB8xDX1XEnSL5BwqsHuBNtwMTJrdwoJMAiqIgHehIPhZBW7g3m96eSvfd330EFwFv0
 kwxcZzFS/Rp9lT/jP4XMvvbBza5VzSQToeF9XVkeWUdyf53W2/TL6SSh8SxWtfUfSXxGIsMoxp
 0fQ=
X-SBRS: 2.7
X-MesageID: 4967511
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,438,1559534400"; 
   d="scan'208";a="4967511"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23909.26956.404750.684802@mariner.uk.xensource.com>
Date: Tue, 27 Aug 2019 18:33:00 +0100
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <F76AAD6E-198A-4455-A1DE-EED974DEACA3@citrix.com>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com>
 <6785899F-48FE-4977-81D1-3AA700241857@gmail.com>
 <38ac71b4-53c0-9402-2c6f-118f29818f85@citrix.com>
 <FCA290D6-2ECA-4B95-B327-7D263E0E4687@gmail.com>
 <818DA1AE-CE46-4806-B806-0943B79DF725@citrix.com>
 <F76AAD6E-198A-4455-A1DE-EED974DEACA3@citrix.com>
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
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1JGQ10gQ29kZSBvZiBDb25kdWN0
Iik6Cj4gSSBkaWQgcmFpc2UgdGhlIGlzc3VlIG9mIGEgY3Jvc3MtcHJvamVjdCBzdXBwb3J0IG5l
dHdvcmssIHdoaWNoIGhhcyBub3QgeWV0IGJlZW4gb24gdGhlIGFnZW5kYS4gSSB3aWxsIGJlIGhv
b2tlZCBpbnRvIHRoaXMgcHJvY2Vzcy4KPiBNeSBndXQgZmVlbGluZyBpcyB0aGF0IHdlIGFyZSBs
b29raW5nIGF0IDYtOSBtb250aHMgYmVmb3JlIGFsbCBvZiB0aGlzIGlzIHJlc29sdmVkLiBNYXli
ZSBsb25nZXIuCgpJIHRoaW5rIHRoaXMgaXMgdG9vIGxvbmcuICBXZSBhcmUgb3ZlcmR1ZSB3aXRo
IHRoaXMuCgo+IFVsdGltYXRlbHksIHdlIGhhdmUgMyBvcHRpb25zOgo+IAo+ICAgMS4gIFdlIHdh
aXQgZm9yIHRoZSBMRiBhbmQgcmV2aXNpdCB0aGVuCj4gICAyLiAgV2UgZ28gb3VyIG93biB3YXkg
cmUgY3VzdG9taXphdGlvbgo+ICAgMy4gIFdlIGRyYWZ0IG91ciBvd24gY3VzdG9taXphdGlvbnMg
YW5kIGJyaW5nIGl0IHVwIGluIG9uZSBvZiB0aGUgTEYgbWVldGluZ3MgZGlzY3Vzc2luZyB0aGlz
Cj4gCj4gTXkgZ3V0IGZlZWxpbmcgaXMgdG8gZ28gZm9yIGMpIGFuZCBJIGFtIHdpbGxpbmcgdG8g
aGF2ZSBhIHRyeSBhdCBjdXN0b21pemluZyB0aGUgQ29udHJpYnV0b3IgQ292ZW5hbnQgYWxvbmcg
dGhlIGxpbmVzIG9mIHRoZSBwcmV2aW91cyBleGVyY2lzZQoKSSBhbSBoYXBweSB3aXRoIDIgb3Ig
MywgYnV0IHdlIHNob3VsZG4ndCBibG9jayBvbiBMRiBhcHByb3ZhbC4gIEhhdmluZwppbnB1dCBp
cyBnb29kLiAgSWYgbGF0ZXIgd2Ugd2FudCB0byBqb2luIHNvbWUgY3Jvc3MtY29tbXVuaXR5IG5l
dHdvcmsKYW5kIHdhbnQgdG8gdXBkYXRlIGl0IGZvciB0aGF0LCB3ZSBjYW4gZG8gdGhhdC4gIFVw
ZGF0aW5nIGEgZG9jdW1lbnQKZm9yIHNvbWV0aGluZyBsaWtlIHRoYXQgaXMgcXVpdGUgZWFzeS4g
IElNTyB3ZSBuZWVkIHRvIGdldCBvbiB3aXRoIHRoZQpyZWFsbHkgaGFyZCB3b3JrIHdoaWNoIGlz
IGFkb3B0aW5nIGEgZG9jdW1lbnQgYXQgYWxsLgoKSSBsb29rIGZvcndhcmQgdG8geW91ciBDb250
cmlidXRvciBDb3ZlbmFudCBiYXNlZCBkcmFmdC4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
