Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62E89C90A9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 18:19:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836666.1252576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdUI-0008Vx-So; Thu, 14 Nov 2024 17:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836666.1252576; Thu, 14 Nov 2024 17:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBdUI-0008TT-OS; Thu, 14 Nov 2024 17:18:34 +0000
Received: by outflank-mailman (input) for mailman id 836666;
 Thu, 14 Nov 2024 17:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3TDs=SJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBdUH-0008TN-6d
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 17:18:33 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75e4ad41-a2ac-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 18:18:26 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so1494383a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 09:18:26 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79c1de2bsm740642a12.80.2024.11.14.09.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 09:18:25 -0800 (PST)
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
X-Inumbo-ID: 75e4ad41-a2ac-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc1ZTRhZDQxLWEyYWMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjA0NzA2Ljk2NDE3NSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731604706; x=1732209506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j7aGhMFrep/wMBloQEAhRny1sYlfYC1klYjHrWMuoxA=;
        b=oqdDuEapCJPQiTaotvgGo3Fr5rgqrmWysqotJKQlUwFgcFuG8h5sIveKEgsmXZow/p
         e+g9WWMmJPowdkDbFw+16BOEe8UrD0mUyMXW1yZqP2ajOwma02ujZQoFXPFwfEv/NFmc
         MI3CUpJAbBQHtbTgRpUff+iMO0dcUwbU/yGNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731604706; x=1732209506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7aGhMFrep/wMBloQEAhRny1sYlfYC1klYjHrWMuoxA=;
        b=W6u9KpRwIpFDr0YKxB2E9iFYXVWpWdqVXJNjINFMUnUa3JCtmQO4lKZyTKq0nWrFNo
         EUv4XCWLzYxs3dhNDL81kDGGhImUhqgpb7m5lr19Ls/tLzkceMekEwV7ddgbAc1O78J+
         pljoVFr6X+RheZCfdvnAYKS9lWfjiVYAsxXKYc0QV9Lq/uaO79tOvZjyFpc6mnMlmjTs
         N867jOYe8veiBDtq7FaNf4am0OQ3hdJ1D9xWK592hflSCfdfjKnYHGXejTcRx4OzhUfc
         270rO0/HJqsn+fej1AUld+AjgTYaJhbe1fDu7lOFHLuWJeuu/ESJIjrVQQ9krpn5m6Qv
         4AnA==
X-Forwarded-Encrypted: i=1; AJvYcCWQdmbiJ1o49vZBmWWSWi4c6F4SIfmvD7aqojcLyPnvblAFuQX+kUuxPrTqRfEbJxf3JmJ9d0K9WDE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxizQ1CU9RSL7PiPzqY1Gn8uox6GYMcoms3Zos3Xu75UWHZNIAw
	92UBSi4ahgFp5zxk11+F9NXUd1mn+f3MfbaXilTzC9+sSu0iRL+X8z5VvijeSM/u1Zmaose4Ys0
	i
X-Google-Smtp-Source: AGHT+IGmbCusTDudYgDvjSrF4bFg63FffwvkoGDBJmFhsX4+IoHrD/81OUHWiLyOiVcY/v1O2MZHdw==
X-Received: by 2002:aa7:d99a:0:b0:5ce:ddd6:d100 with SMTP id 4fb4d7f45d1cf-5cf0a446545mr16816786a12.32.1731604706289;
        Thu, 14 Nov 2024 09:18:26 -0800 (PST)
Message-ID: <6b656171-0f61-4ef9-82e7-dfb43f2bdd4d@citrix.com>
Date: Thu, 14 Nov 2024 17:18:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/ucode: Drop MIS_UCODE and
 microcode_match_result
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
 <20241112211915.1473121-4-andrew.cooper3@citrix.com>
 <aee06ffe-fb3d-41ab-a715-0bb057d4ca52@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aee06ffe-fb3d-41ab-a715-0bb057d4ca52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2024 11:41 am, Jan Beulich wrote:
> On 12.11.2024 22:19, Andrew Cooper wrote:
>> @@ -199,8 +198,8 @@ static bool microcode_fits_cpu(const struct microcode_patch *patch)
>>      return equiv.id == patch->processor_rev_id;
>>  }
>>  
>> -static enum microcode_match_result cf_check compare_patch(
>> -    const struct microcode_patch *new, const struct microcode_patch *old)
>> +static int cf_check compare_patch(
>> +    const struct microcode_patch *old, const struct microcode_patch *new)
>>  {
> Let's hope we won't screw up a backport because of this swapping.

I wasn't going to start thinking about backports until the code gets
into a better state.

But if backports do happen, it will be all-or-nothing.  This code is far
too tangled.


That said, in this specific case, the only thing that would go wrong is
with Intel debug patches.  Even I've only had a handful of those in the
past 8 years.

> I'd like to ask to at least consider renaming at least the functions,
> perhaps also the hook pointer, perhaps simply by switching from singular
> to plural. This would then also avoid reviewers like me to go hunt for
> all uses of the function/hook, in an attempt to make sure none was left
> out when converting.

In the other series I've paused for a while, I have renamed some hooks
(along with related cleanup), but I'm undecided on this one.

One option is cmp(), or perhaps compare().

But, it occurs to me, another option would be is_newer().  We always
care about the operation one way around.

>
>> @@ -54,11 +47,17 @@ struct microcode_ops {
>>                             unsigned int flags);
>>  
>>      /*
>> -     * Given two patches, are they both applicable to the current CPU, and is
>> -     * new a higher revision than old?
>> +     * Given a current patch, and a proposed new patch, order them based on revision.
>> +     *
>> +     * This operation is not necessarily symmetrical.  In some cases, a debug
>> +     * "new" patch will always considered to be newer, on the expectation that
>> +     * whomever is using debug patches knows exactly what they're doing.
>>       */
>> -    enum microcode_match_result (*compare_patch)(
>> -        const struct microcode_patch *new, const struct microcode_patch *old);
>> +#define OLD_UCODE  -1
> Nit: I'm pretty sure Misra wants parentheses here.

Oh yes, so it does.  Rule 20.7 apparently.  Fine.

> Preferably with both (mechanical) adjustments:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

