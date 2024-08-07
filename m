Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1394A5B1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2024 12:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773355.1183801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbe2o-0001Vj-1x; Wed, 07 Aug 2024 10:37:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773355.1183801; Wed, 07 Aug 2024 10:37:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbe2n-0001To-VO; Wed, 07 Aug 2024 10:37:25 +0000
Received: by outflank-mailman (input) for mailman id 773355;
 Wed, 07 Aug 2024 10:37:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sbe2m-0001SQ-92
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2024 10:37:24 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 046f6a51-54a9-11ef-8776-851b0ebba9a2;
 Wed, 07 Aug 2024 12:37:17 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52f04b4abdcso2346513e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Aug 2024 03:37:22 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb9c83cbf0sm55134536d6.83.2024.08.07.03.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Aug 2024 03:37:21 -0700 (PDT)
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
X-Inumbo-ID: 046f6a51-54a9-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723027042; x=1723631842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtCQR4llpSQl4Ce3bHRxPr7DOi5yHbkr62zhtLRBZ+U=;
        b=F1QISNktbxrst3LHxEn3Fd8gKL14SwrUpJJj0D+Mua1aZtPv588aMOBfMt2CfLGm9Z
         lNYodUlhOTyTENgUr3yqDHREtKoWT9VTk7hrnyeGYxU2WCtX7KLIIv7rrKuluTR91Tmj
         eQ2YN2X//Z/y113Gf+OOZaebjtPnrooC0wUW2lUAbVoSmqhzS3H5E0wTVpr31lhwk3DP
         BHNmmR4/5crk/cDeKeewi2Xelnx8C0d1phQYGJOoqVpvINy+ScJpk0d0PmXKb8Zrh7n5
         5JzUj7TAChgcBBjgmLRIlSMfwEdvVohAubenPDUIzO86+Bd5lZx6zh6SfbzuAqw3prem
         +lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723027042; x=1723631842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtCQR4llpSQl4Ce3bHRxPr7DOi5yHbkr62zhtLRBZ+U=;
        b=iR9Pnwv7UOurTpLQP9HgrBH1ip0Ao/N76s+tBIkKGZxzWiaHMJ9HpZoG7SG6/rYWa6
         Bg94o+fJ4MjUfn92f499iTM41aAh7I++fgvMhRz9NZyc4wtN+dE1N+JA39D3zAIAJ+/l
         DS49hldbdL070z65zRhX0S/rUWX5fnXYoVKodwCFgsdWSbaX/na9fLFQt+Q7o90Ucs9F
         6jfrUPU+XZdozv/XUYbXL0WnLoXy0pQ38gS+4d2b8JzT1DD3vVQq0BVPmhHpxCSLUH8D
         KDEyTE86I1l7OEOQcTvuYsIVovKOfk9m1wrzIJZyMXnTlf5gNzuLUYRlaLGDpwcWTzQW
         AFzg==
X-Forwarded-Encrypted: i=1; AJvYcCXyhHVT5VNAoGrSefNqSSOcVlF291aPvzgWb+zWfVcHjbI79lBZfB6UVUIjLMqVy9wb3eXuf7nt+i0XdlLRM3KStitp5+rPuyavKi6EL64=
X-Gm-Message-State: AOJu0YxjHUIxyYadxlQqWkQc7NweaICyYfYtJfM0LjGCdRotozbS7dF8
	TZk7dOoDsALkh9ZVhNVOw5fQKTHqDgIMdlWleSWgzDnAdzzQb6cKPkk4akl1Frk=
X-Google-Smtp-Source: AGHT+IFWwx7rLRv7+flp6Qt7KN7Rfr939cJSrryBKNbjkCy0kv0cVckwj4XS6cvKdooZF/iTAYmZoA==
X-Received: by 2002:a05:6512:1094:b0:52e:9ebe:7325 with SMTP id 2adb3069b0e04-530bb374627mr11571201e87.31.1723027041666;
        Wed, 07 Aug 2024 03:37:21 -0700 (PDT)
Message-ID: <b46c051f-98c2-4748-8423-3e3a4511b043@suse.com>
Date: Wed, 7 Aug 2024 12:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] xen: fix dom0 PV boot on some AMD machines
To: linux-kernel@vger.kernel.org, x86@kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org
References: <20240807103338.22007-1-jgross@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240807103338.22007-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.08.24 12:33, Juergen Gross wrote:
> There have been reports of failed boots with Xen due to an overlap of
> the kernel's memory with ACPI NVS reported in the E820 map of the host.
> 
> This series fixes this issue by moving the NVS area in dom0 to some
> higher address.
> 
> Juergen Gross (5):
>    xen: use correct end address of kernel for conflict checking
>    xen: introduce generic helper checking for memory map conflicts
>    xen: move checks for e820 conflicts further up
>    xen: move max_pfn in xen_memory_setup() out of function scope
>    xen: tolerate ACPI NVS memory overlapping with Xen allocated memory
> 
>   arch/x86/xen/mmu_pv.c  |   5 +-
>   arch/x86/xen/setup.c   | 242 +++++++++++++++++++++++++++++++++--------
>   arch/x86/xen/xen-ops.h |   3 +-
>   3 files changed, 201 insertions(+), 49 deletions(-)
> 

Please ignore this series, messed up the "Tested-by:" of Marek by omitting
the tag. Will resend.


Juergen

