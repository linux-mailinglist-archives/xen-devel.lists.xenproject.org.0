Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28981B0EBAA
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 09:19:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053364.1422124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTkc-00062H-UD; Wed, 23 Jul 2025 07:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053364.1422124; Wed, 23 Jul 2025 07:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueTkc-00060E-RW; Wed, 23 Jul 2025 07:18:54 +0000
Received: by outflank-mailman (input) for mailman id 1053364;
 Wed, 23 Jul 2025 07:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT0Q=2E=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ueTkb-000604-Pj
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 07:18:53 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49428c1f-6795-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 09:18:52 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso64903935e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 00:18:52 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b61ca48a2esm15543539f8f.51.2025.07.23.00.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 00:18:51 -0700 (PDT)
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
X-Inumbo-ID: 49428c1f-6795-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753255132; x=1753859932; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L7xcIR8dg322K1LywMXoxBZ/t9INpyGE6/xxeIsYTU0=;
        b=OVQlH7x8h9/HCwdcFsW87WBFDnmOIz6CExJyRsAnsocu+982HIDhVIrEY2fm5xld0x
         rHfGDF07rhFggJ1PFNJIfZxbAk+WsnXnlUPi3kQ2i0hT0jWhihXsoMjOSLZMv4pYMV/B
         hWgXWkMfYeSyqjERioqxBYF0nHF45M8qpwT9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753255132; x=1753859932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7xcIR8dg322K1LywMXoxBZ/t9INpyGE6/xxeIsYTU0=;
        b=OI0q6HfohDcWS8vPQPdeMOdOR9iGmxPZdPRmhf3PkosXyEiwyeed55Xp/TflODW0xo
         hiAdMMcDnduLSroxLiUrNNDyvZMhf5vxmvoVIu3MfE64pRdrZ4+JzeQykLH7R3WC1dgE
         chZUZfU4HLf/WzAfkdUsDqiQLpBKcSEaQLcTLlPVImL+SDeep6qAKCLV884/8bLrrEBj
         jvlEM4Ba2d5JfYJofdXsVUFdpP//loT3XjqNRQM/yE/2T4SpDq0woSHcpa1KGtZNZKzq
         YnWJvOBFKqRXiB1GsPP2lf+9hYfJvPhiI+XX9epcWDGj3JncgiIoHsxCBrscjImu34ku
         iCEg==
X-Gm-Message-State: AOJu0YyspQCcwIi6g7X3ahEqToG2pTzS79q2opU84fKho/boafISU0Ni
	NMvR3J4zDbXFA6TdHVEnT1JNUZHlYs9KbDoCnKMReQ4IqNr9Ur+ZthyPrnKqAUj9ab0=
X-Gm-Gg: ASbGnctZgI2JYMQSGBzDjAgmXMHMbjueGUSSe+vOWwhmURUlfKmfMivrq0ArLiI5DIa
	J/d0cADEPt02V3sGG8CqKzYcjZHwYVa/WKvBOQD7EwPyJuHMB7ctknRoZfO2/lsq2qbAiwp8a+W
	G25p8nPYXThkcxmlcymDIp138lekUOFo66L40HxPVkIIDw4GdSh41ZawYzCku7hGJlbhObFEEh/
	YkzV/aau5D0IJEUevM8zz+2AWsSce7RBahwmN9ILGAbqSsbsy6HTCQcbHbKeQ7MMJvVobPq3J5r
	TdoE8+u6KQ181tJ9KwUiKg5Do6+uVicI3+jCaKVeqlhUt8lGI8kDj5JXlvbDnXvRxGwEN9M6OzP
	9uMjFO7x7lLSe/YXKBTyb8p46zDC5wvEnIfaw7xceBEzPtfJujyFx1cS1OXjcQBRl1Q==
X-Google-Smtp-Source: AGHT+IFx7rKM/nv53my1VRd0ElhOEjhOLQAxlHmbhDael5jupKLAHKWITe54fFcf7R5s0bSsU5WjBQ==
X-Received: by 2002:a05:600c:46cc:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-45868c8fa41mr11812575e9.7.1753255131939;
        Wed, 23 Jul 2025 00:18:51 -0700 (PDT)
Date: Wed, 23 Jul 2025 09:18:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
Message-ID: <aICM2hqQoloEahgD@macbook.local>
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>

On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
> Later patches will keep refactoring create_dom0()
> until it can create arbitrary domains. This is one
> small step in that direction.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>  xen/arch/x86/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index c6890669b9..6943ffba79 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>  
> -    init_dom0_cpuid_policy(d);
> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )

You possibly want this to be:

(d->cdf & (CDF_privileged | CDF_hardware)) == (CDF_privileged | CDF_hardware)

To ensure the contents of dom0_cpuid_cmdline is only applied to dom0,
and not to the hardware or control domains.  I assume it should be
possible to pass a different set of cpuid options for the hardware vs
the control domains.

Thanks, Roger.

