Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA427FC009
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643345.1003451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81bp-0006M7-ED; Tue, 28 Nov 2023 17:10:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643345.1003451; Tue, 28 Nov 2023 17:10:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81bp-0006Jz-BP; Tue, 28 Nov 2023 17:10:53 +0000
Received: by outflank-mailman (input) for mailman id 643345;
 Tue, 28 Nov 2023 17:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az8h=HJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r81bo-0005wh-DH
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:10:52 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1469791e-8e11-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 18:10:50 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-332ddd8e0bdso3190273f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 09:10:50 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m4-20020adffe44000000b00332f74ffde5sm9528610wrs.5.2023.11.28.09.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 09:10:49 -0800 (PST)
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
X-Inumbo-ID: 1469791e-8e11-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701191450; x=1701796250; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zhazNGRdRxsHK0ywAi760b/S3n4ZLU1734zD30YYOY=;
        b=i9S0ALmgcE0wHUSD7EfvMw9Ub/KdnYfjuzBs+QPt3M45TO/lbyaggI4EBRop3hSLIn
         XibzhaUVHiJCv1cC3+23tnQVtTzoshP95/1Qv0+1K7KSuPJqZTYMARrtEPCjLabS5DZ3
         k00NGcgTuxZPAxxTS0/9Ipg5EeikpQnQzBD+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191450; x=1701796250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zhazNGRdRxsHK0ywAi760b/S3n4ZLU1734zD30YYOY=;
        b=ZUvZXo+EP3gfPLr9irugW066GFK+lECapK8CrbF9FAbbbowfaFEdvF2Gm57AFaE68P
         Gsho3DVFDxf98iHmh/2nyhTI4LEZqLhRGjzBwGUb3WnuTpoRJ1iSJzYmN7yVva+asbZt
         55flnXShnXbrQw06wC36dIIGl6UUtZ7mMj4wNbovxCjxzKT9PesJG0PSM4sCOrVbubWW
         OzG4x+Rrpzy/7h5eWIHEnJqOd8BC+A58H6Ob9Jv/XKcyhc3HcEE6XwFFyOuIz7DdEKiX
         CsKZcHeELgf2iredkyO35WwqpWsDy4DmIHTazT6fc574cx2ou2Arl//WtXgOdM8i6CzW
         GBbg==
X-Gm-Message-State: AOJu0YycSpMdwWZE4bNn8qusiAXgjAjpej53TRk+FFGN1hB69h0yqw4B
	OuvxHjxwGqLJeZUCA6LiN/XS9g==
X-Google-Smtp-Source: AGHT+IGtELIVITp/El+uR7cW68oShHE4N/DkPYB/Po4+XusdheP0WrsJsAHoa0BP3n1XZeupd/Tywg==
X-Received: by 2002:a5d:6b0f:0:b0:332:e7f5:a820 with SMTP id v15-20020a5d6b0f000000b00332e7f5a820mr12063533wrw.24.1701191449837;
        Tue, 28 Nov 2023 09:10:49 -0800 (PST)
Message-ID: <967a67a3-7a9a-498f-8c4a-f8b15f056ce1@citrix.com>
Date: Tue, 28 Nov 2023 17:10:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
 <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
 <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/11/2023 5:00 pm, Michal Orzel wrote:
> Hi Julien,
>
> On 28/11/2023 17:14, Julien Grall wrote:
>>
>> Hi Michal,
>>
>> On 27/11/2023 15:41, Michal Orzel wrote:
>>> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
>>> attention to undefined behavior issues, notably during CI test runs, is
>>> essential. When enabled, this option causes Xen to panic upon detecting
>>> UBSAN failure (as the last step in ubsan_epilogue()).
>> I have mixed opinions on this patch. This would be a good one if we had
>> a Xen mostly free from UBSAN behavior. But this is not the case at least
>> on arm32. So we would end up to stop at the first error. IOW, we would
>> need to fix the first error before we can see the next one.
> Well, this patch introduces a config option disabled by default.
> If we end up enabling it for CI for reasons* stated by Andrew, then the natural way
> of handling such issues is to do the investigation locally. Then, you are not forced
> to select this option and you can see all the UBSAN issues if you want.
>
>> So I feel it would be best if the gitlab CI jobs actually check for
>> USBAN in the logs and fail if there are any. With that, we can get the
>> full list of UBSAN issues on each job.
> Well, I prefer Andrew suggestion (both [1] and on IRC), hence this patch.
>
> *my plan was to first fix the UBSAN issues and then enable this option for CI.
>
> [1] https://lore.kernel.org/xen-devel/7421ddfd-8947-4fe1-93a6-dc25a4aa8bbc@citrix.com/T/#t

Searching logs is never reliable.

Even within gitlab, we've had error upon error getting the console logs
out reliably, and it's even worse on real hardware.

This is an optional thing, but for people who want it, it's very highly
desirable.

~Andrew

