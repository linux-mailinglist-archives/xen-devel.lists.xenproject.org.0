Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC7A5C883
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908382.1315508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1n1-0000GF-Sp; Tue, 11 Mar 2025 15:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908382.1315508; Tue, 11 Mar 2025 15:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1n1-0000E2-PX; Tue, 11 Mar 2025 15:45:07 +0000
Received: by outflank-mailman (input) for mailman id 908382;
 Tue, 11 Mar 2025 15:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ts1n0-0000Dw-U0
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:45:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdd5ab2b-fe8f-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:45:06 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so26325105e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:45:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cea8076fcsm117908575e9.15.2025.03.11.08.45.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:45:05 -0700 (PDT)
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
X-Inumbo-ID: cdd5ab2b-fe8f-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741707905; x=1742312705; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zdHLJPJl7l7uqIh9CSFve3F+wK9rtDug0M8CSSvpwP0=;
        b=Z9nIYCbWzGrqaZQWuOMo4MFUv/3cPn4gbE4/YXKiLnxpDJT9PtTxq51uqRUsx2ciE3
         ptIIdRFTlvvtdMn89Y8mfFrSwUEBpRG4zoL138aa8wwq6IGGMDJILY65ZDtTiLv8zxao
         lNZoPC+NkdrAXI1EW7j2ymO+ZhEqqa+u1phGQooHZIy0aAQr6pYUnHFVgveiTJiAuQnM
         33KxpgpzrMGffxH+yrd6YmeL2NfNbvF477iDZcKikdezNGk3gUgYVe/T5OuG24JysHqF
         M0Pl9m+FUlcqOOYBUvvUw5ucYgGhSJzg3nzG5mdIPsGcB44hfosy54+PH/UlYjC4mI+u
         eKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741707905; x=1742312705;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdHLJPJl7l7uqIh9CSFve3F+wK9rtDug0M8CSSvpwP0=;
        b=dB8yqV74/cdrA3LvbHX9z/7qGC5SashxV6M8IwoJ0mUuQAtsfQa71I0Ec1YfQ5asZ9
         UQLmAPIYFO8837YQaU7788X+IGsia7ZM2JSgPHrSCjaE8s+XU3ivD0LyT6C85H+LiDf8
         so1pqwzRUsn2uRpz6fNBTjEPZNPlvDbUit+nNKUJR8UrNsjBbB00kltzOwgZ21RvgNzW
         O9oqqZ4ubJDjbGj6iETuiboAIGlaeP3tQXnMxmmrYjdznUIW766855Lt2VpD54VLPSgO
         71musL/z5mNhbHXURms+0yL7R5ErLGec+CoMO3sr9RDmKC6TmjUtdvpy9sl9I3XRoUkj
         cVTw==
X-Gm-Message-State: AOJu0YyAxpkvYgvDmqb+mhfoggwUaKUgps8fsIMHsgFS/DowDFr+zLYz
	5WvkfmXpcm8yTCUO1p+VMJ8ZE0Q3ciq4BgE43mb96dyJ9H3xwXxozvliR89WWQ==
X-Gm-Gg: ASbGncuDMrFpbRCm4JIrFxn6BKL+PD3PREuWK60o6YdHJrHGmYeX9AhisOcLqLY5rPa
	ZJy0Y1IbvabUXmdmw/ITifPCPWPinPGhQtPwiJ9GlJ8xY3vOFYcEEqDnOmC3WqUBZjmLnJF9MfV
	RPov4ZtoJCJFnU3u380V8yps4rlLFSBMHaCTKX9/60PVOjZRG93iEXJCpo98FI74SV+DWKVrDDj
	h5s6BRDB+4yqAA5bV+vr15Ylz6hBrjqBSgzmFAJvCz6NkpN2MZn+69ArFyLNF5N8HPCm4p6QLB+
	+08UJHAb/pRznTuvhY2eQrZvLXbRXfXvUKoeFD3tDrDJ6WjOVf6OHfZKTFd7dUt8D8aMAW/SR5C
	04vRJo+H+vh+xQZR5GU1cDOv1YXCpvw==
X-Google-Smtp-Source: AGHT+IGscGJVDGiTKJrBIqCxQB2waYCffCOpXuB9USiwiJlKiASVvQKtk6aDDnvijT2bwhKFWnVXbA==
X-Received: by 2002:a05:600c:1e8c:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43cfc0c92bcmr98991515e9.2.1741707905403;
        Tue, 11 Mar 2025 08:45:05 -0700 (PDT)
Message-ID: <de418de2-b059-4f1e-92b0-42a236208b14@suse.com>
Date: Tue, 11 Mar 2025 16:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/page_alloc: Simplify domain_adjust_tot_pages
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250304111000.9252-1-alejandro.vallejo@cloud.com>
 <Z9AwsrDBELe2UREz@macbook.local> <D8DITFXFKM32.2H5OOI4GVUAZ1@cloud.com>
 <Z9BZ-V8fWHOAwMJ7@macbook.local>
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
In-Reply-To: <Z9BZ-V8fWHOAwMJ7@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2025 16:42, Roger Pau Monné wrote:
> On Tue, Mar 11, 2025 at 02:53:04PM +0000, Alejandro Vallejo wrote:
>> On Tue Mar 11, 2025 at 12:46 PM GMT, Roger Pau Monné wrote:
>>> On Tue, Mar 04, 2025 at 11:10:00AM +0000, Alejandro Vallejo wrote:
>>>> The logic has too many levels of indirection and it's very hard to
>>>> understand it its current form. Split it between the corner case where
>>>> the adjustment is bigger than the current claim and the rest to avoid 5
>>>> auxiliary variables.
>>>>
>>>> Add a functional change to prevent negative adjustments from
>>>> re-increasing the claim. This has the nice side effect of avoiding
>>>> taking the heap lock here on every free.
>>>>
>>>> While at it, fix incorrect field name in nearby comment.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>> I think it would be nice to also ensure that once the domain is
>>> finished building (maybe when it's unpaused for the first
>>> time?) d->outstanding_pages is set to 0.  IMO the claim system was
>>> designed to avoid races during domain building, and shouldn't be used
>>> once the domain is already running.
>>>
>>> Thanks, Roger.
>>
>> As a matter of implementation that's already the case by toolstack being "nice"
>> and unconditionally clearing claims after populating the physmap.
> 
> I see.  Another option would be to refuse the unpause a domain if it
> still has pending claims.  However I don't know how that will work out
> with all possible toolstacks.
> 
>> However, I agree the hypervisor should do it on its own. I didn't find a
>> suitable place for it. 
> 
> You could do it in arch_domain_creation_finished().

Except that better wouldn't be arch-specific.

Jan

