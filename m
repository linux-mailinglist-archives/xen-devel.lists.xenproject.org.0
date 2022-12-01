Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7040E63F14D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 14:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450693.708085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jMf-0002Zz-Pj; Thu, 01 Dec 2022 13:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450693.708085; Thu, 01 Dec 2022 13:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0jMf-0002Xw-MC; Thu, 01 Dec 2022 13:12:33 +0000
Received: by outflank-mailman (input) for mailman id 450693;
 Thu, 01 Dec 2022 13:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ED7C=37=chromium.org=ribalda@srs-se1.protection.inumbo.net>)
 id 1p0jMe-0002Xb-3i
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:12:32 +0000
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [2607:f8b0:4864:20::d36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf3bac79-7179-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 14:12:31 +0100 (CET)
Received: by mail-io1-xd36.google.com with SMTP id i80so1012842ioa.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 05:12:30 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179]) by smtp.gmail.com with ESMTPSA id
 h10-20020a92d84a000000b003001f822301sm1478303ilq.81.2022.12.01.05.12.28
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 05:12:28 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id h15so703743ilh.12
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 05:12:28 -0800 (PST)
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
X-Inumbo-ID: cf3bac79-7179-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l7Y2FkbIVTKFtl+HxieOmsxNGhmLoxEmtYJ88v/cdgw=;
        b=Sxbi0cvSliG9a00Ry4hRL3209ix85X2kIBcjhC5k1nEv5BOdHhFeI7Ixds0JdL6dZ6
         7K72xHH++bcFQ6L4GeTVOnVIGmY3VxFsiE1PwDgAbEFd1Qg/8JsKJA/ZZABySB5cfN5I
         rXB/aOLFPlnEkVyBmH4j/VAB0BH/L38J6evN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7Y2FkbIVTKFtl+HxieOmsxNGhmLoxEmtYJ88v/cdgw=;
        b=Z07fQxd6cWNLOwYZ0bwWkVpQ1WFrloeWlchlYnpnoUY3JDKrK+OorXr83pNBwkdqIs
         UyWECCL0Dor9E0g+kWAlDn258rEweQAvCjBC9JAMtNjtRCuMF4BGgJdpyv8OnT1dW3ZO
         LkqsarNJYLHrp8nj/LlMCKWKM3zJdrySlvkKP6/kIjpH2uZhpiIpFh8fD9Fk0JAWpSvU
         HD5fXMFKagr83/t2Cx09ALW2d6ggsUQCVq85uGnvQnfrtLAKgopzvFd7d3XZUOf/lx3c
         HTLvniXr/vm4Y/M1jyKc8BAZ0p543mUYdajXmcI47dG/GU3tvKwv9TC4z96IZWw6L/xi
         X8SQ==
X-Gm-Message-State: ANoB5pkzBEVVuRpK2a1sZQX2K8zly/E1GMT6iChaWrmcpepg9pSBGyQ7
	+IgJohtTHNxVkYkK56rzr22Inop5+iYtbXli
X-Google-Smtp-Source: AA0mqf7BNIc9WXuRXakkvX2p63R5X7uDiTCt002T6WUPEynCEwf4RSPXT6us25oGfLvc2ikBtAFhjg==
X-Received: by 2002:a02:6d6e:0:b0:389:e1db:8b34 with SMTP id e46-20020a026d6e000000b00389e1db8b34mr9411901jaf.45.1669900349332;
        Thu, 01 Dec 2022 05:12:29 -0800 (PST)
X-Received: by 2002:a05:6e02:66d:b0:303:1196:96c7 with SMTP id
 l13-20020a056e02066d00b00303119696c7mr9848943ilt.133.1669899845427; Thu, 01
 Dec 2022 05:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org> <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
In-Reply-To: <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 1 Dec 2022 14:03:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
Message-ID: <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] ASoC: SOF: Fix deadlock when shutdown a frozen userspace
To: Oliver Neukum <oneukum@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Mark Brown <broonie@kernel.org>, 
	Chromeos Kdump <chromeos-kdump@google.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Len Brown <len.brown@intel.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Eric Biederman <ebiederm@xmission.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Joel Fernandes <joel@joelfernandes.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Ingo Molnar <mingo@redhat.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Dexuan Cui <decui@microsoft.com>, Takashi Iwai <tiwai@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	kexec@lists.infradead.org, alsa-devel@alsa-project.org, 
	stable@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Oliver

Thanks for your review

On Thu, 1 Dec 2022 at 13:29, Oliver Neukum <oneukum@suse.com> wrote:
>
> On 01.12.22 12:08, Ricardo Ribalda wrote:
> > If we are shutting down due to kexec and the userspace is frozen, the
> > system will stall forever waiting for userspace to complete.
> >
> > Do not wait for the clients to complete in that case.
>
> Hi,
>
> I am afraid I have to state that this approach is bad in every case,
> not just this corner case. It basically means that user space can stall
> the kernel for an arbitrary amount of time. And we cannot have that.
>
>         Regards
>                 Oliver

This patchset does not modify this behaviour. It simply fixes the
stall for kexec().

The  patch that introduced the stall:
83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
in .shutdown")

was sent as a generalised version of:
https://github.com/thesofproject/linux/pull/3388

AFAIK, we would need a similar patch for every single board.... which
I am not sure it is doable in a reasonable timeframe.

On the meantime this seems like a decent compromises. Yes, a
miss-behaving userspace can still stall during suspend, but that was
not introduced in this patch.

Regards!
>


-- 
Ricardo Ribalda

