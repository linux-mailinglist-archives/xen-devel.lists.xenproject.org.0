Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC154181A99
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 14:59:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC1ru-0006lH-0j; Wed, 11 Mar 2020 13:57:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ysf6=44=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jC1rs-0006l0-WF
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 13:57:53 +0000
X-Inumbo-ID: 4c98215a-63a0-11ea-bec1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c98215a-63a0-11ea-bec1-bc764e2007e4;
 Wed, 11 Mar 2020 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583935072;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=xiKkvPDXVjtt2LgWHOeTmJnyzj2y5mmHP2IIJC4v6jw=;
 b=FhCgBVCd78lkYX1ymDRCZsWCN1UlpGOYhSjP2QPfugqq+psgLABFc7zW
 W1gJ8jo5caYkr/wUtQzj2pEGGAPhjfq2I5vTUTv3yGu9Q8nWhR+49qcOh
 QE/bdglTpO1OK7k2HieV6M8qxneII7gvI4z0tkIgBHqhFKM2Rehz17t2t 4=;
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
IronPort-SDR: zi2XFudcxLpPjQvybjKf3RkfmqoqqUZguNheOugNSdrHXL6n2OoY+/7TY8UPTwDECKEwY/p62h
 HoPyfeiGL9NF9oi9MvdLmfbHMGJxCh3rrZTj6/rTmHsDKgI5loPDt0HyU1+Jv4t3hbdItUMqMm
 6Rx+3aXGP3yci0S/9sh0rIMCBkU0G8UYNco+afCinqSRnfcL0ZulGQn5YymvfSQ02MMrUr4yCX
 YMF8UUMZXOYKyAiRTkN9hn72VbHYTiXUROietugQyWjP7dgP6IYCfDprLKaVsPcLkCd712+O6A
 gpk=
X-SBRS: 2.7
X-MesageID: 14188537
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14188537"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24168.61019.167764.525316@mariner.uk.xensource.com>
Date: Wed, 11 Mar 2020 13:57:47 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20200311135517.GA24458@Air-de-Roger.citrite.net>
References: <20200310134635.99810-1-roger.pau@citrix.com>
 <24167.46982.390819.472400@mariner.uk.xensource.com>
 <20200311135517.GA24458@Air-de-Roger.citrite.net>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH OSSTEST v2 1/2] examine: detect IOMMU
 availability and add it as a hostflag
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbUEFUQ0ggT1NTVEVTVCB2MiAxLzJdIGV4YW1p
bmU6IGRldGVjdCBJT01NVSBhdmFpbGFiaWxpdHkgYW5kIGFkZCBpdCBhcyBhIGhvc3RmbGFnIik6
Cj4gT24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDM6NTE6MzRQTSArMDAwMCwgSWFuIEphY2tzb24g
d3JvdGU6Cj4gPiBGaXJzdGx5LCBjYW4geW91IGJyZWFrIHRoaXMgbmV3IGNvZGUgb3V0IGludG8g
aXRzIG93biBwYXRjaCA/Cj4gCj4gQ2FuIGRvLCBidXQgdGhlbiB0aGVyZSB3aWxsIGJlIG5vIHVz
ZXIgb2YgdGhlIGludHJvZHVjZWQgY29kZSB3aGljaCBJCj4gdGVuZCB0byBhdm9pZC4KCkkgcHJl
ZmVyIHRoYXQgdG8gdGhlIGFsdGVybmF0aXZlIG9mIG1peGluZyBpdCB1cC4KCj4gW3Jlc3Qgc25p
cHBlZF0KCk9LLCBnb29kLgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
