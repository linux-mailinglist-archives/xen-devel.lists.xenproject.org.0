Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCA5B53AC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:09:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGwz-0003c2-Om; Tue, 17 Sep 2019 17:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGwy-0003bq-QN
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:07:36 +0000
X-Inumbo-ID: a49488c0-d96d-11e9-961c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a49488c0-d96d-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568740056;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=skMtZ2+7tirM8BPQg7NUwqaCJC2iBCI5py0RvcOYQ9I=;
 b=GgXHEpJyL0vRLYqH4PFgCVu6H6PureujrO1M8ugRVm2Cv8rOximdGZbI
 rbP8lL2Gw02VjQ92MxHyom1xLnfRzByjSudVp6CGFBgISB172jwAhU3ci
 /qSV2KhrKowo2mBLRzEppIRRRw6uk0zFL6Yfcn62FR7l3ZPDncpWQ5CsT s=;
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
IronPort-SDR: 6kdnnnNciBMwn6tsdKQ8sfcbx61H2oxDRG1yWXYVekT5neA8cf5G6gb69eN1OuNgXvydrnWX7m
 A5fxAljj4TulmGd9oK7uSfWVn2zaQ5AddQneV58opMU2beylxh6c2kMxkUm+w+7ipCAnqd+LMs
 FbXV5rYyFAkoJxVGwJ6/OkD1QbpVAWGoUbacqhYF4LoXdab8sfWOnFRGpgdOFfxYw/kgM4vp9k
 cEQvgqHzp0RSkBBaBwjZ4SU5oR3BqXChcZxkB2w3R9uCpIhOYNKU97/3hxaXp/40C1E8kVHqk9
 Cco=
X-SBRS: 2.7
X-MesageID: 5742832
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5742832"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4819.930846.392609@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:07:31 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-18-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-18-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 17/35] libxl: Add libxl__ev_qmp to
 libxl__ao_device
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDE3LzM1XSBsaWJ4bDogQWRkIGxpYnhsX19l
dl9xbXAgdG8gbGlieGxfX2FvX2RldmljZSIpOgo+IGBhb2Rldi0+cW1wJyBpcyBpbml0aWFsaXNl
ZCBpbiBsaWJ4bF9fcHJlcGFyZV9hb19kZXZpY2UoKSwgYnV0IHNpbmNlCj4gdGhlcmUgaXNuJ3Qg
YSBzaW5nbGUgZXhpdCBwYXRoIGZvciBhIGBsaWJ4bF9fYW9fZGV2aWNlJywgdXNlcnMgb2YgdGhp
cwo+IG5ldyBgcW1wJyBmaWVsZCB3aWxsIGhhdmUgdG8gZGlzcG9zZWQgb2YgaXQuCgpBY2tlZC1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpJdCBtaWdodCBiZSBu
aWNlIHRvIGFkZCBhIGNvbW1lbnQgYWJvdXQgdGhlIGZpZWxkKHMpIG9mCmxpYnhsX19hb19kZXZp
Y2Ugd2hpY2ggY2FsbGVycyBvZiBsaWJ4bF9fcHJlcGFyZV9hb19kZXZpY2UgYXJlCmV4cGVjdGVk
IHRvIGNsZWFuIHVwIHRoZW1zZWx2ZXMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
