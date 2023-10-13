Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F87C881B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 16:55:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616629.958773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJZR-00027h-JN; Fri, 13 Oct 2023 14:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616629.958773; Fri, 13 Oct 2023 14:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJZR-000261-GP; Fri, 13 Oct 2023 14:55:21 +0000
Received: by outflank-mailman (input) for mailman id 616629;
 Fri, 13 Oct 2023 14:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NVAw=F3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1qrJZP-000240-C2
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 14:55:19 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 869bab3c-69d8-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 16:55:18 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so357922966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 07:55:18 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p26-20020a1709060dda00b009b2cc87b8c3sm12382031eji.52.2023.10.13.07.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 07:55:18 -0700 (PDT)
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
X-Inumbo-ID: 869bab3c-69d8-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697208918; x=1697813718; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FOLAK8fY0y6doe5r0bs+0VNJQ1sLcehNY1wjkEpz9XM=;
        b=H3HvPPJAqPB9CrSNhgcx8cPf9uiq/giXAWj0wqE4Ppo4iv3lfdyEC3B+/3d50m0n8F
         BzvqFG5VRjMyqZrniDOfWYy3+T2nUcOT1xHwVatrg7GF9yYbRtxYTOGGmAH1kXF/KJIt
         idSnH2XHJSDFEIbPAKZoYYrnKlXZ+e3hr7tzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208918; x=1697813718;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOLAK8fY0y6doe5r0bs+0VNJQ1sLcehNY1wjkEpz9XM=;
        b=Xo5JOssWsziTuAahOAj0ePyNM4ChogVebyb+8JA+Ji1jom0Arn7K0f/DX9vmioyh6Z
         5n+bWqLp181DKDvF+whz66NDEdrGUxo/WlTbVQuxMEfNgz+lYOfwx9cVOj48AAgvaypD
         +GgCQim94tSa/GgX8gK8e2zyb7dMhF7InQQ14Txz35GniwsQXfMQAofkoiO7p11FAqfl
         69M9har/JvPInQahIF50whTQ7fyfwtAeNtBLzrRuk3a37ypvKa7p8vy4CNk4mG4E35au
         9ho0Ekp0MdV/hbrAzUEMpJDOcCym4yE6lvivO1XwVC8esVdeg5xq+hMwShcj6uf4QqDs
         TEJQ==
X-Gm-Message-State: AOJu0YwznUThkXkAx4Uqzsy8DFuzIbc97Cur/oPX4C3hi19X35rJICrJ
	yNTBe4ByDpDNftS7r5KEEk+IPg==
X-Google-Smtp-Source: AGHT+IEvKT1XWiK5Fjk56SjTZysxRDWy5SDaqW8Y11F6v1aWvzq/PC5d62KhWZ8kxRIYOt3VtLzRZw==
X-Received: by 2002:a17:906:18a1:b0:9a1:c659:7c56 with SMTP id c1-20020a17090618a100b009a1c6597c56mr23432976ejf.22.1697208918392;
        Fri, 13 Oct 2023 07:55:18 -0700 (PDT)
Message-ID: <65295a56.170a0220.8bb39.70c9@mx.google.com>
X-Google-Original-Message-ID: <ZSlaUYPDCzb5oZWo@EMEAENGAAD19049.>
Date: Fri, 13 Oct 2023 15:55:13 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.18][PATCH v2] x86/amd: Address AMD erratum #1485
References: <20231013131846.175702-1-alejandro.vallejo@cloud.com>
 <42d8ac8d-522e-424a-b002-9a0508f318da@citrix.com>
 <65295541.170a0220.81347.68b5@mx.google.com>
 <68ca37b9-54af-4d73-8ebd-8f567b9e7969@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ca37b9-54af-4d73-8ebd-8f567b9e7969@xen.org>

Hi,

On Fri, Oct 13, 2023 at 03:41:49PM +0100, Julien Grall wrote:
> Hi Alejandro,
> 
> The original e-mail didn't yet reach my inbox. So answering here as there
> are enough context.
> 
> On 13/10/2023 15:33, Alejandro Vallejo wrote:
> > On Fri, Oct 13, 2023 at 09:40:52PM +0800, Andrew Cooper wrote:
> > > On 13/10/2023 9:18 pm, Alejandro Vallejo wrote:
> > > > diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> > > > index 4f27187f92..085c4772d7 100644
> > > > --- a/xen/arch/x86/cpu/amd.c
> > > > +++ b/xen/arch/x86/cpu/amd.c
> > > > @@ -1167,6 +1167,14 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
> > > >   	if (c->x86 == 0x10)
> > > >   		__clear_bit(X86_FEATURE_MONITOR, c->x86_capability);
> > > > +	/* Fix for AMD erratum #1485 */
> > > > +	if (!cpu_has_hypervisor && c->x86 == 0x19 && is_zen4_uarch()) {
> > > > +		rdmsrl(MSR_AMD64_BP_CFG, value);
> > > > +		#define ZEN4_BP_CFG_SHARED_BTB_FIX (1ull << 5)
> 
> You are introducing a violation to MISRA Rule 7.3 [1] which was accepted
> recently. You want to use 1ULL rather than the lower case version.
> 
> [1] https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_03.c
> 
> Cheers,
> 
> -- 
> Julien Grall
Oh, I didn't know about that one. Fair enough.

Thanks,
Alejandro

