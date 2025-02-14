Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47EEA35378
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 02:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888246.1297638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tik8g-0001p7-1T; Fri, 14 Feb 2025 01:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888246.1297638; Fri, 14 Feb 2025 01:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tik8f-0001nb-V5; Fri, 14 Feb 2025 01:05:05 +0000
Received: by outflank-mailman (input) for mailman id 888246;
 Fri, 14 Feb 2025 01:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vTB=VF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tik8e-0001nA-JU
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 01:05:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b850d308-ea6f-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 02:05:02 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso16733765e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 17:05:02 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4396180f199sm30675425e9.15.2025.02.13.17.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 17:05:01 -0800 (PST)
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
X-Inumbo-ID: b850d308-ea6f-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739495102; x=1740099902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P/DRgaTQfFfnR5FRYvXUPQ8pkxQ8pYwXp6/1cHfSeGc=;
        b=Uw7tf3Bn7KZiaGFIbgIVtIw6uVDq8mZZl/l8+Cs67IjLyUjra59n7o6WGyE9Ciiz55
         ZKTh0i/EOaUD6ockio5rOWEPoOK38FWgKrEgVmPiYdjC3baPJ/fJagV55iFwH2VlMLib
         hzkQVyYwXHB1vj9SI6pJOqHREa5Bz+/U9TjU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739495102; x=1740099902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/DRgaTQfFfnR5FRYvXUPQ8pkxQ8pYwXp6/1cHfSeGc=;
        b=Z3uFvChRtBCgHEV+Cg307lMyddnFO9jw6dhHtETt4DQE7nams98Lrqoj+kgzvTAKdT
         Z+47ztpOoQErRv7RXzSg2tpIbDy8RjNL2t9xphaWZM5N8Y5MFBtI443iSENT+KJQD5pR
         csWKKKtMH8Y1YugopQz1zaBhaa0aE2c4qNfTXgEyR4aC8tvhNHvGkBkZkcyiqE+5Utcl
         /yBY4oy8vQaUqSKRDDLuBoEhysViOypjffIUnoulI/E/zYcWKQuWhZY5jCD9SLuqlNY6
         A8n6tm7ZG2OzwoY44qnwCzT7hReyHOV14XNzVDrpqDwWoW98RXDMQepqKqh0mRVDUA4u
         pGDw==
X-Forwarded-Encrypted: i=1; AJvYcCVnjV/QaM4JgGNNH4pAdmCF14HQOQ2B1bR2ZnlCDWUTcy8cQVuUfqkEKuL6p2ybesTaqPI4taBgSxc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7c1kb1cYkbf5i8oYIkfOZXtfcguWBKe82Y64pmeO5nzvreD4W
	PlaFMyMPuPnM0E8CiGEDD07omQ0bdQIH2TQUc/ufKcBOG5J7dga26UoHT7DHnWo=
X-Gm-Gg: ASbGncsJYjtr2gEfRdLq1SS7ZLAjcaTjvLNEf8+6HPKYahf03AHjqwitt8qIRYcYjvs
	T8efRZYMzMHHDnQRw30IosQ2+T/Dv6ajyP0tLvpm2tKOO91S73tYUWekUzhj4IJVw4V0yovu+5o
	zhUJzbYx1VcIhXz9mAF7t+gzp1jTKCpbmPQ+5ev6HyA1w3rdiitHl7FWpdNQEJZLFPGBaEz3GY9
	lb422cyoqwP0HmjTHUaSIqjMGzxSTBLMdYv06Fz7HJUkAUfuoaHEM1+7dUBAkD2i+zGYkOhMPno
	zZlVZ7GTLvgOyoTk38L0rU0E0u5hYeff2mQrPsku1Ut//N9QdGzrevk=
X-Google-Smtp-Source: AGHT+IFF79qu8IrDPb8UJ1s8Z5XvGu9KV0bV83T2Nt8aVJKmRVRZJaz8UQFDWkuKiU6nle72utMS1g==
X-Received: by 2002:a05:600c:3485:b0:439:5a37:8140 with SMTP id 5b1f17b1804b1-439601b7addmr72604295e9.22.1739495102226;
        Thu, 13 Feb 2025 17:05:02 -0800 (PST)
Message-ID: <f5deca6a-313f-4daf-b774-cc05223ab034@citrix.com>
Date: Fri, 14 Feb 2025 01:05:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix build with CONFIG_HVM=n and -Og
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250213185055.711703-1-stewart.hildebrand@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250213185055.711703-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 6:50 pm, Stewart Hildebrand wrote:
> When building with CONFIG_HVM=n and -Og, we encounter:
>
> prelink.o: in function `pit_set_gate':
> xen/xen/arch/x86/emul-i8254.c:195: undefined reference to `destroy_periodic_time'
>
> Add an IS_ENABLED(CONFIG_HVM) check to assist with dead code
> elimination.
>
> Fixes: 14f42af3f52d ("x86/vPIT: account for "counter stopped" time")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

While I appreciate the effort to get -Og working (I tried and gave up
due to frustration), this is gnarly.

PIT emulation is used by both PV and HVM guests.  All other uses of
{create,destroy}_periodic_time() are behind something that explicitly
short-circuits in !HVM cases (usually an is_hvm_*() predicate).

The PV path would normally passes 2 for the channel, which would
normally get const-propagated and trigger DCE here.

One option might be to make pit_set_gate() be __always_inline.  It only
has a single caller, and it's only because of -Og that it doesn't get
inlined.  Then again, this is arguably more subtle than the fix
presented here.

A preferable fix (but one that really won't get into 4.20 at this point)
would be to genuinely compile pit->pt0 out in !HVM builds.  That would
save structure space, but would also force the use of full #ifdef-ary
across this file.

Is this the singular failure with -Og, or are there others?  I never got
it working, and there were quite a few failures that failed to get a
resolution.

~Andrew

