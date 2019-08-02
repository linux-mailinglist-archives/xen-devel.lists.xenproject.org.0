Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAE37EB2C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:17:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxd-0005v0-Ru; Fri, 02 Aug 2019 04:14:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBj-0007BT-2U
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:59 +0000
X-Inumbo-ID: 29b2bfcf-b4cc-11e9-8980-bc764e045a96
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 29b2bfcf-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:58 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f5so26416661pgu.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P44t64b1Yt2CczJo6SOAPYnnEfAXhRMhGjbg0YSdFKY=;
 b=pDDjdXXj6RFblmUZntZEJACUef7RKkNl/YK04UbkHBUCjruhPz1DvjNzBz0yKiKhLU
 m7TMmjuez3cY0GOJbOTSBK2VUdIVnusEW0vCSFZAYXoD3irkbR/lbNxP1xvdu08hMie7
 kzmRBnIq1D5NEN+UIvAycIBnd5W1b4XDWFug/SXkacUthZGPwZUithvAb6zFZK598+Zf
 KNchzaJdTnwJOaC7HcvTulBYTwt81Zp1hO/B2Q1bZULoUdzowXbHyNeGUScibcu9SmcM
 prETRVYk+V5bEeFpHbvbtuzpFBWpu22yc2ThdO/xtNJdbTSkoBepWkhbKAkxtBTCzSLm
 uqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P44t64b1Yt2CczJo6SOAPYnnEfAXhRMhGjbg0YSdFKY=;
 b=hI8OKFHiBUgl39RMBz3kwkS4akhRGdhufoHY0A2g5LXTJRNJVKdowOMXozIn6RKG/2
 2lVU0TYOHFn1hFOGx4NLbyyIgs1XkOmC+JBaeaNYHic741Q+iPYM7Q5YyTnNqBp9rSuH
 IPVPTh+EP6mDXcJ+dV0AuCJJu56qg0AHTEO5cwU30c+UuHVAlikRcBg1dV4kxEepqvk2
 WbOsRiakbl1Te4VotX477tI55HqdwDIOKabHHR08TqtOZyGeyNuQJstald/fwfmv0aRs
 9vUikV+RLGsZP6/qkx+jivCKiM3acvjC5VT1KMCXictJxYrAslwj3hPGH0Q34lEgOgFs
 vcSA==
X-Gm-Message-State: APjAAAVbmKigOT5eXlhBEeBmp1IEbNP4M59zFQgzkU/x3c5PRoXhgPy/
 4qKkjNZMGIKIwb0dwVKSmVs=
X-Google-Smtp-Source: APXvYqzmhx2HN9zJqN7W3z+BTBjGONUj50lIUbKXplqq4RVMAlpQQWHUfPagZ1wT+1La24vM3uCr4Q==
X-Received: by 2002:a63:9c5:: with SMTP id 188mr86233384pgj.2.1564712457422;
 Thu, 01 Aug 2019 19:20:57 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:56 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:20:00 -0700
