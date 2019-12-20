Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCA11283D2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 22:24:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiPhw-0004rZ-Co; Fri, 20 Dec 2019 21:21:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiPhu-0004rU-MK
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 21:21:10 +0000
X-Inumbo-ID: a326f518-236e-11ea-a914-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a326f518-236e-11ea-a914-bc764e2007e4;
 Fri, 20 Dec 2019 21:21:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d139so10360780wmd.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ffelIFJTzhSS9sw/VI5ijX/3laM20yZv6P8SPKhRj8=;
 b=eVRthahOHFw4grqzEG9ZnPqU4fjocBZ8ukAFYF9EwUSvs9ID9boSDoblOICvYcS5yx
 2WJsSflqU9CPrt1APNsBPqmwicT6hcu68qyXruoQ5h0lgJf8vJMhlC1Gh6R7XsSOr6tU
 RsIxbu3o2RZmvjg2hTM4nboZHpBzR1pL2D6wDpUdtEozRHhyXsGQEk0dkjsv3ZtSihgZ
 qL3ahpima6eDYffqPezA92aIgPuSvFP14NClF1SZr65ERMy1WKUQRQWkVrh0ITxNRz13
 YO7+OB5Tfq15ClpCQxnzuBgVtPLerjQ7GmhqyLR/0uAnX0yNCSIvSow9aQ3JAaj2v4S6
 ZRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4ffelIFJTzhSS9sw/VI5ijX/3laM20yZv6P8SPKhRj8=;
 b=naa5Fr/I47mLBivn3qWfkUin0ELmPFIJEVMRLCaItaWNeLlULW4SsK91bwFPuQd2zE
 wm4ID3EcT/bsZCObVw3B8y1H72h06rkuaPUoz2NfhIaweLxxkHu+ImFQOnn0aWB8tfHU
 Ho3H2IReltUWTBZFQN0v8Dsk43/Nvfwt9mPFYVqd1McuJHtlm1UoGSLX1XIxQsdYvOw9
 ivysuE+QlT0oaBo+Y0dJAV2M92s/M2ugSt/smiuo+GkN/xBG3BbtBqrOEmAda18utoiC
 K7nSJ6k9/2QldJQB+UtogPeeHf45m2xrbA75Ob+AYV1P+vzw7P0j9vYOAxzZfunnliLN
 psXg==
X-Gm-Message-State: APjAAAUu7HTOlH1jadkKDBhVak1m1f3xii6PBRUHFmeZqJoVWhc5gZC9
 gKQ8p3TVbDrI7h6SE1LSXqs/gY6MJeU=
X-Google-Smtp-Source: APXvYqxb0IctU0dgeXlvLrGhPpmZzCmyZmldE6IZc91VSgn726K8fcK/+ZU2nlyvE0TvsoFmsC+0zA==
X-Received: by 2002:a1c:638a:: with SMTP id x132mr19851397wmb.43.1576876867391; 
 Fri, 20 Dec 2019 13:21:07 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id x6sm10703200wmi.44.2019.12.20.13.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 13:21:06 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 21:21:03 +0000
Message-Id: <20191220212103.4192-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220195135.20130-1-liuwe@microsoft.com>
References: <20191220195135.20130-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/4] x86/viridian: drop a wrong invalid value
 from reference TSC implementation
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG9ubHkgaW52YWxpZCB2YWx1ZSBtZW50aW9uZWQgaW4gSHlwZXItViBUTEZTIDUuMGMgaXMg
MC4gTWljaGFlbApLZWxsZXkgY29uZmlybWVkIHRoYXQgMHhGRkZGRkZGRiB3YXMgbmV2ZXIgdXNl
ZCBbMF0uCgpbMF0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVs
LzIwMTktMTIvbXNnMDE1NjQuaHRtbAoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYyB8IDEzICsr
KystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMgYi94ZW4v
YXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwppbmRleCA2YjJkNzQ1ZjNhLi5iODI4MGExYTYw
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwpAQCAtNDUsMTQgKzQ1LDkgQEAgc3RhdGljIHZv
aWQgdXBkYXRlX3JlZmVyZW5jZV90c2MoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgYm9vbCBpbml0
aWFsaXplKQogICAgIGlmICggIWhvc3RfdHNjX2lzX3NhZmUoKSB8fCBkLT5hcmNoLnZ0c2MgKQog
ICAgIHsKICAgICAgICAgLyoKLSAgICAgICAgICogVGhlIHNwZWNpZmljYXRpb24gc3RhdGVzIHRo
YXQgdmFsaWQgdmFsdWVzIG9mIFRzY1NlcXVlbmNlIHJhbmdlCi0gICAgICAgICAqIGZyb20gMCB0
byAweEZGRkZGRkZFLiBUaGUgdmFsdWUgMHhGRkZGRkZGRiBpcyB1c2VkIHRvIGluZGljYXRlCi0g
ICAgICAgICAqIHRoaXMgbWVjaGFuaXNtIGlzIG5vIGxvbmdlciBhIHJlbGlhYmxlIHNvdXJjZSBv
ZiB0aW1lIGFuZCB0aGF0Ci0gICAgICAgICAqIHRoZSBWTSBzaG91bGQgZmFsbCBiYWNrIHRvIGEg
ZGlmZmVyZW50IHNvdXJjZS4KLSAgICAgICAgICoKLSAgICAgICAgICogU2VydmVyIDIwMTIgKDYu
MiBrZXJuZWwpIGFuZCAyMDEyIFIyICg2LjMga2VybmVsKSBhY3R1YWxseQotICAgICAgICAgKiB2
aW9sYXRlIHRoZSBzcGVjLiBhbmQgcmVseSBvbiBhIHZhbHVlIG9mIDAgdG8gaW5kaWNhdGUgdGhh
dCB0aGlzCi0gICAgICAgICAqIGVubGlnaHRlbm1lbnQgc2hvdWxkIG5vIGxvbmdlciBiZSB1c2Vk
LgorICAgICAgICAgKiBUaGUgdmFsdWUgMCBpcyB1c2VkIHRvIGluZGljYXRlIHRoaXMgbWVjaGFu
aXNtIGlzIG5vIGxvbmdlciBhCisgICAgICAgICAqIHJlbGlhYmxlIHNvdXJjZSBvZiB0aW1lIGFu
ZCB0aGF0IHRoZSBWTSBzaG91bGQgZmFsbCBiYWNrIHRvIGEKKyAgICAgICAgICogZGlmZmVyZW50
IHNvdXJjZS4KICAgICAgICAgICovCiAgICAgICAgIHAtPnRzY19zZXF1ZW5jZSA9IDA7CiAKQEAg
LTc3LDcgKzcyLDcgQEAgc3RhdGljIHZvaWQgdXBkYXRlX3JlZmVyZW5jZV90c2MoY29uc3Qgc3Ry
dWN0IGRvbWFpbiAqZCwgYm9vbCBpbml0aWFsaXplKQogICAgIHNtcF93bWIoKTsKIAogICAgIHNl
cSA9IHAtPnRzY19zZXF1ZW5jZSArIDE7Ci0gICAgaWYgKCBzZXEgPT0gMHhGRkZGRkZGRiB8fCBz
ZXEgPT0gMCApIC8qIEF2b2lkIGJvdGggJ2ludmFsaWQnIHZhbHVlcyAqLworICAgIGlmICggc2Vx
ID09IDAgKSAvKiBBdm9pZCAnaW52YWxpZCcgdmFsdWUgKi8KICAgICAgICAgc2VxID0gMTsKIAog
ICAgIHAtPnRzY19zZXF1ZW5jZSA9IHNlcTsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
