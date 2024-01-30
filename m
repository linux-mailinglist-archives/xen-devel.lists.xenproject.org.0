Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D081C842705
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 15:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673479.1047809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpCm-0008Sr-8P; Tue, 30 Jan 2024 14:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673479.1047809; Tue, 30 Jan 2024 14:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUpCm-0008Qw-5V; Tue, 30 Jan 2024 14:35:16 +0000
Received: by outflank-mailman (input) for mailman id 673479;
 Tue, 30 Jan 2024 14:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUpCk-0008Qn-OE
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 14:35:14 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6ee757f-bf7c-11ee-8a43-1f161083a0e0;
 Tue, 30 Jan 2024 15:35:13 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40f02b8d150so5916605e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 06:35:13 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 v8-20020a5d59c8000000b0033af2a91b47sm4545906wry.70.2024.01.30.06.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 06:35:12 -0800 (PST)
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
X-Inumbo-ID: c6ee757f-bf7c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706625312; x=1707230112; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=atN8zjaGHB+ag524uwnqlvG3s4U1b2yNEoYL+AdcNcU=;
        b=E1fT9+KzFsox0BY4hj32hF3ng6TQ2T+wJ81SPDuuekPeJGVur0uDUZ46yrNXyl4+ln
         4hn5GqBmvFdds+YONCx/YYw7tiPVyy8/ZQyg8e6etO2CWwoJ/ceVrWBwbEs+l25mUOTT
         WZ1mO+IGEce+a2qiA9L+WWdpPjIBTEL8hFJn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706625312; x=1707230112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atN8zjaGHB+ag524uwnqlvG3s4U1b2yNEoYL+AdcNcU=;
        b=MQODHsKOLE5aAkpfDArb55p2UvD0nMiJhAkVKbj30/mfT5hHrY4xIY5S+Psuu/2xNW
         YeZPK3a3nop95bebKH4mkB8txQf53WSj308XscH4gdSnwh/SWgHkaPOwyy8M8mO/ClWU
         ynATmZ9FTZkTgri4uPGV7TCG3UnNDzHxVXSl5HX9XwpRA2nz8JvDdFLwQ1A2RjWIwwrz
         GUWeDxPnzjXUuWG59DnraA5w1ZuFwsoP/8rKJ9wukqbDzfsMZygMJU7JyTNrDolLj6+W
         U3Y5mHupnBoZ1rMyh39wVIFbS7PAEoiUdV2pHi0lg5ngHNSNuqycWdyhRFzO84SqDgG9
         /Bew==
X-Gm-Message-State: AOJu0YxwsWCMwEA8k52J9a/9n4JlKDAaBCFTbfo5347SFF1I7ZfWh5yP
	hLNpmFiGe5KdegzHcmnmJvY7asn0qPt8dFOh4f9Zlyije2Lpb9nqshfCNFouRMY=
X-Google-Smtp-Source: AGHT+IFLXUVI/hdlgXQJqI/GkIiyBdmDCTtt7nXrZGNOMxhOKCvvx+hrdguwaNfocAGcSA3l6TLLJA==
X-Received: by 2002:adf:ecc5:0:b0:33a:e4ba:16f5 with SMTP id s5-20020adfecc5000000b0033ae4ba16f5mr5687338wro.3.1706625312518;
        Tue, 30 Jan 2024 06:35:12 -0800 (PST)
Date: Tue, 30 Jan 2024 15:35:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
Message-ID: <ZbkJH6qhCa1GjTES@macbook>
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130091400.50622-2-roger.pau@citrix.com>
 <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com>
 <ZbjmS2oLAV7Fyqdn@macbook>
 <0ad880e8-0f2b-4519-971e-c98b3411fba5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ad880e8-0f2b-4519-971e-c98b3411fba5@suse.com>

On Tue, Jan 30, 2024 at 01:59:14PM +0100, Jan Beulich wrote:
> On 30.01.2024 13:06, Roger Pau Monné wrote:
> > On Tue, Jan 30, 2024 at 11:57:17AM +0100, Jan Beulich wrote:
> >> On 30.01.2024 10:13, Roger Pau Monne wrote:
> >>> The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
> >>> SPEC_CTRL MSR.
> >>>
> >>> Note that those controls are not used by the hypervisor.
> >>
> >> Despite this, ...
> >>
> >>> --- a/xen/arch/x86/msr.c
> >>> +++ b/xen/arch/x86/msr.c
> >>> @@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
> >>>      return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
> >>>              (ssbd       ? SPEC_CTRL_SSBD       : 0) |
> >>>              (psfd       ? SPEC_CTRL_PSFD       : 0) |
> >>> +            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
> >>> +                                    SPEC_CTRL_IPRED_DIS_S)
> >>> +                                 : 0) |
> >>>              0);
> >>>  }
> >>
> >> ... if I'm not mistaken exposing SPEC_CTRL bits to guests is independent
> >> of whether we write SPEC_CTRL on entry to Xen. Therefore I think in the
> >> description it wants clarifying why it is acceptable to run Xen with the
> >> guest chosen settings for at least the DIS_S bit (assuming that it is
> >> okay to do so). Likely (didn't look there yet) also applicable to the
> >> further two patches.
> > 
> > "The added feature is made dependent on IBRSB, which ensures it will
> > only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
> > ensures the value of SPEC_CTRL will get context switched on exit/entry
> > to guest."
> > 
> > Would adding the above to the commit message clarify the intended
> > implementation?
> 
> It would improve things, at least hinting towards there being a connection
> between exposure and updating on entry to Xen. I'd like to ask though to
> avoid "context switch" when talking about entry from guest context. While
> in a way technically correct, our normal meaning of the term is the
> process of switching vCPU-s out/in on a pCPU.

"The added feature is made dependent on IBRSB, which ensures it will
only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
ensures the value of SPEC_CTRL will get toggled between guest and Xen
values on exit/entry to guest."

But I wonder, we already allow guests the play with other SPEC_CTRL
bits, and Xen toggles the SPEC_CTRL values as required on entry/exit
to Xen, so I'm unsure why adding more bits needs so much
justification.

Thanks, Roger.

