Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33880CA9A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651782.1017598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg86-0004rn-Gt; Mon, 11 Dec 2023 13:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651782.1017598; Mon, 11 Dec 2023 13:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg86-0004oa-DW; Mon, 11 Dec 2023 13:15:26 +0000
Received: by outflank-mailman (input) for mailman id 651782;
 Mon, 11 Dec 2023 13:15:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCg85-0004oU-5R
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:15:25 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5709bfc6-9827-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:15:22 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-333536432e0so4215361f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 05:15:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w13-20020adfee4d000000b00333339e5f42sm8551477wro.32.2023.12.11.05.15.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 05:15:21 -0800 (PST)
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
X-Inumbo-ID: 5709bfc6-9827-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702300522; x=1702905322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z0E99ltGA4U4MPpSpQ5Oz3HMmlRY+NofmztQCpcbwdM=;
        b=hDcXWeJqKCoK+0jcX/cyfTWzQ9Srvkz+fsg8JXm7J5WRTyNh6P/iu/srj5CZTMgN+x
         UFtcY55L5KO/C6Sur5bHPJS6+rXCj6HoAWeTTDl3P3huSowBOCRr6FiMCn2wG2Efad93
         KhkKBwXlZa/nIInPfrh3BmcqF09bMQPBWBtgXoTLLfzp8iFzvi/p4lqNm+I4KEGxq/nS
         cyLE8ONJBB4Eob7p8yEG3XMPoSOTd3pBICWGogKalDIU02r3DcyUtiH4KEW4WocPlSwR
         AGXKpyRxVKVx35LyrEuvs6Y1ahqyKIthFsZL87nxJhinza42IW3N7tFz7AqwBUZZbqS5
         Pq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702300522; x=1702905322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0E99ltGA4U4MPpSpQ5Oz3HMmlRY+NofmztQCpcbwdM=;
        b=MbbzMuqK/XHlG6C82ChPKH8lvIBtVDwAgOy2V1YCE12HOEqsLekSXhwhwId891cb9B
         OwVwhccCRJRhXcXWr3nO+IdcmTW6YYby8Dbv3UqYjFw8iJhe/WHVBvPKLpYME43lJ/LP
         lTuPf+PbThLFhTci/l5EOER/spTcjo9WiuTENuD+v1BcsoI7LIluLZRAG8OuZ6PkPcFA
         Iegl9qiHs4pQW3w4S+M/J+BrjCIHtwIBTHyFgP0cS6SrNiLiQNpJ96pCgKbhpXNyQyft
         shA1H0l1HWwhceWcBXQg2RMDAFdYkR1lx255kOpNrP5kHmBUOJvZDHeiXE/s6e/xZ0VV
         dw/g==
X-Gm-Message-State: AOJu0Yx2SES0asw9gucu1/YnVBWOjMHpIMRT88jS20ZqvLyTdQYINFjz
	B05HpWjktkU/TpY9yrdHFVVl
X-Google-Smtp-Source: AGHT+IF8fG47zP/awtGxv1Wa4W6nh2oOwl2pCUvwuwWS0sEVseHsAPUpd2kl3b8XcrJhHrXJ1F5ICA==
X-Received: by 2002:a5d:4b83:0:b0:332:eee9:6e7f with SMTP id b3-20020a5d4b83000000b00332eee96e7fmr2264667wrt.56.1702300522198;
        Mon, 11 Dec 2023 05:15:22 -0800 (PST)
