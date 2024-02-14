Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DD08549BF
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 13:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680727.1058806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEmr-0003bZ-N7; Wed, 14 Feb 2024 12:54:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680727.1058806; Wed, 14 Feb 2024 12:54:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raEmr-0003Yo-JO; Wed, 14 Feb 2024 12:54:53 +0000
Received: by outflank-mailman (input) for mailman id 680727;
 Wed, 14 Feb 2024 12:54:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raEmp-0003Yi-IL
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 12:54:51 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d3d227b-cb38-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 13:54:50 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d0d799b55cso68004141fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 04:54:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b0040ecdd672fasm1951305wms.13.2024.02.14.04.54.49
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 04:54:49 -0800 (PST)
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
X-Inumbo-ID: 3d3d227b-cb38-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707915289; x=1708520089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nGc33uiEkM41QRyRyElvnJ93fT7k0IZrbbvFNTqVG8=;
        b=UnWMWT2MAAvg++1t/JJPApbbRtqLZlQchQ5w/FB5jwd5d1NppE0p6iM0dFj1PS9ReF
         /D3P0jQoTvxfKozpwDRp/tneFHKY6JcTMxbxneiGcF2yqeEVini18cxdE1lkzVYuEW9y
         7SOQ6wZazBUKy9Sc4fvGuCmXDX4oKTqUB87RZyh9S5zCxKWB3ZSNPFNNOfmWWJTt+xNv
         yrc899NMm45kbRsVyCKd3zDxKyQAzBPEPHRmWGIAElSMbZyBOrpz88YjtmgJpCrmfB2d
         vWVHNMZmAjGNgrj5m0WKTe4rhtNMVsxfNMIvfdDNa7ysXiR682HaiHaRJfksH8PuYQe8
         c/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707915289; x=1708520089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nGc33uiEkM41QRyRyElvnJ93fT7k0IZrbbvFNTqVG8=;
        b=FFrwv5gNthWUErIS/YL9sREvn/SkZk+cjUFsIui4pHQr2Bz2C1OTaNf6ZtC8wW6Wwi
         WU8E85VRU+OGUmD+Stzn9cuqPW2TXoeoEQlmqPRmu8bN4FPMFssx7H83tyQ0oEAgo8Ot
         tAv7fXx63pctinW80M3qr9TiP5vXN67FqPvIW6byPlw4lxMmdmMFZm2tkI7ZLYi8mgqn
         4cKwBou6vH+bLqtzUN/fBjqds+0z6yYE8+dkaZ3T0JDj7vI/TfhOUY/aUncGL9my3/js
         b67ylESLWOZq2yD5UoFgvMhxdJdi+6RXXODolKIPia44VXsUAlrKfiPZnSaPt458COed
         vqiA==
X-Gm-Message-State: AOJu0YxNUqo5Euqbu5Wr6sCj+C458QVakSxzqeY3W/gqVmVy2JqEJ3gE
	KJ+MPh2pMrLhjw9TdOMzRhOtAl1KEt3nkrQZah3GcM27dgNKNshD91cggVyLIvXoBR+9CHUf6UM
	=
X-Google-Smtp-Source: AGHT+IHHjOGUJLNnpIg4wkrzXEXBnk8IrLSTpeoy2+hNtpJz2R5NBfFWLzOVMhayeKREwo1FJXvq1w==
X-Received: by 2002:a2e:b0d2:0:b0:2d0:c1df:b4df with SMTP id g18-20020a2eb0d2000000b002d0c1dfb4dfmr2213413ljl.39.1707915289652;
        Wed, 14 Feb 2024 04:54:49 -0800 (PST)
Message-ID: <12ce9813-d9a3-4770-b7ab-a5ccfef65b23@suse.com>
Date: Wed, 14 Feb 2024 13:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | d670c1a3
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65ccb539c5f56_2c88e1496072@gitlab-sidekiq-catchall-v2-5d948c44f-qdsrj.mail>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <65ccb539c5f56_2c88e1496072@gitlab-sidekiq-catchall-v2-5d948c44f-qdsrj.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.02.2024 13:42, GitLab wrote:
> 
> 
> Pipeline #1176167215 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: d670c1a3 ( https://gitlab.com/xen-project/xen/-/commit/d670c1a38ba3561296f68c0079209365760b3001 )
> Commit Message: libxl: Fix comment for LIBXL_HAVE_VMTRACE_BUF_K...
> Commit Author: Petr Beneš
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1176167215 ( https://gitlab.com/xen-project/xen/-/pipelines/1176167215 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 1 failed job.
> 
> Job #6169539038 ( https://gitlab.com/xen-project/xen/-/jobs/6169539038/raw )
> 
> Stage: build
> Name: yocto-qemux86-64

Hmm, pretty odd: Dom0 crashes during boot with

[   10.642958] segment-related general protection fault: e030 [#1] PREEMPT SMP NOPTI
...
[   10.642958] RIP: e030:native_irq_return_iret+0x0/0x2

when E030 is also what's reported to be in CS (with the RPL bits stripped
off). According to the stack trace it's in the middle of applying
alternatives, with xen_irq_enable_direct() also on the stack. So maybe a
badly timed interrupt that normally we get away with?

Sadly modern Linux doesn't dump raw stack contents by default anymore, so
it's impossible to see what exactly was on the stack, for the IRET to
consume.

Jan

