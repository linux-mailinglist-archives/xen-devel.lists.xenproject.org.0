Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A352347B3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:25:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VyQ-00041r-J1; Fri, 31 Jul 2020 14:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7AOU=BK=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1k1VyP-00041l-62
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:25:25 +0000
X-Inumbo-ID: abda3475-d339-11ea-8e4a-bc764e2007e4
Received: from mail-oi1-f193.google.com (unknown [209.85.167.193])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abda3475-d339-11ea-8e4a-bc764e2007e4;
 Fri, 31 Jul 2020 14:25:24 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id e6so6627473oii.4
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 07:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUq1ijDD9SyO2ufTXKPW9//vrm+uL0JQvV8OQ7tDtyA=;
 b=pLnw3WxW6FrK4QQGOgLG+9xHM1D6GN0ldJ0iGIAeulZbMBM0uHOzcTMagxg/H8fAO4
 tW5YuAFhcW2TMHyiEsU/zmrntdTOzAYw2Sc2qtT1W6xU0AZUPWa+hifPtynqcPO9u1ec
 KiN42KGd2iGlkwSYN5FQf6NRI1bxWQ6WKsjNhvs9K65ZmkX1jES87xsrouVRHTjJJukl
 kbuV8AvYgsZcVFl2eDRfLeRCMzoWrHV62lfL17ASNAgY/wtTgvjT0IWFqS6/qF7gdyU8
 XgNNKcubet3B0TQd0cM91bHhMhC9Tx8/qSwP8Uz4WBNXksR23cofCttcCo0bfofs8q6B
 4E/Q==
X-Gm-Message-State: AOAM531BNEyH3M2OcY9HeGZKW0ImeE8GDk5/zBqeG9rE5iezMtekA9rz
 Jzv9dktsWtlCE4T6ThAHLOBp2AvqTUPe+jH4RuA=
X-Google-Smtp-Source: ABdhPJwXQdnG1otKOfzVxyL9Pv5KPx5Dv3MAzyWKLAJcQfKXU/RGMyj9PAedIsxXvXnE+QB4qD60adxhPMBESDi6fDY=
X-Received: by 2002:aca:a88e:: with SMTP id r136mr3259373oie.110.1596205523967; 
 Fri, 31 Jul 2020 07:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200717191009.GA3387@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <5464f384-d4b4-73f0-d39e-60ba9800d804@oracle.com>
 <20200721000348.GA19610@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <408d3ce9-2510-2950-d28d-fdfe8ee41a54@oracle.com>
 <alpine.DEB.2.21.2007211640500.17562@sstabellini-ThinkPad-T480s>
 <20200722180229.GA32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <alpine.DEB.2.21.2007221645430.17562@sstabellini-ThinkPad-T480s>
 <20200723225745.GB32316@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <alpine.DEB.2.21.2007241431280.17562@sstabellini-ThinkPad-T480s>
 <66a9b838-70ed-0807-9260-f2c31343a081@oracle.com>
 <20200730230634.GA17221@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <53b577a3-6af9-5587-7e47-485be38b3653@oracle.com>
In-Reply-To: <53b577a3-6af9-5587-7e47-485be38b3653@oracle.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 31 Jul 2020 16:25:12 +0200
Message-ID: <CAJZ5v0j2kqgEfbiQchiA_USwGKC-UFkn2J3bUU2xCWU=+1p9Mw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] xen/manage: keep track of the on-going suspend
 mode
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
Cc: the arch/x86 maintainers <x86@kernel.org>, Len Brown <len.brown@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Valentin <eduval@amazon.com>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, "Singh, Balbir" <sblbir@amazon.com>,
 Jens Axboe <axboe@kernel.dk>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Anchal Agarwal <anchalag@amazon.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 netdev <netdev@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Kamata,
 Munehisa" <kamatam@amazon.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Miller <davem@davemloft.net>, David Woodhouse <dwmw@amazon.co.uk>,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 31, 2020 at 4:14 PM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
> On 7/30/20 7:06 PM, Anchal Agarwal wrote:
> > On Mon, Jul 27, 2020 at 06:08:29PM -0400, Boris Ostrovsky wrote:
> >> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >>
> >>
> >>
> >> On 7/24/20 7:01 PM, Stefano Stabellini wrote:
> >>> Yes, it does, thank you. I'd rather not introduce unknown regressions so
> >>> I would recommend to add an arch-specific check on registering
> >>> freeze/thaw/restore handlers. Maybe something like the following:
> >>>
> >>> #ifdef CONFIG_X86
> >>>     .freeze = blkfront_freeze,
> >>>     .thaw = blkfront_restore,
> >>>     .restore = blkfront_restore
> >>> #endif
> >>>
> >>>
> >>> maybe Boris has a better suggestion on how to do it
> >>
> >> An alternative might be to still install pm notifier in
> >> drivers/xen/manage.c (I think as result of latest discussions we decided
> >> we won't need it) and return -ENOTSUPP for ARM for
> >> PM_HIBERNATION_PREPARE and friends. Would that work?
> >>
> > I think the question here is for registering driver specific freeze/thaw/restore
> > callbacks for x86 only. I have dropped the pm_notifier in the v3 still pending
> > testing. So I think just registering driver specific callbacks for x86 only is a
> > good option. What do you think?
>
>
> I suggested using the notifier under assumption that if it returns an
> error then that will prevent callbacks to be called because hibernation
> will be effectively disabled.

That's correct.

