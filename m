Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBDB1703D6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:11:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zF8-0006Pf-Se; Wed, 26 Feb 2020 16:09:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qsxb=4O=amazon.co.uk=prvs=3182d51f9=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6zF7-0006PX-JV
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:09:01 +0000
X-Inumbo-ID: 4cf9d2c2-58b2-11ea-a490-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4cf9d2c2-58b2-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1582733341; x=1614269341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ap6TVYh1jCt1zLW6qVeXBowI3FkVNYBS4UsKMEKoIfk=;
 b=LB5GwcWJqWUFMgzmAtTI3lpBeXyZvRAIPiNTcfd7CL2eTaDoKelC2Lur
 SMUHNn9rw6qhlkLBpzVUp8FvvrExZk9E6USmye3lvMkqvbOXISDe7zbsB
 dQ1ziBcBUAKbf90w8+OXvlmanm4MibdPxyHGQpWv7fhQ9Fwswv9XXtL6t I=;
IronPort-SDR: meL6KR/3gbku/VUV0NIGwpe0QjmyqnC0WEJK1XFslYEW4WKOXH0CE5ResZjdXl0zkBupzpVrUT
 cURXWnns+qyA==
X-IronPort-AV: E=Sophos;i="5.70,488,1574121600"; d="scan'208";a="19264081"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-55156cd4.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 26 Feb 2020 16:08:59 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-55156cd4.us-west-2.amazon.com (Postfix) with ESMTPS
 id 1B066A3036; Wed, 26 Feb 2020 16:08:58 +0000 (UTC)
Received: from EX13D32EUB004.ant.amazon.com (10.43.166.212) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 26 Feb 2020 16:08:57 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUB004.ant.amazon.com (10.43.166.212) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 26 Feb 2020 16:08:56 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 26 Feb 2020 16:08:53 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 16:08:46 +0000
Message-ID: <20200226160848.1854-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226160848.1854-1-pdurrant@amazon.com>
References: <20200226160848.1854-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 1/3] libxl: create domain 'error' node in
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
 Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2V2ZXJhbCBQViBkcml2ZXJzIChib3RoIGhpc3RvcmljYWxseSBhbmQgY3VycmVudGx5IFsxXSkg
cmVwb3J0IGVycm9ycwpieSB3cml0aW5nIHRleHQgaW50byAvbG9jYWwvZG9tYWluLyRET01JRC9l
cnJvci4gVGhpcyBwYXRjaCBjcmVhdGVzIHRoZQpub2RlIGluIGxpYnhsIGFuZCBtYWtlcyBpdCB3
cml0YWJsZSBieSB0aGUgZG9tYWluLCBhbmQgYWxzbyBhZGRzIHNvbWUKdGV4dCBpbnRvIHhlbnN0
b3JlLXBhdGhzLnBhbmRvYyB0byBzdGF0ZSB3aGF0IHRoZSBub2RlIGlzIGZvci4KClsxXSBodHRw
czovL3hlbmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9cHZkcml2ZXJzL3dpbi94ZW52aWYuZ2l0O2E9
YmxvYjtmPXNyYy94ZW52aWYvZnJvbnRlbmQuYztoYj1IRUFEI2w0NTkKClNpZ25lZC1vZmYtYnk6
IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgotLS0KIGRvY3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MgfCA1
ICsrKysrCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgICAgIHwgMyArKysKIDIgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL3hlbnN0b3Jl
LXBhdGhzLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MKaW5kZXggMGE2
YjM2MTQ2ZS4uZTJhYjVkYTU0ZSAxMDA2NDQKLS0tIGEvZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhz
LnBhbmRvYworKysgYi9kb2NzL21pc2MveGVuc3RvcmUtcGF0aHMucGFuZG9jCkBAIC01MzksNiAr
NTM5LDExIEBAIGFkZHJlc3Mgd3JpdHRlbiBpbiBvbmUgb2YgdGhlc2UgcGF0aHMgdG8sIGZvciBl
eGFtcGxlLCBlc3RhYmxpc2ggYSBWTkMKIHNlc3Npb24gdG8gdGhlIGd1ZXN0IChhbHRob3VnaCBj
bGVhcmx5IHNvbWUgbGV2ZWwgb2YgdHJ1c3QgaXMgcGxhY2VkCiBpbiB0aGUgdmFsdWUgc3VwcGxp
ZWQgYnkgdGhlIGd1ZXN0IGluIHRoaXMgY2FzZSkuCiAKKyMjIyMgfi9lcnJvciBbd10KKworQSBk
b21haW4gd3JpdGFibGUgcGF0aCB1c2VkIGJ5IHNvbWUgUFYgZHJpdmVycyB0byBwYXNzIGVycm9y
IG1lc3NhZ2VzCit0byB0aGUgdG9vbHN0YWNrLgorCiAjIyMgUGF0aHMgcHJpdmF0ZSB0byB0aGUg
dG9vbHN0YWNrCiAKICMjIyMgfi9kZXZpY2UtbW9kZWwvJERPTUlEL3N0YXRlIFt3XQpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVh
dGUuYwppbmRleCBjY2M5ZTcwOTkwLi4yNzYyN2NiMTk5IDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwpAQCAtNzk3
LDYgKzc5Nyw5IEBAIHJldHJ5X3RyYW5zYWN0aW9uOgogICAgIGxpYnhsX194c19ta25vZChnYywg
dCwKICAgICAgICAgICAgICAgICAgICAgR0NTUFJJTlRGKCIlcy9hdHRyIiwgZG9tX3BhdGgpLAog
ICAgICAgICAgICAgICAgICAgICByd3Blcm0sIEFSUkFZX1NJWkUocndwZXJtKSk7CisgICAgbGli
eGxfX3hzX21rbm9kKGdjLCB0LAorICAgICAgICAgICAgICAgICAgICBHQ1NQUklOVEYoIiVzL2Vy
cm9yIiwgZG9tX3BhdGgpLAorICAgICAgICAgICAgICAgICAgICByd3Blcm0sIEFSUkFZX1NJWkUo
cndwZXJtKSk7CiAKICAgICBpZiAobGlieGxfZGVmYm9vbF92YWwoaW5mby0+ZHJpdmVyX2RvbWFp
bikpIHsKICAgICAgICAgLyoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
