Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEF2E320E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 14:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNc09-0005Uq-Cx; Thu, 24 Oct 2019 12:14:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zclB=YR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNc08-0005Ua-4Y
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 12:14:00 +0000
X-Inumbo-ID: bf38b5be-f657-11e9-949f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf38b5be-f657-11e9-949f-12813bfff9fa;
 Thu, 24 Oct 2019 12:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571919235;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=nLt5mTDalxuctzVOPDZgjJcZoDoJMFp4Zqz2UINMwWE=;
 b=gwuFwTYaAbsMs1t1VUeyMunPDZ2HKWG12FnohVucWsrbFeWTDd7c7qnH
 uudUs9CO0LPJGCFu7l51RhB4VeyLRmQXabpBPyQbwtr4MxTBK7kyeSD53
 xlT3UATUyxBM4hmgfMY0kru32WksVlC+Leg2YSDb3w9RjkCgdGRUCZWT1 g=;
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
IronPort-SDR: 3/Kf5kOdGjc18n5Z/OVYCzH6xajrQGSKmS8TzShUgAbpTsarecL+d6GP5JG3Hpw4h/s6/khNhP
 eTRtpSDsjbSG4V2jUDTmCEmpTftxRkUwQ+KhsylYL5E866IWyGi4nGpzRugGnw3AvyB0bHyTls
 BTWm6gbQeBtPaBkiZvbTt6YIPi7u4ykQRC8eG/nmPrNiBpvmU7enBs5QKcPoAfGKX9SPzBQKym
 HjqBjwbK4S/E6Syg026x8H0WYB4i7Qd6myb5CEbBWNE5gB7roc7f0HQfLmQk29NJiaQv3vAMAf
 IaA=
X-SBRS: 2.7
X-MesageID: 7467073
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,224,1569297600"; 
   d="scan'208";a="7467073"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23985.38270.959448.768068@mariner.uk.xensource.com>
Date: Thu, 24 Oct 2019 13:13:50 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <9dba76f6-a964-8d8e-62f0-08429a2b0725@suse.com>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
 <23985.33157.424790.599253@mariner.uk.xensource.com>
 <9dba76f6-a964-8d8e-62f0-08429a2b0725@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0ZXN0
XSAxNDMwNjE6IHJlZ3Jlc3Npb25zIC0gdHJvdWJsZTogYnJva2VuL2ZhaWwvcGFzcyIpOgo+IE9u
IDI0LjEwLjE5IDEyOjQ4LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IFRoZXJlIGlzIGEga25vd24g
YnVnIHdpdGggdHdvIG9mIG91ciBhcm02NCBib3hlcywgd2hlcmUgdGhleSBsb3NlIHNvbWUKPiA+
IG9mIHRoZSBvdXRwdXQgZHVyaW5nIGJvb3QuICBUaGlzIGlzIG5vdCBpbXBvcnRhbnQgZm9yIG9w
ZXJhdGlvbmFsIHVzZQo+ID4gb2YgdGhvc2UgYm94ZXMgaW4gYSBub3JtYWwgY29udGV4dCwgYnV0
IGluIG91ciBjb250ZXh0IGJlaW5nIGFibGUgdG8KPiA+IGdldCBhbGwgdGhlIGJvb3QgbWVzc2Fn
ZXMgaXMgaW1wb3J0YW50IGZvciBkZWJ1Z2dpbmcgaHlwZXJ2aXNvcnMgYW5kCj4gPiBrZXJuZWxz
LCBzbyBvc3N0ZXN0IGhhcyBhIHRlc3QgdGhhdCB0aGlzIHdvcmtzIHByb3Blcmx5LiAgSXQgaXMg
dGhhdAo+ID4gdGVzdCB0aGF0IGZhaWxzLgo+ID4gCj4gPiBJZiB0aGlzIGlzIHRoZSBvbmx5IGZh
aWx1cmUsIHdlIHNob3VsZCBmb3JjZSBwdXNoLgo+IAo+IEFncmVlZC4gQ2FuIHlvdSBkbyBzbywg
cGxlYXNlPwoKQnV0IGl0IGlzbid0IGluIHRoaXMgZmxpZ2h0LgoKdGVzdC1hbWQ2NC1hbWQ2NC14
bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2NC14c20KZGlkbid0IHJ1biBiZWNhdXNlIG9m
IHRoZSBwcm9ibGVtIHdpdGggaXRhbGlhMS4gIEZvcmNlIHB1c2hpbmcgd291bGQKYmUgc2F5aW5n
IHdlIGRvbid0IG1pbmQgYWJvdXQgdGhhdC4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
