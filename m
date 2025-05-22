Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5209AC116D
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 18:51:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994409.1377420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI981-0004vP-0P; Thu, 22 May 2025 16:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994409.1377420; Thu, 22 May 2025 16:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI980-0004sT-Sf; Thu, 22 May 2025 16:50:44 +0000
Received: by outflank-mailman (input) for mailman id 994409;
 Thu, 22 May 2025 16:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVKv=YG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uI97z-0004sN-7K
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 16:50:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e537de80-372c-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 18:50:41 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so61345075e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 09:50:41 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a35ca5a04csm23390670f8f.23.2025.05.22.09.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 09:50:40 -0700 (PDT)
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
X-Inumbo-ID: e537de80-372c-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747932641; x=1748537441; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HoEeXAhluvwOo92HLwJ8Kfu/IuX2U+5O0BxMnCuG17Q=;
        b=W+fSYRe5iSQKIR+PwYzAQoHNF0qmmpC8xKdnJTQUVUELqNreHElq6IPtyaxTbelJML
         2RFOlHCmS4/sGPu0uEZNMsRa9k70pGMA4qk1tWGf38AJkCYQHUmREIxkPHymfI5fLsYn
         EJp3fh9S6XMaLj/Rpx35+FL3K86ElYik0mSVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747932641; x=1748537441;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HoEeXAhluvwOo92HLwJ8Kfu/IuX2U+5O0BxMnCuG17Q=;
        b=XffTDiIZnqy39a8yYlunO6HkbQZSFE+IfLdb/Q9raPdmgS3FHd57gttpGgSJx1OmAA
         ou0BKP/IWx+qgjBDlML02twZz9FJBnEBWF3noA2m+JeGr1jpmwB2+c5NJtRlKbwPO/eJ
         1zSvBkNgm2dFdt5xvLq7vndGUthxoNZxOybvgkHdAhXNu4spqwZrMJ63rincMTuC3vbm
         MxTAsGAnxVOnFeaOG3N5NiMmxjndkWlBIOoj2Z5rh9RAoda6n5hsVY08x8X59NF2XaWc
         FUd/+FhwW5DC6KMDZLAu+1CdeBBxHe6MOPODPb28I4WgPSVng1nfhJYkfToaVm5wsHHP
         lohA==
X-Forwarded-Encrypted: i=1; AJvYcCV04eZuLItSTIUn/uDhDbeHAK/Ecr8YQ7Btlq+27Hg75rSPzYAxpA4EYxG3D+dPTQqiIFS/c8TG7K0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTTHNonuBZuKW6c2znX0h3VMaH488spUC5x6RBMWK/eT510r4+
	msQMLVW1EPYrkPVroKhr6/cIBARjENsPFaAe8VPzFhuLIx6oPL16XGO2sLD42DcWhQnapQt6LUD
	VMWNT
X-Gm-Gg: ASbGnctAvdEjHYv8r4L9EwJvK1XinXary7O3CIegfvU79MwYz85xWqYtMFvwflQzi2/
	4JdRyCmd6NPa68Qb9w8385rhHZTY651sFeSGf0w2kLOiyMsPC/dOmD3q6fCs60uOPic4ItzUmOd
	aTNR+7RR5kYJfrZRTVWOoD0vFCqbXUxQyHQHXXfGPR+7OyYVHM70F7zy5JIMrPakh/e9aMKIMsD
	8FdJ76AN6nuURYAc2ZmmM6ZNH06pi2Nm+4GCR05My4U2OSlpVT5dNNnbGZS82Mo4HULvJux/7ix
	2V10/mdPPD/0kncQv8zWhSuLfLeBbbbybb9GPfSdxJCNTy3s1pgNjoGvxeksLIfK33WEqs3a3pD
	G86jHyEze81H9MYup9GY=
X-Google-Smtp-Source: AGHT+IGXp+x3Stus1k6Cbrd+wthlo2UV7WDRRs9oxBAaxamguTGWsvvxs8yAsIXawhugG11em3XyXg==
X-Received: by 2002:a05:600c:3f07:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-442fd60b516mr268915745e9.4.1747932640493;
        Thu, 22 May 2025 09:50:40 -0700 (PDT)
Date: Thu, 22 May 2025 18:50:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] x86/boot: print CPU and APIC ID in bring up
 failure
Message-ID: <aC9V3-5SiBTBDsCE@macbook.local>
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-2-roger.pau@citrix.com>
 <0028ad37-95e7-4b6e-87b6-07cadcac64aa@suse.com>
 <8c1156a8-a626-4b62-9cc1-7790184b2b9b@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c1156a8-a626-4b62-9cc1-7790184b2b9b@citrix.com>

On Thu, May 22, 2025 at 03:39:57PM +0100, Andrew Cooper wrote:
> On 22/05/2025 10:10 am, Jan Beulich wrote:
> > On 22.05.2025 09:54, Roger Pau Monne wrote:
> >> Print the CPU and APIC ID that fails to respond to the init sequence, or
> >> that didn't manage to reach the "callin" state.  Expand a bit the printed
> >> error messages.  Otherwise the "Not responding." message is not easy to
> >> understand by users.
> >>
> >> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> Changes since v1:
> >>  - Also print APIC ID.
> >> ---
> >>  xen/arch/x86/smpboot.c | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> >> index 0189d6c332a4..dbc2f2f1d411 100644
> >> --- a/xen/arch/x86/smpboot.c
> >> +++ b/xen/arch/x86/smpboot.c
> >> @@ -618,10 +618,12 @@ static int do_boot_cpu(int apicid, int cpu)
> >>              smp_mb();
> >>              if ( bootsym(trampoline_cpu_started) == 0xA5 )
> >>                  /* trampoline started but...? */
> >> -                printk("Stuck ??\n");
> >> +                printk("CPU%u/APICID%u: Didn't finish startup sequence\n",
> >> +                       cpu, apicid);
> >>              else
> >>                  /* trampoline code not run */
> >> -                printk("Not responding.\n");
> >> +                printk("CPU%u/APICID%u: Not responding to startup\n",
> >> +                       cpu, apicid);
> >>          }
> >>      }
> >>  
> > Elsewhere I think we print AIC IDs in hex; may be better to do so here, too.
> > That may then want some text re-arrangement though, e.g.
> >
> > "CPU%u: APICID %#x not responding to startup\n"
> >
> > Thoughts?
> 
> Definitely hex.  Elsewhere APIC_ID always has an underscore.

Maybe I'm confused, but I don't think Xen uses an underscore, it's
always 'APIC ID' when printed.  I don't mind adding it here, I assume
what you mean with elsewhere is other projects like Linux?

Thanks, Roger.