Message-Id: <20190802022005.5117-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 29/34] mm/process_vm_access.c: convert
 put_page() to put_user_page*()
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Ingo Molnar <mingo@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Rashika Kheria <rashika.kheria@gmail.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-rpi-kernel@lists.infradead.org, Jann Horn <jann@thejh.net>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, Lorenzo Stoakes <lstoakes@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Christopher Yeoh <cyeoh@au1.ibm.com>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQWwgVmly
byA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+CkNjOiBBbmRyZWEgQXJjYW5nZWxpIDxhYXJjYW5n
ZUByZWRoYXQuY29tPgpDYzogQ2hyaXN0b3BoZXIgWWVvaCA8Y3llb2hAYXUxLmlibS5jb20+CkNj
OiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgpDYzogSGVpa28gQ2Fy
c3RlbnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29A
a2VybmVsLm9yZz4KQ2M6IEphbm4gSG9ybiA8amFubkB0aGVqaC5uZXQ+CkNjOiBMb3JlbnpvIFN0
b2FrZXMgPGxzdG9ha2VzQGdtYWlsLmNvbT4KQ2M6IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1
LmRlc25veWVyc0BlZmZpY2lvcy5jb20+CkNjOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LnZu
ZXQuaWJtLmNvbT4KQ2M6IFJhc2hpa2EgS2hlcmlhIDxyYXNoaWthLmtoZXJpYUBnbWFpbC5jb20+
ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBt
bS9wcm9jZXNzX3ZtX2FjY2Vzcy5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL3By
b2Nlc3Nfdm1fYWNjZXNzLmMgYi9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jCmluZGV4IDM1N2FhN2Jl
ZjZjMC4uNGQyOWQ1NGVjOTNmIDEwMDY0NAotLS0gYS9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jCisr
KyBiL21tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMKQEAgLTk2LDcgKzk2LDcgQEAgc3RhdGljIGludCBw
cm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5zaWduZWQgbG9uZyBhZGRyLAogCQlmbGFncyB8PSBG
T0xMX1dSSVRFOwogCiAJd2hpbGUgKCFyYyAmJiBucl9wYWdlcyAmJiBpb3ZfaXRlcl9jb3VudChp
dGVyKSkgewotCQlpbnQgcGFnZXMgPSBtaW4obnJfcGFnZXMsIG1heF9wYWdlc19wZXJfbG9vcCk7
CisJCWludCBwaW5uZWRfcGFnZXMgPSBtaW4obnJfcGFnZXMsIG1heF9wYWdlc19wZXJfbG9vcCk7
CiAJCWludCBsb2NrZWQgPSAxOwogCQlzaXplX3QgYnl0ZXM7CiAKQEAgLTEwNiwxNCArMTA2LDE1
IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc192bV9yd19zaW5nbGVfdmVjKHVuc2lnbmVkIGxvbmcgYWRk
ciwKIAkJICogY3VycmVudC9jdXJyZW50LT5tbQogCQkgKi8KIAkJZG93bl9yZWFkKCZtbS0+bW1h
cF9zZW0pOwotCQlwYWdlcyA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZSh0YXNrLCBtbSwgcGEsIHBh
Z2VzLCBmbGFncywKLQkJCQkJICAgICAgcHJvY2Vzc19wYWdlcywgTlVMTCwgJmxvY2tlZCk7CisJ
CXBpbm5lZF9wYWdlcyA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZSh0YXNrLCBtbSwgcGEsIHBpbm5l
ZF9wYWdlcywKKwkJCQkJCSAgICAgZmxhZ3MsIHByb2Nlc3NfcGFnZXMsIE5VTEwsCisJCQkJCQkg
ICAgICZsb2NrZWQpOwogCQlpZiAobG9ja2VkKQogCQkJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsK
LQkJaWYgKHBhZ2VzIDw9IDApCisJCWlmIChwaW5uZWRfcGFnZXMgPD0gMCkKIAkJCXJldHVybiAt
RUZBVUxUOwogCi0JCWJ5dGVzID0gcGFnZXMgKiBQQUdFX1NJWkUgLSBzdGFydF9vZmZzZXQ7CisJ
CWJ5dGVzID0gcGlubmVkX3BhZ2VzICogUEFHRV9TSVpFIC0gc3RhcnRfb2Zmc2V0OwogCQlpZiAo
Ynl0ZXMgPiBsZW4pCiAJCQlieXRlcyA9IGxlbjsKIApAQCAtMTIyLDEwICsxMjMsOSBAQCBzdGF0
aWMgaW50IHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQkJ
CSB2bV93cml0ZSk7CiAJCWxlbiAtPSBieXRlczsKIAkJc3RhcnRfb2Zmc2V0ID0gMDsKLQkJbnJf
cGFnZXMgLT0gcGFnZXM7Ci0JCXBhICs9IHBhZ2VzICogUEFHRV9TSVpFOwotCQl3aGlsZSAocGFn
ZXMpCi0JCQlwdXRfcGFnZShwcm9jZXNzX3BhZ2VzWy0tcGFnZXNdKTsKKwkJbnJfcGFnZXMgLT0g
cGlubmVkX3BhZ2VzOworCQlwYSArPSBwaW5uZWRfcGFnZXMgKiBQQUdFX1NJWkU7CisJCXB1dF91
c2VyX3BhZ2VzKHByb2Nlc3NfcGFnZXMsIHBpbm5lZF9wYWdlcyk7CiAJfQogCiAJcmV0dXJuIHJj
OwotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
