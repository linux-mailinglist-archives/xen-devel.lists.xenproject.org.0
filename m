Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C40E93AC4E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 07:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763726.1174031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUlb-0003bX-WF; Wed, 24 Jul 2024 05:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763726.1174031; Wed, 24 Jul 2024 05:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWUlb-0003Yi-SZ; Wed, 24 Jul 2024 05:42:23 +0000
Received: by outflank-mailman (input) for mailman id 763726;
 Wed, 24 Jul 2024 05:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWUlb-0003Fl-3X
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 05:42:23 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f21d480-497f-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 07:42:21 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5a1fcb611d9so5274235a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 22:42:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa30b9sm8371881a12.28.2024.07.23.22.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 22:42:20 -0700 (PDT)
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
X-Inumbo-ID: 7f21d480-497f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721799741; x=1722404541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nx5ZOkh6AGoODejeSyAQss1Zm5TybGp1SNj8aAaipJE=;
        b=f4+L6MxW2yxTEl2kAHvd49YWADQxucIO4gMg0NxoZLFijfFw0VI0zQBoL6JHuW77Up
         nUTBjeoZPnJxGU0jrZ6xv/H8yDV9a/7RT0eQiIOKRgm6oxgPwZv3bm94rQrqJ2XeomtU
         D0e+vekZQRRqq8jiXH3WKBlT7xxUsLIXgdviALwTqlUa5gWIIDPMmKq5b/kyoJOegKNc
         AoLmUXWYgAbgQiL2sHDeM78+yQlWzpTPtJPOv279GYYFPW6jJ5/cJOWHXV1hW4c9toHd
         qp+YO1slv4qE4gLehzuFMnwIDIDWySPqghabaj9GqUmBXSq9VP972uc7NMJcu9UXP0HL
         blGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721799741; x=1722404541;
        h=content-transfer-encoding:in-reply-to:cc:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nx5ZOkh6AGoODejeSyAQss1Zm5TybGp1SNj8aAaipJE=;
        b=tRwbl9B0d+xzveLsfRAhoEot/fzmlNrVxW19A2f6P2xVSARKS6k75mYQc364G/sdOw
         SElO1FxFDwZ6i8kDMoJ1OwpR8QxbvvoZFY8ipn//7rfcB/7gOfqSalxYvm979MpCnrW2
         GVnXXjj2yCR6z7D0QZnkiiiPXrEnmZ+uijmO65AzJFzyyGvuuz+K48ClbgDVu9ggASNY
         EXrsGSiNUFMHKu1yB96c0pWfnwwbnbjAtmybO333o+1UB0jMR78jUM6IAjTDWyEbodNa
         NTx3dNekaK16gJUVUvH05mixS8szMivmHcTKq/8xfdqPCQZrgHrEfnQKdTelsv9yKQNK
         /YVw==
X-Gm-Message-State: AOJu0YyBdtOlGcLOgMD7Aq9Di5DybvwcJiGp6vOC7t1g1yvAmXFfbX7B
	imS1IH+Phj6wNiEjSjil/ft/QXMjirlF6RyCt9jp1ZfDPsCJSDWyEjtoSG1UYersybToIB+BLmY
	=
X-Google-Smtp-Source: AGHT+IGgrHQY8wnHbBX3clr4C7MOCYL+8ozTAtZyAsIdlQEPUzqMvJu4XsieG7A4QQPowqCdFSsDlg==
X-Received: by 2002:a05:6402:2692:b0:5a2:2654:7fd1 with SMTP id 4fb4d7f45d1cf-5aaee8b114emr658841a12.36.1721799740936;
        Tue, 23 Jul 2024 22:42:20 -0700 (PDT)
Message-ID: <a08d0d27-1d7b-4453-807c-3670cb4f05aa@suse.com>
Date: Wed, 24 Jul 2024 07:42:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v2] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
To: Matthew Barnes <matthew.barnes@cloud.com>
References: <fa24cd3b232e8865eb6451e5f7af9cd203ce52ab.1721224079.git.matthew.barnes@cloud.com>
 <12e2c7b2-6d0b-4427-ac30-257bfea2aeab@suse.com>
 <669fa8ad.170a0220.843bc.3a17@mx.google.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <669fa8ad.170a0220.843bc.3a17@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(re-adding xen-devel@)

On 23.07.2024 14:57, Matthew Barnes wrote:
> On Mon, Jul 22, 2024 at 01:37:11PM +0200, Jan Beulich wrote:
>> On 19.07.2024 16:21, Matthew Barnes wrote:
>>> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
>>> startup.
>>>
>>> There are efforts to support a maximum of 128 vCPUs, which would involve
>>> bumping the OVMF constant from 64 to 128.
>>>
>>> However, it would be more future-proof for OVMF to access the maximum
>>> number of vCPUs for a domain and set itself up appropriately at
>>> run-time.
>>>
>>> GitLab ticket: https://gitlab.com/xen-project/xen/-/issues/191
>>>
>>> For OVMF to access the maximum vCPU count, this patch has Xen expose
>>> the maximum vCPU ID via cpuid on the HVM hypervisor leaf in edx.
>>>
>>> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
>>> ---
>>> Changes in v2:
>>> - Tweak value from "maximum vcpu count" to "maximum vcpu id"
>>> - Reword commit message to avoid "have to" wording
>>> - Fix vpcus -> vcpus typo
>>> ---
>>
>> Yet still HVM-only?
> 
> This field is only used when the guest is HVM, so I decided it should
> only be present to HVM guests.
> 
> If not, where else would you suggest to put this field?

In a presently unused leaf? Or one of the unused registers of leaf x01
(with the gating flag in leaf x02 ECX)?

Jan

