Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9499514F19C
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 18:51:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixaQC-0005qj-El; Fri, 31 Jan 2020 17:49:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=euI0=3U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ixaQB-0005qe-NI
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 17:49:35 +0000
X-Inumbo-ID: 0aacdd8e-4452-11ea-b211-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0aacdd8e-4452-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 17:49:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so9673128wmj.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2020 09:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FCmlc12KCp0jcY4TLO/CylLO89w0ffpqpJQrZC8EOqg=;
 b=eJq7rkHi4748ljDLDBvZOmMSPuiaFGBjMMOHZneuFy2zSual+hJRGgxKXP2PJXA7ia
 g5vf3dX5iKAF/wisE30hKltCQ7aiR8mtY4HTZZD2Ma/jQoBEtUp6nuUMW9X3CVFAO18O
 lGNObh+UmMjw0l05quAYh+o90Sh65iif6tJ/BeB1rvwt6H+g9mteQSLbiltjD2Alvn8u
 K2WtrL3gxsMrJJCD7wNXZIlF1S2//K8cTWUG8aXS9DADCeLH9kOQcNWmKC7CtXFqUlah
 ghDnMAWa5T+FyAzUdQlygegKHN/bVCvt0drK9lDJRkN9J1XqdgZlbkkt72x+yYl3rjxB
 3EBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FCmlc12KCp0jcY4TLO/CylLO89w0ffpqpJQrZC8EOqg=;
 b=gjR2hiuQaG2fzd4+Swh/6ziSi7ah1OKxPWx4Tx6nNQg6IwOfi5Uxs+wxaiBahsgFfS
 3Qi7XkeKebeeXdZ3qXCAGTXObX1x3gUYSczloOrDQUvvYZplbNsp0EcmpTRYLKq8JRVq
 32h649uz8XsXOQb9HEusRC8wSCqrYN2MTDDyQ/ersbd12XCCZU1jSe4x90c5W3RD7fH+
 LwazfadzoM5HPUMZDZYkGoe5Zk8V67kkc1F93bJ4bL3sb4uef1KQep+5QOw6l3Tjw2bl
 tG3lKv7RCbNFQTcxJ3reaiN2rAXWIW8Maxh3/ECNSbY2dasWq6V8nAv11LmkVVMw2RZL
 H5Zw==
X-Gm-Message-State: APjAAAXFCNNt226X1eY8K3GOLIZnPfkWh2M7jGUfwBKwTC5mVXDurlN8
 3/Wt/GWnm/CgY/dIhjCO1WK7222tLKU=
X-Google-Smtp-Source: APXvYqwaSHjvKlx5Bab2868FlTaY9sWSxCOzTRWcHJ2QzUUCyO/UrPii7T5ORzXO2onq3mct/nAgYw==
X-Received: by 2002:a1c:b607:: with SMTP id g7mr13319293wmf.110.1580492973941; 
 Fri, 31 Jan 2020 09:49:33 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 133sm4364352wmd.5.2020.01.31.09.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:49:33 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 31 Jan 2020 17:49:19 +0000
Message-Id: <20200131174930.31045-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 00/11] More Hyper-V infrastructures
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBzZXJlaXMgaW1wbGVtZW50cyBzZXZlcmFsIGltcG9ydGFudCBmdW5jdGlvbmFs
aXRpZXMgdG8gcnVuClhlbiBvbiB0b3Agb2YgSHlwZXItVi4gU2VlIGluZGl2aWR1YWwgcGF0Y2hl
cyBmb3IgbW9yZSBkZXRhaWxzLgoKSSd2ZSBjaGVja2VkIHRoZSBhc3NlbWJseSBjb2RlIGFzIHdl
bGwgYXMgcHV0dGluZyBpbiBhIHRlc3QgcGF0Y2ggdG8KbWFrZSBzdXJlIHRoZSBoeXBlcmNhbGwg
aW50ZXJmYWNlIGlzIGltcGxlbWVudGVkIGNvcnJlY3RseS4KCldlaS4KCkNjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgpDYzogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jv
c29mdC5jb20+CkNjOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpXZWkgTGl1
ICgxMSk6CiAgeDg2L2h5cGVydmlzb3I6IG1ha2UgaHlwZXJ2aXNvcl9hcF9zZXR1cCByZXR1cm4g
YW4gZXJyb3IgY29kZQogIHg4Ni9zbXA6IGRvbid0IG9ubGluZSBjcHUgaWYgaHlwZXJ2aXNvcl9h
cF9zZXR1cCBmYWlscwogIHg4NjogcHJvdmlkZSBleGVjdXRhYmxlIGZpeG1hcCBmYWNpbGl0eQog
IHg4Ni9oeXBlcnZpc29yOiBwcm92aWRlIGh5cGVydmlzb3JfZml4dXBfZTgyMAogIHg4Ni9oeXBl
cnY6IHNldHVwIGh5cGVyY2FsbCBwYWdlCiAgeDg2L2h5cGVydjogcHJvdmlkZSBIeXBlci1WIGh5
cGVyY2FsbCBmdW5jdGlvbnMKICBETyBOT1QgQVBQTFk6IHg4Ni9oeXBlcnY6IGlzc3VlIGFuIGh5
cGVyY2FsbAogIHg4Ni9oeXBlcnY6IHByb3ZpZGUgcGVyY3B1IGh5cGVyY2FsbCBpbnB1dCBwYWdl
CiAgeDg2L2h5cGVydjogcmV0cmlldmUgdnBfaW5kZXggZnJvbSBIeXBlci1WCiAgeDg2OiBtb3Zl
IHZpcmlkaWFuX3BhZ2VfbXNyIHRvIGh5cGVydi10bGZzLmgKICB4ODYvaHlwZXJ2OiBzZXR1cCBW
UCBhc3Npc3QgcGFnZQoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKwogeGVuL2FyY2gveDg2L2Jvb3QveDg2XzY0LlMgICAgICAgICAgICAgICB8ICAxNSAr
Ky0KIHhlbi9hcmNoL3g4Ni9lODIwLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgICAgICAgfCAxNTIgKysrKysrKysrKysr
KysrKysrKysrKy0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oICAgICAgfCAg
MzEgKysrKysKIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgICAgfCAgMTIg
Ky0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgICAgICAgICAgfCAgMzEgKysrLS0K
IHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYyAgICAgfCAgIDIgKy0KIHhlbi9h
cmNoL3g4Ni9saXZlcGF0Y2guYyAgICAgICAgICAgICAgICAgfCAgIDMgKy0KIHhlbi9hcmNoL3g4
Ni9tbS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTcgKystCiB4ZW4vYXJjaC94ODYvc21w
Ym9vdC5jICAgICAgICAgICAgICAgICAgIHwgIDEyICstCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5T
ICAgICAgICAgICAgICAgICAgIHwgICA3ICsrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2NvbmZpZy5o
ICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2ZpeG1hcC5oICAgICAg
ICAgICAgIHwgIDI0ICsrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxs
LmggfCAgOTcgKysrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di10bGZzLmggIHwgIDE2ICsrLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCAg
ICAgICB8ICAgMyArCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCAgIHwg
IDEyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92aXJpZGlhbi5oICAgICAgIHwgIDE1ICst
LQogMTkgZmlsZXMgY2hhbmdlZCwgNDExIGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaGNhbGwu
aAoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
