Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6754B12822D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 19:26:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMvf-00057g-4I; Fri, 20 Dec 2019 18:23:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ryrQ=2K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iiMvd-00057W-AV
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 18:23:09 +0000
X-Inumbo-ID: c0d4df76-2355-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0d4df76-2355-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 18:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576866180;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=3StUAUp3LmROgYRRquZ6QSDppobaPIdvu+R3jBM/mpw=;
 b=RHd0Gc9gv4IOryTmv1XaaI1Grp5xWpqHfayBzghK7i920ZxM1KaPsprd
 qbftY6s4nfpQPVg5qYz5FgPvu1/kuZkjcOYtaMgFVXL906sisTx+Nuflo
 497n08jStiNZQK9GnagDwB/i+DhX6hKVVPnC+45myIGmrkQ9V9rl+QFhr g=;
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
IronPort-SDR: RpHuk+7jRnTbS/WzdZVSjJSHLPT2ozLGMGB+dfHXqjlIReSekoluX82NFmHYcpUBzXojks3dIB
 ncRa3B2civ3xbV0s4Yf82MrNwci3XSTrh7m9Ei+3KuoqZ1SAsJQilua2Snf/zLgX3DuwWUe4PF
 exaGBr+9XCEkE0J6y+Og3h92I1lVDhLThM4ogwU/xB2DLVf24vbUU3RTIV1hFYYii6uYNNwX8G
 q20/mjaOIz7cyYx2k1uD1ah+mbGgheqAejeouDQWVOt6XrfYg/xS4lno3+RcsYHs8oK+iSt4Gk
 x+0=
X-SBRS: 2.7
X-MesageID: 10427463
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10427463"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24061.4481.246165.573848@mariner.uk.xensource.com>
Date: Fri, 20 Dec 2019 18:22:57 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191220172523.1359-1-andrew.cooper3@citrix.com>
References: <20191220172523.1359-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] docs/migration: Remove numbering for
 typical records
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0hdIGRvY3MvbWlncmF0aW9uOiBSZW1vdmUgbnVt
YmVyaW5nIGZvciB0eXBpY2FsIHJlY29yZHMiKToKPiBUaGUgbnVtYmVycyBhcmVuJ3QgcmVmZXJl
bmNlZCBkaXJlY3RseSwgYW5kIGV4cGxpY2l0IG51bWJlcmluZyBtYWtlcyBhbgo+IHVubmVjZXNz
ZXJpbHkgbGFyZ2UgZGlmZiB3aGVuIGluc2VydGluZyBzb21ldGhpbmcgbmV3IGluIHRoZSBtaWRk
bGUuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
