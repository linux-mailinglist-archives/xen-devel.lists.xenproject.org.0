Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92828A51E8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 10:37:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4hnd-0005NS-No; Mon, 02 Sep 2019 08:34:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x8iY=W5=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i4hnc-0005NJ-Ah
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 08:34:56 +0000
X-Inumbo-ID: 8a63f84a-cd5c-11e9-b95f-bc764e2007e4
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a63f84a-cd5c-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 08:34:55 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id p3so7119426pgb.9
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2019 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uFmY0zGFn+EQnA57VOg3VeO9qiRTqjJoOe1gdV98IwA=;
 b=cYu84DUjPTKSgEfeLZtea5ZEO+oEaJLALl1KB7muOH5m/fFs57yP+LCBWA6ArhPio2
 WkWh2wrJ47bV5YbLwT4iwCqb0Ai/rODNnzr2DLp/L4oyyVLmYnl8diGTiWZcLmPts4RT
 Fvycb5VDcIqhCDQUwOkf5B/KrPFRGEDMpFQ0ye36mXAuIE2ktSav4aoIKXNO5UKgjCs9
 XeRU/NPTPSKO6SIsAXPP6l9CAopbF2aMh6wQABGv4Bll8xPxRW8O0MHHWhR31XaYpl8N
 rSDNcLd/VdJKmITmEkdXcJB0iI2uADXabuFqj6oUAtUumdu4JVui5i97iRe4w4fSGhL9
 VORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uFmY0zGFn+EQnA57VOg3VeO9qiRTqjJoOe1gdV98IwA=;
 b=IpSs9CBYgS8z/7Fzo9MWjkFbxuCZYpJrms+nhkS0m0wyL2MFz/oIvfRgtmKYLHSbGn
 VFe4J3sugrh5Sv3w7oswPQK8+P0YfB1rdQCTRTeLLHOrD7nhE4vp+Q6jULuFqXR4kepP
 jem4aNUu/Yl4oxRNwnxHxsUl+9qwMSqteKkEt5sLjqt5CsRFAijpSby65cjvL7Tb3X57
 65tQEaFDXkLQg0uuqGvHBwzG5Vu6s36D76pkUowV/TApZHMMh02Vryo6K6bkq/I+4o2n
 M4co4QopSoRfOiuKnZ1ujqxMvPFRj1EsvbyQl7vawWgqTGwbU7g9ZshKbcdM52tFXGuK
 vOCw==
X-Gm-Message-State: APjAAAWTS53x+p07iWcaKLbdCJd5rNO599yyiJqti9jdiyojpF1h5jmA
 tliNqNFK6++4PQSrqdyY4gE=
X-Google-Smtp-Source: APXvYqykyTr1V1UXoAhEng9PvF5ygE64bFW8pzDF90EN8gbWoiWOHtdCIKRzyJWgs9NYY7KHzCPF3A==
X-Received: by 2002:a63:184b:: with SMTP id 11mr25468636pgy.112.1567413294974; 
 Mon, 02 Sep 2019 01:34:54 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([49.207.50.39])
 by smtp.gmail.com with ESMTPSA id g9sm6977813pjl.0.2019.09.02.01.34.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 02 Sep 2019 01:34:53 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org
Date: Mon,  2 Sep 2019 14:09:58 +0530
Message-Id: <1567413598-4477-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH v2] swiotlb-xen: Convert to use macro
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
Cc: Souptick Joarder <jrdr.linux@gmail.com>, xen-devel@lists.xenproject.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 sabyasachi.linux@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmF0aGVyIHRoYW4gdXNpbmcgc3RhdGljIGludCBtYXhfZG1hX2JpdHMsIHRoaXMKY2FuIGJlIGNv
dmVydGVkIHRvIHVzZSBhcyBtYWNyby4KClNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIg
PGpyZHIubGludXhAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCA1ICsrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCmlu
ZGV4IGFlMWRmNDkuLmQxZWNlZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVu
LmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAtMzgsNiArMzgsNyBAQAogI2lu
Y2x1ZGUgPGFzbS94ZW4vcGFnZS1jb2hlcmVudC5oPgogCiAjaW5jbHVkZSA8dHJhY2UvZXZlbnRz
L3N3aW90bGIuaD4KKyNkZWZpbmUgTUFYX0RNQV9CSVRTIDMyCiAvKgogICogVXNlZCB0byBkbyBh
IHF1aWNrIHJhbmdlIGNoZWNrIGluIHN3aW90bGJfdGJsX3VubWFwX3NpbmdsZSBhbmQKICAqIHN3
aW90bGJfdGJsX3N5bmNfc2luZ2xlXyosIHRvIHNlZSBpZiB0aGUgbWVtb3J5IHdhcyBpbiBmYWN0
IGFsbG9jYXRlZCBieSB0aGlzCkBAIC0xMTQsOCArMTE1LDYgQEAgc3RhdGljIGludCBpc194ZW5f
c3dpb3RsYl9idWZmZXIoZG1hX2FkZHJfdCBkbWFfYWRkcikKIAlyZXR1cm4gMDsKIH0KIAotc3Rh
dGljIGludCBtYXhfZG1hX2JpdHMgPSAzMjsKLQogc3RhdGljIGludAogeGVuX3N3aW90bGJfZml4
dXAodm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSwgdW5zaWduZWQgbG9uZyBuc2xhYnMpCiB7CkBAIC0x
MzUsNyArMTM0LDcgQEAgc3RhdGljIGludCBpc194ZW5fc3dpb3RsYl9idWZmZXIoZG1hX2FkZHJf
dCBkbWFfYWRkcikKIAkJCQlwICsgKGkgPDwgSU9fVExCX1NISUZUKSwKIAkJCQlnZXRfb3JkZXIo
c2xhYnMgPDwgSU9fVExCX1NISUZUKSwKIAkJCQlkbWFfYml0cywgJmRtYV9oYW5kbGUpOwotCQl9
IHdoaWxlIChyYyAmJiBkbWFfYml0cysrIDwgbWF4X2RtYV9iaXRzKTsKKwkJfSB3aGlsZSAocmMg
JiYgZG1hX2JpdHMrKyA8IE1BWF9ETUFfQklUUyk7CiAJCWlmIChyYykKIAkJCXJldHVybiByYzsK
IAotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
