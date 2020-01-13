Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E040E139BB2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:35:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7La-0006eC-5H; Mon, 13 Jan 2020 21:34:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir7LY-0006de-OR
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:34:04 +0000
X-Inumbo-ID: 62ea7bc8-364c-11ea-ac27-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62ea7bc8-364c-11ea-ac27-bc764e2007e4;
 Mon, 13 Jan 2020 21:33:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d16so10166188wre.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jan 2020 13:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+ICfyiaxyl3mYQBkb773eny0WW4m/+Ovdm25iUJNXs=;
 b=koYGnnWbgpDWXJCN5InWLRP9FIAJhj1ke87hT/zjKn4jJTErB91oljS9ca36IJGCZR
 juppKIKmmAwT3u4lEzzTKp83syO4p1Ch9Vt0VvzW2cnDYitxDOo2QNoI5i7FSCfr99HH
 lSuqe4AUhGOt+EhhAeM7iPz4hL/0QYKLLNvFo4nCAUItIRjiAuQmW6bqYVqgAhDLgsAT
 YgFurxDe/YwTJZpr643Fh48Z+GkHjUVXgO/sB06tzGdKoMJ7K0rY8As02PDKRVcY11Zl
 FFrG3JJe4vNgqQ7WeCaKwLELysYVAKNir+fuzlUj0ul1IhFWPKcYI541E+mjfCAkmz9s
 T/Aw==
X-Gm-Message-State: APjAAAX2rzUnCfpOmyc1h93vjaZWnxR+YMIRQWfYCeNUiB/5Jg/qKBy6
 odUXDhXpIfk3onSwYbLk8JRUycvwGy8B+Q==
X-Google-Smtp-Source: APXvYqyUa+MLB5POGRi+focv1/rXqV2rQqKEdHEkgXDkc5Ilnu3p+KiiR5t5oGxNTpAz4eFWLKq18g==
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr20507436wrs.187.1578951228902; 
 Mon, 13 Jan 2020 13:33:48 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id i10sm16938652wru.16.2020.01.13.13.33.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 13:33:48 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 13 Jan 2020 21:33:41 +0000
Message-Id: <20200113213342.8206-4-julien@xen.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200113213342.8206-1-julien@xen.org>
References: <20200113213342.8206-1-julien@xen.org>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] xen/domain: Remove #ifndef surrounding
 alloc_pirq_struct()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCk5vbmUgb2YgdGhlIHN1cHBv
cnRlZCBhcmNoaXRlY3R1cmUgb3ZlcnJpZGUgYWxsb2NfcGlycV9zdHJ1Y3QoKSB3aXRoCmEgbWFj
cm8uIFNvIHJlbW92ZSB0aGUgI2lmZGVmIHN1cnJvdW5kaW5nIHRoZSBwcm90b3R5cGUuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgotLS0KIHhlbi9pbmNs
dWRlL3hlbi9kb21haW4uaCB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW4uaCBiL3hlbi9pbmNsdWRlL3hlbi9k
b21haW4uaAppbmRleCAxY2IyMDVkOTc3Li44OWJmMGExNzIxIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS94ZW4vZG9tYWluLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCkBAIC00MSw5
ICs0MSw3IEBAIHN0cnVjdCB2Y3B1ICphbGxvY192Y3B1X3N0cnVjdChjb25zdCBzdHJ1Y3QgZG9t
YWluICpkKTsKIHZvaWQgZnJlZV92Y3B1X3N0cnVjdChzdHJ1Y3QgdmNwdSAqdik7CiAKIC8qIEFs
bG9jYXRlL2ZyZWUgYSBQSVJRIHN0cnVjdHVyZS4gKi8KLSNpZm5kZWYgYWxsb2NfcGlycV9zdHJ1
Y3QKIHN0cnVjdCBwaXJxICphbGxvY19waXJxX3N0cnVjdChzdHJ1Y3QgZG9tYWluICopOwotI2Vu
ZGlmCiB2b2lkIGZyZWVfcGlycV9zdHJ1Y3Qodm9pZCAqKTsKIAogLyoKLS0gCjIuMjQuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
