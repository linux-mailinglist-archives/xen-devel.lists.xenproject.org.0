Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB36976698
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 12:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797246.1207141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogvn-0001yH-FA; Thu, 12 Sep 2024 10:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797246.1207141; Thu, 12 Sep 2024 10:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogvn-0001w2-CX; Thu, 12 Sep 2024 10:20:07 +0000
Received: by outflank-mailman (input) for mailman id 797246;
 Thu, 12 Sep 2024 10:20:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sogvl-0001kl-DN
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 10:20:05 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93139154-70f0-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 12:20:03 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bf01bdaff0so896886a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 03:20:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd4679csm6337617a12.32.2024.09.12.03.20.02
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 03:20:02 -0700 (PDT)
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
X-Inumbo-ID: 93139154-70f0-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726136403; x=1726741203; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jWZOln5xThvtdF1LcdgOh7U+1c58bXMLBHMANtyC22U=;
        b=YqrgkBhiv7FomBhZdwmGQrvwsuoyyOq/Qvn/Pxlbbrr7hTsG1IfI12gnqwMyrKHwsU
         TKXlm1NfaY5Znp29OGJ//gAqjD1E+UlZyx88eXbiUabC2mX7JXP4uAi8O/8xt/PruGmG
         msmzPtdga54DAr2R2Z9oZiUuhohvhd39TezK02iUEDv0SLD+qPmdNrEXapzixTv0JW5+
         cRnz5p9dCaGiL6qPzW6T4Ez5dpqdVggUv+cA4IFiF5IlhY51zwOP7uCCuvcg2l/N6++R
         s9PI+yBq4yfQDCGP2aQl8la75ZJjNVme+kBTbB2iyS1WuR4zdI8q1HG1tbYb6QCYnEqD
         2dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726136403; x=1726741203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWZOln5xThvtdF1LcdgOh7U+1c58bXMLBHMANtyC22U=;
        b=hHsUjFamz1v+ROypY4s72C8c46z6fqZR5r43tbcD92Y3It+v/zRmLI+diUPe1DRRqB
         a7tjP51c4H2YfohBTTzRf3ZEccBIkJM0GrUijuhXPIzGDr0eZGE5z1fpWkTAflK0A4lr
         Fc6vr/OibPwaZuixekyjeM6d78MXWQ5uFMdvONqgwqO+haA8mal56y6mbsDAgkJeKqUu
         7fdNHSoOtvAhoBq6ehgv1+KulXT88347V5GRm7PZPZvqmOs7ov+vj3N4TMOdagzA2G0X
         t9xZWvgBGYTqshcph7vgmsSIorK7/4o40ey/4rK/A9fOufbfUOZ+gpf/5jKCejKBrRRr
         tVOA==
X-Gm-Message-State: AOJu0YzyfEGRG32XpBV+DyLhC2gwGUt2VQ+6bY5g3CtLwWhr1nOdK2lA
	DrcUxU7UHkFuK3DlJy+hAYHO5cm4Le08qHCXy9ji2ux27eQa4e5VNKf9zFq68e7spkfFb3PhJuE
	=
X-Google-Smtp-Source: AGHT+IEqDv/gxPwNRv46fEfSQfgK7mCfyk4A6lxKOAUIsWSBRMLOkJF1nNtiEVEYXjxeq+5oi4sI3w==
X-Received: by 2002:a50:cbcc:0:b0:5bf:afe:6294 with SMTP id 4fb4d7f45d1cf-5c413e207d8mr1493454a12.17.1726136402716;
        Thu, 12 Sep 2024 03:20:02 -0700 (PDT)
Message-ID: <c964c7f1-8953-4b18-b67a-6ab3d9c3a2c6@suse.com>
Date: Thu, 12 Sep 2024 12:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 6e7f7a0c
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <66e2a27042b52_2fc0cec83515@gitlab-sidekiq-catchall-v2-74cb86846c-gh22d.mail>
Content-Language: en-US
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
In-Reply-To: <66e2a27042b52_2fc0cec83515@gitlab-sidekiq-catchall-v2-74cb86846c-gh22d.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 10:12, GitLab wrote:
> 
> 
> Pipeline #1450299635 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 6e7f7a0c ( https://gitlab.com/xen-project/hardware/xen/-/commit/6e7f7a0c16c4d406bda6d4a900252ff63a7c5fad )
> Commit Message: xen/x86/pvh: handle ACPI RSDT table in PVH Dom0...
> Commit Author: Stefano Stabellini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1450299635 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450299635 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 4 failed jobs.
> 
> Job #7805959443 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959443/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc-debug
> Job #7805959441 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959441/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-gcc
> Job #7805959427 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959427/raw )
> 
> Stage: build
> Name: ubuntu-24.04-x86_64-gcc-debug
> Job #7805959253 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7805959253/raw )
> 
> Stage: analyze
> Name: eclair-x86_64

For this one I'm afraid I once again can't make sense of the artifacts that are
saved. That is I can't spot what failed, and hence what may need adjustment in
what was committed.

Jan

