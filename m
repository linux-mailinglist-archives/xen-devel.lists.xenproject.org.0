Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81274C3CBA2
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 18:09:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157191.1486081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3Tv-0004UH-LG; Thu, 06 Nov 2025 17:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157191.1486081; Thu, 06 Nov 2025 17:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3Tv-0004Sn-Hs; Thu, 06 Nov 2025 17:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1157191;
 Thu, 06 Nov 2025 17:09:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DBCD=5O=gmail.com=ritesh.list@srs-se1.protection.inumbo.net>)
 id 1vH3Tu-0004Sf-Ay
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 17:09:06 +0000
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ba9ebd5-bb33-11f0-9d17-b5c5bf9af7f9;
 Thu, 06 Nov 2025 18:09:04 +0100 (CET)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-781ea2cee3fso1204432b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 09:09:04 -0800 (PST)
Received: from dw-tp ([171.76.85.117]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0c9c0874bsm68007b3a.16.2025.11.06.09.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Nov 2025 09:09:02 -0800 (PST)
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
X-Inumbo-ID: 4ba9ebd5-bb33-11f0-9d17-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762448943; x=1763053743; darn=lists.xenproject.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=;
        b=bUNzifyOvRdYMcjnBh9LufTxEv4BHpFwksrnN/PxPYBUVJHiX/tLDRMvK6n8QBSEBh
         K5fTacBTat/bAheBjUq0cNc1mDuYzjVQQL2lm9Yk0Yq1LcGk9Mxv702ZPoVLq6rysATC
         x4BBZqcfBEiQuPA6+pK/uDipBpCgj9rjyyz7X+A+YrTU/1Ed1Xshj6OKYGxAv4YevLIF
         sfICZbhnnjlUReLUnQAHSO777tWtx0zL91qIy5BWVvE2DBcodvuitkXshEL5KYlBZTvg
         6UE6dGKu9vYea55iXApPKwqlHmNDIgQz4p5iZE98BXHs1pOrdoZAMitn/6AGbvf5AhMl
         HvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762448943; x=1763053743;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxXbjl0HhdoITaZBDxLqmLJTjrhCiLD5WEPTG0leRLU=;
        b=TKXJSJN17XOUCil7iWiQvI95g4s9I2hAymarriT14QNjupPkbsFKDTG77KFxAdPDpy
         TChXWp/jhG3yMhfbKJ6KYjQjvWfXT/+EXrVJVRlhVKSzMVM9CO4YTI44qmL6vcyJvYxJ
         ZcMufV0dzPwuylG1c64GIQQ4CQi6WhKJ4EcWqvT6tMRU7P5l0XU7gpLYV4vmrTFaw2mY
         3yI3q68HtfbAqx8NXUY5WjG5MOMee4zAUR99GgstQgP5ci5so3VzZjmmVXNhxDRs6t6m
         OeBPGZR5yKXbJcwFarBoZbm4EMmakJqmDgHYj0IF7trLGy7JhjuRACyc58Wq7tfYNx6D
         JORg==
X-Forwarded-Encrypted: i=1; AJvYcCWEMEDwYx4gWbzCbLSXLLy1cz+lxsz7iBMp+tLLsMQMtS+VBoio///nX+DuqLeDWMzh5PPYUeNwUyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGaGodaSNIx+/8eFRmDYHY5SRtRoTEXiIO5losz0k+qD0Ve6dP
	0oG9pZMbYvYx4oAwtr8ofmyAU70FNFFQEnqeDtX3GFtnqZuKFVTx41ME
X-Gm-Gg: ASbGncvuikSv2vStsEpz12BhLXk9piRntKFbjbJawwGN+qjkjdSaLjVQ8bcjw+Fv2Qt
	69RJVqmyQ29fAgEW1s6OzprCF7oOEL6q4fOOeP/Q9fjrluqxaMTidiAFz7wPQjRINUsIQmPeYSb
	0EeDGNgv/R42Z4zlOhAbiZuqQxTG01EMJ8tVtK61HG0dNHzOISeytP2Mr6QZoZnEwK/tMrNDkhW
	H+C7iNeX4LOKPmF9x5RUPWt1O7TsJY6EJiojRKgihjjYFKfUHp3BMCtnvRt3wLSbMBKMo6qUtue
	+ADaitqwyYUxSYcr6+J1RDhvN8Ke2EWgWe0pAqgc3zxDJ4cvfv6IVSI0Z8bR3XN9pplRtPPjr5m
	sebU84Sg3R0pEi+F56mE4XiWjFplit2711LvSeIEPaIkleiH3EowKdg/EEO7KCTvveGdLfQ==
X-Google-Smtp-Source: AGHT+IGcGbtG/gxArci+CopvKuv0vsWkSHD0Cj0H8EsVfNgzuLLOXCCQpVWCS8AAZU2IHguSNAAo3Q==
X-Received: by 2002:aa7:88c2:0:b0:7a9:f465:f25 with SMTP id d2e1a72fcca58-7b0bdb856abmr331762b3a.27.1762448942695;
        Thu, 06 Nov 2025 09:09:02 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, 
	Juergen Gross <jgross@suse.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
In-Reply-To: <87ikfn3yvs.ritesh.list@gmail.com>
Date: Thu, 06 Nov 2025 22:31:27 +0530
Message-ID: <87h5v73xjs.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-8-kevin.brodsky@arm.com> <87ms5050g0.ritesh.list@gmail.com> <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com> <87ikfn3yvs.ritesh.list@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

> For e.g... 
>   
>     arch_enter_lazy_mmu_mode()
>         hpte_need_flush()
>             get_cpu_var()   // this takes care of preempt_disable() 
>             adds vpns to per-cpu batch[i]
>             put_cpu_var()   // 
>     arch_leave_lazy_mmu_mode()
>

Sorry, here is the more accurate call sequence for previous email.

caller()... 
     arch_enter_lazy_mmu_mode()
     ptep_xxx_()
        pte_update()
             hpte_need_flush()
                get_cpu_var()   // this takes care of preempt_disable() 
                adds vpns to per-cpu batch[i]
                put_cpu_var()   // 
     arch_leave_lazy_mmu_mode()

-ritesh

