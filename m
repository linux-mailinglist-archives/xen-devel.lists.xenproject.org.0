Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4A49B364D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 17:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826824.1241242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SSB-0001WG-34; Mon, 28 Oct 2024 16:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826824.1241242; Mon, 28 Oct 2024 16:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5SSB-0001UP-08; Mon, 28 Oct 2024 16:18:51 +0000
Received: by outflank-mailman (input) for mailman id 826824;
 Mon, 28 Oct 2024 16:18:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5SS9-0001UJ-Pp
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 16:18:49 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fa00fc3-9548-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 17:18:47 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cbb719839eso4204227a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 09:18:47 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f030c40sm389941966b.84.2024.10.28.09.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 09:18:46 -0700 (PDT)
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
X-Inumbo-ID: 4fa00fc3-9548-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730132327; x=1730737127; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3AZ1TCtzJA0Vf8xLhq2vwsno1Q5afCdh69Svku7uVlU=;
        b=m96kfcTzDtqAjTk4u/nMbLtMlwtrW6UPvwnePd7yicuSPpfFp/iVJRpqOF+mQholar
         5fe0FvYvRs4GX0Q2sIQLFWn/nJkkYG39G3OYz5BAPGngZ9YMEXNsI4BWxrK90fdMdOn3
         86t6ZgdSVFzg1jTJpCdL1elsZs7LwwdTMJcjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730132327; x=1730737127;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AZ1TCtzJA0Vf8xLhq2vwsno1Q5afCdh69Svku7uVlU=;
        b=njRtDqn5shDaQ1vh9X0HDCH7EO1OvlzxXVa71c6z0FkjefBbHdeC6UE/9ht9EhfM2S
         9B0prY9N1VY77Af0xEZRJJ5S2kIJVvep/0HK6+/2DOKdGPKjZkSSYD5KXEm8Qc+pR1DN
         fKpFMFHpVSQyq1Hq/KA5d8EUXjI5NbW0x+Cbgd1OfEqRAUIEkFUZtoXk7TKvngkACwaa
         4DaJbze4z2VBljOcghFCtwMC5Rzwd85utK1DJ+6b/85Chi985wiUm6xr60+b2PU3cclg
         q5NFHkJPjJ/UkMbrUDDW4ReB+f1s9nDyiDxqFEZyKWeG59hY9yua5cIk9CH3UhAQZLlo
         3bzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1qR5hfsZy/PkkFuI7KkwvAjJHBFX/yhFy2OpYsX8pO/2wtXtfy2oiecapgK5M6TLYgatKBA7syPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTRU8AFqKeLyykEektX7fKpjQAykj5OHg+ibPIjY7jw7xdtQOi
	4FSRyIL0FZD58/LpAFuUPnGssYwaf+EeCMqpiZoXZxSmE0BeD9qHsxyNdj+0l3Q=
X-Google-Smtp-Source: AGHT+IHGiLn42Qks4zVeV7ehp6j6INYqF8Lmo0ar8bwsgj3wxi1gqxckHaAPXPLraNq4ihDcWQCgnQ==
X-Received: by 2002:a17:907:9719:b0:a9a:67a9:dc45 with SMTP id a640c23a62f3a-a9de5d6eb93mr836213966b.3.1730132327333;
        Mon, 28 Oct 2024 09:18:47 -0700 (PDT)
Message-ID: <ecd11958-2ce8-41fc-87f8-7b6b090c74b5@citrix.com>
Date: Mon, 28 Oct 2024 16:18:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] earlycpio: constify find_cpio_data()'s "data" parameter
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b2fdb048-cfc5-4f61-8507-bf8020e02132@suse.com>
 <764c0116-88ed-48af-8e53-f2a0f6e850a3@citrix.com>
 <c618e09f-b88c-45c8-8cbd-8aae82891c6e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c618e09f-b88c-45c8-8cbd-8aae82891c6e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2024 4:12 pm, Jan Beulich wrote:
> On 28.10.2024 17:07, Andrew Cooper wrote:
>> On 28/10/2024 4:03 pm, Jan Beulich wrote:
>>> As with 9cbf61445cda ("xen/earlycpio: Drop nextoff parameter"): While
>>> this is imported from Linux, the parameter not being pointer-to-const is
>>> dubious in the first place and we're not plausibly going to gain a write
>>> through it.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> You haven't tried compiling this, have you?
> Of course I have. Is there any subtlety with compiler versions? Or what
> else am I missing?

struct cpio_data's copy of this field is non-const (which you keep on
noting that new compilers will object to), and you can't change that
without breaking the build in microcode.

Nothing of this form can be taken until the constness is consistent in
microcode, after which yes it can mostly become const.

~Andrew

