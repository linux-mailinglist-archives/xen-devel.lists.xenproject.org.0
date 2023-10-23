Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A4A7D3871
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621480.967960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvKx-0006Wz-4i; Mon, 23 Oct 2023 13:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621480.967960; Mon, 23 Oct 2023 13:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvKx-0006UQ-1g; Mon, 23 Oct 2023 13:51:19 +0000
Received: by outflank-mailman (input) for mailman id 621480;
 Mon, 23 Oct 2023 13:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1u5b=GF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1quvKu-0006UK-Vd
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:51:17 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c2e22b5-71ab-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 15:51:15 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso7006422a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 06:51:15 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h1-20020a50ed81000000b00533dd4d2947sm6361209edr.74.2023.10.23.06.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 06:51:15 -0700 (PDT)
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
X-Inumbo-ID: 3c2e22b5-71ab-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698069075; x=1698673875; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LfP3d7RwZQ+bDCZktxHUTUEmhCH4Zh18JO01+RFvZtc=;
        b=buZTnVWF8KpYVxyTRtDVccYoVWLEUhSsuEWybD7jjQ01hjyAoSoNYitnh36pZBJyj7
         0w2bNtboimGzjFKXyxo4ZxNQ1+NiV8swhKq4/B0ASc6GyHp/EBg3l4ehwsbey5pLrR/q
         snA0rRrQz+7+FyjW1eWCGG/XagnetXrhAMrXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698069075; x=1698673875;
        h=in-reply-to:autocrypt:references:cc:to:content-language:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfP3d7RwZQ+bDCZktxHUTUEmhCH4Zh18JO01+RFvZtc=;
        b=SwxkTqjzs/Ucqd9td87WjBUUgMShMoOO20B1Xav61bLM48qJkgRiVAganXGg+NEAfh
         WTmw8VYvMXoBMc/gJ+LUD6EHyckOKSiQYQc+LGVSKVTmBC7LS0Kj0jsVn0jdj4s1ikht
         hcFtJixhMChEM9cP+v39qMu6bV0Z1hau2QhQN9RDwIkT1iciZAPRnp6Ep0ko92unypwm
         CwW4HJlgfuVmmk1IB19sGErH25ijBx9Khl63zKFAUq5b6I85j06DnBB+paPlPttS4+MY
         hqq8kX7A5emkxLHUiB4yjUIzPULjK8CDnTayAUvoheSCVeFVay+rhf9NLdMjeMJVVt0y
         8bxg==
X-Gm-Message-State: AOJu0YxrSNt8X8zDS0rWw6zzBwsI+PPEcQcDkuHUx2oRaKzFgM0OhJSO
	+KLCdeACLppNYOKIc3BDFDA0Ug==
X-Google-Smtp-Source: AGHT+IGCcaqrboMt1DVOBveGdJGbyJskhjRiZpzXDcCttJjZvzETNwH8qjbDlsAQ3RsM6ekeAWjm4A==
X-Received: by 2002:a50:fc07:0:b0:53e:5c4d:ba15 with SMTP id i7-20020a50fc07000000b0053e5c4dba15mr11409730edr.8.1698069075375;
        Mon, 23 Oct 2023 06:51:15 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------L9g0q0jM2cXFw34X30eNjSra"
Message-ID: <7b28331d-b1d6-4c6b-b299-34de9ba65e0d@citrix.com>
Date: Mon, 23 Oct 2023 14:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com>
 <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com>

This is a multi-part message in MIME format.
--------------L9g0q0jM2cXFw34X30eNjSra
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/10/2023 2:34 pm, Jan Beulich wrote:
> On 18.10.2023 16:18, Simone Ballarin wrote:
>> --- a/xen/include/xen/pdx.h
>> +++ b/xen/include/xen/pdx.h
>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
>>   * @param pdx Page index
>>   * @return Obtained pfn after decompressing the pdx
>>   */
>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
>>  {
>>      return (pdx & pfn_pdx_bottom_mask) |
>>             ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
> Taking this as an example for what I've said above: The compiler can't
> know that the globals used by the functions won't change value. Even
> within Xen it is only by convention that these variables are assigned
> their values during boot, and then aren't changed anymore. Which makes
> me wonder: Did you check carefully that around the time the variables
> have their values established, no calls to the functions exist (which
> might then be subject to folding)?

I was actually going to point this out, but hadn't found the words.

pdx_to_pfn() is not pure.  It violates the requirements for being
declared pure, in a way that the compiler can see.

Right now, this will cause GCC to ignore the attribute, but who's to say
that future GCCs don't start emitting a diagnostic (in which case we'd
have to delete them to make them compile), or start honouring them (at
which point this logic will start to malfunction around the boot time
modification to the masks).


It is undefined behaviour to intentionally lie to the compiler using
attributes.  This is intentionally introducing undefined behaviour to
placate Eclair.

So why are we bending over backwards to remove UB in other areas, but
deliberately introducing here?  How does that conform with the spirit of
MISRA?

~Andrew
--------------L9g0q0jM2cXFw34X30eNjSra
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 23/10/2023 2:34 pm, Jan Beulich
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com">
      <pre class="moz-quote-pre" wrap="">On 18.10.2023 16:18, Simone Ballarin wrote:<span
      style="white-space: pre-wrap">
</span></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
  * @param pdx Page index
  * @return Obtained pfn after decompressing the pdx
  */
-static inline unsigned long pdx_to_pfn(unsigned long pdx)
+static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
 {
     return (pdx &amp; pfn_pdx_bottom_mask) |
            ((pdx &lt;&lt; pfn_pdx_hole_shift) &amp; pfn_top_mask);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Taking this as an example for what I've said above: The compiler can't
know that the globals used by the functions won't change value. Even
within Xen it is only by convention that these variables are assigned
their values during boot, and then aren't changed anymore. Which makes
me wonder: Did you check carefully that around the time the variables
have their values established, no calls to the functions exist (which
might then be subject to folding)?</pre>
    </blockquote>
    <br>
    I was actually going to point this out, but hadn't found the words.<br>
    <br>
    pdx_to_pfn() is not pure.  It violates the requirements for being
    declared pure, in a way that the compiler can see.<br>
    <br>
    Right now, this will cause GCC to ignore the attribute, but who's to
    say that future GCCs don't start emitting a diagnostic (in which
    case we'd have to delete them to make them compile), or start
    honouring them (at which point this logic will start to malfunction
    around the boot time modification to the masks).<br>
    <br>
    <br>
    It is undefined behaviour to intentionally lie to the compiler using
    attributes.  This is intentionally introducing undefined behaviour
    to placate Eclair.<br>
    <br>
    So why are we bending over backwards to remove UB in other areas,
    but deliberately introducing here?  How does that conform with the
    spirit of MISRA?<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------L9g0q0jM2cXFw34X30eNjSra--

