Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED0103C23
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 14:41:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXQBB-0003ei-1q; Wed, 20 Nov 2019 13:37:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jra2=ZM=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iXQB9-0003ed-7E
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 13:37:55 +0000
X-Inumbo-ID: f45855ee-0b9a-11ea-984a-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f45855ee-0b9a-11ea-984a-bc764e2007e4;
 Wed, 20 Nov 2019 13:37:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l7so28188385wrp.6
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2019 05:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PZWcuY2oN+7Ep3IFvr755UeZnU0DmztJosoXS6XHLDQ=;
 b=r0Kdwu5/hekm/JlaqdxpSHhcrXrPriUrUihrp6gWGvOwtanUMlJcQ+mZv3b9ngdT64
 P8oINEMfJ9vRNGvHYk0zhnmLxr7ct/4dZylXPcg9G9V0XLIH31NJ6qPzFLJHiO9T67Gh
 y+VQpDuTLpzB0ZQci2HQNtPjatNlIGPriRrIprqs5vqn93t0/R9pj0ONkFx6rrSLTN0/
 mdEHcccfTys0H7shslTH+mwrEaYoRIUAr8cQglDIoHQpLKR+ZQc8QQ3Mk5lZE9X0BDlo
 YbOzsPfGc3cMM1RTczJxXN2xXxX7z18+6w2JqDqwEvS8X/Z0fRRt9amE6ylsIP07avre
 FuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PZWcuY2oN+7Ep3IFvr755UeZnU0DmztJosoXS6XHLDQ=;
 b=k0j2b8V4V4AF2CQUOFz76qPEJKtKBWkArAvapYEBLWYfzTZqCoqcAKohAT2ShayLRw
 4FhqCuPfrUVi0uyu9Yu/bxcevLHzD6zbWjrkGZjcCa+WxB+XXTpHJoQ8fTfxnyzRHcGw
 Je1wvWbPzQuNgAwNjY4qNbKnAzh9WPlh3ppyabCJ7dpPUQsqsFd2dsh1jz1gept/Na20
 NqRUOmYMabIHFZ1hyQpwGuIv39KdEWS7SGt+k0KsIbAtR84xmQymJoFgoGUfRMHD+ltr
 bnpWPyKB1iQTPgAFGZskDxKb2MDaLsqnLCrC3mtov4YUHxo8l9qZ1fEDr6kcyrvSaYyZ
 pz0Q==
X-Gm-Message-State: APjAAAWC2078vxYogEU1Pd9jWpDVoeKQN7knjLQqkd3vdKGkojul/uK2
 L4XwczbwjxhMaHbyM0Axf7lLJv7LAqY=
X-Google-Smtp-Source: APXvYqwycI33vGnsiHJSJxc9Y3wsSt+Ega0a5exYQqRNUKZt8CKRKvenbQV1dv5z1N8rly2l1p4dIA==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr3496180wrm.359.1574257073608; 
 Wed, 20 Nov 2019 05:37:53 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id p14sm32257236wrq.72.2019.11.20.05.37.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Nov 2019 05:37:53 -0800 (PST)
From: Julien Grall <julien.grall.oss@gmail.com>
X-Google-Original-From: Julien Grall <jgrall@amazon.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 20 Nov 2019 13:37:51 +0000
Message-Id: <20191120133751.67925-1-jgrall@amazon.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen: Add missing va_end() in
 hypercall_create_continuation()
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KClRoZSBkb2N1bWVudGF0aW9uIHJl
cXVpcmVzIHZhX3N0YXJ0KCkgdG8gYWx3YXlzIGJlIG1hdGNoZWQgd2l0aCBhCmNvcnJlc3BvbmRp
bmcgdmFfZW5kKCkuIEhvd2V2ZXIsIHRoaXMgaXMgbm90IHRoZSBjYXNlIGluIHRoZSBwYXRoIHVz
ZWQKZm9yIGJhZCBmb3JtYXQuCgpUaGlzIHdhcyBpbnRyb2R1Y2VkIGJ5IFhTQS0yOTYuCgpDb3Zl
cml0eS1JRDogMTQ4ODcyNwpGaXhlczogMGJmOWY4ZDNlMyAoInhlbi9oeXBlcmNhbGw6IERvbid0
IHVzZSBCVUcoKSBmb3IgcGFyYW1ldGVyIGNoZWNraW5nIGluIGh5cGVyY2FsbF9jcmVhdGVfY29u
dGludWF0aW9uKCkiKQpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3Jn
PgotLS0KIHhlbi9hcmNoL2FybS9kb21haW4uYyAgICB8IDEgKwogeGVuL2FyY2gveDg2L2h5cGVy
Y2FsbC5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwppbmRleCA5
ZThlOWQ5MjFkLi5jMGExM2FhMGFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMK
KysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jCkBAIC00NjcsNiArNDY3LDcgQEAgdW5zaWduZWQg
bG9uZyBoeXBlcmNhbGxfY3JlYXRlX2NvbnRpbnVhdGlvbigKICAgICByZXR1cm4gcmM7CiAKICBi
YWRfZm10OgorICAgIHZhX2VuZChhcmdzKTsKICAgICBncHJpbnRrKFhFTkxPR19FUlIsICJCYWQg
aHlwZXJjYWxsIGNvbnRpbnVhdGlvbiBmb3JtYXQgJyVjJ1xuIiwgKnApOwogICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOwogICAgIGRvbWFpbl9jcmFzaChjdXJyZW50LT5kb21haW4pOwpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L2h5cGVyY2FsbC5j
CmluZGV4IDQ2NDNlNWViNDMuLjFkNDI3MDJjNmEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9o
eXBlcmNhbGwuYworKysgYi94ZW4vYXJjaC94ODYvaHlwZXJjYWxsLmMKQEAgLTE1Nyw2ICsxNTcs
NyBAQCB1bnNpZ25lZCBsb25nIGh5cGVyY2FsbF9jcmVhdGVfY29udGludWF0aW9uKAogICAgIHJl
dHVybiBvcDsKIAogIGJhZF9mbXQ6CisgICAgdmFfZW5kKGFyZ3MpOwogICAgIGdwcmludGsoWEVO
TE9HX0VSUiwgIkJhZCBoeXBlcmNhbGwgY29udGludWF0aW9uIGZvcm1hdCAnJWMnXG4iLCAqcCk7
CiAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CiAgICAgZG9tYWluX2NyYXNoKGN1cnItPmRvbWFp
bik7Ci0tIAoyLjI0LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
