Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B991517385C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 14:30:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7fgr-0006Se-MO; Fri, 28 Feb 2020 13:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncfg=4Q=amazon.co.uk=prvs=320a9563e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7fgq-0006SR-Ti
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:28:28 +0000
X-Inumbo-ID: 33e3572c-5a2e-11ea-9c17-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33e3572c-5a2e-11ea-9c17-bc764e2007e4;
 Fri, 28 Feb 2020 13:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582896508; x=1614432508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IIPO1W2DLOiz3N+ViDmVAGukygPguvOI3oWjQG1Lv4Y=;
 b=HpjPcDNdWy4p8HJlqpkRaibqqmnhwUY28V9Jocl5luOrlbyHT5rwwJcU
 H1RrbPxUaFbotzktVMd0yUjrh+N9ix+3upkhWJqjbwNf9xKi2SyhVUAlF
 0k0HHDKFx/C3Pled98wSTA8U7ETGSqBGYWqUgbPxGRLvld/97GcaP3KEF w=;
IronPort-SDR: vVEokuDxccK8SkLKiE57P7eK2rBJ8ByHHn1dO9+b4ID6nrwBHg+956DFgsYij6KisgqCrYIEG/
 9tpx6+zw/mSw==
X-IronPort-AV: E=Sophos;i="5.70,496,1574121600"; d="scan'208";a="29495744"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 28 Feb 2020 13:28:27 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id A89BBA2D35; Fri, 28 Feb 2020 13:28:26 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 28 Feb 2020 13:28:12 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 28 Feb 2020 13:28:11 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Fri, 28 Feb 2020 13:28:09 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 28 Feb 2020 13:27:45 +0000
Message-ID: <20200228132749.2929-3-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228132749.2929-1-pdurrant@amazon.com>
References: <20200228132749.2929-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 2/6] x86 / p2m: remove page_list check in
 p2m_alloc_table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgZG9lcyBub3Qgc2VlbSB0byBiZSBhbnkganVzdGlmaWNhdGlvbiBmb3IgcmVmdXNpbmcg
dG8gY3JlYXRlIHRoZQpkb21haW4ncyBwMm0gdGFibGUgc2ltcGx5IGJlY2F1c2UgaXQgbWF5IGhh
dmUgYXNzaWduZWQgcGFnZXMuIFBhcnRpY3VsYXJseQppdCBwcmV2ZW50cyB0aGUgcHJpb3IgYWxs
b2NhdGlvbiBvZiBQR0NfZXh0cmEgcGFnZXMuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdl
b3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhl
bi5vcmc+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKdjI6
CiAtIE5ldyBpbiB2MgotLS0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDggLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCAzNzE5ZGVhZTc3Li45ZmQ0YjEx
NWJlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2
L21tL3AybS5jCkBAIC02OTUsMTQgKzY5NSw2IEBAIGludCBwMm1fYWxsb2NfdGFibGUoc3RydWN0
IHAybV9kb21haW4gKnAybSkKIAogICAgIHAybV9sb2NrKHAybSk7CiAKLSAgICBpZiAoIHAybV9p
c19ob3N0cDJtKHAybSkKLSAgICAgICAgICYmICFwYWdlX2xpc3RfZW1wdHkoJmQtPnBhZ2VfbGlz
dCkgKQotICAgIHsKLSAgICAgICAgUDJNX0VSUk9SKCJkb20gJWQgYWxyZWFkeSBoYXMgbWVtb3J5
IGFsbG9jYXRlZFxuIiwgZC0+ZG9tYWluX2lkKTsKLSAgICAgICAgcDJtX3VubG9jayhwMm0pOwot
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICB9Ci0KICAgICBpZiAoIHBhZ2V0YWJsZV9nZXRf
cGZuKHAybV9nZXRfcGFnZXRhYmxlKHAybSkpICE9IDAgKQogICAgIHsKICAgICAgICAgUDJNX0VS
Uk9SKCJwMm0gYWxyZWFkeSBhbGxvY2F0ZWQgZm9yIHRoaXMgZG9tYWluXG4iKTsKLS0gCjIuMjAu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
