Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA4A5EF6B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:19:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911655.1318061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseic-000367-LR; Thu, 13 Mar 2025 09:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911655.1318061; Thu, 13 Mar 2025 09:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseic-00033m-IZ; Thu, 13 Mar 2025 09:19:10 +0000
Received: by outflank-mailman (input) for mailman id 911655;
 Thu, 13 Mar 2025 09:19:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tseib-00033g-3S
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:19:09 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ca2d46-ffec-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 10:19:07 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3912baafc58so581715f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 02:19:07 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-395c8975afesm1433755f8f.47.2025.03.13.02.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 02:19:06 -0700 (PDT)
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
X-Inumbo-ID: 36ca2d46-ffec-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741857546; x=1742462346; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9aqWUUKxKN6Whd+pw7h8oyju+T6yXGmM8SNdTWptgx0=;
        b=RR3wM/Ty/MsF/hOebDu875r8o0lNqLWOXS1oSyQCJF5wIEXATQHb4jXrDrDBCbBh6S
         lFU5QjcPBeX2SosUmpLiApdc0W88eWUosY7MRLOJ3BvBLmVPsNyadEe0b2rwjb31Rjpb
         zEKiFIigY5M3/SemGiCEverqCr6UJapcA3zo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741857546; x=1742462346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9aqWUUKxKN6Whd+pw7h8oyju+T6yXGmM8SNdTWptgx0=;
        b=UdNMfSYVcONOHd9wNaio3vLEmmQTjGQDDLpPO7BE/VrffRBLD0rNUeAfWZbh1Raqpe
         Tf2AAzZowFJYBGqUGYPXa8KdPr2+VV9kJu6f302aGymrb113JbELsjXIbc3YcKJuQkoU
         sh888Q5xhooJG2K4Yhwohs1M5sgYQymreSCGxf4ggW9uuZVH1AJdRjq7e/7bHIQ4FmbA
         lH0t+Hq5FYjn6EP2L8vcDq4MlgBFDOPChfaUnV/pXByFHCYrYyybq9bUQCGFdS95EW4F
         Smt0XV0aSOiUyxrlvmCe5+9ZyAL4NB/kcOO1Rxhz6d8Kk7p+4CYAirP/LLKgTrBs4MxU
         jENg==
X-Gm-Message-State: AOJu0YwMJTdya0T00Yv85qYSKaSdyZAkzsDIVrz6aJlWB3Oqt4ke5qhT
	NCO2wt73njqbnHKdmL8jANs4ELS8jhRvtj3bJihEb8wiaymfv38l8ptpi5MRNsM=
X-Gm-Gg: ASbGncsw5Qsa0e+FSAVGBdQNtYp/yOvsRkzO+2hQk0lg1xmCpEiFcFlYUml3SRE8nUf
	Ns7ewuYsr5Tz7MZm/UlA4QxXEpRH5hYyFJ2hp5yDuqMw/sUteRNarLSH9pg2+4vOlPgdKPtFpyT
	DFLfyixfJY4TwikcMRo0f6XZMo2mcFJM177C7n3F7T+mqqsLXNqWR41unRo6F+3EF/JfNFubtY5
	I/6hTNAtLVm5QeQWfSIbLrTabe3u045PPGpXHfSMwMyxQIcTTTQsWeKRA+bFTJABKwDh4FJibLB
	tiYRGWUxtO1fcPg5VfOX9Pe89FQ0o0WvsnlU206xteAA8xLd7w==
X-Google-Smtp-Source: AGHT+IFEHG1sXTFqPJADUBqcWsOU7HQDVFfcUX3U6dlUFaqrOkqal9gv1aJ+tEkIsrWJP6bZK5JSEw==
X-Received: by 2002:a05:6000:1fa9:b0:391:253b:404a with SMTP id ffacd0b85a97d-39132d30c5bmr18025482f8f.8.1741857546554;
        Thu, 13 Mar 2025 02:19:06 -0700 (PDT)
Date: Thu, 13 Mar 2025 10:19:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH] x86/shadow: replace p2m_is_valid() uses
Message-ID: <Z9KjCfUslJKa0Rlj@macbook.local>
References: <6a7391fc-4abf-4e65-8159-30f4eae8fec5@suse.com>
 <Z9F-Xul18_96ok1N@macbook.local>
 <61a7d917-c044-4064-91ee-f558f6416c0a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61a7d917-c044-4064-91ee-f558f6416c0a@suse.com>

On Thu, Mar 13, 2025 at 07:55:42AM +0100, Jan Beulich wrote:
> On 12.03.2025 13:30, Roger Pau Monné wrote:
> > On Wed, Mar 12, 2025 at 12:30:40PM +0100, Jan Beulich wrote:
> >> The justification for dropping p2m_mmio_dm from p2m_is_valid() was wrong
> >> for two of the shadow mode uses.
> >>
> >> In _sh_propagate() we want to create special L1 entries for p2m_mmio_dm
> >> pages. Hence we need to make sure we don't bail early for that type.
> >>
> >> In _sh_page_fault() we want to handle p2m_mmio_dm by forwarding to
> >> (internal or external) emulation. Pull the !p2m_is_mmio() check out of
> >> the || expression (as otherwise it would need adding to the lhs as
> >> well).
> >>
> >> In both cases, p2m_is_valid() in combination with p2m_is_grant() still
> >> doesn't cover foreign mappings. Hence use p2m_is_any_ram() plus (as
> >> necessary) p2m_mmio_* instead.
> >>
> >> Fixes: be59cceb2dbb ("x86/P2M: don't include MMIO_DM in p2m_is_valid()")
> >> Reported-by: Luca Fancellu <Luca.Fancellu@arm.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> >> @@ -2366,8 +2371,8 @@ static int cf_check sh_page_fault(
> >>      gmfn = get_gfn(d, gfn, &p2mt);
> >>  
> >>      if ( shadow_mode_refcounts(d) &&
> >> -         ((!p2m_is_valid(p2mt) && !p2m_is_grant(p2mt)) ||
> >> -          (!p2m_is_mmio(p2mt) && !mfn_valid(gmfn))) )
> >> +         !p2m_is_mmio(p2mt) &&
> >> +         (!p2m_is_any_ram(p2mt) || !mfn_valid(gmfn)) )
> > 
> > Would you mind adding some comment here about the need to forward
> > p2m_mmio_dm to the emulation, and hence not possible to short-circuit
> > here?
> 
> Will this do?
> 
>     /*
>      * p2m_mmio_dm in particular is handled further down, and hence can't be
>      * short-circuited here. Furthermore, while not fitting with architectural
>      * behavior, propagating #PF to the guest when a sensible shadow entry
>      * can't be written is necessary. Without doing so (by installing a non-
>      * present entry) we'd get back right here immediately afterwards, thus
>      * preventing the guest from making further forward progress.
>      */

LGTM.

Thanks, Roger.

