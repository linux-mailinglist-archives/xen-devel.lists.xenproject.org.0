Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D232283BBCE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 09:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671380.1044694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSv0s-0008Tv-Fs; Thu, 25 Jan 2024 08:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671380.1044694; Thu, 25 Jan 2024 08:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSv0s-0008SN-C0; Thu, 25 Jan 2024 08:23:06 +0000
Received: by outflank-mailman (input) for mailman id 671380;
 Thu, 25 Jan 2024 08:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSv0r-0008SH-At
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 08:23:05 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f501e472-bb5a-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 09:23:02 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5100fdd37f7so2452739e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 00:23:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l21-20020a02ccf5000000b0046e6063e2c0sm4516250jaq.107.2024.01.25.00.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 00:23:01 -0800 (PST)
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
X-Inumbo-ID: f501e472-bb5a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706170982; x=1706775782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m3E4knhkWBU1uhlMvX/fdydLJX4MEs/nNUhxgOJklns=;
        b=PV8iqCcn5PBQ//rhox1btOgb7k/bUxjvGvN5qlcAfmmHf0TS1ZkGhfIbzwpIUunraP
         KqqCPqm2G7nDSxWpdfnYEqsGLbPlcL/n7zxuoCrX8dMHgCmh79Alzlx+mFaJo68lKY3M
         jT2SfkOoAXvXO0lkQuD2IQN4Bm4Ke5LbGllZjL8KX2KSVpUPteQctixOf/CdDnrYF7bv
         QHGY6mW8qRALsXL+spqL5eojCKwe+lY4V2OJfIFrOQ0XbYkl9KbCZs4AFp9QNEVDCfqY
         EMHvy20sK/dpNoL9wJs4UW6IfG24eUDj40BWwaIwgFiF/wJZCbYNqOIdUJT7dhl0BlHB
         b0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706170982; x=1706775782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3E4knhkWBU1uhlMvX/fdydLJX4MEs/nNUhxgOJklns=;
        b=bwaA+Yi4ijYITmECLuoESFFnIpvMhOAyyAnZu/R1TXQqzd1HKkgWwBWOnTTA/R4HE6
         cW2r+6fUVHBVFGa2WfViYhslsK5EySvnGi6NmtEDBzIwd1xw0CHa/tD2QyXmzrwT8v0s
         VkDxC1kq+DABHqfYtfZJRlrfIsAOiZzYmnkNG/Yy9NIUQCUU80vQMSpC1L6twc5dHu2M
         v8cn176hlZAwoFzSLte6pdJumWK+Dlc3WT4FcgWzo7IdU0qHiYwIkhnZZIQIY91Rh/Ky
         f05LRoW6V6aF9/jrpXkmOj+GeI5kcpcqIVkx16GIHjDRD3ZPc+1Q99yfblka3SKCTGpa
         1IQw==
X-Gm-Message-State: AOJu0YzS2zYSEj6KH9wrjP34AT9BSQiAjvOhjBcQNPfLO63g6uHgiRrG
	WrbmGKVZKziNfZXB8nDLjrOjCnJIz7Q2KMvwB7Z02yPxy0vBjtvhTudMFGU52w==
X-Google-Smtp-Source: AGHT+IFhPhVk7GZNmxQRA7JZsT7D8LrfoEf61NLHRghutGFew+dewPdwr78oPGF9MmX/O92dLIXY/Q==
X-Received: by 2002:a2e:b0cb:0:b0:2cf:321a:17d7 with SMTP id g11-20020a2eb0cb000000b002cf321a17d7mr403728ljl.69.1706170982313;
        Thu, 25 Jan 2024 00:23:02 -0800 (PST)
Message-ID: <dcbd607f-f7ff-4dd3-98d1-39aec51fd81b@suse.com>
Date: Thu, 25 Jan 2024 09:22:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
 <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
 <665b7ea9-77d9-4bbc-a67c-1ac0d9ba908a@suse.com>
 <37afd0b1-a6b3-41aa-8338-c99b68592c92@citrix.com>
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
In-Reply-To: <37afd0b1-a6b3-41aa-8338-c99b68592c92@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.01.2024 02:14, Andrew Cooper wrote:
> On 24/01/2024 7:28 am, Jan Beulich wrote:
>> On 24.01.2024 02:34, Stefano Stabellini wrote:
>>> I managed to get back to read the mailing list and noticed this patch.
>>>
>>> Is it still relevant and needs to be reviewed?
>>>
>>> Are there any outstanding disagreements between maintainers on the
>>> approach to take here?  Or should I just go ahead and review it?
>> It is still relevant from my pov, and everything that may be controversial
>> is said ...
> 
> BUGFRAME_* cannot legitimately modify the interrupted context.  Two are
> fatal paths, and other two are side-effect-less as far as C can tell.
> 
> So the infrastructure ought to take a const pointer.
> 
> The reason why this pointer is non-const is to do with the interaction
> of the serial and keyhandler infrastructures.  Because we're adjusting
> that for other reasons, I was hoping it would subsequently be easy to
> switch Xen to being properly const in this regard.
> 
> Turns out it is:
> 
>  
> https://gitlab.com/xen-project/people/andyhhp/xen/-/commit/4f857075005da1d28632e4f9198c2e7d0f404b9a
> 
> with a couple of caveats.  (Only the buster-gcc-ibt run failed, so I've
> got some cf_check-ing to adjust, but all the other builds worked fine).
> 
> 
> To make the serial code compile, I ended up having to revert patch 2 of
> the regs series, which I believe is safe to do following patch 3-5 which
> un-plumb the regs pointer deeper in the call chain.  If this is turns
> out to be true, then the patch ought to be added and reverted in the
> same series so it isn't left hanging about after the fact.

Looking further into this, I can't see how reverting ought to be possible,
even less so specifically after patch 5. Patches 4 and 5 merely eliminate
now unused parameters. Hence imo if it could be reverted after 5, it also
ought to be fine to revert after 3. Which in turn it would mean it's not
needed at all. Which I simply cannot see (yet?).

Jan

