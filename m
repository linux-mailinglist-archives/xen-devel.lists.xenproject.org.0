Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA24D8367
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 13:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290196.492114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTjae-0003Cq-W4; Mon, 14 Mar 2022 12:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290196.492114; Mon, 14 Mar 2022 12:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTjae-0003Ao-Sx; Mon, 14 Mar 2022 12:14:20 +0000
Received: by outflank-mailman (input) for mailman id 290196;
 Mon, 14 Mar 2022 12:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MH4y=TZ=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nTjad-0003Ag-HV
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 12:14:19 +0000
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [2607:f8b0:4864:20::d35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f9b7bf2-a390-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 13:14:08 +0100 (CET)
Received: by mail-io1-xd35.google.com with SMTP id c23so17904866ioi.4
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 05:14:18 -0700 (PDT)
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
X-Inumbo-ID: 3f9b7bf2-a390-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XC9DAivyB6HxgtBw4YyJ36grCfwHFxWkSLJqL382uFk=;
        b=AxScWBRBNjaC8tfE6uRNd+KpApFB2Oa0yEnfcBRo+ryPWs192LCcg6TDYLwMLxNYwA
         pMmpr9vjoa7U8sVCnpEv/gKN1euPhthLwb02gWwWp6I5v37CgVHcuXr/hGrChKqpmSOQ
         fT2sjbvHWGZ+prcj8/TBYffKWTYOpM9nkGlxr8mv7vUsyYGvUyBEs7zivO4/uY+SiqoV
         K6UMEILq4tr6wE/M92nvqrwhqT9ukDv7rCXdAdT32MHcKX1zBhv6S+V2H4npy5nVSAv7
         HU7pKGLiw46B+f785nMlAfyWQp0DkKD6zjORdZOF7PZTEraGaHWUV8BaWHXQ3i40CPVG
         /+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XC9DAivyB6HxgtBw4YyJ36grCfwHFxWkSLJqL382uFk=;
        b=XVTui8BYQ/t7ZECXOUCYqS/9mlCEH9/S3cA0H9CYzeJStU+XGf841wc0/eCK1y1cfj
         qXL8RPhFrXwf/f9WXqdVM4vEDbcIYOok4w9xBQEPoTjeonNaI1DcmCcFmn0ZIatsqCxQ
         KGzDeXODqfoP9Pm7NcA4pgQofZcj0l5+wtVHZdaicY1coYgUvwCwItyGjZs9zrZ6Rz8m
         Degmi2cY2f/h+fQvyWDdb0JTwpbKM11Y5v/x0DeAt5w8YB8fltBaHinJSBTb7xEYI8+c
         +hzSf/Uw41tVZxMhP4I+fp3CJ1ZiQPexMzdcsCRKHnRu1UuyEdWHbdRvpSBiTeciC2cB
         zPlg==
X-Gm-Message-State: AOAM533ibET1D9OCedA8kA6NInEMUAa5xb7qioN95OHTUsYt7hsLqKg1
	X3H2b9acIQyzxiLbD53ffLFfYL+mTGygB93wATNx28jj
X-Google-Smtp-Source: ABdhPJwAJpxaoHhpR0JrV1n7jlyVyCpSj8imONThALlzSZLvFpXEswbgHY2e9jDq0leaI/YU8YwjajdGUv99VngPL/w=
X-Received: by 2002:a05:6638:2402:b0:317:b520:62ba with SMTP id
 z2-20020a056638240200b00317b52062bamr20281932jat.238.1647260057315; Mon, 14
 Mar 2022 05:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <BN9PR11MB5276E96E39209EDCCED5E9198C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5276E96E39209EDCCED5E9198C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 14 Mar 2022 08:13:41 -0400
Message-ID: <CABfawhmZLyZdSbK0sr4t_WoYx6uYOV2bH89bX4ET0kzeQiY0-A@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Lengyel, Tamas" <tamas.lengyel@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Beulich, Jan" <JBeulich@suse.com>, 
	"Cooper, Andrew" <andrew.cooper3@citrix.com>, =?UTF-8?Q?Pau_Monn=C3=A9=2C_Roger?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 14, 2022 at 3:22 AM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Lengyel, Tamas <tamas.lengyel@intel.com>
> > Sent: Friday, March 11, 2022 2:45 AM
> >
> > During VM fork resetting a failed vmentry has been observed when the reset
> > is performed immediately after a STI instruction executed. This is due to
> > the guest interruptibility state in the VMCS being modified by STI but the
> > subsequent reset removes the IF bit from FLAGS, causing the failed vmentry.
>
> I didn't get the rationale here. Before this patch the interruptibility state is
> not saved/restored thus I suppose after reset it will be cleared thus aligned
> with RFLAGS.IF=0. Can you elaborate a bit how exactly above problem is
> caused?

The problem is that the interruptibility state is not cleared and thus
isn't aligned with RFLAGS.IF=0 after RFLAGS is reset. They go out of
sync leading to the failed vmentry. The interruptibility state needs
to be included in the hvm hw cpu struct for it to get re-aligned
during reset to avoid the failed vmentry.

>
> >
> > Include the interruptibility state information in the public hvm_hw_cpu struct
> > so that the CPU can be safely saved/restored.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> >  xen/arch/x86/hvm/hvm.c                 |  9 +++++----
> >  xen/arch/x86/hvm/vmx/vmx.c             |  4 ++++
> >  xen/arch/x86/include/asm/hvm/hvm.h     | 26
>
> Why is this change only applied to vmx instead of svm?

VM forking is implemented only for vmx, thus this change is only
relevant where a VM would be immediately reset after a STI
instruction. Normal VM save/restore/migration doesn't attempt to
capture a VM state immediately after STI thus it's not relevant for
SVM.

Tamas

