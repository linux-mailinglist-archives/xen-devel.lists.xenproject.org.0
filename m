Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC35D7ACB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPGj-00018m-Cz; Tue, 15 Oct 2019 16:01:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G1dy=YI=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iKPGh-00018f-To
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:01:52 +0000
X-Inumbo-ID: 18add182-ef65-11e9-a531-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18add182-ef65-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 16:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tYs7wrFHttK3n1Wuxd7ENqc/fESColQ3G/ElUwYzTlk=; b=EgrapJ7p6pR+K+0+v31d3eYs1H
 kq81LXXoElqd3x1uGfyXG2mb6olYK8hruh+EqdLR32DelKdYyFk6us3zi5yhj0scQF8OlX7vqRb7g
 N8Xo8Dw49NAq1bFGUb3JC+8tJXiKRukaBcs2mMcPrXQC0ZETt/VJyraRGeVhgxYwfgDU=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:41558
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iKPHK-0002mt-4c; Tue, 15 Oct 2019 18:02:30 +0200
To: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <e8c0d666-0d74-068a-0274-2ccd20159745@eikelenboom.it>
Date: Tue, 15 Oct 2019 18:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen-unstable 4.13.0-rc0 problem starting guest while
 trying to passthrough multiple pci devices
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW50aG9ueSwKCldoaWxlIHRlc3RpbmcgeGVuLXVuc3RhYmxlIDQuMTMuMC1yYzAgSSByYW4g
aW4gdG8gdGhlIGZvbGxvd2luZyBpc3N1ZToKCldoZW4gcGFzc2luZyB0aHJvdWdoIGFsbCA4IGZ1
bmN0aW9ucyBvZiBhIHBjaShlKSBkZXZpY2UgSSBjYW4ndCBzdGFydCB0aGUgZ3Vlc3QgYW55bW9y
ZSwgbm90ZSB0aGF0IHRoZSB0cm91YmxlIG9ubHkgc3RhcnRzIGF0IDA6OTowLjMsIG5vdCBhdCAw
Ojk6MC4wOgoJbGlieGw6IGVycm9yOiBsaWJ4bF9xbXAuYzoxMjcwOnFtcF9ldl9jb25uZWN0OiBE
b21haW4gMzpGYWlsZWQgdG8gY29ubmVjdCB0byBRTVAgc29ja2V0IC92YXIvcnVuL3hlbi9xbXAt
bGlieGwtMzogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUKCWxpYnhsOiBlcnJvcjog
bGlieGxfcGNpLmM6MTcwMjpkZXZpY2VfcGNpX2FkZF9kb25lOiBEb21haW4gMzpsaWJ4bF9fZGV2
aWNlX3BjaV9hZGQgIGZhaWxlZCBmb3IgUENJIGRldmljZSAwOjk6MC4zIChyYyAtMykKCWxpYnhs
OiBlcnJvcjogbGlieGxfcW1wLmM6MTI3MDpxbXBfZXZfY29ubmVjdDogRG9tYWluIDM6RmFpbGVk
IHRvIGNvbm5lY3QgdG8gUU1QIHNvY2tldCAvdmFyL3J1bi94ZW4vcW1wLWxpYnhsLTM6IFJlc291
cmNlIHRlbXBvcmFyaWx5IHVuYXZhaWxhYmxlCglsaWJ4bDogZXJyb3I6IGxpYnhsX3BjaS5jOjE3
MDI6ZGV2aWNlX3BjaV9hZGRfZG9uZTogRG9tYWluIDM6bGlieGxfX2RldmljZV9wY2lfYWRkICBm
YWlsZWQgZm9yIFBDSSBkZXZpY2UgMDo5OjAuNCAocmMgLTMpCglsaWJ4bDogZXJyb3I6IGxpYnhs
X3FtcC5jOjEyNzA6cW1wX2V2X2Nvbm5lY3Q6IERvbWFpbiAzOkZhaWxlZCB0byBjb25uZWN0IHRv
IFFNUCBzb2NrZXQgL3Zhci9ydW4veGVuL3FtcC1saWJ4bC0zOiBSZXNvdXJjZSB0ZW1wb3Jhcmls
eSB1bmF2YWlsYWJsZQoJbGlieGw6IGVycm9yOiBsaWJ4bF9wY2kuYzoxNzAyOmRldmljZV9wY2lf
YWRkX2RvbmU6IERvbWFpbiAzOmxpYnhsX19kZXZpY2VfcGNpX2FkZCAgZmFpbGVkIGZvciBQQ0kg
ZGV2aWNlIDA6OTowLjUgKHJjIC0zKQoJbGlieGw6IGVycm9yOiBsaWJ4bF9xbXAuYzoxMjcwOnFt
cF9ldl9jb25uZWN0OiBEb21haW4gMzpGYWlsZWQgdG8gY29ubmVjdCB0byBRTVAgc29ja2V0IC92
YXIvcnVuL3hlbi9xbXAtbGlieGwtMzogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUK
CWxpYnhsOiBlcnJvcjogbGlieGxfcGNpLmM6MTcwMjpkZXZpY2VfcGNpX2FkZF9kb25lOiBEb21h
aW4gMzpsaWJ4bF9fZGV2aWNlX3BjaV9hZGQgIGZhaWxlZCBmb3IgUENJIGRldmljZSAwOjk6MC42
IChyYyAtMykKCWxpYnhsOiBlcnJvcjogbGlieGxfcW1wLmM6MTI3MDpxbXBfZXZfY29ubmVjdDog
RG9tYWluIDM6RmFpbGVkIHRvIGNvbm5lY3QgdG8gUU1QIHNvY2tldCAvdmFyL3J1bi94ZW4vcW1w
LWxpYnhsLTM6IFJlc291cmNlIHRlbXBvcmFyaWx5IHVuYXZhaWxhYmxlCglsaWJ4bDogZXJyb3I6
IGxpYnhsX3BjaS5jOjE3MDI6ZGV2aWNlX3BjaV9hZGRfZG9uZTogRG9tYWluIDM6bGlieGxfX2Rl
dmljZV9wY2lfYWRkICBmYWlsZWQgZm9yIFBDSSBkZXZpY2UgMDo5OjAuNyAocmMgLTMpCglsaWJ4
bDogZXJyb3I6IGxpYnhsX2NyZWF0ZS5jOjE2MDk6ZG9tY3JlYXRlX2F0dGFjaF9kZXZpY2VzOiBE
b21haW4gMzp1bmFibGUgdG8gYWRkIHBjaSBkZXZpY2VzCglsaWJ4bDogZXJyb3I6IGxpYnhsX2Rv
bWFpbi5jOjExNzc6bGlieGxfX2Rlc3Ryb3lfZG9taWQ6IERvbWFpbiAzOk5vbi1leGlzdGFudCBk
b21haW4KCWxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTEzMTpkb21haW5fZGVzdHJveV9j
YWxsYmFjazogRG9tYWluIDM6VW5hYmxlIHRvIGRlc3Ryb3kgZ3Vlc3QKCWxpYnhsOiBlcnJvcjog
bGlieGxfZG9tYWluLmM6MTA1ODpkb21haW5fZGVzdHJveV9jYjogRG9tYWluIDM6RGVzdHJ1Y3Rp
b24gb2YgZG9tYWluIGZhaWxlZAoKV2hlbiBvbmx5IHBhc3NpbmcgdGhyb3VnaCB0aGUgZmlyc3Qg
ZnVuY3Rpb25zIDA6OTowLjAgdG8gMDo5OjAuMiwgdGhlIGd1ZXN0IHN0YXJ0cy4KCi0tClNhbmRl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
