Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47CB3DEFA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 11:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104320.1455401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut17s-0004hv-OA; Mon, 01 Sep 2025 09:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104320.1455401; Mon, 01 Sep 2025 09:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut17s-0004fI-LW; Mon, 01 Sep 2025 09:47:00 +0000
Received: by outflank-mailman (input) for mailman id 1104320;
 Mon, 01 Sep 2025 09:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut17r-0004fC-Gf
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 09:46:59 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a39f5d0-8718-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 11:46:58 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b042cc3953cso88966266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 02:46:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff138a8d76sm647187766b.104.2025.09.01.02.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:46:57 -0700 (PDT)
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
X-Inumbo-ID: 9a39f5d0-8718-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756720018; x=1757324818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ6F+aQyVrvB/LlVapH5CK/OgUF5efu6JGzji+l4emg=;
        b=MGaujecAORP0G3YzR4L3JOYBhGTiVBBdDnzWby7Crwrp/YcO3V69FX3RFo7ukFthQV
         VjEwJH4iONw+/+Cr7sgmAw0EwJiPEz8BE2GUwt/+k6/aJNcc7cYf6f2UmUZSXggRXqWt
         EJe6O4lEJVGGr4tOhj03KAM5+oJNiO03kmJe7CUk7q26BxPp8J37AwhP7pyTV+8ARr2L
         YugH+OaEc2itjQkv8lbsCuf1OOJQG2WPJ9ae1HHbc4ZNa1inkH9en4PyhMGJTjAR4ZgO
         QC9z2A890P3Is81VU++WlkbWoikAlTLRDSAb2baSor5cRpr4xRpdRHmMbQ3391gcSOiq
         rfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720018; x=1757324818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ6F+aQyVrvB/LlVapH5CK/OgUF5efu6JGzji+l4emg=;
        b=pitHVQfTQvqO8lz/2hp+plihEidQvmF2OSd/PyQswsOaQBzpm/dfdZtknVvX+suYdV
         pWeMozPB9YurD7WAyXWewfAnISeAvWOPyfsGxm5GvTm7KH8RuAhI7klN8RP5rTl6OCWG
         Vhckm6l01PCg/i6Bl0L0U1MeByhlAK2/MPv1a4rdc+sfdKeb2awDwHqrdxLHMS7a8mCn
         SYRxcG5/6IvQA2KE7hetFWUaCWE2xbiv5vvhqi0vzGSq1CqNVzXvKXU67voZ7F6x9GbO
         tcAvnDSRT8pFfcKgS9P638818NfpiE+xB3DH9CN7/IBW3dgoknZF5eoecawv7SLOMtZN
         HS/w==
X-Forwarded-Encrypted: i=1; AJvYcCV2FlZv5JNe7MBQh5wUYir3SO6AtAFjc0cL6WCicPr/Efo+5WywOSs0RZn0gBm8Inhnz0qcGptg8Eg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbGU0HN89KgVnoUD0XTTXH243ICtqbRGr161EMFb9xkWnKv55O
	x32DBie6ag2032JWlzFXk/Id4+5XEQinbmSvPHQXfo5cEAO9eMxLpmDFjvnDa5CfM9YLJeAe/+P
	o654=
X-Gm-Gg: ASbGnctnP6RmQIAp/HoGLN2on77Sdsur9R0WQjkgAhJVkVa66vLkFPV5cGtKEWFfXnx
	lUuTYXbJ4vtEYHxY4b+OJ92eQ7nj86nbk2DvS2S21RxvxAC2hiEX7+R3+5KuJI+qWN1PBmmkn21
	o1KbDcwyJfCYX7VBsVz5PZN5q9x64W+gteGquWAgRr5RCzLFexzd3CiPwwNw08wE3sJddP1gAgq
	tZSktKJNPqX4WX/R6gTMRmlXlvlymyna3i0FM8Ue8C4merPAnyvc2x/oSU/imiUjey4bce0AqLp
	zfd9hv05mgKnTIKjQwONGS4uE0DhsBPbzWya8zOyYTeoEikTvR8ZX6vu8q9qUNWjGOp7WdgWdq6
	Oi1KEO/sdsSh1I9gG4wu10lT50px+9EY8BlnVitHaSEVxRJQ9EXpxjxKOWZLD3jOt5IlM6IOYbU
	9HkmbTmEIG7tDzJcxfGQ==
X-Google-Smtp-Source: AGHT+IH8eX6qnIh209AHzFZ3trUjBXKVMsxN9lYxZIjEyfq2IwOrd1qwbTCWFSQiMHckd1LD7djbPQ==
X-Received: by 2002:a17:906:c142:b0:afe:bb6d:1caf with SMTP id a640c23a62f3a-b01f20fbb68mr777004266b.62.1756720017988;
        Mon, 01 Sep 2025 02:46:57 -0700 (PDT)
Message-ID: <5c0cb015-b2e7-467d-9c1f-2314bcb66ad6@suse.com>
Date: Mon, 1 Sep 2025 11:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/23] x86/traps: Make an IDT-specific #PF helper
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-12-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
> FRED provides %cr2 in the the stack frame, avoiding the need to read %cr2
> manually.
> 
> Rename do_page_fault() to handle_PF(), and update it to take cr2, still named
> addr for consistency.
> 
> Introduce a new handle_PF_IDT() which reads %cr2 and conditionally re-enables
> interrupts.

Why does this IRQ-re-enabling move to the IDT-specific function? Do you intend
to do the re-enabling yet earlier in FRED mode?

Jan

