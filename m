Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED98014EE6B
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:28:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXFD-000228-VD; Fri, 31 Jan 2020 14:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dp7M=3U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ixXFB-00021i-Od
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:26:01 +0000
X-Inumbo-ID: 9a9fa362-4435-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a9fa362-4435-11ea-a933-bc764e2007e4;
 Fri, 31 Jan 2020 14:26:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 33FFEABB3;
 Fri, 31 Jan 2020 14:26:00 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 31 Jan 2020 15:25:57 +0100
Message-Id: <20200131142557.2896-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] tools/xenstore: don't apply write limiting for
 privileged domain
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuc3RvcmUgd3JpdGUgbGltaXRpbmcgc2hvdWxkIG5vdCBiZSBhcHBsaWVkIHRvIGRvbTAuIFVu
Zm9ydHVuYXRlbHkKd3JpdGUgbGltaXRpbmcgaXMgZGlzYWJsZWQgb25seSBmb3IgY29ubmVjdGlv
bnMgdmlhIHNvY2tldHMuIFdoZW4KcnVubmluZyBpbiBhIHN0dWJkb20gWGVuc3RvcmUgd2lsbCBh
cHBseSB3cml0ZSBsaW1pdGluZyB0byBkb20wLCB0b28uCkNoYW5nZSB0aGF0IGJ5IHRlc3Rpbmcg
Zm9yIHRoZSBkb21haW4gdG8gYmUgcHJpdmlsZWdlZCBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHRvb2xzL3hlbnN0b3JlL3hlbnN0
b3JlZF9kb21haW4uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9t
YWluLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWluLmMKaW5kZXggMWE4MzA5Nzk1
Mi4uYzdjNmM1NzRkZiAxMDA2NDQKLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFp
bi5jCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYwpAQCAtOTE4LDggKzkx
OCw4IEBAIHZvaWQgd3JsX2FwcGx5X2RlYml0X2FjdHVhbChzdHJ1Y3QgZG9tYWluICpkb21haW4p
CiB7CiAJc3RydWN0IHdybF90aW1lc3RhbXB0IG5vdzsKIAotCWlmICghZG9tYWluKQotCQkvKiBz
b2NrZXRzIGVzY2FwZSB0aGUgd3JpdGUgcmF0ZSBsaW1pdCAqLworCWlmICghZG9tYWluIHx8ICFk
b21pZF9pc191bnByaXZpbGVnZWQoZG9tYWluLT5kb21pZCkpCisJCS8qIHNvY2tldHMgYW5kIGRv
bTAgZXNjYXBlIHRoZSB3cml0ZSByYXRlIGxpbWl0ICovCiAJCXJldHVybjsKIAogCXdybF9nZXR0
aW1lX25vdygmbm93KTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
