Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4725C8D6FCD
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 14:48:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734184.1140376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDO9G-0001AF-OB; Sat, 01 Jun 2024 12:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734184.1140376; Sat, 01 Jun 2024 12:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDO9G-000180-LQ; Sat, 01 Jun 2024 12:47:50 +0000
Received: by outflank-mailman (input) for mailman id 734184;
 Sat, 01 Jun 2024 12:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKEA=ND=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sDO9F-00017u-3i
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 12:47:49 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 263eeeda-2015-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 14:47:48 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4211a86f124so26860405e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Jun 2024 05:47:48 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42135fea176sm17201475e9.24.2024.06.01.05.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jun 2024 05:47:47 -0700 (PDT)
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
X-Inumbo-ID: 263eeeda-2015-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717246067; x=1717850867; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=riCkD32/UuiItOB7MtcAWeONqLdUqZ8WmonNhxbn7V0=;
        b=utE3M44+B8Arn4vS+1TGG7Wvrwj90DJWtHXWSlkRqONsBvqKp3X7yS26NnjDJ5BMR9
         wrZseHPmxChTV3SDFqo5zNFFIDH5CJksGLFJkEUawvSSupS6AEKhjmx/5IVxoKlG91lK
         RYMgBS2nPX2aR95xiAwSp5BxwtS8xRujw72p8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717246067; x=1717850867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riCkD32/UuiItOB7MtcAWeONqLdUqZ8WmonNhxbn7V0=;
        b=nSWMCgwOltSzPsN7u/qW9sV+aQoStLF46LE0BO48unOgFMhxt8CXu9EdM3pQpQO701
         Dy0+m93GbiYYSrS8yZbTIN6MkKWxDkDp2YU8q6j4AQ1Eo8SCwc3OcfpYIQ8XzC4uKGFB
         5pOdQmyV8ku7pkTyXBjxkyRAJ0s2Wwnk5grtzMeJycj5AgZgBIeAchDW/57y5B2GZXGW
         jdgWXsRNSa+5LokkJviiBr0EiCor+Py6WzynSuXrQhc4qzcSIS3soiDGDW9foM4ItBk1
         5uYbCO8N06+N9UxcQxHL2BGz++g1nl1Y834QjstDe8b+soXLg9g4MJcCsXOGPWsIAcPg
         Q/fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhApnM2azLHHoMW83RB9+WxJwq8JExEwfUWbGpvxaTsMVrzu7v6xS5jYiwX561rgltHA6n3cJB8SO6Imd9d8BUKvd+rIlsG1ERFfi19Lc=
X-Gm-Message-State: AOJu0Yx4Q4GY5l9w83H7Mitkh+hoSLyuJNHS3dcTNIcZgJ6GiS+RK95d
	WcJq9qj/jZif6L0bKZ6J8xcZ1iaZYqcPisG+pDqGzA39fe+cBL1+65zeR8KeYvM=
X-Google-Smtp-Source: AGHT+IHWVz++Y2tyJTLooWZCXPDJEC/zDsjrz34/gY0uAaU94Mb/TYe9CHNJN0VM6MohGQoVFnc4Bw==
X-Received: by 2002:a05:600c:4fc9:b0:41b:f30a:41f1 with SMTP id 5b1f17b1804b1-4212e04422bmr38129845e9.7.1717246067396;
        Sat, 01 Jun 2024 05:47:47 -0700 (PDT)
Message-ID: <6ea1507d-25dc-4b3c-8c00-3b7b271e69a0@citrix.com>
Date: Sat, 1 Jun 2024 13:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/5] xen: fix MISRA regressions on rule 20.9 and 20.12
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
 <7d454066eb24e0515ff5b37864ed7a7ef5215dc5.1717236930.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7d454066eb24e0515ff5b37864ed7a7ef5215dc5.1717236930.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/06/2024 11:16 am, Nicola Vetrini wrote:
> ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure ahead of rearrangements")
> introduced new violations on previously clean rules 20.9 and 20.12.
>
> The first is introduced because CONFIG_CC_IS_CLANG in xen/self-tests.h is not
> defined in the configuration under analysis. Using "defined()" instead avoids
> relying on the preprocessor's behaviour upon encountering an undedfined identifier
> and addresses the violation.
>
> The violation of Rule 20.12 is due to "val" being used both as an ordinary argument
> in macro RUNTIME_CHECK, and as a stringification operator.
>
> No functional change.
>
> Fixes: ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure ahead of rearrangements")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thankyou for this patch.  I'd seen that I'd broken something.  (Entirely
my fault - I've done a lot of testing in Gitlab for the series, but
never manually ran the Eclair jobs.  I'll try to remember better next time.)

One question though. 
https://gitlab.com/xen-project/xen/-/jobs/6994213979 says:

Failure: 1 regressions found for clean guidelines
  service MC3R1.R20.9: (required) All identifiers used in the
controlling expression of `#if' or `#elif' preprocessing directives
shall be #define'd before evaluation:
   violation: 1

While there is a report for 20.12, it's not clean yet (so the first
sentence wants adjusting), and RUNTIME_CHECK doesn't show up newly in it.

So, while I agree that RUNTIME_CHECK() should be included in the 20.12
exclusions, why is current Gitlab Run not reporting it?

~Andrew

