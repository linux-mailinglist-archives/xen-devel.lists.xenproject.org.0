Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9231156FF
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 19:12:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idI2m-0002tO-5O; Fri, 06 Dec 2019 18:09:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7dmx=Z4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1idI2k-0002tF-SG
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 18:09:30 +0000
X-Inumbo-ID: 8bd5b2bc-1853-11ea-a1e1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bd5b2bc-1853-11ea-a1e1-bc764e2007e4;
 Fri, 06 Dec 2019 18:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575655770;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=AUg17UMjVNNw0vKZA4BW0P3U5WgLPpO23/4FJcm9kCg=;
 b=CLyu/HL5ftqakjCJChc+kPqMO1kWbs8gU1yzkeZQwp5XSEwe5BG3WDlK
 eSITw9C7+dOdoBXZluqwjXzBwmiPGlIvaFrrqZXiDowIKlBbNlyslJQbD
 StMYoL6iGYBa+1TGJ/NtdsWuS8brFnDhNKa0s9uuL8RvgMk0zWC0c29vZ Y=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aHGcqDUtHDe8lxZ0/hzKHZujXF3ljw8iVF7uOLLLNh7X6DdTWyfS01snYI/izQzbIhqfkLgbKb
 jdKGbIgwCoCOQNs5+kprWXSOJoDxR+4EOYYDG1Pm0sgV2KM2rhYfE2jTawWTRZ/2oQdRK9gCEF
 Qds6IXegpnFj2i3OIm6w7KENWl0e8kyYhuiTxwLXaYa7TF47axp5uoRJ5kH6zjGNN3kCR0LLUx
 WvQBylde+Cr8y1MJ2zAZip+RSHoHIKn/T9LlceneKesJAooTDfqylmNYuwCyhTcWWewu1dZdQC
 MZw=
X-SBRS: 2.7
X-MesageID: 9679473
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9679473"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24042.39254.618959.578067@mariner.uk.xensource.com>
Date: Fri, 6 Dec 2019 18:09:26 +0000
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <23d38b1b-291b-4abb-07b5-66b982e758dd@suse.com>
References: <osstest-144289-mainreport@xen.org>
 <6278a67e-bd65-39d6-0322-32e8e7538457@suse.com>
 <24027.60461.969376.752788@mariner.uk.xensource.com>
 <24042.34572.522244.289318@mariner.uk.xensource.com>
 <23d38b1b-291b-4abb-07b5-66b982e758dd@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] debina hang after "random: crng init done"
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IGRlYmluYSBoYW5nIGFmdGVyICJyYW5kb206IGNybmcg
aW5pdCBkb25lIiIpOgo+IE9uIDA2LjEyLjIwMTkgMTc6NTEsIElhbiBKYWNrc29uIHdyb3RlOgo+
ID4gSSBoYXZlIGEgcmVwcm8gd2l0aCBEZWJpYW4gYnVzdGVyLCB0b28sIGhlcmU6Cj4gPiAgIGh0
dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQzMTIvdGVz
dC1hbWQ2NC1pMzg2LXhsLXJhdy9pbmZvLmh0bWwKPiAKPiBEb2VzICJyZXBybyIgbWVhbiB5b3Un
cmUgYWJsZSB0byByZWxpYWJsZSB0cmlnZ2VyIHRoaXM/IEkgYXNrCj4gYmVjYXVzZSBzbyBmYXIs
IHdpdGggYWxsIGJyYW5jaGVzIGFmZmVjdGVkIGFmYWljdCwgaXQgbG9va2VkCj4gcHJldHR5IHNw
b3JhZGljLgoKTm8sIHNvcnJ5LCBieSAicmVwcm8iIEkgbWVhbnQgIkkgaGF2ZSBhbHNvIHNlZW4g
aXQiLCB3aGljaCBpcyBub3QgdGhlCmNvcnJlY3QgdXNhZ2UuICBZb3UgYXJlIHJpZ2h0IHRoYXQg
aXQgaXMgc3BvcmFkaWMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
