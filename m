Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EDB11FDDC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 06:22:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igimz-0006UF-0c; Mon, 16 Dec 2019 05:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gqp3=2F=umn.edu=pakki001@srs-us1.protection.inumbo.net>)
 id 1igaGr-0003xT-Ss
 for xen-devel@lists.xenproject.org; Sun, 15 Dec 2019 20:13:41 +0000
X-Inumbo-ID: 5deb11e6-1f77-11ea-a914-bc764e2007e4
Received: from mta-p8.oit.umn.edu (unknown [134.84.196.208])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5deb11e6-1f77-11ea-a914-bc764e2007e4;
 Sun, 15 Dec 2019 20:13:32 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 47bbFS351Rz9vY78
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 20:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JRPeiZTjgWYN for <xen-devel@lists.xenproject.org>;
 Sun, 15 Dec 2019 14:13:32 -0600 (CST)
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 47bbFS27Srz9vY6y
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 14:13:32 -0600 (CST)
Received: by mail-yb1-f197.google.com with SMTP id e11so4971191ybn.12
 for <xen-devel@lists.xenproject.org>; Sun, 15 Dec 2019 12:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EV3d9IrHuviw6NuP0prZ+L56BjgZrxEmg7Osn+ldLeY=;
 b=DAEclJHhiwU1JiAx6Swl3XCgRzafLipHbCsIVaj5z9LYNzqOAZW9w5kdRSlZOPBnPH
 xnE2+TXUGknqfCVyu2aHgFsJjQug1n+ub63TfO56HYcLSpv7VIQFKLB3q4BvCFC3vIj1
 miQxJXXvjQof9NQmXTeaJ1k6zeRPguw0aYkMu6lEVdUWNt5JDIzMat8B46oT4XxrWtD6
 c759KpV05FW/3kQsaGejmQrlUNY3JAa+iUoIm7yumiJl8zor7MDuveDZQ2K8RKV/2ywD
 5IIMq61m0nCcXdoE9TFqZN/KWG65/jfwahOWr1Ev/+o/bl3phO5KCp19FQIvlBA5Z8Wc
 505w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EV3d9IrHuviw6NuP0prZ+L56BjgZrxEmg7Osn+ldLeY=;
 b=Fm+2x+lY/Pwmf/lWN0AKMRhJz8zKiXi+pMGLfy7ggjuGQnVfhctb8gw54XF21ZXkMF
 RYtk168vivVOuQuh8p/7acfSTw1qGUvaFXrTa9A8z+eW0SVdU79jPGdAB/Y70mXXuYFr
 7pEZObaVKxpUS/FWfgFS23y0Inoxc5SJpwRo1ZsKa1esZj64SxUn8VQX/3kn2R9HoSb2
 XDiozf5O+oHX4BaPLJj3TkpFVXJkI+GKBywRMsvoEBjG1JApVbYP8Qik9Ews0PmAqq9c
 u7HahvlcqWDt5vy9g7nnDhQfWDHMjhVFCFaL1YKYwQ1nCbgAaGfXO9Ffjj+iiQ4pMttf
 aJ0Q==
X-Gm-Message-State: APjAAAUqbGbk55xnDqYyB/YMuVhAeaxQEqLXC7KOMqchBtoARi66rWYN
 OrK5pqOsYJUAx/lwn9EeMkdbjWf1OviuMJ2GgoGXo23p1GsG1s1L7m5zIZxdOhfwFgp9JgA2gJE
 Zv5TT6e1it9jAdgLAF6jjsVEtOg8cSpY=
X-Received: by 2002:a25:d80d:: with SMTP id p13mr140461ybg.160.1576440811793; 
 Sun, 15 Dec 2019 12:13:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqw2aXNgpQh2rdh1zAq/XXv8ZBWxNTw/1xzYwr/dwL99HLrUehUYmqdJX5ABNij4OyLLRVnmEw==
X-Received: by 2002:a25:d80d:: with SMTP id p13mr140448ybg.160.1576440811576; 
 Sun, 15 Dec 2019 12:13:31 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu.
 [128.101.106.66])
 by smtp.gmail.com with ESMTPSA id v38sm7251276ywh.63.2019.12.15.12.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 12:13:31 -0800 (PST)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Date: Sun, 15 Dec 2019 14:13:21 -0600
