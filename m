Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA9978037
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 14:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798163.1208277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5Z6-0007zJ-Co; Fri, 13 Sep 2024 12:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798163.1208277; Fri, 13 Sep 2024 12:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp5Z6-0007wn-9p; Fri, 13 Sep 2024 12:38:20 +0000
Received: by outflank-mailman (input) for mailman id 798163;
 Fri, 13 Sep 2024 12:38:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sp5Z4-0007wh-Mz
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 12:38:18 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cb181c9-71cd-11ef-99a2-01e77a169b0f;
 Fri, 13 Sep 2024 14:38:16 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso19289345e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 05:38:16 -0700 (PDT)
Received: from [10.239.240.84] ([88.128.92.31])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956654e8sm16814594f8f.41.2024.09.13.05.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 05:38:15 -0700 (PDT)
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
X-Inumbo-ID: 0cb181c9-71cd-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726231096; x=1726835896; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyjIXzBLveMcRv44JglLndHsUulik8W4I7pqy5lgQ+o=;
        b=OS+6W9Ag+6vnvBdu9Kjji1OOdfozy7Jwef+3s9woy6d7PHtVGtdkHInto1QcXEiNlK
         X6W53aEdlqaQLdvBydWJev4nG3TEW4LtLqPKfI3EzxYrLlB8q6trNQFmQbSjPXeUpmhq
         kvYWEbFlRetxvamPp7jzTChqGCmFPq1Su0wK9HzxdFqhJuN2+TLL4GFu47ed5XnG9yoo
         29sjWeqjJx7zt+jdlfBDdKCNaDyZp5MklWQMa/4wFsUXl6wrdaJPmVfD0VrQ7sTIYCZ2
         M6FUpSF48sWt34IQANu2VccjvSHW8bRFc/+P+PfbvxCQgVIgfWe8nTq0+H1WV+LvVUYF
         zt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726231096; x=1726835896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyjIXzBLveMcRv44JglLndHsUulik8W4I7pqy5lgQ+o=;
        b=KLXK0XtXujMJ6Fge7H84Yy16kIUjK7KCXiabVCk/zJtzaWPbYmGNklbD6l9VXtuDge
         h7mJl5V+QWxiCyG+xK8thn2fCq5syfw14eF2tdMr/37BJsKgHCtX03kqIgGxgGXDXFhU
         lOx38wIDcpWwk5ed3J5j939dF/+r+m4OquMG3CJmbbDBIDkclYMl/gPN1cp8jP3/WGIK
         rqVfFL/HvaWuT00F6Ewb317M58y/eEHz1xoE/AT6cq0Ygz6UcUsKAAOp6w1cVYsGCemA
         sgtdzH/Izd7aiEEOSAs0dk4ypz3rI1IpXXmPm4QpyBxGmZ1vaPuXPbGBfAEzRY/8QY5p
         RVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfgKUjxQxkFcjNd+6m8nrMmw4YB1H+3EDqAErUoPV+NfQkYQMZP5wV5f6r7eIJKCZDWFCBlvhSn5A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwFTedL9NXhnc7/6TTO/CyzbHsDHrbbznPZz2vUkP71sQTi1WL
	4cj6ArMY3cKdx90E9HxwYGMXtXxXZKCzvN4R9Tw2K/ZLlkV6UtZgYtBKsAIVfQ==
X-Google-Smtp-Source: AGHT+IGv/RrPMoK49T9S2CXZS05HOqlU1RJ6d0r0gDIRe4sEwCLoUiLb3Wj2lhexy49M136t4zh2rw==
X-Received: by 2002:adf:a3c6:0:b0:371:88b9:256d with SMTP id ffacd0b85a97d-378c2cfec17mr4469126f8f.6.1726231096094;
        Fri, 13 Sep 2024 05:38:16 -0700 (PDT)
Message-ID: <bc713147-3235-4151-8026-1c922e871755@suse.com>
Date: Fri, 13 Sep 2024 14:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240913075907.34460-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 09:59, Roger Pau Monne wrote:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_string(void)
>      return "";
>  }
>  
> +static int __init cf_check parse_wallclock(const char *arg)
> +{
> +    wallclock_source = WALLCLOCK_UNSET;

With this ...

> +    if ( !arg )
> +        return -EINVAL;
> +
> +    if ( !strcmp("auto", arg) )
> +        ASSERT(wallclock_source == WALLCLOCK_UNSET);

... I'm not convinced this is (still) needed.

Jan

