Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3269BA1B45A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 12:02:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876678.1287034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHSF-0006mq-B0; Fri, 24 Jan 2025 11:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876678.1287034; Fri, 24 Jan 2025 11:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHSF-0006kN-81; Fri, 24 Jan 2025 11:02:27 +0000
Received: by outflank-mailman (input) for mailman id 876678;
 Fri, 24 Jan 2025 11:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbHSE-0006kH-Co
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 11:02:26 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad4bea6c-da42-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 12:02:19 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-219f8263ae0so36375475ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 03:02:24 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a78f317sm1583806b3a.176.2025.01.24.03.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:02:22 -0800 (PST)
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
X-Inumbo-ID: ad4bea6c-da42-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737716543; x=1738321343; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y5iX+PGEJ6GpHjvYAaAoXQh+m+2PBM8nT4eMQKseUCU=;
        b=kq2dHEbH3I6B2PQ/06F4+ySzkmNwyCRckAIPmReTkTNI30ZBoHDpJUZYZah5wp/K2l
         Gu5rRqWdjdBfpSpYwadaShcbbhX83ZNpxmHUKj/V358zN8TA026Q01TaSOs5IpiFRu/L
         8tn8x5bxveTfuDBzYUDuFleaqVCN1Jvs9CtlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716543; x=1738321343;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5iX+PGEJ6GpHjvYAaAoXQh+m+2PBM8nT4eMQKseUCU=;
        b=YfMPCR/Na+i/knuGzONfhLv1pP31qXYEM74KiMj/U5HhYj5qTNji7CbQVIj1m3MUMV
         ZO6LtUa8ZaLJMbc4euEanhZrZwdsPYSAq4UdAMQU6eV7EN2sQGO0tkKuLRQ2HgzjHhnF
         BrIGBrWJjoRWi4YndG5+xZN0q+7FFbtLCgVxJE8BGYJMsEsjf5Ih8avQ0LP+hAxQNKT5
         7Ue8woEryaVrPXJLgwfYGo4S4BkrR5C2aIDwmopzhwl6wjM5WwmIhMVt0gFj0fYVx2Py
         WuWmBD4foVvz70R2crHLZOHOQz8vQSHc9xQLAm/Pnk/zGEkENmeuDg6v4qaqj3BugXi0
         3rYg==
X-Gm-Message-State: AOJu0YzTCf13NxpEHACzBsO8EQJS9lZOiAQc09/IWlC0GPUDvvmQsK7p
	GZ9+hG16OdDRP0peRvj4nP9x/CwvJ/uSVIxMXBwvwKqACRyyEaRi+6xhcDscnJo=
X-Gm-Gg: ASbGncs+edx/tbpJZnx++gsjz2qMuh5ae1OuYsqhTkV67RDO5dQv1cIDLPN+XUsRmhE
	Izs7n5DegJzuszeylesM7ElnfBuR0jIiczhkpfDCwQnZmHq1JFLAFznnVOymu1+EdX024FqPLRN
	fxkScUDGITkchPRCYGQmttEN+PxsqiFymGKwixepm8P/GfOqOmejuxqYwlOtSdV+Ff7wHpfZA/C
	//vZ1D2ZqYCzHMzLaD2Q6HgJxWAzKU2DGYYitLEqSYQZpxkiVaIXPpIvArwbJRv9pfWw7YmEfgF
	MIeoiVR4nn1gQFE=
X-Google-Smtp-Source: AGHT+IGaBEWz5RMs885I0m9+mTysZRLYcF2IAxNSiwmUi/rfdOuTY02tfK6N2sI0XreI3edLBse8PQ==
X-Received: by 2002:a05:6a00:244d:b0:71e:6c3f:2fb6 with SMTP id d2e1a72fcca58-72daf950b94mr50262422b3a.8.1737716542857;
        Fri, 24 Jan 2025 03:02:22 -0800 (PST)
Date: Fri, 24 Jan 2025 12:02:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 03/12] VMX: drop vmcs_revision_id
Message-ID: <Z5NzOUA-bWQMkh-_@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <7a4ec627-f801-409b-995e-42732970e47c@suse.com>
 <Z5NwuaCBm4vxATUu@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5NwuaCBm4vxATUu@macbook.local>

On Fri, Jan 24, 2025 at 11:51:37AM +0100, Roger Pau Monné wrote:
> On Mon, Feb 26, 2024 at 05:42:50PM +0100, Jan Beulich wrote:
> > It's effectively redundant with vmx_basic_msr. For the #define
> > replacement to work, struct vmcs_struct's respective field name also
> > needs to change: Drop the not really meaningful "vmcs_" prefix from it.
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > v2: New.
> > 
> > --- a/xen/arch/x86/hvm/vmx/vmcs.c
> > +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> > @@ -175,7 +175,7 @@ static DEFINE_PER_CPU(paddr_t, current_v
> >  static DEFINE_PER_CPU(struct list_head, active_vmcs_list);
> >  DEFINE_PER_CPU(bool, vmxon);
> >  
> > -static u32 vmcs_revision_id __read_mostly;
> > +#define vmcs_revision_id (vmx_basic_msr & VMX_BASIC_REVISION_MASK)
> >  u64 __read_mostly vmx_basic_msr;
> 
> __ro_after_init maybe while at it (and then uint64_t also)?
> 
> I would place the #define after the definition of vmx_basic_msr, but
> that's just my taste.

I see that this gets further adjusted by the next patch, and the
comments I made are no longer relevant.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

