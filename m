Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3477DFAAB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 20:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626957.977719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyd10-000598-QZ; Thu, 02 Nov 2023 19:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626957.977719; Thu, 02 Nov 2023 19:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyd10-00057E-Nj; Thu, 02 Nov 2023 19:06:02 +0000
Received: by outflank-mailman (input) for mailman id 626957;
 Thu, 02 Nov 2023 19:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7M36=GP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qyd0z-000578-3Q
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 19:06:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbcd4350-79b2-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 20:05:59 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32fb1d757f7so343534f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 12:05:59 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j8-20020adff008000000b0032f7cc56509sm66400wro.98.2023.11.02.12.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 12:05:58 -0700 (PDT)
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
X-Inumbo-ID: dbcd4350-79b2-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698951959; x=1699556759; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3+AMNa0HLOtdvZ2o5TtgiGIpuxXgRgUROGevVxWpl3Q=;
        b=PEfUUyGE8JV+bZ78pgWb20uVDuoSfokCPB8Qiq0qJUUl86JL2X8mErow1UUp7oc+FF
         Gd38Vpv6oIWESTtZAHGbKGcu2ADPhwNeOrCEkDbo5+UTvhi/o/XX1oCJpxl4QXSo7t2o
         6ENgUv/ezJz/yvX1a77EHWXzSaUJ5MUnQ2T5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951959; x=1699556759;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+AMNa0HLOtdvZ2o5TtgiGIpuxXgRgUROGevVxWpl3Q=;
        b=dX7tA4mdWrEG0SCN9QIcj0xQg79K5logpjZMlXBUwvagLqxsyvd8gvZcHurEqILJKN
         geNtRUmuo1tgdmpG276dRBXG/SX5/lgmLpK4KuiTpHG19LlSMsWz2CqfSBVXrrIzATDk
         XhPY/pv+LezjSn+skEhVZZqpo2HrpS2jdx8aonEeqs6f2yqrZAXTjI3IoWis9fL+dorA
         k5Gp5tnpXUZ6vJ8SCxRJKv6XtjuE5fsdvzhCUohnKFhe65yt3v+6Gx6MtAjUskCKciDz
         dB0yD77pJUJIGdbQeVR0Ae3yacuVN1BCXbcdEFi0Z9iOb2WOo9fR3IVf2dRTTjTtO51f
         /50A==
X-Gm-Message-State: AOJu0Ywsm60BOQLJJZd29+OHajQFlC1kABXkSaiGqUroPd+F0hnNhGnd
	ijxKOl+UGfi2GzGfzoTAo8Wwkg==
X-Google-Smtp-Source: AGHT+IGQLclTSC9VLMRKB9j9Z3FZj7o5p476j/mZw2AXCjPxN6yMNxKZ+CVL/Np0AHLj6LSDotH2Jg==
X-Received: by 2002:a05:6000:1447:b0:32f:7f6c:72a6 with SMTP id v7-20020a056000144700b0032f7f6c72a6mr12150272wrx.16.1698951958940;
        Thu, 02 Nov 2023 12:05:58 -0700 (PDT)
Message-ID: <e8c03b95-2b17-4d3f-af1a-4dd53e57f9d8@citrix.com>
Date: Thu, 2 Nov 2023 19:05:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.18] x86/time: Fix UBSAN failure in
 __update_vcpu_system_time()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231101203737.3441425-1-andrew.cooper3@citrix.com>
 <7ca0ed7c-e797-7894-80e6-5d6497db9a99@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7ca0ed7c-e797-7894-80e6-5d6497db9a99@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/11/2023 8:33 am, Jan Beulich wrote:
