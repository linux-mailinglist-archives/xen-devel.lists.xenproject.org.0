Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9F80DF1
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPJg-0003Sp-Oh; Sun, 04 Aug 2019 22:49:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPJe-0003SR-Gn
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:26 +0000
X-Inumbo-ID: 1bcb15e8-b70a-11e9-8980-bc764e045a96
Received: from mail-pf1-x441.google.com (unknown [2607:f8b0:4864:20::441])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1bcb15e8-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:25 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b13so38598502pfo.1
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o0zfkIFt+6JH2qCeaVwPptBUW8DYTI9b55PprZaXkM8=;
 b=H+TbmcIgrwACxFo9hl2l5Xjf1f4GsBt3cThAJffGoVTGjng2zDR+vuW1ELmO9cwqUz
 zWIfVJ0ECGbvkQCKwqluHnqhDjnVY4M3JR5j9zUjgsJ4KIo9Jdd0V01x7wYmYDPTzYc0
 2jx8SovBWIpXNDy6R5BQslstKFd50o4jcCzDRtzpOpp5UZEbCq0wLfyRsWQbHo85Apl6
 6aso8ZPOFALMDQpmQJWkBkmOSbB25/wfG2bt9gcemYDwOVD8vq08Rd+SZJr2wXg0pz6k
 SDHNDSjbHSOs0ynQ5oDFI2egfnr7bliii2ZaEObWVPQlOvI2whQIUmO0CHVVfGDuWZsi
 brew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o0zfkIFt+6JH2qCeaVwPptBUW8DYTI9b55PprZaXkM8=;
 b=qgGXGFVGE3iHK94yeO1Tb0PlKyBCEvJUvaRVOKyXq+70G4kZSi2HvJXB3FgrEas8P5
 /47cgQBsWWFougKXB5/mYuhXlu6IHI4GOgqXjdChoUib99LwT/3Gr8n9HpiNLDZ0qw1Y
 NEjyQkOZVz3D5utvXItGpwJ5JQgTF4U0OkjyHQSxj5qG1BIaEZgFVaYSOJw9VoSUbK0N
 Az/25bUAgAsidzfGb2VixFeF+Ad6XWTW3kkrnbtIvDGAdD9VLeGPYY4Slbb89J4vp05R
 Oy6SUicsO8Yx0Xg39llPuG6iicKZT/W5ncP4lzU9UpjOUazy7RMxwRvXTSsalFQVP1ZU
 vmgA==
X-Gm-Message-State: APjAAAWt612BMgc3xlODum2LmmbyqAehoGJbGneAqnCcMizjIXTT4GMr
 0JD/pkJVBYWVKCBVwsBpLz0=
X-Google-Smtp-Source: APXvYqwRJ1sJ/rrgIE94buNkF2wqaHOY76PrdCWNDeiwr3VYQjX9Duq5YnDYkLulcSwytNSAtlk/zQ==
X-Received: by 2002:a63:6bc5:: with SMTP id
 g188mr104077235pgc.225.1564958965247; 
 Sun, 04 Aug 2019 15:49:25 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:24 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:45 -0700
Message-Id: <20190804224915.28669-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 04/34] x86/kvm: convert put_page() to
 put_user_page*()
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
 "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKS4KClRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmli
ZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAooIm1tOiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSoo
KSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KCkNjOiBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVz
Lm9yZz4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiBSYWRpbSBL
csSNbcOhxZkgPHJrcmNtYXJAcmVkaGF0LmNvbT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBILiBQ
ZXRlciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4KQ2M6IHg4NkBrZXJuZWwub3JnCkNjOiBrdm1Admdl
ci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vc3ZtLmMgIHwgNCArKy0tCiB2aXJ0L2t2bS9rdm1fbWFp
bi5jIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3Zt
LmMKaW5kZXggN2VhZmM2OTA3ODYxLi5mZjkzYzkyM2VkMzYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L2t2bS9zdm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTE4MjcsNyArMTgyNyw3IEBA
IHN0YXRpYyBzdHJ1Y3QgcGFnZSAqKnNldl9waW5fbWVtb3J5KHN0cnVjdCBrdm0gKmt2bSwgdW5z
aWduZWQgbG9uZyB1YWRkciwKIAogZXJyOgogCWlmIChucGlubmVkID4gMCkKLQkJcmVsZWFzZV9w
YWdlcyhwYWdlcywgbnBpbm5lZCk7CisJCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCBucGlubmVkKTsK
IAogCWt2ZnJlZShwYWdlcyk7CiAJcmV0dXJuIE5VTEw7CkBAIC0xODM4LDcgKzE4MzgsNyBAQCBz
dGF0aWMgdm9pZCBzZXZfdW5waW5fbWVtb3J5KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IHBhZ2Ug
KipwYWdlcywKIHsKIAlzdHJ1Y3Qga3ZtX3Nldl9pbmZvICpzZXYgPSAmdG9fa3ZtX3N2bShrdm0p
LT5zZXZfaW5mbzsKIAotCXJlbGVhc2VfcGFnZXMocGFnZXMsIG5wYWdlcyk7CisJcHV0X3VzZXJf
cGFnZXMocGFnZXMsIG5wYWdlcyk7CiAJa3ZmcmVlKHBhZ2VzKTsKIAlzZXYtPnBhZ2VzX2xvY2tl
ZCAtPSBucGFnZXM7CiB9CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9r
dm0va3ZtX21haW4uYwppbmRleCA4ODdmM2IwYzJiNjAuLjRiNmE1OTZlYThlOSAxMDA2NDQKLS0t
IGEvdmlydC9rdm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0xNDk5
LDcgKzE0OTksNyBAQCBzdGF0aWMgaW50IGh2YV90b19wZm5fc2xvdyh1bnNpZ25lZCBsb25nIGFk
ZHIsIGJvb2wgKmFzeW5jLCBib29sIHdyaXRlX2ZhdWx0LAogCiAJCWlmIChfX2dldF91c2VyX3Bh
Z2VzX2Zhc3QoYWRkciwgMSwgMSwgJndwYWdlKSA9PSAxKSB7CiAJCQkqd3JpdGFibGUgPSB0cnVl
OwotCQkJcHV0X3BhZ2UocGFnZSk7CisJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCQkJcGFnZSA9
IHdwYWdlOwogCQl9CiAJfQpAQCAtMTgzMSw3ICsxODMxLDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwo
a3ZtX3JlbGVhc2VfcGFnZV9jbGVhbik7CiB2b2lkIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbihrdm1f
cGZuX3QgcGZuKQogewogCWlmICghaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pICYmICFrdm1faXNf
cmVzZXJ2ZWRfcGZuKHBmbikpCi0JCXB1dF9wYWdlKHBmbl90b19wYWdlKHBmbikpOworCQlwdXRf
dXNlcl9wYWdlKHBmbl90b19wYWdlKHBmbikpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3Jl
bGVhc2VfcGZuX2NsZWFuKTsKIAotLSAKMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
