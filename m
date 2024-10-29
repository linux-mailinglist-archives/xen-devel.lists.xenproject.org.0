Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846C9B5172
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 18:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827786.1242500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qTC-0003ew-W2; Tue, 29 Oct 2024 17:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827786.1242500; Tue, 29 Oct 2024 17:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5qTC-0003cn-Ry; Tue, 29 Oct 2024 17:57:30 +0000
Received: by outflank-mailman (input) for mailman id 827786;
 Tue, 29 Oct 2024 17:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGhd=RZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5qTB-0003bm-DP
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 17:57:29 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fea534f-961f-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 18:57:23 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so15465666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 10:57:23 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3099ddb9sm501707866b.173.2024.10.29.10.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 10:57:22 -0700 (PDT)
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
X-Inumbo-ID: 3fea534f-961f-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNmZWE1MzRmLTk2MWYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjI0NjQzLjM4ODk4OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730224643; x=1730829443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SGquy4qsXIxlXzEhgck8ihfwMyUIyyJLzuYFK7f66PQ=;
        b=tDHcpF1HRruyOL94xwIIMGEaHQg4GIm38bckj1hLDbg36lzsZKULxn7H0c/M6FuXLe
         FV7pu9K2Y6M0ieGc8caldsUkCNhr5oaCayfBkTBiZi7uvB0dau/QYqjr30XRcQN3Jpry
         9U53e0sBaDl+tw3ljlFEHIsEIC37XUMNAluDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730224643; x=1730829443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGquy4qsXIxlXzEhgck8ihfwMyUIyyJLzuYFK7f66PQ=;
        b=GeimVOLKs9gFPm7lx7tjuPVJYiu8dSh6lxlZ0OvApiWcjbFiS74e1BMw7x52Hg4hwx
         RQrkkyVutMBkvNvdmmV4QzU/34xgkI34xR5wZ5dvJfwIkpFwka+FMqi0sbB+J7fKv/EX
         ZMZrhQ55DekfbJzlvnsc0repZk6DLW1BpDiSNXrTD+QWDq+MBdYvH8gwhAA6rVo4COEj
         FjILakORBz6QojXw9a2yy1l5RG3rOuEdbQyuKt01vUkYPvCATe3W6SraqcdvGB07dA7P
         wUyQIHDHzwCWklzRoLZvhBY3NSKK3IvawqFFifIwktI6CVy1Cn5M26s0KX8YdBVn3G+c
         fpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnK4WeN6RjqNLh2qlZZjjadXCZeL1NnoIXuqJqU5dyV0lGg1oYDFFm3wHmHTeVxgU/3OrqlTma90A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yygy+NH3lIugX3x1j/H3j8f4kbS3bRdBKK/3zJMtBpznZAAOeuY
	lUrk0Bv/xQ51B0QApN9R0fo2zPb/v4NBBBR5IU4xmvIUxwAzAVRCOtiCQa4Eb7Q=
X-Google-Smtp-Source: AGHT+IGqD7qGkv75II1/XZbqnBTa+oiax+/5n9l5BuE+YuT7RKKoty75VmH2iZhh86+JHA1xWV/IHQ==
X-Received: by 2002:a17:907:8f08:b0:a9a:60b0:a8e7 with SMTP id a640c23a62f3a-a9e2b34b2d6mr233536166b.2.1730224642786;
        Tue, 29 Oct 2024 10:57:22 -0700 (PDT)
Message-ID: <f837a2db-556b-4e18-8f8a-898b6632bc39@citrix.com>
Date: Tue, 29 Oct 2024 17:57:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/10] lib/x86: Bump max basic leaf in
 {pv,hvm}_max_policy
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241021154600.11745-1-alejandro.vallejo@cloud.com>
 <20241021154600.11745-2-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241021154600.11745-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 4:45 pm, Alejandro Vallejo wrote:
> Bump it to ARRAY_SIZE() so toolstack is able to extend a policy past
> host limits (i.e: to emulate a feature not present in the host)
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v7:
>   * Replaces v6/patch1("Relax checks about policy compatibility")
>   * Bumps basic.max_leaf to ARRAY_SIZE(basic.raw) to pass the
>     compatibility checks rather than tweaking the checker.
> ---
>  xen/arch/x86/cpu-policy.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index b6d9fad56773..715a66d2a978 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -585,6 +585,9 @@ static void __init calculate_pv_max_policy(void)
>       */
>      p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
>  
> +    /* Toolstack may populate leaves not present in the basic host leaves */
> +    p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
> +
>      x86_cpu_policy_to_featureset(p, fs);
>  
>      for ( i = 0; i < ARRAY_SIZE(fs); ++i )
> @@ -672,6 +675,9 @@ static void __init calculate_hvm_max_policy(void)
>       */
>      p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
>  
> +    /* Toolstack may populate leaves not present in the basic host leaves */
> +    p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
> +
>      x86_cpu_policy_to_featureset(p, fs);
>  
>      mask = hvm_hap_supported() ?

This sadly doesn't do what you want.  It leaves the default policy with
extended limits too.

To unblock the work (which is long overdue), here's one I prepared
earlie^W just now.

https://lore.kernel.org/xen-devel/20241029175505.2698661-1-andrew.cooper3@citrix.com/T/#u

~Andrew

