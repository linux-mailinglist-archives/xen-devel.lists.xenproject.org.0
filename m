Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EE817525
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 16:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656133.1024142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFPp-0005Bz-KN; Mon, 18 Dec 2023 15:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656133.1024142; Mon, 18 Dec 2023 15:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFFPp-00059k-Hg; Mon, 18 Dec 2023 15:20:21 +0000
Received: by outflank-mailman (input) for mailman id 656133;
 Mon, 18 Dec 2023 15:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFFPn-00059W-Sy
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 15:20:19 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf39fbeb-9db8-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 16:19:17 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33664b6d6d5so1015297f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 07:19:17 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 df5-20020a5d5b85000000b003364a0e6983sm12011852wrb.62.2023.12.18.07.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:19:16 -0800 (PST)
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
X-Inumbo-ID: cf39fbeb-9db8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702912757; x=1703517557; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d72LA5toV9dc1Tf/rdYFCxcsJs5cMzbAaYGqLCerd2Y=;
        b=EPPpzSlABXBY5HULC5cm58CrxsObmE8WszfWXJIfKmQ2m2MIZeDh2TzuVoOCy+/h6v
         r1cChNyYw4vXM77qDoXqmnbnn0y1feGk4ZIfOljjJyx9fUhG2Z1MfX8CrXRxTdRhmrrs
         x6v2zwK1oDI74I95bpj2DCNIGz1++w0ZbF140=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702912757; x=1703517557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d72LA5toV9dc1Tf/rdYFCxcsJs5cMzbAaYGqLCerd2Y=;
        b=qYgEoJZehomGyMHvkvhV9hdk75bG+Bb9U/gnte2uCO2Nb8vEg7/ZsSFNmug0oU3CWe
         O3iUmIKrIlg194hmI6zSXOwVMnMN1gV1VtE6VxZxUbomqZoBy3+xozrL13kNj2wfc4gf
         Hk0gpEMDBpq6tWbdTjlm3Ok6sfIo9q1c2icGUb+BHFJ8OZdo1wSmBmcFVFA2J8u9g/oU
         5dVvzN6KMEmQDtud4F56nYWPcLiKj2jVzBaFCyozQJMJWeAYC2+w4qFqAyVH1yWqGCFN
         AoSeaxMt1AV4dX4GKuZmC+qdg9wxBLxuesyMacWSkL8BPwV2cfXncFaN8Rn+VcKgVTHC
         yDRQ==
X-Gm-Message-State: AOJu0Yw/3DppEv8FDS/fxaCRHe7yS3ODv3LhpDOWNSP4P+hz0/NUrMOm
	aAbaQ6gN2ty1yqhlwoKl/NGv9A==
X-Google-Smtp-Source: AGHT+IG6hGAsh9BuhdB8LcmqFHeNsrHBwpPQ4jlEhWWE950gHikxm3MbzaGBzswBKj5j/YjMrmgzIA==
X-Received: by 2002:adf:e942:0:b0:336:6a2d:4ff0 with SMTP id m2-20020adfe942000000b003366a2d4ff0mr683997wrn.101.1702912756730;
        Mon, 18 Dec 2023 07:19:16 -0800 (PST)
Date: Mon, 18 Dec 2023 16:19:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 3/4] x86: limit issuing of IBPB during context switch
Message-ID: <ZYBi83-LWEwywUuD@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <29e2b527-16b8-e72d-f625-781aedf21bc4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29e2b527-16b8-e72d-f625-781aedf21bc4@suse.com>

On Tue, Feb 14, 2023 at 05:11:40PM +0100, Jan Beulich wrote:
> When the outgoing vCPU had IBPB issued and RSB overwritten upon entering
> Xen, then there's no need for a 2nd barrier during context switch.
> 
> Note that SCF_entry_ibpb is always clear for the idle domain, so no
> explicit idle domain check is needed to augment the feature check
> (which is simply inapplicable to "idle").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v4: Tighten the condition.
> v3: Fold into series.
> ---
> I think in principle we could limit the impact from finding the idle
> domain as "prevd", by having __context_switch() tell us what kind
> domain's vCPU was switched out (it could still be "idle", but in fewer
> cases).
> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2005,17 +2005,26 @@ void context_switch(struct vcpu *prev, s
>      }
>      else
>      {
> +        unsigned int feat_sc_rsb = X86_FEATURE_SC_RSB_HVM;
> +
>          __context_switch();
>  
>          /* Re-enable interrupts before restoring state which may fault. */
>          local_irq_enable();
>  
>          if ( is_pv_domain(nextd) )
> +        {
>              load_segments(next);
>  
> +            feat_sc_rsb = X86_FEATURE_SC_RSB_PV;
> +        }
> +
>          ctxt_switch_levelling(next);
>  
> -        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
> +        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
> +             (!(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) ||
> +              /* is_idle_domain(prevd) || */

I would rather add a comment to note that the idle domain always has
SCF_entry_ibpb clear, rather than leaving this commented check in the
condition.

> +              !boot_cpu_has(feat_sc_rsb)) )

I do wonder if it would be more fail safe (and easier to expand going
forward) if we introduce a new cpu_info field to track the CPU state:
relevant here would be whether RSB has been overwritten and IBPB
executed.  Such state would be cleared on each return from guest path.

Thanks, Roger.

