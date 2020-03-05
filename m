Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E417A59A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:48:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9psP-0008Vw-93; Thu, 05 Mar 2020 12:45:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BTO=4W=amzn.com=prvs=326a7180f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9psO-0008Vq-Dt
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:45:20 +0000
X-Inumbo-ID: 2b93ddc0-5edf-11ea-a5ab-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b93ddc0-5edf-11ea-a5ab-12813bfff9fa;
 Thu, 05 Mar 2020 12:45:19 +0000 (UTC)
IronPort-SDR: XsNkk/VZVUKLt8FrNeSlPi1Q2fehmfAJugbfSNe0+9OPM1ncUpPzSTwMj44u2l0w21pG3qVn54
 ojOE/7Ss5zDA==
X-IronPort-AV: E=Sophos;i="5.70,518,1574121600"; d="scan'208";a="29429013"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-62350142.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 05 Mar 2020 12:45:17 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-62350142.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3DB39A281C; Thu,  5 Mar 2020 12:45:12 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 12:45:11 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 12:45:10 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Mar 2020 12:45:06 +0000
From: <pdurrant@amzn.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 12:44:58 +0000
Message-ID: <20200305124504.3564-1-pdurrant@amzn.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 0/6] remove one more shared xenheap page:
 shared_info
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
 Tim Deegan <tim@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Paul Durrant <pdurrant@amzn.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbXpuLmNvbT4KClBhdWwgRHVycmFudCAoNik6
CiAgZG9tYWluOiBpbnRyb2R1Y2UgYWxsb2MvZnJlZV9zaGFyZWRfaW5mbygpIGhlbHBlcnMuLi4K
ICB4ODYgLyBwMm06IHJlbW92ZSBwYWdlX2xpc3QgY2hlY2sgaW4gcDJtX2FsbG9jX3RhYmxlCiAg
eDg2IC8gcHY6IGRvIG5vdCB0cmVhdCBQR0NfZXh0cmEgcGFnZXMgYXMgUkFNIHdoZW4gY29uc3Ry
dWN0aW5nIGRvbTAKICB4ODYgLyBpb3JlcTogdXNlIGEgTUVNRl9ub19yZWZjb3VudCBhbGxvY2F0
aW9uIGZvciBzZXJ2ZXIgcGFnZXMuLi4KICBtbTogYWRkICdpc19zcGVjaWFsX3BhZ2UnIG1hY3Jv
Li4uCiAgZG9tYWluOiB1c2UgUEdDX2V4dHJhIGRvbWhlYXAgcGFnZSBmb3Igc2hhcmVkX2luZm8K
CiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICAgIHwgMTAgKysrLS0tLQogeGVuL2FyY2gv
YXJtL21tLmMgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAg
ICAgICAgIHwgMTIgKysrKy0tLS0tCiB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgIHwg
IDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYyAgICAgICAgfCAgMiArLQogeGVuL2FyY2gv
eDg2L21tLmMgICAgICAgICAgICAgICB8IDExICsrKystLS0tCiB4ZW4vYXJjaC94ODYvbW0vYWx0
cDJtLmMgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jICAgfCAg
MyArLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgfCAgOCAtLS0tLS0KIHhlbi9h
cmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgfCAxMyArKysrKystLS0tCiB4ZW4vYXJjaC94ODYv
cHYvZG9tMF9idWlsZC5jICAgIHwgIDYgKysrKy0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgICAg
ICAgICAgfCAgMiArLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICB8IDQ2ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAg
ICAgICB8ICAyICstCiB4ZW4vY29tbW9uL2V2ZW50X2NoYW5uZWwuYyAgICAgIHwgIDMgKysrCiB4
ZW4vY29tbW9uL3RpbWUuYyAgICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKysrLS0KIHhlbi9p
bmNsdWRlL2FzbS14ODYvc2hhcmVkLmggICAgfCAxNSArKysrKystLS0tLQogeGVuL2luY2x1ZGUv
eGVuL2RvbWFpbi5oICAgICAgICB8ICAzICsrKwogeGVuL2luY2x1ZGUveGVuL21tLmggICAgICAg
ICAgICB8ICAzICsrKwogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICB8ICA1ICsrKy0K
IHhlbi9pbmNsdWRlL3hlbi9zaGFyZWQuaCAgICAgICAgfCAgMiArLQogMjEgZmlsZXMgY2hhbmdl
ZCwgMTE5IGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQotLS0KQ2M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+CkNjOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CkNjOiAi
Um9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGFtYXMgSyBMZW5neWVsIDx0YW1h
c0B0a2xlbmd5ZWwuY29tPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBWb2xvZHlt
eXIgQmFiY2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+CkNjOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
