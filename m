Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A74D13423
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 21:47:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMe6o-0007yM-QC; Fri, 03 May 2019 19:44:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4jea=TD=amazon.com=prvs=0198f17c6=elnikety@srs-us1.protection.inumbo.net>)
 id 1hMe6n-0007yB-6M
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 19:44:37 +0000
X-Inumbo-ID: dac026d2-6ddb-11e9-8178-7f0b5cf1e509
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dac026d2-6ddb-11e9-8178-7f0b5cf1e509;
 Fri, 03 May 2019 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1556912665; x=1588448665;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=JMgTeVh3LJ7XutkW2AJXxZ0fct7USoQjhlwd4pQOBrs=;
 b=YIIWkvs/rI8PU05uleGftP6QeUZPO5pX+RJ8yn/MBK4Y+6j9Aho5g9nC
 qPGD+qTF54JC9r8nCCgQqEnCZN7oRyuXb9o9vjCYXA/LeZfaBU84iKBRu
 iVB11UE2FFjEfVNbDHqt1OrDE8LAF/VTlhqF9HpeCdFuJrnYDPAjUN/xK w=;
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="797762025"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 03 May 2019 19:44:22 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-5dd976cd.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x43JiJYu013399
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 3 May 2019 19:44:20 GMT
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 May 2019 19:44:20 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 3 May 2019 19:44:19 +0000
Received: from dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (10.15.5.186)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id 15.0.1367.3 via Frontend Transport; Fri, 3 May 2019 19:44:17 +0000
Received: by dev-dsk-elnikety-1c-28a13cba.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id 6DC5A462B6; Fri,  3 May 2019 19:44:17 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 19:43:49 +0000
Message-ID: <20190503194349.42831-1-elnikety@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2] sched/credit: avoid priority boost for
 capped domains when unpark
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
 Lars Kurth <lars.kurth@xen.org>, Eslam Elnikety <elnikety@amazon.com>,
 Dario Faggioli <dfaggioli@suse.com>
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
Y3JlZGl0OiBYaSBYaW9uZyB3aGlsZSBhdCBBbWF6b24uCgpTaWduZWQtb2ZmLWJ5OiBFc2xhbSBF
bG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6IExlb25hcmQgRm9lcnN0
ZXIgPGZvZXJzbGVvQGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IFBldHJlIEVmdGltZSA8ZXBldHJl
QGFtYXpvbi5jb20+CkFja2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29t
PgoKLS0tCiAgICBDaGFuZ2VzIGluIHYyOgogICAgICAgIC0gQWRqdXN0ZWQgY29tbWl0IG1lc3Nh
Z2UsIGFkZGluZyBYaSdzIHByZXZpb3VzIGFmZmlsaWF0aW9uCiAgICAgICAgLSBEcm9wcGVkIGNv
bW1lbnQ6IC8qIE5vdyBjbGVhciB0aGUgUEFSS0VEIGZsYWcgKi8KICAgICAgICAtIEFkZGVkIERh
cmlvJ3MgQS1iCi0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L2NvbW1vbi9zY2hlZF9jcmVkaXQuYyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKaW5kZXgg
M2FiZTIwZGVmOC4uN2I3ZmFjYmFjZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZF9jcmVk
aXQuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCkBAIC0xNTM4LDcgKzE1MzgsNyBA
QCBjc2NoZWRfYWNjdCh2b2lkKiBkdW1teSkKICAgICAgICAgICAgICAgICBzdmMtPnByaSA9IENT
Q0hFRF9QUklfVFNfVU5ERVI7CiAKICAgICAgICAgICAgICAgICAvKiBVbnBhcmsgYW55IGNhcHBl
ZCBkb21haW5zIHdob3NlIGNyZWRpdHMgZ28gcG9zaXRpdmUgKi8KLSAgICAgICAgICAgICAgICBp
ZiAoIHRlc3RfYW5kX2NsZWFyX2JpdChDU0NIRURfRkxBR19WQ1BVX1BBUktFRCwgJnN2Yy0+Zmxh
Z3MpICkKKyAgICAgICAgICAgICAgICBpZiAoIHRlc3RfYml0KENTQ0hFRF9GTEFHX1ZDUFVfUEFS
S0VELCAmc3ZjLT5mbGFncykgKQogICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAg
ICAgLyoKICAgICAgICAgICAgICAgICAgICAgICogSXQncyBpbXBvcnRhbnQgdG8gdW5zZXQgdGhl
IGZsYWcgQUZURVIgdGhlIHVucGF1c2UoKQpAQCAtMTU0Nyw2ICsxNTQ3LDcgQEAgY3NjaGVkX2Fj
Y3Qodm9pZCogZHVtbXkpCiAgICAgICAgICAgICAgICAgICAgICAqLwogICAgICAgICAgICAgICAg
ICAgICBTQ0hFRF9TVEFUX0NSQU5LKHZjcHVfdW5wYXJrKTsKICAgICAgICAgICAgICAgICAgICAg
dmNwdV91bnBhdXNlKHN2Yy0+dmNwdSk7CisgICAgICAgICAgICAgICAgICAgIGNsZWFyX2JpdChD
U0NIRURfRkxBR19WQ1BVX1BBUktFRCwgJnN2Yy0+ZmxhZ3MpOwogICAgICAgICAgICAgICAgIH0K
IAogICAgICAgICAgICAgICAgIC8qIFVwcGVyIGJvdW5kIG9uIGNyZWRpdHMgbWVhbnMgVkNQVSBz
dG9wcyBlYXJuaW5nICovCi0tIAoyLjE1LjMuQU1aTgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
