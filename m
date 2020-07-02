Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B32126EE
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jul 2020 16:49:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jr0WL-0003Ef-OM; Thu, 02 Jul 2020 14:49:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOhv=AN=gmail.com=brgerst@srs-us1.protection.inumbo.net>)
 id 1jr0WK-0003Ea-AI
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2020 14:49:00 +0000
X-Inumbo-ID: 29cdc0e0-bc73-11ea-8496-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29cdc0e0-bc73-11ea-8496-bc764e2007e4;
 Thu, 02 Jul 2020 14:48:59 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id y2so29170200ioy.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2020 07:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4VXI9uP014tYHa4Tj77JYdAu3duCFmr1FkN+vT8NsI=;
 b=FoyObNL92iyVLE061Hvbm+xq+zoeDIpNkTcIUjGaXkrsBOkS1ywIpFNY/kdIw7OPms
 EWzPxJOpa7MJzcQI1tMfv/vtfU3yNUt4ZETFGw4iwn/fsT9oFyCTnaKIEPlG/LQW7v/F
 cuJdCxfF3FjsQCpeWWNc/QExbhhNa5rnBjX3vciDAAGLevquONjrb00s+NcBsQlgv81f
 e2GGhZ5MMK992CtMz1m3IsNTvXT5qf752JhUqT9DMnFntgzsoYNJScekoqqQ9tlo3OqY
 saoknjuOJ2JQx0GcMqJd6BehD+PelFtZ31gCN2UQkckHDMAyNoGZFxYKfdmuvXR7NZJY
 oPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4VXI9uP014tYHa4Tj77JYdAu3duCFmr1FkN+vT8NsI=;
 b=IdExb4T6K3mpXyU8hFKRaspJBPmYLndV31/EBm4lJ9oBohKtNzlPP075XYN4617P1D
 ymdaZ7Jvvxpms/7YLqYLntOhKxSz5PjhLY9jpcKxbgEqSw0ukMsdQIWtWjgYOUaKq4vF
 Ics3MRCZ1XP42/WhGjnkNO9SsmGu7DL1vhFK+Lb4ZHOhBaRTSku+23JgJeJ9gMlARgN6
 /PdDXEMosFqW2DZ4n48fNWvEaXn2yY1JL796JQ+f7JsvtmbtZfL1gRma+6+OpRiEFxu/
 3I/jpdPQsvq/XRMcG0hWnVuD8IhyuinGjIDDbgP5m2GR3Iyqn/giMfnDvN7q6idmv1kj
 VRBg==
X-Gm-Message-State: AOAM532qtf34vJW6CkjiCmW65cmIoePXfE6S/9JuO0oBjj5ZHyYU7uvU
 SGDmZkqnGTbkNT9kZ3FtckeWvRjBJgMPibe64w==
X-Google-Smtp-Source: ABdhPJyVQXzx0lAtmUN3BtC8Tkcr13el8baae8+TSIqX/1DCH6FcNUO6wM89BF5N7w1XA1rAyO0/vpSkh2gr5Elwbuo=
X-Received: by 2002:a5d:849a:: with SMTP id t26mr7826768iom.22.1593701339267; 
 Thu, 02 Jul 2020 07:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200701110650.16172-1-jgross@suse.com>
In-Reply-To: <20200701110650.16172-1-jgross@suse.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Thu, 2 Jul 2020 10:48:48 -0400
Message-ID: <CAMzpN2hvK2T7Qje51MPjMyTggxT7_=EFnt7gAmJEa1Zq+t3LtA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Remove 32-bit Xen PV guest support
To: Juergen Gross <jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 1, 2020 at 7:07 AM Juergen Gross <jgross@suse.com> wrote:
>
> The long term plan has been to replace Xen PV guests by PVH. The first
> victim of that plan are now 32-bit PV guests, as those are used only
> rather seldom these days. Xen on x86 requires 64-bit support and with
> Grub2 now supporting PVH officially since version 2.04 there is no
> need to keep 32-bit PV guest support alive in the Linux kernel.
> Additionally Meltdown mitigation is not available in the kernel running
> as 32-bit PV guest, so dropping this mode makes sense from security
> point of view, too.

One thing that you missed is removing VDSO_NOTE_NONEGSEG_BIT from
vdso32/note.S.  With that removed there is no difference from the
64-bit version.

Otherwise this series looks good to me.
--
Brian Gerst

