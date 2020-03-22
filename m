Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DA218EA1C
	for <lists+xen-devel@lfdr.de>; Sun, 22 Mar 2020 17:16:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jG3FG-0004Z9-4M; Sun, 22 Mar 2020 16:14:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EiK=5H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jG3FF-0004Yb-7d
 for xen-devel@lists.xenproject.org; Sun, 22 Mar 2020 16:14:37 +0000
X-Inumbo-ID: 363024ba-6c58-11ea-8134-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 363024ba-6c58-11ea-8134-12813bfff9fa;
 Sun, 22 Mar 2020 16:14:31 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a43so13499869edf.6
 for <xen-devel@lists.xenproject.org>; Sun, 22 Mar 2020 09:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PPouXUKimyKPAUwaiX+i857NLzRatKER6he+nfREvTY=;
 b=BIMYd1zNzmrkGlcNacbjqG2decGr6MrAuDg7rLq8wR4AQTtRF3RVrDVCwv1dMwYrbW
 ESlms6d06c8UFG2cmxHPP3cupkXqPvdNmoXu0Id/1AceLaTP3r/aTcmIQRQGpXmOma0H
 KNbSRiomq3WpjXDmhS60aA/ado4ADJ13VQ23ttp4PgXONiv+weOqy+HeiTiXmY/8B1nG
 qieNWLVAXsUPhQ0auS76SDr2tM4b0kmIHyn22En2NbsHvg6dxpoMlH8/O5bCS6yxLe29
 dSHyQRw+8NfJJoURCeR7D1Hv8QP9aIerdd+p0bHhG2AH3I/0ELfPNl9hnsJdJLRkQ4tn
 o4YA==
X-Gm-Message-State: ANhLgQ2ZY8cu7UCOJhXHUwQQ8B5gxSIw40pWGxyHNLdZcEhlEZTvUR4G
 r9PKe29nC8THFM9Zsf/+Cb45Xqa5lzd+8g==
X-Google-Smtp-Source: ADFU+vsib/mmBtFQpTucPP1SO25CZHQIu/B4TsbM7c0M8pSakiBiLTIIV9TqknxtFODWVl+JX6cK/g==
X-Received: by 2002:a17:906:5c43:: with SMTP id
 c3mr15001421ejr.3.1584893670472; 
 Sun, 22 Mar 2020 09:14:30 -0700 (PDT)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id v13sm106693edj.62.2020.03.22.09.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 09:14:29 -0700 (PDT)
From: julien@xen.org
To: xen-devel@lists.xenproject.org
Date: Sun, 22 Mar 2020 16:14:07 +0000
Message-Id: <20200322161418.31606-7-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322161418.31606-1-julien@xen.org>
References: <20200322161418.31606-1-julien@xen.org>
Subject: [Xen-devel] [PATCH 06/17] xen/x86: mm: Fix the comment on top
 put_page_from_l2e() to use 'mfn'
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KCldlIGFyZSB1c2luZyB0aGUg
J21mbicgdG8gcmVmZXIgdG8gbWFjaGluZSBmcmFtZS4gQXMgdGhpcyBmdW5jdGlvbiBkZWFsCndp
dGggJ21mbicsIHJlcGxhY2UgJ3Bmbicgd2l0aCAnbWZuJy4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+CgotLS0KCkkgYW0gbm90IGVudGlyZWx5IHN1cmUg
dG8gdW5kZXJzdGFuZCB0aGUgY29tbWVudCBvbiB0b3Agb2YgdGhlCmZ1bmN0aW9uLCBzbyB0aGlz
IGNoYW5nZSBtYXkgYmUgd3JvbmcuCi0tLQogeGVuL2FyY2gveDg2L21tLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGFhMGJmM2QwZWUuLjY1
YmMwMzk4NGQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9tbS5jCkBAIC0xMzIxLDcgKzEzMjEsNyBAQCBzdGF0aWMgaW50IHB1dF9kYXRhX3BhZ2VzKHN0
cnVjdCBwYWdlX2luZm8gKnBhZ2UsIGJvb2wgd3JpdGVhYmxlLCBpbnQgcHRfc2hpZnQpCiB9CiAK
IC8qCi0gKiBOQi4gVmlydHVhbCBhZGRyZXNzICdsMmUnIG1hcHMgdG8gYSBtYWNoaW5lIGFkZHJl
c3Mgd2l0aGluIGZyYW1lICdwZm4nLgorICogTkIuIFZpcnR1YWwgYWRkcmVzcyAnbDJlJyBtYXBz
IHRvIGEgbWFjaGluZSBhZGRyZXNzIHdpdGhpbiBmcmFtZSAnbWZuJy4KICAqIE5vdGUgYWxzbyB0
aGF0IHRoaXMgYXV0b21hdGljYWxseSBkZWFscyBjb3JyZWN0bHkgd2l0aCBsaW5lYXIgcC50Lidz
LgogICovCiBzdGF0aWMgaW50IHB1dF9wYWdlX2Zyb21fbDJlKGwyX3BnZW50cnlfdCBsMmUsIG1m
bl90IGwybWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
