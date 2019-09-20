Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F5B8EE7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 13:22:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBGvO-000663-MJ; Fri, 20 Sep 2019 11:18:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Fkx=XP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iBGvM-00065i-RG
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 11:18:04 +0000
X-Inumbo-ID: 50091b04-db98-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50091b04-db98-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 11:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568978285;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=hfLytwMp42UjklD4QCXgPAWHD/lu/Ag1j1xhPTlr/+I=;
 b=Sx8UVBSfO0DA1fvIvyhvqWL+3LOJqe2EsMajJGIqOSL71I5JlF6kG5kq
 dUMDiZOPRSz8PUz2Ic25yiRJ2RATzGGWDDm9LL9O1DI6cT1n95DcxfcPH
 YzidEzVBE3/Kp/OOt0umqRoT2z4BuWwZBQegVswe4iUvAtzwej/Q7KWmg 0=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QxmcoNIgtV5JM5WUWCPkQAPGLn/O7g3a4oPYsHoAIGI+z0Lken9F8B1h5lAgGV2qisgnW6Hz+i
 02MHBCh6/srZN3B0yrrBrplnaOvRplFD17kikv5nibHwXNyMS4FUGiul/Dd709OXacmxmtyaip
 dRCfvjVo11NXNWqWva51ACcYczLYND1r3D3dZ6JqVjhfb8L5VEpwvZ+N37xJA1tW9hS5oDaZYH
 +UKIB1osi5czNjDIY9c82a4brWAYRcqy3ej7wSjdcUhSzYzZsg0ao+ao+OxpDBQYNBbmNt7J5x
 ZtI=
X-SBRS: 2.7
X-MesageID: 5900798
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,528,1559534400"; 
   d="scan'208";a="5900798"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23940.46440.603005.963709@mariner.uk.xensource.com>
Date: Fri, 20 Sep 2019 12:18:00 +0100
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
In-Reply-To: <23928.52965.976467.722814@mariner.uk.xensource.com>
References: <20190911060203.25202-1-jgross@suse.com>
 <23928.52965.976467.722814@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools: fix linking hypervisor includes to
 tools include directory
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

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSF0gdG9vbHM6IGZpeCBsaW5raW5nIGh5cGVy
dmlzb3IgaW5jbHVkZXMgdG8gdG9vbHMgaW5jbHVkZSBkaXJlY3RvcnkiKToKPiBKdWVyZ2VuIEdy
b3NzIHdyaXRlcyAoIltQQVRDSF0gdG9vbHM6IGZpeCBsaW5raW5nIGh5cGVydmlzb3IgaW5jbHVk
ZXMgdG8gdG9vbHMgaW5jbHVkZSBkaXJlY3RvcnkiKToKPiA+IEFuIGluY3JlbWVudGFsIGJ1aWxk
IG9mIHRvb2xzL2luY2x1ZGUgd29uJ3QgcGlja3VwIG5ldyBoeXBlcnZpc29yCj4gPiBoZWFkZXJz
IGluIHRvb2xzL2luY2x1ZGUveGVuLiBGaXggdGhhdC4KPiAKPiBJIHBlcnNvbmFsbHkgSSB0aGlu
ayB0cnlpbmcgdG8gZ2V0IHRoaXMga2luZCBvZiB0aGluZyB0byB3b3JrIHByb3Blcmx5Cj4gd2l0
aCByZWN1cnNpdmUgbWFrZSBpcyB0b28gaGFyZCB0byBiZSB3b3J0aCB0cnlpbmcuICBCdXQgSSB3
b24ndCBzdGFuZAo+IGluIHlvdXIgd2F5Lgo+IAo+IEFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KCkFuZCBjb21taXR0ZWQuCgpJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
