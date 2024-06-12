Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B6904E47
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738968.1145849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJTa-0007zu-40; Wed, 12 Jun 2024 08:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738968.1145849; Wed, 12 Jun 2024 08:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJTa-0007xe-0d; Wed, 12 Jun 2024 08:37:02 +0000
Received: by outflank-mailman (input) for mailman id 738968;
 Wed, 12 Jun 2024 08:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV4F=NO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sHJTX-0007xD-UL
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:36:59 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee71e0e7-2896-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 10:36:58 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4217f2e3450so36418805e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:36:58 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422874de68asm16694835e9.29.2024.06.12.01.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 01:36:57 -0700 (PDT)
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
X-Inumbo-ID: ee71e0e7-2896-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718181418; x=1718786218; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCBnd0K8E9ClUJFrDbRKrnASQruoG/gxzWhvOfVi1q0=;
        b=gdlagN/qEK1GvI2GIW4wGjuqtTmna9TxFqMvKSb74aQRIL2D80nai2a65+F3IXXG2e
         dW3Tsdi9xFfmDTBzr8pPzKW98a2tQkEkXKdyObw69m+p3GtV+k6RY7TsBN6sbPFdr4Et
         UNKd7aDnhIqSY3UUCNzoq1gNZqUYXqjHgDXQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181418; x=1718786218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCBnd0K8E9ClUJFrDbRKrnASQruoG/gxzWhvOfVi1q0=;
        b=Aruzrs0EQ42YkySJ7QKKQPucMZQcnKeGj0EKddcfUgx9MrDneDv4OWaMA19f1ZcOpa
         WLalEYfPbMMl5fwaWRLse7PRg/WkH5AkXrTVTFpaQ/5QOpX2vJDsg4G6NYXSRtnruInl
         RaN0H+Vxga7cjkF0+sGdOl1duL5sDXSVciZLMhQ7ZKs9Ve/7FIRdNvd/2ZoaCYYvx0IH
         a9yvQpSZN73psKdvBaUAydH1gERRORC3EbKLhnhrp8tcERbBSa6az/SLuA7GzO9Hbd4F
         fZ0Md3bwc1h445VI344xwXCgZqZKppK+hN4oDNRWZnNPTDiGZQd5ROqEnGrf+G3Q+rNt
         Ft7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTh0r7OtboRxoHrRZBqFImAP8m04o94O0qGSuHYqmLfMaEhhSHOUAFi3xDoST2w/DC0ZHAbFEbWARppYzUxxqK24yw/ZMsxK5zAPMw2dQ=
X-Gm-Message-State: AOJu0YwSj/PFRiRz1inMW6He8DrBBDhZPZySGtrfH5y18keRUhjDc8SW
	3rqUcTi4ZWSdtYveeqXqBBnmOzeCKS3rcK91LRd1vP1q1fhUHKZLHtfO522md8o=
X-Google-Smtp-Source: AGHT+IFcMsHQuLU9LBXv3M95LM8OVMShZdL8DfYkzJ/ZtDALAYNKxYA1QgVZVj9jULuRT5gBNcW2KA==
X-Received: by 2002:a05:600c:314d:b0:421:7c1e:5d5d with SMTP id 5b1f17b1804b1-422867bf846mr14811335e9.35.1718181417764;
        Wed, 12 Jun 2024 01:36:57 -0700 (PDT)
Date: Wed, 12 Jun 2024 10:36:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 5/7] x86/irq: deal with old_cpu_mask for interrupts in
 movement in fixup_irqs()
Message-ID: <ZmleKLpdfqqgS8gd@macbook>
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-6-roger.pau@citrix.com>
 <9a7e5fab-7ea7-4196-bbc5-5c9e286cf576@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9a7e5fab-7ea7-4196-bbc5-5c9e286cf576@suse.com>

On Tue, Jun 11, 2024 at 03:47:03PM +0200, Jan Beulich wrote:
> On 10.06.2024 16:20, Roger Pau Monne wrote:
> > @@ -2589,6 +2589,28 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
> >                                 affinity);
> >          }
> >  
> > +        if ( desc->arch.move_in_progress &&
> > +             !cpumask_test_cpu(cpu, &cpu_online_map) &&
> 
> Btw - any reason you're open-coding !cpu_online() here? I've noticed this
> in the context of patch 7, where a little further down a !cpu_online() is
> being added. Those likely all want to be consistent.

No reason really - just me not realizing we had that helper.  Can
adjust in next version.

Thanks, Roger.

