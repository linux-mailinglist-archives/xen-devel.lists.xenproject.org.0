Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7878AACA6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 12:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708941.1108161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlIh-0000jw-J2; Fri, 19 Apr 2024 10:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708941.1108161; Fri, 19 Apr 2024 10:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxlIh-0000iG-FL; Fri, 19 Apr 2024 10:16:59 +0000
Received: by outflank-mailman (input) for mailman id 708941;
 Fri, 19 Apr 2024 10:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/X0h=LY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rxlIf-0000iA-Ns
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 10:16:57 +0000
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [2607:f8b0:4864:20::c34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2810a1b-fe35-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 12:16:55 +0200 (CEST)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5aa4a1246b1so1096249eaf.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 03:16:55 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ok23-20020ac84117000000b004367cc4ab01sm1450043qtb.15.2024.04.19.03.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 03:16:54 -0700 (PDT)
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
X-Inumbo-ID: f2810a1b-fe35-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713521814; x=1714126614; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nRVKlLmpVCWZiKvHND/kH5St+cWD6mDFWrdqa1TpiNU=;
        b=ZB5ZRDCDLoHAd/sk7giJuHwtNXWnZ2Do/BkpaJNJbzr6pRWP2now+P6hVHCUuM03o7
         JaEDni5QJ6AHnZK/8PxW8MbtjvJsY+EaL5YUKWjt5E7dZVxvBSANxA9WzhaClxzq/MST
         NjlqQ6BjZHzn05AZD9jL0ObZ3NYb6KQw7TTXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713521814; x=1714126614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRVKlLmpVCWZiKvHND/kH5St+cWD6mDFWrdqa1TpiNU=;
        b=U+K7SSVzHazN2RuAhw/zdPPaSzyQBeAgz5fa7mlHmU/eKVKQaYE28Vt6DTtPOsPXLS
         mPzztziLztyAIGgZQ1xRlPFxk5qIBnQffwBM15e5iyLPQSehJjetJLtG0Xoky1WR6m6+
         zQSY758qkIsNRSkwzVM6E79MAVFoiAoWw0am3+j1UN5u5lSWxoQYNHLyUgZAXHFkFSt+
         EdOMKQ3ttuNEOgmb2vP1OIbUiWPqbbMa/Dq0DwU8SmrZDbFWo8Cop+UxlHVmKcRyZLLO
         soiKcQWAuv0CV7v+brszUol+WE4xnEUp+iZ+ZTgNvCEXd2kvl9dTeBzeefdJa+3ALu6U
         thSg==
X-Forwarded-Encrypted: i=1; AJvYcCV9MtwYtx7L6lH0H9j1yFYJ6koS+VsUaTA6myMOAKSyAq2X8RY4j9OdmxHKnj7VOu2YRN8QnUDmbBTt6g3TGvPbuQjls3ClHu7zUHrkwfw=
X-Gm-Message-State: AOJu0YwwW42Z+a3NR75rckCQjpG9264CCFDbpEtgaH5bngiBneAkUKuH
	UZdsimsmaxwcPgHMOQO+Blh5cEqp2ATVKfrI3Qyz+zMr5LVwO6zIRjlnMQkte9s=
X-Google-Smtp-Source: AGHT+IHfdJYqo+MplQnRtgHsG7jTozWqinxz+RTdtIk7nz0ZEeY+21p2PrI8o0msiOk7wRHiknhReQ==
X-Received: by 2002:a05:6358:6e82:b0:17f:1e37:6e3e with SMTP id q2-20020a0563586e8200b0017f1e376e3emr1701343rwm.32.1713521814492;
        Fri, 19 Apr 2024 03:16:54 -0700 (PDT)
Message-ID: <65c9f3c5-5583-4c87-b2d3-8ecfba9b88cc@citrix.com>
Date: Fri, 19 Apr 2024 11:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: introduce header file with section related
 symbols
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20240419100217.12072-1-roger.pau@citrix.com>
 <20240419100217.12072-2-roger.pau@citrix.com>
 <a5253ad9-02e6-408d-862c-91a3a87ad9e2@citrix.com>
 <0fe755cd-722e-41cd-9499-49dc628bf52b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0fe755cd-722e-41cd-9499-49dc628bf52b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/04/2024 11:12 am, Jan Beulich wrote:
> On 19.04.2024 12:08, Andrew Cooper wrote:
>> On 19/04/2024 11:02 am, Roger Pau Monne wrote:
>>> Start by declaring the beginning and end of the init section.
>>>
>>> No functional change intended.
>>>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> TYVM for doing this.  There's a lot of cleanup which can follow on for it.
>>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> although if anyone has a better name than sections.h then speak now.
> For what is put there now, and for any other section bounds markers the
> name is fine with me. I'm not presently convinced though we want to put
> __read_mostly and friends there.

Well that's exactly what I intend to clean up into it, because it's far
better in sections.h than (duplicated per arch) cache.h

(Also I intend to strip down kernel.h for the other major sections too.)

~Andrew

