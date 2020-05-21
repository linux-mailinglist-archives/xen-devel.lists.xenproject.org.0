Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DE91DDAA8
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 01:02:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbuCf-00054k-SP; Thu, 21 May 2020 23:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCrj=7D=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jbuCe-00054d-MF
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 23:02:16 +0000
X-Inumbo-ID: 1cfe8174-9bb7-11ea-b9cf-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cfe8174-9bb7-11ea-b9cf-bc764e2007e4;
 Thu, 21 May 2020 23:02:16 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id d7so10841765eja.7
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 16:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1t2A+3OScu1Y5T9zYIQYGjRttA9a3YJrKguzcDBeFU=;
 b=LooFSHSgRrWaLhQgC9LOaX8V3zb6TX21SfL8F93K5YNGxyCnd06vVKAvqn4fNmwpV+
 /6xeCoIKzsD+T1Y/0mCMx6iVGXE8kODc0ibMqgrCZD+Lmj74soRmWIAo04Z2b/DOAa2W
 Wz+o3sUvf1hPjiCKPLhFx6emCmgzaLljzjFr4LH42HW3ohp0/ilk5uZQwe1Wqtcc1jGm
 y1UYbNcZqZ2+5rPCn6ujZWanNZRk/zIg7agMk5YYwM7INfidbuR6041v5noLWhF5z03A
 DT9RtZ6r9DtQphNVO9LlWo3r0kYatJ6EXQLFyOyxS2bt+9S6kV+B2Ge9DBGsxjK61xPK
 u+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1t2A+3OScu1Y5T9zYIQYGjRttA9a3YJrKguzcDBeFU=;
 b=Il1lBK6bNpKCVO4rMyRLmXjZu3cJSDx5Z20nqa2zL3DCBAff+n5J6dDwg1pzoxlZGQ
 hyEEHv4RC7B1Xq9EVkGHuRoa5eO0IRnlSxkfS8sSc7TswWnM+v0gRAQREkroQDki/DPh
 po6qZhzoicypmUbE0c43cqPqHbOaw2DOBZFfJUwz+OUIIsMHDlotfYkSV+HflarrCDDa
 moYvtWUN9j8jnFM2vfeKQxwcachh9RFGbsyBcwP99QmhKbY+NTN6tMK5Ty2Les8RnOOW
 cK5MK5i52Iv6R19GdUvs59e/9eRTy6F0GTagw8kdkRVXWJlk6dsZpM/An0BFeZOgIy19
 jAUQ==
X-Gm-Message-State: AOAM533DUuS+gPw7mHgS6GCihMEZl+PnxQOHMJaWXEZFCag7Hpg3NKz3
 K8yyfBPWM7WGS2ClbnKG+du11AZFdrM=
X-Google-Smtp-Source: ABdhPJzOidNgnT9eDhmTQm11SM1BeHCgUps3t69Px0BcnShRvI8AbQzDZTILasw95GojNL4mtBL+lw==
X-Received: by 2002:a17:906:cecb:: with SMTP id
 si11mr5611275ejb.122.1590102134345; 
 Thu, 21 May 2020 16:02:14 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id c23sm6148867ejm.116.2020.05.21.16.02.13
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 16:02:13 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id l11so8351096wru.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2020 16:02:13 -0700 (PDT)
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr756171wro.301.1590102133151;
 Thu, 21 May 2020 16:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
In-Reply-To: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 21 May 2020 17:01:37 -0600
X-Gmail-Original-Message-ID: <CABfawhmtKSpcb6biat5OhB15o9OKAV30pDZ2Smz_nVcg1Wvikw@mail.gmail.com>
Message-ID: <CABfawhmtKSpcb6biat5OhB15o9OKAV30pDZ2Smz_nVcg1Wvikw@mail.gmail.com>
Subject: Re: [PATCH for-4.14 1/2] x86/mem_sharing: Prohibit interrupt
 injection for forks
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index 000e14af49..3814795e3f 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c
> @@ -256,6 +256,10 @@ void vmx_intr_assist(void)
>      if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
>          return;
>

Just noticed after sending the patch that this block needs to be wrapped in

#ifdef CONFIG_MEM_SHARING

> +    /* Block event injection for VM fork if requested */
> +    if ( unlikely(v->domain->arch.hvm.mem_sharing.prohibit_interrupts) )
> +        return;

#endif

> +
>      /* Crank the handle on interrupt state. */
>      pt_vector = pt_update_irq(v);
>

I can resend if necessary but its also a trivial fixup when applying
so let me know what would be preferred. I pushed the fixed-up version
to http://xenbits.xen.org/gitweb/?p=people/tklengyel/xen.git;a=shortlog;h=refs/heads/fork_interrupts.

Thanks,
Tamas

