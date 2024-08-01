Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC375944CF0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 15:16:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769746.1180642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVf9-0006MO-Q1; Thu, 01 Aug 2024 13:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769746.1180642; Thu, 01 Aug 2024 13:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZVf9-0006JE-MY; Thu, 01 Aug 2024 13:16:11 +0000
Received: by outflank-mailman (input) for mailman id 769746;
 Thu, 01 Aug 2024 13:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZVf7-0006J8-LH
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 13:16:09 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368046c1-5008-11ef-8776-851b0ebba9a2;
 Thu, 01 Aug 2024 15:16:07 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7ab5fc975dso628301466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 06:16:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb021asm896516466b.188.2024.08.01.06.16.06
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 06:16:06 -0700 (PDT)
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
X-Inumbo-ID: 368046c1-5008-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722518167; x=1723122967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KIlJt0Dm6+MO9ZJxLHt8WiA1qer2aN0kK9w3KAfqEpk=;
        b=Y+gO9LLluD2Q50Pny6XOhPx6Wkkl3n7hut/FbykOiOjQ607NxTlOHdEEF03QaLtZ9s
         XcwifU4TP6sc5Iiiy0VPa/EPuOhBLo+JUbYUKyseV8pZoQ5HxbIT3lqa2XCjzSBxYv7m
         +nMKAWMceq8KWEgvzkQ+/eocZ1HiZf6vyHBVZ1gNZa0u04hOziOp6ywweIv+3+7bwK78
         rSs0bFUBrPmNi1bocDcomjCmCOWMHXQ+p+kfJtazBsLiHCzkDoJQNx+gEAPevnP8ASYX
         oc74SqX1Wk3l8ni+oK7pTWs+7d8W2gCYcys2BlHSArsTm+eeuPCd5C9TPY6xVwWerEs6
         FBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722518167; x=1723122967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KIlJt0Dm6+MO9ZJxLHt8WiA1qer2aN0kK9w3KAfqEpk=;
        b=txC8rorJ+LtYb6NsWgb79X4nEjkoi4nX7R93TlAlJNYVrKaxOG8CCcJS/RfyRVUX5v
         6Xamfb3+2tHEDdji9/se0bCMQGwniXIxH86YFqjEE77oiGXUyJnfHrMmyTYcvrjRGWxW
         jK4HA0ulaZ9zJEuAK53j/erG/iF6Vv9sDzHAXt+N8IFXz18jsY0c3ZSMImWuTBksBn3W
         /Sn+VZQo4UisKIDbL/mJ34wQPek/dLaRis0rUeVfFYRSn88O8KuXAlFr7aEC2hg194tb
         kRixoVrKYYft9LXFSOOBPT9XYU/NDRd7Fbt3OIy48YfB7nk6gRdMPDOg504vuCXHoBqD
         kGmA==
X-Gm-Message-State: AOJu0YwFCh237UxWW2WwKyRk/A4P46PPD/ujFrlXjSHnzTImD+N2IZdl
	ToRn1ETa+RzohlhZAjLtoMFikQJ+PpPVb1wkBrb1ntRrr8tUACtRVAA+H1EISVO5lLlh6EsZF4E
	=
X-Google-Smtp-Source: AGHT+IGu6I6Tp0BlbFIv6OsMUavM6tOhZnCT4h/iPRBsz9QU9UCC6GRpOm+sDhKgSFXTEN0KvSu54g==
X-Received: by 2002:a17:907:7fa1:b0:a77:da14:8403 with SMTP id a640c23a62f3a-a7dc4da9bb4mr11244766b.2.1722518166898;
        Thu, 01 Aug 2024 06:16:06 -0700 (PDT)
Message-ID: <a074fa7e-1c8c-4631-b560-b9f3d392d32a@suse.com>
Date: Thu, 1 Aug 2024 15:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 1c4fb9bb
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <66ab862e37ff4_2e28037507127b@gitlab-sidekiq-catchall-v2-6785bcc687-745p7.mail>
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
In-Reply-To: <66ab862e37ff4_2e28037507127b@gitlab-sidekiq-catchall-v2-6785bcc687-745p7.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2024 14:57, GitLab wrote:
> 
> 
> Pipeline #1396969716 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 1c4fb9bb ( https://gitlab.com/xen-project/hardware/xen/-/commit/1c4fb9bb49b7babbcaa0b62384841ba4acb49356 )
> Commit Message: x86/vmx: replace CONFIG_HVM with CONFIG_INTEL_V...
> Commit Author: Sergiy Kibrik
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1396969716 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1396969716 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 1 failed job.
> 
> Job #7482814581 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7482814581/raw )
> 
> Stage: test
> Name: adl-pci-hvm-x86-64-gcc-debug

The only anomaly (not Xen-related) I can spot in the log is

** read zero bytes from stdin **

Terminating...
Thanks for using picocom

How to explain that I have no clue.

Jan

