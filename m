Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59C149FD6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 09:24:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivzbv-0001Xk-Or; Mon, 27 Jan 2020 08:19:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y5+q=3Q=amazon.com=prvs=288afea8f=sjpark@srs-us1.protection.inumbo.net>)
 id 1ivzbu-0001XT-8d
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 08:19:06 +0000
X-Inumbo-ID: ae3d2bde-40dd-11ea-84ee-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae3d2bde-40dd-11ea-84ee-12813bfff9fa;
 Mon, 27 Jan 2020 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580113145; x=1611649145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AlgYXHZVMr+gkDp34KurcKlh0X9TRVaRFfmS+SsrAhM=;
 b=C1irDws5oV09JZu3Z4+RnpzDvptNqC3q5AsPRJfnXLmfWm85gqM1OS3x
 p8kvT/KlSNrH4sWqJi6dZoaROGB2XLl1uxpD86SudngKcnmK4L2LuDNI7
 XGGQ4LW7Lg2cDvIlocCKb/GRd/ezUe3idtJo8RmeTewzYPsm4YpECXiW+ U=;
IronPort-SDR: uMkQlNiB9w5LHs1zA7FOvJdLJiQC00IV2UorSjll8vNCEJaZKnmwAqbu3FMlvy4oKtfAHCugov
 90/hYLNt0awA==
X-IronPort-AV: E=Sophos;i="5.70,369,1574121600"; d="scan'208";a="22599795"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Jan 2020 08:18:43 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id BBF46A22CE; Mon, 27 Jan 2020 08:18:42 +0000 (UTC)
Received: from EX13D31EUA001.ant.amazon.com (10.43.165.15) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 08:18:42 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.43.160.8) by
 EX13D31EUA001.ant.amazon.com (10.43.165.15) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 08:18:37 +0000
From: <sjpark@amazon.com>
To: <jgross@suse.com>, <roger.pau@citrix.com>, <axboe@kernel.dk>
Date: Mon, 27 Jan 2020 09:18:08 +0100
Message-ID: <20200127081812.21216-2-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127081812.21216-1-sjpark@amazon.com>
References: <20200127081812.21216-1-sjpark@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.160.8]
X-ClientProxiedBy: EX13D11UWB004.ant.amazon.com (10.43.161.90) To
 EX13D31EUA001.ant.amazon.com (10.43.165.15)
