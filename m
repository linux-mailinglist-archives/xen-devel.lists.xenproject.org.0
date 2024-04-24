Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073098B04B8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 10:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711279.1111113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzYJa-0002Tq-6C; Wed, 24 Apr 2024 08:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711279.1111113; Wed, 24 Apr 2024 08:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzYJa-0002SJ-36; Wed, 24 Apr 2024 08:49:18 +0000
Received: by outflank-mailman (input) for mailman id 711279;
 Wed, 24 Apr 2024 08:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzYJY-0002SD-Fn
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 08:49:16 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86755401-0217-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 10:49:15 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41af670176cso4337005e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 01:49:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05600c45c700b0041aa570bcd3sm6050177wmo.35.2024.04.24.01.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 01:49:12 -0700 (PDT)
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
X-Inumbo-ID: 86755401-0217-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713948553; x=1714553353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PCK75PkcxXAGzZQmBrEXCGOwASWBfQvDG3OfwM5znzk=;
        b=ExjGeMf1wYyHURsQDGZUKUrkEQ5R/jaCItuB9kan8BlGvrNiZlfOPrmAi42CO5p42Y
         flrbWn6aimLW16FCEahw3QMFYOAE/vFqfSN/NSa7oMDD0WWvJ6dXLl3LmNZyho85Z6oe
         wfESq3aqA8GQOJuwNPupN9rYQiAzJuuT8w+XB4cqvJ7em6gyLQpY3fSNWuAPqMM0NwSL
         xFyRCSJxm8c2QjKp7WPH74NtnOM9apU+sES7sBTo4RM99rJhmSzgSOKSB/XdLQU91hYM
         oLkgDEG8rR/nDCNnYjWERnbU51hQBhWiAL65KSXLrW0kFB4gTsLZo42LbQRORg3V95PX
         NUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713948553; x=1714553353;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCK75PkcxXAGzZQmBrEXCGOwASWBfQvDG3OfwM5znzk=;
        b=fYGjK5e2XXpSQSclED/rkse1qBAGblYxNF416rTuS5vyJjVKjaTVuzyifjr0nJAvnW
         r/kVFL8ID3eRm5oij41reUiR7uHbQzV1kyX52fiKCGXFyYMQhYUBav/0WXqqP6sKCaqn
         xAk/OMoKifQz8vQTPO3+dRQQY66sxcN4viNOkDXweSJImF9j+oOzoPl+O3MzSoN8o8d2
         EiEnouFth16ncIeRz1Wc5pQ6pjIg27a5//FnHItOVOpQnBfGWnd5VqOSHDdwQiB12H6O
         ni+/3RkQpWJLFu0ejEZhYB+mez0n6ZYOjNjBdbcA3t182JpXGcBHQMWWZWosOsVZGaSk
         RJog==
X-Forwarded-Encrypted: i=1; AJvYcCX3sdgWXlCTW/BLEmoqA7jSQEYqWZSFui0w+bvgrUceG1UQ8XUZ1RZkpatOwytzby1EJC/+blszlq/SsvTrYBTGNOlkduNocl+AKPTu6fw=
X-Gm-Message-State: AOJu0YykMLLF9DlMHU+c5tc1yVjVRJmQw6fABZUIyeZtZL1dAj2X4OuK
	29/T8MOioZP2wFwrTVoGi2NuQ1cpanWNOMmx1VZWOOaNwbAsBLo91K1i6+s+wg==
X-Google-Smtp-Source: AGHT+IEDL3jPB3OkoBDZgDeI7KKpaB8hSCPLWfiXfWh7HelsY6x8Dtgi6JyTOA948FGiPYVQ7lBBsg==
X-Received: by 2002:a05:600c:5253:b0:41b:13d5:7da9 with SMTP id fc19-20020a05600c525300b0041b13d57da9mr445997wmb.38.1713948553029;
        Wed, 24 Apr 2024 01:49:13 -0700 (PDT)
Message-ID: <e4a78b6f-8c74-4da8-a0c3-fc5b9ca8c24d@suse.com>
Date: Wed, 24 Apr 2024 10:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/P2M: write_p2m_entry() is HVM-only anyway
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0d846228-323b-4427-87d1-684c3d0047c5@suse.com>
 <296c3ecc-b04d-4734-a451-0d4f9ed312d4@suse.com>
 <c38e488c-a3fb-4fcb-bd8c-b33c3fbfc2fa@citrix.com>
 <92860d34-2b8b-4fe8-bf13-31c993620006@suse.com>
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
In-Reply-To: <92860d34-2b8b-4fe8-bf13-31c993620006@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.04.2024 08:36, Jan Beulich wrote:
> On 23.04.2024 21:29, Andrew Cooper wrote:
>> On 23/04/2024 3:31 pm, Jan Beulich wrote:
>>> The latest as of e2b2ff677958 ("x86/P2M: split out init/teardown
>>> functions") the function is obviously unreachable for PV guests.
>>
>> This doesn't parse.  Do you mean "Since e2b2ff677958 ..." ?
> 
> Well. I'm sure you at least get the point of "the lastest as of", even
> if that may not be proper English. I specifically didn't use "since"
> because the fact mentioned may have been true before (more or less
> obviously). I'd therefore appreciate a wording suggestion which gets
> this across.
> 
>>>  Hence
>>> the paging_mode_enabled(d) check is pointless.
>>>
>>> Further host mode of a vCPU is always set, by virtue of
>>> paging_vcpu_init() being part of vCPU creation. Hence the
>>> paging_get_hostmode() check is pointless.
>>>
>>> With that the v local variable is unnecessary too. Drop the "if()"
>>> conditional and its corresponding "else".
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I have to confess that this if() has been puzzling me before.
>>
>> Puzzling yes, but it can't blindly be dropped.
> 
> And I'm not doing so "blindly". Every part of what is being dropped is
> being explained.
> 
>> This is the "did the toolstack initiate this update" check.  i.e. I
>> think it's "bypass the normal side effects of making this update".
> 
> Why would we want to bypass side effects?
> 
>> I suspect it exists because of improper abstraction between the guest
>> physmap and the shadow pagetables as-were - which were/are tighly
>> coupled to vCPUs even for aspects where they shouldn't have been.
>>
>> For better or worse, the toolstack can add_to_physmap() before it
>> creates vCPUs, and it will take this path you're trying to delete. 
>> There may be other cases too; I could see foreign mapping ending up
>> ticking this too.
>>
>> Whether we ought to permit a toolstack to do this is a different
>> question, but seeing as we explicitly intend (eventually for AMX) have a
>> set_policy call between domain_create() and vcpu_create(), I don't think
>> we can reasably restrict other hypercalls too in this period.
> 
> None of which explains what's wrong with the provided justification.
> The P2M isn't per-vCPU. Presence of vCPU-s therefore shouldn't matter
> for alterations of the P2M.

I've gone and checked further: The "side effects" are what the
write_p2m_entry_{pre,post}() hooks would do. Prior to the VM being
started that is a little bit of extra code which all ends up doing
nothing: There's nothing to flush, and there are no shadows to drop.
There's in particular no use of a vCPU anywhere, afaics. Plus, just
to mention it explicitly, the full path was forced anyway for nested
P2Ms, so there's no behavioral change there at all.

In fact I question the correctness of the plain safe_write_pte(),
without p2m_entry_modify(), if that path would have been taken (when
the domain has no vCPU-s yet).

Jan

