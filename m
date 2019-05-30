Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB32EBA9
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 05:15:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWBTp-0001Zn-Uv; Thu, 30 May 2019 03:11:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uLyr=T6=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1hWBTo-0001Zc-IH
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 03:11:48 +0000
X-Inumbo-ID: a9038579-8288-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a9038579-8288-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 03:11:47 +0000 (UTC)
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net
 [67.88.213.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A22A244D1;
 Thu, 30 May 2019 03:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559185907;
 bh=k0t5KQDOFfbBweh2TDKsMquyrzON3Gj9IXtzdt7R1cQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vNsijWRhEklZomKs8chbNOblCvLhC+laZqvuQviy4cIQ7qjQMm4+Mwo6L4tmXVItO
 jeL1ExmAlq7XtvvOMWkeemkmbKGNlo0Ibprh2xRxGZOLHuLhV03BK1iml6OfCwI6IT
 ceCwEv02M9F+U6anaPSz+MkfbGSkk6TzVEXPzjS8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 May 2019 20:04:38 -0700
Message-Id: <20190530030555.055576682@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530030540.291644921@linuxfoundation.org>
References: <20190530030540.291644921@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5.1 280/405] block: pass page to
 xen_biovec_phys_mergeable
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, xen-devel@lists.xenproject.org,
 ris Ostrovsky <boris.ostrovsky@oracle.com>, Ming Lei <ming.lei@redhat.com>,
 Omar Sandoval <osandov@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WyBVcHN0cmVhbSBjb21taXQgMDM4M2FkNDM3NGY3YWQ3ZWRkOTI1YTJlZTQ3NTMwMzVjM2Y1NTA4
