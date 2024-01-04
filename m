Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFA82420C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 13:52:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661771.1031475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNCu-0006CE-Bx; Thu, 04 Jan 2024 12:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661771.1031475; Thu, 04 Jan 2024 12:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNCu-0006AB-98; Thu, 04 Jan 2024 12:52:20 +0000
Received: by outflank-mailman (input) for mailman id 661771;
 Thu, 04 Jan 2024 12:52:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLNCs-0006A5-U0
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 12:52:18 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1796cee2-ab00-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 13:52:18 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ccbf8cbf3aso6528171fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 04:52:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a2-20020a0566380b0200b004691fd9260esm7910872jab.24.2024.01.04.04.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 04:52:17 -0800 (PST)
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
X-Inumbo-ID: 1796cee2-ab00-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704372737; x=1704977537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8MyVd5X51fE5PzwCc3SGP0/RA3NamsyLJgqWLQQGDV8=;
        b=Tm/G7PjrQQd+gSUuBBIve/xVLP7Qkh+uuspR/LmvgNVIwC9htXYBjCCXuSGPMG01AX
         Oxh6GlUbpEMwkLymUC+AUsoM3TFSw5i+z7ivicosXzZtEI/XNLbTR+5j4KB1J6tPUQcB
         JXIJvylj3qze8WZa4+rIsgut3ogzqVRLzRSaae/VBhVsslqj5RCEDr3Xs4OtVkyry3I8
         RxzHbgBjgB4+6/S2SbEd2srRUlaKuX14Xj5eU+cMGD1LrTly6YXidRSLVfPB35fBveOf
         IV/3DBJCBEY/bWP9Wtyxf08qSckoa0x7x+VPgFnigFzcCabtiTPul06UQ/Zzw+SaDSGS
         REpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704372737; x=1704977537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MyVd5X51fE5PzwCc3SGP0/RA3NamsyLJgqWLQQGDV8=;
        b=qI3QGnQ8VuonWfp6Sm+ddudivGQo06Kp1+FdpK1jiCgX2f2q906EQxHhyJJWvd/eit
         TpAXZUXpxb3BxoTWtqsTQhsUZoCRD/Xm1aJEU6a8rKDDFw1NQGZ4JxtoNR1QYg5Q/Y3i
         gq6VwIt53dNc+LKnsT48Sc6Fd9y7ewa6fwBVd/xt10lsIxsrs8J/9k6toP4G2S+bdnRQ
         Ml0U2ClYLRjryjQAW7mEA0MjtzCodxUIepp4wO+QGtsu5jXfk3k82bdi7XX7n/ktoaCt
         Qirxj9DRPU4skANJj34gidJcAI1cdtlslqxPXhE/8kmwJZ9pGq6rMrY6V64CPDK8HdTO
         hdaQ==
X-Gm-Message-State: AOJu0YzmdnsO/XoUgQCpyc83pcZu6sShX0cyA85NkjLyIM8FBNqwtq7x
	fR4L4zGiAsl/YoIe6EJHGSwbgJUNgiPc
X-Google-Smtp-Source: AGHT+IHgL/1DeEp+dg9yR0HT1XtIwrtagLTpUe7TIySmidXEkwWCU5GS4hagxMCQKc9xbePe+DGYbw==
X-Received: by 2002:a2e:9b8c:0:b0:2cc:effb:cbb2 with SMTP id z12-20020a2e9b8c000000b002cceffbcbb2mr325926lji.52.1704372737575;
        Thu, 04 Jan 2024 04:52:17 -0800 (PST)
Message-ID: <87f4c67a-3902-499a-b4e3-c1429a0d9167@suse.com>
Date: Thu, 4 Jan 2024 13:52:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release schedule proposal
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: community.manager@xenproject.org, julien@xen.org, sstabellini@kernel.org,
 Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 anthony.perard@citrix.com, george.dunlap@cloud.com, jgross@suse.com,
 Wei.Chen@arm.com, xen-devel@lists.xenproject.org
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
 <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
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
In-Reply-To: <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2024 17:59, Oleksii wrote:
> I'd like to propose the release schedule for Xen 4.19.
> 
> Based on the previous release schedules [1] and [2], it seems the next
> release date should be on Wednesday, July 10, 2024:
> 
> ** Proposed option: Wed Jul 10, 2024 **
> (+9 months from Xen 4.18 release)

Hmm, aren't we intending to be on a 8 month cadence?

Jan

