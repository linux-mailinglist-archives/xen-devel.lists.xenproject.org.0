Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4AB157F29
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 16:48:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1BGe-0004fT-Jw; Mon, 10 Feb 2020 15:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8uky=36=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j1BGd-0004fO-3C
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 15:46:35 +0000
X-Inumbo-ID: 80fe0572-4c1c-11ea-b4dd-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80fe0572-4c1c-11ea-b4dd-12813bfff9fa;
 Mon, 10 Feb 2020 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581349590;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=ypLd/emMVhwRNzYaUzKq837aSNQWbQMZpvPcJBrdTHs=;
 b=PY0ih4FWcGNyIlurGpg9cy1YDADbXn/KJSa1OAiaqQwEkGOJXFu3XLzB
 y5Kyk96nCzuQ9Dweo9dsQV+XAZUm+3WgXc3ENfzxlWC1EgrpFqr5IaMhU
 F6+WjFDQSmXAwckcD4ENUDMibs9HxSTiA2H7U2et/2UQFgWtuaXxQTc1B Y=;
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
IronPort-SDR: Bcjd4RzXVZiOwdFNRlliK7V0lZFY3kO2tZKX8EhPkWutL22urdqNTNX6a2lH2uAgWwD+X+9N+r
 zGbhHlgEJODhnZTLi+65RB/uKK7Co1u6PwZ2exTk4eWdnavNxsTOCnTFVIE9m/voJ/Oer+OQJ8
 L1A0GsqeTZP5tgAy4PrEDBEKDS4jiK5YKqLgNleJ9hvPPZ65Xfnx2LL3D+2UEfS321ig0m1suj
 l2AX1E2vhlYYrX+UzP+zonpsAQGPiYiKrYLYyj5/zgYsyw+d8kg6Ik23lJ6WVOnPs4X/ggNaRy
 Q+E=
X-SBRS: 2.7
X-MesageID: 12831518
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12831518"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24129.31442.354928.81245@mariner.uk.xensource.com>
Date: Mon, 10 Feb 2020 15:46:26 +0000
To: Julien Grall <julien@xen.org>
In-Reply-To: <9e11d2fa-cafd-ef79-aa85-c41180f525e7@xen.org>
References: <20200206164810.30168-1-pdurrant@amazon.com>
 <20200206165256.5jmpfpfcsfs2q4k7@debian>
 <9e11d2fa-cafd-ef79-aa85-c41180f525e7@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: cc community manager on
 patches to CHANGELOG.md
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIE1BSU5UQUlORVJTOiBjYyBjb21tdW5p
dHkgbWFuYWdlciBvbiBwYXRjaGVzIHRvIENIQU5HRUxPRy5tZCIpOgo+IEhpLAo+IAo+IE9uIDA2
LzAyLzIwMjAgMTY6NTIsIFdlaSBMaXUgd3JvdGU6Cj4gPiBPbiBUaHUsIEZlYiAwNiwgMjAyMCBh
dCAwNDo0ODoxMFBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPj4gVGhlIHB1cnBvc2Ug
b2YgdGhlIGNoYW5nZS1sb2cgaXMgdG8gYmUgYSBodW1hbi1yZWFkYWJsZSBsaXN0IG9mIG5vdGFi
bGUKPiA+PiBjaGFuZ2VzIGFuZCwgYXMgc3VjaCwgYWRkaXRpb25zIHRvIGl0IGFyZSBsaWtlbHkg
b2YgaW50ZXJlc3QgdG8gdGhlCj4gPj4gY29tbXVuaXR5IG1hbmFnZXIgaW4gcHJlcGFyaW5nIGJs
b2cgZW50cmllcywgcmVsZWFzZSBzdW1tYXJpZXMsIGV0Yy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiA+IAo+ID4gQWNrZWQtYnk6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+Cj4gCj4gSSB0aGluayB3ZSBtYXkgbmVlZCBhbiBhY2sgZnJvbSB3aG9ldmVyIHJl
Y2VpdmUgY29tbXVuaXR5Lm1hbmFnZXJALiAKPiBHZW9yZ2UsIElhbj8KCkFja2VkLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