YSBdCgp4ZW5fYmlvdmVjX3BoeXNfbWVyZ2VhYmxlKCkgb25seSBuZWVkcyAuYnZfcGFnZSBvZiB0
aGUgMm5kIGJpbyBidmVjCmZvciBjaGVja2luZyBpZiB0aGUgdHdvIGJ2ZWNzIGNhbiBiZSBtZXJn
ZWQsIHNvIHBhc3MgcGFnZSB0bwp4ZW5fYmlvdmVjX3BoeXNfbWVyZ2VhYmxlKCkgZGlyZWN0bHku
CgpObyBmdW5jdGlvbiBjaGFuZ2UuCgpDYzogcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5
QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IE9tYXIgU2FuZG92YWwgPG9zYW5kb3ZAZmIu
Y29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8
Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+ClNpZ25lZC1vZmYtYnk6IE1pbmcgTGVpIDxtaW5n
LmxlaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZW5zIEF4Ym9lIDxheGJvZUBrZXJuZWwu
ZGs+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBi
bG9jay9ibGsuaCAgICAgICAgICAgIHwgMiArLQogZHJpdmVycy94ZW4vYmlvbWVyZ2UuYyB8IDUg
KysrLS0KIGluY2x1ZGUveGVuL3hlbi5oICAgICAgfCA0ICsrKy0KIDMgZmlsZXMgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsay5o
IGIvYmxvY2svYmxrLmgKaW5kZXggNWQ2MzZlZTQxNjYzMC4uZTI3ZmQxNTEyZTRiYiAxMDA2NDQK
LS0tIGEvYmxvY2svYmxrLmgKKysrIGIvYmxvY2svYmxrLmgKQEAgLTc1LDcgKzc1LDcgQEAgc3Rh
dGljIGlubGluZSBib29sIGJpb3ZlY19waHlzX21lcmdlYWJsZShzdHJ1Y3QgcmVxdWVzdF9xdWV1
ZSAqcSwKIAogCWlmIChhZGRyMSArIHZlYzEtPmJ2X2xlbiAhPSBhZGRyMikKIAkJcmV0dXJuIGZh
bHNlOwotCWlmICh4ZW5fZG9tYWluKCkgJiYgIXhlbl9iaW92ZWNfcGh5c19tZXJnZWFibGUodmVj
MSwgdmVjMikpCisJaWYgKHhlbl9kb21haW4oKSAmJiAheGVuX2Jpb3ZlY19waHlzX21lcmdlYWJs
ZSh2ZWMxLCB2ZWMyLT5idl9wYWdlKSkKIAkJcmV0dXJuIGZhbHNlOwogCWlmICgoYWRkcjEgfCBt
YXNrKSAhPSAoKGFkZHIyICsgdmVjMi0+YnZfbGVuIC0gMSkgfCBtYXNrKSkKIAkJcmV0dXJuIGZh
bHNlOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vYmlvbWVyZ2UuYyBiL2RyaXZlcnMveGVuL2Jp
b21lcmdlLmMKaW5kZXggZjNmYmI3MDBmNTY5Ny4uMDVhMjg2ZDI0ZjE0OCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy94ZW4vYmlvbWVyZ2UuYworKysgYi9kcml2ZXJzL3hlbi9iaW9tZXJnZS5jCkBAIC00
LDEyICs0LDEzIEBACiAjaW5jbHVkZSA8eGVuL3hlbi5oPgogI2luY2x1ZGUgPHhlbi9wYWdlLmg+
CiAKKy8qIGNoZWNrIGlmIEBwYWdlIGNhbiBiZSBtZXJnZWQgd2l0aCAndmVjMScgKi8KIGJvb2wg
eGVuX2Jpb3ZlY19waHlzX21lcmdlYWJsZShjb25zdCBzdHJ1Y3QgYmlvX3ZlYyAqdmVjMSwKLQkJ
CSAgICAgICBjb25zdCBzdHJ1Y3QgYmlvX3ZlYyAqdmVjMikKKwkJCSAgICAgICBjb25zdCBzdHJ1
Y3QgcGFnZSAqcGFnZSkKIHsKICNpZiBYRU5fUEFHRV9TSVpFID09IFBBR0VfU0laRQogCXVuc2ln
bmVkIGxvbmcgYmZuMSA9IHBmbl90b19iZm4ocGFnZV90b19wZm4odmVjMS0+YnZfcGFnZSkpOwot
CXVuc2lnbmVkIGxvbmcgYmZuMiA9IHBmbl90b19iZm4ocGFnZV90b19wZm4odmVjMi0+YnZfcGFn
ZSkpOworCXVuc2lnbmVkIGxvbmcgYmZuMiA9IHBmbl90b19iZm4ocGFnZV90b19wZm4ocGFnZSkp
OwogCiAJcmV0dXJuIGJmbjEgKyBQRk5fRE9XTih2ZWMxLT5idl9vZmZzZXQgKyB2ZWMxLT5idl9s
ZW4pID09IGJmbjI7CiAjZWxzZQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4veGVuLmggYi9pbmNs
dWRlL3hlbi94ZW4uaAppbmRleCAxOWQwMzIzNzNkZTVhLi4xOWE3MmY1OTFlMmJkIDEwMDY0NAot
LS0gYS9pbmNsdWRlL3hlbi94ZW4uaAorKysgYi9pbmNsdWRlL3hlbi94ZW4uaApAQCAtNDMsOCAr
NDMsMTAgQEAgZXh0ZXJuIHN0cnVjdCBodm1fc3RhcnRfaW5mbyBwdmhfc3RhcnRfaW5mbzsKICNl
bmRpZgkvKiBDT05GSUdfWEVOX0RPTTAgKi8KIAogc3RydWN0IGJpb192ZWM7CitzdHJ1Y3QgcGFn
ZTsKKwogYm9vbCB4ZW5fYmlvdmVjX3BoeXNfbWVyZ2VhYmxlKGNvbnN0IHN0cnVjdCBiaW9fdmVj
ICp2ZWMxLAotCQljb25zdCBzdHJ1Y3QgYmlvX3ZlYyAqdmVjMik7CisJCWNvbnN0IHN0cnVjdCBw
YWdlICpwYWdlKTsKIAogI2lmIGRlZmluZWQoQ09ORklHX01FTU9SWV9IT1RQTFVHKSAmJiBkZWZp
bmVkKENPTkZJR19YRU5fQkFMTE9PTikKIGV4dGVybiB1NjQgeGVuX3NhdmVkX21heF9tZW1fc2l6
ZTsKLS0gCjIuMjAuMQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
