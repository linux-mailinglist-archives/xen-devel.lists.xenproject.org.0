Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7871282E1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 20:50:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiOFi-0004RP-Td; Fri, 20 Dec 2019 19:47:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YXk5=2K=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iiOFi-0004RK-5c
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 19:47:58 +0000
X-Inumbo-ID: 9ed05020-2361-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ed05020-2361-11ea-a1e1-bc764e2007e4;
 Fri, 20 Dec 2019 19:47:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z3so10548620wru.3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 11:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=13PHDrJTB7auPI66dgm/9o2crqNyaQt3GE3RUWQ3f+E=;
 b=NqYsvQUhEOZzU60hP5vwR40x47T/p5DyPyUb04cW2sIVK2JpB04xKpzqevy2xzAEj7
 jAiWSIPLS5O8o1+MWf31McCckch7niwdjshuh/iWaEijmX5n7R+VPk7ee6EhNmzk0zW9
 BXFDB8TOAfw8dR1335EQl8hZDvPTHyPHBA+NVuvCbJ3Jf4qCQoYIudycRhIhCd0IOU+t
 NTnNKzOmmL9rdd7149ub2Uj1+ishivLAHJhJ1feAsDqV5eQKnRfG9rff+QydF2QnNymg
 09jsGm2YLLKRSSH5Sq/FMGxWS9DBZ4f96D3t7UkO4WsRXQknFAZU5v6BipcKIff7AWFo
 Lcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=13PHDrJTB7auPI66dgm/9o2crqNyaQt3GE3RUWQ3f+E=;
 b=oMejo0apIuHc0uwMxWjXBpAVbAsMmedXCujf/WYZG/PUKol/PEYAYmkI+eoXDTpBEQ
 mxalqUTiDxSkOxxDE7LZlMOxBEf+flc0Mf9jswNjcC2g/g8N91uzVmG0cKzdqv7KKCni
 AIQXFuTLDSqpsUmKnBpHeAKc8IDegA1xABYTjkoyvrwk5IU5H/MOkbo7VZXTdzCq1ydb
 wiPQ/Shv5xfNmzNSGxjZp7dDK/3F+H8PBKavc/3ZJIdf0J3UddoyK1Bo5i2YC3r1X95g
 AGxWzZfbCqDimm123hWCXCwmQDMKBVz4adEGrgK0OeFENnJp2ttsaFWB/bIsrqUUn4uV
 6ctA==
X-Gm-Message-State: APjAAAWHxpTZdg3919yxdHJYARTDGZmHcQXWdc1UrMWQC/0JzuFUmr4x
 MKIb2qrQ9vpq3tex46vVPFf4QG+l
X-Google-Smtp-Source: APXvYqz2bvp7NBVxpi9coTGElBUjczAjimBKhciw52lwHygak9J5YJuWDhNfLP/uCnKMN2oAttlqiQ==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr15926905wru.294.1576871276710; 
 Fri, 20 Dec 2019 11:47:56 -0800 (PST)
Received: from debian.mshome.net (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id o7sm10353486wmh.11.2019.12.20.11.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 11:47:56 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 19:47:49 +0000
Message-Id: <20191220194749.19692-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86: Hyper-V clock source's offset should be
 signed
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4ZXM6IDY4NWQxNmJkNSAoeDg2OiBpbXBsZW1lbnQgSHlwZXItViBjbG9jayBzb3VyY2UpClNp
Z25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Ci0tLQpJIGRpc2NvdmVy
IHRoaXMgc3R1cGlkIG1pc3Rha2Ugd2hlbiBJIHdvcmsgb24gZXh0cmFjdGluZyBjb21tb24gY29k
ZQpmcm9tIHZpcmlkaWFuIGFuZCB0aGUgY2xvY2sgc291cmNlIGltcGxlbWVudGF0aW9uLgotLS0K
IHhlbi9hcmNoL3g4Ni90aW1lLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni90aW1lLmMgYi94
ZW4vYXJjaC94ODYvdGltZS5jCmluZGV4IGEzYzliOTI3ZTguLmJiY2M5YjEwYjggMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L3RpbWUuYwpAQCAtNjk4
LDcgKzY5OCw4IEBAIHN0YXRpYyBpbnQ2NF90IF9faW5pdCBpbml0X2h5cGVydl90aW1lcihzdHJ1
Y3QgcGxhdGZvcm1fdGltZXNvdXJjZSAqcHRzKQogCiBzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJl
YWRfaHlwZXJ2X3RpbWVyKHZvaWQpCiB7Ci0gICAgdWludDY0X3Qgc2NhbGUsIG9mZnNldCwgcmV0
LCB0c2M7CisgICAgdWludDY0X3Qgc2NhbGUsIHJldCwgdHNjOworICAgIGludDY0X3Qgb2Zmc2V0
OwogICAgIHVpbnQzMl90IHNlcTsKICAgICBjb25zdCBzdHJ1Y3QgbXNfaHlwZXJ2X3RzY19wYWdl
ICp0c2NfcGFnZSA9IGh5cGVydl90c2M7CiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
