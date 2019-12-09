Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF411168CF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:02:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieEsw-0006uY-7L; Mon, 09 Dec 2019 08:59:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xl4W=Z7=amazon.com=prvs=239a0b868=sjpark@srs-us1.protection.inumbo.net>)
 id 1ieEsv-0006uT-3W
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 08:59:17 +0000
X-Inumbo-ID: 2ddae8d8-1a62-11ea-87a6-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ddae8d8-1a62-11ea-87a6-12813bfff9fa;
 Mon, 09 Dec 2019 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575881957; x=1607417957;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=LGTA5TBkns2swo7rzErYEaOZnrGxFvudwmigEUBWSbw=;
 b=bq9MalpgtYVPszaKwKWPam2iaN4VtgL2S/AJaNjpRMmgUj6el5XF0dba
 th9oPnA4PyRyeljinM8C3EpJl1RMw8xCTvzvhbmcGpKh9cw473UNKbf1t
 s023OJ5WC5kwzp43bQdSboQooCnQUTIo7Dbi6FGZGp9lDslJv5TItIrGf g=;
IronPort-SDR: dJUnx6CEDqktFiRuiiivz/Sg1VkDOSdNj1YmovhDEEj21n8RIw7fJ4f1q0sB0LgpCJeF+6bCPY
 PixdBF2EnBzw==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="7696916"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 09 Dec 2019 08:59:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id E2691A1E75; Mon,  9 Dec 2019 08:59:13 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 08:59:12 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.249) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 08:59:08 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <axboe@kernel.dk>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>
