Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7169A1D5FD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:43:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877842.1287998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcORm-0003Mu-Qk; Mon, 27 Jan 2025 12:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877842.1287998; Mon, 27 Jan 2025 12:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcORm-0003KR-O6; Mon, 27 Jan 2025 12:42:34 +0000
Received: by outflank-mailman (input) for mailman id 877842;
 Mon, 27 Jan 2025 12:42:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fNoC=UT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tcORl-0003KJ-0P
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:42:33 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c355694-dcac-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 13:42:30 +0100 (CET)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso28226015e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:42:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd507e0csm128614795e9.20.2025.01.27.04.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:42:29 -0800 (PST)
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
X-Inumbo-ID: 2c355694-dcac-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737981750; x=1738586550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/pxKZ77JVbfvYleZXLL7a6pgQT043Onqu2f8cRAL40g=;
        b=qlUYM0YqFhs7sEO7nWSvhYp+cNbRmtZhesVDmlgSHyjhHrGUqOy5hIExnRKsaC2l8k
         8KjVadg4en1CGBOTnm7OfFrSH37PlnGeGxLfxfLEuAcgwXWj8SgIkJD/8S1ibntC7Kuc
         KIbs/2YOxJYAdfdAiWsgsGovKA82KehNj8EQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981750; x=1738586550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pxKZ77JVbfvYleZXLL7a6pgQT043Onqu2f8cRAL40g=;
        b=j6KikINpNcSBm9IemRcmx0Gj8AUm4/KknTBuW+ACz7CqvXHro7J4PSZjJazu/U5gx+
         1IvF0i9epGcn/9AFpXWgk9i3BneSfanACyz6Gd5g55QaFWTvh3Jlg0BlQm7zXxX9XzMN
         fj0bK7rTVVEDIALJ97Dn0YWjT/7gNJGyXXCCxlWLFpjPbL1GdvRRxHpkzNY2HE3QhTlY
         kALoeZQFu3oKsKOFYiSjD3I0tESaU/ECB7ztkRh4Z2nyUaQQ8jfmueFFtDV+LChruqZo
         n9IMiygfhOPSslJaWeZ0JwJVOtvtEaAnXUDBEgYfTXKa6Wm7gsZ7o5ZKGvZG/kbAiz65
         wjeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxlHr3wrdgmqq+f/Mu8JMAtl1UAAsI7WbI4PTB2+Ud5RLk/TSlBaEQZYw6MIiUHcWmfXsmkyEmSMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzci3AvEWs5OkHYSGReCLVRDPUBNKtdzWd30Yod6xPA4bH7rcGw
	YD3+noes4Low42Y6EFZXBcjhTG6g7NpvYGwkzQrNOEIpPI7M4U8Hymer5C9Vbvo=
X-Gm-Gg: ASbGncvIGrqdoqNogIh35U2gTWRVa8T550+PgBv7CYNcuPZTVMW3UMkgNV+up1qFLVd
	QUHJ3ISKec4pOxvc9rDBqwrKzMatUfp0+6geUavrvWABJBdD1Q+Kv7PVktPdzSWssqhfUptLo8a
	7VLVNbZf2pRptJqqW236hoHgPX+3OW6x04lf4oIeODQfZyC5XgAX++ry5b+7nci7nj4jC12uTk3
	L68H1dS5b6/NRMswq5cEu0Xt/xBJZboC0BGm7FO3HKDEPGxI9OhkRKb4KvjlPelRvKUf1iGQ0Ey
	rHKimjmNH5+Ikny7htAwJ3Z5wSZZYUp/CkicLWSTLh7P
X-Google-Smtp-Source: AGHT+IEeRiMpR8xAELPWDu2ekDTtJ4g+uI4WWq4X2t2vJTZ6t2//tcx6nbHMXsArUcan+oD+lsFs/Q==
X-Received: by 2002:a05:600c:4e08:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-438912d4a3bmr400733945e9.0.1737981750167;
        Mon, 27 Jan 2025 04:42:30 -0800 (PST)
Message-ID: <76b3b208-a576-48f2-820b-e213722fe229@citrix.com>
Date: Mon, 27 Jan 2025 12:42:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jonathan Katz <jonathan.katz@aptar.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
 <eb58ed74-1156-4de5-8392-a546d9afddc3@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <eb58ed74-1156-4de5-8392-a546d9afddc3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/01/2025 4:57 pm, Oleksii Kurochko wrote:
>
> On 1/21/25 3:25 PM, Andrew Cooper wrote:
>> Logic using performance counters needs to look at
>> MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.
>>
>> When virtualised under ESX, Xen dies with a #GP fault trying to read
>> MSR_CORE_PERF_GLOBAL_CTRL.
>>
>> Factor this logic out into a separate function (it's already too
>> squashed to
>> the RHS), and insert a check of MSR_MISC_ENABLE.PERF_AVAILABLE.
>>
>> This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile
>> (the only
>> consumer of this flag) cross-checks too.
>>
>> Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
>> Link: https://xcp-ng.org/forum/topic/10286/nesting-xcp-ng-on-esx-8
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Untested, but this is the same pattern used by oprofile and watchdog
>> setup.
>
> Probably it will make sense to wait for a response on the forum (you
> mentioned in the Link:) that the current one patch works?

It's been a week.  At this point it needs to go in for the release.  As
I said, this is exactly the same pattern as used elsewhere in Xen, so
I'm confident it's a good fix, and Roger agrees too.

~Andrew

