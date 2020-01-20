Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C1F142DAA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 15:35:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itY5r-00048R-U3; Mon, 20 Jan 2020 14:31:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3ogU=3J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itY5q-00048M-Is
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 14:31:54 +0000
X-Inumbo-ID: 979e67fe-3b91-11ea-b986-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 979e67fe-3b91-11ea-b986-12813bfff9fa;
 Mon, 20 Jan 2020 14:31:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t2so29808123wrr.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2020 06:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hHJhwr5erh/UYPxy3FYpYx/861mLb40RvwczGsEqYcY=;
 b=HQex0IFHlgf2ToVD+DQju9ZS0SGSH9ggTmT61pwQldg67Q9x7wfmEQIiDdM6Lxyt97
 SO4e2ANEHW+HTO8gvEXiw46V9+3cB4+QEiS4M7I+C0FzKSBFj8/CWwVPFbSnWfDRtq1X
 xnXLwosBgNDI1atX+fkjsgaXTs+9C8Qa+JzYbpV92HVGWWP9+GUwMV3Z5TBW0NElhF2f
 WvaiBUQG79AJ9cfdWi8t1CDIYXzsKPFQcMeemjjb2LfcFZlBCWJ0HVbxxZGoupVK9dRf
 AReqqI5OT0P56D1S8U+Gz/PaxSb+BobH5A83v/bmUTRcwbqz+bAbqDbxMslQE5Hrb/+Y
 ATTg==
X-Gm-Message-State: APjAAAXQcThQ8vZCcrl5L8pzeouDqkBd/MioDXFRqqWLzWw/+jp14PFr
 qChIfpueO9rwXoXB8SKpX13fcwoYBi+loA==
X-Google-Smtp-Source: APXvYqxNgdIEDHTSvzN/KuaqXluHeRiXQtxkObha89LagoV8dEZO5tJaZAbFKvErh0kHQ7ZkOZysDQ==
X-Received: by 2002:a5d:620b:: with SMTP id y11mr18358497wru.230.1579530708234; 
 Mon, 20 Jan 2020 06:31:48 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id 5sm48379761wrh.5.2020.01.20.06.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 06:31:47 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 20 Jan 2020 14:31:42 +0000
Message-Id: <20200120143142.19820-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/x86: domain: Free all the pages associated
 to struct domain
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClRoZSBzdHJ1Y3R1cmUgZG9t
YWluIG1heSBiZSBiaWdnZXIgdGhhbiBhIHBhZ2Ugc2l6ZSB3aGVuIGxvY2sgcHJvZmlsaW5nCmlz
IGVuYWJsZWQuIEhvd2V2ZXIsIHRoZSBmdW5jdGlvbiBmcmVlX2RvbWhlYXBfc3RydWN0IHdpbGwg
b25seSBmcmVlIHRoZQpmaXJzdCBwYWdlLgoKVGhpcyBpcyBub3QgYSBzZWN1cml0eSBpc3N1ZSBi
ZWNhdXNlIHN0cnVjdCBkb21haW4gY2FuIG9ubHkgYmUgYmlnZ2VyCnRoYW4gYSBwYWdlIHNpemUg
Zm9yIGxvY2sgcHJvZmlsaW5nLiBUaGUgZmVhdHVyZSBjYW4gb25seSBiZSBzZWxlY3RlZAppbiBE
RUJVRyBhbmQgRVhQRVJUIG1vZGUuCgpGaXhlczogODkxNmZjZjQ1NzcgKCJ4ODYvZG9tYWluOiBj
b21waWxlIHdpdGggbG9ja19wcm9maWxlPXkgZW5hYmxlZCIpClJlcG9ydGVkLWJ5OiBEYXZpZCBX
b29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGpncmFsbEBhbWF6b24uY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9kb21haW4uYyB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwppbmRleCAyOGZl
ZmExZjgxLi5hNTM4MGI5YmFiIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tYWluLmMKKysr
IGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCkBAIC0zNDQsNyArMzQ0LDcgQEAgc3RydWN0IGRvbWFp
biAqYWxsb2NfZG9tYWluX3N0cnVjdCh2b2lkKQogCiB2b2lkIGZyZWVfZG9tYWluX3N0cnVjdChz
dHJ1Y3QgZG9tYWluICpkKQogewotICAgIGZyZWVfeGVuaGVhcF9wYWdlKGQpOworICAgIGZyZWVf
eGVuaGVhcF9wYWdlcyhkLCBnZXRfb3JkZXJfZnJvbV9ieXRlcyhzaXplb2YoKmQpKSk7CiB9CiAK
IHN0cnVjdCB2Y3B1ICphbGxvY192Y3B1X3N0cnVjdChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
