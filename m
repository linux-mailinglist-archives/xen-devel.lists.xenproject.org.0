Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F16CA80E1B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 00:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huPK1-0003lu-LY; Sun, 04 Aug 2019 22:49:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wrCA=WA=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1huPK0-0003ks-9r
 for xen-devel@lists.xenproject.org; Sun, 04 Aug 2019 22:49:48 +0000
X-Inumbo-ID: 2860419b-b70a-11e9-8980-bc764e045a96
Received: from mail-pf1-x442.google.com (unknown [2607:f8b0:4864:20::442])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2860419b-b70a-11e9-8980-bc764e045a96;
 Sun, 04 Aug 2019 22:49:46 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id f17so34607285pfn.6
 for <xen-devel@lists.xenproject.org>; Sun, 04 Aug 2019 15:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=L35X2QFh0M4JIQvOmPagjixwdLqggClkiY/ITRED3vd5cYmML5rpnhsQYVeJG55L7X
 lfpM/Rw8+9+KW1xLlbUjjd2pEukAuHL9FPW2brNIFLNAAe+xFNLiBhvXwHgfebwSPh6b
 PQimMsMZnxgRdBC8pyrRMZ9Xs902qjGDWwSRlQpLzHZkXMK6vYaJ7jNHAlwygvXZxKWD
 HRNszvS/yLW3PMoeuHrejzjB7JHf9PJVVvjCC1Gi8OYeSyaj8QqsLJjtyVPXxwKbhU1l
 56SfAsWTx6H5Myy0JvyaDz6KAPklX1grAzJq4JD5PKOSOMwKa+X4MP3JYOJahIqu806a
 4oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1X33MY8P1PVcaLkCZcp6PkXiHV9wvPThIXgNE9TFbj4=;
 b=G5/lWsD4EI3VaPbv3an4zrtcQ28cycZtJzBXcRWHLp/Kdu6DYrSr040xgY6xsm792K
 sgPzXxjluaFmY0H4+aiGXlQYNkcf8tairtZiTTsrw4jdUO61je7EsGG3Hdv+puC5s7iX
 rE3rVLFatnx+lohSJ8OA/xhQCezFeSYs3UdKDXidXXLlmxkDxLftcY5YpAmXwDmtEkgc
 G+chG5byvzrw4dV7Kk7rfS2rOCJX6IKlmYooX/plsWQfIwZHEYZXLSkz5J7phULb+wVb
 REVh4PhQeWRuKdOys39IzCihVGUWkzxh4lhp1+w/SjKooBNBqz/0FvnO8nrfu5R+ELNh
 gAhQ==
X-Gm-Message-State: APjAAAX2yzg9+9wjYPhe7HV09AKy7srWa7UqHykM/MTtDjknr7UuDEGP
 LlTY+WItVQpQ4QHhwjPFrKE=
X-Google-Smtp-Source: APXvYqzQPIYoNRubdZIOtSxTDDzyPgcMaQ5zki3KNapO18w6JwMFrcpCjaVO/4MzoXfe6L31Al4dig==
X-Received: by 2002:a65:6859:: with SMTP id q25mr22221333pgt.181.1564958986332; 
 Sun, 04 Aug 2019 15:49:46 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:45 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Sun,  4 Aug 2019 15:48:58 -0700
Message-Id: <20190804224915.28669-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Subject: [Xen-devel] [PATCH v2 17/34] vfio: convert put_page() to
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
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, Alex Williamson <alex.williamson@redhat.com>,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpOb3RlIHRoYXQg
dGhpcyBlZmZlY3RpdmVseSBjaGFuZ2VzIHRoZSBjb2RlJ3MgYmVoYXZpb3IgaW4KcXBfcmVsZWFz
ZV9wYWdlcygpOiBpdCBub3cgdWx0aW1hdGVseSBjYWxscyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCks
Cmluc3RlYWQgb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcyBwcm9iYWJseSBtb3JlIGFjY3Vy
YXRlLgoKQXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBv
bmx5IHNhZmUgaWYgd2UgYXJlCmRlYWxpbmcgd2l0aCBhIGZpbGUgYmFja2VkIHBhZ2Ugd2hlcmUg
d2UgaGF2ZSByZWZlcmVuY2Ugb24gdGhlIGlub2RlIGl0CmhhbmdzIG9mZi4iIFsxXQoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpDYzog
QWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4KQ2M6IGt2bUB2Z2Vy
Lmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgfCA4ICsrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jCmluZGV4IDA1NDM5MWYzMGZhOC4uNWE1NDYxYTE0Mjk5IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCisrKyBiL2RyaXZlcnMvdmZpby92Zmlv
X2lvbW11X3R5cGUxLmMKQEAgLTMyMCw5ICszMjAsOSBAQCBzdGF0aWMgaW50IHB1dF9wZm4odW5z
aWduZWQgbG9uZyBwZm4sIGludCBwcm90KQogewogCWlmICghaXNfaW52YWxpZF9yZXNlcnZlZF9w
Zm4ocGZuKSkgewogCQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBmbl90b19wYWdlKHBmbik7Ci0JCWlm
IChwcm90ICYgSU9NTVVfV1JJVEUpCi0JCQlTZXRQYWdlRGlydHkocGFnZSk7Ci0JCXB1dF9wYWdl
KHBhZ2UpOworCQlib29sIGRpcnR5ID0gcHJvdCAmIElPTU1VX1dSSVRFOworCisJCXB1dF91c2Vy
X3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEsIGRpcnR5KTsKIAkJcmV0dXJuIDE7CiAJfQogCXJl
dHVybiAwOwpAQCAtMzU2LDcgKzM1Niw3IEBAIHN0YXRpYyBpbnQgdmFkZHJfZ2V0X3BmbihzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRkciwKIAkJICovCiAJCWlmIChyZXQg
PiAwICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkgewogCQkJcmV0ID0gLUVPUE5PVFNVUFA7Ci0J
CQlwdXRfcGFnZShwYWdlWzBdKTsKKwkJCXB1dF91c2VyX3BhZ2UocGFnZVswXSk7CiAJCX0KIAl9
CiAJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKLS0gCjIuMjIuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
