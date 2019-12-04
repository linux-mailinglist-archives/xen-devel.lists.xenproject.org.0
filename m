Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCAB112A57
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 12:38:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icSvs-0006P8-IU; Wed, 04 Dec 2019 11:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SvPU=Z2=amazon.com=prvs=23428832f=sjpark@srs-us1.protection.inumbo.net>)
 id 1icSvq-0006OO-HG
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 11:34:58 +0000
X-Inumbo-ID: 199d9c0c-168a-11ea-99dd-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 199d9c0c-168a-11ea-99dd-bc764e2007e4;
 Wed, 04 Dec 2019 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575459298; x=1606995298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hFszrM7KiTbnME9EGJrfhQofskCo55+99bwJF65SxQo=;
 b=W77lqA0yr/fr1fpiBXOflBx8/6+ZgvWS9uVYyHrPhHFoCJG9RQzglax8
 EG2xg6ZT0qcHwiUO4yLgsOX2oKXkv0Bd7wGIZmZWcdG/2Gzi8YqSsG0Lp
 Nt3hZTuMU4H3sf8KQiY02EZqPA6Pbqb5Ej3MtdFEa6qmeO65M8ldsVEA5 M=;
IronPort-SDR: qhYuRtZ0Yol5ruY3wIPQVvj8V7PP7DvXuyvJIH0Dg4IB71EmrDNKQjPBTijP9FyR4jjk/XWup5
 68gfq8Di2HhQ==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="6142138"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 04 Dec 2019 11:34:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id A586EA2641; Wed,  4 Dec 2019 11:34:46 +0000 (UTC)
Received: from EX13D31EUA004.ant.amazon.com (10.43.165.161) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 11:34:45 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.162.249) by
 EX13D31EUA004.ant.amazon.com (10.43.165.161) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 11:34:42 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <konrad.wilk@oracle.com>, <roger.pau@citrix.com>, <axboe@kernel.dk>
Date: Wed, 4 Dec 2019 12:34:19 +0100
Message-ID: <20191204113419.2298-3-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191204113419.2298-1-sjpark@amazon.com>
References: <20191204113419.2298-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.162.249]
X-ClientProxiedBy: EX13D21UWB003.ant.amazon.com (10.43.161.212) To
 EX13D31EUA004.ant.amazon.com (10.43.165.161)
Precedence: Bulk
Subject: [Xen-devel] [PATCH 2/2] blkback: Add a module parameter for
 aggressive pool shrinking duration
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sj38.park@gmail.com, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCkFzIGRpc2N1c3NlZCBieSB0
aGUgcHJldmlvdXMgY29tbWl0ICgieGVuL2Jsa2JhY2s6IEFnZ3Jlc3NpdmVseSBzaHJpbmsKcGFn
ZSBwb29scyBpZiBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3RlZCIpLCB0aGUgYWdncmVzc2l2
ZSBwb29sCnNocmlua2luZyBkdXJhdGlvbiBzaG91bGQgYmUgY2FyZWZ1bGx5IHNlbGVjdGVkOgpg
YElmIGl0IGlzIHRvbyBsb25nLCBmcmVlIHBhZ2VzIHBvb2wgc2hyaW5raW5nIG92ZXJoZWFkIGNh
biByZWR1Y2UgdGhlCkkvTyBwZXJmb3JtYW5jZS4gIElmIGl0IGlzIHRvbyBzaG9ydCwgYmxrYmFj
ayB3aWxsIG5vdCBmcmVlIGVub3VnaCBwYWdlcwp0byByZWR1Y2UgdGhlIG1lbW9yeSBwcmVzc3Vy
ZS5gYAoKVGhhdCBzYWlkLCB0aGUgcHJvcGVyIGR1cmF0aW9uIHdvdWxkIGRlcGVuZHMgb24gZ2l2
ZW4gY29uZmlndXJhdGlvbnMgYW5kCndvcmtsb2Fkcy4gIEZvciB0aGUgcmVhc29uLCB0aGlzIGNv
bW1pdCBhbGxvd3MgdXNlcnMgdG8gc2V0IGl0IHZpYSBhCm1vZHVsZSBwYXJhbWV0ZXIgaW50ZXJm
YWNlLgoKU2lnbmVkLW9mZi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KU3Vn
Z2VzdGVkLWJ5OiBBbWl0IFNoYWggPGFhbXNAYW1hem9uLmRlPgotLS0KIGRyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2svYmxrYmFjay5jIHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL2Jsa2JhY2suYyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svYmxrYmFj
ay5jCmluZGV4IGFhMWExMjcwOTNlNS4uODhjMDExMzAwZWU5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2Jsb2NrL3hlbi1ibGtiYWNrL2Jsa2JhY2suYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL2Jsa2JhY2suYwpAQCAtMTM3LDkgKzEzNywxMyBAQCBtb2R1bGVfcGFyYW0obG9nX3N0YXRz
LCBpbnQsIDA2NDQpOwogCiAvKgogICogT25jZSBhIG1lbW9yeSBwcmVzc3VyZSBpcyBkZXRlY3Rl
ZCwga2VlcCBhZ2dyZXNzaXZlIHNocmlua2luZyBvZiB0aGUgZnJlZQotICogcGFnZSBwb29scyBm
b3IgdGhpcyB0aW1lIChtc2VjKQorICogcGFnZSBwb29scyBmb3IgdGhpcyB0aW1lIChtaWxsaXNl
Y29uZHMpCiAgKi8KLSNkZWZpbmUgQUdHUkVTU0lWRV9TSFJJTktJTkdfRFVSQVRJT04JMQorc3Rh
dGljIGludCB4ZW5fYmxraWZfYWdncmVzc2l2ZV9zaHJpbmtpbmdfZHVyYXRpb24gPSAxOworbW9k
dWxlX3BhcmFtX25hbWVkKGFnZ3Jlc3NpdmVfc2hyaW5raW5nX2R1cmF0aW9uLAorCQl4ZW5fYmxr
aWZfYWdncmVzc2l2ZV9zaHJpbmtpbmdfZHVyYXRpb24sIGludCwgMDY0NCk7CitNT0RVTEVfUEFS
TV9ERVNDKGFnZ3Jlc3NpdmVfc2hyaW5raW5nX2R1cmF0aW9uLAorIkR1cmF0aW9uIHRvIGRvIGFn
Z3Jlc3NpdmUgc2hyaW5raW5nIHdoZW4gYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQiKTsK
IAogc3RhdGljIHVuc2lnbmVkIGxvbmcgeGVuX2Jsa19tZW1fcHJlc3N1cmVfZW5kOwogCkBAIC0x
NDcsNyArMTUxLDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgYmxraWZfc2hyaW5rX2NvdW50KHN0
cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIsCiAJCQkJc3RydWN0IHNocmlua19jb250cm9sICpzYykK
IHsKIAl4ZW5fYmxrX21lbV9wcmVzc3VyZV9lbmQgPSBqaWZmaWVzICsKLQkJbXNlY3NfdG9famlm
ZmllcyhBR0dSRVNTSVZFX1NIUklOS0lOR19EVVJBVElPTik7CisJCW1zZWNzX3RvX2ppZmZpZXMo
eGVuX2Jsa2lmX2FnZ3Jlc3NpdmVfc2hyaW5raW5nX2R1cmF0aW9uKTsKIAlyZXR1cm4gMDsKIH0K
IAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
