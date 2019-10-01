Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F83C3B65
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 18:46:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFLG0-0007MW-BR; Tue, 01 Oct 2019 16:44:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehNT=X2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iFLFz-0007MQ-2o
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 16:44:11 +0000
X-Inumbo-ID: b0efa778-e46a-11e9-bf31-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id b0efa778-e46a-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 16:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569948250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FJYL1wO7KZUnObNC02BV5wzgzxN77uy/Z2lAxuEjriM=;
 b=WbguM8X9Q8TmoRgSxXEGq5IPJ2hSnME7L3TaT+BHwXxC++dU1BwxmE6+
 lq9sQJXurMfDWxqSnmSkuwS/dPYUo8+SNaDm2W2bDqW5W+pZ9QLnDitCa
 Wj8uvUwZzLE1oAR8DlQBIgp7YnIAW3n4490bmY7Zf5hsGscvXUmskqSJm g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VMR4vwa+DiY7R2zH5MytR9V1STi6WznOw6bgIaulomCwjyLcEN9QoPxJ9X32JVf4++iUvzlrHZ
 1OJYzW6KsNABeXcwNxeqIziZ5hcWS0kqfh/Ufv/PLn7hAdnFeeQk+SOAkZVMFS/raWj7tzzthI
 MvSlmQvxeLofoZwJe4EAewuj9HH15rvXy5BvLPcGNmUv+lxxD60+goA07q+faqlcddclCil3ZT
 f/pVyrhWCBUyJKwhp/JsRGMjp/qDpaA1oeC98RAXjHx16FKc+tmJgLu+qqzgcRhhiv3n8EN/nE
 lCs=
X-SBRS: 2.7
X-MesageID: 6677624
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6677624"
Date: Tue, 1 Oct 2019 17:44:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20191001164407.GJ1163@perard.uk.xensource.com>
References: <20191001152233.55491-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191001152233.55491-1-roger.pau@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH v2] libxl: wait for the ack when issuing
 power control requests
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMDEsIDIwMTkgYXQgMDU6MjI6MzNQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEN1cnJlbnRseSBvbmx5IHN1c3BlbmQgcG93ZXIgY29udHJvbCByZXF1ZXN0cyB3
YWl0IGZvciBhbiBhY2sgZnJvbSB0aGUKPiBkb21haW4sIHdoaWxlIHBvd2VyIG9mZiBvciByZWJv
b3QgcmVxdWVzdHMgc2ltcGx5IHdyaXRlIHRoZSBjb21tYW5kIHRvCj4geGVuc3RvcmUgYW5kIGV4
aXQuCj4gCj4gSW50cm9kdWNlIGEgMSBtaW51dGUgd2FpdCBmb3IgdGhlIGRvbWFpbiB0byBhY2tu
b3dsZWRnZSB0aGUgcmVxdWVzdCwgb3IKPiBlbHNlIHJldHVybiBhbiBlcnJvci4gVGhlIHN1c3Bl
bmQgY29kZSBpcyBzbGlnaHRseSBtb2RpZmllZCB0byB1c2UgdGhlCj4gbmV3IGluZnJhc3RydWN0
dXJlIGFkZGVkLCBidXQgc2hvdWxkbid0IGhhdmUgYW55IGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+
IEZpeCB0aGUgb2NhbWwgYmluZGluZ3MgYW5kIGFsc28gcHJvdmlkZSBhIGJhY2t3YXJkcyBjb21w
YXRpYmxlCj4gaW50ZXJmYWNlIGZvciB0aGUgcmVib290IGFuZCBwb3dlcm9mZiBsaWJ4bCBBUEkg
ZnVuY3Rpb25zLgo+IAo+IFJlcG9ydGVkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndh
bGxAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
