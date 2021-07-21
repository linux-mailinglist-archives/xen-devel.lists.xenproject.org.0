Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093AB3D0E7B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 14:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159304.293051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Axk-00022d-CB; Wed, 21 Jul 2021 12:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159304.293051; Wed, 21 Jul 2021 12:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Axk-0001zM-8O; Wed, 21 Jul 2021 12:04:32 +0000
Received: by outflank-mailman (input) for mailman id 159304;
 Wed, 21 Jul 2021 11:57:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDhP=MN=gmail.com=like.xu.linux@srs-us1.protection.inumbo.net>)
 id 1m6Aqg-0000IT-R5
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 11:57:14 +0000
Received: from mail-pg1-x533.google.com (unknown [2607:f8b0:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67bca1c4-b042-44be-b724-fbbfaf60ecdc;
 Wed, 21 Jul 2021 11:57:14 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id k20so1635168pgg.7
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 04:57:14 -0700 (PDT)
Received: from Likes-MacBook-Pro.local ([103.7.29.32])
 by smtp.gmail.com with ESMTPSA id j12sm25930570pfj.208.2021.07.21.04.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 04:57:12 -0700 (PDT)
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
X-Inumbo-ID: 67bca1c4-b042-44be-b724-fbbfaf60ecdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1aayxhP7LR5pbpYNWPExB3m6iym6gHf5XQMlRKlxp94=;
        b=Gb3sYMtxc/kWDCMnCmYUN5o70Tvt9W/hvjABaQVw6GepiW6AF7jJcANbzNBRV1gq0H
         KVgsqId2MY+RXzDpDGY6dPw0M9zOWZUAQNGPy7PM2rys/HzrGgdYJ1JWxUE1QI9btZVV
         O6Nge5AQbsqTmzXcQomJIje10kgbOVDLOw6CAEgavNSXA2gO45gvZInn+kY7JYMZv+qO
         7oKYPWFeZHS6IplBXQIb7MGoEHkzU7p7v5SEAUS6Qb0XpyY5ciKG5wbqqw5mBV2thXmN
         kc5wkdciG83RddYCL0ig7AXvXY6vLlAn6fNTtakKWWWjb2B/kLBoNRRLEWJHhmSw7M5h
         laRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1aayxhP7LR5pbpYNWPExB3m6iym6gHf5XQMlRKlxp94=;
        b=eIsJdVRGLzbNXJz8Y3YA3a9e7edZw2oo9tYTc9/rodlymXm9gD2wbJiq6OUF36Bsa0
         jwgUyprjFJN/5Z9JyBXsQK4uIMnntvVUM0Uojn7FHG/3SRNr2jUC5jLvv6Nptb4jxpGY
         b9TlnBTbNShbG9ruBMgjlfmkGd0grBXSEnFwRpWPvEKoPG0rywzZPQgInniI+3OKpB6I
         RJ1/G8f/2xMyOxpA4q/4BeA3xZZ/uAE5/n+ZxVyr4scWkrSC6m+bE3IYxVg35wI5AyqX
         /eCeXyWpR9QgLkSgrHUJb/tcAdwhbnSbHf2TDLIWCENeuQJa2KRIVYQsNE1+2Rd1NKDB
         tkCw==
X-Gm-Message-State: AOAM530HI+Avex9EUSmf0PBYY+xmFyxWBhKFw42Aa68O4tmKZzTKxqi0
	3+2Xj845MDvyWm6XJTSlIFA=
X-Google-Smtp-Source: ABdhPJx8Jc6D+8J2xe+jplPG6WjflufBXyqLNydLZmg9K2ukmxfm1tClEJcFPfqxf5GDpWMtdTO8gQ==
X-Received: by 2002:a63:a01:: with SMTP id 1mr35267098pgk.360.1626868633306;
        Wed, 21 Jul 2021 04:57:13 -0700 (PDT)
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: bp@alien8.de, seanjc@google.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 kan.liang@linux.intel.com, ak@linux.intel.com, wei.w.wang@intel.com,
 eranian@google.com, liuxiangdong5@huawei.com, linux-kernel@vger.kernel.org,
 x86@kernel.org, kvm@vger.kernel.org, boris.ostrvsky@oracle.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org, Peter Zijlstra <peterz@infradead.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210716085325.10300-1-lingshan.zhu@intel.com>
 <20210716085325.10300-2-lingshan.zhu@intel.com>
From: Like Xu <like.xu.linux@gmail.com>
Subject: Re: [PATCH V8 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <fd117e37-8063-63a4-43cd-7cb555e5bab5@gmail.com>
Date: Wed, 21 Jul 2021 19:57:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210716085325.10300-2-lingshan.zhu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 16/7/2021 4:53 pm, Zhu Lingshan wrote:
> +	} else if (xenpmu_data->pmu.r.regs.cpl & 3)

Lingshan, serious for this version ?

arch/x86/xen/pmu.c:438:9: error: expected identifier or ‘(’ before ‘return’
   438 |         return state;
       |         ^~~~~~
arch/x86/xen/pmu.c:439:1: error: expected identifier or ‘(’ before ‘}’ token
   439 | }
       | ^
arch/x86/xen/pmu.c: In function ‘xen_guest_state’:
arch/x86/xen/pmu.c:436:9: error: control reaches end of non-void 
function [-Werror=return-type]
   436 |         }
       |         ^
cc1: some warnings being treated as errors

> +			state |= PERF_GUEST_USER;
>   	}

