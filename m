Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7F9EE408
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 11:24:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855667.1268508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgMX-0003CB-4q; Thu, 12 Dec 2024 10:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855667.1268508; Thu, 12 Dec 2024 10:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLgMX-00039D-2C; Thu, 12 Dec 2024 10:24:05 +0000
Received: by outflank-mailman (input) for mailman id 855667;
 Thu, 12 Dec 2024 10:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLgMV-000397-4M
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 10:24:03 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31650407-b873-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 11:23:56 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3d143376dso577544a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 02:24:01 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3f4ecdd02sm6170212a12.81.2024.12.12.02.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 02:24:00 -0800 (PST)
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
X-Inumbo-ID: 31650407-b873-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733999041; x=1734603841; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhJXeRLyiJKXQgxd0Ls1ZxBZm8Jk6VnGD8JsOnPnRQk=;
        b=CGQn7DQIHnawLU5GooekUEhcbv40yL2yT6/ByvISMvYulBbeSx+1E7va4Cd/pwMOts
         mBINIhUPE6jCmlH074UrLdgBvPfXJZVzWN91OtP1V0UslHdEfL3+Ws4TfbbHpoj1XXUN
         R2DTqXz2eM+gbrtgt2nZ+ww3iqCJgUtWlLfz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733999041; x=1734603841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhJXeRLyiJKXQgxd0Ls1ZxBZm8Jk6VnGD8JsOnPnRQk=;
        b=tKgt50WzVATaxV5Upwq/bz+h3QSek//eJSuCUfNSMLfCw20XKQCG2BaADGiau3mmiT
         +WWd3XqbxKzMdsxm7TW2LlrFcFJPXRDfJGl3rzUQS/2zes8Qgdu9PFPDVU6mBSl097tM
         zPP0SOyP9zfLNkNilNtOoxmHPYwQOiBIGoJHBecAcyLezur4QZ+0X383LIjZWEfvpUY5
         K9BrYG+M8cGacdBGOwSaZCz559yShdKO+6Xoe6NDOJslSGzC5cvmUq2luxTEQg5Shhu2
         SOqh2Nw+dJMledKD6dv1dUC4X6JbZlwFMJCvOKCSXfJT9YT0LhCfnnSu61U7b1hR3Xnd
         CmwQ==
X-Gm-Message-State: AOJu0Yw7jBblwaMcf74IRAf5cvwlD9i9ff0zijkFby993ttTPmbB2XW5
	JRdRBDtChEst7ohQaIma/o0nldoGwf8DqCXDRxqktj6O99VovDU4sPW/2ASO688=
X-Gm-Gg: ASbGncuvH+A60tSFcUMSSXRCCFnheK7dXUXGb385XMgkWn0bDdlIpBC/GKZe0ge2Hv/
	shMZGLUPLXa4onCTBUpQH0s6wyhTjKfY6HT+6tTVhf0XKtR+oDsTqsgkPWoS7XLag5OMnWimEEv
	iZeBByy/RHNGvqlodP9d24skP22LM7otgf4nZOXRUI6o1EMX9EuTp3/yW/DRJFQxUn8ysFw/xNq
	WIHDmiVjIraYtNIumNMnyr4XjL8c/pCxdfKKDx7fOgg1tnKPr21yJNtPNyo11dtTA==
X-Google-Smtp-Source: AGHT+IGvstdDiL2qxZR52qksPJ92TafMAuwpIUv2yiVQauGoJmQ5tFbJ5kqDHSCapRZqWDaQmcFrtA==
X-Received: by 2002:a05:6402:26cc:b0:5d2:7199:ae5 with SMTP id 4fb4d7f45d1cf-5d4edcce2bemr436467a12.5.1733999040654;
        Thu, 12 Dec 2024 02:24:00 -0800 (PST)
Date: Thu, 12 Dec 2024 11:23:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 21/35] xen/console: introduce console_init_owner()
Message-ID: <Z1q5v3XkBo1VxT4p@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-21-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:51PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> console_init_owner() is introduced for selecting the boot-time console owner.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/drivers/char/console.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index a8ab5c2bcb98e4cadf9ad2c9ad28d297977d0557..6261bdb5a2ac1075bc89fa408c0fd6cfef380ae6 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -554,6 +554,22 @@ static void console_find_owner(void)
>          console_set_owner(DOMID_XEN);
>  }
>  
> +static void console_init_owner(void)

__init attribute missing (given current call context), but see below.

> +{
> +    domid_t domid;
> +
> +    /*
> +     * If user specifies so, we fool the switch routine to redirect input
> +     * straight back to Xen.
> +     */
> +    if ( opt_conswitch[1] == 'x' )
> +        domid = DOMID_XEN;
> +    else
> +        domid = get_initial_domain_id();
> +
> +    console_set_owner(domid);
> +}
> +
>  static void __serial_rx(char c)
>  {
>      switch ( console_owner )
> @@ -1143,14 +1159,6 @@ void __init console_endboot(void)
>  
>      video_endboot();
>  
> -    /*
> -     * If user specifies so, we fool the switch routine to redirect input
> -     * straight back to Xen. I use this convoluted method so we still print
> -     * a useful 'how to switch' message.
> -     */
> -    if ( opt_conswitch[1] == 'x' )
> -        console_owner = DOMID_XEN;
> -
>      register_keyhandler('w', dump_console_ring_key,
>                          "synchronously dump console ring buffer (dmesg)", 0);
>      register_irq_keyhandler('+', &do_inc_thresh,
> @@ -1160,8 +1168,7 @@ void __init console_endboot(void)
>      register_irq_keyhandler('G', &do_toggle_guest,
>                              "toggle host/guest log level adjustment", 0);
>  
> -    /* Serial input is directed to DOM0 by default. */
> -    console_find_owner();
> +    console_init_owner();

Oh, so this is what fixes the regression introduced in patch 19/35.
THB I'm not sure it's worth introducing the console_init_owner()
helper if it's just for this usage.  You could do:

console_set_owner(opt_conswitch[1] == 'x' ? DOMID_XEN
                                          : get_initial_domain_id());

Thanks, Roger.

