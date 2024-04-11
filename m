Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851BB8A13F4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 14:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703875.1099798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutBC-00017L-CQ; Thu, 11 Apr 2024 12:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703875.1099798; Thu, 11 Apr 2024 12:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rutBC-00015U-9g; Thu, 11 Apr 2024 12:05:22 +0000
Received: by outflank-mailman (input) for mailman id 703875;
 Thu, 11 Apr 2024 12:05:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eZ5N=LQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rutBA-00015O-75
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 12:05:20 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3081f12-f7fb-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 14:05:18 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-69b10c9cdf4so19270036d6.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2024 05:05:18 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s11-20020ad44b2b000000b0069b1ecd6109sm859123qvw.19.2024.04.11.05.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 05:05:16 -0700 (PDT)
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
X-Inumbo-ID: c3081f12-f7fb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712837117; x=1713441917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dhwMRq2KEIymkW5s9GDxHsoYWg6i5/kRh45ouqzY7Bg=;
        b=NVPFJi1Bmwkfo6mXJAlFQ1Jvx8tOQa5yvPxew4h8sO7P9RvgdXiqUbAKOaVTLYj/hs
         J3yHFegVHLFpQ/jIHCfqHlrcpWTkDuyAB9WtGkF6sh/mqkzyiHkKlljRsMeY5c1yz8UD
         cabyVP0wiwokx+hw/RU41PIc+T5Cz1o/B7sAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712837117; x=1713441917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhwMRq2KEIymkW5s9GDxHsoYWg6i5/kRh45ouqzY7Bg=;
        b=AW+l/tlJn6hbZaoPhQJePuC53UfGYkU6tqPlWuGVd7oa87LIFrn8Y5tXrc1oD3DXJH
         iyeG7tRNPMUITBQMH1lq+OmD5uzo03SVFjhP0Kq8xXWhnIQGNshz4FwO9eyv9u0mp0oG
         igl1srQbXse1nQB4wekN1eaE3X+Q7BP/k82lXN41fCKLA2YjnyBS+u9EsuHPdhWQrrQA
         1C5TC3X3Sdpu1V3fOZbAeD+qss4BCKrZtCRYGYnxv6RlMxvXai+5yXbtswg6UPqtXgba
         DilPCfW3QZ3+k4I/Y187mWEZeNWJ+cITgZwHt+dM15b8kQT+dE+2tiOgEmRKlhtQJqMi
         aLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/U+YT0kihrzwPRCAh4o1PTeQyDXWiAs+qf/Jmi1sc5GL2zIr34znLUWKdAWmr6qnTdxzfiyYSwzwtHRX7+XcwQ3hjL9kZM2XawtphdnY=
X-Gm-Message-State: AOJu0YyGr4K4WOZzJGNrA/xba8GYrFRtObOLBBiqIjsvZNrXB1Y8gCnY
	Oj6gaDY+38k652uuwIhmXfATUCOw/rekDE2VOgJXYHy1+dToJPCaBfoGlTYPGBI=
X-Google-Smtp-Source: AGHT+IGhCJDtVgErQtdciV+Weu/6n4/h1KnzU8yuPie39K4CfxqaloWltPpA+bzkBC/hRnYZMu3/qA==
X-Received: by 2002:ad4:5aee:0:b0:69b:246b:4bff with SMTP id c14-20020ad45aee000000b0069b246b4bffmr5595186qvh.33.1712837117055;
        Thu, 11 Apr 2024 05:05:17 -0700 (PDT)
Message-ID: <f6222be7-c398-46a4-a1cc-6324cddac3ae@citrix.com>
Date: Thu, 11 Apr 2024 13:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi: Allow xen/acpi.h to be included on non-ACPI
 archs
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20240405182031.396528-1-sanastasio@raptorengineering.com>
 <7ab4053f-f8b3-4b6a-bd29-5d0fa228fca5@suse.com>
 <eb22ec4e-6e60-458d-a17c-ad47a3146a6e@raptorengineering.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <eb22ec4e-6e60-458d-a17c-ad47a3146a6e@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2024 11:16 pm, Shawn Anastasio wrote:
> On 4/8/24 1:54 AM, Jan Beulich wrote:
>> On 05.04.2024 20:20, Shawn Anastasio wrote:
>>> Conditionalize xen/acpi.h's inclusion of acpi/acpi.h and asm/acpi.h on
>>> CONFIG_ACPI and import ARM's !CONFIG_ACPI stub for acpi_disabled() so
>>> that the header can be included on architectures without ACPI support,
>>> like ppc.
>>>
>>> This change revealed some missing #includes across the ARM tree, so fix
>>> those as well.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Thanks.
>
>> albeit preferably with ...
>>
>>> @@ -118,6 +121,7 @@ extern u32 pci_mmcfg_base_addr;
>>>  #else	/*!CONFIG_ACPI*/
>>>  
>>>  #define acpi_mp_config	0
>>> +#define acpi_disabled (true)
>> ... the unnecessary parentheses avoided here.
>>
> If you'd like to handle this durring commit, that would be fine with me.
> Otherwise let me know if you'd like a v2 to be sent.

I've fixed on commit.  No need to send a v2.

Thanks.

~Andrew

