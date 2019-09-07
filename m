Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4864AC991
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 23:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6iSj-0007Va-GZ; Sat, 07 Sep 2019 21:41:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PlyV=XC=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1i6iSi-0007VG-03
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2019 21:41:40 +0000
X-Inumbo-ID: 4600f990-d1b8-11e9-978d-bc764e2007e4
Received: from mail-pf1-x444.google.com (unknown [2607:f8b0:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4600f990-d1b8-11e9-978d-bc764e2007e4;
 Sat, 07 Sep 2019 21:41:39 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id y72so6729301pfb.12
 for <xen-devel@lists.xenproject.org>; Sat, 07 Sep 2019 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=roF+iHytDA2OpX6EAs6vae/MbSREfIb/2EmgYW70LGY=;
 b=LCqusXStz2S5t5Jo03KSnHbdxvW5JnsBIMaaxJRM/k++WE4/icVGE/B9clTcqDPqzr
 e+6bcZNXENyZPcxqezTzfGSBa1s2TTVHZSswaU1Q/gsVktt+7t4uh6VhJs2wcOEH+rK2
 7EINf8UFuBSovxqmpSsvGmkG7tPc2yxjQt9m58rxPK7IS7zOWR4d+Fv0Qwyp7lzd0wnl
 KHjiirC1iZTH9ejrMEEPJ859Vod3vSehrRREj21RGvtTebumbB5EmAPCweCBjVlNlnoX
 xhc2cIqSXEGo0SCZjGNrGJGibWee8BvXhvv/LQ1Qyc2aoKu/JzyGwG0fBb4wq6PYyw7Q
 Nl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=roF+iHytDA2OpX6EAs6vae/MbSREfIb/2EmgYW70LGY=;
 b=OHdSlcJbiCBPUDEz+Z08251ixz/EoDJbsqRJaqPiafA0BpcVctBGBj+4PTkexLdXJd
 eGfC83pFfD0X/dVDWZqhgC/Z42PzwD4w1EDvEy34SyMJqcWDBstxU6ydNlf4LQjfgPBz
 YBFXxBW5LK4dG8YgcQh0oD3+I/OrsFVOuxAL9HYf6tTfpNwUY5czUeUaAM8m3htAuTWz
 f4FvAHQfEu/MfL3XX/Ka0WILFw4PUMSnE9EiGGMfosom4f6FtAfvGCoJgmwNhMt1guAI
 MCOpBhuIPLFLjoX+aERXKrKsMry0RbP9eKw/61UKWJ/YPLcfkSKli1GdrbQnMQbRbgWX
 zsug==
X-Gm-Message-State: APjAAAUW5xjUL1YeePGndUuuSO5fj5aW7mlCvDhaNBpIAwH7DFDPEMPp
 TJTdVZLMLanZNrCLinSfoU4=
X-Google-Smtp-Source: APXvYqyFSnMx/7lAMSE2e3lPA0RN+xaQcUoIMVlsQ0qfqgUp72SQW3UUmlrUThMTSeTxYPzNir9e5Q==
X-Received: by 2002:aa7:955d:: with SMTP id w29mr18821170pfq.60.1567892498622; 
 Sat, 07 Sep 2019 14:41:38 -0700 (PDT)
Received: from localhost.localdomain ([112.79.80.177])
 by smtp.gmail.com with ESMTPSA id h11sm9078516pgv.5.2019.09.07.14.41.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 07 Sep 2019 14:41:37 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 sashal@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, akpm@linux-foundation.org, david@redhat.com,
 osalvador@suse.com, mhocko@suse.com, pasha.tatashin@soleen.com,
 dan.j.williams@intel.com, richard.weiyang@gmail.com, cai@lca.pw
Date: Sun,  8 Sep 2019 03:17:04 +0530
Message-Id: <9afe6c5a18158f3884a6b302ac2c772f3da49ccc.1567889743.git.jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
Subject: [Xen-devel] [PATCH 3/3] mm/memory_hotplug.c: Remove
 __online_page_set_limits()
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
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXMgYm90aCB0aGUgY2FsbGVycyBvZiB0aGlzIGR1bW15IF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0
cygpCmlzIHJlbW92ZWQsIHRoaXMgY2FuIGJlIHJlbW92ZWQgcGVybWFuZW50bHkuCgpTaWduZWQt
b2ZmLWJ5OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KLS0tCiBpbmNs
dWRlL2xpbnV4L21lbW9yeV9ob3RwbHVnLmggfCAxIC0KIG1tL21lbW9yeV9ob3RwbHVnLmMgICAg
ICAgICAgICB8IDUgLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbW9yeV9ob3RwbHVnLmggYi9pbmNsdWRlL2xpbnV4L21l
bW9yeV9ob3RwbHVnLmgKaW5kZXggZjQ2ZWE3MS4uOGVlM2EyYSAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9tZW1vcnlfaG90cGx1Zy5oCisrKyBiL2luY2x1ZGUvbGludXgvbWVtb3J5X2hvdHBs
dWcuaApAQCAtMTA1LDcgKzEwNSw2IEBAIGV4dGVybiB1bnNpZ25lZCBsb25nIF9fb2ZmbGluZV9p
c29sYXRlZF9wYWdlcyh1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwKIGV4dGVybiBpbnQgc2V0X29u
bGluZV9wYWdlX2NhbGxiYWNrKG9ubGluZV9wYWdlX2NhbGxiYWNrX3QgY2FsbGJhY2spOwogZXh0
ZXJuIGludCByZXN0b3JlX29ubGluZV9wYWdlX2NhbGxiYWNrKG9ubGluZV9wYWdlX2NhbGxiYWNr
X3QgY2FsbGJhY2spOwogCi1leHRlcm4gdm9pZCBfX29ubGluZV9wYWdlX3NldF9saW1pdHMoc3Ry
dWN0IHBhZ2UgKnBhZ2UpOwogZXh0ZXJuIHZvaWQgX19vbmxpbmVfcGFnZV9pbmNyZW1lbnRfY291
bnRlcnMoc3RydWN0IHBhZ2UgKnBhZ2UpOwogZXh0ZXJuIHZvaWQgX19vbmxpbmVfcGFnZV9mcmVl
KHN0cnVjdCBwYWdlICpwYWdlKTsKIApkaWZmIC0tZ2l0IGEvbW0vbWVtb3J5X2hvdHBsdWcuYyBi
L21tL21lbW9yeV9ob3RwbHVnLmMKaW5kZXggYzczZjA5OS4uZGMwMTE4ZiAxMDA2NDQKLS0tIGEv
bW0vbWVtb3J5X2hvdHBsdWcuYworKysgYi9tbS9tZW1vcnlfaG90cGx1Zy5jCkBAIC02MDQsMTEg
KzYwNCw2IEBAIGludCByZXN0b3JlX29ubGluZV9wYWdlX2NhbGxiYWNrKG9ubGluZV9wYWdlX2Nh
bGxiYWNrX3QgY2FsbGJhY2spCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChyZXN0b3JlX29ubGluZV9w
YWdlX2NhbGxiYWNrKTsKIAotdm9pZCBfX29ubGluZV9wYWdlX3NldF9saW1pdHMoc3RydWN0IHBh
Z2UgKnBhZ2UpCi17Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChfX29ubGluZV9wYWdlX3NldF9saW1p
dHMpOwotCiB2b2lkIF9fb25saW5lX3BhZ2VfaW5jcmVtZW50X2NvdW50ZXJzKHN0cnVjdCBwYWdl
ICpwYWdlKQogewogCWFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQocGFnZSwgMSk7Ci0tIAoxLjku
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
