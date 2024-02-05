Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918758499EA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 13:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675991.1051716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWxv3-0003WC-Lo; Mon, 05 Feb 2024 12:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675991.1051716; Mon, 05 Feb 2024 12:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWxv3-0003UU-Iy; Mon, 05 Feb 2024 12:17:49 +0000
Received: by outflank-mailman (input) for mailman id 675991;
 Mon, 05 Feb 2024 12:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWxv2-0003UO-GM
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 12:17:48 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91973205-c420-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 13:17:45 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3394b892691so1697885f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 04:17:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g10-20020a5d554a000000b0033ad47d7b86sm7890967wrw.27.2024.02.05.04.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 04:17:44 -0800 (PST)
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
X-Inumbo-ID: 91973205-c420-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707135465; x=1707740265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pnLQU156qglclpTYG17iu3Nhhrp07dcXEqyoenXfh04=;
        b=emlClxIIH8Mp4+VA2S80FQyIJflDYbHJ+njOtGI+LWXFYnjo/5c34NBaxYdDETiNvo
         ZyykLisWjUxRTVBAEy08nvKgHOu5BpLLI9GhzHwq3kejESfcOtQUHyVgYaMkfYiadj4E
         6eQjrLdMKLnSW5C7OvKKKDBvIStqh68oxHFjF6pgeTNThAF1aQc/A1VXtzUxJQGS0e5j
         a+5eMVaKEasMmyoutKhXg0fWlBwWh1l8dsNEZEWXJhi15MOpv4jkg+hYh/oEleRxjlMO
         ti4rsGBgXyqS3SagkADhRRVi04qLDkR6cP5Llg18LCgvZfAlRC6/s506nzH2I1SEp8XD
         gLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707135465; x=1707740265;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pnLQU156qglclpTYG17iu3Nhhrp07dcXEqyoenXfh04=;
        b=CfTgI9ptzZVKsBnwJBsKRLk6R9wNhMTjN+0Y5kmdd7Bnni2iXs89VfIila3Yli/OMP
         BCHOJLzPx4TeXNiaEYXMLH9yNo3XkMxkvOCZIsyY0sxyC61zqvDnsEIn1oPwZ4GcfRha
         zCquRHaeAjl22IAi29Yd4gt/kEzsnyUyUzGTCnBCaOzyWYwF0rCEJ1PpSVnj313E2JaJ
         6gVHuLRm4kJHEnJhzwBsWCRZfgG0Xz3wH4XikJBFDU5R/DQsWFRT+C/M2tU/Hhu+oKki
         MUBGjuRw3kXh7Szb32XVDnMgiseTNz8VkVd3/IPW+1MRjWtQzSPCmzlRFUffKmfxu6jo
         QXiQ==
X-Gm-Message-State: AOJu0YxkX2E1C55p+FCDflfdlq8Al0eIUtHckj83KDINH6hA6fhNV3E1
	f9ymQ9i9tgfavOBdrFz600FgcwF/zVjWgEm3gM7WPHTxitYQvQMP1NbVc55NgA==
X-Google-Smtp-Source: AGHT+IEmvNlfdIOqYIu2HoIMGa9WQj3AuoOf4P9j0A5ZOKhcvi96EsdNbGzOibVuIccV2Km+wAVdsQ==
X-Received: by 2002:a5d:5f4f:0:b0:33b:17f1:c70e with SMTP id cm15-20020a5d5f4f000000b0033b17f1c70emr5251349wrb.24.1707135465123;
        Mon, 05 Feb 2024 04:17:45 -0800 (PST)
Message-ID: <b3cd10f2-c3b4-49cc-8bac-28f525dd574b@suse.com>
Date: Mon, 5 Feb 2024 13:17:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: Ping: [PATCH] Argo: drop meaningless mfn_valid() check
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com>
 <5d76295f-0438-4c5d-8b2e-73a1abcc96e6@suse.com>
 <CACMJ4GbvMhDdgOp=kUeL_+_j2yS_NVU69P8Xh9QYDLUwJ31Eow@mail.gmail.com>
 <CACMJ4GbNJgsg7tts=9UQPUr9ofsXajuHz7wYO1r5LnevWEL4_g@mail.gmail.com>
 <5aea32e3-033e-4299-9088-279d23801ba6@suse.com>
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
In-Reply-To: <5aea32e3-033e-4299-9088-279d23801ba6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.01.2024 09:12, Jan Beulich wrote:
> On 23.12.2023 22:35, Christopher Clark wrote:
>> On Sat, Dec 23, 2023 at 12:47 PM Christopher Clark
>> <christopher.w.clark@gmail.com> wrote:
>>>
>>> On Sun, Dec 17, 2023 at 11:55 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> Christopher,
>>>>
>>>> On 27.11.2023 14:55, Jan Beulich wrote:
>>>>> Holding a valid struct page_info * in hands already means the referenced
>>>>> MFN is valid; there's no need to check that again. Convert the checking
>>>>> logic to a switch(), to help keeping the extra (and questionable) x86-
>>>>> only check in somewhat tidy shape.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> I'd like to hold off on this just yet, sorry -- the change does look
>> ok as far as a transform being applied the prior logic and the
>> necessity of the check, but with it applied, it's not obvious that it
>> handles all the page types as best that it could there, so I'd like to
>> look at this (and the previously submitted patch again) please.
> 
> I'm puzzled: This patch merely removes a pointless check. Whatever is
> lacking with it in place will have been lacking before. Also can you
> please give a rough estimate towards when you'll be getting back on
> this, or ideally on both patches?

Another month later: I'll give it this week, and without hearing back
I'll commit what there is some time next week, with the R-b you provided.

Jan

