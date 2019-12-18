Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3F123C7D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 02:36:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihODd-0005wJ-PN; Wed, 18 Dec 2019 01:33:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8lPW=2I=amazon.com=prvs=2481dc0fd=elnikety@srs-us1.protection.inumbo.net>)
 id 1ihODb-0005wD-MM
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 01:33:39 +0000
X-Inumbo-ID: 6812d90e-2136-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6812d90e-2136-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 01:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576632815; x=1608168815;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Dm2WtHsDBEyQVN/th5V+99Otnff9vZOcVxE8vZHMFTo=;
 b=IvLKz/KJXgUiIzs6t/BiONNiKTkCnZvqm3B65GntQSTefNchLd28/Hxi
 Td6QMIzl5yGRy18gCTVtJcyqY3Muer3+KV7McmDdCfiAkgBBuaeQJ3Ktu
 5e/QMlf53t2DjBYoYnQ7iyrx0auyHuAZeMRGO+vfZ/ATyaP+hmeBnqoNc 4=;
IronPort-SDR: YzIOiLPSyrvbzZBe22RvQxZmk0hd6B21t5vcm3Uya29lmnSXbHNoc2a3ijmOPgiPGgfq/6J6Hh
 Fbjo9b4P9rXg==
X-IronPort-AV: E=Sophos;i="5.69,327,1571702400"; 
   d="scan'208";a="5740140"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 18 Dec 2019 01:33:22 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (Postfix) with ESMTPS
 id B9187A2434; Wed, 18 Dec 2019 01:33:20 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 01:33:19 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 01:33:19 +0000
Received: from dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (10.15.63.96)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 18 Dec 2019 01:33:19 +0000
Received: by dev-dsk-elnikety-1b-cd63f796.eu-west-1.amazon.com (Postfix,
 from userid 6438462)
 id CBCADA0141; Wed, 18 Dec 2019 01:33:18 +0000 (UTC)
From: Eslam Elnikety <elnikety@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 18 Dec 2019 01:32:55 +0000
Message-ID: <cover.1576630344.git.elnikety@amazon.com>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/4] x86/microcode: Support builtin CPU
 microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG1haW4gZ29hbCBvZiB0aGlzIHBhdGNoIHNlcmllcyBpcyB0byBhZGQgc3VwcG9ydCBmb3Ig
YnVpbHRpbiBtaWNyb2NvZGUuClRvd2FyZHMgdGhhdCBlbmQsIHRoZSBzZXJpZXMgc3RhcnRzIHdp
dGggYSBmZXcgaW1wcm92ZW1lbnRzIGZvciB0aGUKZG9jdW1lbnRhdGlvbiBhbmQgcGFyc2luZyBv
ZiB0aGUgdWNvZGU9IFhlbiBjb21tYW5kIGxpbmUgcGFyYW1ldGVyIHRoYXQKY29udHJvbHMgZWFy
bHkgbG9hZGluZyBvZiBtaWNyb2NvZGUgKFBhdGNoZXMgMS0tMyksIGFuZCBmb2xsb3dzIHdpdGgg
dGhlCm1haW4gYnVpbHRpbiBzdXBwb3QgKFBhdGNoIDQpLgoKQ2hhbmdlcyBpbiB2MjoKLSBBbiBl
YXJsaWVyIHZlcnNpb24gb2YgUGF0Y2ggNCB3YXMgc3VibWl0dGVkIGluIGlzb2xhdGlvbi4gUmVm
ZXIgdG8gdGhlCiAgcGF0Y2ggaXRzZWxmIGZvciBkZXRhaWxzIHJlZ2FyZGluZyB0aGUgcmVsZXZh
bnQgY2hhbmdlcy4KLSBQYXRjaGVzIDEtLTMgYXJlIGFkZGl0aW9ucy4KCkVzbGFtIEVsbmlrZXR5
ICg0KToKICB4ODYvbWljcm9jb2RlOiBJbXByb3ZlIGRvY3VtZW50YXRpb24gYW5kIHBhcnNpbmcg
Zm9yIHVjb2RlPQogIHg4Ni9taWNyb2NvZGU6IGF2b2lkIHVubmVjZXNzYXJ5IHhtYWxsb2MvbWVt
Y3B5IG9mIHVjb2RlIGRhdGEKICB4ODYvbWljcm9jb2RlOiB1c2UgY29uc3QgcXVhbGlmaWVyIGZv
ciBtaWNyb2NvZGUgYnVmZmVyCiAgeDg2L21pY3JvY29kZTogU3VwcG9ydCBidWlsdGluIENQVSBt
aWNyb2NvZGUKCiBkb2NzL2FkbWluLWd1aWRlL21pY3JvY29kZS1sb2FkaW5nLnJzdCB8ICAzMSAr
KysrKysKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyAgICAgIHwgIDI2ICsrKy0t
CiB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAzMCArKysrKysKIHhl
bi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9hcmNoL3g4
Ni9taWNyb2NvZGUuYyAgICAgICAgICAgICAgIHwgMTM5ICsrKysrKysrKysrKysrLS0tLS0tLS0t
LS0KIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUvTWFrZWZpbGUgICAgICAgIHwgIDQ2ICsrKysrKysr
CiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgICAgICAgICAgICB8ICAxMiArKysKIDcgZmls
ZXMgY2hhbmdlZCwgMjIxIGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUvTWFrZWZpbGUKCi0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
