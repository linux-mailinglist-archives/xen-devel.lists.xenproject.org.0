Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778658B7A3C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714960.1116378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ogS-0003LR-GW; Tue, 30 Apr 2024 14:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714960.1116378; Tue, 30 Apr 2024 14:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1ogS-0003J0-CJ; Tue, 30 Apr 2024 14:42:16 +0000
Received: by outflank-mailman (input) for mailman id 714960;
 Tue, 30 Apr 2024 14:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iw5h=MD=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1s1ogQ-0003Iu-HK
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:42:14 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d543b468-06ff-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 16:42:13 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso52176881fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 07:42:13 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b16-20020a05600c4e1000b0041bbec72670sm14400568wmq.39.2024.04.30.07.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 07:42:12 -0700 (PDT)
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
X-Inumbo-ID: d543b468-06ff-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714488133; x=1715092933; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTmzBddnbCylVwVx7clI3X/mV1tZ60oTa0osFKmT5nE=;
        b=Ll/vF+seQw5w7G19O+RXYBQ6PYNn3qkhGrBsUr5UGYLzbQ33hh7xeT9QntHPhMRjwC
         ZeWfzG+9Atm3DrJrYr/q1ELhVauuD8bwBJwspCRzGW4zshNOhwMISWfgnEQKHp5fqldH
         uOxN+1C+RZdRUWXZqWqyWzvYPWJGc6rN0OB8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714488133; x=1715092933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTmzBddnbCylVwVx7clI3X/mV1tZ60oTa0osFKmT5nE=;
        b=bgnHLvvd1H8+LJNobR2uqvtNLCG2l0sUdLu8lM1y7N+0QRQTM0814nYgtO8EjJfG3x
         p2ry9gChPwvilAE5cXtQE8SZWh8VNrVWYj9xsd2ZnjZyLXK9LgzRT+N+BexUQi8TkWLZ
         WFsKZgYs/NcceHO6XF8THO2qF44Cw36DxlBlHS5X9p0HHVTHi+XgwI+A2RHOFXRuXKGl
         y8du+mPtqdc1ijtZLDZqbOQi47bDZb9HxzKte2NI32zFu6jKZeAem84M+k5Hfd0fhYaD
         ZBhqA29EQ1PJXyA3lFqT6sWt5rRdo6WiEwpcHxtmSHhQBD+vkJSTfpJKoj1Q2MQnq4J2
         LWtQ==
X-Gm-Message-State: AOJu0Yx+5FNfC8XlNw2V0wiPt8qPbovl3QKWCsr4WpA5fHKkV59LQuPi
	YKDenTktubi/kPtMahR/RwMxeRk/KFPGh5fM17W5mNC7LgHjhuDGqm1AeGgA0xE=
X-Google-Smtp-Source: AGHT+IESvJw9U18F6kZeAmYyEt5T3BHZGb0BJeEXoU/Me/VUVHeacFiHzivig9y6rOULeB7Zqzsb2A==
X-Received: by 2002:a2e:9cc1:0:b0:2d8:7320:e36a with SMTP id g1-20020a2e9cc1000000b002d87320e36amr10281226ljj.17.1714488133125;
        Tue, 30 Apr 2024 07:42:13 -0700 (PDT)
Date: Tue, 30 Apr 2024 15:42:11 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] tools/xg: Clean up xend-style overrides for CPU
 policies
Message-ID: <2b4b05d1-154d-43b8-a29b-aa99332a8eeb@perard>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
 <20240207173957.19811-4-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207173957.19811-4-alejandro.vallejo@cloud.com>

On Wed, Feb 07, 2024 at 05:39:57PM +0000, Alejandro Vallejo wrote:
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> index 5699a26b946e..cee0be80ba5b 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -772,49 +616,45 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>               * apic_id_size values greater than 7.  Limit the value to
>               * 7 for now.
>               */
> -            if ( p->policy.extd.nc < 0x7f )
> +            if ( cur->policy.extd.nc < 0x7f )
>              {
> -                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
> -                    p->policy.extd.apic_id_size++;
> +                if ( cur->policy.extd.apic_id_size != 0 && cur->policy.extd.apic_id_size < 0x7 )
> +                    cur->policy.extd.apic_id_size++;
>  
> -                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
> +                cur->policy.extd.nc = (cur->policy.extd.nc << 1) | 1;
>              }
>              break;
>          }
>      }
>  
> -    nr_leaves = ARRAY_SIZE(p->leaves);
> -    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
> -    if ( rc )
> +    if ( xend || msr )
>      {
> -        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
> -        goto out;
> +        // The overrides are over the serialised form of the policy

Comments should use /* */

> +        if ( (rc = xc_cpu_policy_serialise(xch, cur)) )
> +            goto out;
> +
> +        if ( (rc = xc_cpuid_xend_policy(xch, domid, xend, host, def, cur)) )
> +            goto out;
> +        if ( (rc = xc_msr_policy(xch, domid, msr, host, def, cur)) )
> +            goto out;

What if `xend` is set, but `msr` isn't? Looks like there's going to be a
segv in xc_msr_policy() because it doesn't check that `msr` is actually
set.


Thanks,

-- 
Anthony PERARD

