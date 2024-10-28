Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F29B377E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 18:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826889.1241332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TMK-0001P4-4J; Mon, 28 Oct 2024 17:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826889.1241332; Mon, 28 Oct 2024 17:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5TMK-0001NZ-0O; Mon, 28 Oct 2024 17:16:52 +0000
Received: by outflank-mailman (input) for mailman id 826889;
 Mon, 28 Oct 2024 17:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/lrK=RY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5TMJ-0001NT-0B
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 17:16:51 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b2f8933-9550-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 18:16:50 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c9428152c0so5288971a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 10:16:50 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb62c9e60sm3505453a12.57.2024.10.28.10.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 10:16:47 -0700 (PDT)
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
X-Inumbo-ID: 6b2f8933-9550-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730135809; x=1730740609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=he1xDpJNSWo24LOGoxUn+wHNiZL9sJlBn2Xu+OzyMPg=;
        b=j+SDvD81QxY6+I3diz2gh3NNBPrw1Cu0o7c0MdgtIYaNoTF6WCBU7EKwNAHOOkX8vS
         Xx2eF6BOmuYacFRLLo7kkIxfcbrEIOABP6b3RrXL0/9ceRVZ+VuDHiM5+LvK1rHUDANn
         3ejdnM0c+0nNKK0UklfIcgRw5CqIwYaFdD550=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135809; x=1730740609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=he1xDpJNSWo24LOGoxUn+wHNiZL9sJlBn2Xu+OzyMPg=;
        b=H32JTJ2wPbpJtoIw+VEfcfU563wSvkGgVq9MN8WM7LLOVqcUS36JwhSOTAToSzWlS/
         agDt6Ggg4QbccOhb8ti8r0Dczh3UjWbYIB3uYw9ARarZJtdbdoON6AQonUM0gKs275aQ
         d9DRnvFOIxi+YCfzmPiq1kHuoiMCtRbu4sX6Hf9K+SgjL2kIBgEjyLc/1LfihThSrh8J
         zBmQ6PNC4ZNOEg86/qCWSMr0T+yi/WDSgEIK32g/aBIwBuDBKzXFSkaksASX5QEnqrvm
         WUsYu9EH+4+zGMxg1uO+DcrOPyQkU2G2NOXAecL4a0ALmKwE4o+z0beSgVJHu0WHNe9K
         N58A==
X-Forwarded-Encrypted: i=1; AJvYcCVrpmLUjsgoOtrmns/10U141fGgxHev1F0RC8c/+MqHjlhf1A7hhb1P64Iy9896g40HUQCLoosTcuo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2w+ExSMqEp1vkW2rBzCHabIBDSLP4uny/Vz+qomA/yovWxGS/
	mFBdXayhKnF5OIwLT7IZLrowE8EE3rSHVU6OCEmLhgl/x4aj6Y5PprtrACl0sFk=
X-Google-Smtp-Source: AGHT+IEw6ErSJJdCacCVgF7HXMfpvLiVptQod+5BieK+bG3ax/IRMjnRP+2tG1CJ3UAo8Iwxa4WHvA==
X-Received: by 2002:a05:6402:278b:b0:5c9:85de:db8a with SMTP id 4fb4d7f45d1cf-5cbbf8a4d1cmr8483617a12.11.1730135808076;
        Mon, 28 Oct 2024 10:16:48 -0700 (PDT)
Message-ID: <fdc89027-d33c-40f5-93f9-b8d7e880e732@citrix.com>
Date: Mon, 28 Oct 2024 17:16:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] x86/xstate: Update stale assertions in
 fpu_x{rstor,save}()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-2-alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241028154932.6797-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/10/2024 3:49 pm, Alejandro Vallejo wrote:
> The asserts' intent was to establish whether the xsave instruction was
> usable or not, which at the time was strictly given by the presence of
> the xsave area. After edb48e76458b("x86/fpu: Combine fpu_ctxt and
> xsave_area in arch_vcpu"), that area is always present a more relevant
> assert is that the host supports XSAVE.
>
> Fixes: edb48e76458b("x86/fpu: Combine fpu_ctxt and xsave_area in arch_vcpu")
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> I'd also be ok with removing the assertions altogether. They serve very
> little purpose there after the merge of xsave and fpu_ctxt.

I'd be fine with dropping them.  If they're violated, the use of
XSAVE/XRSTOR immediately afterwards will be fatal too.

~Andrew

