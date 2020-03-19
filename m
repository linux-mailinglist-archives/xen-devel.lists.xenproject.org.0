Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D94218B299
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 12:51:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEteY-00015F-27; Thu, 19 Mar 2020 11:47:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UtS+=5E=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jEteW-000154-9K
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 11:47:56 +0000
X-Inumbo-ID: 78e5cf5e-69d7-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78e5cf5e-69d7-11ea-92cf-bc764e2007e4;
 Thu, 19 Mar 2020 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KYhwuqedCy2ozcekcBLc63wNJ6xnOM+UTgit0NSbGJc=; b=g+0/xHDhrkz4eyu2fUPQz+81A9
 9PQdrVF+/gXXyUcX8TObfBKxVzO2vm5QkLrwOp9z7rJiUBK6Y6g/0VqMR4gqkxbpSabSWm4YK96Um
 j3ppSVPSyJHGRSWkusSmdUU+651vD5n09/Znzo3YkTr/V4oieacVXdfTZ5ke1J/TLv5g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jEteU-0007SK-U0; Thu, 19 Mar 2020 11:47:54 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jEteU-0008Up-KL; Thu, 19 Mar 2020 11:47:54 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 19 Mar 2020 11:47:47 +0000
Message-Id: <20200319114748.5168-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200319114748.5168-1-paul@xen.org>
References: <20200319114748.5168-1-paul@xen.org>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/2] libxl: create domain 'error' node in
 xenstore
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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
cGF1bEB4ZW4ub3JnPgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Q2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBhbmRvYyB8IDUgKysrKysKIHRvb2xzL2xp
YnhsL2xpYnhsX2NyZWF0ZS5jICAgICAgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kb2NzL21pc2MveGVuc3RvcmUtcGF0aHMucGFuZG9jIGIv
ZG9jcy9taXNjL3hlbnN0b3JlLXBhdGhzLnBhbmRvYwppbmRleCAwYTZiMzYxNDZlLi5lMmFiNWRh
NTRlIDEwMDY0NAotLS0gYS9kb2NzL21pc2MveGVuc3RvcmUtcGF0aHMucGFuZG9jCisrKyBiL2Rv
Y3MvbWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MKQEAgLTUzOSw2ICs1MzksMTEgQEAgYWRkcmVz
cyB3cml0dGVuIGluIG9uZSBvZiB0aGVzZSBwYXRocyB0bywgZm9yIGV4YW1wbGUsIGVzdGFibGlz
aCBhIFZOQwogc2Vzc2lvbiB0byB0aGUgZ3Vlc3QgKGFsdGhvdWdoIGNsZWFybHkgc29tZSBsZXZl
bCBvZiB0cnVzdCBpcyBwbGFjZWQKIGluIHRoZSB2YWx1ZSBzdXBwbGllZCBieSB0aGUgZ3Vlc3Qg
aW4gdGhpcyBjYXNlKS4KIAorIyMjIyB+L2Vycm9yIFt3XQorCitBIGRvbWFpbiB3cml0YWJsZSBw
YXRoIHVzZWQgYnkgc29tZSBQViBkcml2ZXJzIHRvIHBhc3MgZXJyb3IgbWVzc2FnZXMKK3RvIHRo
ZSB0b29sc3RhY2suCisKICMjIyBQYXRocyBwcml2YXRlIHRvIHRoZSB0b29sc3RhY2sKIAogIyMj
IyB+L2RldmljZS1tb2RlbC8kRE9NSUQvc3RhdGUgW3ddCmRpZmYgLS1naXQgYS90b29scy9saWJ4
bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4IDc3MjM0
NGM2NDguLmUxOGFhZDQzYjUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5j
CisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC03OTcsNiArNzk3LDkgQEAgcmV0
cnlfdHJhbnNhY3Rpb246CiAgICAgbGlieGxfX3hzX21rbm9kKGdjLCB0LAogICAgICAgICAgICAg
ICAgICAgICBHQ1NQUklOVEYoIiVzL2F0dHIiLCBkb21fcGF0aCksCiAgICAgICAgICAgICAgICAg
ICAgIHJ3cGVybSwgQVJSQVlfU0laRShyd3Blcm0pKTsKKyAgICBsaWJ4bF9feHNfbWtub2QoZ2Ms
IHQsCisgICAgICAgICAgICAgICAgICAgIEdDU1BSSU5URigiJXMvZXJyb3IiLCBkb21fcGF0aCks
CisgICAgICAgICAgICAgICAgICAgIHJ3cGVybSwgQVJSQVlfU0laRShyd3Blcm0pKTsKIAogICAg
IGlmIChsaWJ4bF9kZWZib29sX3ZhbChpbmZvLT5kcml2ZXJfZG9tYWluKSkgewogICAgICAgICAv
KgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