> On 01.11.2023 21:37, Andrew Cooper wrote:
>> As reported:
>>
>>   (XEN) ================================================================================
>>   (XEN) UBSAN: Undefined behaviour in arch/x86/time.c:1542:32
>>   (XEN) member access within null pointer of type 'union vcpu_info_t'
>>   (XEN) ----[ Xen-4.19-unstable  x86_64  debug=y ubsan=y  Not tainted ]----
>>   ...
>>   (XEN) Xen call trace:
>>   (XEN)    [<ffff82d040345036>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xd2
>>   (XEN)    [<ffff82d0403456e8>] F __ubsan_handle_type_mismatch+0x133/0x49b
>>   (XEN)    [<ffff82d040345b4a>] F __ubsan_handle_type_mismatch_v1+0xfa/0xfc
>>   (XEN)    [<ffff82d040623356>] F arch/x86/time.c#__update_vcpu_system_time+0x212/0x30f
>>   (XEN)    [<ffff82d040623461>] F update_vcpu_system_time+0xe/0x10
>>   (XEN)    [<ffff82d04062389d>] F arch/x86/time.c#local_time_calibration+0x1f7/0x523
>>   (XEN)    [<ffff82d0402a64b5>] F common/softirq.c#__do_softirq+0x1f4/0x31a
>>   (XEN)    [<ffff82d0402a67ad>] F do_softirq+0x13/0x15
>>   (XEN)    [<ffff82d0405a95dc>] F arch/x86/domain.c#idle_loop+0x2e0/0x367
>>   (XEN)
>>   (XEN) ================================================================================
>>
>> It is not valid to derive a pointer from vcpu_info() prior to checking that
>> the underlying map pointer is good.
>>
>> Reorder actions so the NULL pointer check is first.
>>
>> Fixes: 20279afd7323 ("x86: split populating of struct vcpu_time_info into a separate function")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> In the interest of silencing the checker
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> However, ...
>
>> 4.18 blocker, or we'll need to issue an XSA/CVE.
> ... I dare to disagree (or to at least be uncertain) here, and I further
> dare to question correctness of the checker (which suggests that it might
> be helpful to point out in the description which version of the compiler
> it was). Quoting part of a footnote of the respective part of the C99
> spec, describing the unary * operator:
>
> "Thus, &*E is equivalent to E (even if E is a null pointer), ..."
>
> This imo leaves it at best ambiguous whether there's any actual UB here.

I'd argue that this isn't relevant.

What matters how the compiler interprets the spec, and in this case GCC
is telling us explicitly that it does consider this to be UB.

Whether there is a practical consequence is a different question, but ...

> Furthermore, if you deem this XSA-worthy despite the generated code not
> resulting in any real misbehavior

... we've issued XSAs for this class of issue before.  XSA-328 is the
one I specifically remember, but I'm sure we've done others too.

In this case, an unprivileged guest can control the NULL-ness here, so
if there's a practical consequence from the compiler then the guest can
definitely tickle that consequence.

Alternatively, the security team could decide to change it's stance on
this class of issues.

> , code patterns like
> (found in free_heap_pages())
>
>             struct page_info *predecessor = pg - mask;
>
>             /* Merge with predecessor block? */
>             if ( !mfn_valid(page_to_mfn(predecessor)) ||
>
> or (found in get_page_from_l1e())
>
>     struct page_info *page = mfn_to_page(_mfn(mfn));
>     ...
>     valid = mfn_valid(_mfn(mfn));
>
>     if ( !valid ||
>
> would be in the same class (access outside of array bounds), just that the
> checker cannot spot those without producing false positives (simply because
> it doesn't know frame_table[]'s bounds). We're fully aware of the existence
> of such code, and we've decided to - if at all - only eliminate such cases
> (slowly) as respective code is touched anyway.

I don't agree with describing these as the same class.  NULL deference
is different to OoB, even if they overlap from an underlying mechanics
point of view.

Nevertheless, I've raised that "valid" pattern with the security team
before, and I would certainly prefer to express it differently.

But neither of them trigger UBSAN.  GCC can't see any wiggle room to
potentially optimise, and I expect it's because __mfn_valid() is in an
external call.

If we had working LTO, I'd be interested to see that alters the UBSAN
determination or not.

>
> Jan
>
> PS: argo.c:find_ring_mfn() has
>
>     *mfn = page_to_mfn(page);
>     if ( !mfn_valid(*mfn) )
>         ret = -EINVAL;
>
> which, while not at risk of yielding any UB, is an entirely pointless
> check (as the underlying assumption needs to be that the struct
> page_info * must already be a valid pointer, or else _its_ obtaining was
> possibly UB). Having such checks in the code is at best misleading.
>

Yeah, that does looks wonky.  Luckily ARGO is still experimental.

Although given the topics on the call today, I wonder whether this is
really appropriate, seeing as ARGO underpins the security model on OpenXT...

I did have some plans (for copious free time, of course) to investigate
coccinelle and use it like Linux does, in order to spot and correct
known anti-patterns.

~Andrew

