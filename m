Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F3144B23
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 06:17:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu8LH-0005Mw-T0; Wed, 22 Jan 2020 05:14:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gwqu=3L=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1iu5LW-0006CU-81
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 02:02:18 +0000
X-Inumbo-ID: 0c5beda8-3cbb-11ea-aecd-bc764e2007e4
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c5beda8-3cbb-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 02:01:05 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id h126so2499025ywc.6
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 18:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QVyH7V155i6vTEKeRTNuLNnOx2Ljhbdv5mXG+v2BA90=;
 b=ZqCYRmS9HFtNoX3OgfGKaLxTXXXYnnI+Tngp13mTUhKaO99tBraidh3lYJCViDq78u
 zeTcpKpD8i/iZ+yWIlZIZhLGzHvq7zQ9veYDpV8Lr/cfn6Qrtb99RgBU5HQgVPNJuvIR
 BGe3PWXC2OgsyoLVm/hDgb1HjIPKhekdHqNxuPSSzrBZiI754cxCjbPGNXOErOXsPAEt
 OD/A4qPxjjFT1PZAIGSV4h/XWEmOoV2ajdVGJuJr5vRoKmDQvXYH0dcs9F0m5opEo3ZP
 dmd1lSXIrrTGfNrk24iVjXwEY4ls+RnCwhw75d8GpRtzhskuqCrTt8u69SxOT6D8P26J
 RItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QVyH7V155i6vTEKeRTNuLNnOx2Ljhbdv5mXG+v2BA90=;
 b=lUNS8sUZS/PyEP2I5SgDDIiT9lFFacRgc/wAx4j2PVCIxnxoKA8tSR9AnvTXLTryWL
 L7KXXUtLopJfUi4tZR1jGCupefFiB8NCXlbraN/+DiZLjr0fRHpyGsxvzn8ECjv7lwyT
 8GNFIA6Nvf7uvm/lPTSYVvZjq03nn0srO9GfBPsN2e9N5oUDQKzT9lkALSutBLeRRDrV
 1vRcJKXcjqDXndgOi/GWxs4AUz9YcksIu3/PPZhcIvlXGKPELrO89/KDA9UiJcTGo0pM
 cBKd1MSa5+gzPDSx2KcgYs0H4W/+ylNeDfCd1RR8rWjS74BN6ZH0lSqHtiLRrV6kV+L0
 p1uw==
X-Gm-Message-State: APjAAAUfmuwAUvMMBRaGwJUHzE0Z71EIoyk065SUBobH4y1Hmk5yz3o0
 U0NtbUfteQqOqgniyakXS/CA0zR33BeSUg==
X-Google-Smtp-Source: APXvYqx2Zkhr8Yb4cFVk1EiGGo2EMQUTEY7Z0VJ6FEqhALV9k3W0gOoo/p1nqwk7tVP+CtBy45Wslg==
X-Received: by 2002:a81:4303:: with SMTP id q3mr5541331ywa.242.1579658464679; 
 Tue, 21 Jan 2020 18:01:04 -0800 (PST)
Received: from bobbye-pc.knology.net ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id q185sm17504248ywh.61.2020.01.21.18.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:01:04 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 19:59:01 -0600
Message-Id: <7ebc34d888493f27302ed0a53e09216233cc9e7e.1579615303.git.bobbyeshleman@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579615303.git.bobbyeshleman@gmail.com>
References: <cover.1579615303.git.bobbyeshleman@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 05:14:01 +0000
Subject: [Xen-devel] [RFC XEN PATCH 22/23] riscv: Add sysctl.c
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
IHhlbi9hcmNoL3Jpc2N2L3N5c2N0bC5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB4ZW4vYXJjaC9yaXNjdi9zeXNjdGwuYwoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3Jpc2N2L3N5
c2N0bC5jIGIveGVuL2FyY2gvcmlzY3Yvc3lzY3RsLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uZmJmZGI0NGVmZgotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9hcmNoL3Jp
c2N2L3N5c2N0bC5jCkBAIC0wLDAgKzEsMzEgQEAKKy8qKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKyAq
IEFyY2gtc3BlY2lmaWMgc3lzY3RsLmMKKyAqCisgKiBTeXN0ZW0gbWFuYWdlbWVudCBvcGVyYXRp
b25zLiBGb3IgdXNlIGJ5IG5vZGUgY29udHJvbCBzdGFjay4KKyAqCisgKiBDb3B5cmlnaHQgKGMp
IDIwMTIsIENpdHJpeCBTeXN0ZW1zCisgKi8KKworI2luY2x1ZGUgPHhlbi90eXBlcy5oPgorI2lu
Y2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4vZXJybm8uaD4KKyNpbmNsdWRlIDx4ZW4v
aHlwZXJjYWxsLmg+CisjaW5jbHVkZSA8cHVibGljL3N5c2N0bC5oPgorCit2b2lkIGFyY2hfZG9f
cGh5c2luZm8oc3RydWN0IHhlbl9zeXNjdGxfcGh5c2luZm8gKnBpKSB7IH0KKworbG9uZyBhcmNo
X2RvX3N5c2N0bChzdHJ1Y3QgeGVuX3N5c2N0bCAqc3lzY3RsLAorICAgICAgICAgICAgICAgICAg
ICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNjdGwpCit7CisgICAg
cmV0dXJuIC1FTk9TWVM7Cit9CisKKy8qCisgKiBMb2NhbCB2YXJpYWJsZXM6CisgKiBtb2RlOiBD
CisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2ljLW9mZnNldDogNAorICogdGFiLXdp
ZHRoOiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoKKyAqLwotLSAKMi4yNS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
