Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D90A4B5D
	for <lists+xen-devel@lfdr.de>; Sun,  1 Sep 2019 21:27:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4VS2-00081E-SJ; Sun, 01 Sep 2019 19:23:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=asmH=W4=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i4VS1-000819-Pm
 for xen-devel@lists.xenproject.org; Sun, 01 Sep 2019 19:23:49 +0000
X-Inumbo-ID: 05f372f2-ccee-11e9-ac23-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05f372f2-ccee-11e9-ac23-bc764e2007e4;
 Sun, 01 Sep 2019 19:23:48 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id b10so517531plr.4
 for <xen-devel@lists.xenproject.org>; Sun, 01 Sep 2019 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MYmyqV51fBjQuhWN4wRJPBtp4cf5jebojptEpCVLVOk=;
 b=TjHWNZc0ZSAdLlICAmRNnY+1VKMb8ksQKlv2+3dqXX/Od6eAOEyRzvUwKpJvFshVrH
 HrrR7AzO7vyxkqqq8e3qYBKsKhC710WpwJN5/HLGqabKuwsVKvT8Sxq69tP2BrP4baWQ
 TA1MQp/Z3dMDgmRYKP/hQw4iGFquZ8eBXYA2xQazOg9QcT0Mqd4MnqWbbiBmuBpqBjle
 PLMS6HCjOTxicYWnq0Tbkd59InVsarbuDZZylarrhkkwwRu1H69HlAunEjCuH+pw53pV
 iqK/4yVXBpneAsahpXA1yg5WXLEApVp2prY059J8ZTkETMIFe9z2++wpWf0qXGy8sUHH
 AT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MYmyqV51fBjQuhWN4wRJPBtp4cf5jebojptEpCVLVOk=;
 b=WXQfkGPpq5cPUSRPsz2SBD2l7cCXjMTGoRgUaLizjzyJgyWFMtUMSWBFyOYVXUdsen
 oYDOvAQgzAKBY+7blDXrpycCo+OswiiAhVVshYqqkvK3/1rs3TYOUwpY/63xrjPyN7Dp
 XlCCcMnipkDKTI1nYb/KUeTE1saQEQZyC0OWv5GhEcubI36q1geszwEGH5/4gWb+u06g
 +TImj0JrA6OUmCuZnonqWl5dtkFC72r834B1WpZyX6SCf0ibSC4oVcHc88BPzhzPoZE+
 8EZsoZx57j9MbV4EEBleLrOOUiO9eMsEYB/04ZtN/H3apMC/1UumR6MmKE++ebR6Ahxu
 U77A==
X-Gm-Message-State: APjAAAUcXGbXSBE1KJj6QjQ06LjzSWdufCTs/SOHxWqU6Vwq96GieMWD
 sw9goxrS5oMpAXpEH9s9KD4=
X-Google-Smtp-Source: APXvYqxVwAyX5i9CZCLq1N9HsR4W+F1HPa3PbBb79wf4iu91tGmUo6frN78M/h5qjGemTUYvUXOSQQ==
X-Received: by 2002:a17:902:744a:: with SMTP id
 e10mr20291723plt.239.1567365828132; 
 Sun, 01 Sep 2019 12:23:48 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([106.51.20.96])
 by smtp.gmail.com with ESMTPSA id s7sm21910679pfb.138.2019.09.01.12.23.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 01 Sep 2019 12:23:46 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org
Date: Mon,  2 Sep 2019 00:58:56 +0530
Message-Id: <1567366136-874-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [Xen-devel] [PATCH] swiotlb-zen: Convert to use macro
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmF0aGVyIHRoYW4gdXNpbmcgc3RhdGljIGludCBtYXhfZG1hX2JpdHMsIHRoaXMKY2FuIGJlIGNv
dmVydGVkIHRvIHVzZSBhcyBtYWNyby4KClNpZ25lZC1vZmYtYnk6IFNvdXB0aWNrIEpvYXJkZXIg
PGpyZHIubGludXhAZ21haWwuY29tPgotLS0KIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCA1
ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lv
dGxiLXhlbi5jCmluZGV4IGFlMWRmNDkuLmQxZWNlZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVu
L3N3aW90bGIteGVuLmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAtMzgsNiAr
MzgsNyBAQAogI2luY2x1ZGUgPGFzbS94ZW4vcGFnZS1jb2hlcmVudC5oPgogCiAjaW5jbHVkZSA8
dHJhY2UvZXZlbnRzL3N3aW90bGIuaD4KKyNkZWZpbmUgTUFYX0RNQV9CSVRTIDMyCiAvKgogICog
VXNlZCB0byBkbyBhIHF1aWNrIHJhbmdlIGNoZWNrIGluIHN3aW90bGJfdGJsX3VubWFwX3Npbmds
ZSBhbmQKICAqIHN3aW90bGJfdGJsX3N5bmNfc2luZ2xlXyosIHRvIHNlZSBpZiB0aGUgbWVtb3J5
IHdhcyBpbiBmYWN0IGFsbG9jYXRlZCBieSB0aGlzCkBAIC0xMTQsOCArMTE1LDYgQEAgc3RhdGlj
IGludCBpc194ZW5fc3dpb3RsYl9idWZmZXIoZG1hX2FkZHJfdCBkbWFfYWRkcikKIAlyZXR1cm4g
MDsKIH0KIAotc3RhdGljIGludCBtYXhfZG1hX2JpdHMgPSAzMjsKLQogc3RhdGljIGludAogeGVu
X3N3aW90bGJfZml4dXAodm9pZCAqYnVmLCBzaXplX3Qgc2l6ZSwgdW5zaWduZWQgbG9uZyBuc2xh
YnMpCiB7CkBAIC0xMzUsNyArMTM0LDcgQEAgc3RhdGljIGludCBpc194ZW5fc3dpb3RsYl9idWZm
ZXIoZG1hX2FkZHJfdCBkbWFfYWRkcikKIAkJCQlwICsgKGkgPDwgSU9fVExCX1NISUZUKSwKIAkJ
CQlnZXRfb3JkZXIoc2xhYnMgPDwgSU9fVExCX1NISUZUKSwKIAkJCQlkbWFfYml0cywgJmRtYV9o
YW5kbGUpOwotCQl9IHdoaWxlIChyYyAmJiBkbWFfYml0cysrIDwgbWF4X2RtYV9iaXRzKTsKKwkJ
fSB3aGlsZSAocmMgJiYgZG1hX2JpdHMrKyA8IE1BWF9ETUFfQklUUyk7CiAJCWlmIChyYykKIAkJ
CXJldHVybiByYzsKIAotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
