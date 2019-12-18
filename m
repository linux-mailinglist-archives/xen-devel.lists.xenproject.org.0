Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C17124732
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 13:47:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihYfr-0000WD-45; Wed, 18 Dec 2019 12:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HzQX=2I=amazon.com=prvs=248bb817a=sjpark@srs-us1.protection.inumbo.net>)
 id 1ihYfp-0000W3-C0
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 12:43:29 +0000
X-Inumbo-ID: fd166270-2193-11ea-9069-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd166270-2193-11ea-9069-12813bfff9fa;
 Wed, 18 Dec 2019 12:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576673009; x=1608209009;
 h=from:to:cc:subject:date:message-id:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=xHFo6mvkYQfQbv/gkkkxzHborqm3JkMeR8OIVG6UBXk=;
 b=V9hZELkD5WOVyV/oRQzstMxEjcyOjOOWHu7WCESaJhz8u4m6ksUiOzMX
 BoYcNRhF/GsvH3U5tLJzaImp4YLuESxr+iluIRJ3FI4s5gelqmgqAagW1
 dGj/ct2uwC4IQcokK9ytlru8tp+k+mwkGPpPKMQ0meIVbR/ywmU8o1ebU I=;
IronPort-SDR: nHmGLueb0tT74FASDEbqGU0v4H6T3ZMOFwQejVqZ7VBgH8XZxt8zIkWugLKdBymWO4lkWAwvUt
 cLAUIMuq3n2A==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; d="scan'208";a="15616175"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 18 Dec 2019 12:43:17 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id B218EA1D18; Wed, 18 Dec 2019 12:43:16 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 12:43:16 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.90) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 12:43:10 +0000
From: SeongJae Park <sjpark@amazon.com>
To: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Date: Wed, 18 Dec 2019 13:42:44 +0100
Message-ID: <20191218124244.8840-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <af02058a-fa76-5eb5-5c2b-60555273bac2@suse.com>
X-Originating-IP: [10.43.160.90]
X-ClientProxiedBy: EX13D01UWA003.ant.amazon.com (10.43.160.107) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Subject: Re: [Xen-devel] [PATCH v12 2/5] xenbus/backend: Protect xenbus
 callback with lock
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
Cc: axboe@kernel.dk, sj38.park@gmail.com, SeongJae Park <sjpark@amazon.com>,
 konrad.wilk@oracle.com, pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxOCBEZWMgMjAxOSAxMzoyNzozNyArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cgo+IE9uIDE4LjEyLjE5IDExOjQyLCBTZW9uZ0phZSBQYXJrIHdy
b3RlOgo+ID4gRnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiA+IAo+ID4g
J3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFjayBjYW4gcmFjZSB3aXRoIGEgZHJpdmVyIGNvZGUgYXMg
dGhpcyBjYWxsYmFjawo+ID4gd2lsbCBiZSBjYWxsZWQgZnJvbSBhbnkgbWVtb3J5IHByZXNzdXJl
IGRldGVjdGVkIGNvbnRleHQuICBUbyBkZWFsIHdpdGgKPiA+IHRoZSBjYXNlLCB0aGlzIGNvbW1p
dCBhZGRzIGEgc3BpbmxvY2sgaW4gdGhlICd4ZW5idXNfZGV2aWNlJy4gIFdoZW5ldmVyCj4gPiAn
cmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGlzIGNhbGxlZCwgdGhlIGxvY2sgb2YgdGhlIGRldmlj
ZSB3aGljaCBwYXNzZWQKPiA+IHRvIHRoZSBjYWxsYmFjayBhcyBpdHMgYXJndW1lbnQgaXMgbG9j
a2VkLiAgVGh1cywgZHJpdmVycyByZWdpc3RlcmluZwo+ID4gdGhlaXIgJ3JlY2xhaW1fbWVtb3J5
JyBjYWxsYmFjayBzaG91bGQgcHJvdGVjdCB0aGUgZGF0YSB0aGF0IG1pZ2h0IHJhY2UKPiA+IHdp
dGggdGhlIGNhbGxiYWNrIHdpdGggdGhlIGxvY2sgYnkgdGhlbXNlbHZlcy4KPiAKPiBBbnkgcmVh
c29uIHlvdSBkb24ndCB0YWtlIHRoZSBsb2NrIGFyb3VuZCB0aGUgLnByb2JlKCkgYW5kIC5yZW1v
dmUoKQo+IGNhbGxzIG9mIHRoZSBiYWNrZW5kICh4ZW5idXNfZGV2X3Byb2JlKCkgYW5kIHhlbmJ1
c19kZXZfcmVtb3ZlKCkpPyBUaGlzCj4gd291bGQgZWxpbWluYXRlIHRoZSBuZWVkIHRvIGRvIHRo
YXQgaW4gZWFjaCBiYWNrZW5kIGluc3RlYWQuCgpGaXJzdCBvZiBhbGwsIEkgd291bGQgbGlrZSB0
byBrZWVwIHRoZSBjcml0aWNhbCBzZWN0aW9uIGFzIHNtYWxsIGFzIHBvc3NpYmxlLgpXaXRoIG15
IHNtYWxsIHRlc3QsIEkgY291bGQgc2VlIHNsaWdodGx5IGluY3JlYXNpbmcgbWVtb3J5IHByZXNz
dXJlIGFzIHRoZQpjcml0aWNhbCBzZWN0aW9uIGJlY29tZXMgd2lkZXIuICBBbHNvLCBzb21lIGRy
aXZlcnMgbWlnaHQgc2hhcmUgdGhlIGRhdGEgdGhlaXIKJ3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFj
ayB0b3VjaGVzIHdpdGggb3RoZXIgZnVuY3Rpb25zLiAgSSB0aGluayBvbmx5IHRoZQpkcml2ZXIg
b3duZXJzIGNhbiBrbm93IHdoYXQgZGF0YSBpcyBzaGFyZWQgYW5kIHdoYXQgaXMgdGhlIG1pbmlt
dW0gY3JpdGljYWwKc2VjdGlvbiB0byBwcm90ZWN0IGl0LgoKSWYgeW91IHRoaW5rIGRpZmZlcmVu
dGx5IG9yIEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIHBsZWFzZSBsZXQgbWUga25vdy4KCgpUaGFu
a3MsClNlb25nSmFlIFBhcmsKCj4gCj4gCj4gSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
