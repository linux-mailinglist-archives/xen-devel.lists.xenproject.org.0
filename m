Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3023A6B7FF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923772.1327181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYzg-0004KX-Nt; Fri, 21 Mar 2025 09:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923772.1327181; Fri, 21 Mar 2025 09:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYzg-0004IU-LK; Fri, 21 Mar 2025 09:48:48 +0000
Received: by outflank-mailman (input) for mailman id 923772;
 Fri, 21 Mar 2025 09:48:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9U11=WI=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tvYze-0004IO-Vr
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:48:47 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae78ebba-0639-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:48:45 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5499e3ec54dso2046663e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 02:48:45 -0700 (PDT)
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
X-Inumbo-ID: ae78ebba-0639-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742550525; x=1743155325; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Npr+K3G5sCP0RnkM0bB91kczB72IKzW7A+bNoeVZjRY=;
        b=AgNlkhQ9G3CbbaEPzK71QkBM6IJEdzh/+/t0luB7bcWlTlN44mWCX3P61cfAWsYzPf
         3nCylws3PqQldUtC6e5yojHXlvzWvuvvQKrjlgfD4ICSTdvs4+k1t4iblZA02Cn2JBoe
         9bSQg5XC+wApce+8NGi3HthHeKSCM5RiHBV2mdaencxU9TwuDo6LyOcxMvFJqLdiTaxw
         D3FctDKFJa5pN03un2oMu6hveIbklXoZQ42J4QHNIPRBvZ5Vurs6vU1NCvIhObgNNB8H
         ccJtJ8bKTD2fiX2q/76Rfx5RepsUG6m/Fjl/Xc0PJ/eKu+EdsgBQvmaiXSRVA1kZOr07
         2hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742550525; x=1743155325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Npr+K3G5sCP0RnkM0bB91kczB72IKzW7A+bNoeVZjRY=;
        b=bOexvyDOeTG+I1lLi3ZLqrmgPuXsSbQeBfR5rndaA7rhoWdFt1XxSvL+FGpoH8t1mI
         o9ixUGEOgK7li1uAGUTI9XOc0aaig0bbNqUPcmhSC65b2Jf97ji6CCJeG7X6ih8bZb7i
         eq5I/TROj+J6ersSKaIn7O9twE9KtYBBUGT0hSLTGp/EPsSD0gXTKkv2IE8YGOYEr9u2
         qsboh8rw1Dp3o4m88NQK8PeBL9mrBuYUMkLmgIqyVpKsLo2GVCvRk/ReQbsOUm6JMbcX
         ED2MIFzjBUigPCMkSFmHi4IzjRu4oacqXH5gtIy7QuvPwr81bPr/g+UZzjMUqZXrh3Pa
         LlEA==
X-Forwarded-Encrypted: i=1; AJvYcCVgEL8Dq122fN07v9BwRaJq2cC6AYnbvLR9JvFD/w/wT3L4ElHT4uXwg7TroyE+mIqawvgdlTPtSBY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEMFSj2AfeB356DcSTmQHx9kAfXKZ/nTAi8LVDCDbTWHvxUAhE
	WBTP9qodn/a2LTRYXxVfID3SX6WKQp7v5PaS4A6WhWw2zhJSRmHMYi3QqmT4wSobFN4UBD2oLv1
	rQ/mtrKFa8y9U9SuIc5ZKFafv0rk=
X-Gm-Gg: ASbGncvfje/mik312v61G1i9wsLCBzd6zUxfH7aaA2tZWz9se2TSxrrVXh9Tr/QcASp
	+F1bg+GxmWbuL41vOGyWEBn5DhtGv4CajiaDYzdEzAXM1FFHoTmsDZD0k0tIoC9iILQeMc6t9pB
	x1xpeLM7ezlwlbG/scBajSWrSM
X-Google-Smtp-Source: AGHT+IEc51kZC242gudtyHt46nCY/IpKl6F4pLHLDgOjGgHIjuv8HT+jaMG+JuJePr3fYjmY9JGUDLCG0mA3JV2dw3g=
X-Received: by 2002:a05:6512:31d1:b0:549:887b:253f with SMTP id
 2adb3069b0e04-54ad64f9118mr866467e87.51.1742550524657; Fri, 21 Mar 2025
 02:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <e6cc20510acf49d90c08007a2308ef3dcaccc368.1741164138.git.xakep.amatop@gmail.com>
 <30681b52-0d81-47d9-959f-90238863b88e@xen.org> <0976c68e-f847-43ba-bb0c-53e2627e1d05@suse.com>
