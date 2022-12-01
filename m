Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D708D63F1BC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 14:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450715.708121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ji7-0006v2-8d; Thu, 01 Dec 2022 13:34:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450715.708121; Thu, 01 Dec 2022 13:34:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0ji7-0006rv-5U; Thu, 01 Dec 2022 13:34:43 +0000
Received: by outflank-mailman (input) for mailman id 450715;
 Thu, 01 Dec 2022 13:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ED7C=37=chromium.org=ribalda@srs-se1.protection.inumbo.net>)
 id 1p0ji6-0006rW-5T
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 13:34:42 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7791879-717c-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 14:34:40 +0100 (CET)
Received: by mail-il1-x135.google.com with SMTP id z9so732227ilu.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 05:34:40 -0800 (PST)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177]) by smtp.gmail.com with ESMTPSA id
 q2-20020a02a982000000b003781331d909sm1664555jam.9.2022.12.01.05.34.38
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 05:34:38 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id z9so732210ilu.10
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 05:34:38 -0800 (PST)
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
X-Inumbo-ID: e7791879-717c-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tKguKo1XmUP31FlNvdaT70p0o/lwuxyZc7lK6ytX1QU=;
        b=exIoeOCrlPb+Uw2FGLRsALkrLYWj9cDaTvcr81Evjsi5DXIR/uPZJTWsXlu/PiLLI3
         HTBr5t4pzsWnn6M0lC4H5pNT0n3aLXEpcSRixu/mfsu8XeXoSArYBYlbqRz6mRys5h3T
         IyXf+jqyVq8u6L+O/LqO4biBjWXlb+7RKXSc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKguKo1XmUP31FlNvdaT70p0o/lwuxyZc7lK6ytX1QU=;
        b=zwhfKWyKT214d7rF4v1HLbKqv+wMmP1zM4QnwWCuzGBemgD61wDWBV4YOe9R7oBmGN
         6nBhAzu4jnibtY0EMc5j5KOoT2m4OtkoSJrZWv7nJNvo3y61n7JJpjkkj0K+vTx3rc6v
         0uiMMPNl7OqR0D+jn2rW9I4LALoicULKSkd75odugRVO3GqY6Gh+pu0+7TpqiA0HPGb9
         LwIEBUglAY5EDmgWTaqczTYPCDMJFGDCAkVUQo0DyKWaBGCSmSZ99FDgAK7t/pGR3G5L
         uUR8+LjglA2tapY8xZcrXUrPU7sSoz8nkN2bT1Gs0czcyKLp5pV881G7jBeHvMAyc52Z
         DeVA==
X-Gm-Message-State: ANoB5pkimAFWaBaSaYk80yt4iCbzvq8WEJh5KbUDMa4iPIe7AcOb4pV7
	GfdNrIl9QbSlO+GQn7P8BTJ3iQeE9VbNTFn0
X-Google-Smtp-Source: AA0mqf7vsbjjaPbxzMYnimQdjSJEySRIme2YGxKQspq815fWPeMzeEFl/36YYFO4XLHUfQaaHIpizw==
X-Received: by 2002:a05:6e02:521:b0:302:6b23:79a2 with SMTP id h1-20020a056e02052100b003026b2379a2mr21714392ils.138.1669901679011;
        Thu, 01 Dec 2022 05:34:39 -0800 (PST)
X-Received: by 2002:a92:ca89:0:b0:302:385e:eeb4 with SMTP id
 t9-20020a92ca89000000b00302385eeeb4mr24829482ilo.66.1669901667796; Thu, 01
 Dec 2022 05:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
 <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org> <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com>
 <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com> <d3730d1d-6f92-700a-06c4-0e0a35e270b0@suse.com>
In-Reply-To: <d3730d1d-6f92-700a-06c4-0e0a35e270b0@suse.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 1 Dec 2022 14:34:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
Message-ID: <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
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

On Thu, 1 Dec 2022 at 14:22, 'Oliver Neukum' via Chromeos Kdump
<chromeos-kdump@google.com> wrote:
>
> On 01.12.22 14:03, Ricardo Ribalda wrote:
>
> Hi,
>
> > This patchset does not modify this behaviour. It simply fixes the
> > stall for kexec().
> >
> > The  patch that introduced the stall:
> > 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
> > in .shutdown")
>
> That patch is problematic. I would go as far as saying that
> it needs to be reverted.
>

It fixes a real issue. We have not had any complaints until we tried
to kexec in the platform.
I wont recommend reverting it until we have an alternative implementation.

kexec is far less common than suspend/reboot.

> > was sent as a generalised version of:
> > https://github.com/thesofproject/linux/pull/3388
> >
> > AFAIK, we would need a similar patch for every single board.... which
> > I am not sure it is doable in a reasonable timeframe.
> >
> > On the meantime this seems like a decent compromises. Yes, a
> > miss-behaving userspace can still stall during suspend, but that was
> > not introduced in this patch.
>
> Well, I mean if you know what wrong then I'd say at least return to
> a sanely broken state.
>
> The whole approach is wrong. You need to be able to deal with user
> space talking to removed devices by returning an error and keeping
> the resources association with the open file allocated until
> user space calls close()

In general, the whole shutdown is broken for all the subsystems ;).
It is a complicated issue. Users handling fds, devices with DMAs in
the middle of an operation, dma fences....

Unfortunately I am not that familiar with the sound subsystem to make
a proper patch for this.

>
>         Regards
>                 Oliver
>
>
>
> --
> You received this message because you are subscribed to the Google Groups "Chromeos Kdump" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to chromeos-kdump+unsubscribe@google.com.
> To view this discussion on the web, visit https://groups.google.com/a/google.com/d/msgid/chromeos-kdump/d3730d1d-6f92-700a-06c4-0e0a35e270b0%40suse.com.



-- 
Ricardo Ribalda

