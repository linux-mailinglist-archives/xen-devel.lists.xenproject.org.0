Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743FB24E233
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 22:39:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9DoD-0003VA-N2; Fri, 21 Aug 2020 20:38:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vzen=B7=gmail.com=s.temerkhanov@srs-us1.protection.inumbo.net>)
 id 1k9DoC-0003V5-Fl
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 20:38:44 +0000
X-Inumbo-ID: 3d07c410-20df-478d-bfbc-8076e50325ff
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d07c410-20df-478d-bfbc-8076e50325ff;
 Fri, 21 Aug 2020 20:38:43 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c10so2600499edk.6
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2020 13:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vi/8aT3Huf5NAGyRxOoI6p9NpOv9Vpgaq5/rONtkNvc=;
 b=T4f6EGX4qd6g5kBgfL7zAsYEPQ2Ouzj828IfoSGzQilCtB/f983DL35aspsjrJ4Uu6
 M1CfLyfDhzkP8tTaoSS1dYxxAmZE0I3USExRtz35yIG3xtJBsLELT5dGoPFBxeXsiXHc
 q/KWmMJXB7KhvkOw8E6ihERyOUPjH3VupXKfaAL4iAcHtu3Mf04IhCUnyysdICYm0gCa
 Y4XK64AY2FTk/R9J8CxDsGeH+APwZpmgXEqprm/1aBOOp8za1fQINxRplXrxBEAsgBAn
 u6kAmWWYnwISHXHRPVAC07n7m5BITEla7WKRTdgFolhB00XHx7IL6L/D/bpv6to5FZPZ
 x8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vi/8aT3Huf5NAGyRxOoI6p9NpOv9Vpgaq5/rONtkNvc=;
 b=diBWGUSlBrmZ2PUuJo9ES67h64rbcu2nya/lZY9VICKi521fiHSSMsmJ9xWERcoPer
 aKUvU7gBMJw7SjAJiHzl+OBtPArZlFm9pM5MyfmDs2LvsGDM/vWaxKerrz97jZcuDLii
 Xrsz1PA1uu9Vtm+AsA10p91OZS1688g1utFu3PtVvMqMz084EzJzlgXYgxTv/XGuGy7u
 KVBS5oWSS5N24L06M/06DzwSIXVKCEU8beeccGUnk40SMS/F3x9X81hDyAnfz3JlvsWU
 AMz/FaegOLugwULedMcOsIb8U3TekSMi+ktsbYJ2A+poSvEqUdsaoDHDBTAsIgsylH89
 tdSw==
X-Gm-Message-State: AOAM533S06LetNF6IfLXiisskse4rDnckMQYck8ETAAtcuCfGgAVmYvv
 wiM3hOx9tuVTVTj3+25W3PtGjvk13BytfBxkIUQ=
X-Google-Smtp-Source: ABdhPJyEnpWuEGmiZXcEH3Q+wrpjtTgpaADWnKXSZM8WvdzVdXzip9/24igkonZQ9N/sY1Oz8aU3pr0dD7oIZPaQSbo=
X-Received: by 2002:a05:6402:847:: with SMTP id
 b7mr4815131edz.39.1598042322794; 
 Fri, 21 Aug 2020 13:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
In-Reply-To: <871rjzsqyy.fsf@nanos.tec.linutronix.de>
From: Sergei Temerkhanov <s.temerkhanov@gmail.com>
Date: Fri, 21 Aug 2020 23:38:30 +0300
Message-ID: <CAPEA6dbdePG2V0MmRo0jFH5Q82Kk5cD=hsvqnDYymFrZ1K=aGg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Xen: Use a dedicated pointer for IRQ data
To: Thomas Gleixner <tglx@linutronix.de>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
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

On Fri, Aug 21, 2020 at 11:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> Fiddling in irqchip is wrong to begin with.
>
> int irq_set_handler_data(unsigned int irq, void *data);
> static inline void *irq_get_handler_data(unsigned int irq)
> static inline void *irq_data_get_irq_handler_data(struct irq_data *d)
>
> are accessors to handler_data. Am I missing something?

Well, the patches in question are meant to solve the issue discussed
in this thread:
https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00957.html
All in all, the Dom0 kernel crashes due to a conflict between Xen and
GPIO pinctrl code both trying to use hander data to track some private
data. The patch series adds a separate pointer along with a few
functions for Xen. There may be other ideas on how to resolve this
issue though
Here are web archive :-) links:
https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg01144.html
https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg01145.html

Regards,
Sergey

