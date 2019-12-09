Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1CB117617
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 20:46:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieOwV-00047e-Ng; Mon, 09 Dec 2019 19:43:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xl4W=Z7=amazon.com=prvs=239a0b868=sjpark@srs-us1.protection.inumbo.net>)
 id 1ieOwU-00047Z-9h
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 19:43:38 +0000
X-Inumbo-ID: 31c265d4-1abc-11ea-88e7-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31c265d4-1abc-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 19:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575920618; x=1607456618;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=btD2JRZhVDkxSHuvs58naEsL/hzccbUCmnMRHNEsydY=;
 b=BPe1bK9eR5pDXLan+nGUnUoTRVpbHW9Rnu974cz3PTe2lrVJTStSyaeG
 6pZ/cxKSpZZY0wkOcUS3b6jKWFGVALebEJ+sFw/aueDIUrKtYnseDo6bm
 cSp5PgOR6gACvFAcF9SzEL2rhqxo38VB+bAa8JPUqOs068gfhdSINmZse s=;
IronPort-SDR: LWb51GX+9fpQvb/S+Gumgfr5Hv6hVjPPlu5WQ4w5c4OnFTkUArSEPtKULLgbgEscFCGd9SzGr9
 QaTjsTV+T5BQ==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; 
   d="scan'208";a="7798298"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 09 Dec 2019 19:43:35 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6D939A1764; Mon,  9 Dec 2019 19:43:34 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 19:43:33 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.179) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 19:43:29 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <sjpark@amazon.com>
Date: Mon, 9 Dec 2019 20:43:03 +0100
Message-ID: <20191209194305.20828-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.43.161.179]
X-ClientProxiedBy: EX13D30UWC003.ant.amazon.com (10.43.162.122) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 0/2] xenbus/backend: Add a memory pressure
 handler callback
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3JhbnRpbmcgcGFnZXMgY29uc3VtZXMgYmFja2VuZCBzeXN0ZW0gbWVtb3J5LiAgSW4gc3lzdGVt
cyBjb25maWd1cmVkCndpdGggaW5zdWZmaWNpZW50IHNwYXJlIG1lbW9yeSBmb3IgdGhvc2UgcGFn
ZXMsIGl0IGNhbiBjYXVzZSBhIG1lbW9yeQpwcmVzc3VyZSBzaXR1YXRpb24uICBIb3dldmVyLCBm
aW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKbWVtb3J5IGlzIGNoYWxsZW5n
aW5nIGZvciBsYXJnZSBzeXN0ZW1zIGhhdmluZyBkeW5hbWljIHJlc291cmNlCnV0aWxpemF0aW9u
IHBhdHRlcm5zLiAgQWxzbywgc3VjaCBhIHN0YXRpYyBjb25maWd1cmF0aW9uIG1pZ2h0IGxhY2tz
IGEKZmxleGliaWxpdHkuCgpUbyBtaXRpZ2F0ZSBzdWNoIHByb2JsZW1zLCB0aGlzIHBhdGNoc2V0
IGFkZHMgYSBtZW1vcnkgcmVjbGFpbSBjYWxsYmFjawp0byAneGVuYnVzX2RyaXZlcicgKHBhdGNo
IDEpIGFuZCB1c2UgaXQgdG8gbWl0aWdhdGUgdGhlIHByb2JsZW0gaW4KJ3hlbi1ibGtiYWNrJyAo
cGF0Y2ggMikuCgpCYXNlIFZlcnNpb24KLS0tLS0tLS0tLS0tCgpUaGlzIHBhdGNoIGlzIGJhc2Vk
IG9uIHY1LjQuICBBIGNvbXBsZXRlIHRyZWUgaXMgYWxzbyBhdmFpbGFibGUgYXQgbXkKcHVibGlj
IGdpdCByZXBvOgpodHRwczovL2dpdGh1Yi5jb20vc2pwMzgvbGludXgvdHJlZS9ibGtiYWNrX3Nx
dWVlemluZ192NAoKClBhdGNoIEhpc3RvcnkKLS0tLS0tLS0tLS0tLQoKQ2hhbmdlcyBmcm9tIHYz
IChodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAxOTEyMDkwODU4MzkuMjEyMTUt
MS1zanBhcmtAYW1hem9uLmNvbS8pCiAtIEFkZCBnZW5lcmFsIGNhbGxiYWNrIGluIHhlbl9kcml2
ZXIgYW5kIHVzZSBpdCAoc3VnZ2VzdGVkIGJ5IEp1ZXJnZW4KICAgR3Jvc3MpCgpDaGFuZ2VzIGZy
b20gdjIgKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWJsb2NrL2FmMTk1MDMzLTIzZDUt
MzhlZC1iNzNiLWY2ZTJlM2IzNDU0MUBhbWF6b24uY29tKQogLSBSZW5hbWUgdGhlIG1vZHVsZSBw
YXJhbWV0ZXIgYW5kIHZhcmlhYmxlcyBmb3IgYnJldml0eSAoYWdncmVzc2l2ZQogICBzaHJpbmtp
bmcgLT4gc3F1ZWV6aW5nKQoKQ2hhbmdlcyBmcm9tIHYxIChodHRwczovL2xvcmUua2VybmVsLm9y
Zy94ZW4tZGV2ZWwvMjAxOTEyMDQxMTM0MTkuMjI5OC0xLXNqcGFya0BhbWF6b24uY29tLykKIC0g
QWRqdXN0IHRoZSBkZXNjcmlwdGlvbiB0byBub3QgdXNlIHRoZSB0ZXJtLCBgYXJiaXRyYXJpbHlg
IChzdWdnZXN0ZWQKICAgYnkgUGF1bCBEdXJyYW50KQogLSBTcGVjaWZ5IHRpbWUgdW5pdCBvZiB0
aGUgZHVyYXRpb24gaW4gdGhlIHBhcmFtZXRlciBkZXNjcmlwdGlvbiwKICAgKHN1Z2dlc3RlZCBi
eSBNYXhpbWlsaWFuIEhleW5lKQogLSBDaGFuZ2UgZGVmYXVsdCBhZ2dyZXNzaXZlIHNocmlua2lu
ZyBkdXJhdGlvbiBmcm9tIDFtcyB0byAxMG1zCiAtIE1lcmdlIHR3byBwYXRjaGVzIGludG8gb25l
IHNpbmdsZSBwYXRjaAoKU2VvbmdKYWUgUGFyayAoMSk6CiAgeGVuL2Jsa2JhY2s6IFNxdWVlemUg
cGFnZSBwb29scyBpZiBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZAoKIGRyaXZlcnMvYmxv
Y2sveGVuLWJsa2JhY2svYmxrYmFjay5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKU2Vv
bmdKYWUgUGFyayAoMik6CiAgeGVuYnVzL2JhY2tlbmQ6IEFkZCBtZW1vcnkgcHJlc3N1cmUgaGFu
ZGxlciBjYWxsYmFjawogIHhlbi9ibGtiYWNrOiBTcXVlZXplIHBhZ2UgcG9vbHMgaWYgYSBtZW1v
cnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQKCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2Jh
Y2suYyAgICAgICB8IDIzICsrKysrKysrKysrKysrKy0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL2NvbW1vbi5oICAgICAgICB8ICAxICsKIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVu
YnVzLmMgICAgICAgIHwgIDMgKystCiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Jh
Y2tlbmQuYyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL3hlbi94ZW5idXMu
aCAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIDUgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
