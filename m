Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB621B27ABD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082921.1442609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpdF-00012O-Bw; Fri, 15 Aug 2025 08:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082921.1442609; Fri, 15 Aug 2025 08:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpdF-000108-9H; Fri, 15 Aug 2025 08:17:49 +0000
Received: by outflank-mailman (input) for mailman id 1082921;
 Fri, 15 Aug 2025 08:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umpdE-000102-Co
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:17:48 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 539a91fb-79b0-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:17:47 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b9e4148134so900093f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:17:47 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb67d86755sm1015229f8f.48.2025.08.15.01.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:17:46 -0700 (PDT)
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
X-Inumbo-ID: 539a91fb-79b0-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755245867; x=1755850667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BSD2pbMUBebq8bYeGE877yWQHhdSd05nNNyJHMAA7Uc=;
        b=YYsSHO6QEmvVxifMafnaK5AY9cKNUZce76rpfUPz2KowYxFO8IIAmrmYyGuSz8adNg
         aP0aK1Uj5ANdBWEJGxELxc7w6Gg6xLy1QkaTzjkpb5OTSi7cO4GMp9MvDlw9oo5sisLL
         nWc0n+1gp0eFAp2vrPbS7C7ep5BNzf/oEPwz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755245867; x=1755850667;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSD2pbMUBebq8bYeGE877yWQHhdSd05nNNyJHMAA7Uc=;
        b=jalAL0jsKONGiV5VgxQwd5V3f+JrqdqIAPvEaOakX3j86qGhdmsHGwP0anj7XRV7bg
         hBLjkRlX1gvuzchu9/WyrAfDYa8Rm4Rqq/EF73TcxwyQKkx+cgyzxmKw0Ln2hS7Aravf
         OmHdEL5U6vGR0Hfhwfrghs7wCSaucxp1vHHtGjosmLregzL6g2XkT3CjnTIwYu8sqfDc
         kFvP+INp5/TCI6Nr+154clLPPY6whSbwjgYUhy7LEzvEa3WgL/VNxL7OP3JY8zCn8nc3
         I2IDJOsye+xj05jRMmRzoU6lJZUcvvEn90rvfcFhS/ZOYT4q5Fi9QIDBSZOJgFdNWohW
         dNcg==
X-Gm-Message-State: AOJu0Yzu4tFRQHYvniD2yZOJNRO/cuxrKW34VjGySuhvTeL3Ob/6r7cp
	YKoNqaVB8aQu9H1yKPP7sE/UNVNwy65YYea7fO/ck2JtyYuFwQhndGD3/cmz1+SrKK4=
X-Gm-Gg: ASbGncsrYQ+32AY31dS888upVDbuJ1Nd0cfws5qkhZYRtA74ovKNA69WqhmT0XZX6RL
	EXPZQoWCZ/1wlSbqA65WA9wrVqMjgvtc43KuT0FrPP6Ygn1azDK/x7+Zz/AqNOMPdXbUvP7266r
	Z/FEsvg/PYJUAO/0AFZwn4QRkoxuI5nofve6JLhjmABHzehhtr07Jeevm9lh55SYI7h8vXNFsnT
	V5vLJzCOjnk3vVT32qC2TITmtdGFsQWZluGEhHZ4snWoxHliGKxxLu/k0a9RcHt5iQj/ySV1QtG
	VeryYqwPdTRrO70/sSZdGXCbqzALHNn1BlEe9KmRNHiOCyCVuvjijvWtLF72um4K4yxj4dDgnZr
	YLPLufXyCUvh+pDaNmgrCoil+GJc2R6kMSfsYRwqSNFAhfrDWfe0TaHMh0Y8Wk5gxDKTMtMRFey
	Qchrs=
X-Google-Smtp-Source: AGHT+IHg+viKjf6cq6sYPDHu/sWzWXU+eRm++UntVqWP2X6PEMGK1wObFGgG/qQcp4WQFPvuw0a1RA==
X-Received: by 2002:a05:6000:2893:b0:3b9:48f:1960 with SMTP id ffacd0b85a97d-3bb692bcf88mr908009f8f.49.1755245866873;
        Fri, 15 Aug 2025 01:17:46 -0700 (PDT)
Message-ID: <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
Date: Fri, 15 Aug 2025 09:17:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Use auto as per C23
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
 <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 8:20 am, Nicola Vetrini wrote:
> On 2025-08-15 00:25, Andrew Cooper wrote:
>> In macros it is common to declare local variables using typeof(param)
>> in order
>> to ensure that side effects are only evaluated once.  A consequence
>> of this is
>> double textural expansion of the parameter, which can get out of hand
>> very
>> quickly with nested macros.
>>
>> In C23, the auto keyword has been repurposed to perform type inference.
>>
>> A GCC extension, __auto_type, is now avaialble in the new toolchain
>> baseline
>> and avoids the double textural expansion.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thankyou.

>>
>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>> index 88bf26bc5109..38ef5d82ad95 100644
>> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -64,6 +64,20 @@
>>  # define asm_inline asm
>>  #endif
>>
>> +/*
>> + * In C23, the auto keyword has been repurposed to perform type
>> inference.
>> + *
>> + * This behaviour is available via the __auto_type extension in
>> supported
>> + * toolchains.
>> + *
>> + *
>> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
>> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
>> + */
>> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
>> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23
>> meaning. */
>> +#define auto __auto_type
>> +#endif
>> +
>
> A more detailed explanation should live in deviations.rst under this
> bullet point
>
>    * - R20.4
>      - The override of the keyword \"inline\" in xen/compiler.h is
> present so
>        that section contents checks pass when the compiler chooses not to
>        inline a particular function.
>      - Comment-based deviation.
>
> as described in the SAF entry:
>
>         {
>             "id": "SAF-3-safe",
>             "analyser": {
>                 "eclair": "MC3A2.R20.4"
>             },
>             "name": "MC3A2.R20.4: allow the definition of a macro with
> the same name as a keyword in some special cases",
>             "text": "The definition of a macro with the same name as a
> keyword can be useful in certain configurations to improve the
> guarantees that can be provided by Xen. See docs/misra/deviations.rst
> for a precise rationale for all such cases."
>         },

Ah right.  What about this:

"Xen does not use the \"auto\" keyword as a storage qualifier.  The
override of the keyword \"auto\" in xen/compiler.h is to give it it's
C23 behaviour of type inference."

?

~Andrew

P.S. I thought that final fix was too easy.  Your instructions for the
main config were spot on and worked first time, except for getting the
R20.4 violation too.

