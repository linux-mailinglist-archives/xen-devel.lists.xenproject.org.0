Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C733F44E6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 08:26:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170179.310838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI3OS-0002Ms-DV; Mon, 23 Aug 2021 06:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170179.310838; Mon, 23 Aug 2021 06:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI3OS-0002L4-9K; Mon, 23 Aug 2021 06:25:12 +0000
Received: by outflank-mailman (input) for mailman id 170179;
 Mon, 23 Aug 2021 06:25:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKZt=NO=linaro.org=takahiro.akashi@srs-us1.protection.inumbo.net>)
 id 1mI3OR-0002Ky-3f
 for xen-devel@lists.xen.org; Mon, 23 Aug 2021 06:25:11 +0000
Received: from mail-pj1-x102f.google.com (unknown [2607:f8b0:4864:20::102f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a7f1ff6-2dbf-4a3e-b614-ea5e4d731c27;
 Mon, 23 Aug 2021 06:25:09 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so5164741pjx.5
 for <xen-devel@lists.xen.org>; Sun, 22 Aug 2021 23:25:09 -0700 (PDT)
Received: from laputa (pdb6272e8.tkyea130.ap.so-net.ne.jp. [219.98.114.232])
 by smtp.gmail.com with ESMTPSA id y12sm13993144pfa.25.2021.08.22.23.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 23:25:08 -0700 (PDT)
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
X-Inumbo-ID: 0a7f1ff6-2dbf-4a3e-b614-ea5e4d731c27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o2BbdJSJt+wx2eDv7DKojN6rQv2otTWP7dDlf+VpwK8=;
        b=aoN90aCokvUfeTPn6lCcaJ8lTCA+DhB8sw7SqtkVmKiHSXEY9v5jLKdF8Z7ScCRmiV
         nZndxqNFo0rmCh4CxEVvJr25s7U2WK4n0eiwY/v+/i7qqBJXybOCXtTZZGQ9r1JSygmL
         XMpa0gbofJ/VD3hIxO/Dx3t3MX1+gc2zN8hN1E54r1mmoPT3BeBzZnq+I2qhEXjEfyaH
         JjDRDrXW1uxy2GLvnmsSyTlpYfWUqXqX+7uXtIbqZPFoHaL0qllhHkcp9686jXK7IySK
         jRmI2snu/cmiFl9++nxxTzHtY/5dIu3u3knBvN7UidoBJWFJD/kJf4+eG7iqSA0puTCU
         ZDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o2BbdJSJt+wx2eDv7DKojN6rQv2otTWP7dDlf+VpwK8=;
        b=adya1v2AMGEYN4C4qIgOOuLh4hJ+uMPTJb4fs/DeRgqFmMBPAbJC4fccGI5BBsX/Yn
         +6DrNfcleUB7vDBwHD1qVzYuztn1Tpi7dmezrvEed0JZHYNdC+ZU4Pdo/dx+BujZd1uj
         j3jkprBeK1XaNvJ8W3P6v8VQFqZ4lD29boMCSE1BW1btpAo7LeGBKMlWS/Z4/PzPNLkM
         kpUtp0gPtfkpdxRiPw8gECcOtIy8CwiyYgs6Q3JfUsWJHp7xHgYIcRd7xrapxr5NVQ27
         dqAgTkYlphTLO5tcOzPDMFb5PJfoclCBJnVDUYAqJDW18XPZ+Zjez/wPeL+LVkHU7vRJ
         uINA==
X-Gm-Message-State: AOAM530b78a0Ip4zxyZ2hCZ8XHiA/m7hquMhvJbD9CYiH6bKAShIx34b
	YyoXSQ4R4FfSTNdeLBYNOb0ppw==
X-Google-Smtp-Source: ABdhPJzkkswNQUG91D43fIPfEdN2i3XOEBaGQOlDvl7QIwHEehCH7WeB91b35y2jagao9miz1FoYfw==
X-Received: by 2002:a17:902:b190:b029:12d:487:dddc with SMTP id s16-20020a170902b190b029012d0487dddcmr27347125plr.24.1629699908612;
        Sun, 22 Aug 2021 23:25:08 -0700 (PDT)
Date: Mon, 23 Aug 2021 15:25:00 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Alex Benn??e <alex.bennee@linaro.org>,
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>,
	virtio-dev@lists.oasis-open.org,
	Arnd Bergmann <arnd.bergmann@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>, pratikp@quicinc.com,
	Srivatsa Vaddagiri <vatsa@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>, Wei.Chen@arm.com,
	olekstysh@gmail.com, Oleksandr_Tyshchenko@epam.com,
	Bertrand.Marquis@arm.com, Artem_Mygaiev@epam.com, julien@xen.org,
	jgross@suse.com, paul@xen.org, xen-devel@lists.xen.org
Subject: Re: Enabling hypervisor agnosticism for VirtIO backends
Message-ID: <20210823062500.GC40863@laputa>
References: <87v94ldrqq.fsf@linaro.org>
 <alpine.DEB.2.21.2108041055390.9768@sstabellini-ThinkPad-T480s>
 <YRuSPT9075NuWRYS@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRuSPT9075NuWRYS@stefanha-x1.localdomain>

Hi Stefan,

On Tue, Aug 17, 2021 at 11:41:01AM +0100, Stefan Hajnoczi wrote:
> On Wed, Aug 04, 2021 at 12:20:01PM -0700, Stefano Stabellini wrote:
> > > Could we consider the kernel internally converting IOREQ messages from
> > > the Xen hypervisor to eventfd events? Would this scale with other kernel
> > > hypercall interfaces?
> > > 
> > > So any thoughts on what directions are worth experimenting with?
> >  
> > One option we should consider is for each backend to connect to Xen via
> > the IOREQ interface. We could generalize the IOREQ interface and make it
> > hypervisor agnostic. The interface is really trivial and easy to add.
> > The only Xen-specific part is the notification mechanism, which is an
> > event channel. If we replaced the event channel with something else the
> > interface would be generic. See:
> > https://gitlab.com/xen-project/xen/-/blob/staging/xen/include/public/hvm/ioreq.h#L52
> 
> There have been experiments with something kind of similar in KVM
> recently (see struct ioregionfd_cmd):
> https://lore.kernel.org/kvm/dad3d025bcf15ece11d9df0ff685e8ab0a4f2edd.1613828727.git.eafanasova@gmail.com/

Do you know the current status of Elena's work?
It was last February that she posted her latest patch
and it has not been merged upstream yet.

> > There is also another problem. IOREQ is probably not be the only
> > interface needed. Have a look at
> > https://marc.info/?l=xen-devel&m=162373754705233&w=2. Don't we also need
> > an interface for the backend to inject interrupts into the frontend? And
> > if the backend requires dynamic memory mappings of frontend pages, then
> > we would also need an interface to map/unmap domU pages.
> > 
> > These interfaces are a lot more problematic than IOREQ: IOREQ is tiny
> > and self-contained. It is easy to add anywhere. A new interface to
> > inject interrupts or map pages is more difficult to manage because it
> > would require changes scattered across the various emulators.
> 
> Something like ioreq is indeed necessary to implement arbitrary devices,
> but if you are willing to restrict yourself to VIRTIO then other
> interfaces are possible too because the VIRTIO device model is different
> from the general purpose x86 PIO/MMIO that Xen's ioreq seems to support.

Can you please elaborate your thoughts a bit more here?

It seems to me that trapping MMIOs to configuration space and
forwarding those events to BE (or device emulation) is a quite
straight-forward way to emulate device MMIOs.
Or do you think of something of protocols used in vhost-user?

# On the contrary, virtio-ivshmem only requires a driver to explicitly
# forward a "write" request of MMIO accesses to BE. But I don't think
# it's your point. 

-Takahiro Akashi

> Stefan



