Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25B212E7C7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 16:03:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in1ww-0002JS-97; Thu, 02 Jan 2020 14:59:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=je89=2X=arndb.de=arnd@srs-us1.protection.inumbo.net>)
 id 1in1wu-0002JN-W7
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 14:59:45 +0000
X-Inumbo-ID: 823114c2-2d70-11ea-a37c-12813bfff9fa
Received: from mout.kundenserver.de (unknown [212.227.126.133])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 823114c2-2d70-11ea-a37c-12813bfff9fa;
 Thu, 02 Jan 2020 14:59:43 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MRC7g-1j80hl0TzQ-00NCqd; Thu, 02 Jan 2020 15:59:41 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu,  2 Jan 2020 15:55:27 +0100
Message-Id: <20200102145552.1853992-10-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20200102145552.1853992-1-arnd@arndb.de>
References: <20200102145552.1853992-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:wdBfmrr02CDq12M4nkT7pYNOf7/IjRYzD6XaAXcfqVJrqqMMGD4
 Mj1RZUqzgSy3Zk9mHA3hDqTUTSPM2zyioOW8jhhA1emfYvfFwxO+++Pe9hS9QA4czZwQg6k
 4MKhacs+eRa3ix03OK5bjf21w6KCI94uyIGo7K/HqOPIsCwIUA6+IKC9zLuD0yBNFu2gdqy
 nI8s23bcuYnMA59aKrR6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vqvyIdRboDI=:4G6b2uAPholNj2UDYiYmio
 JDXbP4extzMTSJHJgAyBUUCyBnivB++pBb80Vcp87nHRYSpxu2qXNgFymOZpoQXAwlejNRI8w
 ba59u58QOcgD2QKRCt0jPhzU+N4dn/EBnBZiB09mZPCpuMdAmhx6KYdAzdzCl441XvV2bBhqy
 qyprK6D1Kc3S/A9ngV1tZ3cKUB/2ndb4cHtqSg6ajI3StbJFA75on6GaNbqOdul6R+JiODwVm
 Wvd6/wb+1tnKN7jyyMhrLM+gvjg57Ze+cwLOwa+Xv8TsumZYtuMsdvw6XPLMOekb4Pnw6ibY4
 aYVXfZ24lB7yDNpF1z2eqx4wItOZxb4uN9DwVANPeXiBYgBCfYN3rj+ke2bU8975XxeCMLE99
 kcPi6glqkmKk8dHxM9220A/YNhoJOuyg9f5jN7TxWIA1V2oXvG3MxdXbyx5YjipMJs6Y23nG7
 jd/M3t8I0ck1nv/gn3/c51IYY66Mcggsz28Rn/3mV1f9yIrCGKGd4Aikip43xz40YZsXLkUhg
 MLwabVeTnSpKKlcDL4UvkdSAB+BjlnwpRtSTmBdMYN61wukrYTQXZs5UuxN5BcfnH+Zjdgkw1
 ztwz+WhkzdS+maadwl1X2syIckfFIOStWau12zybQUEknzc9iCGfn6Q5f7QKvLIjmJYC42pBA
 nhOsEM+SgSh+DKojLrUhxVsZ1AwzMdUDp6UgIFJHIY47ugiqUCJD/MnVOJRkIOMpFE6QAg9xy
 uisF1/f5wpGcN9Lh5RA+fs4RDKg2dcXPkozJl3diLjS0apQhlkWBRBjkDdPuxAlBTujiuBZDm
 kH6M268ja7s+OktpaLNIl6o6/KCND2KWfDcgNPWNZ0BsU69eU2eQ+08k1NVyU9HDLb2phBonK
 ltQ8HA/kA1Rq2ZBOf41w==
