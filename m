Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC1972DB4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795180.1204374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxEz-0005rp-FK; Tue, 10 Sep 2024 09:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795180.1204374; Tue, 10 Sep 2024 09:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxEz-0005qC-A8; Tue, 10 Sep 2024 09:32:53 +0000
Received: by outflank-mailman (input) for mailman id 795180;
 Tue, 10 Sep 2024 09:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snxEx-0005Ng-8W
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:32:51 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a518969d-6f57-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:32:49 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c40942358eso224546a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:32:49 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8c4d4sm3997311a12.82.2024.09.10.02.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 02:32:46 -0700 (PDT)
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
X-Inumbo-ID: a518969d-6f57-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725960769; x=1726565569; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Cc+oBHAd7t42qGO+juatyjYhZa6L7epXz/B8ENFa5Q=;
        b=nlzZI2/LfCMdwzT4BpOx9uO7CDcv1AxSyA5+J9P/HPxlt8Qq2dirs8TLz9rqbD+qX5
         Qr5dbhRR3fzGUh1gjh8oZvIRT/7eP4i4rKBWx/A+iIhhVWzvDL4NROMH3AA/LN6OjL+P
         o2kQ7s7X7rNJ3KW2z4H4kBXGOaFENoUeQR+fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960769; x=1726565569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Cc+oBHAd7t42qGO+juatyjYhZa6L7epXz/B8ENFa5Q=;
        b=Ymej/nb3Byt9q62kKGAn9vTjrVdS8+GaHRJtisqNezM1gLDS6c5BXLA/U6BKWGydF/
         01IrkIyjd/Zkr08GxW+39ZSUCP53oRzoySx8QcpOz7pZk+ieUu9L+c/uZB1m64ztj+M9
         v9Jbt22NDYNHg4dSiSIE05oaMVR2IMoCDWBa8SyIQPhDltGSHG/GN8nE2guMERLHKK/k
         hvGaernOKK8zLjeDQ4YuRTKqA9L9StnIXzsQeyK4jgW+fjU6heDCYpiEb9H7dpl8gOat
         ToJtMG0MXta4KDGX6uLlFC6cUKEKywPG9DRNkEdDvZ09XvhHye9So7nEbUHVOOOd2Q8f
         AS9g==
X-Forwarded-Encrypted: i=1; AJvYcCVdSQmMV7YRPF3uix2ehxbq2cQseXNEDpMOnuYk2WwRPtiP5bdUOUjlHWp2HhX5raX78BiniXTY6UE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtG4J7U8xS4s6Ybk0BRW4/rij1y4smibunW5p3EhbCvLwFRrPk
	FdQC0rKCsl03Xc8vd/s/vx8VNElr0qzEUdD7IK/KYaY/du+bAjJZTUVDYwC0v0U=
X-Google-Smtp-Source: AGHT+IEv5PeW8jSachIF9vuSfchdLiKXAXLWg1xYyZCyrzmMFKVW/1v+pVdKyuCN6Ae5045db8//WA==
X-Received: by 2002:a05:6402:4144:b0:5c2:6f35:41af with SMTP id 4fb4d7f45d1cf-5c4018e5d05mr2976996a12.16.1725960768645;
        Tue, 10 Sep 2024 02:32:48 -0700 (PDT)
Date: Tue, 10 Sep 2024 11:32:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: alejandro.vallejo@cloud.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 04/22] x86/mm: ensure L4 idle_pg_table is not modified
 past boot
Message-ID: <ZuASPJdTewbHTGNv@macbook.local>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-5-roger.pau@citrix.com>
 <550c6f14-228d-45b4-9146-8d950082b574@suse.com>
 <ZuAJU4ODitZ8VEJV@macbook.local>
 <47beeb90-5e90-4997-a49b-1f245a09d013@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47beeb90-5e90-4997-a49b-1f245a09d013@suse.com>

On Tue, Sep 10, 2024 at 11:00:27AM +0200, Jan Beulich wrote:
> On 10.09.2024 10:54, Roger Pau Monné wrote:
> > On Tue, Aug 13, 2024 at 05:54:54PM +0200, Jan Beulich wrote:
> >> On 26.07.2024 17:21, Roger Pau Monne wrote:
> >>> The idle_pg_table L4 is cloned to create all the other L4 Xen uses, and hence
> >>> it shouldn't be modified once further L4 are created.
> >>
> >> Yes, but the window between moving into SYS_STATE_smp_boot and Dom0 having
> >> its initial page tables created is quite large. If the justification was
> >> relative to AP bringup, that may be all fine. But when related to cloning,
> >> I think that would then truly want keying to there being any non-system
> >> domain(s).
> > 
> > Further changes in this series will add a per-CPU idle page table, and
> > hence we need to ensure that by the time APs are started the BSP L4 idle
> > page directory is not changed, as otherwise the copies in the APs
> > would get out of sync.
> > 
> > The idle system domain is indeed tied to the idle page talbes, but the
> > idle vCPU0 (the BSP) directly uses idle_pg_table (no copying), and
> > hence it's fine to allow modifications of the L4 idle page table
> > directory up to when APs are started (those will indeed make copies of
> > the idle L4.
> 
> Which may want at least mentioning in the description then. I take it
> that ...
> 
> >>> --- a/xen/arch/x86/mm.c
> >>> +++ b/xen/arch/x86/mm.c
> >>> @@ -5023,6 +5023,12 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
> >>>          mfn_t l3mfn;
> >>>          l3_pgentry_t *l3t = alloc_mapped_pagetable(&l3mfn);
> >>>  
> >>> +        /*
> >>> +         * dom0 is build at smp_boot, at which point we already create new L4s
> >>> +         * based on idle_pg_table.
> >>> +         */
> 
> ... this comment is then refined by the later patches you refer to?

Hm, I would have to double check, not sure I've updated it once the
idle_pg_table is cloned for AP bringup.

Will expand commit message and update the comment here if not done
already by later patches.

Thanks, Roger.

