Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2941155BD
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:49:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGlF-0004YV-4C; Fri, 06 Dec 2019 16:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7dmx=Z4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1idGlD-0004YP-Pp
 for xen-devel@lists.xen.org; Fri, 06 Dec 2019 16:47:19 +0000
X-Inumbo-ID: 105f71ab-1848-11ea-8397-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 105f71ab-1848-11ea-8397-12813bfff9fa;
 Fri, 06 Dec 2019 16:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575650838;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject;
 bh=4rQ6nIfxE4qHBcADjRLxe30fsSqUuePnQTCRuF1f4RI=;
 b=AWD4cz5T9vNxvxJi/N0/83K0eMtnPl2ec8k7/2XPtLLXnGwd6JGee0Ft
 B3c6TLxYX5Ky71Zcg6zA8TPXNBSZdwLrV+dh8XrNcXEzid0jOlCs2jhn/
 Qf1YWZbbNC2OXNZ4gG1hJx+3qKhF8OkgAe6d2/d384IJVXobiU8qRWkJ1 g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +d5XbyaS+W3K9H9P53zOX5awaN1uvlg2aZuPuFUQLlBgt0qWF/hDITm2j67PufcLWHd6m1xd4N
 pY+1LBtp8PuuZcYR71v7ew3jvYQ9AJr7tt3qU46pZHIC0OI+KNy7t/rEsqEsc7Szwgd6M2pXb1
 C+F68BoISSVPIDAzDVjRn5utLl/ZZVKRR47VYBfeC8XvwFlB+v9dB+6CzwvqFPklD++VCjEuQF
 uj3er6b8nXlY9kupyhw3DaCJpp3FCD8Tp2DbyiW07s9v0JDXzWjW4MHN9DIesYf2WhcmtwcfcJ
 hPw=
X-SBRS: 2.7
X-MesageID: 9732943
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9732943"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24042.34323.159917.173963@mariner.uk.xensource.com>
Date: Fri, 6 Dec 2019 16:47:15 +0000
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] Problem booting Debian buster on arndale
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
Cc: xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkuICBBcyB5b3Uga25vdyBJIGFtIHdvcmtpbmcgb24gZ2V0dGluZyBvc3N0ZXN0IHRvIHdvcmsg
d2l0aCBEZWJpYW4KYnVzdGVyLiAgVGhpcyBpcyBpbXBvcnRhbnQgYmVjYXVzZSBEZWJpYW4ncyBz
dXBwb3J0IGZvciBvbGRzdGFibGUKKHdoaWNoIGlzIHdoYXQgc3RyZXRjaCBpcyBub3cpIGlzIG5v
dCBhbHdheXMgdmVyeSBnb29kLiAgUmVseWluZyBvbgp0aGUgTFRTIGNhdXNlZCB1cyBzZXJpb3Vz
IHByb2JsZW1zIGJlZm9yZS4KCk9uZSBvZiB0aGUgaXNzdWVzIEkgZW5jb3VudGVyZWQgaXMgdGhh
dCB0aGUgWGVuIGFuZCBMaW51eCB0aGF0IG9zc3Rlc3QKYnVpbHQsIGRpZCBub3QgYm9vdCBvbiBh
cm5kYWxlOgogIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cy8xNDQzMTIvdGVzdC1hcm1oZi1hcm1oZi14bC1hcm5kYWxlL2luZm8uaHRtbAoKSXQgd29ya3Mg
b24gY3ViaWV0cnVjazoKICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0
ZXN0L2xvZ3MvMTQ0MzEyL3Rlc3QtYXJtaGYtYXJtaGYteGwtY3ViaWV0cnVjay9pbmZvLmh0bWwK
KFBsZWFzZSBkaXNyZWdhcmQgdGhlIGd1ZXN0LXN0YXJ0IGZhaWx1cmU7IEkgdGhpbmsgdGhhdCdz
IHNvbWV0aGluZwplbHNlLCBhbmQgYXJjaGl0ZWN0dXJlLWluZGVwZW5kZW50LikKCkl0IHNlZW1z
IHRvIGhhdmUgaHVuZyBkdXJpbmcgYm9vdC4gIE5CIHRoYXQgSSBkb24ndCBrbm93IHdoZXRoZXIg
dGhpcwppcyBhIG9uZS1vZmYuCgpJIHdvdWxkIGFwcHJlY2lhdGUgaXQgaWYgc29tZW9uZSBmcm9t
IHRoZSBBUk0gY29tbXVuaXR5IGNvdWxkIHRha2UgYQpsb29rLiAgSWYgeW91IHdvdWxkIGxpa2Ug
bWUgdG8gc2V0IHVwIGEgcmVwcm8gSSBvbiBvbmUgb2Ygb3VyIGFybmRhbGVzCmNhbiBkbyB0aGF0
IGZvciB5b3UuICBJIGhhdmVuJ3QgZG9uZSB0aGF0IHlldCBiZWNhdXNlIGl0IGJvb2tzIHRoZQpt
YWNoaW5lIG91dCBzbyBJIHdhbnQgdG8gZG8gaXQgd2hlbiB5b3Ugc2F5IHlvdSdyZSByZWFkIGZv
ciBpdC4uLgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
