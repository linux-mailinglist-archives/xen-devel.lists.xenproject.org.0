Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247A7F34F0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:30:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638081.994374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UZo-0007ir-2r; Tue, 21 Nov 2023 17:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638081.994374; Tue, 21 Nov 2023 17:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UZn-0007h7-VM; Tue, 21 Nov 2023 17:30:19 +0000
Received: by outflank-mailman (input) for mailman id 638081;
 Tue, 21 Nov 2023 17:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5UZm-0007h1-K8
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:30:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a326b2ce-8893-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 18:30:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40a4848c6e1so24023605e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 09:30:17 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c211a00b0040775501256sm17224253wml.16.2023.11.21.09.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 09:30:16 -0800 (PST)
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
X-Inumbo-ID: a326b2ce-8893-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700587817; x=1701192617; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FZjXqqURqtDq+Etj4zDfP9uuVjcXOunUPSV3UQvYD8s=;
        b=ov+WaldeziQKHK9F5+0B10G8j/RkwgAVfSfUEQ5ZyneAHVtsu6jf/p1RCZJOaT9hh1
         3xxalxag1gyV7JeEA3zyxIquDka8Qy37jt8tH3Qp6+9PMdk9Cy8aNVWG2ECLZMFS3mze
         3Riez5iHBgzY8/pWiFsd1wxHAXT7PYrcg5JGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700587817; x=1701192617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZjXqqURqtDq+Etj4zDfP9uuVjcXOunUPSV3UQvYD8s=;
        b=MCFUsebjKM/TyrpM8b70D0Q/5II/fkFCEPUoyLZqMpgC7+Y8Svi7Aq/hmPGY3N82dS
         SEjH1hBw+sFUYWNBmK7/syAygnVgDAHdItexyBzRdH/FL3/oVCoh1F9ha/aZYUTin/3R
         wedeZgdCu1kx8ntLUVVHoyAxqi+YTU0UNgcskFltiCk48e+zxbDcSEVETAFG0MMftuq/
         7xAMgdX9vO+76+ToMeN7xU0D+nBzz+xcVxK1BiPn1yXzqznatxorF/fbA+NdWamO4V8p
         VqZnOkeIxsOA8zlNbwU2/smUkaDEyZZLC+TDV2pwcGc3tjtWcisT3dQv8W9fb5rMm5jl
         h38Q==
X-Gm-Message-State: AOJu0YzTQGHRsLS40jWDYFgjU0r/WUk7uzLzzqCr1dxbu/nYAIey2d0R
	LBtoOx+kTiaPWC1qeisuPnhp3w==
X-Google-Smtp-Source: AGHT+IHjRUBRVXyRnZ+t+Vd4vRUY+ElMYf8dvwLs0TWXUqfaNmUCDTl5rUS0AjGw93IobRFxjp2jDg==
X-Received: by 2002:a7b:c015:0:b0:40a:5c71:2c3e with SMTP id c21-20020a7bc015000000b0040a5c712c3emr22530wmb.19.1700587816912;
        Tue, 21 Nov 2023 09:30:16 -0800 (PST)
Date: Tue, 21 Nov 2023 18:30:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH 3/5] VMX: don't run with CR4.VMXE set when VMX could not
 be enabled
Message-ID: <ZVzpJ8Ldu3jAH2bu@macbook.local>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <d6a8ce0e-fcd9-4391-83c1-d9f709ada3f1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6a8ce0e-fcd9-4391-83c1-d9f709ada3f1@suse.com>

On Thu, Nov 16, 2023 at 02:32:07PM +0100, Jan Beulich wrote:
> While generally benign, doing so is still at best misleading.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Using set_in_cr4() seems favorable over updating mmu_cr4_features
> despite the resulting redundant CR4 update. But I certainly could be
> talked into going the alternative route.

Hm, yes I wondered the same, overall I guess it's safer to just use
set_in_cr4() and do the redundant CR4 write. It's just for the BSP
anyway.

> 
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -2959,7 +2959,7 @@ static bool __init has_if_pschange_mc(vo
>  
>  const struct hvm_function_table * __init start_vmx(void)
>  {
> -    set_in_cr4(X86_CR4_VMXE);
> +    write_cr4(read_cr4() | X86_CR4_VMXE);
>  
>      if ( vmx_vmcs_init() )
>      {
> @@ -2967,6 +2967,9 @@ const struct hvm_function_table * __init
>          return NULL;

Do we want to also clear VMXE from CR4 here?

Thanks, Roger.

