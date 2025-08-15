Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B019B27D85
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083156.1442799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umr63-0007u3-8Z; Fri, 15 Aug 2025 09:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083156.1442799; Fri, 15 Aug 2025 09:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umr63-0007rv-5n; Fri, 15 Aug 2025 09:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1083156;
 Fri, 15 Aug 2025 09:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umr62-0007rp-8l
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:51:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 668989a6-79bd-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 11:51:22 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a23def5f2so710155e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:51:22 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a22210a65sm12785405e9.6.2025.08.15.02.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:51:21 -0700 (PDT)
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
X-Inumbo-ID: 668989a6-79bd-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755251482; x=1755856282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=luBj8STpAE9Qhm525hIQuJU8L2VHJEsa72t3SloV9bo=;
        b=uAI28/U41bpUoIctS8nkls4rnXS4KhJv8TXPU52zPN12mxYTEACiksXoPPIAiwpLLa
         yQH3sEGNYqR0bChzg9j8g2g3YNZRyEA156qS8UT0X9A8VIvXs2xc2RnmsrPOSqqgqE7B
         1Q+27/t5EroFwWhjl9Kcx+RFVQl+9Gi7CPwpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755251482; x=1755856282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luBj8STpAE9Qhm525hIQuJU8L2VHJEsa72t3SloV9bo=;
        b=kQ8EQckBOypnjWNVdoXdnW1S77+K07gf2DgTUG7Tz6Brll0PyugKTYdMcy8ize1EzF
         F3E+VHaXgIWTKEtIoH1WzUQRlchMClTzqDAtazKzJplPCDDj0XXHpHbHJHAgJe96Rddc
         IJ1ka+8k504AdyYscXNvZ3CWmroSJv8wZ9shZqpVqfTAAjjfXsfRCLwGAPhrcEbzwXh5
         j4oJHjLTaQbabRsmNBqB4RsCoP19vxNACMmyWzQDL3kDq+/5Oq6uWwpcy1mqFvC8/BMN
         Cy+H0A8ZB1pY+aiGrce8l9jZGDzsJnZ27nGDwUBaBPYBGxuQtg/dRthpPXioQDP7cApW
         yQTQ==
X-Gm-Message-State: AOJu0YxR49g6on54zEQc/vfianIuG9Jl/6LhKvBtLsDM+PpRnhLqJzDz
	VIb3E41QD2tOlOJbT9E81M8uA74kngk+YwDLr/VlfvB5Om3sgyhSfSEZX8dPyxo8Zms=
X-Gm-Gg: ASbGncsfrWOaCPsx/e6xRTP1qYR8N/mXIGuHy/sptkwhkG0rYwVd9eagJdt+86fEU21
	XabZF9jCn/nGiofSL1dNH7/1i+h67W+2Lw9DOCo7tB/wN7n2/2JALBygTAIAJgSyLiXyiwYEooe
	Mll/hxNltwaCje06fEdI40Vcbb66tO/5kSXP9h2lff/MGi1QvGv62oGFiguAs8NXExbw9uWu5rO
	ZsWwC9md/1rJCjyPMtfWMRe5TeiDQJm2pnWDP7hWcOeIIES5tSLh0f7pP8AX/jS8sZ5TeSCYYXG
	57X65n3Td66sPOg0dim0C4ZivtYdPwsExYsC59nyGFmQhDlwqKh1KtfqEXNThSdoEFCm6rC97P4
	5NEjhUIee8xkecnexYJnysJ+GBaW84XaeiFmf5//2QHnUKn3QZZcb6cjutsC1bmdR5beO
X-Google-Smtp-Source: AGHT+IGxiad1ickG/IrWnSGnq3srRYdqznO7GnqPXuRVzmgIUUcocnn5FQpKmyfXGwaTzClVkHFLHA==
X-Received: by 2002:a05:600c:4e86:b0:459:d6a6:77c with SMTP id 5b1f17b1804b1-45a2186461emr11906805e9.33.1755251481868;
        Fri, 15 Aug 2025 02:51:21 -0700 (PDT)
Message-ID: <bd3f9c28-aaf4-479d-b56e-48838442f7a3@citrix.com>
Date: Fri, 15 Aug 2025 10:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Use auto as per C23
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
 <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
 <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
 <7fc93aeef27153f1d6caa786bd44420f@bugseng.com>
 <caf19e2b-046e-495f-b425-9cb3a0053006@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <caf19e2b-046e-495f-b425-9cb3a0053006@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 10:36 am, Jan Beulich wrote:
