Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E860C13166
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:44:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaIj-0005LF-7y; Fri, 03 May 2019 15:40:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4jea=TD=amazon.com=prvs=0198f17c6=elnikety@srs-us1.protection.inumbo.net>)
 id 1hMaIi-0005LA-Aw
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:40:40 +0000
X-Inumbo-ID: ccf6bb0c-6db9-11e9-843c-bc764e045a96
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ccf6bb0c-6db9-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1556898039; x=1588434039;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=dTXzQslvZSOpAROci88yBv58wiAvUvujcvpE207EQDk=;
 b=JmvfcsK6Iw+oTZgp17b9aNdUnNjAQ5RVtyiUCcb0jEOzIGTRoJBV4MMa
 E2dAHaV+kJuFf1STiWIfqXLUp2KK4Rcb34qBKf6+L4AeTvVghVlvkAfMr
 HcqBte17e0C+B+vwFkj3VS8yWsJJvhFDYWaR2/kLptGYtHWYlc8/rPyJu 4=;
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="797707739"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 03 May 2019 15:40:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x43FeWCk085337
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 3 May 2019 15:40:35 GMT
Received: from EX13D03EUA001.ant.amazon.com (10.43.165.33) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 May 2019 15:40:34 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D03EUA001.ant.amazon.com (10.43.165.33) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 May 2019 15:40:21 +0000
Received: from dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (10.15.5.186)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 3 May 2019 15:40:14 +0000
Received: by dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 998F3464AF; Fri,  3 May 2019 15:40:14 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 15:38:39 +0000
Message-ID: <20190503153839.19932-1-elnikety@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH] sched/credit: avoid priority boost for capped
 domains when unpark
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Eslam Elnikety <elnikety@amazon.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiB1bnBhdXNpbmcgYSBjYXBwZWQgZG9tYWluLCB0aGUgc2NoZWR1bGVyIGN1cnJlbnRseSBj
bGVhcnMgdGhlCkNTQ0hFRF9GTEFHX1ZDUFVfUEFSS0VEIGZsYWcgYmVmb3JlIHZjcHVfd2FrZSgp
LiBUaGlzLCBpbiB0dXJuLCBjYXVzZXMgdGhlCnZjcHVfd2FrZSB0byBzZXQgQ1NDSEVEX1BSSV9U
U19CT09TVCwgcmVzdWx0aW5nIGluIGFuIHVuZmFpciBjcmVkaXQgYm9vc3QuIFRoZQpjb21tZW50
IGFyb3VuZCB0aGUgY2hhbmdlZCBsaW5lcyBhbHJlYWR5IHN0YXRlcyB0aGF0IGNsZWFyaW5nIHRo
ZSBmbGFnIHNob3VsZApoYXBwZW4gQUZURVIgdGhlIHVucGF1c2UuIFRoaXMgYnVnIHdhcyBpbnRy
b2R1Y2VkIGluIGNvbW1pdCBiZTY1MDc1MDk0NQoiY3JlZGl0MTogVXNlIGF0b21pYyBiaXQgb3Bl
cmF0aW9ucyBmb3IgdGhlIGZsYWdzIHN0cnVjdHVyZSIuCgpPcmlnaW5hbCBwYXRjaCBhdXRob3Ig
Y3JlZGl0OiBYaSBYaW9uZy4KClNpZ25lZC1vZmYtYnk6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0
eUBhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogTGVvbmFyZCBGb2Vyc3RlciA8Zm9lcnNsZW9AYW1h
em9uLmRlPgpSZXZpZXdlZC1ieTogUGV0cmUgRWZ0aW1lIDxlcGV0cmVAYW1hem9uLmNvbT4KLS0t
CiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hl
ZF9jcmVkaXQuYyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKaW5kZXggM2FiZTIwZGVmOC4u
OGViMWFiYTEyYSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYworKysgYi94
ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCkBAIC0xNTM4LDcgKzE1MzgsNyBAQCBjc2NoZWRfYWNj
dCh2b2lkKiBkdW1teSkKICAgICAgICAgICAgICAgICBzdmMtPnByaSA9IENTQ0hFRF9QUklfVFNf
VU5ERVI7CiAKICAgICAgICAgICAgICAgICAvKiBVbnBhcmsgYW55IGNhcHBlZCBkb21haW5zIHdo
b3NlIGNyZWRpdHMgZ28gcG9zaXRpdmUgKi8KLSAgICAgICAgICAgICAgICBpZiAoIHRlc3RfYW5k
X2NsZWFyX2JpdChDU0NIRURfRkxBR19WQ1BVX1BBUktFRCwgJnN2Yy0+ZmxhZ3MpICkKKyAgICAg
ICAgICAgICAgICBpZiAoIHRlc3RfYml0KENTQ0hFRF9GTEFHX1ZDUFVfUEFSS0VELCAmc3ZjLT5m
bGFncykgKQogICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgLyoKICAgICAg
ICAgICAgICAgICAgICAgICogSXQncyBpbXBvcnRhbnQgdG8gdW5zZXQgdGhlIGZsYWcgQUZURVIg
dGhlIHVucGF1c2UoKQpAQCAtMTU0Nyw2ICsxNTQ3LDggQEAgY3NjaGVkX2FjY3Qodm9pZCogZHVt
bXkpCiAgICAgICAgICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgICAgICAgICBTQ0hFRF9T
VEFUX0NSQU5LKHZjcHVfdW5wYXJrKTsKICAgICAgICAgICAgICAgICAgICAgdmNwdV91bnBhdXNl
KHN2Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAgICAgIC8qIE5vdyBjbGVhciB0aGUgUEFSS0VE
IGZsYWcgKi8KKyAgICAgICAgICAgICAgICAgICAgY2xlYXJfYml0KENTQ0hFRF9GTEFHX1ZDUFVf
UEFSS0VELCAmc3ZjLT5mbGFncyk7CiAgICAgICAgICAgICAgICAgfQogCiAgICAgICAgICAgICAg
ICAgLyogVXBwZXIgYm91bmQgb24gY3JlZGl0cyBtZWFucyBWQ1BVIHN0b3BzIGVhcm5pbmcgKi8K
LS0gCjIuMTUuMy5BTVpOCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
