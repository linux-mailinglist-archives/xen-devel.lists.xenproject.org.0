Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263F80850
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 22:59:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hu13V-0002Ja-Tm; Sat, 03 Aug 2019 20:55:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=43Hy=V7=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hu13U-0002JS-BV
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 20:55:08 +0000
X-Inumbo-ID: f8fc7c73-b630-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f8fc7c73-b630-11e9-8980-bc764e045a96;
 Sat, 03 Aug 2019 20:55:07 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id m23so75868141lje.12
 for <xen-devel@lists.xenproject.org>; Sat, 03 Aug 2019 13:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDNBHn/46dSFT7YAINHuMsy4KkBKHgwSy2+hkvs5qrU=;
 b=eMjP2RcwzdLiqMh2LORSgSTeUEYXqMCLr0nK5DXmayYCiTRtKygpJpFN2Bdu3oqi70
 a7UTd5sGKcvML3/zTtQTaoaQAfT1UzeF2RuWXeBuHUMAZTiEimNcCE8fRcu4DSXV/nSw
 w7GJow1/ykyzRxDODz8UfJfVwcynfa3MzBf9RZnm6IAG+QXJ7QtW4w7LK8arRNMsGxF+
 6lQ/vX41mLJCCMtmG3lwVsDqrp68lPGeYqTQdbEJFGbATSpw/wltaUUBHfWl0WdLW2qA
 toMkKAWR8uQnAMwlOJqZtaj5HQl4YN8qUzJ0DNoMpuEbhJfsKuOKhVRIit4yPqqSTvyR
 YOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDNBHn/46dSFT7YAINHuMsy4KkBKHgwSy2+hkvs5qrU=;
 b=B8oVvD2XqLKbNnlIciD8QsKUHke0fUK+CPE64citCk0tRbPcRWO+w/49qAvTGeKudN
 IAAVCDoXCyOcAlFnIquTZd1saOE/PzBx3fTV0/yHUmRdisvDvOn2MYKLg/12xQmUwCMB
 yiQQ0saNRJm9BBRrlD3PCveAnOLcFxP8Uf+T4YvxzbGtqUsRYnPoY5SexKdQbfNgpgcY
 dy4kI5DRJAgvq8fepC+69QRfEeugkWNH/ja0dL3KT6Eemlzc2uGRz1k6fP1pRRuX4Ay5
 AcGzTF5uwIYr5OQPohifz5bQfY/PvekFcTPOtO9CInL1YAh4OAHThqPYJCeAwWkPS8Mm
 BwDA==
X-Gm-Message-State: APjAAAXBerb8OHXJ64jQPhFR7wnX7lG+0oDxM70xfM2XjZDkrwsdB3SH
 +ybmujb5xy4/+2sJs271+YU6YnTHLOgPzr6IOFQ=
X-Google-Smtp-Source: APXvYqxkIPl8YYC66EuULrRmbH8uU+bI7ZBJAnJMdoxq3iAL7V4IK1EJ3CK+V8oVSNAZL8OBP4Buj2F/FNRGPVmpPMQ=
X-Received: by 2002:a2e:8945:: with SMTP id b5mr11815519ljk.93.1564865705737; 
 Sat, 03 Aug 2019 13:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
 <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
 <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
In-Reply-To: <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Sun, 4 Aug 2019 02:24:30 +0530
Message-ID: <CABHD4K8GmFLXjwrRse5JuJ4rSJ3Wy0_uU_6edqSMF_Yi5-YjDQ@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: xen-devel@lists.xenproject.org, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCgo+IEkgaGF2ZSBzZWVuIG11bHRpcGxlIHRo
cmVhZHMgZnJvbSB5b3UgcG9pbnRpbmcgYXQgaXNzdWVzIG9uIHRoZSBJTVguOC4gSGF2ZSB0aGV5
Cj4gYmVlbiByZXNvbHZlZD8gSXMgdGhpcyBzZXJpZXMgZW5vdWdoIHRvIGdldCBYZW4gYW5kIERv
bTAgYm9vdGluZyBvbiB0aGUgTlhQCj4gcGxhdGZvcm0/CgpZZWFoLCBtb3N0IG9mIGlzc3VlcyBh
cmUgcmVzb2x2ZWQgbm93IGFuZCBtYWlubGluZSBEVFMgaXMgdXNlZCB0bwpicmluZyBYRU4gb24g
dGhpcyBpLk1YOCBwbGF0Zm9ybS4KClRob3VnaCB0aGVyZSBpcyBzbWFsbCBjaGFuZ2UgdGhhdCBj
b21tZW50IG91dCBHUEMgKHdoaWNoIGlzIHVzZWQgcm9vdAppbnRlcnJ1cHQgcGFyZW50KSBhbmQg
aW5zdGVhZCB1c2UgR0lDCmlzIGRvbmUgaW4gRFRTLgoKVGhlIHBhdGNoZXMgaGFzIGJlZW4gdGVz
dGVkIGJvb3RpbmcgRE9NMCB3aXRoIHJhbWZzLgoKVGhhbmtzLAotQW1pdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
