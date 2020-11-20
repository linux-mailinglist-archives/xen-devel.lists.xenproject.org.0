Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE402BBD6F
	for <lists+xen-devel@lfdr.de>; Sat, 21 Nov 2020 06:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32702.63854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgLZY-0001pX-Vi; Sat, 21 Nov 2020 05:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32702.63854; Sat, 21 Nov 2020 05:36:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgLZY-0001pF-OS; Sat, 21 Nov 2020 05:36:32 +0000
Received: by outflank-mailman (input) for mailman id 32702;
 Fri, 20 Nov 2020 22:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltmN=E2=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
 id 1kgEmX-00084x-QG
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 22:21:29 +0000
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6bf0283-a6ac-4448-bac2-1d96ba61b2f1;
 Fri, 20 Nov 2020 22:21:29 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id x17so9968621ybr.8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2020 14:21:28 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ltmN=E2=gmail.com=miguel.ojeda.sandonis@srs-us1.protection.inumbo.net>)
	id 1kgEmX-00084x-QG
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 22:21:29 +0000
X-Inumbo-ID: b6bf0283-a6ac-4448-bac2-1d96ba61b2f1
Received: from mail-yb1-xb41.google.com (unknown [2607:f8b0:4864:20::b41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b6bf0283-a6ac-4448-bac2-1d96ba61b2f1;
	Fri, 20 Nov 2020 22:21:29 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id x17so9968621ybr.8
        for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2020 14:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=29/AaAKKWIjlxKBDiu42mXe16/c3LUzQvTdn0Wctw9g=;
        b=th/UjqVcversiy9gEUr46cKRrhHywr0iTgf9mzUejm+T3/Jtu2c6ftjob7N1dnOe2S
         rGVMit/4Gqy7ZDqW+do8x9wI8RCPt/cmuWncILsoBuux3CBAtfG8gT+eTL8wiBVSM5EH
         rDgxqkIvK+vUXnfhgj71GxYIUQH1hInVNMbCl5+3prik9RGhi+hsmul85xXuf9uJVr2L
         NGLQGWDmOXXHg4l9XujW0HrVyacbE3Q1QSLAkLJ0BjE5AdFqhLyeU3T8/6+nJ9hH0JSR
         o1vAVeqr6Bt+/W6rGIwrn7PuvAvMGRmk1Avx4k6vjCg8etglRiDTMnimrqKcX/KEsNCP
         0CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=29/AaAKKWIjlxKBDiu42mXe16/c3LUzQvTdn0Wctw9g=;
        b=tf0245agvlXQ5jkbIyvodtLJdX+fSZTYFBRHInfYzFSgjwckkFPBarQY6ODs9T12z+
         C5YNHS5xKLb0RJVmzxzzJ5WSTeOFMHCLLlbA2MRgo+QKmzZ1N97wkl50nBXHjoItA3Mo
         o3BevoAwJEg9B0Zxlz66DLwrZZ+KghecUZxnZJxeWF5+a7AoFJpb//WAsBlbFWOXlHYA
         MiV6NCPnegUudeQZKayJj5esxOuRx+GqHUtO/NpC8GDHN3Ue0kbIWYqZGCj+F0JpVzCm
         IhxYXbpp1PyGD7m10G8UNm4vWfYqiKX1ySERi0Vm76LjUl0pfrkkX5fGCkp28Nje3bHX
         TEsQ==
X-Gm-Message-State: AOAM530xa8+KLGPpK+K4/+HtVoKC0EbVTbD79BGKpQSfB9mr5wRzjepG
	lQA3ASzSmFyBSHDRdPOL1MLUqhZUOo//mePG2V0=
X-Google-Smtp-Source: ABdhPJzYUhkcjTyH5GIcOV5fWMsl+OUdzem471zLY9usW3RhV8izQIRbyESMTmZwFikqgbfOQQqVvSSQCZzBPJX4q90=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr22113400ybp.33.1605910888617;
 Fri, 20 Nov 2020 14:21:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2020 23:21:17 +0100
Message-ID: <CANiq72=E_gEVvqUUTSqU4zegC2=yZSTM4b=4G-iofp6d3=UgWQ@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org, 
	amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org, 
	ceph-devel@vger.kernel.org, cluster-devel@redhat.com, coreteam@netfilter.org, 
	devel@driverdev.osuosl.org, dm-devel@redhat.com, drbd-dev@lists.linbit.com, 
	dri-devel@lists.freedesktop.org, GR-everest-linux-l2@marvell.com, 
	GR-Linux-NIC-Dev@marvell.com, intel-gfx@lists.freedesktop.org, 
	intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, linux-acpi@vger.kernel.org, 
	linux-afs@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, linux-block@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-cifs@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-decnet-user@lists.sourceforge.net, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, linux-fbdev@vger.kernel.org, 
	linux-geode@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-hams@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input <linux-input@vger.kernel.org>, 
	linux-integrity@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc@vger.kernel.org, 
	Linux-MM <linux-mm@kvack.org>, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sctp@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, netfilter-devel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, op-tee@lists.trustedfirmware.org, 
	oss-drivers@netronome.com, patches@opensource.cirrus.com, 
	rds-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, 
	samba-technical@lists.samba.org, selinux@vger.kernel.org, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	usb-storage@lists.one-eyed-alien.net, 
	virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, xen-devel@lists.xenproject.org, 
	linux-hardening@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Gustavo,

On Fri, Nov 20, 2020 at 7:21 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> Hi all,
>
> This series aims to fix almost all remaining fall-through warnings in
> order to enable -Wimplicit-fallthrough for Clang.

Thanks for this.

Since this warning is reliable in both/all compilers and we are
eventually getting rid of all the cases, what about going even further
and making it an error right after?

Cheers,
Miguel

