Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927064DCCEB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 18:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291713.495336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUuIK-0006v5-CZ; Thu, 17 Mar 2022 17:52:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291713.495336; Thu, 17 Mar 2022 17:52:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUuIK-0006tI-90; Thu, 17 Mar 2022 17:52:16 +0000
Received: by outflank-mailman (input) for mailman id 291713;
 Thu, 17 Mar 2022 17:52:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZpy=T4=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nUuII-0006tC-PD
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 17:52:14 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa06bb32-a61a-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 18:52:13 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id n19so10266807lfh.8
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 10:52:13 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: fa06bb32-a61a-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=wxvIZdiH9l1S/S1K9AONdxz0gTLAVvorLNNVZWRG6hI=;
        b=olZBngzsI79KQ3TZ8HerpKhY9CSbsCR2xU6yeOjFRHfuGA7kJhgRmNiRsU456oEZlS
         7T1EZcWEdBbvgyNdJsyCw5wCxutktOzjuM0eK+s1gV4Vp19w3IfUDP7LsrhAx91fQFwd
         bkttpZj2h9A3DbmrqrRxACkLs9B+JxiigyN3QDILBUMb5zEBmXYZmDsdkhgdXl8g7hCe
         13lFPX81bbwYMKkvo0sUg5dQgSZbusHlweg20HqA931qIYLmHp8yf2uqnYINQ14YeYeI
         Qx542/LDbzDhRYBNyNcqUiJfTdTGkhIAjMfK62yc15LB6A2DjgbrfsX4ScVyMwOxne5f
         Hnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wxvIZdiH9l1S/S1K9AONdxz0gTLAVvorLNNVZWRG6hI=;
        b=Jy5hLEdhtmw4kNoWnzm02FP5NYsdYfp8yIKxbUtkIc82Ucq7/fmTC320Nk2lFX5/NA
         YYLS5eIeJXbhBrwkBLCbzTu2q1ZmX0M4HzefMThLR9AG+bsphpis4G7jyv0c3LXCzToy
         C1I7b7Y5RS5zfkDYEFDyIvi9xYU2Y5gB81s6NFXet8ciEB+93KMqrdk5uURJJRJIjvqf
         8BHM/xa8yKGW9PNj7w8F58NITK7CrbrVDjP2EFSPpRLsb3rWl5vadjL9/B11EagojoIQ
         B4YWtBPYeQe6bJTvGoICLDwHKWC3xiqcT4xVs0hnpcnht4dx3BNbIDkWDCeJSttqn3Kl
         OiFg==
X-Gm-Message-State: AOAM5326+l9vBWSc/3PZNP7UsulI6GoTZz698IWTsgnE5vHFAyTsThcG
	olj8CXrnNGdETQHM0/4h027BGWOdp5D8scs2pczXC37lyVs=
X-Google-Smtp-Source: ABdhPJxYFiwR6OtcTamp5llrUidhrQNrqaZ5dMU33zesWLOQeIzfJETdlJ1XxRR2qJq9OCtkghcH/+cH1bo1m2DaW6A=
X-Received: by 2002:a19:6a0e:0:b0:443:3b15:4345 with SMTP id
 u14-20020a196a0e000000b004433b154345mr3650161lfu.388.1647539532858; Thu, 17
 Mar 2022 10:52:12 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 17 Mar 2022 13:52:01 -0400
Message-ID: <CAKf6xpvk1zX3ZtzSOWBCasZOuS607-W_iqHbC=ZgTBQqo+btjA@mail.gmail.com>
Subject: Nonsensical XSM Flask denial
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

I shut down a domU (HVM dom9 w/ Linux stubdom dom10) with a single PCI
device assigned.  Xen logged the following Flask denial for a second
PVH dom5 (uivm) without any PCI devices assigned.  This is Xen 4.14.4.

(XEN) avc:  denied  { remove_irq } for domid=5 irq=17
scontext=system_u:system_r:uivm_t
tcontext=system_u:object_r:shared_irq_t tclass=resource

Domain 5 as uivm_t and irq 17 as shared_irq_t both look correct.  But
it doesn't make sense that uivm would make a hypercall for an irq.

Could this be from RCU calling complete_domain_destroy() when current
is dom5 (uivm)?  What would current be set to when RCU runs its
callbacks?

Thanks,
Jason

