Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B971504C1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 12:00:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyZPg-0007Yi-JR; Mon, 03 Feb 2020 10:57:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyZPf-0007Yc-7G
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 10:57:07 +0000
X-Inumbo-ID: ea757034-4673-11ea-8e48-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea757034-4673-11ea-8e48-12813bfff9fa;
 Mon, 03 Feb 2020 10:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580727426; x=1612263426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2F9BIzGFwP22KqdXajx7U4LucBlyIFlPWUfJvMN6rSc=;
 b=Me+2oVkzVkbihe4HNIIBDaEdZL/qaB2XAfw+fEOBtSSvHqRyyt30jV8W
 d6xM0i3yzGWBNIKn9eZu1piTcvroaXwwn+Cv3db1fCtxF8za4nfpwnGtD
 w6vnWHywV54aPGUUHlxE9vwxRzOXkZX2zVVxe2x5fPkFl8+yYyQBeMCE9 o=;
IronPort-SDR: gtQajvx0Yt2w+JYRciSQ12JlSQLMpZpMm0kGAoUskPod7B0g9hb0/eP2pQMff3gbe4oF+zftSt
 OpL8H/3IEHPw==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="15931616"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 03 Feb 2020 10:57:05 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id F2530A1BE0; Mon,  3 Feb 2020 10:57:00 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 10:57:00 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 10:56:59 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 3 Feb 2020 10:56:56 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 10:56:50 +0000
Message-ID: <20200203105654.22998-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50ICg0KToKICB4ODYgLyB2bXg6IG1vdmUgdGVhcmRvd24gZnJvbSBkb21haW5f
ZGVzdHJveSgpLi4uCiAgYWRkIGEgZG9tYWluX3RvdF9wYWdlcygpIGhlbHBlciBmdW5jdGlvbgog
IG1tOiBtYWtlIHBhZ2VzIGFsbG9jYXRlZCB3aXRoIE1FTUZfbm9fcmVmY291bnQgc2FmZSB0byBh
c3NpZ24KICB4ODYgLyB2bXg6IHVzZSBhIE1FTUZfbm9fcmVmY291bnQgZG9taGVhcCBwYWdlIGZv
cgogICAgQVBJQ19ERUZBVUxUX1BIWVNfQkFTRQoKIHhlbi9hcmNoL2FybS9hcm02NC9kb21jdGwu
YyAgICAgfCAgMiArLQogeGVuL2FyY2gveDg2L2RvbWFpbi5jICAgICAgICAgICB8ICAyICstCiB4
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICAgIHwgMjUgKysrKysrKystLS0KIHhlbi9hcmNo
L3g4Ni9tbS5jICAgICAgICAgICAgICAgfCAxNSArKy0tLS0tCiB4ZW4vYXJjaC94ODYvbW0vcDJt
LXBvZC5jICAgICAgIHwgMTAgKystLS0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMg
fCAgMiArLQogeGVuL2FyY2gveDg2L21zaS5jICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJj
aC94ODYvbnVtYS5jICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1
aWxkLmMgICAgfCAyNSArKysrKystLS0tLQogeGVuL2FyY2gveDg2L3B2L2RvbWFpbi5jICAgICAg
ICB8ICAyICstCiB4ZW4vYXJjaC94ODYvcHYvc2hpbS5jICAgICAgICAgIHwgIDQgKy0KIHhlbi9j
b21tb24vZG9tY3RsLmMgICAgICAgICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9ncmFudF90YWJs
ZS5jICAgICAgICB8ICA0ICstCiB4ZW4vY29tbW9uL2tleWhhbmRsZXIuYyAgICAgICAgIHwgIDIg
Ky0KIHhlbi9jb21tb24vbWVtb3J5LmMgICAgICAgICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMgICAgICAgICB8IDc4ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LQogeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oICAgICAgICB8ICA1ICsrLQogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9tbS5oICAgICAgICB8ICA5ICsrLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9tZW1vcnku
aCAgICAgfCAgNCArLQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICB8IDI3ICsrKysr
KysrKy0tLQogMjAgZmlsZXMgY2hhbmdlZCwgMTQzIGluc2VydGlvbnMoKyksIDgxIGRlbGV0aW9u
cygtKQotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNj
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+CkNjOiBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+CkNjOiBLb25y
YWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiAiUm9nZXIgUGF1
IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBW
b2xvZHlteXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkNjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
