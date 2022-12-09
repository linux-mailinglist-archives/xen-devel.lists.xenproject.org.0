Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01581648201
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 12:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457854.715821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3c1J-0002s6-Ne; Fri, 09 Dec 2022 11:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457854.715821; Fri, 09 Dec 2022 11:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3c1J-0002qL-Kq; Fri, 09 Dec 2022 11:58:25 +0000
Received: by outflank-mailman (input) for mailman id 457854;
 Fri, 09 Dec 2022 11:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8bpP=4H=linux.intel.com=kai.vehmanen@srs-se1.protection.inumbo.net>)
 id 1p3bx9-0002jv-0V
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 11:54:07 +0000
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b69e80a-77b8-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 12:54:03 +0100 (CET)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 03:53:59 -0800
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 03:53:50 -0800
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
X-Inumbo-ID: 2b69e80a-77b8-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670586843; x=1702122843;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=i6l99AsOk7Ek/fC/JJlzKRTZl8kQmivMJCaJu9pD6WY=;
  b=VtvPpiRiNwMurUMRXREj+rjJOwRnzUg0Br7x8Lq1pHGIn8G0zydaorkk
   C4D7q40P+45a9JhZiNTS3KXWcT3DwK2peTjA6kJBijtNshr4rzS9mvw/S
   tV5vbfDDrYLhZ03oRjVMVdbDbkbaE4mfGlZM2meJlr/K+CDmkix7jh/mg
   p3okVsW50oZZnfdmfomg+3hVtNTCwQXmFglpcPM85jh5UD0QbrY6Sasqs
   H1z+Y5TVU8vRnOlwpmIImv1bW9pRtVxZKYZtNEH4e3HbPFHDPwxAPE7bp
   RYA/cirV2dJ6RZFmjFCF5Pyehi1ahIfwq/fZE0Xi+yTpfa4vo+zYxZsm6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="305085940"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="305085940"
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="736191278"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="736191278"
Date: Fri, 9 Dec 2022 13:53:31 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Ricardo Ribalda <ribalda@chromium.org>
cc: Oliver Neukum <oneukum@suse.com>, Juergen Gross <jgross@suse.com>, 
    Mark Brown <broonie@kernel.org>, 
    Chromeos Kdump <chromeos-kdump@google.com>, 
    Daniel Baluta <daniel.baluta@nxp.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Len Brown <len.brown@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
    Eric Biederman <ebiederm@xmission.com>, 
    Dave Hansen <dave.hansen@linux.intel.com>, 
    Jaroslav Kysela <perex@perex.cz>, Joel Fernandes <joel@joelfernandes.org>, 
    Liam Girdwood <lgirdwood@gmail.com>, 
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
    Pavel Machek <pavel@ucw.cz>, 
    Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
    Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
    Steven Rostedt <rostedt@goodmis.org>, 
    "K. Y. Srinivasan" <kys@microsoft.com>, Ingo Molnar <mingo@redhat.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, Dexuan Cui <decui@microsoft.com>, 
    Takashi Iwai <tiwai@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, 
    Bard Liao <yung-chuan.liao@linux.intel.com>, 
    Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
    x86@kernel.org, kexec@lists.infradead.org, 
    Alsa-devel <alsa-devel@alsa-project.org>, stable@vger.kernel.org, 
    sound-open-firmware@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
    linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org, 
    linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 3/3] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
In-Reply-To: <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2212091349310.3532114@eliteleevi.tm.intel.com>
References: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org> <20221127-snd-freeze-v8-3-3bc02d09f2ce@chromium.org> <716e5175-7a44-7ae8-b6bb-10d9807552e6@suse.com> <CANiDSCtwSb50sjn5tM7jJ6W2UpeKzpuzng+RdJuywiC3-j2zdg@mail.gmail.com>
 <d3730d1d-6f92-700a-06c4-0e0a35e270b0@suse.com> <CANiDSCtm7dCst_atiWk=ZcK_D3=VzvD0+kWXVQr4gEn--JjGkw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

On Thu, 1 Dec 2022, Ricardo Ribalda wrote:

> On Thu, 1 Dec 2022 at 14:22, 'Oliver Neukum' via Chromeos Kdump <chromeos-kdump@google.com> wrote:
> >
> > On 01.12.22 14:03, Ricardo Ribalda wrote:
> > > This patchset does not modify this behaviour. It simply fixes the
> > > stall for kexec().
> > >
> > > The  patch that introduced the stall:
> > > 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers
> > > in .shutdown")
> >
> > That patch is problematic. I would go as far as saying that
> > it needs to be reverted.
> 
> It fixes a real issue. We have not had any complaints until we tried
> to kexec in the platform.
> I wont recommend reverting it until we have an alternative implementation.
> 
> kexec is far less common than suspend/reboot.

I've posted an alternative to ALSA list that reverts the problematic
patch and fixes the problem (the patch was originally addressing)
in a different way:

https://mailman.alsa-project.org/pipermail/alsa-devel/2022-December/209776.html

No changes outside sound/soc/ are needed with this approach.

Br, Kai

