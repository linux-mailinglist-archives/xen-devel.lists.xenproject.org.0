Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3664607546
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 12:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427583.676813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpVi-00011p-9b; Fri, 21 Oct 2022 10:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427583.676813; Fri, 21 Oct 2022 10:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpVi-0000zR-6m; Fri, 21 Oct 2022 10:44:18 +0000
Received: by outflank-mailman (input) for mailman id 427583;
 Fri, 21 Oct 2022 10:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2wL=2W=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1olpVg-0000Pz-DU
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 10:44:16 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a42b5c8-512d-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 12:43:15 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 f8-20020a17090a664800b00212464cd49fso2470544pjm.4
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 03:44:14 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-199.hinet-ip.hinet.net.
 [211.75.219.199]) by smtp.gmail.com with ESMTPSA id
 m2-20020a1709026bc200b0017fe9b038fdsm14399292plt.14.2022.10.21.03.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 03:44:11 -0700 (PDT)
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
X-Inumbo-ID: 2a42b5c8-512d-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwaPy+d6LI3STQKC7/Jh5UQQU+g4aL+S/nlqVl1s8uU=;
        b=NDZeKF4LQxZ2fpVGg1ulP3boB/V5ZWXAn7zMLdE5zD6ljc6uE1AvGYyCvj/ETO6gKD
         mg1Qabwszg7vboaVarzAlrlZC0i7Jf6lsT+XlijLfAs2/FeVlS6IRlGjfZamgdyvcZWl
         yzYEWQjXS3L43tYlDCRrEefLoUV5FwsJffoAnzIhl/EGuZJfZNE6NavvMUJcEVk+UlZJ
         20325QiyFIiIjxfNgetarY7xjbwhozYtoY9K39ze07Bf+7Mmk5B4vmjkqEiIN/T5+pgZ
         /l45B7JXm7i6yPCodFexyO62PXWUvjh2hqV2V6PCEQNVunQHly9St2j+qDL0EXFOFWFq
         NzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwaPy+d6LI3STQKC7/Jh5UQQU+g4aL+S/nlqVl1s8uU=;
        b=o+1T4yNdaosYWjGsUFGmc1i8g9bVNn7rckB8ZLHaAX3Qs829fvSDJswyIYpn1ali3A
         IwbXkiEAsHc7S8cHcLS+Hv6Yk7KAjk/0WcF6Dj+qxPcQImRNJ8AenEWHbWSA5fzI4+ig
         Ag7Yc+xm3HHyUayUb8s+LdESCqdzx74U1t5okbxbYMTtQ9te9D8xc/3j0GrZZhVVSW7f
         MqXfzPawiWrOPonNqBWupT8nZ/Xgk4mD1XAH06eICsirqV4GwOpFwaZ8KSefB11RGj6Q
         6cX67e1vh1HlfD0MrjvPjomqEzx58nnCOORJZaLxQiRxPuvL7e664ZfTZcy/OfCr2eZd
         RqTw==
X-Gm-Message-State: ACrzQf38QFtA7cizpojpgzWpvmBf9ihAANJnj6nmSYwo1QAwCvYSl0vr
	tnPWOr6hBja25fFS2d8nmvzKjA==
X-Google-Smtp-Source: AMsMyM4V5GmxNTnHDNQrQIOVowh4fLCtBJlHOjVmTAA7uegaHFff/FAmiMFfcLgR5yxOGcjFVxNUUw==
X-Received: by 2002:a17:90a:990d:b0:212:d772:1ab4 with SMTP id b13-20020a17090a990d00b00212d7721ab4mr665069pjp.184.1666349053168;
        Fri, 21 Oct 2022 03:44:13 -0700 (PDT)
Date: Fri, 21 Oct 2022 18:44:05 +0800
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
Message-ID: <Y1J39UsPlM8htxFx@leoy-huanghe.lan>
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

Hi Stefano and all,

On Mon, Oct 17, 2022 at 04:50:05PM -0700, Stefano Stabellini wrote:

[...]

