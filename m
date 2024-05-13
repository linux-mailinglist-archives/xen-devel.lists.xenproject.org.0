Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0D8C45E3
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 19:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721051.1124185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ZLJ-00062u-Cw; Mon, 13 May 2024 17:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721051.1124185; Mon, 13 May 2024 17:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6ZLJ-0005x9-98; Mon, 13 May 2024 17:20:05 +0000
Received: by outflank-mailman (input) for mailman id 721051;
 Mon, 13 May 2024 17:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTuJ=MQ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s6ZLH-0005cG-LI
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 17:20:03 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0863e290-114d-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 19:20:02 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-51f57713684so5815423e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2024 10:20:02 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7f27sm620457866b.127.2024.05.13.10.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 10:20:01 -0700 (PDT)
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
X-Inumbo-ID: 0863e290-114d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715620802; x=1716225602; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZmfNVMPS0IBwYbYtAS1z3FtJotOQqYjhI7vFe6l/TU=;
        b=cgx9jmrOXnw/I5uRBrg8wbAfup2WHSHAq/7gBmIrSDBu7dU+rAM8ofLb7rtmk0hODO
         HUC52SAPwIhr0iRvHTPJnWTQMyDLtiYboXlxcsDODn4DfoaPOK39PhQ7r9eJULxutNwE
         uQhQw1p75lesRchFAbFVCs4MlKHOXL8fQhVjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715620802; x=1716225602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZmfNVMPS0IBwYbYtAS1z3FtJotOQqYjhI7vFe6l/TU=;
        b=C2fsXRMblBPHoebumjsvKCjXIr0uANUBihWzs5LSvZ9tn7+tEuEN7H7jbJAzzNqGu5
         oMXHCo2AsRwfV5IH9cmJtRD0UuEF7uUTwDFNA//zv2EVl8nH1xga5pm+UoMM0oi4Xbrk
         biKNe94kRFJq14bvZW7Gv01UHrCHxzYEKHiZfLXIzEGCpaXb7a4g70DjBS8rbrCTvy75
         c9d3vxtGswcn2l3+EzuS/jEwzdxNPx6pM1A9BxT0ZCQgdh64mIs/+83/8k5soqUJfPVh
         9EfE2Zkg9joICt1NtpmjWL3GMIeB5w20qogLT2dwfVvD7u+nLNG+0ikV+doZaikpwLqi
         hSjw==
X-Forwarded-Encrypted: i=1; AJvYcCXFHk5Dt6UZEsjJjwdExMV1656jdQr5tFMQpfhck0PpF9ds6nTBG5kPhhQEx/DSpoXzS19+l0MbgR9FK7FwmHYakaE9FU8D7T8ubj1VQJo=
X-Gm-Message-State: AOJu0Yyn+bKZE3TIYQhF3Sm1cQKOanLjvk9yLCWChyGsCzFGJJBw7JWc
	B2AgxwcmdqtDsuHwj/Ue7bo1OuzpeHHDEq4lxYsHYf+ipU0HNzEixo2SYNfcrnk=
X-Google-Smtp-Source: AGHT+IHJKN0CS2sNekYc0Aw632qYyOpPcehU52iStFXZV8FQtruHfAZ1/Yd1F4qxJ/vdHcWsQQ0XkA==
X-Received: by 2002:a19:770b:0:b0:51e:f8ae:db35 with SMTP id 2adb3069b0e04-5220fe798b9mr6411995e87.43.1715620801714;
        Mon, 13 May 2024 10:20:01 -0700 (PDT)
Message-ID: <0890e0b6-ddd4-4e3a-b100-2bda5e880283@cloud.com>
Date: Mon, 13 May 2024 18:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4.5/8] tools/hvmloader: Further simplify SMP setup
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
 <20240509175057.1921538-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <20240509175057.1921538-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/05/2024 18:50, Andrew Cooper wrote:
> Now that we're using hypercalls to start APs, we can replace the 'ap_cpuid'
> global with a regular function parameter.  This requires telling the compiler
> that we'd like the parameter in a register rather than on the stack.
> 
> While adjusting, rename to cpu_setup().  It's always been used on the BSP,
> making the name ap_start() specifically misleading.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> This is a trick I found for XTF, not that I've completed the SMP support yet.
> 
> I realise it's cheating slightly WRT 4.19, but it came out of the middle of a
> series targetted for 4.19.
> ---
>  tools/firmware/hvmloader/smp.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
> index 6ebf0b60faab..5d46eee1c5f4 100644
> --- a/tools/firmware/hvmloader/smp.c
> +++ b/tools/firmware/hvmloader/smp.c
> @@ -29,15 +29,15 @@
>  
>  #include <xen/vcpu.h>
>  
> -static int ap_callin, ap_cpuid;
> +static int ap_callin;
>  
> -static void ap_start(void)
> +static void __attribute__((regparm(1))) cpu_setup(unsigned int cpu)

I like it, but I'm not a fan of compiler attributes when there's sane
alternatives. We could pre-push the argument onto ap_stack to achieve
the same thing. As in, add a -4 offset to esp, and write "cpu" there.

  *(uint32_t*)ap.cpu_regs.x86_32.esp) = cpu;

That said, this is a solution as good as any other and it's definitely
better than a global, so take it or leave it.

With or without the proposed alternative...

Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

>  {
> -    printf(" - CPU%d ... ", ap_cpuid);
> +    printf(" - CPU%d ... ", cpu);
>      cacheattr_init();
>      printf("done.\n");
>  
> -    if ( !ap_cpuid ) /* Used on the BSP too */
> +    if ( !cpu ) /* Used on the BSP too */
>          return;
>  
>      wmb();
> @@ -55,7 +55,6 @@ static void boot_cpu(unsigned int cpu)
>      static struct vcpu_hvm_context ap;
>  
>      /* Initialise shared variables. */
> -    ap_cpuid = cpu;
>      ap_callin = 0;
>      wmb();
>  
> @@ -63,9 +62,11 @@ static void boot_cpu(unsigned int cpu)
>      ap = (struct vcpu_hvm_context) {
>          .mode = VCPU_HVM_MODE_32B,
>          .cpu_regs.x86_32 = {
> -            .eip = (unsigned long)ap_start,
> +            .eip = (unsigned long)cpu_setup,
>              .esp = (unsigned long)ap_stack + ARRAY_SIZE(ap_stack),
>  
> +            .eax = cpu,
> +
>              /* Protected Mode, no paging. */
>              .cr0 = X86_CR0_PE,
>  
> @@ -105,7 +106,7 @@ void smp_initialise(void)
>      unsigned int i, nr_cpus = hvm_info->nr_vcpus;
>  
>      printf("Multiprocessor initialisation:\n");
> -    ap_start();
> +    cpu_setup(0);
>      for ( i = 1; i < nr_cpus; i++ )
>          boot_cpu(i);
>  }
> 
> base-commit: 53959cb8309919fc2f157a1c99e0af2ce280cb84


