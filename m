Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5815F117622
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 20:46:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieOwa-00047s-0h; Mon, 09 Dec 2019 19:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xl4W=Z7=amazon.com=prvs=239a0b868=sjpark@srs-us1.protection.inumbo.net>)
 id 1ieOwZ-00047n-7G
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 19:43:43 +0000
X-Inumbo-ID: 33b17876-1abc-11ea-88e7-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33b17876-1abc-11ea-88e7-bc764e2007e4;
 Mon, 09 Dec 2019 19:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575920621; x=1607456621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ZE8Q93B/xx3iZvNs636Is5jtO2+LQkQ6Lgs21sPQn/A=;
 b=Owu+QPQIjv2f8tUabGLqsL1q+ekUcLpz74hBHyP8gY4GHuL5djQgALn8
 FOLFy4hcqq04zd5/wqKWi9YgRVYr6azWp4243+E0+2SNm4vKwyS0NsN2F
 YQc9y68xN8E4jIgRpME5U5MOZtvOZ+fdr5vv4xBR5NNEmvWnr2wLCDz1r g=;
IronPort-SDR: DqI3zjyrOzxNYdeRltiX532bxf3sUW/N/wlytvrCz+1pyT/fux9KBZDaFvtx4cvvK10MayqtRC
 +GVxKnIid+5A==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; 
   d="scan'208";a="8315187"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 09 Dec 2019 19:43:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2A552A1CAF; Mon,  9 Dec 2019 19:43:39 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 19:43:38 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.161.179) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 19:43:33 +0000