In-Reply-To: <0976c68e-f847-43ba-bb0c-53e2627e1d05@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 21 Mar 2025 11:48:32 +0200
X-Gm-Features: AQ5f1JpE-ZHYoh_-Ku4cTLz1WsA6GxqU628VgTfDYYJjM_HdDzvVg4HHZ8SWXWU
Message-ID: <CAGeoDV-MceE4c8vDJ=cr_OH3x=pTUUgLr0HOqkDNh-_6rT5P+w@mail.gmail.com>
Subject: Re: [PATCH 04/16] xen/cpu: prevent disable_nonboot_cpus crash on ARM64
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Mykola Kvach <mykola_kvach@epam.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 5:43=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 11.03.2025 21:47, Julien Grall wrote:
> > Hi Mykola,
> >
> > On 05/03/2025 09:11, Mykola Kvach wrote:
> >> If we call disable_nonboot_cpus on ARM64 with system_state set
> >> to SYS_STATE_suspend, the following assertion will be triggered:
> >>
> >> ```
> >> (XEN) [   25.582712] Disabling non-boot CPUs ...
> >> (XEN) [   25.587032] Assertion '!in_irq() && (local_irq_is_enabled() |=
| num_online_cpus() <=3D 1)' failed at common/xmalloc_tlsf.c:714
> >> [...]
> >> (XEN) [   25.975069] Xen call trace:
> >> (XEN) [   25.978353]    [<00000a000022e098>] xfree+0x130/0x1a4 (PC)
> >> (XEN) [   25.984314]    [<00000a000022e08c>] xfree+0x124/0x1a4 (LR)
> >> (XEN) [   25.990276]    [<00000a00002747d4>] release_irq+0xe4/0xe8
> >> (XEN) [   25.996152]    [<00000a0000278588>] time.c#cpu_time_callback+=
0x44/0x60
> >> (XEN) [   26.003150]    [<00000a000021d678>] notifier_call_chain+0x7c/=
0xa0
> >> (XEN) [   26.009717]    [<00000a00002018e0>] cpu.c#cpu_notifier_call_c=
hain+0x24/0x48
> >> (XEN) [   26.017148]    [<00000a000020192c>] cpu.c#_take_cpu_down+0x28=
/0x34
> >> (XEN) [   26.023801]    [<00000a0000201944>] cpu.c#take_cpu_down+0xc/0=
x18
> >> (XEN) [   26.030281]    [<00000a0000225c5c>] stop_machine.c#stopmachin=
e_action+0xbc/0xe4
> >> (XEN) [   26.038057]    [<00000a00002264bc>] tasklet.c#do_tasklet_work=
+0xb8/0x100
> >> (XEN) [   26.045229]    [<00000a00002268a4>] do_tasklet+0x68/0xb0
> >> (XEN) [   26.051018]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0=
x194
> >> (XEN) [   26.057585]    [<00000a0000277e30>] start_secondary+0x21c/0x2=
20
> >> (XEN) [   26.063978]    [<00000a0000361258>] 00000a0000361258
> >> ```
> >>
> >> This happens because before invoking take_cpu_down via the stop_machin=
e_run
> >> function on the target CPU, stop_machine_run requests
> >> the STOPMACHINE_DISABLE_IRQ state on that CPU. Releasing memory in
> >> the release_irq function then triggers the assertion:
> >>
> >> /*
> >>   * Heap allocations may need TLB flushes which may require IRQs to be
> >>   * enabled (except when only 1 PCPU is online).
> >>   */
> >> #define ASSERT_ALLOC_CONTEXT()
> >>
> >> This patch introduces a new tasklet to perform the CPU_DYING call chai=
n for
> >> a particular CPU. However, we cannot call take_cpu_down from the taskl=
et
> >> because the __cpu_disable function disables local IRQs, causing the sy=
stem
> >> to crash inside spin_lock_irq, which is called after the tasklet funct=
ion
> >> invocation inside do_tasklet_work:
> >>
> >> void _spin_lock_irq(spinlock_t *lock)
> >> {
> >>      ASSERT(local_irq_is_enabled());
> >>
> >> To resolve this, take_cpu_down is split into two parts. The first part=
 triggers
> >> the CPU_DYING call chain, while the second part, __cpu_disable, is inv=
oked from
> >> stop_machine_run.
> >
> > Rather than modifying common code, have you considered allocating from
> > the IRQ action from the percpu area? This would also reduce the number
> > of possible failure when bringup up a pCPU.
>
> I'd go further and question whether release_irq() really wants calling wh=
en
> suspending. At least on x86, a requirement is that upon resume the same
> number and kinds of CPUs will come back up. Hence the system will look th=
e
> same, including all the interrupts that are in use. Plus resume will be
> faster if things are left set up during suspend.

I tried that approach and encountered another issue.
 - in the case of the hardware domain, it triggered a domain watchdog;
 - in the case of domU, it caused a crash inside the Linux kernel due
to an RCU stall.

Both scenarios suggest that something is wrong with IRQ delivery to the gue=
st.
It might be necessary to revisit the entire logic related to GIC
resume/suspend instead.

>
> Jan

Best regards,
Mykola

