Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E1F260AD
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 11:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTNos-0006VW-76; Wed, 22 May 2019 09:45:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTNoq-0006VH-8I
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:45:56 +0000
X-Inumbo-ID: 63e960ea-7c76-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 63e960ea-7c76-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 09:45:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00B50AF10;
 Wed, 22 May 2019 09:45:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 22 May 2019 11:45:46 +0200
Message-Id: <20190522094549.28397-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH 0/3] tune preempt_[dis|en]able()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgaXMgbm8gdXNlciBvZiB0aGUgcHJlZW1wdF9jb3VudCBmb3Igbm9uLWRlYnVnIGJ1aWxk
cy4gVGhpcyBzZXJpZXMKcmVtb3ZlcyBpdCBmb3IgdGhhdCBjYXNlLgoKSnVlcmdlbiBHcm9zcyAo
Myk6CiAgeGVuOiBkcm9wIGluX2F0b21pYygpCiAgeGVuOiBkcm9wIHByZWVtcHRfY291bnQoKSBm
b3Igbm9uLWRlYnVnIGJ1aWxkcwogIHhlbjogYnVpbGQgY29tbW9uL3ByZWVtcHQuYyBvbmx5IHdp
dGggQ09ORklHX0RFQlVHCgogeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICB8IDE2IC0tLS0tLS0t
LS0tLS0tLS0KIHhlbi9jb21tb24vTWFrZWZpbGUgICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9w
cmVlbXB0LmMgICAgICB8ICA3IC0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9wcmVlbXB0LmggfCAg
OCArKysrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9u
cygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
