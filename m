Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DDDD0356C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 15:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197727.1515191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdqzJ-0005xB-Hi; Thu, 08 Jan 2026 14:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197727.1515191; Thu, 08 Jan 2026 14:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdqzJ-0005ud-Ek; Thu, 08 Jan 2026 14:27:45 +0000
Received: by outflank-mailman (input) for mailman id 1197727;
 Thu, 08 Jan 2026 14:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdqzI-0005uX-HK
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 14:27:44 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3120c4f7-ec9e-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 15:27:42 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so35991815e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 06:27:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f68f4ddsm161688015e9.2.2026.01.08.06.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 06:27:41 -0800 (PST)
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
X-Inumbo-ID: 3120c4f7-ec9e-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767882462; x=1768487262; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YB1v1TRI5JUlHgV8frgde5YCA9T3Lfy2Y22nWp1iYGY=;
        b=bXhyqNEAvBQoJvb2+74FPo8FSyUavIrh6PH38aYcbF6B2zzW+SNUdu4IaLL4SDzUD0
         sXggiPqPPJgb2Myay8U1hAkAgcyhKy+3f2NRFPBX/z3y4aUIDcfx3bHKVfwzCk2Lqrbs
         DJ8UhN4VqtKYQ83B3vRRkk5Lovl1zEsaDLbCNTN8tq+reaFCG0vdDssdeWLtDQSFwytr
         dHCMWr0azpmU0NrZoDD01UdgSFGrjjuc3FRX8+PuYZ3VjBMYmjaV3ktMpIybi/ESjRHI
         tqw6VYthNJKCPW+IVSZqR+zENqhRPRDT5nCB5oCQ9kVlj5ik3neckrDg3EOz7Ov7zFCz
         tblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882462; x=1768487262;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YB1v1TRI5JUlHgV8frgde5YCA9T3Lfy2Y22nWp1iYGY=;
        b=EcFKrKnLVpJdpbgbywuaSLVgdOjGSlF9i+SxyiWRYR5tr+80JC+u7gEulGG5rt7pvp
         QNTqWEYqNwtuQ+PXkH6PcEt7C4opF4TiNYKhph6TWa2zBWh+wTfM4B+4ilnrJuP7t6MQ
         FXWc/RQ/Ctpl3CtRFP3NEpMKyp8w+DFYxlfrxeT2GeRiHE9FTYnmuh1yC6Cjq46fGI02
         11F2O/8FZilVMqC51tFcWRHvInVVpxRj8KFGnWD6BcUwq20WVTgtI0Kk8iRTniScmEMI
         5isKdffjL4vATTZ24XBx7TUiTwQSsDBGp8DWfI4ODH24nfqrGrpNsgCn6h6NpiYjdy8V
         oRFg==
X-Forwarded-Encrypted: i=1; AJvYcCWOZLFJfAKJyGJBh/fYcG0Uy6s4LH/NLa+L/y3wd2uaz91JEdWtxSQcQWnX6wwiyZ1KdkT/W7S+oFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyhx1e8zKHPplsINN0RPMv89DhgvP0W7/cmDbf5CsztsU40xdah
	DHDeLkgi35FrMWsXw8okQ4VLyva6dq32VG7Xq+cL7VKAm78+AGceA85G4wECoTpG6A==
X-Gm-Gg: AY/fxX5Xt9XnAjbVwdkydxMZo2IgRbp3otz6y4e0p9Bs6tLcdF9tQKJwUllwBT4oTPy
	GtDjBATTziliRlLyXM95+3QVmchYi9tdL1O2y7U6TBmzTLNJ8BFfrAZJM2fKkR4inaqpW9wvZNG
	+TnfhzHFZZNIPh3L/k68ZCgY/gmfBHyVpsuVJmM8AdRNtPNdyJvLd48yyGaH5padtLgX/7TGNbH
	UTIHqlVjaCfNJ+oQ6CU6c3CB1aJCk9i17TA2zhJCc9U7WvvX5cQJytkrgfHzdZtHm8P+0YpNUdS
	sf9NaqxlBYsghniqwnLduve0ziz42Sn4h1vID/Bu4/GlNRd1JbhXmS6XItPmAgTbzAE6f9+T2lN
	qNNUrr5+gMdvGt0WGojaQYkTRcbvWXlFL9O8exyA46x7B1/K9ooObzAU6uMhnKoZFUsBXJiqP++
	LNew3wHnb64jA5O9HPQxRuYIzWhf6MrU1dOo70inS+mbR3LtrpMiZ28ehIvfukR6ef0tPtW4Tg9
	2TJ73dOrKKVSg==
X-Google-Smtp-Source: AGHT+IEBaOeOLFc0zKMxVONp4ibMaZCmKrS8QTqQ+wYcEaucuahaZ6+zj0spOBXR2HU2nUBipZKjeA==
X-Received: by 2002:a05:600c:4747:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-47d84b0aac6mr80298785e9.1.1767882461687;
        Thu, 08 Jan 2026 06:27:41 -0800 (PST)
Message-ID: <4e14f1c5-bd85-4ac5-a2a3-613f9673252f@suse.com>
Date: Thu, 8 Jan 2026 15:27:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
From: Jan Beulich <jbeulich@suse.com>
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260108141641.506534-2-dmukhin@ford.com>
 <df81c33c-5d97-489f-a768-25cef8293921@suse.com>
Content-Language: en-US
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
In-Reply-To: <df81c33c-5d97-489f-a768-25cef8293921@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2026 15:24, Jan Beulich wrote:
> On 08.01.2026 15:16, dmukhin@xen.org wrote:
>> From: Denis Mukhin <dmukhin@ford.com> 
>>
>> Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Actually no, I withdraw this. It makes little sense to update ...

> However, ...
> 
>> --- a/INSTALL
>> +++ b/INSTALL
>> @@ -33,8 +33,8 @@ small subset of the options.  Attempts to change other options will be
>>  silently overridden.  The only way to find which configuration options
>>  are available is to run `make menuconfig' or the like.
> 
> ... I don't think what is said up from here is quite right. As a result, ...
> 
>> -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
>> -in your environment.  However, doing this is not supported and the
>> +You can counter-override this behaviour by setting CONFIG_EXPERT=y

... just this reference, when things also work differently now (?). (IOW
the original description ...

>> +in your Kconfig file.  However, doing this is not supported and the
>>  resulting configurations do not receive security support.  If you set
>>  this variable there is nothing stopping you setting dangerously
>>  experimental combinations of features - not even any warnings.
> 
> ... some of this is also in need of updating / correcting.

... may or may not have been correct when it was still an env var.)

Jan

