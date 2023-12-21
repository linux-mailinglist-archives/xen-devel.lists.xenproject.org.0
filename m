Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A6881AFF1
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658549.1027748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE0z-0000Af-Nq; Thu, 21 Dec 2023 08:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658549.1027748; Thu, 21 Dec 2023 08:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE0z-00008m-Kl; Thu, 21 Dec 2023 08:02:45 +0000
Received: by outflank-mailman (input) for mailman id 658549;
 Thu, 21 Dec 2023 08:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGE0y-00008g-77
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:02:44 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50cdc104-9fd7-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 09:02:41 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so5219675e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 00:02:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c468600b004053e9276easm9935381wmo.32.2023.12.21.00.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 00:02:41 -0800 (PST)
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
X-Inumbo-ID: 50cdc104-9fd7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703145761; x=1703750561; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cnuoU+sGtcEm450jItf8wg/uWrWjwDIyNiF7cuRPg6U=;
        b=eRBUnasDzv+GO37MtBCMTdV7pcfLbaqEH1VbXOrveoCNCa0fRaaSVgX7j9BZfFpJJO
         AKCdrnlWmKDK9RwEezVyVq5sC0JpPylijjErUArkTrpAeJACJV/ndqjqSRFMOZWOr24O
         z3Hn7x1Gf6YmAurD6IL6Ny1UC7AzQkGwh1aG9NmptG7BAyLQxAMtE16DygpRCkjS3fsS
         /FiP8CgL/qw7/wmn0HyKYgefbIpq9CvmwdNpEJ/8Ka3/sCd4B3RpXlXrjA8muniGXlur
         5wcljV0ziGrXcpz1mXwchQpQNrKaFUF7GGSqDH/OBvnsOsK5C/uNX1fCoFg6bVKz+ZYo
         ugIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703145761; x=1703750561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cnuoU+sGtcEm450jItf8wg/uWrWjwDIyNiF7cuRPg6U=;
        b=qfUxaaI6ZcZw/cvjIAMOoEBSPFGTTrJtjA6+NnU0/8rFNMmIw15+9QvIXyvkzgGjTC
         Rq8nb5vNorfjorQm1KsIeNuNaZWkBiUXjZ2EpXun6JC2p8YR6S/Q7TKr4IoU2t42PMSW
         0mD5fp4KNfuZ/DoOsTn5Cn7ENWWIwuBzePRiXeZpcPqDefkdj+ewg/Y9x/aXfHWOcbHD
         a0ynTIrReegkNO64Mw0QsdiApPcj0V4Fh0QI5XqiauwqQhNhL220pSKbnSgxhEm8feXm
         IyhfFYhHaij8yvpRrw4iyghLuXoK3E/THMjd8X0ZTWXfUD0EyZSjS8bcvqMRXHBHPVUf
         PXeA==
X-Gm-Message-State: AOJu0YyQmPh6z+paCrWoZF6Ftb/mLzkChghkPmMrHDLYUV1yziJZm14k
	gl7cNrXSW7Uhs7lPv1pRlPSo
X-Google-Smtp-Source: AGHT+IFxDDPWCSVX9l7Oa04PfwPWIzpr6x8qsM4wNr7n/V9pG0/42ShmR55rpFH06rI/wkdShaIoEg==
X-Received: by 2002:a05:600c:4589:b0:40d:2086:bb26 with SMTP id r9-20020a05600c458900b0040d2086bb26mr428123wmo.145.1703145761406;
        Thu, 21 Dec 2023 00:02:41 -0800 (PST)
Message-ID: <ede547ec-b6dd-4b41-9655-0944fbda8eec@suse.com>
Date: Thu, 21 Dec 2023 09:02:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 37/39] xen/rirscv: add minimal amount of stubs to build
 full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <091887466560fbd6b66239f7fee5193eb97570b9.1700761381.git.oleksii.kurochko@gmail.com>
 <f52b19eb-7633-48df-85b9-c6a545dc4232@suse.com>
 <3c34e22a4cf040845e734c3575512945a87465dd.camel@gmail.com>
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
In-Reply-To: <3c34e22a4cf040845e734c3575512945a87465dd.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 13:55, Oleksii wrote:
> On Mon, 2023-12-18 at 18:00 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/stubs.c
>>> @@ -0,0 +1,426 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#include <xen/cpumask.h>
>>> +#include <xen/domain.h>
>>> +#include <xen/irq.h>
>>> +#include <xen/nodemask.h>
>>> +#include <xen/time.h>
>>> +#include <public/domctl.h>
>>> +#include <public/vm_event.h>
>>
>> I think I can see why you need the former of these last two, but do
>> you
>> really need the latter?
> It is needed for vm_event_request_t and vm_event_response_t, but if use
> a forward declaration that it won't be needed:
> 
> typedef struct vm_event_st vm_event_request_t;
> typedef struct vm_event_st vm_event_response_t;

Iirc Misra wouldn't like the duplicating of typedef-s used elsewhere. But
as long as that's not going to stay (and I expect stubs.c to go away
before Misra becomes of concern for RISC-V), that's going to be okay, I
think. Yet then avoiding the typedef-s and using struct vm_event_st
directly in the functions would be as good, and overall less code.

Jan

