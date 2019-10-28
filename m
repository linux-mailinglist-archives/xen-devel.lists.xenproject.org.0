Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79CE79D0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 21:15:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPBMN-0001iY-8w; Mon, 28 Oct 2019 20:11:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nBLR=YV=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iPBML-0001hr-No
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 20:11:25 +0000
X-Inumbo-ID: 07ec67e6-f9bf-11e9-bbab-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07ec67e6-f9bf-11e9-bbab-bc764e2007e4;
 Mon, 28 Oct 2019 20:10:47 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id 15so9760390qkh.6
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 13:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/THPQGyz40LBFYEHcweT4lmD8Nqu8ZrqzmWM4HcCKs=;
 b=Q6k/mUFVxOBv3aTuq8oo7JDrjEauKE9HcDgFt84omZdU9K/XVboyEcdOWxaTkCBJ28
 h0r5uedPPYCRhOvIEi8rMBg+LxDQ1kJy7G2KvTYOl8k1ftSUoOMiMEEi9CN59pf6OuOz
 MkDtPlTPswGrs8e2T9pzn8MdFhY0MZ1R+E+e8/2U9m/8aBR9ebJ0DsvWpb0j8hwE9f1i
 UuJJWkpCmSjN3VETuju98bl50r4w0WLDME6cbun6/34JTiAY6IEaZyv4ggnF2jWvcBtU
 qyxdFQalzd9YBNgYiQZmA0WiFjG+it9BlIMayLu3aVh2wFRpwpxXSydrKKoYGdfkI+Dw
 /p1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/THPQGyz40LBFYEHcweT4lmD8Nqu8ZrqzmWM4HcCKs=;
 b=IKw8jxN76ycoMNx9MkbvM2o9q1O1Kqtn4yXZEErj+1SXS1UtZZH741OJPdgnV2wbtT
 lqBL9G3zp0WDT80DGtOKxj6qz/5jcGzN3RrqWQnwJ5Vsh37gZMB67R2ZUr+Rzu9jOljB
 HqugLkSnSdWHtjJ+KtreX6hYBEo7i9JWL37/m0K+XZFPsDBXaTH7j4y2cX0ZxmVaWJy3
 l/hYe17Ieo/ypNNo93OcWzECTypcJjDsxpnlG/Z4FOXbw7K84NyWgRC5sa05/+l1z0Mj
 NJZBo+TTLMXATbEyaxT0jQ94WfbnnwAIfdtor+RZXFH++jlE5mAguP1/nGtSslJJ7Qk6
 FTTg==
X-Gm-Message-State: APjAAAVeu/VoiBQQ0I2RCmf7q+wnYbI/1AhXIBrpRUNQ7jVP2G4J8x56
 rqrdsr/LQTnwN69dcP9xyYpBJw==
X-Google-Smtp-Source: APXvYqxsKzO+DlZf4GHZfVwOfUDUz0csib+6zwvHr9p6l/rK8t+hVqnPNQxoUohuqD3TYtVARBRFtg==
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr14987766qkj.284.1572293447562; 
 Mon, 28 Oct 2019 13:10:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id q44sm8677492qtk.16.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001gk-DA; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:25 -0300
Message-Id: <20191028201032.6352-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 08/15] xen/gntdev: Use select for
 DMA_SHARED_BUFFER
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKRE1BX1NIQVJFRF9CVUZG
RVIgY2FuIG5vdCBiZSBlbmFibGVkIGJ5IHRoZSB1c2VyIChpdCByZXByZXNlbnRzIGEgbGlicmFy
eQpzZXQgaW4gdGhlIGtlcm5lbCkuIFRoZSBrY29uZmlnIGNvbnZlbnRpb24gaXMgdG8gdXNlIHNl
bGVjdCBmb3Igc3VjaApzeW1ib2xzIHNvIHRoZXkgYXJlIHR1cm5lZCBvbiBpbXBsaWNpdGx5IHdo
ZW4gdGhlIHVzZXIgZW5hYmxlcyBhIGtjb25maWcKdGhhdCBuZWVkcyB0aGVtLgoKT3RoZXJ3aXNl
IHRoZSBYRU5fR05UREVWX0RNQUJVRiBrY29uZmlnIGlzIG92ZXJseSBkaWZmaWN1bHQgdG8gZW5h
YmxlLgoKRml4ZXM6IDkzMmQ2NTYyMTc5ZSAoInhlbi9nbnRkZXY6IEFkZCBpbml0aWFsIHN1cHBv
cnQgZm9yIGRtYS1idWYgVUFQSSIpCkNjOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPgpDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCkNj
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+ClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3Jw
ZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9LY29uZmlnIHwgMyArKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3hlbi9LY29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZwppbmRleCA3OWNjNzUw
OTZmNDIzMi4uYTUwZGFkZDAxMDkzMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL0tjb25maWcK
KysrIGIvZHJpdmVycy94ZW4vS2NvbmZpZwpAQCAtMTQxLDcgKzE0MSw4IEBAIGNvbmZpZyBYRU5f
R05UREVWCiAKIGNvbmZpZyBYRU5fR05UREVWX0RNQUJVRgogCWJvb2wgIkFkZCBzdXBwb3J0IGZv
ciBkbWEtYnVmIGdyYW50IGFjY2VzcyBkZXZpY2UgZHJpdmVyIGV4dGVuc2lvbiIKLQlkZXBlbmRz
IG9uIFhFTl9HTlRERVYgJiYgWEVOX0dSQU5UX0RNQV9BTExPQyAmJiBETUFfU0hBUkVEX0JVRkZF
UgorCWRlcGVuZHMgb24gWEVOX0dOVERFViAmJiBYRU5fR1JBTlRfRE1BX0FMTE9DCisJc2VsZWN0
IERNQV9TSEFSRURfQlVGRkVSCiAJaGVscAogCSAgQWxsb3dzIHVzZXJzcGFjZSBwcm9jZXNzZXMg
YW5kIGtlcm5lbCBtb2R1bGVzIHRvIHVzZSBYZW4gYmFja2VkCiAJICBkbWEtYnVmIGltcGxlbWVu
dGF0aW9uLiBXaXRoIHRoaXMgZXh0ZW5zaW9uIGdyYW50IHJlZmVyZW5jZXMgdG8KLS0gCjIuMjMu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
