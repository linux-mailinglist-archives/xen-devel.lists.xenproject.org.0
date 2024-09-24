Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CBB984966
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803085.1213501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8BM-0003Tp-57; Tue, 24 Sep 2024 16:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803085.1213501; Tue, 24 Sep 2024 16:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8BM-0003RF-2N; Tue, 24 Sep 2024 16:14:32 +0000
Received: by outflank-mailman (input) for mailman id 803085;
 Tue, 24 Sep 2024 16:14:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZSf=QW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1st8BK-0003R9-T5
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:14:30 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1303b514-7a90-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 18:14:28 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c5c3a1f474so2817331a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 09:14:28 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f340a0sm100308666b.38.2024.09.24.09.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 09:14:27 -0700 (PDT)
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
X-Inumbo-ID: 1303b514-7a90-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727194468; x=1727799268; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RrxGKWJbzHh7L3JCF5CwV2oMvsOrstko6SvHJcL6Lxg=;
        b=lR7n26D6M7K/oLJ4jwmcQnJwXFKhRGiLHXlfgQQPHRBOvR9jaP+nQTLnZ5Chswdnjw
         YHMPk3Dh0KpHgMenZux7Q0sFi7bdCw5YcSLoHNwdHpzhCqN8J8tsKTTPQrVdhm5RH673
         jJqDw2jRI9NHLqM27yZ419SIZFkxPtKG2ST4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727194468; x=1727799268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrxGKWJbzHh7L3JCF5CwV2oMvsOrstko6SvHJcL6Lxg=;
        b=q9+UAM1041mC2/a65MtSEN1Hg+msCAkbU69xHwDHvqqmeo5xQyOJZtwk63Ad/TGmW8
         8HgoqknKXT0j51uxV/+0fYeza9zW2F7VysXA6ryTecdJDrAJ3hTfnMbkXJdpPG64zFcs
         tARHzvV8nm66vFyge8uTZqJGl89gNaI2h0LG29dxP2vwGyX8I1nkKz1EYEzP9CN9mk/L
         3O3GyirLzbS1qv6LuhYGwgIYcojC/T30h7YxqxW5yaujjYzRcdIHDqdpmz9eeids1Pkl
         3t2DBgT3+UZ2v3ZCJ4EAGHhMtlk4QJ1jzo/jSKxI/ShesHDgbIiGhB4FaEi8ukR0Z22q
         KPoA==
X-Gm-Message-State: AOJu0YzocIWGEA4DmszFqLEcIRUxMtwAbPd1MocLjusH6Nl9A+O8Cyxm
	w5RljILCFKnpgxPXZc2zJVBrY/SwaKdJl0cNrGsVRme4Sr/16kOcNCFUNBdjZZ4=
X-Google-Smtp-Source: AGHT+IFFzP+aiXpgMbLOghYuAIpUyUm0TT/rEBy82dTq0hJzCs60EOz1j57Hmbib+D307BQc3QmOWw==
X-Received: by 2002:a17:907:9723:b0:a86:b85d:9470 with SMTP id a640c23a62f3a-a90d599a412mr1409776266b.59.1727194467940;
        Tue, 24 Sep 2024 09:14:27 -0700 (PDT)
Date: Tue, 24 Sep 2024 18:14:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Matthew Barnes <matthew.barnes@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/APIC: Remove x2APIC pure cluster mode
Message-ID: <ZvLlYp0L3Ac2O_uG@macbook.local>
References: <e43028a51f8cea02421d0856376faada8ab186d4.1726840133.git.matthew.barnes@cloud.com>
 <ZvLWSEwbdL1kpvC6@macbook.local>
 <4b7a2b84-5c5d-40e2-b20e-5c011eac7b4a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b7a2b84-5c5d-40e2-b20e-5c011eac7b4a@citrix.com>

On Tue, Sep 24, 2024 at 04:27:36PM +0100, Andrew Cooper wrote:
> On 24/09/2024 4:10 pm, Roger Pau Monné wrote:
> > On Mon, Sep 23, 2024 at 03:35:59PM +0100, Matthew Barnes wrote:
> >> With the introduction of mixed x2APIC mode (using cluster addressing for
> >> IPIs and physical for external interrupts) the use of pure cluster mode
> >> doesn't have any benefit.
> >>
> >> Remove the mode itself, leaving only the code required for logical
> >> addressing when sending IPIs.
> >>
> >> Implements: https://gitlab.com/xen-project/xen/-/issues/189
> 
> We use the Resolves: tag for this.  Can fix on commit.
> 
> > There's at least one extra bit which I would also like to see removed,
> > either in this patch, or as following patch.
> >
> > In struct arch_irq_desc we have 3 cpumasks: cpu_mask, old_cpu_mask and
> > pending_mask.  After dropping cluster mode for external interrupts,
> > those fields could become integers AFACT, as now interrupts can only
> > target a single CPU opposed to a logical CPU set.
> 
> A separate patch for sure, but that sounds like a great improvement.

Oh, there are quite some fields of struct genapic that are not needed
anymore, since both implementations set it to the same function.  It
would be helpful to prune them.

Thanks, Roger.

