Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0E819D6C4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 14:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKLVf-0002s8-Po; Fri, 03 Apr 2020 12:33:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vylu=5T=sunlight.io=anastassios.nanos@srs-us1.protection.inumbo.net>)
 id 1jKLUt-0002qE-GY
 for xen-devel@lists.xen.org; Fri, 03 Apr 2020 12:32:31 +0000
X-Inumbo-ID: 2f02dcde-75a7-11ea-b58d-bc764e2007e4
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f02dcde-75a7-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 12:32:30 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id g27so6693093ljn.10
 for <xen-devel@lists.xen.org>; Fri, 03 Apr 2020 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sunlight-io.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=qIwH+SHm3ZZcmWD/07H3iQrvRIDI3cX7C5cR0fwI3ps=;
 b=uT7hIfTHWUT6CPJiUusm6m5CZ4mw/vUdPHwMxKwD2xRlvQv6odT4tDM0jBGRCvJalh
 szhL1XcI6d1VNocFUJo39GEdB1uNVVqO4L4qwKDZJvzWN+QUfSqB1b/vqCGc1j7G7Yxx
 7SK27NMp2QMpo5kQauKYtjbMZjhNiwW2czPI3rHiON1BeKFkk2z2q++PxMTm3Ya0pwsC
 CpFtf2spbYucsEhQCGg7rvUJOwdiBIWEFIUFWZxSew0Wx2U2xTi2hXOCQ2QHnkzmtrRm
 +SlEFjJKOPewvKgEPHa4T2jvc+2T0z9Ql8bz+7omDSrij8saIPtti+draXG3IWHdYlwS
 EJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qIwH+SHm3ZZcmWD/07H3iQrvRIDI3cX7C5cR0fwI3ps=;
 b=dRVaLZnnl7to901N2l+biKXMp9lXoMadEF/72htehb4tS0MgVTZbo+9EpH5c7qbaTj
 QVxIh+zk1F1TcYNiX05DCcxg5j/CvIJNMFrT5AshHpBqumDyp6CzsS9pqxctqDWmHbUn
 cmU//k/55GVCKufqrytru63KuhH5k5mlNfCawxQodppJTVwTAbGh9gyCwzcdcfrGYNJz
 wFwa/Ld0udYK8TboiipoJ6MPlF/4Q9dc/2pyvNAQg2Ce4DDdZrxUdqr9E6s9pCVfioam
 2aG70xCbkr1SpeJsbYzfVg7fZs5WndV1sA9nxCSsvxKb9rpG3gqEJB/OdgG0T7cgS46t
 U39w==
X-Gm-Message-State: AGi0PuZ+cAukOOwSR0+c8MjntBopjbnw43puLrLjgKHy7aKLuiTkU/A4
 ZmenC14JvosyidQf9HjM56C9AlQgoW6oVwJfMcumLi5ENx9CHQ==
X-Google-Smtp-Source: APiQypKwUjh8jwD0zwgaG7bHwCkAmWPpf0O3UmLC14eehGdggxKOrF3WK+BH3kKA8wrQjWenc+VL2dm4BkQb4Hi9k14=
X-Received: by 2002:a05:651c:96:: with SMTP id 22mr4907093ljq.27.1585917148843; 
 Fri, 03 Apr 2020 05:32:28 -0700 (PDT)
MIME-Version: 1.0
From: Anastassios Nanos <anastassios.nanos@sunlight.io>
Date: Fri, 3 Apr 2020 15:32:17 +0300
Message-ID: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
Subject: Live migration and PV device handling
To: xen-devel@lists.xen.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 03 Apr 2020 12:33:19 +0000
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

Hi all,

I am trying to understand how live-migration happens in xen. I am
looking in the HVM guest case and I have dug into the relevant parts
of the toolstack and the hypervisor regarding memory, vCPU context
etc.

In particular, I am interested in how PV device migration happens. I
assume that the guest is not aware of any suspend/resume operations
being done, nor do its PFNs need to change, so I suspect xenstore
device entries (for VIFs / VBDs) for the guest remain intact. However,
it is not entirely clear to me how xenstore entry migration happens.

As I am probably missing something obvious, could someone point me to
the part of the code where xenstore entries are being copied across to
the destination node?

thanks!
A.