Date: Mon, 9 Dec 2019 09:58:38 +0100
Message-ID: <20191209085839.21215-1-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.43.162.249]
X-ClientProxiedBy: EX13D29UWA001.ant.amazon.com (10.43.160.187) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/1] xen/blkback: Squeeze page pools if a
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
Cc: sj38.park@gmail.com, SeongJae Park <sjpark@amazon.com>, pdurrant@amazon.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RWFjaCBgYmxraWZgIGhhcyBhIGZyZWUgcGFnZXMgcG9vbCBmb3IgdGhlIGdyYW50IG1hcHBpbmcu
ICBUaGUgc2l6ZSBvZgp0aGUgcG9vbCBzdGFydHMgZnJvbSB6ZXJvIGFuZCBiZSBpbmNyZWFzZWQg
b24gZGVtYW5kIHdoaWxlIHByb2Nlc3NpbmcKdGhlIEkvTyByZXF1ZXN0cy4gIElmIGN1cnJlbnQg
SS9PIHJlcXVlc3RzIGhhbmRsaW5nIGlzIGZpbmlzaGVkIG9yIDEwMAptaWxsaXNlY29uZHMgaGFz
IHBhc3NlZCBzaW5jZSBsYXN0IEkvTyByZXF1ZXN0cyBoYW5kbGluZywgaXQgY2hlY2tzIGFuZApz
aHJpbmtzIHRoZSBwb29sIHRvIG5vdCBleGNlZWQgdGhlIHNpemUgbGltaXQsIGBtYXhfYnVmZmVy
X3BhZ2VzYC4KClRoZXJlZm9yZSwgYGJsa2Zyb250YCBydW5uaW5nIGd1ZXN0cyBjYW4gY2F1c2Ug
YSBtZW1vcnkgcHJlc3N1cmUgaW4gdGhlCmBibGtiYWNrYCBydW5uaW5nIGd1ZXN0IGJ5IGF0dGFj
aGluZyBhIGxhcmdlIG51bWJlciBvZiBibG9jayBkZXZpY2VzIGFuZAppbmR1Y2luZyBJL08uICBT
eXN0ZW0gYWRtaW5pc3RyYXRvcnMgY2FuIGF2b2lkIHN1Y2ggcHJvYmxlbWF0aWMKc2l0dWF0aW9u
cyBieSBsaW1pdGluZyB0aGUgbWF4aW11bSBudW1iZXIgb2YgZGV2aWNlcyBlYWNoIGd1ZXN0IGNh
bgphdHRhY2guICBIb3dldmVyLCBmaW5kaW5nIHRoZSBvcHRpbWFsIGxpbWl0IGlzIG5vdCBzbyBl
YXN5LiAgSW1wcm9wZXIKc2V0IG9mIHRoZSBsaW1pdCBjYW4gcmVzdWx0cyBpbiB0aGUgbWVtb3J5
IHByZXNzdXJlIG9yIGEgcmVzb3VyY2UKdW5kZXJ1dGlsaXphdGlvbi4gIFRoaXMgY29tbWl0IGF2
b2lkcyBzdWNoIHByb2JsZW1hdGljIHNpdHVhdGlvbnMgYnkKc3F1ZWV6aW5nIHRoZSBwb29scyAo
cmV0dXJucyBldmVyeSBmcmVlIHBhZ2UgaW4gdGhlIHBvb2wgdG8gdGhlIHN5c3RlbSkKZm9yIGEg
d2hpbGUgKHVzZXJzIGNhbiBzZXQgdGhpcyBkdXJhdGlvbiB2aWEgYSBtb2R1bGUgcGFyYW1ldGVy
KSBpZiBhCm1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZC4KCgpCYXNlIFZlcnNpb24KLS0tLS0t
LS0tLS0tCgpUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIHY1LjQuICBBIGNvbXBsZXRlIHRyZWUgaXMg
YWxzbyBhdmFpbGFibGUgYXQgbXkKcHVibGljIGdpdCByZXBvOgpodHRwczovL2dpdGh1Yi5jb20v
c2pwMzgvbGludXgvdHJlZS9ibGtiYWNrX2FnZ3Jlc3NpdmVfc2hyaW5raW5nX3YzCgoKUGF0Y2gg
SGlzdG9yeQotLS0tLS0tLS0tLS0tCgpDaGFuZ2VzIGZyb20gdjIgKGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWJsb2NrL2FmMTk1MDMzLTIzZDUtMzhlZC1iNzNiLWY2ZTJlM2IzNDU0MUBh
bWF6b24uY29tKQogLSBSZW5hbWUgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgYW5kIHZhcmlhYmxlcyBm
b3IgYnJldml0eSAoYWdncmVzc2l2ZQogICBzaHJpbmtpbmcgLT4gc3F1ZWV6aW5nKQoKQ2hhbmdl
cyBmcm9tIHYxIChodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAxOTEyMDQxMTM0
MTkuMjI5OC0xLXNqcGFya0BhbWF6b24uY29tLykKIC0gQWRqdXN0IHRoZSBkZXNjcmlwdGlvbiB0
byBub3QgdXNlIHRoZSB0ZXJtLCBgYXJiaXRyYXJpbHlgIChzdWdnZXN0ZWQKICAgYnkgUGF1bCBE
dXJyYW50KQogLSBTcGVjaWZ5IHRpbWUgdW5pdCBvZiB0aGUgZHVyYXRpb24gaW4gdGhlIHBhcmFt
ZXRlciBkZXNjcmlwdGlvbiwKICAgKHN1Z2dlc3RlZCBieSBNYXhpbWlsaWFuIEhleW5lKQogLSBD
aGFuZ2UgZGVmYXVsdCBhZ2dyZXNzaXZlIHNocmlua2luZyBkdXJhdGlvbiBmcm9tIDFtcyB0byAx
MG1zCiAtIE1lcmdlIHR3byBwYXRjaGVzIGludG8gb25lIHNpbmdsZSBwYXRjaAoKU2VvbmdKYWUg
UGFyayAoMSk6CiAgeGVuL2Jsa2JhY2s6IFNxdWVlemUgcGFnZSBwb29scyBpZiBhIG1lbW9yeSBw
cmVzc3VyZSBpcyBkZXRlY3RlZAoKIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFjay5j
IHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
