Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B4D0ABD4
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 15:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198926.1515706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veDoj-0008Kp-SQ; Fri, 09 Jan 2026 14:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198926.1515706; Fri, 09 Jan 2026 14:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veDoj-0008Ij-Pt; Fri, 09 Jan 2026 14:50:21 +0000
Received: by outflank-mailman (input) for mailman id 1198926;
 Fri, 09 Jan 2026 14:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1veDoi-0008Id-UB
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 14:50:20 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83d703cc-ed6a-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 15:50:18 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4327790c4e9so2192305f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 06:50:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacdcsm22809504f8f.1.2026.01.09.06.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 06:50:17 -0800 (PST)
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
X-Inumbo-ID: 83d703cc-ed6a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767970218; x=1768575018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9cy2chGiAyYIggTragQXQxt+EIWxHkStfsPg6ed+OJw=;
        b=Sp8Veq7HnTAyAX9OTxwvyZenLLdfJDZr7NMIfiGXErKbh6mZmvDp37Aqn+PftWseBs
         kGe6EvMJeLl4ibemDi6b2FxkLXtTuAtOwCfh8J94ocLVrn4hU5H9nwY5/609O0VshEtk
         iT48jmzhJlArBKRfW2gIa355/4VdB7tm0hgUiZc27Q9IYPDxIMl/8FnUs/JM/aCzGWIp
         z/ukQ11Fm6Z74sZR7e8ntAhaFEhDHTdq1bUD8zcDa7g9xrdHFA/gb5MQd/rnWtfDpFWX
         PMmnDZlYRyOLGiE+q6pQJE5n29lSFIx1FwkZn6Tk0RY0FSWqd7PgiYB6dc4iNyKCXgzm
         O3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767970218; x=1768575018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cy2chGiAyYIggTragQXQxt+EIWxHkStfsPg6ed+OJw=;
        b=uasyb9GnheKf5rMQvmsTzlFGLAa59ph/wwTRE7R9+/N44xmYzv/0dHMqKOqQjfamxC
         KXzGdBlobfY4MGfSUfQs6yFhTOCnklq1vn/Zdi8QTI+y8/dq75pnx+hj42GRMoivb7Rn
         z/b16VixkILJP203Rp4IPkxUYp5NRTnhVUjgRTQo4Ct3/+oRTeeWHXKUJmPNj7v6cw+D
         fZV+SzgFftEg1TSXVBXFNGU4mRQNiK+QHzSSLojusuUCz2CTU+3p24DRo/BLmcei87kb
         KBwACTJ62V6ADy63X/9SIZ4MhLXKXoAUvdwPMm3rMJUP34r5vPg3bpO6ACYHGL8STAL0
         kE1g==
X-Forwarded-Encrypted: i=1; AJvYcCV7VCzAUggZSvSHNhC/q/xD73D8BAlGFwkQjjC+pvmMPwNYd8ORTRx1qdD67WHjBHD6e2Oygbs08A0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+lUk1FyWrN29pkHnNZVIyofsQLXLcXaRLxOM5l/ak4mvOqUls
	4uyN3huDo3jDGKLfMEnSkf/N1trjkfztHeQY6qOspPU/MiZWgDqhEV8hStQi87b8bA==
X-Gm-Gg: AY/fxX663yeyOiputOQk8++QdSOF99C7G4YldItCFATLWie6midZV0aayE0J13VsTK/
	tA9/sUtPEO/DVjeE+Ap91Vq3Nxz7jnlGOWQpZVDunU4QGL/xNNOJpYOnYEuy7bOQIldbpUfvl3e
	RjQ5a4IIWwHyhj6nwAOS6nceKWdH43xQs+XbkQh5E2sWiKFRw/axaQbVriuMiqtivmkEpsGJows
	ChfsQacijynKwIvAsXpm/ufIFAWpgvcnMHTQIkDI5PKBDGGhaQKDkoAZVtzWG1y/aSH/rsYUBRP
	gamf168GO04Sc51dRweSXtoCF7yMk85ezhruwD2YtHFplmYyRrhAseWaXXKTIDatlM139YKxCtX
	zoNNd10LV+YBnRreeLWIl3qBK5zGcihoYjylIelUmKqPo3i/7eBkiaV/WSgImpr6CLWr2SOIyW2
	9+RDgrW/PejeP++ar9E4CyBvY8lcjjumsZg4jM0CGQ7dLPuU8K1A2bmGCuW/IbdoU7HXOEIycOu
	jM=
