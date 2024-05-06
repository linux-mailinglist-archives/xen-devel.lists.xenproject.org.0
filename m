Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D98BCA4C
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717352.1119463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uOx-0005GV-FI; Mon, 06 May 2024 09:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717352.1119463; Mon, 06 May 2024 09:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uOx-0005Eo-Be; Mon, 06 May 2024 09:12:51 +0000
Received: by outflank-mailman (input) for mailman id 717352;
 Mon, 06 May 2024 09:12:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3uOv-0005Ei-1s
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:12:49 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce568b2b-0b88-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:12:47 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e3737697d9so7516391fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:12:47 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b0041bfa349cadsm18990477wmq.16.2024.05.06.02.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 02:12:46 -0700 (PDT)
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
X-Inumbo-ID: ce568b2b-0b88-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714986767; x=1715591567; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEh57JYKqowRxni3RBYf/sUdlKCxJ/2VHnMkJSMDgvs=;
        b=X4FSzF8j6FIco650i8r/VZLKb2AIc+GjFVYCcU0el3ISqocbwngNc4MYPJEZU45Oqg
         2ipUHk2A9ECxjbQ9jnd6SbHDT3IjRWLQkhiMJ9YDApjQasAoJVo8dIN6ciiWUPXA0HnN
         p7fbevLE+AxRaVSd6MN+/MIJYEU+5EwLKeREc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714986767; x=1715591567;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEh57JYKqowRxni3RBYf/sUdlKCxJ/2VHnMkJSMDgvs=;
        b=CAZ5ISfGK9DT81OvK0wlj0LgTXOuzuGFDSZFNFhYGUaF+McvtAbePJTHV5sbZaPcDD
         I//schaXgQOMPWL5Aejgq91jVA7COUVZDfOU0cRbw9bwX/kXYrUoodLPHMdwDT6q0Xnx
         EMS3T6QfxlCYLrouCOuojH0UIZdG8tDUUgxzlfVMUDKUdDyIzaiSDdoBoMzPvD2DsBtU
         XMQNYuXIQKUl+57uLJVBGsZFrLVl/i+uHTJ8WncYx828LJZ360HnjVXbZhYcdtw1qVd0
         WOLv+S6cLLQssG3qDPcNYH4Wc/VoH5A2qdav5XZ67m0BGa1rT/5cwMIwwmGhgx+jv5T/
         NIjw==
X-Gm-Message-State: AOJu0YyoR+XhhiBysr5EGm+V5G8ZLUT6zyIxkId9kSXCjax8seNTXOkb
	EDoRTy7yIsBUH7CKuidqD9/Gr4KLGffrySSgdN+z5xdztl302nUMeSDhM1ImhS8=
X-Google-Smtp-Source: AGHT+IHPBH82g9x76HH+l4k0wkhCuMH6VRrGNYGujzBlomAUqCiV9LWXKIMRs/z3D8HqLMUeY0sc0Q==
X-Received: by 2002:a2e:7007:0:b0:2de:883d:1aef with SMTP id l7-20020a2e7007000000b002de883d1aefmr5785586ljc.46.1714986767235;
        Mon, 06 May 2024 02:12:47 -0700 (PDT)
Date: Mon, 6 May 2024 11:12:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 02/12] VT-d: tidy error handling of RMRR parsing
Message-ID: <ZjifDsIeRseZD27n@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <97577ebf-3871-47be-97c5-8164701be756@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97577ebf-3871-47be-97c5-8164701be756@suse.com>

On Thu, Feb 15, 2024 at 11:14:02AM +0100, Jan Beulich wrote:
> It's acpi_parse_one_rmrr() where the allocation is coming from (by way
> of invoking acpi_parse_dev_scope()), or in add_one_user_rmrr()'s case
> allocation is even open-coded there, so freeing would better also happen
> there. Care needs to be taken to preserve acpi_parse_one_rmrr()'s
> ultimate return value.
> 
> While fiddling with callers also move scope_devices_free() to .init and
> have it use XFREE() instead of open-coding it.
> 
> In register_one_rmrr() also have the "ignore" path take the main
> function return path.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v2: New.
> 
> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -82,14 +82,13 @@ static int __init acpi_register_rmrr_uni
>      return 0;
>  }
>  
> -static void scope_devices_free(struct dmar_scope *scope)
> +static void __init scope_devices_free(struct dmar_scope *scope)
>  {
>      if ( !scope )
>          return;
>  
>      scope->devices_cnt = 0;
> -    xfree(scope->devices);
> -    scope->devices = NULL;
> +    XFREE(scope->devices);
>  }
>  
>  static void __init disable_all_dmar_units(void)
> @@ -595,17 +594,13 @@ static int register_one_rmrr(struct acpi

register_one_rmrr() could also be made __init AFAICT? (even before
this patch)

Thanks, Roger.

