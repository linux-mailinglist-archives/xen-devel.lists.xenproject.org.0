Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8CFB398D5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 11:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098100.1452225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZIe-0001xp-Uk; Thu, 28 Aug 2025 09:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098100.1452225; Thu, 28 Aug 2025 09:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZIe-0001vZ-S4; Thu, 28 Aug 2025 09:52:08 +0000
Received: by outflank-mailman (input) for mailman id 1098100;
 Thu, 28 Aug 2025 09:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1urZId-0001vO-2n
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 09:52:07 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a809c97c-83f4-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 11:52:06 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b0c82eeso6022255e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 02:52:06 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7271cd01sm58257585e9.23.2025.08.28.02.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 02:52:05 -0700 (PDT)
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
X-Inumbo-ID: a809c97c-83f4-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756374726; x=1756979526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aAgP6HHVwZSc6aUEkqepqPH6CHzDsa0ey6wespW87DI=;
        b=K9CX9v5E02ksszNmCRucY04YdVzI3eH+ZnFI+0x6p5LXo18a1um8SmZWcX/IAz4Co2
         ze5yaHr1B8aYItrB/KoVaNH2uuXVuS8Nh78R+pu/A/kCxbnfxmaCzBzHppy08DtviCug
         w7mOBnKCOH7XT+SazVy2nJV1mr3LSdHYUSBmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756374726; x=1756979526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAgP6HHVwZSc6aUEkqepqPH6CHzDsa0ey6wespW87DI=;
        b=N5qWc2GkkjvZmdWCsPK6QKoWnCT+ktkQhlQq3C3y9e+6j+ls9fUt+gpsbjCopjqSqJ
         kal3IFRU1OcJjAuUU+BWidi7D8ceS2ds35t1HWSM6/htf1YL3/7LAg6KBVu6N2h0VFQa
         TI8JgmaOw8RWkOjFFg8BBS98cx32Cgn3cFNB0XISkBDYCwEtnSKG+OgIY9ln9hwU4+TB
         3F6Tnx0oVE40Liej3Scnz+JBEWhKJv346Kiw34ys3LGD9owR9YlKZOSZQtbWivT0xOPX
         k3iAE+YfhN+KNtGyi3gMY7V4AElOQz5DUOj/7JYYqqT21dGSxHGU/uTJKzg84HDqzVnZ
         6nIQ==
X-Gm-Message-State: AOJu0Yw1GXanNl3fTYzptJnZ5BPoDog9SO16/C5dyLlgLAwuPnAm6Cmv
	K8+ankA2/4nYH6bDiPbynHoavj7fzEp1jdGhnSAcB43zHWvP7HA5x185RZgEtMDIbYI=
X-Gm-Gg: ASbGnct5q1dU9unD01PXsEEhBzr5AS2SHrF45d907iYfMJMjHYQhuiQ3ql5tF14tp0/
	GmQcqeROilaHOhgN/N1LuWs0MjM/e+5gEG9A5F5bKb3AYi5GPzB/gxzqWBEaMlHN5NtlEhUAw8E
	SfCG47lG8Im591xFhoBUhjWy2NuPXmfUiGtNjMu6sytBMv1M6vuxJMZ60Ex/UYykrdRIl5GegXS
	41pa6Tm5VpXhbzsE2ErCmjSSzoNGfonz7q/ROHN6mKHKiZlfw7mNIOfWaK/pvYYzd8VwNzX2e5h
	pviSLLLwBaF22n4UCGHXRqzSsdkd8EY7+bAZxi4hOAMFtDq/xfLiV7DjpDEOEgk7bUCKbmwJWh0
	d903kQd+yRLIRrVo+C4pylX+lp7OX7VkEGKRZ/RfwcQ95tmLE4XOXXOmlM00umMBsHGwgDDtm2+
	uGvoY676vcqKFR+w==
X-Google-Smtp-Source: AGHT+IHSy+Nq5KvJcq+YF63WP67WFwav0t5DY8udfC//b4di1YLi4NxwNgxB1oywF244siCWrpP9IQ==
X-Received: by 2002:a05:600c:4685:b0:458:bfe1:4a91 with SMTP id 5b1f17b1804b1-45b517c5551mr201936645e9.20.1756374725733;
        Thu, 28 Aug 2025 02:52:05 -0700 (PDT)
Message-ID: <8e476186-d78a-429d-ae1f-16907c3ec7b2@citrix.com>
Date: Thu, 28 Aug 2025 10:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] device-tree: fix infinite loop issue in
 'assign_shared_memory()'
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <0e562f695e5db87ab80dde69cbcc0cfa14f94b21.1756373770.git.dmytro_prokopchuk1@epam.com>
 <861c88c005b041fa622310d6bef63c25@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <861c88c005b041fa622310d6bef63c25@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2025 10:47 am, Nicola Vetrini wrote:
> On 2025-08-28 11:39, Dmytro Prokopchuk1 wrote:
>> Fix an issue in the 'fail:' cleanup path of the 'assign_shared_memory()'
>> function where the use of an unsigned long 'i' with the condition
>> '--i >= 0' caused an infinite loop. Update the loop to use 'i--',
>> ensuring correct loop termination.
>>
>> This change adheres to MISRA C Rule 14.3: "Controlling expressions shall
>> not be invariant."
>>
>> Fixes: 72c5fa2208 (device-tree: Move Arm's static-shmem feature to
>> common, 2025-06-03)
>
> The format should be
>
> Fixes: 72c5fa220804 ("device-tree: Move Arm's static-shmem feature to
> common")
>
> can be fixed on commit probably

It can, but that's the wrong Fixes tag.  That commit simply moved the
bad logic.

Commit 041957bad382 ("xen/arm: Add additional reference to owner domain
when the owner is allocated") is the one that introduced the bad expression.

~Andrew

