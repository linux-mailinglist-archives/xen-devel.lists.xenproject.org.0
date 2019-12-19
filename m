Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0B12611F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 12:44:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihuCb-0008CG-8G; Thu, 19 Dec 2019 11:42:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4R/5=2J=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ihuCZ-0008C4-QM
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 11:42:43 +0000
X-Inumbo-ID: 867aeba6-2254-11ea-a1e1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 867aeba6-2254-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576755702;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=Cjn28Mgs1N0gowDZI20eaWndP+VyDrHbuolRXiF46ns=;
 b=fVp6vbxMk7PJfcQnlUVGBLejV51xYl8806drqzw6ktUHVoPCnvJnG/qF
 EZkVzwT6VGjZkyECPTmObytge1aZ+mC4NbHLlDe1QIE3U5YA9lAI5LKXi
 uSelc95BEBBLKXKLYFrZh4bspvenBwp89JcgTIswQ35HUI2eT/KvMuARR 0=;
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
IronPort-SDR: lwhPsAwq6agBcqqL3r1ChzKxsDpKcr126xOksr+SxrM8wNRSji1gx1a/pmp96PcrvrxB8HhbMK
 //unJAO2X6KBlDmeUhSdS9AMaTY0+BF/3kuJ8jeuWM9dkdyuQGTKg48IGQiyG9BAqfHJMrIPuI
 EofiJiIBCEGTjqxIFtxcf8DJJeEpjA9fmmfJot8gxf1n6MhzPD3Y/54/bjoKVb6SsFvT/U8KV2
 KmZu/CaWgbMMjVCiKXUw1GLXuTu6G195ELp4xaNH7dYE4h1e3C9en1c7JgR5Xy+0f84bpkmY87
 8+M=
X-SBRS: 2.7
X-MesageID: 10293272
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,331,1571716800"; d="scan'208";a="10293272"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24059.25073.789608.209860@mariner.uk.xensource.com>
Date: Thu, 19 Dec 2019 11:41:37 +0000
To: Lars Kurth <lars.kurth.xen@gmail.com>, 'Jan Beulich' <jbeulich@suse.com>, 
 Lars Kurth <lars.kurth@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel
 <xen-devel@lists.xenproject.org>, "minios-devel@lists.xenproject.org"
 <minios-devel@lists.xenproject.org>, "xen-api@lists.xenproject.org"
 <xen-api@lists.xenproject.org>, "win-pv-devel@lists.xenproject.org"
 <win-pv-devel@lists.xenproject.org>, "mirageos-devel@lists.xenproject.org"
 <mirageos-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
In-Reply-To: <24059.24742.522746.897867@mariner.uk.xensource.com>
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
 <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
 <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
 <1ed2d421-7dfe-1d92-5edc-7f11e8409ff7@suse.com>
 <3A37215A-9402-4611-B5EE-1CA4D1218F87@xenproject.org>
 <24059.24742.522746.897867@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCB2MyA1LzddIEFkZCBDb2RlIFJldmlldyBH
