Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F009128DD9
	for <lists+xen-devel@lfdr.de>; Sun, 22 Dec 2019 13:10:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ij00z-0001sW-2Y; Sun, 22 Dec 2019 12:07:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYd2=2M=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ij00x-0001sQ-CT
 for xen-devel@lists.xenproject.org; Sun, 22 Dec 2019 12:07:15 +0000
X-Inumbo-ID: 971ef63a-24b3-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 971ef63a-24b3-11ea-88e7-bc764e2007e4;
 Sun, 22 Dec 2019 12:07:14 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a5so13213546wmb.0
 for <xen-devel@lists.xenproject.org>; Sun, 22 Dec 2019 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NVbj44pGJSci640/frImMSOsoKLgC3FesR+sy39zdL4=;
 b=lhye2qkPJe3XCFfSiNaxx8b/kPPusDefkLUewpIkejy09uaPxtevG77Byi+av/apjS
 YlwujZAqsawIHCHoxmn4almoVMJ/YZLTMjKbubtfJzC5nfN4bMuGoqwrkE7GZ1WaW+iX
 EEz3N+yxWuoiKIauLLFpGbzSq2J8wE7KRROOBPvT5EMHBY/0JCMfHzDxjM2cEkodVjm7
 qzfZZHZBEESczXubFmMzAM7xrkISTKMkDksHJoTzwUyfgpsKotlkhvPaQ87gT9CUYcHq
 tsQU79QScYjXAdpQNfSwesTX1sGG8VQywS6fvKtpJH+u2ijkCXT1w6+SLgxG2roKFXey
 G7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NVbj44pGJSci640/frImMSOsoKLgC3FesR+sy39zdL4=;
 b=jZhwWDjrSUDzvoZmBqJL/c1cRvnXyzJcXf+3c8tYJt/9I07i1xxyz8H3qJaN8ALRv1
 9hcpwA0OcnN2svOv1Tj4t8ZYzDDQXfgv74zLFbiYr+djdFbCB6rTVgHd2EvZ0sQiMnPp
 zfUWj+amLRojVxp/AT23zYOsiKyToB6C4nUfyi4a0otWmBluwR/hs82drp519SSo2TcL
 N/v9WXi7tZKF+lBkR6aXt545q1UGaaLoirFCDjF1Ys2NHMG75VUUlIq6saepdIBPXVwO
 PjZhj7DeTq0iotN50kGArQ1+lgN4r7zWK63J7YQwDrE8fSPYoV46qkF0oyg0C/SQzS3b
 r4lw==
X-Gm-Message-State: APjAAAXlc1qlBRrzZ73nqyYyUF7WDNrpTTEafbUcMaOunK6A2WNEvlpl
 7YQq0e2v3PfH07k/MSHdWGl7sUka
X-Google-Smtp-Source: APXvYqx3UJJlH2Thop1Sw1jqVuQr2Huq6c524hFCuvvdvvuAwvM3vlQJHvjFkW0oL2jRTEOxi1gB8Q==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr27303521wma.6.1577016433577; 
 Sun, 22 Dec 2019 04:07:13 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z3sm16689420wrs.94.2019.12.22.04.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2019 04:07:13 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sat, 21 Dec 2019 23:50:49 +0000
Message-Id: <20191221235049.4928-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/hyperv: change hv_tlb_flush_ex to fix clang
 build
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhbmcgY29tcGxhaW5zOgoKSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHN5bmljLmM6MTU6Ci9idWls
ZHMveGVuLXByb2plY3QveGVuL3hlbi9pbmNsdWRlL2FzbS9ndWVzdC9oeXBlcnYtdGxmcy5oOjkw
MDoxODogZXJyb3I6IGZpZWxkICdodl92cF9zZXQnIHdpdGggdmFyaWFibGUgc2l6ZWQgdHlwZSAn
c3RydWN0IGh2X3Zwc2V0JyBub3QgYXQgdGhlIGVuZCBvZiBhIHN0cnVjdCBvciBjbGFzcyBpcyBh
IEdOVSBleHRlbnNpb24gWy1XZXJyb3IsLVdnbnUtdmFyaWFibGUtc2l6ZWQtdHlwZS1ub3QtYXQt
ZW5kXQogICAgICAgIHN0cnVjdCBodl92cHNldCBodl92cF9zZXQ7CiAgICAgICAgICAgICAgICAg
ICAgICAgIF4KMSBlcnJvciBnZW5lcmF0ZWQuCi9idWlsZHMveGVuLXByb2plY3QveGVuL3hlbi9S
dWxlcy5tazoxOTg6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzeW5pYy5vJyBmYWlsZWQKbWFrZVs2XTog
KioqIFtzeW5pYy5vXSBFcnJvciAxCgpEcm9wIHRoZSBsYXN0IHZhcmlhYmxlIHNpemUgYXJyYXkg
ZnJvbSBodl90bGJfZmx1c2hfZXggZm9yIG5vdyB0byBmaXgKY2xhbmcgYnVpbGRzLgoKU2lnbmVk
LW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmggfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvZ3Vlc3QvaHlwZXJ2LXRsZnMuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2
LXRsZnMuaAppbmRleCBjY2Q5ODUwYjI3Li45OGZmMWFkYzYxIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi10bGZzLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcnYtdGxmcy5oCkBAIC04OTMsMTIgKzg5MywxMSBAQCBzdHJ1Y3QgaHZfdGxi
X2ZsdXNoIHsKIAl1NjQgZ3ZhX2xpc3RbXTsKIH0gX19wYWNrZWQ7CiAKLS8qIEh2Rmx1c2hWaXJ0
dWFsQWRkcmVzc1NwYWNlRXgsIEh2Rmx1c2hWaXJ0dWFsQWRkcmVzc0xpc3RFeCBoeXBlcmNhbGxz
ICovCisvKiBIdkZsdXNoVmlydHVhbEFkZHJlc3NTcGFjZUV4IGh5cGVyY2FsbCAqLwogc3RydWN0
IGh2X3RsYl9mbHVzaF9leCB7CiAJdTY0IGFkZHJlc3Nfc3BhY2U7CiAJdTY0IGZsYWdzOwogCXN0
cnVjdCBodl92cHNldCBodl92cF9zZXQ7Ci0JdTY0IGd2YV9saXN0W107CiB9IF9fcGFja2VkOwog
CiBzdHJ1Y3QgaHZfcGFydGl0aW9uX2Fzc2lzdF9wZyB7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
