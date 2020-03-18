Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC9D189A5B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 12:15:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEWc4-0005lR-1N; Wed, 18 Mar 2020 11:11:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xbLb=5D=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jEWc2-0005l9-42
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 11:11:50 +0000
X-Inumbo-ID: 42498fa5-6909-11ea-bac2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42498fa5-6909-11ea-bac2-12813bfff9fa;
 Wed, 18 Mar 2020 11:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7zb2ThGWpLji7R96uAMn2YeVRsxglQnXSX6OiypT5bI=; b=umtEg9iMAagdzvTFGN5NpGrBi0
 rHHLkmf4oUeJ3TbZbbV6PbBfhRKLLGbjXsttFxVOFOej7OoQez+CXIU3WIg9z9HpJ9KKpnsyT0CbD
 IT0zI4Xk7aX1fyVzbaiyq905ZcfdVK++4zEa32OuSW4yNZcElEomSBNe5yTDm2yYRRqc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jEWc0-0005zp-8W; Wed, 18 Mar 2020 11:11:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jEWbz-0000Ig-UQ; Wed, 18 Mar 2020 11:11:48 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Wed, 18 Mar 2020 11:11:42 +0000
Message-Id: <20200318111144.12894-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 0/2] docs: Migration design documents
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICgyKToKICBkb2NzL2Rlc2lnbnM6IEFkZCBhIGRlc2lnbiBkb2N1bWVudCBm
b3Igbm9uLWNvb3BlcmF0aXZlIGxpdmUgbWlncmF0aW9uCiAgZG9jcy9kZXNpZ25zOiBBZGQgYSBk
ZXNpZ24gZG9jdW1lbnQgZm9yIG1pZ3JhdGlvbiBvZiB4ZW5zdG9yZSBkYXRhCgogZG9jcy9kZXNp
Z25zL25vbi1jb29wZXJhdGl2ZS1taWdyYXRpb24ubWQgfCAyODAgKysrKysrKysrKysrKysrKysr
KysrKwogZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZCAgICAgICAgfCAyNTYgKysr
KysrKysrKysrKysrKysrKysKIGRvY3MvbWlzYy94ZW5zdG9yZS50eHQgICAgICAgICAgICAgICAg
ICAgIHwgICA2ICstCiAzIGZpbGVzIGNoYW5nZWQsIDUzOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRvY3MvZGVzaWducy9ub24tY29vcGVyYXRpdmUt
bWlncmF0aW9uLm1kCiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1p
Z3JhdGlvbi5tZAotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJ
YW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNjOiBL
b25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
