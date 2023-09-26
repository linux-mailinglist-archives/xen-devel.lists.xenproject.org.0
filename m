Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2957AE928
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 11:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608376.946822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4L0-0005yI-Ct; Tue, 26 Sep 2023 09:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608376.946822; Tue, 26 Sep 2023 09:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql4L0-0005w9-9Z; Tue, 26 Sep 2023 09:26:38 +0000
Received: by outflank-mailman (input) for mailman id 608376;
 Tue, 26 Sep 2023 09:26:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5Ia=FK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ql4Kx-0005w0-Uf
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 09:26:36 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c823047d-5c4e-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 11:26:33 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3214cdb4b27so7798259f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Sep 2023 02:26:33 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o5-20020adfeac5000000b0031984b370f2sm14100219wrn.47.2023.09.26.02.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 02:26:32 -0700 (PDT)
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
X-Inumbo-ID: c823047d-5c4e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695720392; x=1696325192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kmbdPGVs/W/K0GplugB5QvWG9QUiEtGu9P+FlblHW9s=;
        b=P3reEDncyFxBdVeNQj2c2flfLcniW9w/mg++5y8X6HsDO9L7ok5rQzpVjnkVw0GmxF
         vQAtrTMece4ZlttHD1EBlWoD0IVLZaPyL7TtsxRrUQjXiJpK5R7oN11vvb5YAsTUXz1X
         iTMgvrXJKzpOEZlGYTYRM11oeqH3MrnqDHcSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695720392; x=1696325192;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmbdPGVs/W/K0GplugB5QvWG9QUiEtGu9P+FlblHW9s=;
        b=bb4zGKOdzpQeSnS1yZAA2JAIJ3FwkpzmrbiEtekUoMyOa2c7gejdmp4tQg8BNyteFY
         1BvJWwRHNI++djJGcLmdMKCifgzQDEtV5OfFCNnNaN5t8PuIRsrM6ThJWC2jETJQL5+j
         oJqATXlYSmVlvtcclaWeKpSPWHgLCtlhcJQjtR7ATl+ltxZDjKoOYLC4Wi4E+T8l1V7Y
         t75dF6CLH85SXWCg/5QYVFGCU4i05sm7/C2ZdQHx2R8XOwRT+tikNO3dhL4NqMoj/RWv
         B/gcB/MopycObL2P2IJwjjoXrw6T48Gzj6XiBY7q5AUUihBszamI5wiL5bm17rKUdq4V
         nYgw==
X-Gm-Message-State: AOJu0Yxh/GiQBZJQadRWXOlUhH7lAVPWZ8d+vdaZ74tzwVLmfLMHaQAi
	y5rmZjFBEt/Iy3hchmInWJ0Dzw==
X-Google-Smtp-Source: AGHT+IGgfHuuM6+TDVmgDCR6/9jB/xVFtYMos7qI/oRqScsqgBiOvBrkuPDQ8QUbO3jvp1Bf0T5msA==
X-Received: by 2002:a5d:44ca:0:b0:31f:fdd8:7d56 with SMTP id z10-20020a5d44ca000000b0031ffdd87d56mr8037098wrr.12.1695720392647;
        Tue, 26 Sep 2023 02:26:32 -0700 (PDT)
Message-ID: <6e0064bc-65c1-24f5-c29d-c1d1c027e2d3@citrix.com>
Date: Tue, 26 Sep 2023 10:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: andrew.cooper3@citrix.com
Subject: Re: [PATCH v11 05/37] x86/trapnr: Add event type macros to
 <asm/trapnr.h>
Content-Language: en-GB
To: Nikolay Borisov <nik.borisov@suse.com>, Xin Li <xin3.li@intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 pbonzini@redhat.com, seanjc@google.com, peterz@infradead.org,
 jgross@suse.com, ravi.v.shankar@intel.com, mhiramat@kernel.org,
 jiangshanlai@gmail.com
References: <20230923094212.26520-1-xin3.li@intel.com>
 <20230923094212.26520-6-xin3.li@intel.com>
 <7acd7bb3-0406-4fd9-8396-835bfd951d87@suse.com>
In-Reply-To: <7acd7bb3-0406-4fd9-8396-835bfd951d87@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/09/2023 9:10 am, Nikolay Borisov wrote:
> On 23.09.23 г. 12:41 ч., Xin Li wrote:
>> diff --git a/arch/x86/include/asm/trapnr.h
>> b/arch/x86/include/asm/trapnr.h
>> index f5d2325aa0b7..8d1154cdf787 100644
>> --- a/arch/x86/include/asm/trapnr.h
>> +++ b/arch/x86/include/asm/trapnr.h
>> @@ -2,6 +2,18 @@
>>   #ifndef _ASM_X86_TRAPNR_H
>>   #define _ASM_X86_TRAPNR_H
>>   +/*
>> + * Event type codes used by FRED, Intel VT-x and AMD SVM
>> + */
>> +#define EVENT_TYPE_EXTINT    0    // External interrupt
>> +#define EVENT_TYPE_RESERVED    1
>> +#define EVENT_TYPE_NMI        2    // NMI
>> +#define EVENT_TYPE_HWEXC    3    // Hardware originated traps,
>> exceptions
>> +#define EVENT_TYPE_SWINT    4    // INT n
>> +#define EVENT_TYPE_PRIV_SWEXC    5    // INT1
>> +#define EVENT_TYPE_SWEXC    6    // INTO, INT3
>
> nit: This turned into INTO (Oh) rather than INT0( zero) in v11

Yes, v11 corrected a bug in v10.

The INTO instruction is "INT on Overflow".  No zero involved.

INT3 is thusly named because it generates vector 3.  Similarly for INT1
although it had the unofficial name ICEBP long before INT1 got documented.

If INTO were to have a number, it would need to be 4, but it's behaviour
is conditional on the overflow flag, unlike INT3/1 which are
unconditional exceptions.

~Andrew

