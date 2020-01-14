Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A8713B007
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:52:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPOy-0006Qq-AK; Tue, 14 Jan 2020 16:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPOx-0006Ql-IT
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:50:47 +0000
X-Inumbo-ID: 00fa6034-36ee-11ea-8406-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00fa6034-36ee-11ea-8406-12813bfff9fa;
 Tue, 14 Jan 2020 16:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579020643;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=WY8SYdNSB9Zd//ViolMs7H3fu/eTSehabuqJ9iU5NsU=;
 b=MXJ2SFVlkLK9qTZtpUQ3VDGzim+8+/wYeGUrsHVj4GvbC1+vQlRBIaMy
 2XwPloQe16Yc/FBNIU5f5xIMZ7ptuUMFXbVBOOlJSKpVVFSwkIGrRp7ul
 AnAwP5bq5lZS16rz9TTnn5AtgUj6vp0qtat9wOTHgicBdyWoWCN13q9nw 8=;
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
IronPort-SDR: Svo2mHMIQXlHuropfqEnDHrKhf6rwxoYhwTRH8ACwSDnZwekXhmElP4xDstmpEMuw2iey5gQIB
 XniWGtkutAdAK2SD5hZ3wbxfiBynciXYiRuvEK933bV2eexgPxXAU1/jDqjOf+5yZbufLxvoOk
 /VPNH1UqDDY2oVk6M4kKHks839Yr11pGDE5E/x5EnPpvK7RdPN4cEwB1jtQy+j5g7cglDbUOAI
 /GmQkubTYpJnXsBcErwQ7LdZN5WYT1ISkYFmZ7YpDWFY2n+Fe+RnYeNUq7gjrIUEVU3GYKlfRV
 5WY=
X-SBRS: 2.7
X-MesageID: 11489850
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="11489850"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.61792.422429.481790@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:50:40 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-3-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH 02/12] libxc/restore: Introduce functionality to
 simplify blob handling
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDIvMTJdIGxpYnhjL3Jlc3RvcmU6IEludHJv
ZHVjZSBmdW5jdGlvbmFsaXR5IHRvIHNpbXBsaWZ5IGJsb2IgaGFuZGxpbmciKToKPiBEdXJpbmcg
bWlncmF0aW9uLCB3ZSBidWZmZXIgc2V2ZXJhbCBibG9icyBvZiBkYXRhIHdoaWNoIHVsdGltYXRl
bHkgbmVlZAo+IGhhbmRpbmcgYmFjayB0byBYZW4gYXQgYW4gYXBwcm9wcmlhdGUgdGltZS4KPiAK
PiBDdXJyZW50bHksIHRoaXMgaXMgYWxsIGhhbmRsZWQgaW4gYW4gYWQtaG9jIG1hbm5lciwgYnV0
IG1vcmUgYmxvYnMgYXJlIHNvb24KPiBnb2luZyB0byBiZSBhZGRlZC4gIEludHJvZHVjZSB4Y19z
cl9ibG9iIHRvIGVuY2Fwc3VsYXRlIGEgcHRyL3NpemUgcGFpciwgYW5kCj4gdXBkYXRlX2Jsb2Io
KSB0byBoYW5kbGUgdGhlIG1lbW9yeSBtYW5hZ2VtZW50IGFzcGVjdHMuCj4gCj4gU3dpdGNoIHRo
ZSBIVk1fQ09OVEVYVCBhbmQgdGhlIGZvdXIgUFZfVkNQVV8qIGJsb2JzIG92ZXIgdG8gdGhpcyBu
ZXcKPiBpbmZyYXN0cnVjdHVyZS4KCkkgbGlrZSB0aGUgbmV3IGFwcHJvYWNoLgoKSSB3YXMgZXhw
ZWN0aW5nIHRvIHNlZSAibm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
Ii4KCklmIHlvdSB0aGluayB0aGF0IGlzIHRydWUsIGFuZCB3aXRoIHRoYXQgYWRkZWQsCkFja2Vk
LWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCklhbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
