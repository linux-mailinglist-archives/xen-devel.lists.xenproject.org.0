Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD763AB6389
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 08:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983817.1369993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF635-0007lP-3O; Wed, 14 May 2025 06:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983817.1369993; Wed, 14 May 2025 06:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF635-0007jC-05; Wed, 14 May 2025 06:57:03 +0000
Received: by outflank-mailman (input) for mailman id 983817;
 Wed, 14 May 2025 06:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uF632-0007j2-VO
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 06:57:00 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1c07a9d-3090-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 08:56:59 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5fbcd9088a7so1210168a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 23:56:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fd29f9fdc2sm4851007a12.4.2025.05.13.23.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 23:56:48 -0700 (PDT)
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
X-Inumbo-ID: a1c07a9d-3090-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747205819; x=1747810619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=azOJWAIGjMLaCm6mwRHwibEHaB/Bi0uK8s+1koMZPfU=;
        b=LaQL7Eu/apMbpSiI8qTO781m9uSW0oQoJPcm9Oehxv+q8X2id2BGA6j4ZRrlgNgAWg
         d+zRm3IzLIOlZIzY1VrppekEzn06QJaX4q/I6uhXavUAgbQb/FprlkJCcsU/dyRNEqay
         jPK74VWYERpImc21XLyR7lsargVJMpZFbw+M/ChrrUvqhEJwDjGVQib3Om7PhHv4aKFT
         M2qJoBmOuI3GTI6Sx+dqBMtVgKFIPLNlIHNth91nn2ft3snPsoLKD271sOC3yG1QnNPj
         YsrjTHLTP+OKzgb/mwyhoCfREVMgcu6djA0FT6f2Y8irciGbW29dn5CSihJBoKwrDAVD
         XSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205819; x=1747810619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azOJWAIGjMLaCm6mwRHwibEHaB/Bi0uK8s+1koMZPfU=;
        b=SpxisDdqbAzs6BRJzoD4ys66ZWDDu5ijWF8fNrc59mcV1GnXyusqOppAXP0Mj53wfR
         ggfUKZpGmsyDoAKUQnaieGqFtzP4XeJTc2kFy3uau8lBOjjpNp1zWve02eLF62m4K4Dv
         QJAPDIWRphyg4fAnORKeU12sW33dk3vMoZLLYPovbzMxKSEJ+jrVLDMRIVEfCcEaYoxu
         VLgPkHbfzCMN0ZGdhY9a9AlHEvBk/+0efieGQFUn9TRZ1yVjrvYcC4vOaU5XUgh2sDwV
         6jOY8SKsFwRYMLJtOj+eekDmZ9n43Mvy0zrFVtyvbyoQgXFM2UVw10YuT6ZWbSyfkHTB
         4DnA==
X-Gm-Message-State: AOJu0YyYYz1awlItGFEEYq4zd88FqCvE5N/boru5UHHSf5H7vxEOY1sv
	TH+nmjb5M1t2H1ObXJWdeKKttBokeZuD+Rrx50HT/5Uf0iqcHio8QShR//v9nt1v1weAiLkxfIM
	=
X-Gm-Gg: ASbGncvvOtJoQeUOK8/Hfh4rd9TSnU6fO6VjsXCdIbiFUnnFufq+afm/J+Hd6kUALQo
	/56FyU588DJvAGuDV+032IeuidTPjr+hVy/Am5n5ElDFFUkSw+ylyUby3EGBuXjyOQieAffkUy7
	G5CtnQbcOv/+M+S0Tnx0j2ga+f5t8chP6QAjPFgGjM1GfNdvIEWSlAEl330vJ+3IGK0a3Rw8bwC
	TjSXF2rzMcWXYwe2qsyolP/G9hnNpi937FpzklazUAyYkean6SHHqH9gVllPl8hXpvhgneKCYSg
	a25ia4j89LmMRZmlHvmlEffGMa/L3cPdkzIba4jdNIg5tgORgoeV310fINKZD8ScmJTqPCr7is8
	qTPHlgY7pSQ/lph7VSHLbbkUAn2l7T+qyVf0i
X-Google-Smtp-Source: AGHT+IHYVY4Ib0wmvTkl6xKXLyxOPGsUU3tuNnjnrx92yb15UUO09O/XL9nuR8O/8kOrA85A2Tjv7g==
X-Received: by 2002:a05:6402:520e:b0:5fc:ea4e:b7a9 with SMTP id 4fb4d7f45d1cf-5ff95ae878emr1959570a12.2.1747205808993;
        Tue, 13 May 2025 23:56:48 -0700 (PDT)
Message-ID: <4e684e38-ed64-4731-8f00-afba938a28a0@suse.com>
Date: Wed, 14 May 2025 08:56:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/dom0less: mark domain_p2m_set_allocation __init
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
 <alpine.DEB.2.22.394.2505131707020.368682@ubuntu-linux-20-04-desktop>
 <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
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
In-Reply-To: <cacb0002-dd6b-49e5-8019-2d323771e3e7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2025 08:31, Orzel, Michal wrote:
> On 14/05/2025 02:07, Stefano Stabellini wrote:
>> On Tue, 13 May 2025, Stewart Hildebrand wrote:
>>> All functions in dom0less-build.c should be __init.
> Why? This patch is first in your series and by that time there is no build time
> enforcement. Together with the Fixes tag it implies that this is somehow an
> issue (i.e. build/runtime issue) other than inconsistency for which we surely
> don't need Fixes tag.

I disagree: Code not called post-init should be in .init.*. While not formally
a Misra violation (and wrongly so, I think), it imo effectively is: Such code
is otherwise unreachable post-init.

Jan