From: SeongJae Park <sjpark@amazon.com>
To: <sjpark@amazon.com>
Date: Mon, 9 Dec 2019 20:43:04 +0100
Message-ID: <20191209194305.20828-2-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209194305.20828-1-sjpark@amazon.com>
References: <20191209194305.20828-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.161.179]
X-ClientProxiedBy: EX13D30UWC003.ant.amazon.com (10.43.162.122) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 1/2] xenbus/backend: Add memory pressure
 handler callback
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KCkdyYW50aW5nIHBhZ2VzIGNv
bnN1bWVzIGJhY2tlbmQgc3lzdGVtIG1lbW9yeS4gIEluIHN5c3RlbXMgY29uZmlndXJlZAp3aXRo
IGluc3VmZmljaWVudCBzcGFyZSBtZW1vcnkgZm9yIHRob3NlIHBhZ2VzLCBpdCBjYW4gY2F1c2Ug
YSBtZW1vcnkKcHJlc3N1cmUgc2l0dWF0aW9uLiAgSG93ZXZlciwgZmluZGluZyB0aGUgb3B0aW1h
bCBhbW91bnQgb2YgdGhlIHNwYXJlCm1lbW9yeSBpcyBjaGFsbGVuZ2luZyBmb3IgbGFyZ2Ugc3lz
dGVtcyBoYXZpbmcgZHluYW1pYyByZXNvdXJjZQp1dGlsaXphdGlvbiBwYXR0ZXJucy4gIEFsc28s
IHN1Y2ggYSBzdGF0aWMgY29uZmlndXJhdGlvbiBtaWdodCBsYWNrcyBhCmZsZXhpYmlsaXR5LgoK
VG8gbWl0aWdhdGUgc3VjaCBwcm9ibGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSByZWNs
YWltIGNhbGxiYWNrIHRvCid4ZW5idXNfZHJpdmVyJy4gIFVzaW5nIHRoaXMgZmFjaWxpdHksICd4
ZW5idXMnIHdvdWxkIGJlIGFibGUgdG8gbW9uaXRvcgphIG1lbW9yeSBwcmVzc3VyZSBhbmQgcmVx
dWVzdCBzcGVjaWZpYyBkb21haW5zIG9mIHNwZWNpZmljIGJhY2tlbmQKZHJpdmVycyB3aGljaCBj
YXVzaW5nIHRoZSBnaXZlbiBwcmVzc3VyZSB0byB2b2x1bnRhcmlseSByZWxlYXNlIGl0cwptZW1v
cnkuCgpUaGF0IHNhaWQsIHRoaXMgY29tbWl0IHNpbXBseSByZXF1ZXN0cyBldmVyeSBjYWxsYmFj
ayByZWdpc3RlcmVkIGRyaXZlcgp0byByZWxlYXNlIGl0cyBtZW1vcnkgZm9yIGV2ZXJ5IGRvbWFp
biwgcmF0aGVyIHRoYW4gaXNzdWVpbmcgdGhlCnJlcXVlc3RzIHRvIHRoZSBkcml2ZXJzIGFuZCBk
b21haW4gaW4gY2hhcmdlLiAgU3VjaCB0aGluZ3Mgd291bGQgYmUgYQpmdXR1cmUgd29yay4gIEFs
c28sIHRoaXMgY29tbWl0IGZvY3VzZXMgb24gbWVtb3J5IG9ubHkuICBIb3dldmVyLCBpdAp3b3Vs
ZCBiZSBhYmx0IHRvIGJlIGV4dGVuZGVkIGZvciBnZW5lcmFsIHJlc291cmNlcy4KClNpZ25lZC1v
ZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6b24uZGU+Ci0tLQogZHJpdmVycy94ZW4v
eGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysr
KwogaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAyIGZp
bGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94
ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNf
cHJvYmVfYmFja2VuZC5jCmluZGV4IGIwYmVkNGZhZjQ0Yy4uY2Q1ZmQxY2Q4ZGUzIDEwMDY0NAot
LS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYworKysgYi9kcml2
ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYwpAQCAtMjQ4LDYgKzI0OCwzNCBA
QCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dhdGNoKHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqbm90aWZpZXIsCiAJcmV0dXJuIE5PVElGWV9ET05FOwogfQogCitzdGF0aWMgaW50IHhlbmJ1
c19iYWNrZW5kX3JlY2xhaW0oc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRhKQoreworCXN0
cnVjdCB4ZW5idXNfZHJpdmVyICpkcnY7CisJaWYgKCFkZXYtPmRyaXZlcikKKwkJcmV0dXJuIC1F
Tk9FTlQ7CisJZHJ2ID0gdG9feGVuYnVzX2RyaXZlcihkZXYtPmRyaXZlcik7CisJaWYgKGRydiAm
JiBkcnYtPnJlY2xhaW0pCisJCWRydi0+cmVjbGFpbSh0b194ZW5idXNfZGV2aWNlKGRldiksIERP
TUlEX0lOVkFMSUQpOworCXJldHVybiAwOworfQorCisvKgorICogUmV0dXJucyAwIGFsd2F5cyBi
ZWNhdXNlIHdlIGFyZSB1c2luZyBzaHJpbmtlciB0byBvbmx5IGRldGVjdCBtZW1vcnkKKyAqIHBy
ZXNzdXJlLgorICovCitzdGF0aWMgdW5zaWduZWQgbG9uZyB4ZW5idXNfYmFja2VuZF9zaHJpbmtf
Y291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwKKwkJCQlzdHJ1Y3Qgc2hyaW5rX2NvbnRy
b2wgKnNjKQoreworCWJ1c19mb3JfZWFjaF9kZXYoJnhlbmJ1c19iYWNrZW5kLmJ1cywgTlVMTCwg
TlVMTCwKKwkJCXhlbmJ1c19iYWNrZW5kX3JlY2xhaW0pOworCXJldHVybiAwOworfQorCitzdGF0
aWMgc3RydWN0IHNocmlua2VyIHhlbmJ1c19iYWNrZW5kX3Nocmlua2VyID0geworCS5jb3VudF9v
YmplY3RzID0geGVuYnVzX2JhY2tlbmRfc2hyaW5rX2NvdW50LAorCS5zZWVrcyA9IERFRkFVTFRf
U0VFS1MsCit9OworCiBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfcHJvYmVfYmFja2VuZF9pbml0
KHZvaWQpCiB7CiAJc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayB4ZW5zdG9yZV9ub3RpZmll
ciA9IHsKQEAgLTI2NCw2ICsyOTIsOSBAQCBzdGF0aWMgaW50IF9faW5pdCB4ZW5idXNfcHJvYmVf
YmFja2VuZF9pbml0KHZvaWQpCiAKIAlyZWdpc3Rlcl94ZW5zdG9yZV9ub3RpZmllcigmeGVuc3Rv
cmVfbm90aWZpZXIpOwogCisJaWYgKHJlZ2lzdGVyX3Nocmlua2VyKCZ4ZW5idXNfYmFja2VuZF9z
aHJpbmtlcikpCisJCXByX3dhcm4oInNocmlua2VyIHJlZ2lzdHJhdGlvbiBmYWlsZWRcbiIpOwor
CiAJcmV0dXJuIDA7CiB9CiBzdWJzeXNfaW5pdGNhbGwoeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5p
dCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW5idXMuaCBiL2luY2x1ZGUveGVuL3hlbmJ1
cy5oCmluZGV4IDg2OWM4MTZkNWY4Yy4uNTJhYWY0Zjc4NDAwIDEwMDY0NAotLS0gYS9pbmNsdWRl
L3hlbi94ZW5idXMuaAorKysgYi9pbmNsdWRlL3hlbi94ZW5idXMuaApAQCAtMTA0LDYgKzEwNCw3
IEBAIHN0cnVjdCB4ZW5idXNfZHJpdmVyIHsKIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBkcml2ZXI7
CiAJaW50ICgqcmVhZF9vdGhlcmVuZF9kZXRhaWxzKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2
KTsKIAlpbnQgKCppc19yZWFkeSkoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CisJdW5zaWdu
ZWQgKCpyZWNsYWltKShzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LCBkb21pZF90IGRvbWlkKTsK
IH07CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHhlbmJ1c19kcml2ZXIgKnRvX3hlbmJ1c19kcml2
ZXIoc3RydWN0IGRldmljZV9kcml2ZXIgKmRydikKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