> On 15.08.2025 10:33, Nicola Vetrini wrote:
>> On 2025-08-15 10:17, Andrew Cooper wrote:
>>> On 15/08/2025 8:20 am, Nicola Vetrini wrote:
>>>> On 2025-08-15 00:25, Andrew Cooper wrote:
>>>>> In macros it is common to declare local variables using typeof(param)
>>>>> in order
>>>>> to ensure that side effects are only evaluated once.  A consequence
>>>>> of this is
>>>>> double textural expansion of the parameter, which can get out of hand
>>>>> very
>>>>> quickly with nested macros.
>>>>>
>>>>> In C23, the auto keyword has been repurposed to perform type 
>>>>> inference.
>>>>>
>>>>> A GCC extension, __auto_type, is now avaialble in the new toolchain
>>>>> baseline
>>>>> and avoids the double textural expansion.
>>>>>
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Thankyou.
>>>
>>>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>>>>> index 88bf26bc5109..38ef5d82ad95 100644
>>>>> --- a/xen/include/xen/compiler.h
>>>>> +++ b/xen/include/xen/compiler.h
>>>>> @@ -64,6 +64,20 @@
>>>>>  # define asm_inline asm
>>>>>  #endif
>>>>>
>>>>> +/*
>>>>> + * In C23, the auto keyword has been repurposed to perform type
>>>>> inference.
>>>>> + *
>>>>> + * This behaviour is available via the __auto_type extension in
>>>>> supported
>>>>> + * toolchains.
>>>>> + *
>>>>> + *
>>>>> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
>>>>> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
>>>>> + */
>>>>> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
>>>>> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23
>>>>> meaning. */
>>>>> +#define auto __auto_type
>>>>> +#endif
>>>>> +
>>>> A more detailed explanation should live in deviations.rst under this
>>>> bullet point
>>>>
>>>>    * - R20.4
>>>>      - The override of the keyword \"inline\" in xen/compiler.h is
>>>> present so
>>>>        that section contents checks pass when the compiler chooses not 
>>>> to
>>>>        inline a particular function.
>>>>      - Comment-based deviation.
>>>>
>>>> as described in the SAF entry:
>>>>
>>>>         {
>>>>             "id": "SAF-3-safe",
>>>>             "analyser": {
>>>>                 "eclair": "MC3A2.R20.4"
>>>>             },
>>>>             "name": "MC3A2.R20.4: allow the definition of a macro with
>>>> the same name as a keyword in some special cases",
>>>>             "text": "The definition of a macro with the same name as a
>>>> keyword can be useful in certain configurations to improve the
>>>> guarantees that can be provided by Xen. See docs/misra/deviations.rst
>>>> for a precise rationale for all such cases."
>>>>         },
>>> Ah right.  What about this:
>>>
>>> "Xen does not use the \"auto\" keyword as a storage qualifier.  The
>>> override of the keyword \"auto\" in xen/compiler.h is to give it it's
>>> C23 behaviour of type inference."
>>>
>>> ?
>> Seems good to me. Maybe this should be spelled out in ./CODING_STYLE as 
>> well, so that newcomers don't trip over this?
> I'm not sure newcomers would look there, but in the absence of any better
> place that's perhaps indeed where to mention this.

How about this:

diff --git a/CODING_STYLE b/CODING_STYLE
index 7bf3848444ad..e33b9d1170cf 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -129,6 +129,10 @@ Fixed width types should only be used when a fixed width quantity is
 meant (which for example may be a value read from or to be written to a
 register).
 
+Macros which otherwise would use "typeof(arg) newarg =" to avoid double
+evaluation of side effects should use "auto newarg =" per it's C23 behaviour,
+to also avoid double textural expansion.
+
 Especially with pointer types, whenever the pointed to object is not
 (supposed to be) modified, qualify the pointed to type with "const".



>
> I am, however, still not quite sure if we're doing ourselves a favor with
> the re-purposing of auto (while not using C23 in general). It'll certainly
> hit me as unexpected, for some time, to see uses of the keyword. It simply
> has been for too long that it had its earlier meaning (of very limited use).

I suspect that people won't find this great reasoning, but here's how I
see it.

Linux already does this, so familiarity in wider circles is growing. 
Now C23 is available, people starting new projects will be using it,
which will normalise the construct further.

People are going to be forced to get used to it, one way or another. 
They can simply choose whether it's now, or later.

Within Xen, the scope is narrow.  I am specifically not advocating that
we get it used outside of macros.

~Andrew

