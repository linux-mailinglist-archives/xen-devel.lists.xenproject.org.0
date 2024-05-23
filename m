Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EEE8CD622
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728611.1133607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9mS-0006kI-8z; Thu, 23 May 2024 14:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728611.1133607; Thu, 23 May 2024 14:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9mS-0006id-4v; Thu, 23 May 2024 14:50:56 +0000
Received: by outflank-mailman (input) for mailman id 728611;
 Thu, 23 May 2024 14:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA9mR-0006Np-54
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:50:55 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dac110e2-1913-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:50:54 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6969388c36fso26644216d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:50:54 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1ff09fsm143585096d6.133.2024.05.23.07.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:50:52 -0700 (PDT)
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
X-Inumbo-ID: dac110e2-1913-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716475853; x=1717080653; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1lWNC7dseGX/ioIFVD4AG6Y8UpRFscXqkg6G8s0OXY=;
        b=Qs4b7WygM3eG2teiXtyZUvIRWW1s/AP96Y/maPklU6BgMLjMqA1gWbm11RVm83gS9J
         XRtSq86FBL0bDStpGh1xzwiERKPTnYRWxdUEi3vkcP5lWb5PPTSQT+hzIX36U2GoGhvf
         ePhdOBetryp6DerRJvXekBkrW5+Tq9tI5lNcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475853; x=1717080653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1lWNC7dseGX/ioIFVD4AG6Y8UpRFscXqkg6G8s0OXY=;
        b=LP6+0Cvxbk7Z+Tsm83mryAUeTzM4PpIDtm3w167VquRAdPtFLIXWjZCSdMoiE8MZOq
         I64VtIEzk5MYHnvA7Ik1hCZ3ck+46wVik3RFYOOAHlwYf0CnLuh0nNEXLha6D3ei6PeT
         78s4aRWpEG6IrDEVB/ENG2DD3qsA3ym9/6e3IRgxrE1MBLsxdOW+etRbcJSSoW18avoD
         ZdMP8w8chZzuljhCID1i5i44c7Kkz3dwCd262dq4X1bgSR3Tda0qb1ipxwaSWH6pi3E2
         4N7n9RAr9kaq+U06o7UNTPkPPbbdHsXiWpwV7xSY9zVLNaH1MHMhuH772tIhyqnYVoJi
         bDig==
X-Gm-Message-State: AOJu0Yw6u/olOtSCK22s2t7PJ1cZILDDPQL3fG/1Ren9DWnntJgeRWc5
	ytGeV099kph+B/4ZcIZ1ud2xrmIz4piIy+hIEJAXv4CzsTNsbsyPviCo5qRzJhw=
X-Google-Smtp-Source: AGHT+IHCcK8430PrNR+vfhzud2TGAqFcXFlSdYkNkxhYVmnB1lOp2TO89gfGD7Zr356cR1phIXyJbw==
X-Received: by 2002:a05:6214:398e:b0:6ab:7be5:c849 with SMTP id 6a1803df08f44-6ab7f331304mr49407946d6.4.1716475853344;
        Thu, 23 May 2024 07:50:53 -0700 (PDT)
Date: Thu, 23 May 2024 16:50:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/8] x86/vlapic: Move lapic_load_hidden migration
 checks to the check hook
Message-ID: <Zk9Xy7W30WWZlb6-@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <499e029a7d2fce4fb9118b1e508313f369b37c79.1715102098.git.alejandro.vallejo@cloud.com>

On Wed, May 08, 2024 at 01:39:22PM +0100, Alejandro Vallejo wrote:
> While at it, add a check for the reserved field in the hidden save area.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * New patch. Addresses the missing check for rsvd_zero in v1.

Oh, it would be better if this was done at the time when rsvd_zero is
introduced.  I think this should be moved ahead of the series, so that
the patch that introduces rsvd_zero can add the check in
lapic_check_hidden().

> ---
>  xen/arch/x86/hvm/vlapic.c | 41 ++++++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 8a244100009c..2f06bff1b2cc 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1573,35 +1573,54 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>                 v, vlapic->loaded.id, vlapic->loaded.ldr, good_ldr);
>  }
>  
> -static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
> +static int cf_check lapic_check_hidden(const struct domain *d,
> +                                       hvm_domain_context_t *h)
>  {
>      unsigned int vcpuid = hvm_load_instance(h);
> -    struct vcpu *v;
> -    struct vlapic *s;
> +    struct hvm_hw_lapic s;
>  
>      if ( !has_vlapic(d) )
>          return -ENODEV;
>  
>      /* Which vlapic to load? */
> -    if ( vcpuid >= d->max_vcpus || (v = d->vcpu[vcpuid]) == NULL )
> +    if ( vcpuid >= d->max_vcpus || d->vcpu[vcpuid] == NULL )
>      {
>          dprintk(XENLOG_G_ERR, "HVM restore: dom%d has no apic%u\n",
>                  d->domain_id, vcpuid);
>          return -EINVAL;
>      }
> -    s = vcpu_vlapic(v);
>  
> -    if ( hvm_load_entry_zeroextend(LAPIC, h, &s->hw) != 0 )
> +    if ( hvm_load_entry_zeroextend(LAPIC, h, &s) )

Can't you use hvm_get_entry() to perform the sanity checks:

const struct hvm_hw_lapic *s = hvm_get_entry(LAPIC, h);

Thanks, Roger.

