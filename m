Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8482A91F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 09:28:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665998.1036376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqQM-00029W-S8; Thu, 11 Jan 2024 08:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665998.1036376; Thu, 11 Jan 2024 08:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNqQM-00027L-Oa; Thu, 11 Jan 2024 08:28:26 +0000
Received: by outflank-mailman (input) for mailman id 665998;
 Thu, 11 Jan 2024 08:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+ne=IV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNqQL-00026U-7m
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 08:28:25 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6223737d-b05b-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 09:28:23 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50e835800adso5116042e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 00:28:23 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 a8-20020a5d5088000000b003364a0e6983sm567122wrt.62.2024.01.11.00.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 00:28:22 -0800 (PST)
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
X-Inumbo-ID: 6223737d-b05b-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704961702; x=1705566502; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=71Lki0dPYkPvCTU4ohsb/8vh0jUXkmyA7QRZyOt03J0=;
        b=EIvwH5bG2jN5cZFXXCc3ZgQ9cgO/twJSLl35MZ+1Vt7zcJuqw/k7WIckvTjR8etJj3
         cFY6mu66zjkL+bPLdWMDlaxJo4cfZ6M93dB3yX+WcHaiTdJOMjnTPix3J0d5BHLep4j9
         IF7T/GkDVWr+DVtUMNR473u7Zfq8Z/REufwuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704961702; x=1705566502;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=71Lki0dPYkPvCTU4ohsb/8vh0jUXkmyA7QRZyOt03J0=;
        b=W8oGniB4zUqnipMl3gXMPQ3RJqwnLDtzHaGj6URcK2CNu+JvlNJg5d2Nxr2BMh/5C5
         neqJHhYyUGDNIoWg+/cZSBzwVsY069qtuyeRuGAQ90lW6nq/sYjjtUiuDbhdHKlEHjgW
         nXfm6Suc23cJvLry30Se3QM+2Fo8/RSbGRlNPBXey+rkfgI5ia4xrroHgVv/dMOCOIDt
         EczU0BHn7Jwg0NDHK43hS8itLZpKzLbTmsYWC5kX5fZo/BrXrXstLjWV7a6rk97rjgyN
         ScdPE0p09hwm5S1acO0hjE2aKEdN8SstJS53sUhqAMcONH2z8ZvclwCz35J/QaKJfT5u
         PuHQ==
X-Gm-Message-State: AOJu0YwuFrDcFkiv3km6qNc0HsXf3iURQbPASEaSm/iuSNad75q/Qr4t
	QPs6VnIze5ekuVGzOLWY7JLNYNituzYmvA==
X-Google-Smtp-Source: AGHT+IE6ulE7TnjKHXkZOoUdltiSEkCJZxZkiMbiL17Zwjn3ld0Yxyfvu6YYbDm9rbSQktmX6fPEUw==
X-Received: by 2002:ac2:46e3:0:b0:50e:8e87:82f3 with SMTP id q3-20020ac246e3000000b0050e8e8782f3mr238087lfo.78.1704961702507;
        Thu, 11 Jan 2024 00:28:22 -0800 (PST)
Date: Thu, 11 Jan 2024 09:28:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/nmi: ensure Global Performance Counter Control is
 setup correctly
Message-ID: <ZZ-mpVno40peC7l7@macbook>
References: <20240110153400.64017-1-roger.pau@citrix.com>
 <4bd7324f-69fc-42e5-9155-02a7e1a8a6e8@citrix.com>
 <ZZ7Mz0HymYQGpTna@macbook>
 <ffebc1a9-0ed6-492c-8f3a-605a36403883@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffebc1a9-0ed6-492c-8f3a-605a36403883@citrix.com>

