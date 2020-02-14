Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4F15D6A7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 12:38:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2ZGR-00024K-EN; Fri, 14 Feb 2020 11:36:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SROB=4C=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j2ZGQ-00024F-7o
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 11:36:06 +0000
X-Inumbo-ID: 2e9a03bd-4f1e-11ea-ba23-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e9a03bd-4f1e-11ea-ba23-12813bfff9fa;
 Fri, 14 Feb 2020 11:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581680164;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=qbMCbBYozTNCfjhJyeJ23SJx2Sv7RfC23lSBt6V3pPk=;
 b=FszixL8wZr6hnkZ4RHwWRPqmxlJZWx0JeHdHqYhx1rfl6b3mfGI+PTBS
 iNYatEWXB0XtMyy1THSzjhzhgHsoOOxyN1xxF15hFQDl+hV/WoITCr+sm
 gPql7xNL8+sFlBIXWir9Lg66TukeZTKCZ5fgaJwBZpiMfWNQyW81l+OTt U=;
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
IronPort-SDR: NflRwFx/RrwozGcJOV8CXnjJXBMRdaaL1y4Acbd2iM47ffb2t7cB+EL6jnCQVhD2MaHlMOUz6R
 HjWY1VuoxVxGoQ8lyGMcopgMh1DNakWJ7QUYejIIt12CRKyvZK4wcbzHawmRxBsumzZ6nxeWl8
 SrnR6Oz/u8aa7h8k7OTgCDlYrcNPJba9hwabvqP3oi9+2VfM30Z0eeH+/X0I8+PuX0rwx3aROl
 mC+HbQA6JRXmX1Y/5PK4pvQ8lmcu/DOh2CMunVC4oPoY3y7Q9WWD7OI0do2P25m+veR8aE+GWZ
 evo=
X-SBRS: 2.7
X-MesageID: 13080318
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,440,1574139600"; d="scan'208";a="13080318"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24134.34336.767226.899177@mariner.uk.xensource.com>
Date: Fri, 14 Feb 2020 11:36:00 +0000
To: Wei Liu <wl@xen.org>
In-Reply-To: <20200214110352.7me7qfslfeu2lkzi@debian>
References: <20200214103911.7995-1-wl@xen.org>
 <24134.32220.165853.192855@mariner.uk.xensource.com>
 <20200214110352.7me7qfslfeu2lkzi@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] libxl: mark parameters in stub functions as
 unused
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4bDogbWFyayBwYXJhbWV0ZXJzIGluIHN0
dWIgZnVuY3Rpb25zIGFzIHVudXNlZCIpOgo+IEkgaGF2ZSBhY3R1YWxseSBzdWNjZXNzZnVsbHkg
Y29tcGlsZWQgYSBDIGZpbGUgd3JpdHRlbiBpbiBhIHNpbWlsYXIgd2F5Cj4gYW5kIHRyaWVkIHdp
dGggLyB3aXRob3V0IC1XdW51c2VkLXBhcmVtZXRlci4gQWZ0ZXIgYWRkaW5nIHRoZSB1bnVzZWQK
PiBhdHRyaWJ1dGUgZ2NjIHN0b3BwZWQgc3BpdHRpbmcgb3V0IGEgd2FybmluZy4KClRoYXQgc291
bmRzIGxpa2UgYSBzdWZmaWNpZW50IHRlc3QgdG8gbWUuCgo+IEkgZG9uJ3QgaGF2ZSBsaWJ2aXJ0
IGx5aW5nIGFyb3VuZCB0aG91Z2guIFRoYXQncyB3aGF0IEkgZGlkbid0IHRlc3QuCj4gCj4gPiBB
Y2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gCj4gVGhh
bmtzLiBJIHdpbGwgcHVzaCBpdCBzaG9ydGx5LgoKR3JlYXQsIHRoYW5rcy4KCklhbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
