Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB823D3D1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 19:18:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hakMy-0006YN-96; Tue, 11 Jun 2019 17:15:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r+TN=UK=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1hakJ2-0006TS-1C
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 17:11:32 +0000
X-Inumbo-ID: f4748b25-8c6b-11e9-8980-bc764e045a96
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4748b25-8c6b-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 17:11:30 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m14so8123460qka.10
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 10:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZWlQYcXiYq4K+TsBHQ76oJw3abz884c7rNhqBJDQvhY=;
 b=qCKV/+lGBKvkrBjqJsoUyqYeqxfmWelo6UACUr6ry5UV2BtTGHymrtmEGdPMZgKhHF
 /Z/dPso4GmW4j+5krN6tcSIPD6l5FdrFI5+chZWWQcEVq1yew2ZfDQhY1gUtLtqjMvmw
 u9n++rSpE+txw9zeMHBXo81Y2SKw6FVRWI2q4su67jMKHP0Jp1dqZsqqf5xYIyxJhDZS
 f7HhDG6EK3kQmzhyXZPB950bv0cX52RRJMdiUlnFJeQzKFX7aHr3LrjiTjl1ayTr5u+y
 sT0WVPOkQSp7ls+C4iS400Ks+Wbg7rUv8/m/77N3doxH9Pa0Guuswv9apM53do90OhXK
 /Nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZWlQYcXiYq4K+TsBHQ76oJw3abz884c7rNhqBJDQvhY=;
 b=cARyPFiiBiwZLz2OduleVbM8R6+yUeqW000r8P2aTg5CXINrVgFqIT9Nti4YKf3qVG
 r5fsU24nzgrnF/tz5Gx+v+8wybe6XOfvE7FBIr1KZgr6nOu95cKUoE3pYZV3LxX2rjIW
 0nvRzsdoEErszDQ02CXaEEkjoRK6Vbj9mTC/9wqcgNnLm862yk0HCKmsJqZpZFegVmgf
 RBBhGLTTD+F5OikMbu6ORPXdzLeGCXDs8PJvamDNj+1eDQYSbOV8TpTXMRZ5rhF6rOyW
 uF1HyiIXnyl/4eJp1vaDdooP7XDqAT8sIWp76LQLOnXuZdWQ5KaTf4qTulLder9T8NvX
 0CUg==
X-Gm-Message-State: APjAAAWS7t1AnDu+R7Qs7mJ3b8VwJtmang8BxnHOSvYm9Fv/+E7bthu5
 T35kAA66eD6vSsJIMn57YzyoPB75XlLmww==
X-Google-Smtp-Source: APXvYqx+hHnpLR27v+s6IikIzaRlfP/H1xdNONaomiuAPaXD4Iw6g7+p5Cn6Sx/XDm4y2QiOn744zw==
X-Received: by 2002:ae9:c10c:: with SMTP id z12mr7963437qki.110.1560273089748; 
 Tue, 11 Jun 2019 10:11:29 -0700 (PDT)
Received: from niko-Latitude-E7470.fios-router.home
 (pool-108-54-183-56.nycmny.fios.verizon.net. [108.54.183.56])
 by smtp.gmail.com with ESMTPSA id q2sm7072848qkf.44.2019.06.11.10.11.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 10:11:29 -0700 (PDT)
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
X-Google-Original-From: Nicholas Tsirakis <tsirakisn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 11 Jun 2019 13:11:24 -0400
Message-Id: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 11 Jun 2019 17:15:35 +0000
Subject: [Xen-devel] [PATCH 1/2] argo: warn sendv() caller when ring is full
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
Cc: Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gaXRzIGN1cnJlbnQgc3RhdGUsIGlmIHRoZSBkZXN0aW5hdGlvbiByaW5nIGlzIGZ1bGwsIHNl
bmR2KCkKd2lsbCByZXF1ZXVlIHRoZSBtZXNzYWdlIGFuZCByZXR1cm4gdGhlIHJjIG9mIHBlbmRp
bmdfcmVxdWV1ZSgpLAp3aGljaCB3aWxsIHJldHVybiAwIG9uIHN1Y2Nlc3MuIFRoaXMgcHJldmVu
dHMgdGhlIGNhbGxlciBmcm9tCmRpc3Rpbmd1aXNoaW5nIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
YSBzdWNjZXNzZnVsIHdyaXRlIGFuZCBhCm1lc3NhZ2UgdGhhdCBuZWVkcyB0byBiZSByZXNlbnQg
YXQgYSBsYXRlciB0aW1lLgoKSW5zdGVhZCwgY2FwdHVyZSB0aGUgLUVBR0FJTiB2YWx1ZSByZXR1
cm5lZCBmcm9tIHJpbmdidWZfaW5zZXJ0KCkKYW5kICpvbmx5KiBvdmVyd3JpdGUgaXQgaWYgdGhl
IHJjIG9mIHBlbmRpbmdfcmVxdWV1ZSgpIGlzIG5vbi16ZXJvLgpUaGlzIGFsbG93cyB0aGUgY2Fs
bGVyIHRvIG1ha2UgaW50ZWxsaWdlbnQgZGVjaXNpb25zIG9uIC1FQUdBSU4gYW5kCnN0aWxsIGJl
IGFsZXJ0ZWQgaWYgdGhlIHBlbmRpbmcgbWVzc2FnZSBmYWlscyB0byByZXF1ZXVlLgoKU2lnbmVk
LW9mZi1ieTogTmljaG9sYXMgVHNpcmFraXMgPHRzaXJha2lzbkBhaW5mb3NlYy5jb20+Ci0tLQog
eGVuL2NvbW1vbi9hcmdvLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIveGVu
L2NvbW1vbi9hcmdvLmMKaW5kZXggMTMwNTJiOTIzOS4uMmY4NzRhNTcwZCAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9hcmdvLmMKKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKQEAgLTIwNDgsOSArMjA0
OCwxMyBAQCBzZW5kdihzdHJ1Y3QgZG9tYWluICpzcmNfZCwgeGVuX2FyZ29fYWRkcl90ICpzcmNf
YWRkciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVzc2FnZV90eXBlLCAmbGVuKTsK
ICAgICAgICAgaWYgKCByZXQgPT0gLUVBR0FJTiApCiAgICAgICAgIHsKKyAgICAgICAgICAgIGlu
dCByYzsKKwogICAgICAgICAgICAgYXJnb19kcHJpbnRrKCJhcmdvX3JpbmdidWZfc2VuZHYgZmFp
bGVkLCBFQUdBSU5cbiIpOwogICAgICAgICAgICAgLyogcmVxdWV1ZSB0byBpc3N1ZSBhIG5vdGlm
aWNhdGlvbiB3aGVuIHNwYWNlIGlzIHRoZXJlICovCi0gICAgICAgICAgICByZXQgPSBwZW5kaW5n
X3JlcXVldWUoZHN0X2QsIHJpbmdfaW5mbywgc3JjX2lkLmRvbWFpbl9pZCwgbGVuKTsKKyAgICAg
ICAgICAgIHJjID0gcGVuZGluZ19yZXF1ZXVlKGRzdF9kLCByaW5nX2luZm8sIHNyY19pZC5kb21h
aW5faWQsIGxlbik7CisgICAgICAgICAgICBpZiAoIHJjICkKKyAgICAgICAgICAgICAgICByZXQg
PSByYzsKICAgICAgICAgfQogCiAgICAgICAgIHNwaW5fdW5sb2NrKCZyaW5nX2luZm8tPkwzX2xv
Y2spOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
