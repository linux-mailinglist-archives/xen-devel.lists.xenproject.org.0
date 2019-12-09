Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BAA116AF2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 11:27:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieGDR-0008K4-PE; Mon, 09 Dec 2019 10:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xl4W=Z7=amazon.com=prvs=239a0b868=sjpark@srs-us1.protection.inumbo.net>)
 id 1ieGDQ-0008Jz-CX
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 10:24:32 +0000
X-Inumbo-ID: 168293d2-1a6e-11ea-88e7-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 168293d2-1a6e-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 10:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575887072; x=1607423072;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=TFhrQ8TsGCVpfe7qixLlviznfKMBnnGyy14ZJutL01Q=;
 b=LzYyV/QZZc3sH1e7KGUGZXEsHI2keOD53LJXnCoKJSsJx8PT0TqLjlhs
 pR6kNwefBMlDDX8PTNfa6Ssld8ZRnMY4xbwdZ7waq4sVOyUrwgThSvVHG
 kI2X8R7dsUBCIyBCURi42nQt9ecL38zGlG7PzgtVYIn4jeN5lC7MBK6em c=;
IronPort-SDR: LhN+WuCUR0utaUbkSbqVuYjmhb2X6P9gEQoHKVbHuK6WeSYVaDGlSMQBcTUtdx6mHGX7twf2Sl
 tjgcW2EmOvsA==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="3990731"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 09 Dec 2019 10:24:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-4ff6265a.us-west-2.amazon.com (Postfix) with ESMTPS
 id B074CA0766; Mon,  9 Dec 2019 10:24:20 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 10:24:20 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.100) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 10:24:16 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <jgross@suse.com>
Date: Mon, 9 Dec 2019 11:23:47 +0100
Message-ID: <20191209102347.17337-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
References: <954f7beb-9d40-253e-260b-4750809bf808@suse.com>
In-Reply-To: <954f7beb-9d40-253e-260b-4750809bf808@suse.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.100]
X-ClientProxiedBy: EX13D22UWC003.ant.amazon.com (10.43.162.250) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 0/1] xen/blkback: Squeeze page pools if a
 memory pressure
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: linux-block@vger.kernel.org, sj38.park@gmail.com, pdurrant@amazon.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gICBNb24sIDkgRGVjIDIwMTkgMTA6Mzk6MDIgKzAxMDAgIEp1ZXJnZW4gPGpncm9zc0BzdXNl
LmNvbT4gd3JvdGU6Cgo+T24gMDkuMTIuMTkgMDk6NTgsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4+
IEVhY2ggYGJsa2lmYCBoYXMgYSBmcmVlIHBhZ2VzIHBvb2wgZm9yIHRoZSBncmFudCBtYXBwaW5n
LiAgVGhlIHNpemUgb2YKPj4gdGhlIHBvb2wgc3RhcnRzIGZyb20gemVybyBhbmQgYmUgaW5jcmVh
c2VkIG9uIGRlbWFuZCB3aGlsZSBwcm9jZXNzaW5nCj4+IHRoZSBJL08gcmVxdWVzdHMuICBJZiBj
dXJyZW50IEkvTyByZXF1ZXN0cyBoYW5kbGluZyBpcyBmaW5pc2hlZCBvciAxMDAKPj4gbWlsbGlz
ZWNvbmRzIGhhcyBwYXNzZWQgc2luY2UgbGFzdCBJL08gcmVxdWVzdHMgaGFuZGxpbmcsIGl0IGNo
ZWNrcyBhbmQKPj4gc2hyaW5rcyB0aGUgcG9vbCB0byBub3QgZXhjZWVkIHRoZSBzaXplIGxpbWl0
LCBgbWF4X2J1ZmZlcl9wYWdlc2AuCj4+Cj4+IFRoZXJlZm9yZSwgYGJsa2Zyb250YCBydW5uaW5n
IGd1ZXN0cyBjYW4gY2F1c2UgYSBtZW1vcnkgcHJlc3N1cmUgaW4gdGhlCj4+IGBibGtiYWNrYCBy
dW5uaW5nIGd1ZXN0IGJ5IGF0dGFjaGluZyBhIGxhcmdlIG51bWJlciBvZiBibG9jayBkZXZpY2Vz
IGFuZAo+PiBpbmR1Y2luZyBJL08uCj4KPkknbSBoYXZpbmcgcHJvYmxlbXMgdG8gdW5kZXJzdGFu
ZCBob3cgYSBndWVzdCBjYW4gYXR0YWNoIGEgbGFyZ2UgbnVtYmVyCj5vZiBibG9jayBkZXZpY2Vz
IHdpdGhvdXQgdGhvc2UgaGF2aW5nIGJlZW4gY29uZmlndXJlZCBieSB0aGUgaG9zdCBhZG1pbgo+
YmVmb3JlLgo+Cj5JZiB0aG9zZSBkZXZpY2VzIGhhdmUgYmVlbiBjb25maWd1cmVkLCBkb20wIHNo
b3VsZCBiZSByZWFkeSBmb3IgdGhhdAo+bnVtYmVyIG9mIGRldmljZXMsIGUuZy4gYnkgaGF2aW5n
IGVub3VnaCBzcGFyZSBtZW1vcnkgYXJlYSBmb3IgYmFsbG9vbmVkCj5wYWdlcy4KCkFzIG1lbnRp
b25lZCBpbiB0aGUgb3JpZ2luYWwgbWVzc2FnZSBhcyBiZWxvdywgYWRtaW5pc3RyYXRvcnMgX2Nh
bl8gYXZvaWQgdGhpcwpwcm9ibGVtLCBidXQgZmluZGluZyB0aGUgb3B0aW1hbCBjb25maWd1cmF0
aW9uIGlzIGhhcmQsIGVzcGVjaWFsbHkgaWYgdGhlCm51bWJlciBvZiB0aGUgZ3Vlc3RzIGlzIGxh
cmdlLgoKCVN5c3RlbSBhZG1pbmlzdHJhdG9ycyBjYW4gYXZvaWQgc3VjaCBwcm9ibGVtYXRpYyBz
aXR1YXRpb25zIGJ5IGxpbWl0aW5nCgl0aGUgbWF4aW11bSBudW1iZXIgb2YgZGV2aWNlcyBlYWNo
IGd1ZXN0IGNhbiBhdHRhY2guICBIb3dldmVyLCBmaW5kaW5nCgl0aGUgb3B0aW1hbCBsaW1pdCBp
cyBub3Qgc28gZWFzeS4gIEltcHJvcGVyIHNldCBvZiB0aGUgbGltaXQgY2FuCglyZXN1bHRzIGlu
IHRoZSBtZW1vcnkgcHJlc3N1cmUgb3IgYSByZXNvdXJjZSB1bmRlcnV0aWxpemF0aW9uLgoKClRo
YW5rcywKU2VvbmdKYWUgUGFyawoKPgo+U28gZWl0aGVyIEknbSBtaXNzaW5nIHNvbWV0aGluZyBo
ZXJlIG9yIHlvdXIgcmVhc29uaW5nIGZvciB0aGUgbmVlZCBvZgo+dGhlIHBhdGNoIGlzIHdyb25n
Lgo+Cj4KPkp1ZXJnZW4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
