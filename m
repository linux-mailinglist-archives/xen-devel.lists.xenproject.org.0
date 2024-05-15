Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 046F78C635E
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 11:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722031.1125829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AZf-0000ir-3V; Wed, 15 May 2024 09:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722031.1125829; Wed, 15 May 2024 09:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7AZf-0000gw-0t; Wed, 15 May 2024 09:05:23 +0000
Received: by outflank-mailman (input) for mailman id 722031;
 Wed, 15 May 2024 09:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqhY=MS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7AZd-0000gm-Hg
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 09:05:21 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40422978-129a-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 11:05:19 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-6114c9b4d83so58847617b3.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 02:05:19 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54b579csm80678431cf.5.2024.05.15.02.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 02:05:17 -0700 (PDT)
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
X-Inumbo-ID: 40422978-129a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715763918; x=1716368718; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=93qIpFPUbjkLMI3HgTtDzyyJ14Dx2k56D1NQkwSoxGA=;
        b=K0ToZ4UdpydnONylM2O6YytfzeErlgxkPPs+tXxdykuzYjkpprH2WqDnPmzFWPZi67
         XV3PkjzwFFOyDCZIsjV0sh46Rrwt7Iplzv31r0fo1WL5GZsKCYzUIDHvhdQniHxWtaeU
         H+nG4VV9ixkezCK3SqQ9PjDEmGNYzGj+OIUHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715763918; x=1716368718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93qIpFPUbjkLMI3HgTtDzyyJ14Dx2k56D1NQkwSoxGA=;
        b=GhhfVHdS9+BFd8IxWu4OkhcrkbmZVR9Ve5R2SSwyaSmOj/ooO3/s0t6Mg9+KjUs+Dt
         0r48Db9lvFLCGQHANZFSCyWOONxWxXfhX7OvBg5VaVHR11ixG0aRsWaU8S/f6yaewy69
         MqLWqnREO6VGg28gViVmyUQHLRGSQRsv4oEpd4sJ0z04hckT8eRAUIodblhG59ZT4CCc
         psvMP81z8XngGzUMrBW/NrVn8jytCh+PkqFd5eFFv/9x2vkiOCrJuozEo9aCEgdtwe7w
         eBZ6eg/AFZfgwZdh05XkbrGBf52x00YC8fQgYHOT8n26MjCarvMZ5Tx45DqK9cUJxdfP
         d5lA==
X-Gm-Message-State: AOJu0YxG96G0JItc8USotsvPlkEvac7XlDmuPJCF7/5le+l9OaYziDG+
	vCXmQaZE3UaPEARqLMQSzCpF5Cx9AIFAaDy3VvnABV/6oDgE2odRY8WEvB5pHSY=
X-Google-Smtp-Source: AGHT+IE6Pq6gQv3c0ltrNwytdcxQuSZygVg2GohsEkcsl/w21paUbLSg0wQK4xxeSoA3+Tqxy0uWhA==
X-Received: by 2002:a05:690c:fc1:b0:61b:91e3:f954 with SMTP id 00721157ae682-622affc6413mr174115057b3.8.1715763917540;
        Wed, 15 May 2024 02:05:17 -0700 (PDT)
Date: Wed, 15 May 2024 11:05:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 01/19] x86: Create per-domain mapping of guest_root_pt
Message-ID: <ZkR6y3kuvKySKwRm@macbook>
References: <20240513111117.68828-1-eliasely@amazon.com>
 <20240513111117.68828-2-eliasely@amazon.com>
 <ZkIxdtiDc_pnPWdx@macbook>
 <699c6487-58c9-456f-8415-e3c525fa905e@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <699c6487-58c9-456f-8415-e3c525fa905e@amazon.com>

On Tue, May 14, 2024 at 06:15:57PM +0100, Elias El Yandouzi wrote:
> Hi Roger,
> 
> On 13/05/2024 16:27, Roger Pau Monné wrote:
> > > diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> > > index 2a445bb17b..1b025986f7 100644
> > > --- a/xen/arch/x86/pv/domain.c
> > > +++ b/xen/arch/x86/pv/domain.c
> > > @@ -288,6 +288,21 @@ static void pv_destroy_gdt_ldt_l1tab(struct vcpu *v)
> > >                                 1U << GDT_LDT_VCPU_SHIFT);
> > >   }
> > > +static int pv_create_root_pt_l1tab(struct vcpu *v)
> > > +{
> > > +    return create_perdomain_mapping(v->domain,
> > > +                                    PV_ROOT_PT_MAPPING_VCPU_VIRT_START(v),
> > > +                                    1, v->domain->arch.pv.root_pt_l1tab,
> > > +                                    NULL);
> > > +}
> > > +
> > > +static void pv_destroy_root_pt_l1tab(struct vcpu *v)
> > 
> > The two 'v' parameters could be const here.
> 
> I could constify the parameters but the functions wouldn't be consistent
> with the two above for gdt/ldt.

The fact they are not const for the other helpers would also need
fixing at some point IMO, it's best if those are already using the
correct type.

> > > diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> > > index df015589ce..c1377da7a5 100644
> > > --- a/xen/arch/x86/x86_64/entry.S
> > > +++ b/xen/arch/x86/x86_64/entry.S
> > > @@ -162,7 +162,15 @@ FUNC_LOCAL(restore_all_guest)
> > >           and   %rsi, %rdi
> > >           and   %r9, %rsi
> > >           add   %rcx, %rdi
> > > +
> > > +        /*
> > > +         * The address in the vCPU cr3 is always mapped in the per-domain
> > > +         * pv_root_pt virt area.
> > > +         */
> > > +        imul  $PAGE_SIZE, VCPU_id(%rbx), %esi
> > 
> > Aren't some of the previous operations against %rsi now useless since
> > it gets unconditionally overwritten here?
> 
> I think I can just get rid off of:
> 
>     and   %r9, %rsi
> 
> > and   %r9, %rsi
> > [...]
> > add   %rcx, %rsi
> 
> The second operation you suggested is actually used to retrieve the VA of
> the PV_ROOT_PT.

Oh, yes, sorry, got confused when looking at the source file together
with the diff, it's only the `and` that can be removed.

Thanks, Roger.

