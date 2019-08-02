Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A777EB2E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 06:18:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htOxa-0005sw-45; Fri, 02 Aug 2019 04:14:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOWY=V6=gmail.com=john.hubbard@srs-us1.protection.inumbo.net>)
 id 1htNBR-00077l-66
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 02:20:41 +0000
X-Inumbo-ID: 1eabf70f-b4cc-11e9-8980-bc764e045a96
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1eabf70f-b4cc-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 02:20:39 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id o13so35219411pgp.12
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 19:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0y5rJgolnpdx1vwnOpLTxW7O4fuw+3wJL+gU2Q7/qgc=;
 b=XcvG9OtyU86jk5JnQKO48GBJW89xfPHHxg+Ne0d0GJwSK2IuihtMCJFR8pabDqBzEF
 DuPSfNePU528rZ6hBUi+QFYoZILMY8tdggEmTr3mN7PzDRJ7a6OmrfV2tsrS8kf2+6HI
 Zo6kU0MY4gjn6C4vTTeXk9IHVKARwawE7INoHfJ5sfq56uo1gVj3e8g1oiz6b7OI/wgS
 KnIyWK9Z49VV7ULXr41yNDN0bWyja3EYTBz6mLtPsaZCe7aB+yHXvCTEBAOwbU3wp1bf
 uiomAHYjSX4K0Tach88phQCyk3zfRucll/enDp2U+3MmHAZ/atNajIitsMHfeEHfycq9
 ft2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0y5rJgolnpdx1vwnOpLTxW7O4fuw+3wJL+gU2Q7/qgc=;
 b=FI+WICIgf0LNY0WOSAlB+z5G/bZfEitxCWfGHBnvEUChZdAX23IRVSafQyQg/N64nm
 bPT8CJS7VcW3doDsc9EhS15PNzoke7wo19b0EcKGjXNAX24SG+r65+oIUThskhWgFFyZ
 A1oLcqnq341LY+PUEO9wYIapRJtyXMRUmZp4S29fEiS/kFyYJNE4tCDmWXBDyEp065wZ
 YXq83SU1bRSadcnOIQwbqOGQqlCNLZrPxq6SXg9o3dMXsaaqartHd14yi6EGsc8gpybl
 hvGDgPk+2SV/RJb3yv4Mka1n7WlpUlYBKVCLfPauGOmffDXaupB2MG+VpDC/3JM7tz7c
 Ni5g==
X-Gm-Message-State: APjAAAWcYdc+tq1fLVdBOKD1fDouu3Yvb0EtTCipYAd/m2QhMeTVUgAz
 OBPZpcb6ejQYcP/IWufZgn0=
X-Google-Smtp-Source: APXvYqwl6c8l8akPJ/a0xk+3KepmeSM3zSOQCzHQzAg87pSWv9yrqkhky05R7WwjG4AiAw2gALdPbw==
X-Received: by 2002:a17:90a:b908:: with SMTP id
 p8mr1903028pjr.94.1564712438974; 
 Thu, 01 Aug 2019 19:20:38 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:38 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu,  1 Aug 2019 19:19:48 -0700
Message-Id: <20190802022005.5117-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 04:14:22 +0000
Subject: [Xen-devel] [PATCH 17/34] vfio: convert put_page() to
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
YXRlLgoKQXMgQ2hyaXN0b3BoZSBIZWxsd2lnIHB1dCBpdCwgInNldF9wYWdlX2RpcnR5KCkgaXMg
b25seSBzYWZlIGlmIHdlIGFyZQpkZWFsaW5nIHdpdGggYSBmaWxlIGJhY2tlZCBwYWdlIHdoZXJl
IHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBpdApoYW5ncyBvZmYuIiBbMV0KClsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdCNzIwQGxzdC5kZQoKQ2M6
IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+CkNjOiBrdm1Admdl
ci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KLS0tCiBkcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIHwgOCArKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jIGIvZHJpdmVycy92ZmlvL3ZmaW9f
aW9tbXVfdHlwZTEuYwppbmRleCAwNTQzOTFmMzBmYTguLjVhNTQ2MWExNDI5OSAxMDA2NDQKLS0t
IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYworKysgYi9kcml2ZXJzL3ZmaW8vdmZp
b19pb21tdV90eXBlMS5jCkBAIC0zMjAsOSArMzIwLDkgQEAgc3RhdGljIGludCBwdXRfcGZuKHVu
c2lnbmVkIGxvbmcgcGZuLCBpbnQgcHJvdCkKIHsKIAlpZiAoIWlzX2ludmFsaWRfcmVzZXJ2ZWRf
cGZuKHBmbikpIHsKIAkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fcGFnZShwZm4pOwotCQlp
ZiAocHJvdCAmIElPTU1VX1dSSVRFKQotCQkJU2V0UGFnZURpcnR5KHBhZ2UpOwotCQlwdXRfcGFn
ZShwYWdlKTsKKwkJYm9vbCBkaXJ0eSA9IHByb3QgJiBJT01NVV9XUklURTsKKworCQlwdXRfdXNl
cl9wYWdlc19kaXJ0eV9sb2NrKCZwYWdlLCAxLCBkaXJ0eSk7CiAJCXJldHVybiAxOwogCX0KIAly
ZXR1cm4gMDsKQEAgLTM1Niw3ICszNTYsNyBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9wZm4oc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCiAJCSAqLwogCQlpZiAocmV0
ID4gMCAmJiB2bWFfaXNfZnNkYXgodm1hc1swXSkpIHsKIAkJCXJldCA9IC1FT1BOT1RTVVBQOwot
CQkJcHV0X3BhZ2UocGFnZVswXSk7CisJCQlwdXRfdXNlcl9wYWdlKHBhZ2VbMF0pOwogCQl9CiAJ
fQogCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0tIAoyLjIyLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
