Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F742929EC5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 11:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755216.1163513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkTq-0000Rg-Fi; Mon, 08 Jul 2024 09:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755216.1163513; Mon, 08 Jul 2024 09:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQkTq-0000PD-CY; Mon, 08 Jul 2024 09:16:18 +0000
Received: by outflank-mailman (input) for mailman id 755216;
 Mon, 08 Jul 2024 09:16:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQkTp-0000P7-C4
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 09:16:17 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba96a48d-3d0a-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 11:16:16 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3679df4cb4cso2196881f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 02:16:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b102152fesm5727098b3a.135.2024.07.08.02.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 02:16:15 -0700 (PDT)
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
X-Inumbo-ID: ba96a48d-3d0a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720430176; x=1721034976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1UOSsKL+ff0siteDEHPe626VfMHXW8Qgnm1JW0p7n7E=;
        b=eyzKxlePsZjC7Z0oyIL+Upyh1DFMlJFbxfYZ17IzLnJCYLYrpZr9/5GzlYYol35MjS
         6NSuBYfweFsTqkPDn2sXCRzmDZkBHnHrb9DmJGO3bSHTtnRNUD4RtKIc3s9pJ+ias3m3
         rZnQvghl3myz04eNx4G/ECISYYBkqpH0ZslMQmwQKDv1jD8Llot6TY5gpkE7Cdt7RFdh
         dzglDs9bwFhmzc/Rdyq64NFob10RW0khpTtabXgHXkpbJCj+RbODn/jhD0VOqrv2FgbZ
         1i8v3X0Is8kprrR3/wi1erfrEVUSZjCKVz840bU1dF8zJGAU5GcvYuwCYSsUs0qHvn/c
         dAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720430176; x=1721034976;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1UOSsKL+ff0siteDEHPe626VfMHXW8Qgnm1JW0p7n7E=;
        b=SpfEvvUZgAvd7cfdzQyNe3HKWjz7UJX0fqbogXGwrsBYokkMclFL1LFXw79h7HlXYb
         MhRI2Ub+yokWSx16En42qRL1I1jrhY19Eg4K49qAP/M4AD+I7IT0ek/s8QMby95bYFRj
         YeETZRSHSY8PGC8Cv3RnfIhkl9u+wHyB9jIsZHcZj68g8ouwRRawFtksJWp2aD/e+tBm
         Tz2wH0wAMHt/JFfuJxY2gM/lGhAV/P5OnGOpNydTq6TUcz0C30Fv9TvjK7f9IQfIMibt
         3sPLSX67e5mDxk0SRPDNCFYvcgyf0eeGE8Vqxb1ljJPG0ZvNUZcnV5BezmWUJwtvHqKk
         g3dw==
X-Gm-Message-State: AOJu0YxIK+N09+JGawwgdfXbKPQTJZ2NnRT4NCC4HxgCmWr2mUpz4ill
	paxzVx3iPhz95H442qa+is2r6vcfS7+EZm/1htkRJgRvEofomhtMOzubDvf+jEQoM3ecoEpDuz8
	=
X-Google-Smtp-Source: AGHT+IF3Pm24ab4JZ48HfGb7X7GU0t0Mva7ntx7d83Rk9xq02Bw/gnwP5om0oa2n/ncpT05YYFxJqw==
X-Received: by 2002:adf:f507:0:b0:367:865d:30b6 with SMTP id ffacd0b85a97d-3679f6e578dmr10465465f8f.8.1720430175747;
        Mon, 08 Jul 2024 02:16:15 -0700 (PDT)
Message-ID: <33d8a4ce-6d20-4fc6-9b67-dbb63e38590d@suse.com>
Date: Mon, 8 Jul 2024 11:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: GNTTABOP_setup_table yields -1 PFNs
From: Jan Beulich <jbeulich@suse.com>
To: Taylor R Campbell <riastradh-xen-devel@NetBSD.org>
Cc: xen-devel@lists.xenproject.org
References: <20240706022242.3238584D44@mail.netbsd.org>
 <9d3d1e2e-738e-4ed8-a771-ca541fde9002@suse.com>
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
In-Reply-To: <9d3d1e2e-738e-4ed8-a771-ca541fde9002@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2024 11:09, Jan Beulich wrote:
> On 06.07.2024 04:22, Taylor R Campbell wrote:
>> On a Xen 4.14 host (with extraversion=.0.88.g1d1d1f53), with version 1
>> grant tables, where GNTTABOP_query_size initially returns nr_frames=32
>> max_nr_frames=64, a NetBSD guest repeatedly queries
>> GNTTABOP_setup_table for successively larger nr_frames from 1 up.
> 
> First question: Is there some earlier GNTTABOP_setup_table that you invoke?
> I'd expect (and also observe) nr_frames=1 initially.
> 
> Second: The version you name is pretty unclear from an upstream perspective.
> Leaving aside that 4.14 is out of support, it's entirely unclear whether you
> at least have all bug fixes in place that we have upstream (4.14.6). Without
> that it's hard to see what you're asking for.
> 
>> The guest initially gets arrays of valid-looking PFNs.  But then at
>> nr_frames=33, the PFNs [0] through [31] in the resulting array are
>> valid but PFN [32] is -1, i.e., all bits set.
>>
>> GNTTABOP_setup_table returned 0 and op.status = GNTST_okay, so it
>> didn't fail -- it just returned an invalid PFN.  And _after_
>> GNTTABOP_setup_table yields -1 as a PFN, GNTTABOP_query_size returns
>> nr_frames=33 max_nr_frames=64, so the host thinks it has successfully
>> allocated more frames.
>>
>> What could cause the host to return a PFN -1?  Is there anything the
>> guest does that could provoke this?  Are there any diagnostics that
>> the guest could print to help track this down?  (I don't control the
>> host.)  Should a guest just check for -1 and stop as if it had hit
>> max_nr_frames?
> 
> I'm afraid for the moment, from just the information provided, I can't
> reproduce this using a simple patch on top of XTF's self-test (see below).
> Neither with a 64-bit PV guest, nor with a 32-bit one. I've been doing
> this with a pretty recent 4.19 Xen, though.

Doesn't reproduce for me with 4.14.6 either.

Jan

