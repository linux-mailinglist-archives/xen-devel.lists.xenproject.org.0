Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125D85A144E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 16:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393473.632454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRE2Q-0000ep-CF; Thu, 25 Aug 2022 14:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393473.632454; Thu, 25 Aug 2022 14:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRE2Q-0000bn-9U; Thu, 25 Aug 2022 14:40:54 +0000
Received: by outflank-mailman (input) for mailman id 393473;
 Thu, 25 Aug 2022 14:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azg/=Y5=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oRE2O-0000be-Cd
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 14:40:52 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9f344e3-2483-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 16:40:51 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id g8so14808917plq.11
 for <xen-devel@lists.xenproject.org>; Thu, 25 Aug 2022 07:40:51 -0700 (PDT)
Received: from leoy-yangtze.lan
 (ec2-54-176-161-147.us-west-1.compute.amazonaws.com. [54.176.161.147])
 by smtp.gmail.com with ESMTPSA id
 s185-20020a625ec2000000b0052e82c7d91bsm15222367pfb.135.2022.08.25.07.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 07:40:48 -0700 (PDT)
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
X-Inumbo-ID: e9f344e3-2483-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=ckMPMlpw+5RknIDJBZ4xeMdrfHGeqfhClarfCfz7NQk=;
        b=W0a7/ynfyWCYwfmx8T73GuKyM/AD6XO0uoFMeL7DkKEHziZsfHMihmBRzj0kKSHKt2
         1b1PtwgYhvXFC4fZGi5xaqOg0EwbOS9+jT8/yVXgPrq+cgBZBzf5Njq+N7/m50MNy8ms
         li4DC1Hk6OT1qvfVWGBZFNMbQyxcpZIrEGU/CFvcmVL9Z+jzlv5KywrHGzLqadhh9Up5
         41gBh5SZ9pu+jm0jXZvOENl2ITc/ODEIyk4CR7p8PuUOL6CE2tQ74V2KYSzcAGGTrk/x
         F52zZc0xjUOp2YicIUavTN36UG7riY+IbrqYr4OLG2aaSNK52r84wIZL8f5SB/yR0Xd9
         UDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ckMPMlpw+5RknIDJBZ4xeMdrfHGeqfhClarfCfz7NQk=;
        b=QL/gTZ+UrLoRxCyDmjJgpeiZHLCQLP3YRAETw57vmrkZSgStTt7DS6m8pXm/BQH7gY
         aVKWdNFM+Kvwdmb1D9kC0b/ssl8XnBQNZ/Qav1pmqJNwVJ8pSvlwV/uBSeY92+GRoxvh
         69CJK1sd5qKhmmWylUFmqFHg9ZFfyZ2GbltMnCMIpVZ+elTL9rQ7vJFyMuv74dQAVbPX
         DSZ76qoxCxaw5y5ukgbnkz/GKYqPpyJKVLsKlZzVVMmnfaoK9NR/6cN3Xf5OzIOxRQ+u
         rlsRc6NpCpUlMNT9Fv+87HkwQfl2VigjCnPZPK/XtZppLqg1bZC+CdsYXCzj8OcZELtz
         zl3g==
X-Gm-Message-State: ACgBeo2tDz6PNfBsAVY+0f/MOsROJz8sPMSTIWs3ohuCyDuMffbT7oLD
	gabhbt9lgMiMQkDG5xlSlreqDKhMYod103td
X-Google-Smtp-Source: AA6agR7cz+JQ6otQP7fcQWnUexMB/QPRqJA/hX0izpcR0q4K2GLXdgKPl9dA7N4Z8c4ofZfadB7e3A==
X-Received: by 2002:a17:902:ec8d:b0:172:f3c7:97a9 with SMTP id x13-20020a170902ec8d00b00172f3c797a9mr4236200plg.40.1661438449489;
        Thu, 25 Aug 2022 07:40:49 -0700 (PDT)
Date: Thu, 25 Aug 2022 22:40:41 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Message-ID: <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
References: <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
 <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
 <Yv5fii2GvIeHEHZX@leoy-yangtze.lan>
 <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org>
 <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org>
 <YwdiDr2uLXGEl2TC@leoy-huanghe>
 <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org>

Hi Julien,

On Thu, Aug 25, 2022 at 01:59:06PM +0100, Julien Grall wrote:

[...]

> > Seems to me, to support para virtualization driver model (like virtio),
> > Dom0 needs to provide the device driver backend, and DomUs enables
> > the forend device drivers.  In this case, the most hardware interrupts
> > (SPIs) are routed to Dom0.
> 
> That's correct. Most of the shared interrupts will be routed to dom0.

Thanks for confirmation.

> > To support passthrough driver model (VFIO), Xen needs to configure the
> > hardware GICv3 to directly route hardware interrupt to the virtual CPU
> > interface.
> 
> Do you mean GICv4 rather than GICv3? In the latter, all the interrupts will
> be received in Xen and then routed to the domain by updating the LRs.

Thanks for clarification.

So GICv3 relies on hypervisor to set LR, and VM can use virtural
interface to response (ACK/EOI) the interrupt.  GICv4 can directly
forward the SPI to the CPU virtual interface (without hypervisor's
interfering).

> > But here I still cannot create the concept that how GIC RD tables play
> > roles to support the para virtualization or passthrough mode.
> 
> I am not sure what you are actually asking. The pending tables are just
> memory you give to the GICv3 to record the state of the interrupts.

For more specific, Xen has its own RD pending table, and we can use
this pending table to set state for SGI/PPI/LPI for a specific CPU
interface.  Xen works as hypervisor, it saves and restores the pending
table according to switched in VM context, right?

On the other hand, what's the purpose for Linux kernel's GIC RD
pending table?  Is it only used for nested virtulisation?  I mean if
Linux kernel's GIC RD pending table is not used for the drivers in
Dom0 or DomU, then it's useless to pass it from the primary kernel to
secondary kernel; as result, we don't need to reserve the persistent
memory for the pending table in this case.

Thanks,
Leo

