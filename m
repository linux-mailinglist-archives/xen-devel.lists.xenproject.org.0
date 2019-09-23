Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E785DBB1FF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:13:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLHx-0006pA-VK; Mon, 23 Sep 2019 10:09:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLHw-0006p1-8W
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:09:48 +0000
X-Inumbo-ID: 4071e654-ddea-11e9-b76c-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4071e654-ddea-11e9-b76c-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r17so14614132wme.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPofIqwbyjOoJizNjCH8bRsoi60N2OKNI61f/mmLNAk=;
 b=i/xagpyoe8g+/GqcncCG/OHrj2QLQl7AkCtRxVDSkIbDzLix9stO6YproSkO8EDeK3
 LXL8AtwLG1H4O7EyV4qcDwcWhAI4ZiXrWpUapuCkJcPR5Yf7jt6F2zXGV9t4vIm/gHhV
 5a32IBxNK1ftgWqXW2/4PbsNyfJJpLb5wBPxxcDm0xFyKIVnj8vBmAeCgn9G2KuIxi1o
 ZgXokMJJ/FnJV91J9flN7iw9ydNg4LRmBwYRLzql2uNU2tuFroY96XmQMFkDOx0q9dZp
 HeM3XJuEf7lcMvKxe7VhJyxI5vkcvX6v0DVbCNv3sCm+miktdHh0eDuB69r7LgGkaFso
 pdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kPofIqwbyjOoJizNjCH8bRsoi60N2OKNI61f/mmLNAk=;
 b=cSw3E3aCWeMi4d63T1y1pRMiTC68kanWnpmt6ghq1NtHLSMhIWW/jDRDaLcV1mZyAR
 +c5KJOVT2gKnP7n0g4EO8ELHg1d5qwRYP6sGvAD4lb7dyZmjYVvVZx0M5gtBZQu5F90W
 wvUYPsoZXab5OPk4YDelMSG/h5eonXpPpVP1J8FuEzVUxau9mQscIIFQvrhNERzicfuC
 aRL5qOJH/VnsIAm1RLMDHIeGbMVPIh/zBtVdxFSCWZIkh3vXipZhWM3lGUA2qNxBpUpT
 OpXeCSFH8FBPd6uLqrhmV43M/vBj2ZHUJNEDfQk5FBCQUUsVtU9Og03+fFQfbKibENIZ
 0CIQ==
X-Gm-Message-State: APjAAAXc6lo5Nbr0p2QVV78yTf2T6/Giw/YW2vxVDQkMr/mPSdbPDotI
 MvDdvnRaAejqZEQUl70PxVKOmI/w
X-Google-Smtp-Source: APXvYqyASZuoeD0QtJNj2pdjbXLZAVpehovFJByeA0LLms/QxzTW7pNQKgCBxKueCw/iExf4ZO1WQw==
X-Received: by 2002:a05:600c:1089:: with SMTP id
 e9mr13525949wmd.176.1569233378102; 
 Mon, 23 Sep 2019 03:09:38 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:37 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:25 +0100
Message-Id: <20190923100931.29670-3-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
References: <20190923100931.29670-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 2/8] x86: include asm_defns.h
 directly in hypercall.h
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

QVNNX0NBTExfQ09OU1RSQUlOVCBpcyBkZWZpbmVkIHRoZXJlLgoKTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJjYWxsLmggfCAyICsrCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVz
dC9oeXBlcmNhbGwuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJjYWxsLmgKaW5k
ZXggZDU0ODgxNmIzMC4uYzlkZWNhNmZmYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC9oeXBlcmNhbGwuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
Y2FsbC5oCkBAIC0yMyw2ICsyMyw4IEBACiAKICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KIAorI2lu
Y2x1ZGUgPGFzbS9hc21fZGVmbnMuaD4KKwogI2luY2x1ZGUgPHB1YmxpYy94ZW4uaD4KICNpbmNs
dWRlIDxwdWJsaWMvc2NoZWQuaD4KICNpbmNsdWRlIDxwdWJsaWMvaHZtL2h2bV9vcC5oPgotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
