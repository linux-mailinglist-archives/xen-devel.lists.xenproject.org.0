Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F91118669
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 12:36:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iedmO-000642-0A; Tue, 10 Dec 2019 11:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ERUJ=2A=amazon.com=prvs=2402c4381=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iedmM-00063x-En
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 11:34:10 +0000
X-Inumbo-ID: fb94f6ea-1b40-11ea-8925-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb94f6ea-1b40-11ea-8925-12813bfff9fa;
 Tue, 10 Dec 2019 11:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575977651; x=1607513651;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LiFxV5CMEgQkjnYID39q3GkTj66kaKL32UVp4mkfoWE=;
 b=A0wGIOnq0ydzsrWDBRlaFB5NPQR3q2WojLbHqReGvRanBYIZdu4VppPU
 wi3jQ5Zhg8DdJLTlVtISAzSxqvWsMmwhbDkhk354Gz0aTevyrjRu2KNf6
 2dxfz3QaO88sx7WLlkVISIBdN3Cqo+o6qF4XNRR753hLyvKURp7zVqpxU c=;
IronPort-SDR: WWOuSsbCzQsAsTwmiQW5IQY5gg45/0r6yBSltupOCgJaPa5P85qzAkkAeK5mgT2E7hELLdE8o4
 scVo+4P4NYOw==
X-IronPort-AV: E=Sophos;i="5.69,299,1571702400"; 
   d="scan'208";a="7827202"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 10 Dec 2019 11:34:09 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-6e2fc477.us-west-2.amazon.com (Postfix) with ESMTPS
 id 57613A1F2B; Tue, 10 Dec 2019 11:34:07 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 11:34:06 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 10 Dec 2019 11:34:05 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 10 Dec 2019 11:34:04 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 10 Dec 2019 11:33:43 +0000
Message-ID: <20191210113347.3404-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 0/4] xen-blkback: support live update
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
c2VkCiAgeGVuL2ludGVyZmFjZTogcmUtZGVmaW5lIEZST05UL0JBQ0tfUklOR19BVFRBQ0goKQog
IHhlbi1ibGtiYWNrOiBzdXBwb3J0IGR5bmFtaWMgdW5iaW5kL2JpbmQKCiBkcml2ZXJzL2Jsb2Nr
L3hlbi1ibGtiYWNrL3hlbmJ1cy5jICAgICAgICAgfCA1OSArKysrKysrKysrKysrKystLS0tLS0t
CiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzLmggICAgICAgICAgICAgICAgfCAgMiAtCiBkcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMgICAgICAgICAgfCAzNSArKysrLS0tLS0tLS0t
CiBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyAgfCAgMSAtCiBkcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Zyb250ZW5kLmMgfCAyNCArKysrKysrKy0KIGlu
Y2x1ZGUveGVuL2ludGVyZmFjZS9pby9yaW5nLmggICAgICAgICAgICB8IDI5ICsrKystLS0tLS0t
CiBpbmNsdWRlL3hlbi94ZW5idXMuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiA3IGZp
bGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDY3IGRlbGV0aW9ucygtKQotLS0KQ2M6IEJv
cmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKZW5zIEF4Ym9l
IDxheGJvZUBrZXJuZWwuZGs+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNj
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiAiUm9n
ZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
