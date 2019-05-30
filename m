Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5456C2EBAA
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 05:15:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWBTp-0001Zh-Kh; Thu, 30 May 2019 03:11:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uLyr=T6=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1hWBTo-0001ZX-9J
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 03:11:48 +0000
X-Inumbo-ID: a8afe43f-8288-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a8afe43f-8288-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 03:11:47 +0000 (UTC)
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net
 [67.88.213.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EDB624502;
 Thu, 30 May 2019 03:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559185906;
 bh=XMg1VJPFU8dRxGPVBd3Y/ZFiH2pYiUvj9KpvL6JtE/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VA4AA1Jqb2pOj+SdtoiO1joQ8Bgw1JA9QTHFYOA7IN4vEtxQ5igRGsSei+ovEsOTt
 ZozCH9uneWHWi5YczIitWGI2O+Bqqh2K+LPy10BGjj2AMd+aJWhYO0nR1fFZ2wYejJ
 7KWbR+qefySQ9zaoaWEBXlv6f77mKFZaEs0cTKqQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Wed, 29 May 2019 20:04:37 -0700
Message-Id: <20190530030555.005862356@linuxfoundation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190530030540.291644921@linuxfoundation.org>
References: <20190530030540.291644921@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5.1 279/405] block: avoid to break XEN by
 multi-page bvec
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
 Omar Sandoval <osandov@fb.com>, xen-devel@lists.xenproject.org,
 ris Ostrovsky <boris.ostrovsky@oracle.com>, Ming Lei <ming.lei@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WyBVcHN0cmVhbSBjb21taXQgZGI1ZWJkNmVkZDI2MjdkN2U4MWEwMzE2NDNjZjQzNTg3ZjYzZTY2
YyBdCgpYRU4gaGFzIHNwZWNpYWwgcGFnZSBtZXJnZSByZXF1aXJlbWVudCwgc2VlIHhlbl9iaW92
ZWNfcGh5c19tZXJnZWFibGUoKS4KV2UgY2FuJ3QgbWVyZ2UgcGFnZXMgaW50byBvbmUgYnZlYyBz
aW1wbHkgZm9yIFhFTi4KClNvIG1vdmUgWEVOJ3Mgc3BlY2lmaWMgY2hlY2sgb24gcGFnZSBtZXJn
ZSBpbnRvIF9fYmlvX3RyeV9tZXJnZV9wYWdlKCksCnRoZW4gYWJ2b2lkIHRvIGJyZWFrIFhFTiBi
eSBtdWx0aS1wYWdlIGJ2ZWMuCgpDYzogcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKQ2M6IE9tYXIgU2Fu
ZG92YWwgPG9zYW5kb3ZAZmIuY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IE1pbmcgTGVpIDxtaW5nLmxlaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBKZW5zIEF4
Ym9lIDxheGJvZUBrZXJuZWwuZGs+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBibG9jay9iaW8uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ibG9jay9iaW8uYyBiL2Jsb2NrL2Jpby5jCmluZGV4
IDcxNjUxMGVjZDdmZmEuLmEzYzgwYTZjMWZlNTEgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2Jpby5jCisr
KyBiL2Jsb2NrL2Jpby5jCkBAIC03NzYsNiArNzc2LDggQEAgYm9vbCBfX2Jpb190cnlfbWVyZ2Vf
cGFnZShzdHJ1Y3QgYmlvICpiaW8sIHN0cnVjdCBwYWdlICpwYWdlLAogCiAJCWlmICh2ZWNfZW5k
X2FkZHIgKyAxICE9IHBhZ2VfYWRkciArIG9mZikKIAkJCXJldHVybiBmYWxzZTsKKwkJaWYgKHhl
bl9kb21haW4oKSAmJiAheGVuX2Jpb3ZlY19waHlzX21lcmdlYWJsZShidiwgcGFnZSkpCisJCQly
ZXR1cm4gZmFsc2U7CiAJCWlmIChzYW1lX3BhZ2UgJiYgKHZlY19lbmRfYWRkciAmIFBBR0VfTUFT
SykgIT0gcGFnZV9hZGRyKQogCQkJcmV0dXJuIGZhbHNlOwogCi0tIAoyLjIwLjEKCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