> > We can see DomU sends notification with timestamp (raw counter) is
> > 4989078592 and Dom0 receives the interrupt with timestamp 4989092169.
> > Since Dom0 and DomU use the same time counter and the counter
> > frequency is 25MHz, so we can get the delta value (in macroseconds):
> > 
> >     (4989092169 - 4989078592) / 25000000 * 1000 * 1000
> >   = 543us
> > 
> > Which means it takes 543us to let Dom0 to receive the notification.
> > You could see DomU runs in CPU3 and Dom0 runs on CPU13, there should
> > not have contention for CPU resources.  Seems to me, it's likely Xen
> > hypervisor takes long time to deliver the interrupt, note, it's not
> > take so long time for every skb transferring, sometimes the time for
> > response a notification is short (about ~10us).
> 
> Good find. I think this is worth investigating further. Do you have
> vwfi=native in your Xen command line as well?
> 
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

Some updates for why it takes several hundreds us for Xen backend driver
to respond interrupt.  The short answer is the vcpu running Xen backend
driver needs to switch context, even I have set options "sched=null
vwfi=native" in Xen command line.

So please see below detailed logs for how the things happen.

Let's take the timestamp 3842008681 as the start point, it's the time
for Xen backend driver sending out notification (xennet_notify_tx_irq);
at the timestamp 3842008885 the Xen hypervisor injects the interrupt
(it's about ~8us duration from the start point).

And then at the timestamp 3842008935 it invokes vcpu_kick() to kick the
virtual CPU for running Xen forend driver, you could see
VCPU_PROCESSOR is 11 and VCPU_ID is 9 for dom0, the duration is
10.16us from the start point.

The key point is at this point the vcpu's is_running is 0, this is
different from the case without long latency which vcpu's is_running
is 1.  IIUC, Xen hypervisor needs to take time to restore the vcpu's
context, thus we can see the virtual CPU 9 in Dom0 starts to run at
the timestamp 3842016505.

3842008548              pub-310   [001]    67.352980: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842008548
3842008652              pub-310   [001]    67.352984: bprint:               xennet_tx_setup_grant: id=52 ref=820 offset=2 len=1514 TSC: 3842008652
3842008681              pub-310   [001]    67.352985: bprint:               xennet_start_xmit: xennet_notify_tx_irq: TSC: 3842008681
3842008689 (XEN) leave_hypervisor_to_guest: CPU_ID: 0 TSC: 3842008689
3842008766 (XEN) EVTCHNOP_send: CPU_ID: 2 TSC: 3842008766
3842008885 (XEN) vgic_inject_irq: CPU_ID: 2 TSC: 3842008885
3842008929 (XEN) leave_hypervisor_to_guest: CPU_ID: 14 TSC: 3842008929
3842008935 (XEN) vcpu_kick: VCPU_PROCESSOR: 11 VCPU_ID: 9 is_running 0 TSC: 3842008935
3842009049 (XEN) leave_hypervisor_to_guest: CPU_ID: 2 TSC: 3842009049
3842009322              pub-310   [001]    67.353011: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842009322
3842009374              pub-310   [001]    67.353013: bprint:               xennet_tx_setup_grant: id=12 ref=780 offset=2050 len=1514 TSC: 3842009374
3842009584              pub-310   [001]    67.353021: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842009584
3842009625 (XEN) leave_hypervisor_to_guest: CPU_ID: 15 TSC: 3842009625
3842009633              pub-310   [001]    67.353023: bprint:               xennet_tx_setup_grant: id=83 ref=851 offset=2 len=1514 TSC: 3842009633
3842009853              pub-310   [001]    67.353032: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842009853
3842009899              pub-310   [001]    67.353034: bprint:               xennet_tx_setup_grant: id=5 ref=773 offset=2050 len=1514 TSC: 3842009899
3842010080              pub-310   [001]    67.353041: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010080
3842010121              pub-310   [001]    67.353043: bprint:               xennet_tx_setup_grant: id=85 ref=853 offset=2 len=1514 TSC: 3842010121
3842010316              pub-310   [001]    67.353050: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010316
3842010359              pub-310   [001]    67.353052: bprint:               xennet_tx_setup_grant: id=9 ref=777 offset=2050 len=1514 TSC: 3842010359
3842010553              pub-310   [001]    67.353060: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010553
3842010599              pub-310   [001]    67.353062: bprint:               xennet_tx_setup_grant: id=35 ref=803 offset=2 len=1514 TSC: 3842010599
3842010792              pub-310   [001]    67.353069: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842010792
3842010838              pub-310   [001]    67.353071: bprint:               xennet_tx_setup_grant: id=17 ref=785 offset=2 len=1514 TSC: 3842010838
3842011032              pub-310   [001]    67.353079: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842011032
3842011072              pub-310   [001]    67.353081: bprint:               xennet_tx_setup_grant: id=18 ref=786 offset=2 len=1514 TSC: 3842011072
3842011124 (XEN) leave_hypervisor_to_guest: CPU_ID: 12 TSC: 3842011124
3842011265              pub-310   [001]    67.353088: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842011265
3842011309              pub-310   [001]    67.353090: bprint:               xennet_tx_setup_grant: id=86 ref=854 offset=3074 len=606 TSC: 3842011309
3842012807 (XEN) leave_hypervisor_to_guest: CPU_ID: 6 TSC: 3842012807
3842013038 (XEN) leave_hypervisor_to_guest: CPU_ID: 10 TSC: 3842013038
3842013568 (XEN) vgic_inject_irq: CPU_ID: 23 TSC: 3842013568
3842013639 (XEN) vcpu_kick: VCPU_PROCESSOR: 23 VCPU_ID: 10 is_running 1 TSC: 3842013639
3842013769 (XEN) leave_hypervisor_to_guest: CPU_ID: 4 TSC: 3842013769
3842013955 (XEN) leave_hypervisor_to_guest: CPU_ID: 8 TSC: 3842013955
3842014327 (XEN) leave_hypervisor_to_guest: CPU_ID: 5 TSC: 3842014327
3842014381              pub-310   [001]    67.353213: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842014381
3842014433              pub-310   [001]    67.353215: bprint:               xennet_tx_setup_grant: id=89 ref=857 offset=2050 len=1514 TSC: 3842014433
3842014621              pub-310   [001]    67.353223: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842014621
3842014663              pub-310   [001]    67.353224: bprint:               xennet_tx_setup_grant: id=38 ref=806 offset=2 len=1514 TSC: 3842014663
3842014852              pub-310   [001]    67.353232: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 3842014852
3842014909              pub-310   [001]    67.353234: bprint:               xennet_tx_setup_grant: id=4 ref=772 offset=2 len=1422 TSC: 3842014909
3842015153 (XEN) leave_hypervisor_to_guest: CPU_ID: 1 TSC: 3842015153
3842015345 (XEN) leave_hypervisor_to_guest: CPU_ID: 3 TSC: 3842015345
3842015823 (XEN) leave_hypervisor_to_guest: CPU_ID: 13 TSC: 3842015823
3842016505           <idle>-0     [009]    95.098859: bprint:               xenvif_tx_interrupt: xenvif_tx_interrupt: TSC: 3842016505
3842016635           <idle>-0     [009]    95.098863: bprint:               xenvif_tx_build_gops.constprop.0: id=52 ref=820 offset=2 len=1514 TSC: 3842016635
3842016648 (XEN) leave_hypervisor_to_guest: CPU_ID: 9 TSC: 3842016648
3842016671           <idle>-0     [009]    95.098865: bprint:               xenvif_tx_build_gops.constprop.0: id=12 ref=780 offset=2050 len=1514 TSC: 3842016671
3842016700           <idle>-0     [009]    95.098866: bprint:               xenvif_tx_build_gops.constprop.0: id=83 ref=851 offset=2 len=1514 TSC: 3842016700
3842016725           <idle>-0     [009]    95.098867: bprint:               xenvif_tx_build_gops.constprop.0: id=5 ref=773 offset=2050 len=1514 TSC: 3842016725

I did another two experiments.

One experiment is I tried to append option "dom0_max_vcpus=16" into Xen
command line, the purpose is I want to allocate 16 virtual CPUs for dom0
and 4 virtual CPUs for domU, and my system has 32 physical CPUs, in
theory the physical CPUs are sufficient for dom0 and domU, but I
didn't see any performance improvement with option
"dom0_max_vcpus=16".

Another experiment is to append option "dom0_vcpus_pin" in Xen command
line, this can allow the virtual CPU pins on physical CPU so can avoid
context switching.  With this option, I can see the throughput is
improved from 128.26 Mbits/s to 180.3 Mbits/s.  But this result is far
from the ideal throughput (800+Mbits/s).

One thing I need to explore is to measure the duration for copying
data via grant table (based on the log we can see xennet driver setup
grant table and then xenvif driver fetches data from grant table).  I
will compare the duration for two directions (from dom0 to domU and
from domU to dom0).  This part might impact the performance heavily.

Thanks,
Leo

