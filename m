Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751117A517
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 13:17:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9pOb-0005gX-HV; Thu, 05 Mar 2020 12:14:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BTO=4W=amzn.com=prvs=326a7180f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j9pOa-0005gS-FM
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 12:14:32 +0000
X-Inumbo-ID: de66aab8-5eda-11ea-8eb5-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de66aab8-5eda-11ea-8eb5-bc764e2007e4;
 Thu, 05 Mar 2020 12:14:32 +0000 (UTC)
IronPort-SDR: 0RAc53iAnGJ3KrqDxXbB4NAx1roQW/p+RGvzo1vmsbNoT+GGnVqvU2P3VblaNOjreDj9gUAck3
 71qiKqwKoM5g==
X-IronPort-AV: E=Sophos;i="5.70,517,1574121600"; d="scan'208";a="21055607"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-c5104f52.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 05 Mar 2020 12:14:29 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-c5104f52.us-west-2.amazon.com (Postfix) with ESMTPS
 id D388BA20EF; Thu,  5 Mar 2020 12:14:28 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 5 Mar 2020 12:14:28 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Mar 2020 12:14:27 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 5 Mar 2020 12:14:24 +0000
From: <pdurrant@amzn.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 5 Mar 2020 12:14:16 +0000
Message-ID: <20200305121417.16583-2-pdurrant@amzn.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200305121417.16583-1-pdurrant@amzn.com>
References: <20200305121417.16583-1-pdurrant@amzn.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v2 1/2] libxl: create domain 'error' node in
 xenstore
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKU2V2ZXJhbCBQViBkcml2
ZXJzIChib3RoIGhpc3RvcmljYWxseSBhbmQgY3VycmVudGx5IFsxXSkgcmVwb3J0IGVycm9ycwpi
eSB3cml0aW5nIHRleHQgaW50byAvbG9jYWwvZG9tYWluLyRET01JRC9lcnJvci4gVGhpcyBwYXRj
aCBjcmVhdGVzIHRoZQpub2RlIGluIGxpYnhsIGFuZCBtYWtlcyBpdCB3cml0YWJsZSBieSB0aGUg
ZG9tYWluLCBhbmQgYWxzbyBhZGRzIHNvbWUKdGV4dCBpbnRvIHhlbnN0b3JlLXBhdGhzLnBhbmRv
YyB0byBzdGF0ZSB3aGF0IHRoZSBub2RlIGlzIGZvci4KClsxXSBodHRwczovL3hlbmJpdHMueGVu
Lm9yZy9naXR3ZWIvP3A9cHZkcml2ZXJzL3dpbi94ZW52aWYuZ2l0O2E9YmxvYjtmPXNyYy94ZW52
aWYvZnJvbnRlbmQuYztoYj1IRUFEI2w0NTkKClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGR1cnJhbnRAYW1hem9uLmNvbT4KQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CkNjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgotLS0KIGRvY3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MgfCA1ICsrKysrCiB0
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgICAgIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBh
bmRvYyBiL2RvY3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MKaW5kZXggMGE2YjM2MTQ2ZS4u
ZTJhYjVkYTU0ZSAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBhbmRvYwor
KysgYi9kb2NzL21pc2MveGVuc3RvcmUtcGF0aHMucGFuZG9jCkBAIC01MzksNiArNTM5LDExIEBA
IGFkZHJlc3Mgd3JpdHRlbiBpbiBvbmUgb2YgdGhlc2UgcGF0aHMgdG8sIGZvciBleGFtcGxlLCBl
c3RhYmxpc2ggYSBWTkMKIHNlc3Npb24gdG8gdGhlIGd1ZXN0IChhbHRob3VnaCBjbGVhcmx5IHNv
bWUgbGV2ZWwgb2YgdHJ1c3QgaXMgcGxhY2VkCiBpbiB0aGUgdmFsdWUgc3VwcGxpZWQgYnkgdGhl
IGd1ZXN0IGluIHRoaXMgY2FzZSkuCiAKKyMjIyMgfi9lcnJvciBbd10KKworQSBkb21haW4gd3Jp
dGFibGUgcGF0aCB1c2VkIGJ5IHNvbWUgUFYgZHJpdmVycyB0byBwYXNzIGVycm9yIG1lc3NhZ2Vz
Cit0byB0aGUgdG9vbHN0YWNrLgorCiAjIyMgUGF0aHMgcHJpdmF0ZSB0byB0aGUgdG9vbHN0YWNr
CiAKICMjIyMgfi9kZXZpY2UtbW9kZWwvJERPTUlEL3N0YXRlIFt3XQpkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwppbmRl
eCA3ODkxZmFlNDI2Li5mYjdiMzk5OWFlIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9j
cmVhdGUuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwpAQCAtNzk3LDYgKzc5Nyw5
IEBAIHJldHJ5X3RyYW5zYWN0aW9uOgogICAgIGxpYnhsX194c19ta25vZChnYywgdCwKICAgICAg
ICAgICAgICAgICAgICAgR0NTUFJJTlRGKCIlcy9hdHRyIiwgZG9tX3BhdGgpLAogICAgICAgICAg
ICAgICAgICAgICByd3Blcm0sIEFSUkFZX1NJWkUocndwZXJtKSk7CisgICAgbGlieGxfX3hzX21r
bm9kKGdjLCB0LAorICAgICAgICAgICAgICAgICAgICBHQ1NQUklOVEYoIiVzL2Vycm9yIiwgZG9t
X3BhdGgpLAorICAgICAgICAgICAgICAgICAgICByd3Blcm0sIEFSUkFZX1NJWkUocndwZXJtKSk7
CiAKICAgICBpZiAobGlieGxfZGVmYm9vbF92YWwoaW5mby0+ZHJpdmVyX2RvbWFpbikpIHsKICAg
ICAgICAgLyoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
