Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999AD9CF218
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 17:51:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837843.1253741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzWs-00048H-Oq; Fri, 15 Nov 2024 16:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837843.1253741; Fri, 15 Nov 2024 16:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBzWs-00046q-Li; Fri, 15 Nov 2024 16:50:42 +0000
Received: by outflank-mailman (input) for mailman id 837843;
 Fri, 15 Nov 2024 16:50:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=olWw=SK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBzWr-00046H-29
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 16:50:41 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b1d206-a371-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 17:50:31 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa20944ce8cso376874466b.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 08:50:31 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0812aesm193150266b.176.2024.11.15.08.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 08:50:30 -0800 (PST)
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
X-Inumbo-ID: b9b1d206-a371-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI5YjFkMjA2LWEzNzEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjg5NDMxLjU5NjAwOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731689431; x=1732294231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LgnH9c/CJPEIiJW5jSYnGPeCjgzXtRdqoQgHtqJxvXk=;
        b=rezFc9gsivgWwTtia0Ta9um7KmcuAjGCo5er7yU6NnI3DIxq5DG9uCzAK5+F2Smeq+
         EY5XWPYraaY4efHDupYExiCVzvCoukx/+RhWopPgs83ECr97Bhd+5KIpTANb/Hk1LnVx
         EilSZ1Xhveqzx7lmsh92PAB5HW6/ivK+1JX80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731689431; x=1732294231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgnH9c/CJPEIiJW5jSYnGPeCjgzXtRdqoQgHtqJxvXk=;
        b=WpZUx9wItDADXzAMtIWY/shMFDUZ0ImOZ/ovAj5Bolf1ycz5PRGY9yQ0y0pLnmv5dY
         9AUvjkw2LxotVBrqrcXJeGlCasH2EiIKyHjxc1Fv5Vp1U9pOuff/UoDP0Q+Jc2N3pXUN
         m3gvPEkUTxtPtMs9/9wKuxjR6iR/GlVXC94BUwv9VcvpHcSQOlMoLbZXZAqMdiKNpje6
         +DXBYOhH8isqRzYXb757wQ8kDlGvXr4uNtFfvI/v3sudv0Pm63b5pYpzSpxmJXNG4sWT
         Y2s2JKu9AhMbFfJBqT+636t6AFcbojSCu/SbmxNfGPz0q4Ss8Hrd7hBw8FMWYDv43Fhy
         SwXw==
X-Forwarded-Encrypted: i=1; AJvYcCWJy9HaLnnBPaE/aJslccw42n3EFGjSoD5b/09kcdQLvG9RDXDDgWRiGlxwnGIWLmn9OwDTbNeu9nc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKrehpHVjPlMXzANCoQ3y2And6tf3wt7ezdvDql0RAXSXQBTBi
	VEbcsKv40/OK0WBsOPA5hlfp/h9om1yu62TSzOU+kBKOu+hh4yWFCuKbq7tPyMQR9LjBbFMWgrr
	e
X-Google-Smtp-Source: AGHT+IEDF6oPq8IZbDyqfi+Uuf++9zCvMYR1oBjW97hV6TeHJhSNLlML9sujoGpo/pniQiiurqGoEg==
X-Received: by 2002:a17:907:2d93:b0:a9e:82f3:d4ab with SMTP id a640c23a62f3a-aa207687241mr718776366b.9.1731689430822;
        Fri, 15 Nov 2024 08:50:30 -0800 (PST)
Message-ID: <48641d1e-3e96-4a9e-bf4d-99fbf7348c0d@citrix.com>
Date: Fri, 15 Nov 2024 16:50:28 +0000
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
 <6b656171-0f61-4ef9-82e7-dfb43f2bdd4d@citrix.com>
 <9ff021f5-fc32-4283-9ee4-f807333e05bb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9ff021f5-fc32-4283-9ee4-f807333e05bb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2024 8:02 am, Jan Beulich wrote:
> On 14.11.2024 18:18, Andrew Cooper wrote:
>> On 14/11/2024 11:41 am, Jan Beulich wrote:
>>> On 12.11.2024 22:19, Andrew Cooper wrote:
>>>> @@ -199,8 +198,8 @@ static bool microcode_fits_cpu(const struct microcode_patch *patch)
>>>>      return equiv.id == patch->processor_rev_id;
>>>>  }
>>>>  
>>>> -static enum microcode_match_result cf_check compare_patch(
>>>> -    const struct microcode_patch *new, const struct microcode_patch *old)
>>>> +static int cf_check compare_patch(
>>>> +    const struct microcode_patch *old, const struct microcode_patch *new)
>>>>  {
>>> Let's hope we won't screw up a backport because of this swapping.
>> I wasn't going to start thinking about backports until the code gets
>> into a better state.
>>
>> But if backports do happen, it will be all-or-nothing.  This code is far
>> too tangled.
> I wasn't so much worrying about backporting of this work (as of now I don't
> think it's a candidate), but anything that's yet to come.

This work is towards supporting the Intel Min-Rev header, because it's
already deployed into the world for several releases, and is also what
is likely to drive a wish for backports.

Then there's the Intel uniform loading extensions, which are needed for
GNR/SRF.  If nothing else we need to be able to parse the loading-scope
and not get surprised when cross-core loading happens.  (This already
happens since Sky Lake if SGX is active, and Intel were surprised when I
noticed and asked them about it.)


But mostly, the pre-existing logic is just irrationally complex for
something so simple.  Most of the complexity appears to be because it
was too complex to start with.

>
>> That said, in this specific case, the only thing that would go wrong is
>> with Intel debug patches.  Even I've only had a handful of those in the
>> past 8 years.
> Why would that be? Doing the check the wrong way round would lead to
> possible downgrading of ucode, wouldn't it?

After this patch, there is a singular use of the hook.

It is comparing the hypercall-provided blob to the cached blob, yielding
OLD/SAME/NEW.

Deciding to initiate patching (entering stop_machine() context) is based
on !cached || NEW || --force.

There is another check in apply_microcode() (this is why we needed to
plumb --force down), which will catch an accidental swapping of the two
arguments.

Something that we don't handle properly is that we use "I have a cached
blob" as if it means "the system is at a consistent level", but this is
not true in both directions.  We might have not had anything to cache on
boot (AMD Client platforms in particular), and what we had on boot may
not have levelled a system which was left asymmetric by the BIOS.
>>> I'd like to ask to at least consider renaming at least the functions,
>>> perhaps also the hook pointer, perhaps simply by switching from singular
>>> to plural. This would then also avoid reviewers like me to go hunt for
>>> all uses of the function/hook, in an attempt to make sure none was left
>>> out when converting.
>> In the other series I've paused for a while, I have renamed some hooks
>> (along with related cleanup), but I'm undecided on this one.
>>
>> One option is cmp(), or perhaps compare().
> Either would be fine with me as a hook name. As a function name I'm less
> certain this will (remain to) be unambiguous.
>
>> But, it occurs to me, another option would be is_newer().  We always
>> care about the operation one way around.
> is_newer() doesn't very well lend itself to a tristate return value.

Fine.  I'll just go with compare().  I don't expect this will be the
last time it's edited.

~Andrew