Subject: [Xen-devel] [PATCH v3 09/22] compat_ioctl: block: handle cdrom
 compat ioctl in non-cdrom drivers
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
Cc: Jens Axboe <axboe@kernel.dk>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 Denis Efremov <efremov@linux.com>, linux-block@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tim Waugh <tim@cyberelk.net>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFyaW91cyBibG9jayBkcml2ZXJzIGltcGxlbWVudCB0aGUgQ0RST01NVUxUSVNFU1NJT04sCkNE
Uk9NX0dFVF9DQVBBQklMSVRZLCBhbmQgQ0RST01FSkVDVCBpb2N0bCBjb21tYW5kcywgcmVseWlu
ZyBvbiB0aGUKYmxvY2sgbGF5ZXIgdG8gaGFuZGxlIGNvbXBhdF9pb2N0bCBtb2RlIGZvciB0aGVt
LgoKTW92ZSB0aGlzIGludG8gdGhlIGRyaXZlcnMgZGlyZWN0bHkgYXMgYSBwcmVwYXJhdGlvbiBm
b3Igc2ltcGxpZnlpbmcKdGhlIGJsb2NrIGxheWVyIGxhdGVyLgoKV2hlbiBvbmx5IGludGVnZXIg
YXJndW1lbnRzIG9yIG5vIGFyZ3VtZW50cyBhcmUgcGFzc2VkLCB0aGUKc2FtZSBoYW5kbGVyIGNh
biBiZSB1c2VkIGZvciAuaW9jdGwgYW5kIC5jb21wYXRfaW9jdGwsIGFuZAp3aGVuIG9ubHkgcG9p
bnRlciBhcmd1bWVudHMgYXJlIHBhc3NlZCwgdGhlIG5ld2x5IGFkZGVkCmJsa2Rldl9jb21wYXRf
cHRyX2lvY3RsIGNhbiBiZSB1c2VkLgoKU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2Zsb3BweS5jICAgICAgIHwgMyArKysKIGRy
aXZlcnMvYmxvY2svcGFyaWRlL3BkLmMgICAgfCAxICsKIGRyaXZlcnMvYmxvY2svcGFyaWRlL3Bm
LmMgICAgfCAxICsKIGRyaXZlcnMvYmxvY2svc3VudmRjLmMgICAgICAgfCAxICsKIGRyaXZlcnMv
YmxvY2sveGVuLWJsa2Zyb250LmMgfCAxICsKIDUgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9mbG9wcHkuYyBiL2RyaXZlcnMvYmxvY2sv
ZmxvcHB5LmMKaW5kZXggNDg1ODY1ZmQwNDEyLi5jZDM2MTJlNGUyZTEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvYmxvY2svZmxvcHB5LmMKKysrIGIvZHJpdmVycy9ibG9jay9mbG9wcHkuYwpAQCAtMzg3
OSw2ICszODc5LDkgQEAgc3RhdGljIGludCBmZF9jb21wYXRfaW9jdGwoc3RydWN0IGJsb2NrX2Rl
dmljZSAqYmRldiwgZm1vZGVfdCBtb2RlLCB1bnNpZ25lZCBpbnQKIHsKIAlpbnQgZHJpdmUgPSAo
bG9uZyliZGV2LT5iZF9kaXNrLT5wcml2YXRlX2RhdGE7CiAJc3dpdGNoIChjbWQpIHsKKwljYXNl
IENEUk9NRUpFQ1Q6IC8qIENELVJPTSBlamVjdCAqLworCWNhc2UgMHg2NDcwOgkgLyogU3VuT1Mg
ZmxvcHB5IGVqZWN0ICovCisKIAljYXNlIEZETVNHT046CiAJY2FzZSBGRE1TR09GRjoKIAljYXNl
IEZEU0VURU1TR1RSRVNIOgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9wYXJpZGUvcGQuYyBi
L2RyaXZlcnMvYmxvY2svcGFyaWRlL3BkLmMKaW5kZXggNmY5YWQzZmM3MTZmLi5jMDk2NzUwN2Qw
ODUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svcGFyaWRlL3BkLmMKKysrIGIvZHJpdmVycy9i
bG9jay9wYXJpZGUvcGQuYwpAQCAtODc0LDYgKzg3NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YmxvY2tfZGV2aWNlX29wZXJhdGlvbnMgcGRfZm9wcyA9IHsKIAkub3BlbgkJPSBwZF9vcGVuLAog
CS5yZWxlYXNlCT0gcGRfcmVsZWFzZSwKIAkuaW9jdGwJCT0gcGRfaW9jdGwsCisJLmNvbXBhdF9p
b2N0bAk9IHBkX2lvY3RsLAogCS5nZXRnZW8JCT0gcGRfZ2V0Z2VvLAogCS5jaGVja19ldmVudHMJ
PSBwZF9jaGVja19ldmVudHMsCiAJLnJldmFsaWRhdGVfZGlzaz0gcGRfcmV2YWxpZGF0ZQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ibG9jay9wYXJpZGUvcGYuYyBiL2RyaXZlcnMvYmxvY2svcGFyaWRl
L3BmLmMKaW5kZXggNmI3ZDRjYWIzNjg3Li5iYjA5ZjIxY2UyMWEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYmxvY2svcGFyaWRlL3BmLmMKKysrIGIvZHJpdmVycy9ibG9jay9wYXJpZGUvcGYuYwpAQCAt
Mjc2LDYgKzI3Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmxvY2tfZGV2aWNlX29wZXJhdGlv
bnMgcGZfZm9wcyA9IHsKIAkub3BlbgkJPSBwZl9vcGVuLAogCS5yZWxlYXNlCT0gcGZfcmVsZWFz
ZSwKIAkuaW9jdGwJCT0gcGZfaW9jdGwsCisJLmNvbXBhdF9pb2N0bAk9IHBmX2lvY3RsLAogCS5n
ZXRnZW8JCT0gcGZfZ2V0Z2VvLAogCS5jaGVja19ldmVudHMJPSBwZl9jaGVja19ldmVudHMsCiB9
OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9zdW52ZGMuYyBiL2RyaXZlcnMvYmxvY2svc3Vu
dmRjLmMKaW5kZXggNTcxNjEyZTIzM2ZlLi4zOWFlZWJjNjgzN2QgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvYmxvY2svc3VudmRjLmMKKysrIGIvZHJpdmVycy9ibG9jay9zdW52ZGMuYwpAQCAtMTcxLDYg
KzE3MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmxvY2tfZGV2aWNlX29wZXJhdGlvbnMgdmRj
X2ZvcHMgPSB7CiAJLm93bmVyCQk9IFRISVNfTU9EVUxFLAogCS5nZXRnZW8JCT0gdmRjX2dldGdl
bywKIAkuaW9jdGwJCT0gdmRjX2lvY3RsLAorCS5jb21wYXRfaW9jdGwJPSBibGtkZXZfY29tcGF0
X3B0cl9pb2N0bCwKIH07CiAKIHN0YXRpYyB2b2lkIHZkY19ibGtfcXVldWVfc3RhcnQoc3RydWN0
IHZkY19wb3J0ICpwb3J0KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQu
YyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKaW5kZXggYzAyYmUwNmM1Mjk5Li41N2Q1
MGM1YmEzMDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKKysrIGIv
ZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwpAQCAtMjYzMiw2ICsyNjMyLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBibG9ja19kZXZpY2Vfb3BlcmF0aW9ucyB4bHZiZF9ibG9ja19mb3BzID0K
IAkucmVsZWFzZSA9IGJsa2lmX3JlbGVhc2UsCiAJLmdldGdlbyA9IGJsa2lmX2dldGdlbywKIAku
aW9jdGwgPSBibGtpZl9pb2N0bCwKKwkuY29tcGF0X2lvY3RsID0gYmxrZGV2X2NvbXBhdF9wdHJf
aW9jdGwsCiB9OwogCiAKLS0gCjIuMjAuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
