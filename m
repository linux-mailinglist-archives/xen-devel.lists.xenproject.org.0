Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997479C4129
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 15:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833919.1249161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVbT-0005EX-83; Mon, 11 Nov 2024 14:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833919.1249161; Mon, 11 Nov 2024 14:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVbT-0005Bc-54; Mon, 11 Nov 2024 14:41:19 +0000
Received: by outflank-mailman (input) for mailman id 833919;
 Mon, 11 Nov 2024 14:41:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAVbS-0005BW-Bk
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 14:41:18 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 002488f5-a03b-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 15:41:13 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-431688d5127so35673815e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 06:41:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda051c6sm12942515f8f.99.2024.11.11.06.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 06:41:12 -0800 (PST)
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
X-Inumbo-ID: 002488f5-a03b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzEiLCJoZWxvIjoibWFpbC13bTEteDMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAwMjQ4OGY1LWEwM2ItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzM2MDczLjk1NDM4OCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731336073; x=1731940873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f6hhewhKzutNZ7PC+fCbEjSisQ63N1MUTmQ+5u3Bvvk=;
        b=A8+oSRdOSdqgcUX59W/zJSFcGHTufLU44rmpPLXxdeUT9JVmaLGVeR1KK9bG/bzv0q
         9fo/c4/O6DtayJK/GjnWWgxRIDOwfYFv9BbZC6fK2mZaxwzSQOKiopgn9vxdG2UlJr2C
         fulwAlfx1ijTWuv646Fnj9CCxhSoLBZ8wHfQBKGAqvNXS5ULA0w2IXnCzOzw0gm72+XE
         6IbQfHYQq8u1HblS1h/dJKgC2UAmLjcDD1r8tz9VdZOdqqQRVk2QeRYknfxkGnpaAmYD
         KYGAlAC+jQ1q2n+j+X4mWKcvk53H2dUREsyF4O8yT8ZY8dvWjgayW98yxmmNMGfz4SSE
         Rshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731336073; x=1731940873;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6hhewhKzutNZ7PC+fCbEjSisQ63N1MUTmQ+5u3Bvvk=;
        b=MFJGmdfyihL0DIFJkDK0wkXDUnDSvhPBLul07m3VcK73q7yLZGxHbQxcti+mXFideD
         r6Z0IvK5CJ192miuVP63WkjgbJKVt+IlyHAIxH7PIWO+swFAnZpy+0rs+8iz9CwsCqFD
         Fy0++/9veGOqSTI83nOF29+Uf2FB89v1HE+ABwzJZY4BvnEn5UXHrx3uVmhz/EnM4SX0
         G070bcL9F14MG/L2FNJ3gr6081ahbcVf0rWkEub76BZIHirfp6k5kqNSxH88Evz1DtbG
         butRPGQ/BMXRA2lrs/W9nFp3F7z7pC4qQB47K38Qo4Ques+a9IuCp9sCzNqoQlXKzrhN
         Msvw==
X-Forwarded-Encrypted: i=1; AJvYcCWG0OBYW9zrWKimWlyzxmM2NUqjNzqIiJuA+44cy6pCOhv042IGcTPF0kUiCQSamu5rET/frhc1ySI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywucpld6RfaxI1W4q9HKhvkD7A4fiMUx1LKVFh0L1uJypV6wMrs
	o+o6FG5iEJfUm0YdTCJVwtG48Yu5EHxWJJ1q/sapFatRRaT7FuToB6uPruc95A==
X-Google-Smtp-Source: AGHT+IEwiKCXvRp/3gmP9Nan4oPG6Ix5KXuL+mIEptmrX0x3aGg1dXkwjohhT0UGVkEHsFCNvRXmYQ==
X-Received: by 2002:a5d:6c69:0:b0:37d:387c:7092 with SMTP id ffacd0b85a97d-381f186537fmr10669215f8f.7.1731336073181;
        Mon, 11 Nov 2024 06:41:13 -0800 (PST)
Message-ID: <36b7aa89-c87d-40a1-b721-9fa21ff9c2cc@suse.com>
Date: Mon, 11 Nov 2024 15:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] tools/libs/evtchn: Drop assert()s referencing
 MiniOS's main_thread
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241111143101.996733-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241111143101.996733-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2024 15:31, Andrew Cooper wrote:
> This breaks the build with debug active, as main_thread is not an exposed
> symbol.
> 
> This is a minimal version of commit bc4fe94a69d4 ("tools/libs/evtchn: replace
> assert()s in stubdom with proper locking").  It leaves MiniOS no worse off
> with respect to thread safety.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Juergen Gross <jgross@suse.com>
> 
> Speculative fix.  Gitlab is a little busy right now:
> 
>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1536597753

Assuming it helps:
Acked-by: Jan Beulich <jbeulich@suse.com>

Considering that 4.18 pre-dates the export restrictions, I'm a little puzzled
though. And indeed a400dd51706867565ed1382b23d3475bb30668c2 is a 4.19 commit;
the update of the main tree branch (3c81457aa338) should have used
ff13dabd3099687921145a5e3e960ba8337e7488 instead, if I'm not mistaken.

Jan

