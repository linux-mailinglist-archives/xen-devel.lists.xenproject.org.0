Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A84FA1B3F0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 11:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876652.1287004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHHx-0003fw-Se; Fri, 24 Jan 2025 10:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876652.1287004; Fri, 24 Jan 2025 10:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbHHx-0003dt-Q8; Fri, 24 Jan 2025 10:51:49 +0000
Received: by outflank-mailman (input) for mailman id 876652;
 Fri, 24 Jan 2025 10:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbHHv-0003dn-V8
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 10:51:47 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fe2fa41-da41-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 11:51:39 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2163dc5155fso34667205ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 02:51:44 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ac48f6ad41bsm1333864a12.17.2025.01.24.02.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 02:51:42 -0800 (PST)
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
X-Inumbo-ID: 2fe2fa41-da41-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737715903; x=1738320703; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDtClwP7DW8w5GNJ/nJqxtLOtzp1/CM3PkwPFbvsfl4=;
        b=jT6mn/i13a74Iw4KXAx/DNFng/X7DBzq7kpITjOxmEKgGyjJzJtTnNMJnnJK4bJnB4
         TINuqKOhF4udW5I9OgJZMJDRJopXPm06V0KXKjSdN2IEzACZRvCdIlpqAzoVG9JMV6sO
         97sD56YrU3N9kzkUx+7BOTgF7FPd30tyzqVfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737715903; x=1738320703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDtClwP7DW8w5GNJ/nJqxtLOtzp1/CM3PkwPFbvsfl4=;
        b=KtKNUXWVDfSbc75Myw0L+L24wAnHMyPl6grB3x06N+t8Utz/ajuJq2JZA28BbhXGo0
         9rFKEKkYK8J80A4YTde8LO8hpe+9IWvDmGZ+AkNR/7LipYPI5dg2JBlc1XPSXdZtD7My
         i4q+CQ1Dmjz5rS7NQugr6gw1YMxirqShUbr1fpNjfXC07pAlBj346xqNIVnTZqIn0gzu
         FNOnhCuXD9fSVGHA9iN8OV6Z2iGSaQLm2FQO25mSuE44qSR4IhmIvvivdAXsGymxG+8A
         qrVoCDqYW+azwIV/MKuU+NTrCznsU7F3aC5uDxARq2Zi4m8Tz7iqzO6Pn70NAWzPB2OI
         8cag==
X-Gm-Message-State: AOJu0YxTVBaH2bG13+TcUNeskcfkwA38HBBFz4JFlJ1FDwWlVU2Vxypv
	EYHeqN6aaey+8ayjuiCgwhbV18ZlP4e/PKwNMNlDdsSRKao4fLeH48jViZVM3aAvHJ3kPi0FoDP
	I
X-Gm-Gg: ASbGncveI0wuj8WkmeeO84HpxFHOowSLw5OPId0/gP1/U4VRJ6wLRFOuoiVDcIiM9wK
	oQJqijvWh2XUJjUTIlvX9taTXz8SCi4RtRTcyXuhWgP7k0xj623L7e2Vs7ecgjPLoZciPqSZwM9
	rhx70td2CoCWnHnUw1GPF4b2pbwIi1nidwYJFWcshVr1SJZsG927I/paprSIinGDsm6ycCAcRBF
	dcQlt4s20RW8cT43uDMHl9Bw60WdjGQAIFa9kQjkScam51afXpTLXRx+b8u1/n122uXmXaVwJ4s
	943f1VakXdjR4T0=
X-Google-Smtp-Source: AGHT+IFr0K3iNOCp39sFX9oOT8FBO7sS/CxnPSoh6pKefIEhPowRohWXAJyH8sgkyMDzaMmzgxcuPw==
X-Received: by 2002:a17:902:f78e:b0:215:a05d:fb05 with SMTP id d9443c01a7336-21c355dcf9emr462940775ad.32.1737715903012;
        Fri, 24 Jan 2025 02:51:43 -0800 (PST)
Date: Fri, 24 Jan 2025 11:51:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 03/12] VMX: drop vmcs_revision_id
Message-ID: <Z5NwuaCBm4vxATUu@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <7a4ec627-f801-409b-995e-42732970e47c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a4ec627-f801-409b-995e-42732970e47c@suse.com>

On Mon, Feb 26, 2024 at 05:42:50PM +0100, Jan Beulich wrote:
> It's effectively redundant with vmx_basic_msr. For the #define
> replacement to work, struct vmcs_struct's respective field name also
> needs to change: Drop the not really meaningful "vmcs_" prefix from it.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -175,7 +175,7 @@ static DEFINE_PER_CPU(paddr_t, current_v
>  static DEFINE_PER_CPU(struct list_head, active_vmcs_list);
>  DEFINE_PER_CPU(bool, vmxon);
>  
> -static u32 vmcs_revision_id __read_mostly;
> +#define vmcs_revision_id (vmx_basic_msr & VMX_BASIC_REVISION_MASK)
>  u64 __read_mostly vmx_basic_msr;

__ro_after_init maybe while at it (and then uint64_t also)?

I would place the #define after the definition of vmx_basic_msr, but
that's just my taste.

Thanks, Roger.

