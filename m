Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D0A7EB3B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxW-0005qf-Gb; Fri, 02 Aug 2019 04:14:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNB7-00073o-4M
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:21 +0000
X-Inumbo-ID: 1324dda1-b4cc-11e9-8980-bc764e045a96
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1324dda1-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:20 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id ay6so33057707plb.9
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pwlX9Z4uen7Ts0pUwmBLgDhtihaB/D0UZN8JDoMe4ZA=;
 b=cXVKp+Dgxhj784uTGfvPyG1yYJG0TluF022pFhUyHpRdik351Pihe9of7XZeuP0Vwt
 h/i6WlGcIKVNKfHSeDSEUHKJX3j3X/NshFFci/lhMH4/SgEjIokRiJ+YouFN6I+GBm4y
 zUjQOfq6557LaDfB1SW3dyyvMia7x+7GSnkQpaKA5dSoAhqdxSb/NVVqK5YIHjTvA0IX
 6H4EsdOomJX2kg/hRhJVVxm3sX/zmn87r9Fum/tKlkDFYTmAnDUVoJ7rlCgUuzHH8DwS
 QuPnhojZwqXr2XSW6HhlWm7VIgfEjZi50Ea1bZ4R+3m+Y3fnnezSFaVuWGen2JpYqC8g
 nI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pwlX9Z4uen7Ts0pUwmBLgDhtihaB/D0UZN8JDoMe4ZA=;
 b=TnUrC7wn7x2lufWqU0v/pXGvrJxwGWF9xIC+Qkr0mVYNrFGgDo0luZD9Po+bWf0FVc
 14RDAkgonaSWFx8OhpB+CrR39+NH1G1zQx9RtMq7Ae+dE+aTR3KtFAJ9K0XEVmiG8BHV
 CXddcHq7ZZIC41L3An74F+uzU9J8HCvHT7zbBqObpIq1p83Ymz0FCh65TyJxFDRQ/8Mp
 wJBDulpxj1no9pY6hn8DeEV3SOLOEIMTJdA8P87wGTkfA/L+nGY1iM22dwsrq3nwSmy5
 5z2cIL37G4DD4zIxU+X99qovYuMsY3jQxuw3Ilxy6Is1/k7gjt4xXjHLDb/zNX4K4fzq
 3i5A==
X-Gm-Message-State: APjAAAUzxoWRCJsd/f6+gyRICqPrAbIe2cy7NMF15rje2DINzeQixoy2
 tOnYJbZDwCMpl3eUDIEPO/g=
X-Google-Smtp-Source: APXvYqzjw3eL+xmFFeLCY8pAtt0uU+dboybjV0Tj2XnMiuSE8KPva7u+GlTOi6iXLJ1oNBX2ZlUCDA==
X-Received: by 2002:a17:902:a413:: with SMTP id
 p19mr129958448plq.134.1564712419691; 
 Thu, 01 Aug 2019 19:20:19 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:19 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:36 -0700
Message-Id: <20190802022005.5117-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 05/34] drm/etnaviv: convert release_pages() to
 put_user_pages()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, linux-rpi-kernel@lists.infradead.org,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogSm9lcmcg
Um9lZGVsIDxqb3JvQDhieXRlcy5vcmc+CkNjOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRo
YXQuY29tPgpDYzogIlJhZGltIEtyxI1tw6HFmSIgPHJrcmNtYXJAcmVkaGF0LmNvbT4KQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdv
QHJlZGhhdC5jb20+CkNjOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT4KQ2M6ICJILiBQ
ZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiB4ODZAa2VybmVsLm9yZwpDYzoga3ZtQHZn
ZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYyB8IDQgKyst
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYwppbmRleCBlODc3OGViYjcyZTYuLmEwMTQ0YTVl
ZTMyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCkBAIC02ODYsNyArNjg2
LDcgQEAgc3RhdGljIGludCBldG5hdml2X2dlbV91c2VycHRyX2dldF9wYWdlcyhzdHJ1Y3QgZXRu
YXZpdl9nZW1fb2JqZWN0ICpldG5hdml2X29iaikKIAkJcmV0ID0gZ2V0X3VzZXJfcGFnZXNfZmFz
dChwdHIsIG51bV9wYWdlcywKIAkJCQkJICAhdXNlcnB0ci0+cm8gPyBGT0xMX1dSSVRFIDogMCwg
cGFnZXMpOwogCQlpZiAocmV0IDwgMCkgewotCQkJcmVsZWFzZV9wYWdlcyhwdmVjLCBwaW5uZWQp
OworCQkJcHV0X3VzZXJfcGFnZXMocHZlYywgcGlubmVkKTsKIAkJCWt2ZnJlZShwdmVjKTsKIAkJ
CXJldHVybiByZXQ7CiAJCX0KQEAgLTcxMCw3ICs3MTAsNyBAQCBzdGF0aWMgdm9pZCBldG5hdml2
X2dlbV91c2VycHRyX3JlbGVhc2Uoc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqZXRuYXZpdl9v
YmopCiAJaWYgKGV0bmF2aXZfb2JqLT5wYWdlcykgewogCQlpbnQgbnBhZ2VzID0gZXRuYXZpdl9v
YmotPmJhc2Uuc2l6ZSA+PiBQQUdFX1NISUZUOwogCi0JCXJlbGVhc2VfcGFnZXMoZXRuYXZpdl9v
YmotPnBhZ2VzLCBucGFnZXMpOworCQlwdXRfdXNlcl9wYWdlcyhldG5hdml2X29iai0+cGFnZXMs
IG5wYWdlcyk7CiAJCWt2ZnJlZShldG5hdml2X29iai0+cGFnZXMpOwogCX0KIH0KLS0gCjIuMjIu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