Precedence: Bulk
Subject: [Xen-devel] [PATCH v14 1/5] xenbus/backend: Add memory pressure
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
Cc: konrad.wilk@oracle.com, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org
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
IHN1Y2ggYSBzdGF0aWMgY29uZmlndXJhdGlvbiBtaWdodCBsYWNrCmZsZXhpYmlsaXR5LgoKVG8g
bWl0aWdhdGUgc3VjaCBwcm9ibGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSByZWNsYWlt
IGNhbGxiYWNrIHRvCid4ZW5idXNfZHJpdmVyJy4gIElmIGEgbWVtb3J5IHByZXNzdXJlIGlzIGRl
dGVjdGVkLCAneGVuYnVzJyByZXF1ZXN0cwpldmVyeSBiYWNrZW5kIGRyaXZlciB0byB2b2x1bmFy
aWx5IHJlbGVhc2UgaXRzIG1lbW9yeS4KCk5vdGUgdGhhdCBpdCB3b3VsZCBiZSBhYmxlIHRvIGlt
cHJvdmUgdGhlIGNhbGxiYWNrIGZhY2lsaXR5IGZvciBtb3JlCnNvcGhpc3RpY2F0ZWQgaGFuZGxp
bmdzIG9mIGdlbmVyYWwgcHJlc3N1cmVzLiAgRm9yIGV4YW1wbGUsIGl0IHdvdWxkIGJlCnBvc3Np
YmxlIHRvIG1vbml0b3IgdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBvZiBlYWNoIGRldmljZSBhbmQg
aXNzdWUgdGhlCnJlbGVhc2UgcmVxdWVzdHMgdG8gb25seSBkZXZpY2VzIHdoaWNoIGNhdXNpbmcg
dGhlIHByZXNzdXJlLiAgQWxzbywgdGhlCmNhbGxiYWNrIGNvdWxkIGJlIGV4dGVuZGVkIHRvIGhh
bmRsZSBub3Qgb25seSBtZW1vcnksIGJ1dCBnZW5lcmFsCnJlc291cmNlcy4gIE5ldmVydGhlbGVz
cywgdGhpcyB2ZXJzaW9uIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBkZWZlcnMgc3VjaApzb3BoaXN0
aWNhdGVkIGdvYWxzIGFzIGEgZnV0dXJlIHdvcmsuCgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsgPHNqcGFya0BhbWF6
b24uZGU+Ci0tLQogZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZV9iYWNrZW5kLmMgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQuYyBiL2Ry
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmVfYmFja2VuZC5jCmluZGV4IDE0ODc2ZmFmZjNi
MC4uM2I1Y2I3YTVhN2U0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3By
b2JlX2JhY2tlbmQuYworKysgYi9kcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tl
bmQuYwpAQCAtMjQ3LDYgKzI0NywzNSBAQCBzdGF0aWMgaW50IGJhY2tlbmRfcHJvYmVfYW5kX3dh
dGNoKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCiAJcmV0dXJuIE5PVElGWV9ET05F
OwogfQogCitzdGF0aWMgaW50IGJhY2tlbmRfcmVjbGFpbV9tZW1vcnkoc3RydWN0IGRldmljZSAq
ZGV2LCB2b2lkICpkYXRhKQoreworCWNvbnN0IHN0cnVjdCB4ZW5idXNfZHJpdmVyICpkcnY7CisK
KwlpZiAoIWRldi0+ZHJpdmVyKQorCQlyZXR1cm4gMDsKKwlkcnYgPSB0b194ZW5idXNfZHJpdmVy
KGRldi0+ZHJpdmVyKTsKKwlpZiAoZHJ2ICYmIGRydi0+cmVjbGFpbV9tZW1vcnkpCisJCWRydi0+
cmVjbGFpbV9tZW1vcnkodG9feGVuYnVzX2RldmljZShkZXYpKTsKKwlyZXR1cm4gMDsKK30KKwor
LyoKKyAqIFJldHVybnMgMCBhbHdheXMgYmVjYXVzZSB3ZSBhcmUgdXNpbmcgc2hyaW5rZXIgdG8g
b25seSBkZXRlY3QgbWVtb3J5CisgKiBwcmVzc3VyZS4KKyAqLworc3RhdGljIHVuc2lnbmVkIGxv
bmcgYmFja2VuZF9zaHJpbmtfbWVtb3J5X2NvdW50KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIs
CisJCQkJc3RydWN0IHNocmlua19jb250cm9sICpzYykKK3sKKwlidXNfZm9yX2VhY2hfZGV2KCZ4
ZW5idXNfYmFja2VuZC5idXMsIE5VTEwsIE5VTEwsCisJCQliYWNrZW5kX3JlY2xhaW1fbWVtb3J5
KTsKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIHN0cnVjdCBzaHJpbmtlciBiYWNrZW5kX21lbW9y
eV9zaHJpbmtlciA9IHsKKwkuY291bnRfb2JqZWN0cyA9IGJhY2tlbmRfc2hyaW5rX21lbW9yeV9j
b3VudCwKKwkuc2Vla3MgPSBERUZBVUxUX1NFRUtTLAorfTsKKwogc3RhdGljIGludCBfX2luaXQg
eGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCh2b2lkKQogewogCXN0YXRpYyBzdHJ1Y3Qgbm90aWZp
ZXJfYmxvY2sgeGVuc3RvcmVfbm90aWZpZXIgPSB7CkBAIC0yNjMsNiArMjkyLDkgQEAgc3RhdGlj
IGludCBfX2luaXQgeGVuYnVzX3Byb2JlX2JhY2tlbmRfaW5pdCh2b2lkKQogCiAJcmVnaXN0ZXJf
eGVuc3RvcmVfbm90aWZpZXIoJnhlbnN0b3JlX25vdGlmaWVyKTsKIAorCWlmIChyZWdpc3Rlcl9z
aHJpbmtlcigmYmFja2VuZF9tZW1vcnlfc2hyaW5rZXIpKQorCQlwcl93YXJuKCJzaHJpbmtlciBy
ZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsKKwogCXJldHVybiAwOwogfQogc3Vic3lzX2luaXRjYWxs
KHhlbmJ1c19wcm9iZV9iYWNrZW5kX2luaXQpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4veGVu
YnVzLmggYi9pbmNsdWRlL3hlbi94ZW5idXMuaAppbmRleCAyNDIyOGExMDIxNDEuLjk4MDk1MmVh
NDUyYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS94ZW4veGVuYnVzLmgKKysrIGIvaW5jbHVkZS94ZW4v
eGVuYnVzLmgKQEAgLTEwNSw2ICsxMDUsNyBAQCBzdHJ1Y3QgeGVuYnVzX2RyaXZlciB7CiAJc3Ry
dWN0IGRldmljZV9kcml2ZXIgZHJpdmVyOwogCWludCAoKnJlYWRfb3RoZXJlbmRfZGV0YWlscyko
c3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldik7CiAJaW50ICgqaXNfcmVhZHkpKHN0cnVjdCB4ZW5i
dXNfZGV2aWNlICpkZXYpOworCXZvaWQgKCpyZWNsYWltX21lbW9yeSkoc3RydWN0IHhlbmJ1c19k
ZXZpY2UgKmRldik7CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCB4ZW5idXNfZHJpdmVyICp0
b194ZW5idXNfZHJpdmVyKHN0cnVjdCBkZXZpY2VfZHJpdmVyICpkcnYpCi0tIAoyLjE3LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
