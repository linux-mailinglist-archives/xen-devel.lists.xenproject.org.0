Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD1E3705
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 17:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNfKy-0007r0-7M; Thu, 24 Oct 2019 15:47:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zclB=YR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNfKw-0007qv-K9
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 15:47:42 +0000
X-Inumbo-ID: 9c434ee8-f675-11e9-94a8-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c434ee8-f675-11e9-94a8-12813bfff9fa;
 Thu, 24 Oct 2019 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571932060;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject;
 bh=eC3bZN/TSJQNBA0uJyX9tK7yIrWRgBqF5fn3tIczGKg=;
 b=QHojbqhXzWsxdaHER1nTrGoBsMeTDmWLnkF4++8CzCy30jYTpUD0F2rs
 1RkebsiXmVCknnLoYxJyextzPGVwE/b1sk7JrlWc9bgShh++l44Rujs0K
 3QXkDiQuXFPfyxrApqUBZz4ZEMVWPc8aBfbUvIbzlip8LXtvint0QLSEI c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zzJOwdTJJ80HBfV3DHmCQywQClff3ealB54uCSeDdE5QzonJvW4I+rZT35bmZxNV2nJaKHDwal
 K2x5QpjaT+IZzXFoGFtmeuhNSrdiR8IkBGKftOjXLy/UkO6IMjahOWirwNaV278/Vg5LxgGnRI
 LhdsNQcPi4OhMrJ+kHZIYg+OJUlEwYvKC2dYNRr63eWHXCEBoC2df3SjVlFc50PHKMgee0qGr8
 vmV0QEo6a0opX4mrpnjbcXc/5u4rqGjuI3yt/Liy9rsc2d29zqXxz7jGqw+yspwcRzAo16KxCZ
 qks=
X-SBRS: 2.7
X-MesageID: 7836972
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,225,1569297600"; 
   d="scan'208";a="7836972"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23985.51097.655432.655379@mariner.uk.xensource.com>
Date: Thu, 24 Oct 2019 16:47:37 +0100
To: Julien Grall <julien.grall@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] rochester and Debian buster
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgZGlzY3Vzc2VkIG9uIGlyYyB0aGUgcHJvYmxlbXMgSSBoYXZlIGJlZW4gaGF2aW5nIHRyeWlu
ZyB0byBnZXQKYnVzdGVyJ3MgcmVsZWFzZWQga2VybmVsIHRvIHJ1biBvbiB0aGUgcm9jaGVzdGVy
cywgd2hpY2ggaXMgd2FudGVkIHRvCnVwZ3JhZGUgb3NzdGVzdCB0byBidXN0ZXIgKHdoaWNoIGlz
IGN1cnJlbnRseSBEZWJpYW4gc3RhYmxlKS4KClVuZm9ydHVuYXRlbHkgb3VyIHByZXZpb3VzIGNv
bnZlcnNhdGlvbnMgZG9uJ3Qgc2VlbSB0byBoYXZlIGJlZW4KcmVjb3JkZWQgYW55d2hlcmUuICBM
ZXQncyB0cnkgYXQgbGVhc3QgdG8gd3JpdGUgdGhpbmdzIGRvd24gbm93LgoKVGhlIHN5bXB0b20g
aXMgdGhhdCB0aGUgbWFjaGluZSB0aGlua3MgdGhlIG5ldHdvcmsgbGluayBpcyBkb3duLCBhbmQK
bm8gbmV0d29yayBzdHVmZiBoYXBwZW5zLCBzbyB0aGUgaW5zdGFsbGVyIGRvZXNuJ3Qgd29yay4g
IChJIGRvbid0CnRoaW5rIEkgaGF2ZSBjaGVja2VkIGF0IHRoZSBzd2l0Y2ggZW5kIHdoZXRoZXIg
dGhlIGxpbmsgaXMgYWN0dWFsbHkKdXAuKQoKWW91IHN1Z2dlc3RlZCB0aGF0IG1heWJlIGFkZGlu
ZwogIGlvbW11LnBhc3N0aHJvdWdoPTEKdG8gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUgbWlnaHQg
aGVscC4gIEJ1dCBpdCBoYXNuJ3QuCgpJIGhhdmUgYSBtZW1vcnkgb2YgZGlzY3Vzc2luZyB0aGUg
bmV4dCBzdGVwcyBhbmQgSSB0aGluayB3ZSBkaXNjdXNzZWQKdXBncmFkaW5nIHRoZSBmaXJtd2Fy
ZS4gIElmIEkgcmVtZW1iZXIgcmlnaHRseSB3ZSBhZ3JlZWQgKHdpdGgKSnVlcmdlbikgdGhhdCB1
cGdyYWRpbmcgdGhlIGZpcm13YXJlIG9uIG9uZSBvZiB0aGUgdHdvIHJvY2hlc3RlcgptYWNoaW5l
cyB3b3VsZCBiZSBhbiBhY2NlcHRhYmxlIHJpc2suICBDYW4gd2UgZmlsZSBhIHRpY2tldCB0byBo
YXZlCnRoYXQgZG9uZSBieSBvdXIgb25zaXRlIHRlY2huaWNpYW4gPwoKT3RoZXIgb3B0aW9ucyB3
b3VsZCBpbmNsdWRlIHRyeWluZyBhIGJ1c3Rlci1iYWNrcG9ydHMga2VybmVsLCBpZiB3ZQpoYWQg
c29tZSByZWFzb24gdG8gdGhpbmsgdGhhdCBhIG5ld2VyIGtlcm5lbCB3b3VsZCBiZSBiZXR0ZXIu
CkNlcnRhaW5seSBpZiB0aGlzIHR1cm5zIG91dCB0byBiZSBhIGtlcm5lbCBidWcsIGFuZCBhIHdv
cmthcm91bmQgaXMKYXdrd2FyZCwgdGhlIGJlc3QgZml4IHdvdWxkIGJlIHRvIGdldCB0aGUgYnVn
Zml4IGJhY2twb3J0ZWQgdG8gdGhlCkRlYmlhbiBidXN0ZXIga2VybmVsIChlaXRoZXIgdGhlIHN0
YWJsZSBzZXJpZXMsIG9yIC1iYWNrcG9ydHMpLgoKQ3VycmVudGx5IEkgaGF2ZSByb2NoZXN0ZXIx
IGJvb2tlZCBvdXQgYW5kIHlvdSBhcmUgZnJlZSB0byBwbGF5IHdpdGgKaXQgaWYgeW91IGxpa2Uu
ICBXZSdsbCBuZWdvdGlhdGUgYWJvdXQgdGhhdCBvbiBpcmMuCgpJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