dWlkZSIpOgo+IExhcnMgS3VydGggd3JpdGVzICgiUmU6IFtQQVRDSCB2MyA1LzddIEFkZCBDb2Rl
IFJldmlldyBHdWlkZSIpOgo+ID4gSW4gYSBudXRzaGVsbCwgaW4gc3VjaCBhIHJldmlldyB0aGUg
cG9zc2libGUgaW50ZXJwcmV0YXRpb25zIGFyZQo+ID4gKiBJIHJldmlld2VkLCBidXQgZGlkbid0
IGZlZWwgcXVhbGlmaWVkIHRvIGRvIHRoZSByZXN0Cj4gPiAqIEkgcmV2aWV3ZWQsIGJ1dCBkaWQg
bm90IGdldCByb3VuZCB0byBnaXZlIGl0IGZ1bGwgYXR0ZW50aW9uCj4gPiAqIEkgcmV2aWV3ZWQs
IGJ1dCBiZWZvcmUgSSBtYWtlIGEgZmluYWwgZGVjaXNpb24gd2FudCB0byBsb29rIGF0IHRoZSBu
ZXh0IHZlcnNpb24KPiA+IC4uLgo+ID4gKiBJIHJldmlld2VkIGFuZCBkb24ndCBvYmplY3QgdGhl
IHJlc3QKPiA+ICogSSByZXZpZXdlZCBhbmQgYWdyZWVkIHdpdGggdGhlIHJlc3QgCj4gPiBUaGUg
bGF0dGVyIHR3byBhcmUgZXF1aXZhbGVudCB0byBBY2svUi1iCj4gPiAKPiA+IFRoYXQgaXMgcXVp
dGUgYSBsYXJnZSByYW5nZSBvZiBwb3NzaWJpbGl0aWVzIGFuZCBraW5kIG9mIGxlYXZlcyB0aGUg
YXV0aG9yIGd1ZXNzaW5nIHdoYXQgc3RhdGUgdGhlIHJldmlldyBpcyBpbgouLi4KPiBJT1c6IGlm
IHlvdSBkbyBub3QgZ2V0IGFuIEEtYiBvciBSLWIsIHRoZW4gdGhlIHBlcnNvbiB3cml0aW5nIGlz
IG5vdAo+IG5lY2Vzc2FyaWx5IG1ha2luZyBhbnkgb2YgdGhlIHN0YXRlbWVudHMgeW91IHBvc2l0
IHdoaWNoIHN0YXJ0ICJJCj4gcmV2aWV3ZWQiLgoKVGhlIG90aGVyIHBvaW50IGl0IG9jY3VycyB0
byBtZSB0byBtYWtlIGhlcmUgaXMgdGhhdCB3aGV0aGVyIHNvbWVvbmUKcmV2aWV3ZWQgc29tZXRo
aW5nIGlzIG5vdCBvZiBmb3JtYWwgaW1wb3J0YW5jZSB0byB0aGUgcHJvY2VzcywKYWx0aG91Z2gg
aXQgaXMgb2YgY291cnNlIHZlcnkgcmVsZXZhbnQgaW5mb3JtYXRpb24uCgpXaXRoIG15IG1haW50
YWluZXIgaGF0IG9uIEkgZnJlcXVlbnRseSBhcHByb3ZlIHBhdGNoZXMgd2hpY2ggSSBoYXZlCm5v
dCByZXZpZXdlZC4KCkxpa2V3aXNlIEkgc29tZXRpbWVzIHJlYWQgYW5kIGV2ZW4gcmV2aWV3IGlu
IGRldGFpbCBwYXRjaGVzIHdoZXJlIEkKaGF2ZSBubyBmb3JtYWwgYXV0aG9yaXR5LiAgTXkgY29t
bWVudHMgYXJlIHRoZW4gaW50ZW5kZWQgKGluIGEgZm9ybWFsCnNlbnNlKSBhcyBpbnB1dCB0byB0
aGUgbWFpbnRhaW5lcnMnIGRlY2lzaW9ubWFraW5nLgoKKEluIHByYWN0aWNlLCBzaW5jZSB3ZSBh
cmUgYWxsIHdvcmtpbmcgdG9nZXRoZXIgdG8gbWFrZSB0aGUgYmVzdApzb2Z0d2FyZSwgbWFpbnRh
aW5lcnMgZ2VuZXJhbGx5IGV4cGVjdCBhIHN1Ym1pdHRlciB0byBhZGRyZXNzIGlzc3VlcwpyYWlz
ZWQgYnkgYSByZXZpZXcgZnJvbSBhIG5vbi1tYWludGFpbmVyLCBhbmQgc3Ryb25nIG9iamVjdGlv
bnMgZnJvbQpub24tbWFpbnRhaW5lciBzdGFrZWhvbGRlcnMgdXN1YWxseSBsZWFkIHRvIGEgZGlz
Y3Vzc2lvbiBhYm91dCBob3cgdG8KcmVzb2x2ZSBtYXR0ZXJzLiAgVGhpcyBpcyBhbGwgY29vcGVy
YXRpb24gYW5kIGNvbW1vbiBjb3VydGVzeSBJCnRoaW5rLikKCklhbi4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