X-Google-Smtp-Source: AGHT+IF5HFPZEYq9rDjfXNCZ/JpLSa3X1xHn+Px8GTwboA7pK+xzhHmB1wRTAoX66BFRuLbmBLxDFA==
X-Received: by 2002:a05:6000:4008:b0:431:53:1f49 with SMTP id ffacd0b85a97d-432c374f461mr13445922f8f.41.1767970217649;
        Fri, 09 Jan 2026 06:50:17 -0800 (PST)
Message-ID: <2cf49422-99e5-44de-ba5c-3b0c54eb13fd@suse.com>
Date: Fri, 9 Jan 2026 15:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/mm: add a NUMA node parameter to
 scrub_free_pages()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260108175536.82153-1-roger.pau@citrix.com>
 <20260108175536.82153-2-roger.pau@citrix.com>
 <a8d09b82-3013-4476-b358-08b5fdc14cf1@suse.com> <aWEU2jKO12e5TYtz@Mac.lan>
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
In-Reply-To: <aWEU2jKO12e5TYtz@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2026 15:46, Roger Pau Monné wrote:
> On Fri, Jan 09, 2026 at 11:22:39AM +0100, Jan Beulich wrote:
>> On 08.01.2026 18:55, Roger Pau Monne wrote:
>>> Such parameter allow requesting to scrub memory only from the specified
>>> node.  If there's no memory to scrub from the requested node the function
>>> returns false.  If the node is already being scrubbed from a different CPU
>>> the function returns true so the caller can differentiate whether there's
>>> still pending work to do.
>>
>> I'm really trying to understand both patches together, and peeking ahead I
>> don't understand the above, which looks to describe ...
>>
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1339,16 +1339,27 @@ static void cf_check scrub_continue(void *data)
>>>      }
>>>  }
>>>  
>>> -bool scrub_free_pages(void)
>>> +bool scrub_free_pages(nodeid_t node)
>>>  {
>>>      struct page_info *pg;
>>>      unsigned int zone;
>>>      unsigned int cpu = smp_processor_id();
>>>      bool preempt = false;
>>> -    nodeid_t node;
>>>      unsigned int cnt = 0;
>>>  
>>> -    node = node_to_scrub(true);
>>> +    if ( node != NUMA_NO_NODE )
>>> +    {
>>> +        if ( !node_need_scrub[node] )
>>> +            /* Nothing to scrub. */
>>> +            return false;
>>> +
>>> +        if ( node_test_and_set(node, node_scrubbing) )
>>> +            /* Another CPU is scrubbing it. */
>>> +            return true;
>>
>> ... these two return-s. My problem being that patch 2 doesn't use the
>> return value (while existing callers don't take this path). Is this then
>> "just in case" for now (and making the meaning of the return values
>> somewhat inconsistent for the function as a whole)?
> 
> I've added those so that the function return values are consistent,
> even if not consumed right now, it would make no sense for the return
> values to have different meaning when the node parameter is !=
> NUMA_NO_NODE.  Or at least that was my impression.
> 
> In fact an earlier version of patch 2 did consume those values.  I've
> moved to a different approach, but I think it's good to keep the
> return values consistent regardless of the input parameters.

My point was though: The present "true" return doesn't mean "Another CPU
is scrubbing it." Instead it means "More work to do" aiui. That's similar
in a way, but not identical.

Jan

