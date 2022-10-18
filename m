Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5A602848
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 11:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424813.672526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okiqK-0003x6-Ot; Tue, 18 Oct 2022 09:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424813.672526; Tue, 18 Oct 2022 09:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okiqK-0003u4-Lm; Tue, 18 Oct 2022 09:25:00 +0000
Received: by outflank-mailman (input) for mailman id 424813;
 Tue, 18 Oct 2022 09:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SMRC=2T=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1okiqI-0003ty-Pf
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 09:24:58 +0000
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id baefeda8-4ec6-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 11:24:57 +0200 (CEST)
Received: by mail-pf1-x434.google.com with SMTP id y1so13546467pfr.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Oct 2022 02:24:57 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-199.hinet-ip.hinet.net.
 [211.75.219.199]) by smtp.gmail.com with ESMTPSA id
 x184-20020a6286c1000000b005622f99579esm8751955pfd.160.2022.10.18.02.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 02:24:54 -0700 (PDT)
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
X-Inumbo-ID: baefeda8-4ec6-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vlRg12olj5JkM7jdQADHZUuCu+dv7eXSTEyPP63tuM=;
        b=P1gfuj+vS2QDJxu1ooGWer4pVsrKmzCDHz9FHhxnOig9U7bz4XYkqeDAU+JIt/fsmD
         sgJ9qKUBK4inEUw2EHMPjofAguOQ9njovgIHn2GzIecXKKN9dF43FwTTf+qIfIxVekO+
         7hogsV51vdrqI1ndYpALp9CDNR+zes6Ny+3Vt+nn71KHyZsUFOD9bZFR476rXnqd9NG9
         vvPfH+s+6vbAmpoYECVXV10XvPHn8nvM9odQP8fIaSa1N4ui5IHGsCXrQ6oG25K5hX5G
         CSzTeR68486wubvX6JU4P/OE73TWH6asfcw+LJ4lYNMz0YTSSfQGb79o6vqHO1xJe6Om
         /4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vlRg12olj5JkM7jdQADHZUuCu+dv7eXSTEyPP63tuM=;
        b=z1am1uB7YBZ7z5euplaNpe5d4gaS2epPyxY915AW57L+524rGcykprLTitMnyeMVZx
         T3BdJYWwBPLPlRC1c/bfQm6lIWd8FFzF0i7HfGHVse0C65697NK1CcIcfuNr9kmigVNQ
         q0ZyQzXlo8b4oBamBq0oCNp8tStL0Qyfjew3qaNBpMDbOOIg17fdPkth7l+RTavGR0/F
         pqV0MFk2msIQbZVMKCFPStWlHrn2qBe0/vQ18am8vffjep+jwXIyLyVVvyC6xmpyU14N
         d9MfsdhJr9ux/Rq2Os0SwBqINNmOOUmoPnnUuyKiIk00+5g3lVNqAfLb1UKrv10KMSwq
         yVrA==
X-Gm-Message-State: ACrzQf2P+C8Wf5Supse6DB3h4RQjVxkGVAJnGilC0fWUj9Hm7bcTVwoz
	iGk+owG2pDcv9VvPp5fFwQjQrw==
X-Google-Smtp-Source: AMsMyM7+CwR43A4a9QUq23F8tIyu/URPeg4W1jVH9kqRk8M4nTYphS0xt93RZGLX0aKj56rShlBDfg==
X-Received: by 2002:a05:6a00:1947:b0:565:c337:c53b with SMTP id s7-20020a056a00194700b00565c337c53bmr2299521pfk.10.1666085095708;
        Tue, 18 Oct 2022 02:24:55 -0700 (PDT)
Date: Tue, 18 Oct 2022 17:24:47 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen Develop <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>,
	jgross@suse.com, oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com, wei.liu@kernel.org, paul@xen.org
Subject: Re: Issue: Networking performance in Xen VM on Arm64
Message-ID: <Y05w36OAVyDJwCCr@leoy-yangtze.lan>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>
 <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>
 <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop>

On Mon, Oct 17, 2022 at 04:50:05PM -0700, Stefano Stabellini wrote:

[...]

> > Which means it takes 543us to let Dom0 to receive the notification.
> > You could see DomU runs in CPU3 and Dom0 runs on CPU13, there should
> > not have contention for CPU resources.  Seems to me, it's likely Xen
> > hypervisor takes long time to deliver the interrupt, note, it's not
> > take so long time for every skb transferring, sometimes the time for
> > response a notification is short (about ~10us).
> 
> Good find. I think this is worth investigating further. Do you have
> vwfi=native in your Xen command line as well?

Yes, I have added "sched=null" and "vwfi=native" into Xen options:

options=noreboot dom0_mem=4096M bootscrub=0 iommu=on loglvl=error guest_loglvl=error sched=null vwfi=native

> After that, I would add printk also in Xen with the timestamp. The event
> channel notification code path is the following:
> 
> # domU side
> xen/arch/arm/vgic-v2.c:vgic_v2_to_sgi
> xen/arch/arm/vgic.c:vgic_to_sgi
> xen/arch/arm/vgic.c:vgic_inject_irq
> xen/arch/arm/vgic.c:vcpu_kick
> xen/arch/arm/gic-v2.c:gicv2_send_SGI
> 
> # dom0 side
> xen/arch/arm/gic.c:do_sgi
> xen/arch/arm/traps.c:leave_hypervisor_to_guest
> 
> It would be good to understand why sometimes it takes ~10us and some
> other times it takes ~540us

Thanks a lot for detailed info.

Just note, in my platform DomU enables GICv3 driver rather than GICv2.
This would be a bit different in the Xen code.  But it should be easy
for me to map to vgic-v3 files.

I have a question for how to trace Xen system.  Outputting chars to UART
is time costy (usually it's millisecond level), it is not friendly to
use console for debugging performance issue.  I searched a bit, either
"xl dmesg" or xentrace can be used for capturing trace logs, one thing
I am not certain is if we can save Xen logs only into log buffer and
doesn't output to UART, so that afterwards we can use "xl dmesg" to
capture the logs.  Could anyone confirm for this is correct usage with
"xl dmesg" or I should use xentrace for this case?

Thanks!

Leo

