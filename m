Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4749313B0CA
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 18:25:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPt4-0001BK-CN; Tue, 14 Jan 2020 17:21:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPt2-0001BE-Lv
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 17:21:52 +0000
X-Inumbo-ID: 5598e4cc-36f2-11ea-a985-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5598e4cc-36f2-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579022504;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=BP4aD7x18GbKPONHGyQ2MFoGVGiTt/68U84taU2oJGk=;
 b=KTpC6LIJnAcJVpoKDiqve+gE38DV7GDHTOFnYrF8iYqwxq7O1S7jdXqG
 M7pvPV/BMN95QPtr85STdVcdRjeHmgFGjsEEvFGg6RsMcRpR7N3zy0Gya
 1GLvw3rmYBQeKS/54toLuUi5r7PuudwcGDns68XBMfd6Kns+kXvx8/25R c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I3EQ3MwBueKiH4a4O5UfA8V+cNCw5ze+uK+TKoEks5akcsJofw9oPenZgjmnC/WHCHTWANfSh3
 emffovKZpzGP5dwlf0PdJBil1FcbuAIy9e2ye4WKmpnXV1urvOK27MogOmTdlYwsY75GDKSGiR
 pGcNLxxhjsAjBHYoLLdQ9r0fnlNCyM0KRDZBtkfEf0RovMGy5qtr1BudhMRH48SvSCJ18jRmop
 krBTE24BKxbAJvLW+tPsWgEybHWa4M9tqfrIJ1DQc6zqQKusBrmP+kyih+/DLm/uTdWJ+U6wWZ
 4sQ=
X-SBRS: 2.7
X-MesageID: 10915572
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="10915572"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.63652.871825.587157@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 17:21:40 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-13-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-13-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 12/12] libxc/save: Write X86_{CPUID,
 MSR}_DATA records
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

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMTIvMTJdIGxpYnhjL3NhdmU6IFdyaXRlIFg4
Nl97Q1BVSUQsTVNSfV9EQVRBIHJlY29yZHMiKToKPiBXaXRoIGFsbCBvdGhlciBwbHVtYmluZyBp
biBwbGFjZSwgb2J0YWluIHRoZSBDUFUgUG9saWN5IGZyb20gWGVuIGFuZAo+IHdyaXRlIGl0IGlu
dG8gdGhlIG1pZ3JhdGlvbiBzdHJlYW0uCgpUaGlzIGxvb2tzIGdvb2QgdG8gbWUgYnV0OgoKVGhp
cyBwYXRjaCBtYXkgbmVlZCByZXZpc2lvbiB0byBoYW5kbGUgdGhlIHJlc3VsdHMgb2Ygb3VyIGRp
c2N1c3Npb24KYWJvdXQgdGhlID86IGVycm9yIGhhbmRsaW5nIGlkaW9tLgoKQW5kIEkgYW0gc3Rp
bGwgbWlzc2luZyB0aGUgdGV4dCBkaXNjdXNzaW5nIGNvbXBhdGliaWxpdHkuICBNYXliZSBJCmhh
dmUganVzdCBvdmVybG9va2VkIGl0ID8KCkFueXdheSwgaWYgaXQgd2VyZW4ndCBmb3IgdGhvc2Ug
dHdvIGlzc3VlcyBJIHdvdWxkIGhhdmUgYWNrZWQgdGhlCnBhdGNoLgoKVGhhbmtzLApJYW4uCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
