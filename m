Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6211423E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 15:04:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icrhV-00079i-Ox; Thu, 05 Dec 2019 14:01:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icrhU-00079d-JL
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 14:01:48 +0000
X-Inumbo-ID: c6630f7b-1767-11ea-8227-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6630f7b-1767-11ea-8227-12813bfff9fa;
 Thu, 05 Dec 2019 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575554508; x=1607090508;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lGLBuGSdZX/veDcc+uJUEV1pogLhVnVlkgpfMlauIsY=;
 b=Zl9MkcFRW66pROUitBwOLoF1WNyeTtAALEVhzinuHI0peucRe8azZRIS
 HZChvTp7BeNCMs3sg6wp+SkzAK1iVq5GvavtlyZpL9GKd66f7CHvFczlP
 aCQ1wXE05Om/jSHs4IHHySroqO5+Z4VxXuGxpHgvUlPoUTw6JavVKUcut g=;
IronPort-SDR: ILqrpCruQ1ZMq7tf0Pdel+6wAAt+g7ejuplQtbOxk50vB0+5Kt8Dppuiz/S5f7dlbSPVzi+eDl
 yhjKWHfPpqrA==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; d="scan'208";a="13183874"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 05 Dec 2019 14:01:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 12E4EA2A34; Thu,  5 Dec 2019 14:01:33 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:32 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 14:01:31 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Dec 2019 14:01:28 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>
Date: Thu, 5 Dec 2019 14:01:19 +0000
Message-ID: <20191205140123.3817-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 0/4] xen-blkback: support live update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Paul Durrant <pdurrant@amazon.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggIzEgaXMgY2xlYW4tdXAgZm9yIGFuIGFwcGFyZW50IG1pcy1mZWF0dXJlLgoKUGF1bCBE
dXJyYW50ICg0KToKICB4ZW5idXM6IG1vdmUgeGVuYnVzX2Rldl9zaHV0ZG93bigpIGludG8gZnJv
bnRlbmQgY29kZS4uLgogIHhlbmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8gY2xv
c2VkCiAgeGVuL2ludGVyZmFjZTogZG9uJ3QgZGlzY2FyZCBwZW5kaW5nIHdvcmsgaW4gRlJPTlQv
QkFDS19SSU5HX0FUVEFDSAogIHhlbi1ibGtiYWNrOiBzdXBwb3J0IGR5bmFtaWMgdW5iaW5kL2Jp
bmQKCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jICAgICAgICAgfCAxMiArKysr
LS0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1cy5oICAgICAgICAgICAgICAgIHwgIDIgLS0K
IGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyAgICAgICAgICB8IDM0ICsrKysrKy0t
LS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5j
ICB8ICAxIC0KIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfZnJvbnRlbmQuYyB8IDI0
ICsrKysrKysrKysrKysrLQogaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaCAgICAgICAg
ICAgIHwgIDQgKy0tCiA2IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDM3IGRlbGV0
aW9ucygtKQotLS0KQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+CkNjOiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwuZGs+CkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9y
YWNsZS5jb20+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpD
YzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLSAKMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
