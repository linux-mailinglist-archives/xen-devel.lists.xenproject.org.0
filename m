Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75013D7EC2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 20:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKRMp-0007AV-Bq; Tue, 15 Oct 2019 18:16:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zGM7=YI=ziepe.ca=jgg@srs-us1.protection.inumbo.net>)
 id 1iKRMn-0007AP-IH
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 18:16:17 +0000
X-Inumbo-ID: e116b5d2-ef77-11e9-8aca-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e116b5d2-ef77-11e9-8aca-bc764e2007e4;
 Tue, 15 Oct 2019 18:16:17 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z19so48300862ior.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 11:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5hGScokWqPgLdbBrk4RHza3Svxdrvt3RelMxzxNGX0=;
 b=IY7PaWcEoDxVF3RjzcFddJeqHnKCTQPHXfIpy/ZpttwuBMU0ukD62rv6NJn+q87jla
 IXutZA2u26Vor+s0oQSuxsRNrCPfLDsESVJ589Opd1LZ0R+URK4YBD+kFwmLrLBoPU6/
 QrUUkUIpST04E4tqDxJ+Jk1U4drJBIlnSZxYI4Bl4QDVhl0PK2MSM5oGR/kUL3z3tNDu
 6o4NOh44rhJyXMoM/uAh1nLdvonpdj8vdasf+naCfwSj0CId6hBhiy07gmILqk/KgFay
 UnZ7D83P4q5IJpWb+fT+I50stolQCQKdlumEuIxFdDr35X2DLJl56axpTHUNubqqx/HW
 iEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5hGScokWqPgLdbBrk4RHza3Svxdrvt3RelMxzxNGX0=;
 b=lMxbEURznL1YpuQ8/xIf0oEv/of5kg37AvpBc6udrD0Zdh+NHzYEJtrhF4inIl2gYI
 ZVEUoLvxX30Ulq1UmXgJo4k7bT73d7dOOhVEdbhCeIyJgZXKQmCysnvn82bMN+/5xUtf
 CzhzeMp+kPJaQ8M3kVd5zFRnZ/SLuTnt+zswmjXEh7E5YbO27ojkL4BorrGYw4/qaYTQ
 PP8rHNv+JqSY14mLndccJ16aRJe0TntL18gzqnmd+UnEcQLIhAtyThoEFyT6dPTid9jd
 GmCjjo8chLHtRj17stEU33csX2T79sUIPc3PlJy1Sju3g5eLccQrAfhh+LmGPRxIK1Os
 cKOQ==
X-Gm-Message-State: APjAAAXyGeVhODQncs7U67FkOcnsnV7jMlJ3zKfecLvknsHcIfFayNhU
 46v4dJzU08vClDYmEAx9teh2EA==
X-Google-Smtp-Source: APXvYqwCqiYZ3SkEMQblXOUCwi4JhQL5teRlUkU0KcRoGUDDLgO1heLLmHRP1RmYbHcG9FHn93aEFA==
X-Received: by 2002:a92:5a9b:: with SMTP id b27mr7441321ilg.180.1571163376436; 
 Tue, 15 Oct 2019 11:16:16 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id b3sm2941671iln.42.2019.10.15.11.16.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:16 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002CL-IH; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Date: Tue, 15 Oct 2019 15:12:35 -0300
Message-Id: <20191015181242.8343-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH hmm 08/15] xen/gntdev: Use select for
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9LY29uZmlnIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi9LY29uZmlnIGIvZHJpdmVycy94ZW4vS2NvbmZpZwppbmRleCA3OWNjNzUwOTZm
NDIzMi4uYTUwZGFkZDAxMDkzMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL0tjb25maWcKKysr
IGIvZHJpdmVycy94ZW4vS2NvbmZpZwpAQCAtMTQxLDcgKzE0MSw4IEBAIGNvbmZpZyBYRU5fR05U
REVWCiAKIGNvbmZpZyBYRU5fR05UREVWX0RNQUJVRgogCWJvb2wgIkFkZCBzdXBwb3J0IGZvciBk
bWEtYnVmIGdyYW50IGFjY2VzcyBkZXZpY2UgZHJpdmVyIGV4dGVuc2lvbiIKLQlkZXBlbmRzIG9u
IFhFTl9HTlRERVYgJiYgWEVOX0dSQU5UX0RNQV9BTExPQyAmJiBETUFfU0hBUkVEX0JVRkZFUgor
CWRlcGVuZHMgb24gWEVOX0dOVERFViAmJiBYRU5fR1JBTlRfRE1BX0FMTE9DCisJc2VsZWN0IERN
QV9TSEFSRURfQlVGRkVSCiAJaGVscAogCSAgQWxsb3dzIHVzZXJzcGFjZSBwcm9jZXNzZXMgYW5k
IGtlcm5lbCBtb2R1bGVzIHRvIHVzZSBYZW4gYmFja2VkCiAJICBkbWEtYnVmIGltcGxlbWVudGF0
aW9uLiBXaXRoIHRoaXMgZXh0ZW5zaW9uIGdyYW50IHJlZmVyZW5jZXMgdG8KLS0gCjIuMjMuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
