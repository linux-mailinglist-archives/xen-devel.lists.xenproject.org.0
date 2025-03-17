Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DC1A6522E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916936.1321943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuB10-00039F-3L; Mon, 17 Mar 2025 14:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916936.1321943; Mon, 17 Mar 2025 14:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuB0z-00036K-Vb; Mon, 17 Mar 2025 14:00:25 +0000
Received: by outflank-mailman (input) for mailman id 916936;
 Mon, 17 Mar 2025 14:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuB0y-00036E-H2
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:00:24 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b115a23-0338-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 15:00:22 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso20061725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:00:22 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe292d0sm106206605e9.20.2025.03.17.07.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:00:21 -0700 (PDT)
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
X-Inumbo-ID: 2b115a23-0338-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742220022; x=1742824822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7dlX/sf6WY/9VbuhRIyTJ6IkEE/L/vBSFZbNjeyyF3w=;
        b=K9e/59XrvlZz95jhjaButBfTbA3e5CqLzUQr6+BRhHibG/ZYCIri1Bf4UcjFbtlo2C
         dfnQJ6Ld8oizTTDx4pxfYc+itNPSlvxyrkSXPS6jHRuDqH6BRCp/tVfE0DhVUdY8yT+f
         iFACfHqqE4PM60glU56oyrGmKmZEmNDJnMAx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220022; x=1742824822;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dlX/sf6WY/9VbuhRIyTJ6IkEE/L/vBSFZbNjeyyF3w=;
        b=k1Kak1lPZF9NsU5CUpxwPXSAITI7oPjUmXLGpEPHvYujBjTYdp0g0S+5vYKfleeicS
         Cg1Db9qtjSFfMgjWOX50WfW+A96+lcd6khnGiZaCFthI7FE0AgwJkFXN5pIrVc95Yk72
         ynBuKIWa5U3GXqU7/tUidhD2Ida4lw9Ndkex4/3+gLxNpZDmnLFFdiK90vREPqiEBbjo
         mDqzocAFah0mHE6c1xgCl6uE75ks67WjJY7gV4IQJui4/5OOZI21LJRDWXq7qjWUytTl
         ZlJGsmt8ebdnw0x6/MZVJl7oIDuofItF3xPnkXH99W50+nmisguFxfpznIP8Z59r2oeH
         ueuw==
X-Forwarded-Encrypted: i=1; AJvYcCWUBHJVTWtIsulMZICxveAmPhSC1ktkO7PzGC4Sy1iFqvVhh41USUYsWcOQkxOg7ngDHjpb+IxVRzE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbkVyMO+6gorBbW/M0j1fSmvGRVHu8ACKsadIOV7csgRm65mwN
	dZ5VVplwFBFyYCaq3lF9aCEJkWUpgswDnhyIaUC56kuiZx/U9D59jRxxYQFqyvw=
X-Gm-Gg: ASbGncsky0EErwTemmalBQWZ1fIeLNQqZjCKV3RZhIa/kN9/sm2EZFw3uHtqudFbYtW
	4qZOqeEIKYjkRWb2JOlhbCYfgsOYwX9WhLmsJJHIL18+F8fZZR7/tGIE6lZdsnsVRxyysmS2uq/
	m4MI1qzPzTPPInSDErBE/YgilJDxodrRM1tr5OzpXUGeo7a7ARxnrZf0CjjlbfALHGiSte4WgGJ
	6v1Z/IaP9Z3QV7T8VV1ivslAmP9Z5hGg7BRq4WkUMtF/M8CeIUIoJjtpQ3MRR2LSDCFrWqOfq7D
	lw0z7fc+084TSDNU5dBeOhv76pO9xRzlOkHGj/TJvzCtYoogvq2G5fsrZ51WTt0y1sxMlcX63js
	oeZjavmBq
X-Google-Smtp-Source: AGHT+IGt54OBTlQ17u91VFTQjM//2ZHv3KkqAAVXkKWKXawizYU8BevyAuAEhwx+bdpHdLPEa+7b4Q==
X-Received: by 2002:a05:600c:3b87:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-43d1ed0994bmr131604705e9.31.1742220021725;
        Mon, 17 Mar 2025 07:00:21 -0700 (PDT)
Message-ID: <77f2dacd-85fe-4c47-8064-956a990c1681@citrix.com>
Date: Mon, 17 Mar 2025 14:00:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: Use for_each_set_bit() in
 hvm_emulate_writeback()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250314204920.118065-1-andrew.cooper3@citrix.com>
 <781a020c-351d-4211-ae51-8057646c28e2@suse.com>
 <6f0aa9e8-4176-4360-8031-625d99096452@citrix.com>
 <5b6364ef-53b0-4d59-acee-4df778eacbd5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5b6364ef-53b0-4d59-acee-4df778eacbd5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 1:52 pm, Jan Beulich wrote:
> On 17.03.2025 14:34, Andrew Cooper wrote:
>> On 17/03/2025 9:09 am, Jan Beulich wrote:
>>> On 14.03.2025 21:49, Andrew Cooper wrote:
>>>> ... which is more consise than the opencoded form, and more efficient when
>>>> compiled.
>>>>
>>>> For production VMs, ~100% of emulations are simple MOVs, so it is likely that
>>>> there are no segments to write back.
>>>>
>>>> Furthermore, now that find_{first,next}_bit() are no longer in use, the
>>>> seg_reg_{accessed,dirty} fields aren't forced to be unsigned long, although
>>>> they do need to remain unsigned int because of __set_bit() elsewhere.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>>> I still can't persuade GCC to do the early exit prior to establishing the
>>>> stack frame, and unlike do_livepatch_work(), it's not critical enough to
>>>> require noinline games.
>>> Then is ...
>>>
>>>> --- a/xen/arch/x86/hvm/emulate.c
>>>> +++ b/xen/arch/x86/hvm/emulate.c
>>>> @@ -3022,18 +3022,16 @@ void hvm_emulate_init_per_insn(
>>>>  void hvm_emulate_writeback(
>>>>      struct hvm_emulate_ctxt *hvmemul_ctxt)
>>>>  {
>>>> -    enum x86_segment seg;
>>>> +    struct vcpu *curr;
>>>> +    unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
>>>>  
>>>> -    seg = find_first_bit(&hvmemul_ctxt->seg_reg_dirty,
>>>> -                         ARRAY_SIZE(hvmemul_ctxt->seg_reg));
>>>> +    if ( likely(!dirty) )
>>>> +        return;
>>> ... this worthwhile at all? I'm surprised anyway that I see you use likely()
>>> here, when generally you argue against its use.
>> No, it's not worth it.  In fact, simplifying makes the function smaller.
>>
>> void hvm_emulate_writeback(
>>     struct hvm_emulate_ctxt *hvmemul_ctxt)
>> {
>>     struct vcpu *curr = current;
>>     unsigned int dirty = hvmemul_ctxt->seg_reg_dirty;
>>
>>     for_each_set_bit ( seg, dirty )
>>         hvm_set_segment_register(curr, seg, &hvmemul_ctxt->seg_reg[seg]);
>> }
>>
>> gets a bloat-o-meter score of 131 down to 72 (-59).
> That's surprisingly much.

Indeed.  https://termbin.com/gzd7 is the full side-by-side diff.

I think the key is the removal of ARRAY_SIZE().  With it,
find_first_bit() is emitting code to deal with seg_reg_dirty having
higher bits set.  Also, both BSF expressions have unknown zero-ness, so
are emitting the cmov form (__scanbit() is still on my list of bitops to
work on).

~Andrew

