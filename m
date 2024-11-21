Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1DD9D4BFF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:32:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841414.1256901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5Q3-000120-Mj; Thu, 21 Nov 2024 11:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841414.1256901; Thu, 21 Nov 2024 11:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5Q3-0000zw-JZ; Thu, 21 Nov 2024 11:32:19 +0000
Received: by outflank-mailman (input) for mailman id 841414;
 Thu, 21 Nov 2024 11:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE5Q1-0000zk-MI
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:32:17 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41128e37-a7fc-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 12:32:13 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43193678216so7092505e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:32:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38254933d44sm4919103f8f.76.2024.11.21.03.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 03:32:13 -0800 (PST)
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
X-Inumbo-ID: 41128e37-a7fc-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmQiLCJoZWxvIjoibWFpbC13bTEteDMyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQxMTI4ZTM3LWE3ZmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg4NzMzLjk0MDU5MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732188733; x=1732793533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zmNxiIfkePwWBq/8UwHfjCG+tC//fXrMixapAsauELU=;
        b=P9uj1XS7MLs0Hfo9AlcMBTWi2hwLZ1wbwVj/0gU+hEw7wXeQ10/SBBJZcAO5+ibNF3
         FNQP/0WNjwNC6Q4k6NDCEra6iRYJHASFTSJ2lP1NcPzZFaRLxPHIxUMzrXlQXqq7K92l
         YQQBO8HSPPQoeYgOZZFQiuyZDC7eD1hpaDpaI/UTcqG/qIzCRLOm/pvhogfFy/uIp6Cd
         WatnQsKDc3csQNhrtEglmXaAFHLcpHFAYeE6NN0Wz8CLWiFt4whNNSLBYOrvLHm/wO57
         G4kpUX7K0kFY4qC6v/pcDTIISiOthF+8XokTRzFFYlssIY/rW0/95POrBkyHv6ginPaK
         1oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732188733; x=1732793533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmNxiIfkePwWBq/8UwHfjCG+tC//fXrMixapAsauELU=;
        b=GQb9EbdASpsoi7hs0nQS70wWI3rLZZXVf1fTBQyNjYNV8YthawhU9IIg5VlWtpVJVu
         igFWr1Pdzm1YZPhgFnt0zbpTeIj+wmD5jjnmCNeMv3pjiw0glHJ2x1gmrR2V0UQl8OS0
         l8GU1t6kqQ24ev8PPMT395K5NXsoCHp7uCKTCMAL7AhPiebsrmokL2gSyfUDanchDOrC
         JlIiD2WyUT5ejfvpqFFXUCt6nNla+C0dRnVZQ0WFdccQ1GVRYKibzxDvfu9n2ugGs/K9
         t4KysciYnQvDW86mw1PHLmMp45uoVsnUwAPaaAwFNveNxtEXOMvN1e1P0OmmnpXywxBT
         rnTw==
X-Forwarded-Encrypted: i=1; AJvYcCWL/I/BWB0ameSEC3SGOKTWVDcI9IQ/9x/Mg6h/LzQ78g5FlOH80VDXPcXDrpRj68sYAGlBXE95MnM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYJM+je6Xa61CASGexojPQOcpbDpB3r3lhdiLvlgCZfTTsIR8v
	/0ouancYvSY5P3uLdx/ZsZNIGzmUaBrC80/5iL5AqY431ISBfox/jGtZ18+VvQ==
X-Gm-Gg: ASbGncuYQnBl67OdOsEoO+SMNFTsTdOicFZlC9ELqW8eP2tIbwaVMWkGLE1YJTrlQyw
	nYXDaxhDnj41TDkyDY+5B0Kc7D2cMqkgnZJ3TivlMbG8271nMT6YKmsoBJg54f5tvtT1wPr6dEN
	TahfaRWlBnNSA6J3/5xPk68boNh/3QhBy7qZpESNctDKYD1j/FHSa0fa5BYEiRex5RKw5aCMRrA
	vG/acHaTasiAUSNJ3/gDEEZT3+FCW4QkxO84lILV3KoHwrxdoHGAmB7uXcn0yrtuuAi+nyd3jPJ
	JEz6WaLbnPlxhla+pZCHVofnAuA56vj+bjs=
X-Google-Smtp-Source: AGHT+IFh/X+SuVWD5f+A/Xfdz4LWk6Qn0wzKP3GcgyDz8cQQc6PNyaXuXPuPY3dXMqbOCfNpeX3V7w==
X-Received: by 2002:a05:600c:3b25:b0:42c:e0da:f15c with SMTP id 5b1f17b1804b1-4334f018a5amr48557245e9.20.1732188733250;
        Thu, 21 Nov 2024 03:32:13 -0800 (PST)
Message-ID: <628d213e-aeda-4311-9366-09f5a18508fc@suse.com>
Date: Thu, 21 Nov 2024 12:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: limit GDT and LDT mappings areas to max number of
 vCPUs
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241121111218.50984-1-roger.pau@citrix.com>
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
In-Reply-To: <20241121111218.50984-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.11.2024 12:12, Roger Pau Monne wrote:
> The allocation of the paging structures in the per-domain area for mapping the
> guest GDT and LDT can be limited to the maximum number of vCPUs the guest can
> have.  The maximum number of vCPUs is available at domain creation since commit
> 4737fa52ce86.
> 
> Limiting to the actual number of vCPUs avoids wasting memory for paging
> structures that will never be used.  Current logic unconditionally uses 513
> pages, one page for the L3, plus 512 L1 pages.  For guests with equal or less
> than 16 vCPUs only 2 pages are used (each guest vCPU GDT/LDT can only consume
> 32 L1 slots).
> 
> No functional change intended, all possible domain vCPUs should have the GDT
> and LDT paging structures allocated and setup at domain creation, just like
> before the change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
perhaps with the small adjustment Andrew has asked for.

Jan