Message-ID: <c08dd900-677a-4356-9412-6b6ec3199ee8@suse.com>
Date: Mon, 11 Dec 2023 14:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <dcc726f5-634e-4b48-aa8f-d477cdc8dea9@suse.com> <ZW4L5Q4SMprtmbK-@macbook>
 <5f7c43ca-dfc4-4929-8776-6985e610e154@suse.com> <ZW8zyXkUJDKVt-HX@macbook>
 <2ded19f7-2ba6-4b1c-8752-a73894dcdae0@suse.com> <ZW9H1uE_6k3d-uWn@macbook>
 <21cdb9ad-81f5-497a-bfd8-ef6aea5906e2@suse.com> <ZXbodK0CcT5U1i5V@macbook>
 <011bdf3f-6cbd-49e6-b1d8-10c77722664e@suse.com> <ZXcD5lsCd6E_HBbe@macbook>
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
In-Reply-To: <ZXcD5lsCd6E_HBbe@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2023 13:43, Roger Pau Monné wrote:
> On Mon, Dec 11, 2023 at 12:31:11PM +0100, Jan Beulich wrote:
>> On 11.12.2023 11:46, Roger Pau Monné wrote:
>>> On Wed, Dec 06, 2023 at 08:27:59AM +0100, Jan Beulich wrote:
>>>> On 05.12.2023 16:55, Roger Pau Monné wrote:
>>>>> On Tue, Dec 05, 2023 at 03:59:13PM +0100, Jan Beulich wrote:
>>>>>> On 05.12.2023 15:29, Roger Pau Monné wrote:
>>>>>>> On Tue, Dec 05, 2023 at 09:52:31AM +0100, Jan Beulich wrote:
>>>>>>>> On 04.12.2023 18:27, Roger Pau Monné wrote:
>>>>>>>>> On Tue, Nov 28, 2023 at 11:34:04AM +0100, Jan Beulich wrote:
>>>>>>>>>> ..., at least as reasonably feasible without making a check hook
>>>>>>>>>> mandatory (in particular strict vs relaxed/zero-extend length checking
>>>>>>>>>> can't be done early this way).
>>>>>>>>>>
>>>>>>>>>> Note that only one of the two uses of hvm_load() is accompanied with
>>>>>>>>>> hvm_check(). The other directly consumes hvm_save() output, which ought
>>>>>>>>>> to be well-formed. This means that while input data related checks don't
>>>>>>>>>> need repeating in the "load" function when already done by the "check"
>>>>>>>>>> one (albeit assertions to this effect may be desirable), domain state
>>>>>>>>>> related checks (e.g. has_xyz(d)) will be required in both places.
>>>>>>>>>>
>>>>>>>>>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>> ---
>>>>>>>>>> Do we really need all the copying involved in use of _hvm_read_entry()
>>>>>>>>>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
>>>>>>>>>> handle that way, but for strict loads all we gain is a reduced risk of
>>>>>>>>>> unaligned accesses (compared to simply pointing into h->data[]).
>>>>>>>>>
>>>>>>>>> See below, but I wonder whether the checks could be performed as part
>>>>>>>>> of hvm_load() without having to introduce a separate handler and loop
>>>>>>>>> over the context entries.
>>>>>>>>
>>>>>>>> Specifically not. State loading (in the longer run) would better not fail
>>>>>>>> once started. (Imo it should have been this way from the beginning.) Only
>>>>>>>> then will the vCPU still be in a predictable state even after a possible
>>>>>>>> error.
>>>>>>>
>>>>>>> Looking at the callers, does such predictable state after failure
>>>>>>> matter?
>>>>>>>
>>>>>>> One caller is an hypercall used by the toolstack at domain create,
>>>>>>> failing can just lead to the domain being destroyed.  The other caller
>>>>>>> is vm fork, which will also lead to the fork being destroyed if
>>>>>>> context loading fails.
>>>>>>>
>>>>>>> Maybe I'm overlooking something.
>>>>>>
>>>>>> You don't (I think), but existing callers necessarily have to behave the
>>>>>> way you describe. From an abstract perspective, though, failed state
>>>>>> loading would better allow a retry. And really I thought that when you
>>>>>> suggested to split checking from loading, you had exactly that in mind.
>>>>>
>>>>> Not really TBH, because I didn't think that much on a possible
>>>>> implementation when proposing it.
>>>>
>>>> But what else did you think of then in terms of separating checking from
>>>> loading?
>>>
>>> Just calling the check and load functions inside of the same loop was
>>> my initial thought.
>>
>> Okay, I was meanwhile also guessing that this might have been what you
>> thought of. I can go that route, but I wouldn't want to make it "and", but
>> "or" then, depending on a new boolean parameter to be passed to hvm_load().
>> IOW I'd still like to do all checking before all loading (in the longer
>> run, that is i.e. after individual handlers have been adapted). Would that
>> be okay with you?
> 
> Yes, that would be fine.  I assume you will introduce a 'dry run'
> parameter then?

Something like that, yes. I considered and discarded (mentally) "dry run"
for naming though, as the functions performed really differ (to me "dry
run" would mean that all the same checking would be done again when doing
the "real" run). I was further considering "check", "check_only", "load",
and "real", but to be honest I don't really like any of them. So the
naming aspect is still pending.

Jan

