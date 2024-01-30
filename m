Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1A842773
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673534.1047885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpc1-00026i-Qs; Tue, 30 Jan 2024 15:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673534.1047885; Tue, 30 Jan 2024 15:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpc1-00023U-Nq; Tue, 30 Jan 2024 15:01:21 +0000
Received: by outflank-mailman (input) for mailman id 673534;
 Tue, 30 Jan 2024 15:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUpc0-00023K-3X
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:01:20 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c589bda-bf80-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 16:01:19 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40ef3f351d2so13829465e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:01:19 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ex8-20020a056000248800b0033af81d6dc8sm2372534wrb.87.2024.01.30.07.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 07:01:18 -0800 (PST)
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
X-Inumbo-ID: 6c589bda-bf80-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706626878; x=1707231678; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wugvr1Zk+TrZrcEP0DGARJNvrmslIQ2A3EAIZaKBGDo=;
        b=HWBUm+hzPLLRZupXBtsL0xF4gzXpNR4sVdFGh9cx7bmACq3unCUM/trkxgRFeDuh/X
         ZkDT4d9T8c50eZOIxFZBbF9hCcZL3hJiZl+o8xeO878h8dPNnsoabOBGaEM/+9sqAfUe
         Bo3v4b5FH0nERuKqkzI5Nesx/t08SRBmMRix8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706626878; x=1707231678;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wugvr1Zk+TrZrcEP0DGARJNvrmslIQ2A3EAIZaKBGDo=;
        b=kRKh49roji9Q9l7A2jZXXu0ngI6Fk8gb6xdYRQAdC97vs7ykHabMxTEc4/ahI/r/cq
         i3ZYLsjZzn5BIml0lciRrkd8ZMVreUZI2kTDtMQ3cgLyZYG8hyexTreOVCzcsZH3VJCP
         f5ZJaz0hKduxMso1t4rB4Z6XTA+AboFk7TiKP0Rjgt/AQVaEpSySUo6m4+m9AOpSyKA5
         mC5f5sNY235bASKc7yuU49E6sLd4wVM8s2Rppo7oJPYDjI5OnS7axU2pXDZvqbGAAYKa
         sKl71hi8YOhuvf1dht0xhFCZ2oQF4YIAuKd5WK/nuHwh/lXicXepPy4lqfuiKhDjJoI2
         Blnw==
X-Gm-Message-State: AOJu0YyAyK4kqiwaI3l5wjNCM3VZyj5vOQczKFgU6X2d6A3kuFujq5cj
	5dHYEBJvBHVWbMRA59xdSWSzMWCyyObQfXOtpgvniqWvnaLQ2D2lJyEFgKLDDYk=
X-Google-Smtp-Source: AGHT+IFn0KbRvCiTUxTBRtk91iX5tU1uLWpJ2Mc2tMcavPfK/pLGlNgnD3nA/Il81IVc7oMwU7oNjA==
X-Received: by 2002:adf:e452:0:b0:33a:e4a9:a21f with SMTP id t18-20020adfe452000000b0033ae4a9a21fmr1826024wrm.10.1706626878553;
        Tue, 30 Jan 2024 07:01:18 -0800 (PST)
Date: Tue, 30 Jan 2024 16:01:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
Message-ID: <ZbkPPG2Wcmw4zKbp@macbook>
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130091400.50622-2-roger.pau@citrix.com>
 <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com>
 <ZbjmS2oLAV7Fyqdn@macbook>
 <0ad880e8-0f2b-4519-971e-c98b3411fba5@suse.com>
 <ZbkJH6qhCa1GjTES@macbook>
 <9f117de7-a729-46d8-ad09-30b1f2bb7580@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f117de7-a729-46d8-ad09-30b1f2bb7580@suse.com>

On Tue, Jan 30, 2024 at 03:47:37PM +0100, Jan Beulich wrote:
> On 30.01.2024 15:35, Roger Pau Monné wrote:
> > On Tue, Jan 30, 2024 at 01:59:14PM +0100, Jan Beulich wrote:
> >> On 30.01.2024 13:06, Roger Pau Monné wrote:
> >>> On Tue, Jan 30, 2024 at 11:57:17AM +0100, Jan Beulich wrote:
> >>>> On 30.01.2024 10:13, Roger Pau Monne wrote:
> >>>>> The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
> >>>>> SPEC_CTRL MSR.
> >>>>>
> >>>>> Note that those controls are not used by the hypervisor.
> >>>>
> >>>> Despite this, ...
> >>>>
> >>>>> --- a/xen/arch/x86/msr.c
> >>>>> +++ b/xen/arch/x86/msr.c
> >>>>> @@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
> >>>>>      return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
> >>>>>              (ssbd       ? SPEC_CTRL_SSBD       : 0) |
> >>>>>              (psfd       ? SPEC_CTRL_PSFD       : 0) |
> >>>>> +            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
> >>>>> +                                    SPEC_CTRL_IPRED_DIS_S)
> >>>>> +                                 : 0) |
> >>>>>              0);
> >>>>>  }
> >>>>
> >>>> ... if I'm not mistaken exposing SPEC_CTRL bits to guests is independent
> >>>> of whether we write SPEC_CTRL on entry to Xen. Therefore I think in the
> >>>> description it wants clarifying why it is acceptable to run Xen with the
> >>>> guest chosen settings for at least the DIS_S bit (assuming that it is
> >>>> okay to do so). Likely (didn't look there yet) also applicable to the
> >>>> further two patches.
> >>>
> >>> "The added feature is made dependent on IBRSB, which ensures it will
> >>> only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
> >>> ensures the value of SPEC_CTRL will get context switched on exit/entry
> >>> to guest."
> >>>
> >>> Would adding the above to the commit message clarify the intended
> >>> implementation?
> >>
> >> It would improve things, at least hinting towards there being a connection
> >> between exposure and updating on entry to Xen. I'd like to ask though to
> >> avoid "context switch" when talking about entry from guest context. While
> >> in a way technically correct, our normal meaning of the term is the
> >> process of switching vCPU-s out/in on a pCPU.
> > 
> > "The added feature is made dependent on IBRSB, which ensures it will
> > only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
> > ensures the value of SPEC_CTRL will get toggled between guest and Xen
> > values on exit/entry to guest."
> > 
> > But I wonder, we already allow guests the play with other SPEC_CTRL
> > bits, and Xen toggles the SPEC_CTRL values as required on entry/exit
> > to Xen, so I'm unsure why adding more bits needs so much
> > justification.
> 
> Well, yes, I'm sorry, it was me forgetting the open-coded effect
> SC_MSR_{PV,HVM} has on exposing of the MSR. I guess I'd be happy with
> extending the last sentence a little, maybe "Note that those controls
> are not used by the hypervisor, and they're cleared on entry to Xen."
> If you're okay with that, I'd be happy to adjust while committing

Sure.

> (and assuming no other concerns are raised):
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> for all three patches.

Thanks.

