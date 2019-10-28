Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420FCE7077
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 12:32:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP3Ek-0005m2-E5; Mon, 28 Oct 2019 11:31:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=datn=YV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iP3Ei-0005ls-Ok
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 11:31:00 +0000
X-Inumbo-ID: 6a03f762-f976-11e9-94f4-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a03f762-f976-11e9-94f4-12813bfff9fa;
 Mon, 28 Oct 2019 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572262260;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8YyWU6qZWxY6SGg1isCnMo6UTgHuVMQgSyA4aQ3qEXo=;
 b=gcCjbQWpBNqPleOA7rGi1lc6K2p+g28HNRvC+PHr7p37BZ3fuuM8AQH3
 wWYm6VxHtr+1lPU+AV2tQmWn8KzXFhbq7u/S7na7UKUO7JrLysRKIexAF
 WLROKTg3ErPXdBKWL+EYQiUFhM7vZOVGe2TVFa+3AV9Jd9CyLX96I2rsU s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OP5R6m3F1yNd/qLCoimGeIRbB8ohgzXyf6vCsUDlgJWeR0N5vCuFn1IU6oyPwHfr0QVmt/8fTS
 rUTLiOOCN2RprLFtzBDmciVHVgG/T4TPRF6BuxOYiVr67Ul7VlKKLsID3VmMLGY6c04t/b/KKn
 pPFGqgCohc7zcVRqMeQnE6QOU33Q4h8sihy7udeCnOCwYbxEDRvqXP/FO581T7i8g9y+TPdQEZ
 RP3RXRU/IszzmfJ0LGB2fWQzluozDyaBgVgSphDoz6VPD/zQKrbjdO46TxhgwiekDLXSecegwe
 S1I=
X-SBRS: 2.7
X-MesageID: 7496177
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,239,1569297600"; 
   d="scan'208";a="7496177"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23990.53616.152198.748116@mariner.uk.xensource.com>
Date: Mon, 28 Oct 2019 11:30:56 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191025170505.2834957-4-anthony.perard@citrix.com>
References: <20191025170505.2834957-1-anthony.perard@citrix.com>
 <20191025170505.2834957-4-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [RFC XEN PATCH for-4.13 3/4] libxl:
 libxl__ev_qmp_send now takes an egc
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1JGQyBYRU4gUEFUQ0ggZm9yLTQuMTMgMy80XSBsaWJ4
bDogbGlieGxfX2V2X3FtcF9zZW5kIG5vdyB0YWtlcyBhbiBlZ2MiKToKPiBObyBmdW5jdGlvbm5h
bCBjaGFuZ2VzLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
