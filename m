Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2327AEAC5
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:44:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fT4-0003qZ-Fr; Tue, 10 Sep 2019 12:41:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dh0A=XF=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1i7fT3-0003qU-DN
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:41:57 +0000
X-Inumbo-ID: 5f8596d4-d3c8-11e9-ac1d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f8596d4-d3c8-11e9-ac1d-12813bfff9fa;
 Tue, 10 Sep 2019 12:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568119316;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=40GVtUi6KzbQKYAsmXWX5mG7DJYWcycXTODmeTFco+k=;
 b=X/JWOKKi/URFr5XqEALLHIu56JEb8uJ25/UdozdUzmYbRfWcd8yHuuCm
 DltWRM2KOPF8SpTJiWTN4fM3W55pSXzulyPvvPSOySeQ1037HGvM04jNl
 c9CHIcewt9rTMmoclS4KCB7IRSexKARSuFgF/Cp4jKk+XV0RcqxWsnCQ6 I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8KkVA6KP38XWyWhdb1/zgAVrXU9Ye2ap5RpVs8ULCPm9aKr1ewArYBOQNf83AcuG2aG68tCUg+
 q4USDKcMh3OYIesYesgxjb8PE7iG2ANeJ3u/aFNDNtuMRU3sY3nV6RstFzmPaWlsWbFzCTpVyN
 LIODdLzuGgFvczPLkx/Cjxlhm2Z40MDegiAqIZXIOipm/R9UqATzTN8FMW6P1F6TYd1FjnAvDp
 s5CAePCbwBEt1FZmgm1aktJDiIE8s5VTd5s4lONFZDzpd/fBJtlgvLn1vHKLCpw6AiQTumMnWd
 YX4=
X-SBRS: 2.7
X-MesageID: 5605504
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5605504"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23927.39410.936806.373958@mariner.uk.xensource.com>
Date: Tue, 10 Sep 2019 13:41:22 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <8ecf23b2-3fe9-069f-de17-2caa91e05d9b@citrix.com>
References: <20190910120207.10358-1-ian.jackson@eu.citrix.com>
 <20190910120207.10358-5-ian.jackson@eu.citrix.com>
 <8ecf23b2-3fe9-069f-de17-2caa91e05d9b@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v3 04/12] xen/domctl: Drop guest suffix from
 XEN_DOMCTL_CDF_hvm
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1BBVENIIHYzIDA0LzEyXSB4ZW4vZG9tY3RsOiBE
cm9wIGd1ZXN0IHN1ZmZpeCBmcm9tIFhFTl9ET01DVExfQ0RGX2h2bSIpOgo+IEkgc2hvdWxkIHBy
b2JhYmx5IGhhdmUgZmluaXNoZWQgd3JpdGluZyBteSBjb21taXQgbWVzc2FnZSBiZWZvcmUgaGFu
ZGluZwo+IHRoZSBicmFuY2ggb2ZmLgoKTm8gcHJvYmxlbS4gIElmIHlvdSBoYWQgbGVmdCBhbiBY
WFggaW4gaXQgSSB3b3VsZCBoYXZlIGtub3duIHRvIGFzawp5b3UgZm9yIHRoZSByZXN0Li4uCgo+
ICJUaGUgc3VmZml4IGlzIHJlZHVuZGFudCwgYW5kIGRyb3BwaW5nIGl0IGhlbHBzIHRvIHNpbXBs
aWZ5IHRoZSBPY2FtbC9DCj4gQUJJIGNoZWNraW5nLiIKCkkgaGF2ZSBjJnAgdGhhdCBpbnRvIG15
IGJyYW5jaCwgdGhhbmtzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
