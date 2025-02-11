Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83FFA3087F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885310.1295104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnVg-0005P5-B4; Tue, 11 Feb 2025 10:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885310.1295104; Tue, 11 Feb 2025 10:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnVg-0005Mb-7v; Tue, 11 Feb 2025 10:28:56 +0000
Received: by outflank-mailman (input) for mailman id 885310;
 Tue, 11 Feb 2025 10:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thnVf-0005MV-LA
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:28:55 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe7ca8ca-e862-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 11:28:54 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5de594e2555so5808792a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 02:28:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de3e49c372sm8442733a12.3.2025.02.11.02.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 02:28:53 -0800 (PST)
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
X-Inumbo-ID: fe7ca8ca-e862-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739269734; x=1739874534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tdeSZ4Wl/sVV3rUjw6MKWIKbFcAsqhoITQuI1IKLxiw=;
        b=SriM+tk4uDMRgDeOFJpbklvBBPCBQdsh0eYmGrQii05Xt37NKt3KoDCkl9GhNkxP9k
         A+H06dX4/23xellb60znPEm4LEJjQXV4CP2Q8oH3MyFoMag3+CiE13CeNZMSTcORwFBY
         XVH57zJZbhUEIfR7MHiajOD6vmFiQb98+vDducaCmPEWD/Y2U0jhfVPK5RR49E09i4nc
         17n51+K5twXlVj8OaJjrssFeiWGYZbW2awOEZ73Mae2zG4I/HLH9mn1KXLCxtF6kqYWS
         UJggsCmahQaxsWEBMVaZMXM7W4HNg7ec7QlULCdx+WoOP04F56H0miAJ6DUGRSXo7eIb
         AYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269734; x=1739874534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdeSZ4Wl/sVV3rUjw6MKWIKbFcAsqhoITQuI1IKLxiw=;
        b=rp+21EmEuFkVpjd1PE+QH4GkxdWPgr0c/HfySQkfpuhlF7+KhSda8UJfjG/0d3kpvr
         taitLNeeKAbVq/PQuMrJVBAiJ9lQowhKJ1ocYngT3vUWJqhuMdcr2NLTxbbuKaPKne6c
         3JtLs44HMFoVxdCk18Ukhg9xiFZiPJK0I+8pgsE30ZgDhdtrE1By0V1NPWG/RQSMeeV8
         fwGWO09qdJQxrWzsq5fxkvM8xjOU48zTH76j9OimZMVYAMZxJr5PFxqGFOuyknsS1izX
         oljWqq60ZDqrnkwPqP+jcy2D9pgTdHgLFQpgH2nZuPFU45T2/gRUzQayobN9wf0ndS4G
         Um1g==
X-Forwarded-Encrypted: i=1; AJvYcCVeLQrpMw6n15fMtTa7urIwfxeSCIS6v6CmMiL8gWlINqW9nR7cUmmCCi3dMnIsMjIitnTinrf65jE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxm51al25NQY4rnxVPQvyKrWm0wiSvXHTKMfMJiGDzHEQoGXjyJ
	56nC7E4AkCFpj3gA02a5PZYwbWjrA2SwkcX3i5GX5l7ul84OlRbHAmx8iRbX9g==
X-Gm-Gg: ASbGncu5JIIDBCtX8qu0ehTqq8faKeXV0MpsNwmWlRkOkTfSqGn1rrdRgPC2CS5YJ6U
	wqEamzJe3MtbcyNi6sN3PS29r67A9lLmfoTJB66Juio4jwh+Pw/jf1d862+353oDMdS8yOtF7LR
	C3sKM8NR7H30s/N+0VOmTUN3OScppy2E/M+836SZrfGX8vYLZeqKTCAMF5hwETIcU129FE5RPIY
	7vHTblGF6stm6cuoAdE9vCBMvN+as1jEl4OUosz3yk3yj84riZQPufHS3eEftVzSVqNk4jzGytx
	HMmAOUPRo3TnSijC1ROecCVQo3O4bmNe7nw1kiihY57Q41EASnn+vDhGgBvwpycAo1+o3VykMjO
	G
X-Google-Smtp-Source: AGHT+IH8UxWzLxz7Cz8FMpvuWAg9cvor+CJapRzLFyNM4brNgpLbo/11luePOv8liiygqdZrp17J7w==
X-Received: by 2002:a05:6402:239c:b0:5de:45e8:6aff with SMTP id 4fb4d7f45d1cf-5de45e86b44mr13811056a12.18.1739269734112;
        Tue, 11 Feb 2025 02:28:54 -0800 (PST)
Message-ID: <e0cba006-c536-4460-91df-cd88e1c8d796@suse.com>
Date: Tue, 11 Feb 2025 11:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Coding Style Review and Automation
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
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
In-Reply-To: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2025 22:16, Oleksandr Andrushchenko wrote:
> So, in this attempt, I would suggest the following approach:
> I think that I could start sending patches after the latest .clang-format 21 for
> some part of Xen, ARM code base for example, using work already done by Luca.

Taking the suggestion of limiting the experiment to Arm: On its upside
it would mean non-Arm folks are unaffected. Yet that's the downside at
the same time: Non-Arm folks then also are unlikely to even look at the
patches. May I suggest to consider e.g. drivers/ instead? That'll involve
more people (to build an opinion) while at the same time it's fewer files
and less code overall.

> This way:
> 
> 1) Patches are formatted with clang-format, which is a strong plus.
> 2) The diff is well maintained and I can still alter it by hand if there are
> comments or dislikes.
> 3) Finally, when the patch is accepted, we can be more confident that
> clang-format will find far fewer inconsistencies than if it were just applied to
> the "raw" code. Thus, the next time clang-format runs, it will produce a much
> smaller patch than before.
> 4) Finally, introduce clang-format and run it on the leftovers: at this stage,
> it would be much easier to discuss every option clang has and the resulting
> output it produces.
> 5) Update existing/add new rules to the Xen coding style based on community
> agreements and the results of this activity.
> 
> We may define the subsystems to start this activity on and also define an
> acceptable size of the patch for review, say 100K. Considering that the longer
> the review, the more outdated the patch becomes and will require a new round as
> new code comes in.

Why even go as big as 100k? Style changes can literally be done at any
granularity. In particular for small enough files they can be done one
file at a time. For larger files there can be multiple steps (preferably
all committed together, but not doing so may still be acceptable).

From the gigantic monolithic patch, would it be possible to fish out some
very representative (for the changes that need making) files and start
from there?

Jan

