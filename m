Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A1CFC7DA
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 09:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196559.1514344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdOVN-0007Gx-Oc; Wed, 07 Jan 2026 08:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196559.1514344; Wed, 07 Jan 2026 08:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdOVN-0007FP-Kq; Wed, 07 Jan 2026 08:02:57 +0000
Received: by outflank-mailman (input) for mailman id 1196559;
 Wed, 07 Jan 2026 08:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdOVM-0007FI-BG
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 08:02:56 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 459ce70e-eb9f-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 09:02:55 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so844361f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 00:02:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e16f4sm9144302f8f.11.2026.01.07.00.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 00:02:54 -0800 (PST)
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
X-Inumbo-ID: 459ce70e-eb9f-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767772974; x=1768377774; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zsypaM5Uq+N9ETzIqEmeMHTI8+kHzqO5OjLxgZDUHFI=;
        b=RpDKZ90sC+lHqyasyXbYIGVn29WMZMe5NY6Gg9eD34+wrBcsqxniSCMCUy3rsjZ9mQ
         e+lC0fKd7YyvjaEH7E+5IbhCYngvPh4wtMnfXpO+r71o3BI4QKLJ1Zx56JFr530m6Cu8
         a6jdN5yhZ/v64s1v2TG1FW26ncQHM+EFOQX1nMeZbrFrmxR42tQZuDDsvlTRRdvS6kWM
         ORxqcmSZwBWpoqhwO+w+AJ24V5nlhk2GL0fvuF1mztUIGfnhgSei4HdHOMXSZJkUy407
         cunjH20vC7aURYLZ7lycCS2Y44d+w9pigUkUwR9KRegmEM7DK6uPVjfc5jZf94yZ2oRR
         9Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767772974; x=1768377774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsypaM5Uq+N9ETzIqEmeMHTI8+kHzqO5OjLxgZDUHFI=;
        b=YeCsB0i8vYC91UCIFgNrbQq/t111iGg9JE/Iixg+0qCZIHvhS+AmK8kLZgdgsO1KO4
         h7ifs/iuLoc4enqZPGEDkcy47mG59UQPk2u1yEwLNm2m7ycxhglh/ZDxGFo0RJMGRkVq
         yD9An4fdNAa13TGRFpEqwkoe4d9iTBfnVqA72emtbhn8BeOIXGhFB8R+f5AmPbGUb/bs
         iwZzHoX+2iPnqI2BzPMFsIiDd2KpmKASPV6I43+ILGnSFfGnQxIHt/QEh0Oo3re3Fczy
         wELy0iNRSujoQ/nLAkWMCi4uho812Lb6ieofsNQbSZKmxWcAyHtvdOgHNCgVW2jfJEos
         OW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVotAvav3hGizPUzn35YbI2k4221s907tTA8Gf9xtFrN8O6emmUh5VBNUIxxOt5ne0/73rimbkOy1U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcEMqjzeacXHAVs57wC7e9NM5zzueufbLrYi1ACIr3VgVvVyEt
	gp58j73nRf3PSP5Qa2ILA7WWg+ZhMQTw+P4d4uju8EFPJUlEA+FVTSSOWGv5OA629w==
X-Gm-Gg: AY/fxX4Vf5Mnv+7Z9+qxsrNuNEsPUgmEj6PJk+LoITWKhcqaSm0NRt98SuEmPhM5MFv
	2E/+ZNXtLqEOypkQQQYZ+SHTzmpOfa4gRkiDXWSukFKBl6a/hEpqueJrOTBS2L6wZPpEcNEWTyc
	O8dV7w6HFvZ2TH/Ec+i9x+0bXdnk0zPsfaGq/P2+rPm7dv1h4RqJRPJ8ISDPGUq77v+z3QcWQUZ
	gICY2O5pY8cktp5TGiBuLFuTALLTOorIJ7I6wNqGtS5x/+Mlji6jhjc/U21wYLCz80mOteSrV8u
	Imb8kIyNXHeqGuBDnqQC3frrfjFtYOeeWB6KOIvIUbbKYrIG0MHvj8KTYn3udHj/00CfmFnDBnM
	bbcdZJtuB/12Ri/gq1bn1NuEW0Y0jQDYtKAOi53dF5T2rJqCM9nfhX+G8ijlbrboTzlMKaJKVmH
	FvOeF6pfUWdIjFrL4nQ90L6I2r0erzA1/N6zhI0qzlmjZ8K8aQjY3Zu2kDZIEPjNNDMjjFiZHtP
	+g=
X-Google-Smtp-Source: AGHT+IGDZ0fia1crls+ZyKobc1ypIDPxF84oxQxtD4mmUWc+2YjOH3HnDg6Q5/pT6uTTN6caUVuNIA==
X-Received: by 2002:a05:6000:24c4:b0:430:f68f:ee82 with SMTP id ffacd0b85a97d-432c37a6fafmr2081220f8f.54.1767772974516;
        Wed, 07 Jan 2026 00:02:54 -0800 (PST)
Message-ID: <794c382b-3b20-4d2a-ab70-b24d7fdf88ae@suse.com>
Date: Wed, 7 Jan 2026 09:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
To: =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
 <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2026 21:10, Антон Марков wrote:
> Hi, I'm not sure about the other places. In hvm_load_cpu_ctxt 
> (xen/arch/x86/hvm/hvm.c ), it was easy to catch because 
> process_pending_softirqs is frequently called there, which in turn 
> processes softirqs from the timer (where the timestamp is updated). 
> After I fixed sync_tsc in hvm_load_cpu_ctxt, the problem stopped 
> reproducing under no load. However, when the number of vCPUs is 4 times 
> greater than the number of CPUs (under heavy load), the problem rarely 
> reoccurs (mostly during snapshot restores during 
> process_pending_softirqs calls), and this is no longer a simple case. If 
> get_s_time_fixed can indeed be interrupted during execution after 
> rdtsc_ordered, then the current fix is ​​insufficient. It's necessary to 
> atomically copy "t->stamp" to the stack using local_irq_disable and 
> local_irq_enable (as in local_time_calibration), and then work with the 
> copy, confident in its lifetime and immutability. But until 
> get_s_time_fixed is proven to be interruptible, this is premature, so 
> your fix is ​​sufficient. I think I need more information and testing to 
> say more.

While the cpu_calibration per-CPU variable is updated from IRQ context,
the cpu_time one isn't. Hence t->stamp's contents cannot change behind
the back of get_s_time_fixed(). I wonder whether ...

> Regarding the other scale_delta calls, if they include values 
​​> calculated from externally saved tsc values ​​that could have become 
> stale during the process_pending_softirqs call, this definitely needs to 
> be fixed.

... another similar issue (possibly one not included in the set of
remarks I have in the patch, as none of those look related to what you
describe) might be causing the remaining, more rare problems you say you
see. That set of remarks is actually a result of me going over all other
scale_delta() calls, but of course I may have got the analysis wrong.

As to using 4 times as many vCPU-s as there are pCPU-s (and then heavy
load) - while I don't think we have a support statement for such upstream
(when probably we should), iirc for our (SUSE's) products we would
consider that unsupported. Just fyi.

Also, btw, please don't top-post.

Jan

