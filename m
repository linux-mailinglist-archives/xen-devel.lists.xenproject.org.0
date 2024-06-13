Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEB9077BF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 18:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740099.1147111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHmvr-0007Zl-2B; Thu, 13 Jun 2024 16:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740099.1147111; Thu, 13 Jun 2024 16:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHmvq-0007XR-VW; Thu, 13 Jun 2024 16:04:10 +0000
Received: by outflank-mailman (input) for mailman id 740099;
 Thu, 13 Jun 2024 16:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9y96=NP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHmvq-0007XL-9S
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 16:04:10 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 904cadb3-299e-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 18:04:08 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-79550284502so75491685a.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 09:04:07 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5eb4d84sm8012916d6.87.2024.06.13.09.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 09:04:06 -0700 (PDT)
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
X-Inumbo-ID: 904cadb3-299e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718294647; x=1718899447; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDJU5XGCJzqp3hM/CcIIri13Jl6D5WNERNa3feaCvmQ=;
        b=v561k9IEjaxHkpUCFywzpeQyHS/pElxiuaD7pE4tDuU3chDU+jH4w9dHsUYCmljfV7
         Ju++vz1AkYj3yauVoARvY+57FCUKeDL0Kg+Wqh1Gk8/QERyrlxn/mYgTtPrd9FlclFNn
         8vbBAOa3WFQfQ8Gag6YNcU+JZb5TL08Mmu5HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718294647; x=1718899447;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDJU5XGCJzqp3hM/CcIIri13Jl6D5WNERNa3feaCvmQ=;
        b=IQRIqohqnc/zzc/NM6hWk8CpnkGarHBahL4THssqSzqrv1XIPWa2pjGkrBBVPopq6f
         TjvM+xmseJgNAak+GHpkG7PLw9eh3SZ3P8KE1yIxeZq3gTxwk/biHqABhyrKdE1GB0A6
         afSHXkv05G8cjuI55fsSHjrx41TLCLD94RFof1YGsWkvPGcqIR0a3UQPHLiRJVGftMBC
         2iIwPtu69iK4pEwkgeAiU9USiFFmRoe0sAmsC9fioVYypYPvaXiIdypDEnz2ss9m9xiy
         u7bowp/kizJklFusTq0yxUojJZ+XmZWQVVct3JKFWj9rPwJdwwlXCvq3QkUG1CPUn/Rq
         3/bQ==
X-Gm-Message-State: AOJu0YwBx2wxS5VTpqyyI4+xGVz6QioDzqL2hAg4m+a1fa8yJtVM3YNY
	jU0rE6blL1lJEWwAuxcc/vqFcxshrrRhrX1/1vx1O5M9ZkE/JH8ifOOvMX424wQ=
X-Google-Smtp-Source: AGHT+IHyaFFfKMsjwy2BxOsh/JwUHs9l3fGRP43xE2JmdJF3qasfFT3J49ZJ2rWYxWJBIoHRzml+TA==
X-Received: by 2002:a05:6214:3ca1:b0:6b0:48fb:138e with SMTP id 6a1803df08f44-6b1918711a1mr65061196d6.14.1718294646667;
        Thu, 13 Jun 2024 09:04:06 -0700 (PDT)
Date: Thu, 13 Jun 2024 18:04:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for 4.19?] x86/Intel: unlock CPUID earlier for the BSP
Message-ID: <ZmsYdA6uwR4nGEYp@macbook>
References: <82277592-ea96-47c8-a991-7afd97d7a7bc@suse.com>
 <ZmsNSUmum8mRxkCs@macbook>
 <4cb42dae-430b-4740-bddd-df5c4c783724@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cb42dae-430b-4740-bddd-df5c4c783724@suse.com>

On Thu, Jun 13, 2024 at 05:53:02PM +0200, Jan Beulich wrote:
> On 13.06.2024 17:16, Roger Pau Monné wrote:
> > On Thu, Jun 13, 2024 at 10:19:30AM +0200, Jan Beulich wrote:
> >> @@ -315,16 +329,7 @@ static void cf_check early_init_intel(st
> >>  	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
> >>  		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
> >>  
> >> -	/* Unmask CPUID levels and NX if masked: */
> >> -	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
> >> -
> >> -	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
> >> -	if (disable) {
> >> -		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
> >> -		bootsym(trampoline_misc_enable_off) |= disable;
> >> -		printk(KERN_INFO "revised cpuid level: %d\n",
> >> -		       cpuid_eax(0));
> >> -	}
> >> +	intel_unlock_cpuid_leaves(c);
> > 
> > Do you really need to call intel_unlock_cpuid_leaves() here?
> > 
> > For the BSP it will be taken care in early_cpu_init(), and for the APs
> > MSR_IA32_MISC_ENABLE it will be set as part of the trampoline with the
> > disables from trampoline_misc_enable_off.
> 
> The way the original code works, it allows to deal with the BSP having the
> bit clear, but some or all of the APs having it set. I simply didn't want
> to break that property.

Oh, I see.  This looks like something we would unconditionally like to
set in trampoline_misc_enable_off?  Except that would trigger an
unnecessary write to the MSR if the CPU already has it disabled.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I think the printk could be made a printk_once, since it doesn't even
print the CPU where the bit has been seen as set, but anyway, that
would be further adjustments.

Thanks, Roger.

