Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8F860339C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 21:56:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425353.673098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oksg2-00064R-Q0; Tue, 18 Oct 2022 19:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425353.673098; Tue, 18 Oct 2022 19:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oksg2-00061v-Mn; Tue, 18 Oct 2022 19:55:02 +0000
Received: by outflank-mailman (input) for mailman id 425353;
 Tue, 18 Oct 2022 19:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9K0G=2T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oksg1-00061p-Cb
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 19:55:01 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf67470f-4f1e-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 21:54:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30ED8B81F11;
 Tue, 18 Oct 2022 19:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E907C433D6;
 Tue, 18 Oct 2022 19:54:56 +0000 (UTC)
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
X-Inumbo-ID: bf67470f-4f1e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666122898;
	bh=VJcLJ6R5zsloyg6Ttp2tp38Jl0ZqQbH3A07lWjEZngk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ROb7MFdIyv0cqyc2xrJjAiOFh+vqk21cGr2MR97GOhIA2WfcJ1k3v84/rCsweH66u
	 YPv238pN8Yyyid0lS7TH7rTZkuV3hePFHT6SHryCF+udbUGi0S4gavyJS3wKAj6DtZ
	 ThgJi7TUVx+YSka8em9q0P1Hi0DqEuHjOmbP/Micn9NOmURVjigMhtf5BLfB0lCaeG
	 Y5+3XkErWA0BRloIe5fuq7IWG1jJ4awNIX4aTxicC90JikjdgpyQGfMJRemwmYJggS
	 t+Q94MCS8+m092tdgXfPEmX80dwLbdoxKA6iaxWF/olxHKr5ITdLRt3GvL7cQnzjBQ
	 XNRrC5se2w9qw==
Date: Tue, 18 Oct 2022 12:54:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Leo Yan <leo.yan@linaro.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen Develop <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, 
    Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>, 
    jgross@suse.com, oleksandr_tyshchenko@epam.com, boris.ostrovsky@oracle.com, 
    wei.liu@kernel.org, paul@xen.org
Subject: Re: Issue: Networking performance in Xen VM on Arm64
In-Reply-To: <Y05w36OAVyDJwCCr@leoy-yangtze.lan>
Message-ID: <alpine.DEB.2.22.394.2210181253260.4587@ubuntu-linux-20-04-desktop>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop> <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop> <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop> <Y05w36OAVyDJwCCr@leoy-yangtze.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Oct 2022, Leo Yan wrote:
> On Mon, Oct 17, 2022 at 04:50:05PM -0700, Stefano Stabellini wrote:
> 
> [...]
> 
> > > Which means it takes 543us to let Dom0 to receive the notification.
> > > You could see DomU runs in CPU3 and Dom0 runs on CPU13, there should
> > > not have contention for CPU resources.  Seems to me, it's likely Xen
> > > hypervisor takes long time to deliver the interrupt, note, it's not
> > > take so long time for every skb transferring, sometimes the time for
> > > response a notification is short (about ~10us).
> > 
> > Good find. I think this is worth investigating further. Do you have
> > vwfi=native in your Xen command line as well?
> 
> Yes, I have added "sched=null" and "vwfi=native" into Xen options:
> 
> options=noreboot dom0_mem=4096M bootscrub=0 iommu=on loglvl=error guest_loglvl=error sched=null vwfi=native
> 
> > After that, I would add printk also in Xen with the timestamp. The event
> > channel notification code path is the following:
> > 
> > # domU side
> > xen/arch/arm/vgic-v2.c:vgic_v2_to_sgi
> > xen/arch/arm/vgic.c:vgic_to_sgi
> > xen/arch/arm/vgic.c:vgic_inject_irq
> > xen/arch/arm/vgic.c:vcpu_kick
> > xen/arch/arm/gic-v2.c:gicv2_send_SGI
> > 
> > # dom0 side
> > xen/arch/arm/gic.c:do_sgi
> > xen/arch/arm/traps.c:leave_hypervisor_to_guest
> > 
> > It would be good to understand why sometimes it takes ~10us and some
> > other times it takes ~540us
> 
> Thanks a lot for detailed info.
> 
> Just note, in my platform DomU enables GICv3 driver rather than GICv2.
> This would be a bit different in the Xen code.  But it should be easy
> for me to map to vgic-v3 files.
> 
> I have a question for how to trace Xen system.  Outputting chars to UART
> is time costy (usually it's millisecond level), it is not friendly to
> use console for debugging performance issue.  I searched a bit, either
> "xl dmesg" or xentrace can be used for capturing trace logs, one thing
> I am not certain is if we can save Xen logs only into log buffer and
> doesn't output to UART, so that afterwards we can use "xl dmesg" to
> capture the logs.  Could anyone confirm for this is correct usage with
> "xl dmesg" or I should use xentrace for this case?

I am not super familiar about this. But if you take away the console
entirely from Xen and give it to dom0 only (no dtuart command line
option to Xen), you should get the behavior you described:
- no console output because Xen has no console
- xl dmesg should still work

