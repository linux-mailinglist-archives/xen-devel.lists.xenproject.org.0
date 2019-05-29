Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00C42E4EB
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 21:01:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW3lV-0006pL-UP; Wed, 29 May 2019 18:57:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YCd/=T5=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hW3lT-0006pG-SV
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 18:57:31 +0000
X-Inumbo-ID: 9b58f6fa-8243-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b58f6fa-8243-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 18:57:30 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h19so3585611ljj.4
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2019 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vl4MnIlc1OAKVkfTnArKY/W4EwC8jGrVMz3mDhYGQ5s=;
 b=snO+EMdPGqfjGwO/9+GymgCDuKLE9Z5WG6hiVCYepB25NcFxRmCEdwwoydj5o8CPPQ
 +Al0escfUwAI04ajoqCk5VDnYjAUP3ixaqB25QJL4e+m8AGoxpiO7BGCvalPvUlyS4n4
 t1DTUi2/Y1vbfUyGcqjGL3a6fWw8dI603GzuIcgHvnOhykv0XvdMPuZPf+C/wi6P//F7
 bszUNaprVT+3F6N5HLmA9HNalinnVZ8ucJjq6UfshHBRkf5t6Gu+PAbeJHk4UjpF+h/g
 OfVRPjYUiP5JMqxzQ3o3ZsR1H6tFEPTLsa65PTjMfyvvHWDKigQk/7MbXOxZBt+r5D7J
 3rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vl4MnIlc1OAKVkfTnArKY/W4EwC8jGrVMz3mDhYGQ5s=;
 b=mMCEPOe/8C7ZihUKbdFGNbkF2u6j/hCb1HS+yeqwH/eBIacgowDpQxIdft6nYY+/mn
 y0m+V8ki7tgRaYfz6fwV0yuFdqvPlANrE21WIjozO0H+PtepxYy+HHrAJ6xxj7a29xiJ
 inkZm6gRX4jy+H54rszKISBAtPMwS+EszyA+PjshbF9FDTN9aRBgI/WG9PImUAyIEknp
 ZxdEwDMZ6Fsb8iWNHOUqLsedAxYR0VbCBbsNjuQeXQr891VgBbtPgw7iYCJB6vvRCwQb
 xYgmwLdEmZWeG7Yld8uoPL17Bq6oLSL3cyCHQW8dAIoFxQRZ8qqKzfURcq2QKYsZ8NEN
 Nu0A==
X-Gm-Message-State: APjAAAXI8XLWAFnOFx/jGo+CvJzlbAwsYB3QJS6+V+CN8jhE4QqZtsqU
 ieb+xCUESBjbDkCpueHjY3e5T09Aj0kui8kpN5E=
X-Google-Smtp-Source: APXvYqxjEWyVR4MmsQwN17LV8Hj1yztC7AQuqhh2ueX8rcbLarpI63jEqvSirAyjBP/g3wm4VtwOtKDohb0ZjUKTX94=
X-Received: by 2002:a2e:8556:: with SMTP id u22mr4326799ljj.70.1559156248582; 
 Wed, 29 May 2019 11:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
 <7fb32709-2e15-8b5d-9182-54c0b4826541@arm.com>
In-Reply-To: <7fb32709-2e15-8b5d-9182-54c0b4826541@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Thu, 30 May 2019 00:26:50 +0530
Message-ID: <CABHD4K8ubjnNx+C6tYWSpjEDUVhsF2N=RorP+Wvz_z0W8T0_+Q@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAxMToxNyBQTSBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPgo+IEhpIEFtaXQsCj4KPiBKdXN0IGEgcXVpY2sgZm9s
bG93LXVwLiBJcyB0aGVyZSBhbnkgcGxhbiB0byBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhpcyBw
YXRjaD8KPgpTb3JyeSBmb3IgbGF0ZSBvbiB0aGlzLCBJIHdvdWxkIGJlIGFibGUgdG8gc2VuZCBp
dCh3aXRoIGEgY29tbWVudCBmb3IKUFBJJ3MgcmFuZ2UpIG9uIGNvbWluZyB3ZWVrZW5kLgoKVGhh
bmtzLAotQW1pdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