Message-Id: <20191215201321.7439-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Dec 2019 05:19:23 +0000
Subject: [Xen-devel] [PATCH] xen/grant-table: remove unnecessary BUG_ON on
 gnttab_interface
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Z3Jvd19nbnR0YWJfbGlzdCgpIGNoZWNrcyBmb3IgTlVMTCBvbiBnbnR0YWJfaW50ZXJmYWNlIGlt
bWVkaWF0ZWx5CmFmdGVyIGdudHRhYl9leHBhbmQoKSBjaGVjay4gVGhlIHBhdGNoIHJlbW92ZXMg
dGhlIHJlZHVuZGFudCBhc3NlcnRpb24KYW5kIHJlcGxhY2VzIHRoZSBCVUdfT04gY2FsbCB3aXRo
IHJlY292ZXJ5IGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgUGFra2kgPHBha2tpMDAxQHVt
bi5lZHU+Ci0tLQogZHJpdmVycy94ZW4vZ3JhbnQtdGFibGUuYyB8IDkgKysrKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMgYi9kcml2ZXJzL3hlbi9ncmFudC10YWJsZS5jCmlu
ZGV4IDQ5YjM4MWUxMDRlZi4uZjU5Njk0YzM1MmJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9n
cmFudC10YWJsZS5jCisrKyBiL2RyaXZlcnMveGVuL2dyYW50LXRhYmxlLmMKQEAgLTY2NCw3ICs2
NjQsNiBAQCBzdGF0aWMgaW50IGdyb3dfZ250dGFiX2xpc3QodW5zaWduZWQgaW50IG1vcmVfZnJh
bWVzKQogCXVuc2lnbmVkIGludCBucl9nbGlzdF9mcmFtZXMsIG5ld19ucl9nbGlzdF9mcmFtZXM7
CiAJdW5zaWduZWQgaW50IGdyZWZzX3Blcl9mcmFtZTsKIAotCUJVR19PTihnbnR0YWJfaW50ZXJm
YWNlID09IE5VTEwpOwogCWdyZWZzX3Blcl9mcmFtZSA9IGdudHRhYl9pbnRlcmZhY2UtPmdyZWZz
X3Blcl9ncmFudF9mcmFtZTsKIAogCW5ld19ucl9ncmFudF9mcmFtZXMgPSBucl9ncmFudF9mcmFt
ZXMgKyBtb3JlX2ZyYW1lczsKQEAgLTEzODgsNyArMTM4Nyw5IEBAIHN0YXRpYyBpbnQgZ250dGFi
X2V4cGFuZCh1bnNpZ25lZCBpbnQgcmVxX2VudHJpZXMpCiAJaW50IHJjOwogCXVuc2lnbmVkIGlu
dCBjdXIsIGV4dHJhOwogCi0JQlVHX09OKGdudHRhYl9pbnRlcmZhY2UgPT0gTlVMTCk7CisJaWYg
KCFnbnR0YWJfaW50ZXJmYWNlKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCWN1ciA9IG5yX2dyYW50
X2ZyYW1lczsKIAlleHRyYSA9ICgocmVxX2VudHJpZXMgKyBnbnR0YWJfaW50ZXJmYWNlLT5ncmVm
c19wZXJfZ3JhbnRfZnJhbWUgLSAxKSAvCiAJCSBnbnR0YWJfaW50ZXJmYWNlLT5ncmVmc19wZXJf
Z3JhbnRfZnJhbWUpOwpAQCAtMTQyMyw3ICsxNDI0LDkgQEAgaW50IGdudHRhYl9pbml0KHZvaWQp
CiAJLyogRGV0ZXJtaW5lIHRoZSBtYXhpbXVtIG51bWJlciBvZiBmcmFtZXMgcmVxdWlyZWQgZm9y
IHRoZQogCSAqIGdyYW50IHJlZmVyZW5jZSBmcmVlIGxpc3Qgb24gdGhlIGN1cnJlbnQgaHlwZXJ2
aXNvci4KIAkgKi8KLQlCVUdfT04oZ250dGFiX2ludGVyZmFjZSA9PSBOVUxMKTsKKwlpZiAoIWdu
dHRhYl9pbnRlcmZhY2UpCisJCXJldHVybiAtRUlOVkFMOworCiAJbWF4X25yX2dsaXN0X2ZyYW1l
cyA9IChtYXhfbnJfZ3JhbnRfZnJhbWVzICoKIAkJCSAgICAgICBnbnR0YWJfaW50ZXJmYWNlLT5n
cmVmc19wZXJfZ3JhbnRfZnJhbWUgLyBSUFApOwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
