Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23401ED9DD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 02:11:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgdSd-0000HZ-Rr; Thu, 04 Jun 2020 00:10:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FKu=7R=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jgdSb-0000HU-BM
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 00:10:17 +0000
X-Inumbo-ID: c49fe0b8-a5f7-11ea-81bc-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c49fe0b8-a5f7-11ea-81bc-bc764e2007e4;
 Thu, 04 Jun 2020 00:10:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q13so3230220edi.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 17:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SBCn6+ywtwKDSrFyNeGcQyKLX9pJa482RffEcN0lApc=;
 b=v6f7ml3ifkrHNnNmCnQaEh6TEX4qn6KXUvnIiOoWv2i+pttTmhrthhwQ3wiMiGZU/l
 Lk+lx2oWuqlHFcDLPjiye7azpPW+BKWdS4paPA6NkDur7yLP589TrG+BSJquETjqnHPM
 fNXGSLRmA9NFq60yxW3NR8m1kakFjxe+GAeT+XM2/7WU26XQO2iKRq8br3p549h0appb
 TR1Ftp3mrLpxWsaD+rskVhT4wyC5FmUKs7yR//vNPwReUGTDdBZLJ2dAkj/gnA6BmU5p
 Iz5hAa/6+Kjh+mIU1uRlgwTDDqMsBftRxMOqESQMlOh+bZCqJZeKHWlBg9aeWPnsu7wf
 B/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SBCn6+ywtwKDSrFyNeGcQyKLX9pJa482RffEcN0lApc=;
 b=fHhcWBfqWcrpk+hE6E2desAHr46NA44rzAzUgpVsC/LtL0cdXoGj4HLpFzBUcuxDve
 xppIKHrOT5h2R+GrGx278gdlyJwPei5vCkQBW4l9lHY2WF8pBR6qBQG1VaPcDvhTQ/xs
 Q1unLV6/O1GttEjSWVZzmrKTi3d+Sjw1wnTyTBM2F1qIhFfeBwbSlZcVKMKwFlCrYhO/
 L72kESpx333Qb3lwRRijCRJxLgGcHOawndnYy4+MMO0HuW45z6I8DWmmLidw8saQ8wJr
 cKDnyLS/0/kGyrV55cvzo8BWxMgCrNbrZfaQaALh2rXyjCQZ1a1a6OPkgGEKSlYF5d5M
 Uycw==
X-Gm-Message-State: AOAM533TbWVGkXjJ5XcQfdL2k8U+XVFa4ASXCW605mQU2onQoA38x+Iq
 CWEWprVfXBTSrWPNAB4IkWNbu5scVsQ=
X-Google-Smtp-Source: ABdhPJw7rexVsbQBKgrsyOziuJp7x4bxDjgXXKhjFjv5bh5ghRQi48PSQrrcW35d2yo+I8zoIH/FMA==
X-Received: by 2002:a50:8b05:: with SMTP id l5mr1822301edl.276.1591229415662; 
 Wed, 03 Jun 2020 17:10:15 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id p26sm254204eds.57.2020.06.03.17.10.13
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 17:10:14 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id x13so4190281wrv.4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 17:10:13 -0700 (PDT)
X-Received: by 2002:adf:e648:: with SMTP id b8mr1788954wrn.386.1591229413535; 
 Wed, 03 Jun 2020 17:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200603223156.12767-1-sstabellini@kernel.org>
In-Reply-To: <20200603223156.12767-1-sstabellini@kernel.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 3 Jun 2020 18:09:37 -0600
X-Gmail-Original-Message-ID: <CABfawhm+MH5ujJmYW+97oWHwDLBAgrdaThtadeO=WtupGYSmvA@mail.gmail.com>
Message-ID: <CABfawhm+MH5ujJmYW+97oWHwDLBAgrdaThtadeO=WtupGYSmvA@mail.gmail.com>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, cminyard@mvista.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 3, 2020 at 4:32 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> Touching the watchdog is required to be able to reboot the board.
>
> The implementation is based on
> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Ah, fantastic, it's been very annoying not being able to reboot the
board via ssh.

Thanks,
Tamas

