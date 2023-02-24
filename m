Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D9B6A2525
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 00:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501626.773462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVhf7-0001HV-I1; Fri, 24 Feb 2023 23:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501626.773462; Fri, 24 Feb 2023 23:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVhf7-0001Fn-FQ; Fri, 24 Feb 2023 23:39:37 +0000
Received: by outflank-mailman (input) for mailman id 501626;
 Fri, 24 Feb 2023 23:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVhf6-0001Fh-Lt
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 23:39:36 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dd50d2a-b49c-11ed-a82a-c9ca1d2f71af;
 Sat, 25 Feb 2023 00:39:34 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id ck15so3850933edb.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 15:39:33 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.gmail.com with ESMTPSA id
 p22-20020a1709061b5600b008cca31606a8sm137145ejg.51.2023.02.24.15.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 15:39:32 -0800 (PST)
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
X-Inumbo-ID: 7dd50d2a-b49c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B68Sep32+JKax6LMqOVftT1OIdWZERFDZhh8bffld0o=;
        b=GOXf6X05etoByxIIU9IgJwUYRWF4VJgPYFsRb/sRffY29QCTVJGIwI6mVCbyBUIw2h
         dqhQHRElUyqKbQ+JJGPWudp4L3nfyAwdGPNrwmcmqWgYXOiAyoL/ZC4SZ62Fba+IdKoo
         6Ah3i9En0yAjf4BAIPzPDUu65tSaZyoqwXdtrh9Kxh6ylHQ5sEUdlX+KDG7H87nPj0PT
         WR1bi6JBNJw2VeoB/6J7waalfO1QTsi2wJwU1uoHosdJ8+41rP1NzWTBz6YKYIHSyrh/
         N5CnzOu12jDv0DadRSB7VYx+M3CJAsCW1y4P7YNSZw7oQC9wBlXQ1CtzmBrXacD6MC3u
         XeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B68Sep32+JKax6LMqOVftT1OIdWZERFDZhh8bffld0o=;
        b=WitEHQNCk3QWRpAZlnAW7bB4hHt2H93DG+/mIELWgb5k/lbHV5sRpB1+AGtQYgPoQt
         jUmYZ7yAhiqueqQc3X1n8BlIVHGqtcGwLFSUyq5BPPvI9XB3TQy3caw9RxBaKvFHSL3Q
         tuyzr5QXIgbUY6lfvvyHPZbCkYU97LaNbqWkF45EEMte/pSemFo2nH3ExujETaSWxsZK
         WLxE/89nJHMu7+0eYVfrUW8FlMqN58iAWcw1P04w7A2noOBAmhUPkj7BEZ3o95pRbS9t
         sUhMw5++0mda0xa2kD9PSW9I48Jz6q1NGcVYx4Yp4JcNkqpvE9/iJg4+0tBS9u+yi9WM
         /K6w==
X-Gm-Message-State: AO0yUKWTR1l1pOwcZT/H8SRh8v21dj9SlU4A2jtV83EsQ5NwbthMJpLl
	zn6zPAsSYipCcsGv6ZvYriw=
X-Google-Smtp-Source: AK7set/JTCHOeX9QHcXqLwpEIukOtycUMO3fXCpccaOuRG4dL8YP7Yw9yAG7uuD36hINJOPHWk6q4g==
X-Received: by 2002:a17:906:c312:b0:88a:7037:855e with SMTP id s18-20020a170906c31200b0088a7037855emr26353966ejz.9.1677281973209;
        Fri, 24 Feb 2023 15:39:33 -0800 (PST)
Message-ID: <e134469b-b40b-91a5-0522-e8abf37f4453@gmail.com>
Date: Sat, 25 Feb 2023 01:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/14] x86/hvm: {svm,vmx} {c,h} cleanup
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <e51c2ed6-4dc2-bf77-5d89-7023b3201fd0@citrix.com>
 <8745c599-bf9f-1eec-739f-3d42920dc546@gmail.com>
 <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <989903f7-4ea0-a1d8-923f-efb84c70ba21@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/24/23 23:33, Andrew Cooper wrote:
> On 24/02/2023 8:08 pm, Xenia Ragiadakou wrote:
>>
>> On 2/24/23 21:29, Andrew Cooper wrote:
>>> On 24/02/2023 6:49 pm, Xenia Ragiadakou wrote:
>>>> There are more detailed per-patch changesets.
>>>>
>>>> Xenia Ragiadakou (14):
>>>>     x86/svm: move declarations used only by svm code from svm.h to
>>>> private
>>>>       header
>>>>     x86/svm: make asid.h private
>>>>     x86/svm: delete header asm/hvm/svm/intr.h
>>>
>>> Thankyou for this work.  I've acked and committed patches 1 and 3.
>>>
>>> Note that you had one hunk in patch 5 (whitespace correction in
>>> svm_invlpga) that obviously should have been in patch 1, so I've
>>> moved it.
>>
>> Thanks, I missed that  ...
>>
>>>
>>> Looking at asid.h, I still can't bare to keep it even in that state, so
>>> I've constructed an alternative which I'll email out in a moment.
>>
>> I 'm also in favor of less headers.
> 
> I've committed as far as the nestedhvm move.  At that point, I've sent
> out a small patch to try and help decouple later changes.
> 
> But I think we want to change tact slightly at this point, so I'm not
> going to do any further tweaking on commit.
> 
> Next, I think we want to rename asm/hvm/svm/svm.h to asm/hvm/svm.h,
> updating the non-SVM include paths as we go.  Probably best to
> chain-include the other svm/hvm/svm/*.h headers temporarily, so we've
> only got one tree-wide cleanup of the external include paths.
> 
> Quick tangent - I will be making all of that cpu_has_svm_*
> infrastructure disappear by moving it into the normal CPUID handling,
> but I've not had sufficient time to finish that yet.
> 
> Next, hvm/svm/nestedsvm.h can merge straight into hvm/svm.h, and
> disappear (after my decoupling patch has gone in).
> 
> After that, hvm/svm/vmcb.h can be cleanly split in half.  struct
> svm_{domain,vcpu} can move sideways into hvm/svm.h (with a forward
> declaration of vmcb_struct), as can the svm msr intercept declarations.
> Everything else can move to being a private vmcb.h
> 
> Finally your svmdebug.h can come at the end, pretty much in the same
> shape it is now.  One thing to say is that right now, you've left enum
> vmcb_sync_state public, but it's type is already decoupled by virtue of
> struct svm_vcpu having a uint8_t field rather than an enum field.
> 
> And I think that cleanly gets rid of the entire asm/hvm/svm/* dir, which
> is a great position to get to.
> 
> 
> Beyond that, you will want to clean up the hvm msr intercept handling as
> hvm_funcs, which I think will decouple the vpmu files from svm/vmx
> specifically, but that will want to be a separate series.
> 
> How does this sound?

Thanks for the review. I think it sounds good.

The last part i.e the hvm msr intercept handling as hvm_funcs, I have it 
already I just didn't have the chance to send it yet (because the 
changes affect {svm,vmx}.h). I will rebase and send it on Monday for 
review to verify that we are on the same page.

> 
> Thanks,
> 
> ~Andrew

-- 
Xenia

