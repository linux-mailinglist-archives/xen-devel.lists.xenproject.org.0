Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC218FFEA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 21:58:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGU6O-0005zv-Bo; Mon, 23 Mar 2020 20:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pHd2=5I=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jGU6N-0005zq-11
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 20:55:15 +0000
X-Inumbo-ID: 97fa23e4-6d48-11ea-bec1-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97fa23e4-6d48-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 20:55:14 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x16so3938175qts.11
 for <xen-devel@lists.xenproject.org>; Mon, 23 Mar 2020 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=hM7gsZwsugRkWYfCA0z3WSknmzGB7OgkIp/jID/hRnY=;
 b=Cz4ZfvdKFLSNTY5phRGIRWYHOHwGsfepAjQ3z6/GRzPHzdAYto7o+ERby0DRkmtiGU
 E8bzQnghwYvDr7jeGsNIyutukRpb4MNYQXeHnmyuLG/xBsYZE7MBZqAEjqRkXAjPq86V
 0uEW4GolA2qryXd6gAKhS2xVD0SXAQzh1fp1S0CsskfOmqbARC5hMSOdpE/7Fa+pSVhS
 6ht0VNJyWHic3IB3BxgG/uz5zc8d2B+/HhJ6ylFCVyhSOg4WksL8obt1YUCC3V9siNLj
 RPNKRcUizitAdhCn9amKNLbZquPAkk3Bo2dhQndOv1ukyIWiP4IAFP1mI9ZFGzJAD81z
 09AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hM7gsZwsugRkWYfCA0z3WSknmzGB7OgkIp/jID/hRnY=;
 b=Dtr1hZKqzWBo5AISjUdL0s83/QBezWaP5xXhUc37iZL1CnJYHRzqdRK0w6XjkCn6fb
 zb+Akiw9udg65ndrOfzgFl/Fz69XJwJDKtZ3+KX4IH60kCM4fRve/ToFEYccuQi1AJSr
 kIrBhQcNa2l+Cy7m8nNV6BMRIY+lxGAmjh9oc852b3pg5ZytNPZJW/Y0/19q/+/dUe3y
 XzNMUksVpEyNl9EsmQqEmsAp2eRQ4fIYi9cEBExGmMUXoZcDUhxKplVtv9+1hZqTc3cK
 OD7yRG19vs/b3cLgf5KeDR1nPkMy/dgWCsMLooI2e4w+p1B/NWwTkABBjdGs+8Hi3S3y
 J2Cg==
X-Gm-Message-State: ANhLgQ3Ngau70ckjegnW6zV6XZeAED38/2LriCsflDFM7nGCCz9ciSTT
 8buIVy2WVX9XB7PKuUroxZu4LSCNaxyQv7zHieyjvqJQKgY=
X-Google-Smtp-Source: ADFU+vsMMjlha+o2+6aCaXea3efHUk4kYYqdxydeBpC4WXVsyH1kcBt0V870K679HRlhEs3uBuI8a9rJbgc0sl+nI2M=
X-Received: by 2002:ac8:358f:: with SMTP id k15mr2462771qtb.113.1584996913115; 
 Mon, 23 Mar 2020 13:55:13 -0700 (PDT)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 23 Mar 2020 13:55:01 -0700
Message-ID: <CAMmSBy861_4VXrpC1S0LU8M7ut3ZWErtjqT2vvx8nqnHkrXmYQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Subject: [Xen-devel] PCIe IOMMU ACS support
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi!

I was going through how Xen support PCIe IOMMU ACS and
all I could find is this:
    https://github.com/xen-project/xen/blob/master/xen/drivers/passthrough/pci.c#L608
which looks to me as an attempt of enabling ACS opportunistically,
but still proceeding forward even if it fails.

Am I missing something here? IOW, does Xen try to do any kind of
fine grained ACS differentiation along the lines of what linux kernel
is doing:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c#n4299

Thanks,
Roman.

