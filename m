Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 815928720C8
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 14:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688805.1073433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVA6-0002ID-IB; Tue, 05 Mar 2024 13:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688805.1073433; Tue, 05 Mar 2024 13:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhVA6-0002GX-FL; Tue, 05 Mar 2024 13:48:54 +0000
Received: by outflank-mailman (input) for mailman id 688805;
 Tue, 05 Mar 2024 13:48:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXiD=KL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhVA4-0002GR-Ij
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 13:48:52 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 193d962a-daf7-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 14:48:51 +0100 (CET)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-42efbc18f2fso8267971cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 05:48:51 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 f8-20020ac859c8000000b0042c61b99f42sm2991329qtf.46.2024.03.05.05.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 05:48:50 -0800 (PST)
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
X-Inumbo-ID: 193d962a-daf7-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709646530; x=1710251330; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5fn+Keav2c02DqvvtZMmlbGmuVNwLiwEMWjhNZw740I=;
        b=FKPwdzKJJiXZlCE0kKX13JPtRC73kFdjw21Hf9ZOQ3X2xk0os0QksrQqzVLXIuyOBc
         tOeZA25X3rfNcga7N+e2RBQO15B9FhgCVbYuAj5Ej7YkcthBFxjQxg5OxqoOGVw+p77y
         914J0o6IRVpBOf9hy467NLHfWxokB6wkfoxoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709646530; x=1710251330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fn+Keav2c02DqvvtZMmlbGmuVNwLiwEMWjhNZw740I=;
        b=I54NBIJ09X1FswSE+naGv3ZGQ2HkF6F/MTzFBjVGffIM/aJyNEMXLMBokoo7OuO8SN
         sENCR0j4xqw2RWrEAZu7uOQtFFz485jCYBCz20ofN/d4BHRYLrmaUCW5rU/+f+20GwCB
         z6qnO421TJ+CLDHh9DJU1i9MmpXzgeLJN6CqPCw7wS4misDPYe+SPCFMCoeUE3Uav/77
         KURD3hLvW6OaNT13BqfsEA4ae7gqgpQbVxysrafFH2AWMuwm/85CqQH5gLENe6Zj6pV1
         dZbBcY1RW4+jAIfMKwkcZ5KX6yQKYB3+N8lNOaeiTei6P7FOynSV89SzZ/HgJLAM/6EV
         W4tw==
X-Gm-Message-State: AOJu0YwdYylUMx8O1Yqw3p/gBIgm1scLCUUK5wqX93CTGrg1o4w8AR/X
	I2W519+g0GriTHvQRhYmL5mLfoIUCJ5yqPdf1Ep2zG7gH5VtKebXM46ucPuIOH4=
X-Google-Smtp-Source: AGHT+IEUghECJzUZj2yHCSHMu1WhZefzDOWneZnf2Q+NNrx78soYupX4MIUkiy6s3XjlrWXJH+MwVA==
X-Received: by 2002:a05:622a:1b90:b0:42e:f166:17e5 with SMTP id bp16-20020a05622a1b9000b0042ef16617e5mr2667475qtb.23.1709646530540;
        Tue, 05 Mar 2024 05:48:50 -0800 (PST)
Date: Tue, 5 Mar 2024 14:48:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] x86/livepatch: Relax permissions on rodata too
Message-ID: <ZeciwKlNPM9XoqrF@macbook>
References: <20240305121121.3527944-1-andrew.cooper3@citrix.com>
 <20240305121121.3527944-4-andrew.cooper3@citrix.com>
 <d6448913-8f22-40ee-b703-4d154906eab7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6448913-8f22-40ee-b703-4d154906eab7@citrix.com>

On Tue, Mar 05, 2024 at 01:02:37PM +0000, Andrew Cooper wrote:
> On 05/03/2024 12:11 pm, Andrew Cooper wrote:
> > diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> > index d2efe9e11492..f45812483b8e 100644
> > --- a/xen/common/virtual_region.c
> > +++ b/xen/common/virtual_region.c
> > @@ -91,9 +91,15 @@ void relax_virtual_region_perms(void)
> >  
> >      rcu_read_lock(&rcu_virtual_region_lock);
> >      list_for_each_entry_rcu( region, &virtual_region_list, list )
> > +    {
> >          modify_xen_mappings_lite((unsigned long)region->text_start,
> >                                   PAGE_ALIGN((unsigned long)region->text_end),
> >                                   PAGE_HYPERVISOR_RWX);
> > +        if ( region->rodata_start )
> > +            modify_xen_mappings_lite((unsigned long)region->rodata_start,
> > +                                     ROUNDUP((unsigned long)region->rodata_end, PAGE_SIZE),
> 
> I missed the final refresh to turn this to PAGE_ALIGN().  Fixed locally.

With that:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

