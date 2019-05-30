Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0EB2EC18
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 05:18:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWBX6-0001nK-FQ; Thu, 30 May 2019 03:15:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uLyr=T6=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1hWBX4-0001nD-M8
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 03:15:10 +0000
X-Inumbo-ID: 2102cdf2-8289-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2102cdf2-8289-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 03:15:09 +0000 (UTC)
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net
 [67.88.213.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 842FA245A7;
 Thu, 30 May 2019 03:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559186108;
 bh=P8sSgzLKSTzFiYIMTRByBBUJTbWOzlLJKNm/D0sk8WA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CAzjBoCENVuzody9Hl9r6gW0cKUulKLBlRmAYoIC9HpWtBR6xozUmMMvxeKqqJcwT
 H9/tNqxj7Y866ZQ8s8nm20acPMRHvTlOskfUNNvTKjF1YEX1O+JeDKUHsnQPitwiA6
 2/UBRtBETFWBAr6hSdMDA3YnekGrZ/y8+L8NBgmI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 May 2019 20:05:25 -0700
Message-Id: <20190530030553.773221091@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530030540.363386121@linuxfoundation.org>
References: <20190530030540.363386121@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5.0 252/346] block: pass page to
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
IGIvYmxvY2svYmxrLmgKaW5kZXggODQ4Mjc4YzUyMDMwNi4uYTU3YmM5MGU0NGJiMiAxMDA2NDQK
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
dWRlL3hlbi94ZW4uaAppbmRleCAwZTIxNTY3ODZhZDI5Li5lMWJhNjkyMWJjOGViIDEwMDY0NAot
LS0gYS9pbmNsdWRlL3hlbi94ZW4uaAorKysgYi9pbmNsdWRlL3hlbi94ZW4uaApAQCAtNDMsNyAr
NDMsOSBAQCBleHRlcm4gc3RydWN0IGh2bV9zdGFydF9pbmZvIHB2aF9zdGFydF9pbmZvOwogI2Vu
ZGlmCS8qIENPTkZJR19YRU5fRE9NMCAqLwogCiBzdHJ1Y3QgYmlvX3ZlYzsKK3N0cnVjdCBwYWdl
OworCiBib29sIHhlbl9iaW92ZWNfcGh5c19tZXJnZWFibGUoY29uc3Qgc3RydWN0IGJpb192ZWMg
KnZlYzEsCi0JCWNvbnN0IHN0cnVjdCBiaW9fdmVjICp2ZWMyKTsKKwkJY29uc3Qgc3RydWN0IHBh
Z2UgKnBhZ2UpOwogCiAjZW5kaWYJLyogX1hFTl9YRU5fSCAqLwotLSAKMi4yMC4xCgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
