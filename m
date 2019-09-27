Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E8EC038E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:40:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDncZ-0000lb-EB; Fri, 27 Sep 2019 10:37:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fvvD=XW=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iDncX-0000lW-Ix
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:37:05 +0000
X-Inumbo-ID: bec6376f-e112-11e9-9675-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id bec6376f-e112-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 10:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569580624;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=k9yPL+lGyUFs8riJfvaRvpSycWMszEKMIOzHGvYSzVc=;
 b=FS0hIwg7gnkrEGSdk4AFkJ4pElZv1brlnLnzJx9jTII1mRWeA2xN0F6v
 +GP4qhOJ2oKHnGty+DN53BBGHH007gp3L2DppObnPxjK7dLulvTdaWbnG
 MyUx9kiV0WOpzz0K2b1kuxJLlqHsEtJxVPHN6SKMKk4CbRN7HPIie5P1g 0=;
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
IronPort-SDR: P/MvyCR+GZeYGfIEguxgdp6okzUGuz07kT1qqw90qodbfyb60OrGHx36UFlHwMOxAWM6bxJgR/
 55+AAMA6i1wwqHyFiQL+ytaPk0DFQPagfGLVjupC4zGDwPQY6Ey5DI2uu+E56F2lIU3OwfKx6c
 Fy0AIHJcubdOr+4U3BTLXlWHLcwOeoHBfysqlEqpWqSCfymNDrzJnA8IsoTJ8ai/f5+85IkSEj
 SDH6lWcsHRCIvecE8Aih6gM1CZUvQzP7i+jQ8+1oafANJ4uthYR/L25dtJ6EAuGGwlfMv9CV/r
 6cc=
X-SBRS: 2.7
X-MesageID: 6443797
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6443797"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23949.58956.637645.181431@mariner.uk.xensource.com>
Date: Fri, 27 Sep 2019 11:37:00 +0100
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20190927090048.28872-2-jgross@suse.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-2-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v1 1/6] docs: add feature document for Xen
 hypervisor sysfs-like support
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJbUEFUQ0ggdjEgMS82XSBkb2NzOiBhZGQgZmVhdHVyZSBk
b2N1bWVudCBmb3IgWGVuIGh5cGVydmlzb3Igc3lzZnMtbGlrZSBzdXBwb3J0Iik6Cj4gT24gdGhl
IDIwMTkgWGVuIGRldmVsb3BlciBzdW1taXQgdGhlcmUgd2FzIGFncmVlbWVudCB0aGF0IHRoZSBY
ZW4KPiBoeXBlcnZpc29yIHNob3VsZCBnYWluIHN1cHBvcnQgZm9yIGEgaGllcmFyY2hpY2FsIG5h
bWUtdmFsdWUgc3RvcmUKPiBzaW1pbGFyIHRvIHRoZSBMaW51eCBrZXJuZWwncyBzeXNmcy4KPiAK
PiBJbiB0aGUgYmVnaW5uaW5nIHRoZXJlIHNob3VsZCBvbmx5IGJlIGJhc2ljIHN1cHBvcnQ6IGVu
dHJpZXMgY2FuIGJlCj4gYWRkZWQgZnJvbSB0aGUgaHlwZXJ2aXNvciBpdHNlbGYgb25seSwgdGhl
cmUgaXMgYSBzaW1wbGUgaHlwZXJjYWxsCj4gaW50ZXJmYWNlIHRvIHJlYWQgdGhlIGRhdGEuCj4g
Cj4gQWRkIGEgZmVhdHVyZSBkb2N1bWVudCBmb3Igc2V0dGluZyB0aGUgYmFzZSBvZiBhIGRpc2N1
c3Npb24gcmVnYXJkaW5nCj4gdGhlIGRlc2lyZWQgZnVuY3Rpb25hbGl0eSBhbmQgdGhlIGVudHJp
ZXMgdG8gYWRkLgoKVGhhbmtzIGZvciB0aGlzIHdvcmsuICBMaWtlIG90aGVycywgSSBhcHByb3Zl
IG9mIHRoZSBiYXNpYyBpZGVhLgoKUmVhZGluZyB5b3VyIHNwZWMgZG9jdW1lbnQgaGVyZSwgSSB0
aGluayB0aGVyZSBpcyBhIGtleSBwYXJ0IG1pc3Npbmc6CnBsZWFzZSBjb3VsZCB5b3Ugc3BlY2lm
eSB0aGUgYWxsb3dhYmxlIHN5bnRheCBmb3Iga2V5cywgYW5kIGZvcgp2YWx1ZXMuCgpJIGd1ZXNz
IHRoYXQga2V5cyB3aWxsIGJlIGNob3NlbiBmcm9tIHNvbWUgbGltaXRlZCBzYWZlIGNoYXJhY3Rl
cgpzZXQgPyAgV2hhdCBhYm91dCB2YWx1ZXMgPyAgTWlnaHQgd2UgY3JlYXRlIGEga2V5IHdob3Nl
IHZhbHVlIGNvbnRhaW5zCmJpbmFyeSBkYXRhID8KCkRlcGVuZCBvbiB0aGUgYW5zd2VyIHRvIHRo
aXMgcXVlc3Rpb24sIEkgbWF5IHdhbnQgdG8gc3VnZ2VzdCBjaGFuZ2VzCm9yIGVuaGFuY2VtZW50
cyB0byB5b3VyIHByb3Bvc2VkIGNvbW1hbmQtbGluZSB0b29sLgoKQWxzbywgeW91ciB0b3AtbGV2
ZWwgZG9jdW1lbnQgaGFzIGEgbGlzdCBvZiBwYXRocyBpbiBpdCwgd2hpY2ggaXMKcHJlc3VtYWJs
eSBwcm9zcGVjdGl2ZS4gIE1heWJlIHRoYXQgaW5mb3JtYXRpb24gc2hvdWxkIGJlIGEgbm9uLXBh
cnNlZApoZWFkZXIgc2VjdGlvbiBpbiB0aGUgcGF0aHMgZG9jdW1lbnQgPwoKV291bGQgaXQgYmUg
cG9zc2libGUgdG8gYWRkIGEgc2NyaXB0IHRvIHhlbi5naXQgd2hpY2ggbGlzdHMgdGhlCnhlbmh5
cGZzIGFuZCBjaGVja3MgdGhhdCBhbGwgdGhlIHBhdGhzIGFyZSBkb2N1bWVudGVkID8gIFdlIGNv
dWxkIGFkZAphIGZldyBjYWxscyB0byB0aGF0IHRvIG9zc3Rlc3QuLi4KClRoYW5rcywKSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
