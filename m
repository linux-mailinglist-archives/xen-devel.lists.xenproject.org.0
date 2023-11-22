Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB147F4547
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 13:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638722.995581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5lur-0007WI-P3; Wed, 22 Nov 2023 12:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638722.995581; Wed, 22 Nov 2023 12:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5lur-0007Ub-MK; Wed, 22 Nov 2023 12:01:13 +0000
Received: by outflank-mailman (input) for mailman id 638722;
 Wed, 22 Nov 2023 12:01:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DV9=HD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5luq-0007T1-1M
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 12:01:12 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2c022cd-892e-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 13:01:09 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32faea0fa1fso444649f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 04:01:09 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 cp33-20020a056000402100b00332c6a52040sm9641566wrb.100.2023.11.22.04.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 04:01:08 -0800 (PST)
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
X-Inumbo-ID: d2c022cd-892e-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700654469; x=1701259269; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GpAplLU4uuf1ZX5Di5L1A6+oqv2xpsS/Lb1cUCHqNBw=;
        b=Hbhg8cc954Bfk/HZPmSo2R5KlI+gLUllEDs3w2lry9rVznX+3nwLbQJB7lgIeLNOUY
         0N1eZ3a/6SpTfSo6A3kmW8f8GmbprR9xHCr8XlUUCrPL3uJTAtxAFi0eVPiiVVfqgoIj
         7nt+zZUl5vlxJIIi/81UrwUMvkQTPSNKKvjTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700654469; x=1701259269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpAplLU4uuf1ZX5Di5L1A6+oqv2xpsS/Lb1cUCHqNBw=;
        b=QJZQ96vTNkikXhe6x95NuTz73mi5iy2yzBqx4Qpm7pQ4BYs3OIaOHc6RMKo55KL+Bu
         ul+W0EcLAO+sLgwbH3pPxqr39xKJYYo2uPe6AYIlqzCT4KCQpEVaO8xgHOnDSwqYT/eI
         bDdGh6FRkh06YJX1DK9X7HnUuntUp3Yewva3ghKMrKIW7qAh6wTJVXe7yANU7KuJg/Jp
         CCFU7hY9SyiOxRrS1f6oHS1XHkrnkTdtGzkGp58aCRonbshdy36NGmhsuBc3FWTqb2z2
         Kt6WPrSXH/rqOVtgQZpxMt2h42g5HdIZSdczmyqJIqyRExaX0myWUwWtLZJ0EjyOGU4r
         gZ2w==
X-Gm-Message-State: AOJu0YxPCiA4+vz7IKRKmr4SsVhiUPZVQOz4KhxicIpqNWkbvLw7DFbZ
	yctty5RqlOWPK7gPgxg04h9+yA==
X-Google-Smtp-Source: AGHT+IHvtZRPu7+j+Wcl95RMy5ANCKhwzBje5eN1KUqSiZEn9u7/i3NFHkQnWvRqvVB4rvyPVRfs3Q==
X-Received: by 2002:a5d:47a6:0:b0:332:c9ee:32ab with SMTP id 6-20020a5d47a6000000b00332c9ee32abmr1810755wrb.5.1700654468818;
        Wed, 22 Nov 2023 04:01:08 -0800 (PST)
Date: Wed, 22 Nov 2023 13:01:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 5/5] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <ZV3tg_FjPP3ybJFp@macbook>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <40585213-99ac-43b4-9432-03d739ec452c@suse.com>
 <ZV3TL7BtSxC-sv7z@macbook>
 <700ab3e1-0bd3-421b-8bc3-482ea2c84861@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <700ab3e1-0bd3-421b-8bc3-482ea2c84861@suse.com>

On Wed, Nov 22, 2023 at 11:42:16AM +0100, Jan Beulich wrote:
> On 22.11.2023 11:08, Roger Pau Monné wrote:
> > On Thu, Nov 16, 2023 at 02:33:14PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/hvm/svm/svm.c
> >> +++ b/xen/arch/x86/hvm/svm/svm.c
> >> @@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
> >>      return &svm_function_table;
> >>  }
> >>  
> >> +void __init prune_svm(void)
> >> +{
> >> +    /*
> >> +     * Now that svm_function_table was copied, populate all function pointers
> >> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
> >> +     * much of an effect as possible.
> >> +     */
> >> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
> > 
> > Shouldn't this better use cpu_has_xen_ibt?
> > 
> > Otherwise the clobbering done in _apply_alternatives() won't be
> > engaged, so it's pointless to set the extra fields.
> 
> That's better answered in the context of ...
> 
> >> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >> @@ -3032,6 +3032,30 @@ const struct hvm_function_table * __init
> >>      return &vmx_function_table;
> >>  }
> >>  
> >> +void __init prune_vmx(void)
> >> +{
> >> +    /*
> >> +     * Now that vmx_function_table was copied, populate all function pointers
> >> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
> >> +     * much of an effect as possible.
> >> +     */
> >> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
> >> +        return;
> >> +
> >> +    vmx_function_table.set_descriptor_access_exiting =
> >> +        vmx_set_descriptor_access_exiting;
> >> +
> >> +    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
> >> +    vmx_function_table.process_isr            = vmx_process_isr;
> >> +    vmx_function_table.handle_eoi             = vmx_handle_eoi;
> >> +
> >> +    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
> >> +
> >> +    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
> >> +    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
> >> +    vmx_function_table.test_pir            = vmx_test_pir;
> 
> ... this: The goal of having a compile time conditional was to have the
> compiler eliminate the code when not needed. Otherwise there's no real
> reason to have a conditional there in the first place - we can as well
> always install all these pointers.

Maybe do:

if ( !IS_ENABLED(CONFIG_XEN_IBT) || !cpu_has_xen_ibt )

then?

Thanks, Roger.

