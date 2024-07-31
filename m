Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0834794264D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 08:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768215.1178978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2cQ-00066q-P9; Wed, 31 Jul 2024 06:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768215.1178978; Wed, 31 Jul 2024 06:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ2cQ-00064b-M2; Wed, 31 Jul 2024 06:15:26 +0000
Received: by outflank-mailman (input) for mailman id 768215;
 Wed, 31 Jul 2024 06:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ2cP-00064Q-Cu
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 06:15:25 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45cf6c56-4f04-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 08:15:24 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f01afa11cso8132498e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 23:15:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac631b038asm8234518a12.14.2024.07.30.23.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 23:15:23 -0700 (PDT)
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
X-Inumbo-ID: 45cf6c56-4f04-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722406523; x=1723011323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5ys6FqoieUc/FnSCJUr7GlkOcH3+qNt5xtQnIMfsFec=;
        b=B+liiK+kilVW9SzYlXpAY0g0iizTQFCwRtu4yUKcrWp8uow43I6lHVw3DqFiUdcPOW
         DXbGeVbS3Z/HahT7DLOC/FTwIEwFILNEunBdqWdHsW9o71UGkZsKgrOno4wBISfHX2Uh
         g8l7MP8NSMVbFy3b/GyMmj14FQXT0gD1mylJoRbMhHHFaP62/NRplza2bOywBsb5YlAc
         lrwabwLzYk0VJudVOq0p/KeyvEgA5y70xv1fvqOqePeZBCOi3tBhiAxcJFBITmDyiI2I
         s5r5EZC8BRgNUM85KGHpVsNk3drqOUCR6vLF8GZyZlaJYPaLWRm5DqSr5Zs0jwnuIohx
         XEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722406523; x=1723011323;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ys6FqoieUc/FnSCJUr7GlkOcH3+qNt5xtQnIMfsFec=;
        b=K7ZNKPrufG+5dtdQILNw7aydQ96wYpxEyNAWfMYnkcF/R8V0Gafe3mZSBvbCJFLv2X
         Qrax/JsrpVRdpnHfbba948QliQD6zwfYr96sUyU5U2Q3xrG4UWCNRTaaA502H3Xh/sCv
         lrOv8oLgLfuz8CdHcvjqZfq7faUHXmWKovTsAhpIk2aFFgy0oAPVXbN8ohmD76DdwXRh
         W7cNPeEPAojC3gw0kr73TH3e2ir6Tq7oNOGIGmnPjNudVdNil7a6lLg2z6GBPI4ttsQQ
         Vbsxha/W3zIR4INOe8D19x9fsqjUYulcEAf+k6aaeZz68UZcHdwQZQG0nU1qD+FC14Xp
         416w==
X-Forwarded-Encrypted: i=1; AJvYcCVJzuJCGpvRYCIf45yHVJSN8GUmhd+Y5JuTf3fy0pEazZY1wHJNiIH+U1sapoqj4rByNQMlGq70I6DxZW7OAqADY0dqlXF4jNp0bTRsdIo=
X-Gm-Message-State: AOJu0Yzi8b1khCvMeGeRVKLtyUsj0dF7lfppkX8ssssKn63QtgilwecU
	DEFfrsPUkejiWjrm5151JytXDiVPZDjhjtKMIzGw9Xv3gH8EVSrjKleBRS11tGzWqNpY5W90bWQ
	=
X-Google-Smtp-Source: AGHT+IEymhTSugDHCvWEirRSc8G+Kz++rlq2S6msvuMCFQv/4ODsJ52+4Um7zL3juw/0EVJbhaf5kg==
X-Received: by 2002:a05:6512:3490:b0:52b:bf8e:ffea with SMTP id 2adb3069b0e04-5309b2c2adbmr6980393e87.40.1722406523580;
        Tue, 30 Jul 2024 23:15:23 -0700 (PDT)
Message-ID: <560a1207-2721-42cd-bd39-c83edca42c17@suse.com>
Date: Wed, 31 Jul 2024 08:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/event: address violation of MISRA C Rule 13.6
From: Jan Beulich <jbeulich@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
 <d48b73a3c5c569f95da424fe9e14a7690b1c69f8.1719308599.git.alessandro.zucchelli@bugseng.com>
 <6e4b7711-5017-49a8-9f7d-e20c497f2561@suse.com>
Content-Language: en-US
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
In-Reply-To: <6e4b7711-5017-49a8-9f7d-e20c497f2561@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 10:16, Jan Beulich wrote:
> On 25.06.2024 12:14, Alessandro Zucchelli wrote:
>> --- a/xen/include/xen/event.h
>> +++ b/xen/include/xen/event.h
>> @@ -183,13 +183,14 @@ static bool evtchn_usable(const struct evtchn *evtchn)
>>  /* Wait on a Xen-attached event channel. */
>>  #define wait_on_xen_event_channel(port, condition)                      \
>>      do {                                                                \
>> +        struct vcpu *v = current;                                       \
> 
> First: As recently indicated elsewhere, any new latching of "current" into
> a local var should use "curr" or something derived from it (see below), not
> "v".
> 
> Second: Macro local variables are at (certain) risk of colliding with outer
> scope variables. Therefore the common thing we do is add an underscore.
> Disagreement continues to exist for whether to prefix them or have them be
> suffixes. An affirmative statement as to Misra's take on underscore-prefixed
> variables in situations like these would be appreciated. Sadly what the C
> standard has is somewhat tied to the C library, and hence leaves room for
> interpretation (and hence for disagreement).

Why was this patch committed unchanged, considering the comments above?

Jan


