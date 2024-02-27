Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2E0869164
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 14:09:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686130.1067685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexC2-0002UI-Od; Tue, 27 Feb 2024 13:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686130.1067685; Tue, 27 Feb 2024 13:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rexC2-0002R8-LW; Tue, 27 Feb 2024 13:08:22 +0000
Received: by outflank-mailman (input) for mailman id 686130;
 Tue, 27 Feb 2024 13:08:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t50j=KE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rexC2-0002R2-0H
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 13:08:22 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47d842a4-d571-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 14:08:20 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5101cd91017so6257032e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 05:08:20 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g3-20020ac870c3000000b0042e390c9804sm3558972qtp.6.2024.02.27.05.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 05:08:19 -0800 (PST)
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
X-Inumbo-ID: 47d842a4-d571-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709039300; x=1709644100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkaJ7r516jVfdhjRuJVqlCumeVhhVzku00X2uXxLS2M=;
        b=hoKQpBivWdprS+wx6ZnIPABM0I9RlldUxuTQ9aI2uCrrdyXEKJkEJkHdqwU45FdTD6
         iPj4jHVKFwgeDOZ4tppwVvs6/uaNUiuL/VY3ekA4dqDIhxryMsRvDfnIrfL4WrKx/GXp
         /8jKIi2tC8tpvRx6juN9V8t6YZWju/Xq6BVko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709039300; x=1709644100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkaJ7r516jVfdhjRuJVqlCumeVhhVzku00X2uXxLS2M=;
        b=S24JDJ5voBF49bTHNlntj1dlp8fKfStWDxhaOpkUEDMzyqB3B1tFqKEPXWUkR5bR6x
         6XuW0MrDP7KJ25eilADcYji9Y+Lt27Yd8ZNMdt6UCEuuCraEl8pgpjMysqSbT2mef0rn
         P9jXWiEmdXYUeOiZzrQeZJBdcyuoYqQyqpTbPLjPQH0Sn110b2aKA6FLBu64UbHD8WDM
         Xohj4vEwtVPfKqRC83nxd74s97tK6cV9UgNPFe43LSe+9Fv5ylqrvfLwsk5CfIoBQeF/
         3pJ35qlsRDatTJrGxng+oj6tiJpq/TUJ/jC5uzSBwI7OAwG4VxqG+vJ9F6c6kVNh4HDj
         ML9w==
X-Forwarded-Encrypted: i=1; AJvYcCUNHp75YNIXFOM6wiqArH31qgkMOgBP9EL78K9CX6qHFNKIJ4U+HrhzFnWZOWtQ5gugg3DRcJeZV175E/HxcFRNrajG9/m3yfLSHNW+GWk=
X-Gm-Message-State: AOJu0Yw7QYHjoNajI2kE+RmOc/t5Qf1Tcebf1TP/UhQ+zPSjY/+65Y6+
	lNr8Z6sP+pEYu+YAJMvlZN1xjU9vD0jZB0jUhX7BVrFLZ9R/S2YsRj2j6VI5YyM=
X-Google-Smtp-Source: AGHT+IHqflKF5cpkhYDSsLM9AxUlYDbC4toFRRN2pDfdKGUxSwtG9RmVlgkl1ifH4xFJ5aq2VPVh9A==
X-Received: by 2002:a05:6512:10d2:b0:512:e00b:8da4 with SMTP id k18-20020a05651210d200b00512e00b8da4mr7363773lfg.53.1709039300335;
        Tue, 27 Feb 2024 05:08:20 -0800 (PST)
Message-ID: <e8ffdaa2-0786-4f9b-b4c4-03fe88e5c72b@citrix.com>
Date: Tue, 27 Feb 2024 13:08:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] xen/livepatch: register livepatch regions when
 loaded
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20240227112528.4540-1-roger.pau@citrix.com>
 <20240227112528.4540-2-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240227112528.4540-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/02/2024 11:25 am, Roger Pau Monne wrote:
> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> index ddac5c9147e5..e3a4dc8540df 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> <snip>
>  
> +#ifdef CONFIG_LIVEPATCH
>  void unregister_virtual_region(struct virtual_region *r)
>  {
> -    /* Expected to be called from Live Patch - which has IRQs disabled. */
> -    ASSERT(!local_irq_is_enabled());
> -
>      remove_virtual_region(r);
> +
> +    /* Assert that no CPU might be using the removed region. */
> +    rcu_barrier();
>  }
>  
> -#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)
> +#ifdef CONFIG_X86
>  void relax_virtual_region_perms(void)
>  {
>      const struct virtual_region *region;
> @@ -117,6 +106,7 @@ void tighten_virtual_region_perms(void)
>      rcu_read_unlock(&rcu_virtual_region_lock);
>  }
>  #endif
> +#endif

Can we please have:

#endif /* CONFIG_X86 */
#endif /* CONFIG_LIVEPATCH */

before this gets any more complicated to follow.  Can be fixed on commit.

~Andrew

