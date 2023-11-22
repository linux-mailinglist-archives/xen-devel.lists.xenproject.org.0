Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80417F47F9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 14:41:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638775.995678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5nU1-0000N1-3t; Wed, 22 Nov 2023 13:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638775.995678; Wed, 22 Nov 2023 13:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5nU1-0000KR-0d; Wed, 22 Nov 2023 13:41:37 +0000
Received: by outflank-mailman (input) for mailman id 638775;
 Wed, 22 Nov 2023 13:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0DV9=HD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5nTz-0000KH-J0
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 13:41:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d96c9e07-893c-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 14:41:33 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40838915cecso33045325e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 05:41:33 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b0040b303d0dcfsm2285146wmq.36.2023.11.22.05.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 05:41:32 -0800 (PST)
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
X-Inumbo-ID: d96c9e07-893c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700660493; x=1701265293; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2egLIwhgYAa4I++2P3xUUAdfMQ7VhMUmfJSWaM8iFnw=;
        b=cIjeaBGgQYQGTo3ArdjSTKJ38MBmH2/z54KMMuHrnk9St05kBmC/6r6ivsQWkfnEEy
         I+GtoTPhIoW8pgRmh7CON0BYeeNetQKUfFxiLA56X9x1ac9980ZZ0+b5yz0ujpFMGIlX
         IqbrX7iPacnLTtb8VSpCbvk+EoroUA5rcKmg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700660493; x=1701265293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2egLIwhgYAa4I++2P3xUUAdfMQ7VhMUmfJSWaM8iFnw=;
        b=XMLah9nOIKeQdAX8JLe59R+c+0noXOq7bg0QjQxRKgUrv2zTBqic8rDWEKEJbIxA66
         +56sMJxpYEepH1kllXSFi9tyS9tGxpWbKzF84krSrJqlm+J6cqmS/ioTbGgjU9AJ6WND
         t9TfYPCklslEixoMgOU6VOHNkXqUjC5A0QA73lX/S7Z6XdGE+ePHCppvuP277NKdJbd8
         P9Rw+p3EE720l1thxai0lzcX4Fucc8mhGKs5xBbxmQZH31ljGPAuUVwm54Q+rWFt1jCa
         fOpVwCIZ5rmbah1wn4qH4qIngtQXAXtsQSZFL8PeOImURt4YbrNgU4MVEPOPAstXOuls
         YnIA==
X-Gm-Message-State: AOJu0Yzf3yq9maqQq4lRkmYmFrJYt5VFfDCga+mtiwT+G8jEftQKDLfT
	iDn1OI7ebpEdzYTbGVioiBJ3V+92D4fEbm1Pi54=
X-Google-Smtp-Source: AGHT+IESdK2Gpb0W45RKZuLynGyofX4DhsDme8nDjh8o19ShtVQZTW4fET0Ofba2p9jxVA2R1fFnsQ==
X-Received: by 2002:a05:600c:524a:b0:40b:3373:abbd with SMTP id fc10-20020a05600c524a00b0040b3373abbdmr1087348wmb.32.1700660492919;
        Wed, 22 Nov 2023 05:41:32 -0800 (PST)
Date: Wed, 22 Nov 2023 14:41:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 5/5] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <ZV4FC8yHchdaCuxf@macbook>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <40585213-99ac-43b4-9432-03d739ec452c@suse.com>
 <ZV3TL7BtSxC-sv7z@macbook>
 <700ab3e1-0bd3-421b-8bc3-482ea2c84861@suse.com>
 <ZV3tg_FjPP3ybJFp@macbook>
 <12100118-b442-4cba-a8c3-5bfd33de0081@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12100118-b442-4cba-a8c3-5bfd33de0081@suse.com>

On Wed, Nov 22, 2023 at 01:11:36PM +0100, Jan Beulich wrote:
> On 22.11.2023 13:01, Roger Pau Monné wrote:
> > On Wed, Nov 22, 2023 at 11:42:16AM +0100, Jan Beulich wrote:
> >> On 22.11.2023 11:08, Roger Pau Monné wrote:
> >>> On Thu, Nov 16, 2023 at 02:33:14PM +0100, Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/hvm/svm/svm.c
> >>>> +++ b/xen/arch/x86/hvm/svm/svm.c
> >>>> @@ -2587,6 +2587,19 @@ const struct hvm_function_table * __init
> >>>>      return &svm_function_table;
> >>>>  }
> >>>>  
> >>>> +void __init prune_svm(void)
> >>>> +{
> >>>> +    /*
> >>>> +     * Now that svm_function_table was copied, populate all function pointers
> >>>> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
> >>>> +     * much of an effect as possible.
> >>>> +     */
> >>>> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
> >>>
> >>> Shouldn't this better use cpu_has_xen_ibt?
> >>>
> >>> Otherwise the clobbering done in _apply_alternatives() won't be
> >>> engaged, so it's pointless to set the extra fields.
> >>
> >> That's better answered in the context of ...
> >>
> >>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >>>> @@ -3032,6 +3032,30 @@ const struct hvm_function_table * __init
> >>>>      return &vmx_function_table;
> >>>>  }
> >>>>  
> >>>> +void __init prune_vmx(void)
> >>>> +{
> >>>> +    /*
> >>>> +     * Now that vmx_function_table was copied, populate all function pointers
> >>>> +     * which may have been left at NULL, for __initdata_cf_clobber to have as
> >>>> +     * much of an effect as possible.
> >>>> +     */
> >>>> +    if ( !IS_ENABLED(CONFIG_XEN_IBT) )
> >>>> +        return;
> >>>> +
> >>>> +    vmx_function_table.set_descriptor_access_exiting =
> >>>> +        vmx_set_descriptor_access_exiting;
> >>>> +
> >>>> +    vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
> >>>> +    vmx_function_table.process_isr            = vmx_process_isr;
> >>>> +    vmx_function_table.handle_eoi             = vmx_handle_eoi;
> >>>> +
> >>>> +    vmx_function_table.pi_update_irte = vmx_pi_update_irte;
> >>>> +
> >>>> +    vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
> >>>> +    vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
> >>>> +    vmx_function_table.test_pir            = vmx_test_pir;
> >>
> >> ... this: The goal of having a compile time conditional was to have the
> >> compiler eliminate the code when not needed. Otherwise there's no real
> >> reason to have a conditional there in the first place - we can as well
> >> always install all these pointers.
> > 
> > Maybe do:
> > 
> > if ( !IS_ENABLED(CONFIG_XEN_IBT) || !cpu_has_xen_ibt )
> > 
> > then?
> 
> Maybe. Yet then perhaps cpu_has_xen_ibt might better include the build-time
> check already?

I was wondering about this, yes, might be a better route.

Thanks, Roger.

