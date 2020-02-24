Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E216AD42
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:25:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6HQe-0001S4-BB; Mon, 24 Feb 2020 17:22:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6HQc-0001Rz-PQ
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:21:58 +0000
X-Inumbo-ID: 28a0bf1e-572a-11ea-9225-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28a0bf1e-572a-11ea-9225-12813bfff9fa;
 Mon, 24 Feb 2020 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582564917;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=aJg4D3I+RzNFAeDPELCYtkD4MfrCq6bkXAyxUEWpMhY=;
 b=VYCfw5DjqwGSAwDtsQklv5x65a5FUhMvFULW4kIM177kB84/LBYV//al
 on0VhzM90xvDsNSajoGjrO5idyXka0EPr/3LOt/CxYmiULLs9YflTxwTg
 er1lYpXbYl4FDEURf0YvMvGjUQLydVk9fWRxzqJRRqlMEzTfWXs8cW6se M=;
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
IronPort-SDR: oZsWflm+1wJiBlPMf7M5Ym424MrxO5v3OA/VfmgevmHywK8q4n4MkZjxnSA5HIi+dCST5Dux+Y
 Tjwf7Gj3BXvLM+b24DRcyEgSFdvuQdH+ZMbZPjhTb6PotN8sM3HzlGDbaYvudODldNoQMRjWoS
 2JuED9a4ywePTRCaVenoaSnh+BsGAtS+hRQufbMa7lH8a0aaBw4VVeLiIHws3TXcvFgJfB7fqk
 EoucwYiDBKgwmSS/VubxOEZLGhqPgjy4SUdRLqmVzmQFQnAOXs/v1wa47wpW8TK1yGm7UFzSwP
 Z6Q=
X-SBRS: 2.7
X-MesageID: 13547935
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13547935"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24148.1586.34742.63466@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 17:21:54 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200127143444.25538-3-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 02/17] tools/libxl: Simplify callback
 handling in libxl-save-helper
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIgMDIvMTddIHRvb2xzL2xpYnhsOiBTaW1w
bGlmeSBjYWxsYmFjayBoYW5kbGluZyBpbiBsaWJ4bC1zYXZlLWhlbHBlciIpOgo+IFRoZSB7c2F2
ZSxyZXN0b3JlfV9jYWxsYmFjayBoZWxwZXJzIGNhbiBoYXZlIHRoZWlyIHNjb3BlIHJlZHVjZWQg
dmFzdGx5LCBhbmQKPiBoZWxwZXJfc2V0Y2FsbGJhY2tzX3tzYXZlLHJlc3RvcmV9KCkgZG9lc24n
dCBuZWVkIHRvIHVzZSBhIHRlcm5hcnkgb3BlcmF0b3IgdG8KPiB3cml0ZSAwIChtZWFuaW5nIE5V
TEwpIGludG8gYW4gYWxyZWFkeSB6ZXJvZWQgc3RydWN0dXJlLgo+IAo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
