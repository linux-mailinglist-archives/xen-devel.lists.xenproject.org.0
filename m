Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7952144B1F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:17:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LB-00058x-1Z; Wed, 22 Jan 2020 05:14:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5L2-0006AZ-6Y
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:01:48 +0000
X-Inumbo-ID: 07f5bfb4-3cbb-11ea-9fd7-bc764e2007e4
Received: from mail-yb1-xb42.google.com (unknown [2607:f8b0:4864:20::b42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07f5bfb4-3cbb-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 02:00:57 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id c13so2411060ybq.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x5jb/2WzDnuDfw2/mvmF1tHxD3Rvz+Oa9YbEJ6xgMRo=;
 b=vRhChwmdZf2+tdeDJpo952146AWpso0TS6UWiVqtz5JGHPIGM9eX1X5txNgHzBkp5z
 NvImyvNbGeYNKJu1wR7g3tEHbhgAe4jaDOQYhjQswUwUxDcWxJdU1vpN17UpmOeBmAmQ
 vI29uHSsP5SeXydH73p/bPdUMz5cXoITjIB1lcqovcBVHF9wIacDle/n5B4U7roKCugI
 ym8Jdn35BNJgFPxg60vg9FfMncnMQ7+f3e9zRQ7kC3SDezrRGYAO/vv7KY9J1Vf2WMiU
 0vh2kfO1CzZqGo0w7aD6wDzqUFS34U6QTfIdFO5shiyuPv/6RoWzYET3XDGfTaZ/DpF6
 MerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x5jb/2WzDnuDfw2/mvmF1tHxD3Rvz+Oa9YbEJ6xgMRo=;
 b=D00yCpuTHrZOjqDBQam6wW3gJjBSKCsk7cF3gsgezxVmE5F7ccMUwkxO2HkSXbWeoM
 H15T3rhlAt0aWkkWuIAn5iiF3Es3Uk/NiF9ENYOLWYuyC6vZ6gkKiW3kIUKbNm7bTkcD
 0L+GoN06V7Ikz/6ejVFzT6kKNKoyvhn78Vui8rWbnBHc5s0Pi8A2xhXA2fbIFYBr/VIm
 08KzaGWZ2G15eXoIafDWXAIQLp+LfDUIcRgnWU/tDBwEsvuDkm7dAUGXuyKrJhhHpEyt
 ZQvnuTRwaCwj42gejIYrYRhVxQEgf6QFSgg3TtRL8GFV2reulUHL5RM1GI1oUYNYMzId
 zB7w==
X-Gm-Message-State: APjAAAVzhDQRMFbna4LWyfOB4/dTehA5eWPg/8327keiZE43S9g2QST9
 xl6OXoU3E8qUpqsPCjn65kMc5z12wDolXQ==
X-Google-Smtp-Source: APXvYqzl8pvTk3rKGnFIV1fUksSKrcPVFou62T03N7ZGlafAzvFmhlz9sfXDxmnVvb0r2zP1+IoI6w==
X-Received: by 2002:a5b:144:: with SMTP id c4mr6313288ybp.371.1579658457239;
 Tue, 21 Jan 2020 18:00:57 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:00:56 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:58:55 -0600
Message-Id: <86b8f52b7c77aa4a64fd4aae0f598ea80d6c662a.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 16/23] riscv: Add irq.c
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
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Dan Robertson <dan@dlrobertson.com>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKU2lnbmVk
LW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgotLS0K
IHhlbi9hcmNoL3Jpc2N2L2lycS5jIHwgMTA3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3Jpc2N2L2lycS5jCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
cmlzY3YvaXJxLmMgYi94ZW4vYXJjaC9yaXNjdi9pcnEuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi5kMWIwYjU3OGRlCi0tLSAvZGV2L251bGwKKysrIGIveGVuL2FyY2gv
cmlzY3YvaXJxLmMKQEAgLTAsMCArMSwxMDcgQEAKKy8qCisgKiBSSVNDLVYgSW50ZXJydXB0IHN1
cHBvcnQKKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqIHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisg
KiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICog
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YKKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRS4gIFNlZSB0aGUKKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCisgKi8KKworI2luY2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4vc3Bpbmxv
Y2suaD4KKyNpbmNsdWRlIDx4ZW4vaXJxLmg+CisjaW5jbHVkZSA8eGVuL2luaXQuaD4KKyNpbmNs
dWRlIDx4ZW4vZXJybm8uaD4KKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KKworY29uc3QgdW5zaWdu
ZWQgaW50IG5yX2lycXMgPSBOUl9JUlFTOworCitzdGF0aWMgdm9pZCBhY2tfbm9uZShzdHJ1Y3Qg
aXJxX2Rlc2MgKmlycSkKK3sKKyAgICBwcmludGsoInVuZXhwZWN0ZWQgSVJRIHRyYXAgYXQgaXJx
ICUwMnhcbiIsIGlycS0+aXJxKTsKK30KKworc3RhdGljIHZvaWQgZW5kX25vbmUoc3RydWN0IGly
cV9kZXNjICppcnEpCit7CisgICAgLyogVE9ETyAqLworfQorCitod19pcnFfY29udHJvbGxlciBu
b19pcnFfdHlwZSA9IHsKKyAgICAudHlwZW5hbWUgPSAibm9uZSIsCisgICAgLnN0YXJ0dXAgPSBp
cnFfc3RhcnR1cF9ub25lLAorICAgIC5zaHV0ZG93biA9IGlycV9zaHV0ZG93bl9ub25lLAorICAg
IC5lbmFibGUgPSBpcnFfZW5hYmxlX25vbmUsCisgICAgLmRpc2FibGUgPSBpcnFfZGlzYWJsZV9u
b25lLAorICAgIC5hY2sgPSBhY2tfbm9uZSwKKyAgICAuZW5kID0gZW5kX25vbmUKK307CisKK3N0
YXRpYyBpcnFfZGVzY190IGlycV9kZXNjW05SX0lSUVNdOworc3RhdGljIERFRklORV9QRVJfQ1BV
KGlycV9kZXNjX3RbTlJfTE9DQUxfSVJRU10sIGxvY2FsX2lycV9kZXNjKTsKKworaW50IGFyY2hf
aW5pdF9vbmVfaXJxX2Rlc2Moc3RydWN0IGlycV9kZXNjICpkZXNjKQoreworICAgIHJldHVybiAw
OworfQorCitzdHJ1Y3QgcGlycSAqYWxsb2NfcGlycV9zdHJ1Y3Qoc3RydWN0IGRvbWFpbiAqZCkK
K3sKKwkvKiBUT0RPICovCisKKyAgICByZXR1cm4gTlVMTDsKK30KKworaXJxX2Rlc2NfdCAqX19p
cnFfdG9fZGVzYyhpbnQgaXJxKQoreworICAgIGlmICggaXJxIDwgTlJfTE9DQUxfSVJRUyApCisg
ICAgICAgIHJldHVybiAmdGhpc19jcHUobG9jYWxfaXJxX2Rlc2MpW2lycV07CisKKyAgICByZXR1
cm4gJmlycV9kZXNjW2lycS1OUl9MT0NBTF9JUlFTXTsKK30KKworaW50IHBpcnFfZ3Vlc3RfYmlu
ZChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHBpcnEgKnBpcnEsIGludCB3aWxsX3NoYXJlKQorewor
ICAgIEJVRygpOworfQorCit2b2lkIHBpcnFfZ3Vlc3RfdW5iaW5kKHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCBwaXJxICpwaXJxKQoreworICAgIEJVRygpOworfQorCit2b2lkIHBpcnFfc2V0X2Fm
ZmluaXR5KHN0cnVjdCBkb21haW4gKmQsIGludCBwaXJxLCBjb25zdCBjcHVtYXNrX3QgKm1hc2sp
Cit7CisgICAgQlVHKCk7Cit9CisKK3ZvaWQgc21wX3NlbmRfc3RhdGVfZHVtcCh1bnNpZ25lZCBp
bnQgY3B1KQoreworICAgIC8qIFRPRE8gKi8KK30KKwordm9pZCBhcmNoX21vdmVfaXJxcyhzdHJ1
Y3QgdmNwdSAqdikKK3sKKyAgICAvKiBUT0RPICovCit9CisKK2ludCBzZXR1cF9pcnEodW5zaWdu
ZWQgaW50IGlycSwgdW5zaWduZWQgaW50IGlycWZsYWdzLCBzdHJ1Y3QgaXJxYWN0aW9uICpuZXcp
Cit7CisgICAgaW50IHJjID0gMDsKKyAgICB1bnNpZ25lZCBsb25nIGZsYWdzOworICAgIHN0cnVj
dCBpcnFfZGVzYyAqZGVzYzsKKworICAgIGRlc2MgPSBpcnFfdG9fZGVzYyhpcnEpOworCisgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsKKworICAgIC8qIFRPRE8gKi8K
KworICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRlc2MtPmxvY2ssIGZsYWdzKTsKKworICAg
IHJldHVybiByYzsKK30KLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
