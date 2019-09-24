Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BCBC6EC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:34:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCj2J-00073S-Il; Tue, 24 Sep 2019 11:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LhKX=XT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCj2I-00073M-P0
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:31:14 +0000
X-Inumbo-ID: d091b884-debe-11e9-ae5c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id d091b884-debe-11e9-ae5c-bc764e2007e4;
 Tue, 24 Sep 2019 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569324675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1fLJMTliI1vK08faPR4VUIwhEhfNNpZZbP4jagQup3M=;
 b=iIR8l52mT5oDqsDQVridoLFTf1XkoQoSKY4j7PMwP/NBMUpSf4Qs5NZk
 PzAyPaPuLQ//Y7dAC4SGPGMagGiktApItZFURyiD6I0v1gqO/dSrCkgnW
 45zPn1exD/NiaEiiX2tDPoi4HKxeiItYpYTeuSQAst/JMXU5nffQcVEzD E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zQ+7TjXT5X9FCZjSpRAdICG/WkfHuexnxj8DB6Vb0CEetuZMn4DZCFhNOZuy7URZhkhqw1ffep
 i1teA1hYmyKHswVZq9Ny+lS492y3fRXUsmiUL5alaiJlwNFcNsKG39/KPveoo+qVEYr+qDTBE/
 mwSozZ7jgrqWvVKjMoXwG31kmDi0kf10eP4KQ4q0SJTqg4cvdAqEfeifrql1kcn3KeaRrNRM64
 uYgi6j2urGYObf1XtgmJY7474pey+1aAXalMIGxVoIbwDxJ/wkFjkmDwRbN2GmYNTGkeNuHHiM
 rR8=
X-SBRS: 2.7
X-MesageID: 5977594
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="5977594"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 24 Sep 2019 12:30:19 +0100
Message-ID: <20190924113026.255634-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PULL 0/7] xen queue 2019-09-24
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAyZjkzYTNlY2RkM2JiMDYwYmQwNGY2
OThjY2FmZTY2ZWZkOTg1NjNhOgoKICBNZXJnZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1v
dGVzL2RhdmlkaGlsZGVuYnJhbmQvdGFncy9zMzkweC10Y2ctMjAxOS0wOS0yMycgaW50byBzdGFn
aW5nICgyMDE5LTA5LTIzIDE1OjQ0OjUyICswMTAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6CgogIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3Bs
ZS9hcGVyYXJkL3FlbXUtZG0uZ2l0IHRhZ3MvcHVsbC14ZW4tMjAxOTA5MjQKCmZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0byA2YmQ2Yjk1NWMwYjI2NjYyNjM3MDBkMzlkYjE1M2FiNDNjNWUw
YzllOgoKICB4ZW4tYnVzOiBvbmx5IHNldCB0aGUgeGVuIGRldmljZSBmcm9udGVuZCBzdGF0ZSBp
ZiBpdCBpcyBtaXNzaW5nICgyMDE5LTA5LTI0IDEyOjIxOjI5ICswMTAwKQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpYZW4g
cXVldWUKCiogVXBkYXRlIG9mIG1haW50YWluZXIgZW1haWwgYWRkcmVzcwoqIEZpeGVzIGZvciB4
ZW4tYnVzIGFuZCB4ZW4tYmxvY2sKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KTWFyayBTeW1zICgxKToKICAgICAgeGVuLWJ1
czogb25seSBzZXQgdGhlIHhlbiBkZXZpY2UgZnJvbnRlbmQgc3RhdGUgaWYgaXQgaXMgbWlzc2lu
ZwoKUGF1bCBEdXJyYW50ICg2KToKICAgICAgeGVuLWJ1czogY2hlY2sgd2hldGhlciB0aGUgZnJv
bnRlbmQgaXMgYWN0aXZlIGR1cmluZyBkZXZpY2UgcmVzZXQuLi4KICAgICAgeGVuIC8gbm90aWZ5
OiBpbnRyb2R1Y2UgYSBuZXcgWGVuV2F0Y2hMaXN0IGFic3RyYWN0aW9uCiAgICAgIHhlbjogaW50
cm9kdWNlIHNlcGFyYXRlIFhlbldhdGNoTGlzdCBmb3IgWGVuRGV2aWNlIG9iamVjdHMKICAgICAg
eGVuOiBwZXJmb3JtIFhlbkRldmljZSBjbGVhbi11cCBpbiBYZW5CdXMgd2F0Y2ggaGFuZGxlcgog
ICAgICBNQUlOVEFJTkVSUzogdXBkYXRlIG15IGVtYWlsIGFkZHJlc3MKICAgICAgeGVuLWJsb2Nr
OiB0cmVhdCBYZW5idXNTdGF0ZVVua25vd24gdGhlIHNhbWUgYXMgWGVuYnVzU3RhdGVDbG9zZWQK
CiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgfCAgIDIgKy0KIGh3L2Jsb2NrL3hlbi1ibG9jay5j
ICAgICB8ICAgMSArCiBody94ZW4vdHJhY2UtZXZlbnRzICAgICAgfCAgIDkgKy0KIGh3L3hlbi94
ZW4tYnVzLmMgICAgICAgICB8IDMxNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLQogaW5jbHVkZS9ody94ZW4veGVuLWJ1cy5oIHwgICA4ICstCiBpbmNsdWRl
L3FlbXUvbm90aWZ5LmggICAgfCAgIDIgKwogdXRpbC9ub3RpZnkuYyAgICAgICAgICAgIHwgICA1
ICsKIDcgZmlsZXMgY2hhbmdlZCwgMjQ5IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
