Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57358842AB9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 18:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673643.1048047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUrki-00031T-QE; Tue, 30 Jan 2024 17:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673643.1048047; Tue, 30 Jan 2024 17:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUrki-0002zS-NR; Tue, 30 Jan 2024 17:18:28 +0000
Received: by outflank-mailman (input) for mailman id 673643;
 Tue, 30 Jan 2024 17:18:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BUgQ=JI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rUrkh-0002zF-MY
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 17:18:27 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93a54be3-bf93-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 18:18:25 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so510947266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 09:18:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906300900b00a3612edf0c6sm1074438ejz.58.2024.01.30.09.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 09:18:24 -0800 (PST)
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
X-Inumbo-ID: 93a54be3-bf93-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706635105; x=1707239905; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=enU0Ye7SHtlyw1NrjLHGA8ItVUlKWV6AWYyZgNbTKk4=;
        b=sdZf5gCJmt0hQN7Spw3hfzJ6J1j/8HCuaFca5D+qD5OFAx5lj3bQC+/yXlo/BbzGlV
         Rgbr9hatI3tkcGphCnuKk/TwJHDirg3lyBGYWkupabcO4UMX0KBU6uvBmqpzqIZy0o78
         IANyoiDeznEs8XaTWHiBid3hSYss9TDo0nKAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706635105; x=1707239905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enU0Ye7SHtlyw1NrjLHGA8ItVUlKWV6AWYyZgNbTKk4=;
        b=w0Km8CiJbjK1VVwq+SB+Mrc0LnnImCY1aZNMimWjUu6wEmkfSa6PfGULAoQ1CY/xRn
         7EA1k91PLWhlU9m3CNjpaF/PocGeaCwUffgzclL1/727TjibOEhXR3vg1RSkn6+fD+FA
         /jrvmUD+tO+gIk09meMxbFi0UCLLG3I7GclrbrUpthauRBsKKODCceq7Z5xhl9idfycN
         elLcjO/I9QoJ6w1GxHIWtaES7kZT36JQdYNSksTWvX8r0/DkoiE4FIVHa3qAMZzK5+9p
         CuStoInUYFiQx18/x0veuf6Hx+7Oy5H0EqMO//uNegx8oTFhkb2C5x3fvPmF2svscH+7
         WLbg==
X-Gm-Message-State: AOJu0Yx3vLLNWFPx9gC6fixJJ44bgNM8BHvJvwKqcazsdSY9piFaLdIf
	pfvMWBrpzYESOp5IQSF/cE8xHmNQVkHVYw8s1DxpzodgTK8NkoufBCgXjDV5i6Q=
X-Google-Smtp-Source: AGHT+IF3T8xRQFk7vJAqcF088RF6o552JYgyrRXRhA2UTBYGTFOs2QRFoc0vg9lTOUeGwJ9ITPsXcQ==
X-Received: by 2002:a17:906:3c5b:b0:a31:818d:4927 with SMTP id i27-20020a1709063c5b00b00a31818d4927mr6558929ejg.42.1706635104953;
        Tue, 30 Jan 2024 09:18:24 -0800 (PST)
Date: Tue, 30 Jan 2024 18:18:23 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/3] x86/intel: expose additional SPEC_CTRL MSR controls
Message-ID: <ZbkvX857u0lESr21@macbook>
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <85794e25-03bd-47b8-90b4-c08fbbd5a756@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85794e25-03bd-47b8-90b4-c08fbbd5a756@citrix.com>

On Tue, Jan 30, 2024 at 04:25:40PM +0000, Andrew Cooper wrote:
> On 30/01/2024 9:13 am, Roger Pau Monne wrote:
> > Roger Pau Monne (3):
> >   x86/intel: expose IPRED_CTRL to guests
> >   x86/intel: expose RRSBA_CTRL to guests
> >   x86/intel: expose BHI_CTRL to guests
> 
> A couple of things.  First,
> 
> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> index a04a11858045..382bc07785d0 100644
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -309,8 +309,8 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr,
> uint64_t *val)
>  
>  /*
>   * Caller to confirm that MSR_SPEC_CTRL is available.  Intel and AMD have
> - * separate CPUID features for this functionality, but only set will be
> - * active.
> + * separate CPUID features for some of this functionality, but only one set
> + * will be active on a single host.
>   */
>  uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
>  {
> 
> 
> There was a typo (missing the one in "but only one set"), but you're
> also adding bits now which are Intel-only and very likely to stay that way.

Oh, didn't realize the existing typo.

> IPRED_CTRL finally gives Intel CPUs a control with a similar security
> property to AMD IBRS;  i.e. I doubt AMD are going to gain support for
> these bits when they already guarantee that property and have done for
> years already.
> 
> 
> Next, I can't say that I particularly love that indentation.  This seems
> marginally less bad
> 
>     return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
>             (ssbd       ? SPEC_CTRL_SSBD       : 0) |
>             (psfd       ? SPEC_CTRL_PSFD       : 0) |
>             (cp->feat.ipred_ctrl
>              ? (SPEC_CTRL_IPRED_DIS_U | SPEC_CTRL_IPRED_DIS_S) : 0) |
>             (cp->feat.rrsba_ctrl
>              ? (SPEC_CTRL_RRSBA_DIS_U | SPEC_CTRL_RRSBA_DIS_S) : 0) |
>             (cp->feat.bhi_ctrl ? SPEC_CTRL_BHI_DIS_S : 0) |
>             0);
> 
> insofar as at least it's fewer lines.  Given the length of these new
> constants, I can't think of anything better.

I prefer my indentation, but it adds an extra line which might not be
desirable.

Feel free to adjust on commit.

Regards, Roger.