On Wed, Jan 10, 2024 at 05:41:41PM +0000, Andrew Cooper wrote:
> On 10/01/2024 4:58 pm, Roger Pau Monné wrote:
> > On Wed, Jan 10, 2024 at 03:52:49PM +0000, Andrew Cooper wrote:
> >> On 10/01/2024 3:34 pm, Roger Pau Monne wrote:
> >>> When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
> >>> MSR contains per-counter enable bits that is ANDed with the enable bit in the
> >>> counter EVNTSEL MSR in order for a PMC counter to be enabled.
> >>>
> >>> So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
> >>> bits being set by default, but at least on some Intel Sapphire and Emerald
> >>> Rapids this is no longer the case, and Xen reports:
> >>>
> >>> Testing NMI watchdog on all CPUs: 0 40 stuck
> >>>
> >>> The first CPU on each socket is started with PERF_GLOBAL_CTRL zeroed, so PMC0
> >>> doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
> >>> relevant enable bit in PERF_GLOBAL_CTRL not being set.
> >>>
> >>> Fix by detecting when Architectural Performance Monitoring is available and
> >>> making sure the enable bit for PMC0 is set in PERF_GLOBAL_CTRL.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> The fact that it's only the first CPU on each socket that's started with
> >>> PERF_GLOBAL_CTRL clear looks like a firmware bug to me, but in any case making
> >>> sure PERF_GLOBAL_CTRL is properly setup should be done regardless.
> >> It's each package-BSP, and yes, this is clearly a firmware bug.  It's
> >> probably worth saying that we're raising it with Intel, but this bug is
> >> out in production firmware for SPR and EMR.
> >>
> >>> ---
> >>>  xen/arch/x86/nmi.c | 13 +++++++++++++
> >>>  1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> >>> index dc79c25e3ffd..7a6601c4fd31 100644
> >>> --- a/xen/arch/x86/nmi.c
> >>> +++ b/xen/arch/x86/nmi.c
> >>> @@ -335,6 +335,19 @@ static void setup_p6_watchdog(unsigned counter)
> >>>           nmi_p6_event_width > BITS_PER_LONG )
> >>>          return;
> >>>  
> >>> +    if ( cpu_has_arch_perfmon )
> >>> +    {
> >>> +        uint64_t global_ctrl;
> >>> +
> >>> +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
> >>> +        /*
> >>> +         * Make sure PMC0 is enabled in global control, as the enable bit in
> >>> +         * PERF_GLOBAL_CTRL is AND'ed with the enable bit in EVNTSEL0.
> >>> +         */
> >>> +        if ( !(global_ctrl & 1) )
> >>> +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl | 1);
> >> My gut feeling is that we ought to reinstate all bits, not just bit 1. 
> >> If nothing else because that will make debugging using other counters
> >> more reliable too.
> > Hm, yes, I was borderline on enabling all possible counters in
> > PERF_GLOBAL_CTRL, as reported by CPUID.0AH: EAX[15:8].
> >
> > But then wondered if it was going too far, as for the purposes here we
> > just care about PMC1.
> >
> > My reasoning for not doing it would be that such wide setup of
> > PERF_GLOBAL_CTRL would then be gated on the watchdog being enabled,
> > usages of other counters apart from PMC0 will be gated on the watchdog
> > being enabled.  It seems more reliable to me to either do the setting
> > of PERF_GLOBAL_CTRL as part of CPU initialization, or defer to each
> > user of a PMC to take care of enabling it in PERF_GLOBAL_CTRL.
> 
> It is buggy that each socket-BSP is handed over with ctl=0 rather than 0xff.
> 
> But we're exasperating the bug by not returning each socket-BSP to the
> default behaviour.
> 
> 
> It makes a practical difference if a developer wants to hand-code up
> PCR2.

I'm afraid I'm lost at what the PCR2 acronym references to here, as I
cannot find any instance of it in SDM vols 2, 3 or 4.

> It also makes a practical difference to what a guest sees when it
> executes RDPMC in guests, because right now the perf counter values leak
> in (there's another oustanding patch series of mine trying to stem this
> leak).

But RDPMC just fetches the contents of the counters, so it has no
visibility on the value of PERF_GLOBAL_CTRL.  Albeit the settings in
PERF_GLOBAL_CTRL will affect whether the counters are enabled or not,
I'm not sure a guest without access to vPMU should expect to get any
kind of consistent results out of RDPMC.

> 
> The fixup we're performing here isn't "because we're using one
> counter".  It's to get state back to default.

I'm certainly not opposed to that, but as said in my previous reply,
the adjustment should then be done somewhere else and not in
setup_p6_watchdog().  Unless there are further objections I will send
a patch to enable all general purpose PMCs in PERF_GLOBAL_CTRL at
init_intel().

Thanks, Roger.

