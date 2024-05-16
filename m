Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178B8C7A57
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 18:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723536.1128485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dyP-00006b-EO; Thu, 16 May 2024 16:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723536.1128485; Thu, 16 May 2024 16:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dyP-0008VZ-Bn; Thu, 16 May 2024 16:28:53 +0000
Received: by outflank-mailman (input) for mailman id 723536;
 Thu, 16 May 2024 16:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3ow=MT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s7dyN-0008VR-JV
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 16:28:51 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6023bfdb-13a1-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 18:28:49 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-572a93890d1so3960404a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 09:28:49 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea651asm10572126a12.11.2024.05.16.09.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 09:28:48 -0700 (PDT)
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
X-Inumbo-ID: 6023bfdb-13a1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715876929; x=1716481729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sYshh0QI0PrXPFS5i6kmqo4IRlBxVxLPl4wGtP83Wcc=;
        b=XIFb7pSiTrsz0eo5glvbv/rXLqEv2tQwMexNNv11hYxLGc8cOn6TfXW1r7uPcvsSVP
         9a/xSG/vple1TNaKLwOI9vszW4dMZVXHVcxYiN1DJ2lTpum8I/um3/K+mpO/7p6g82i3
         v/dm3OiPUFNIdvBn9JD4SI44Fzhy9rHJiXNuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715876929; x=1716481729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sYshh0QI0PrXPFS5i6kmqo4IRlBxVxLPl4wGtP83Wcc=;
        b=hNX9YfGlqzbIUBuL5fgOfPJXSN5uLKNhrDQ6Hv+Cvxt2M8ta4QAF0b663aA0cURpBz
         3MF5b4jtd72Gkekl7bFHBwVD0x8DGykEWC+P2BZthQaa3QfC7V1MHz+VLHr8Ln9BrTbU
         HfLdOMWVthRcHMH+9G7IV312dvlZ3XvQNB/qMRyXS3r2QwTUTY00lbRqA1T3jMfALudA
         pTkeLgN5x4pjqfj7lwEOIgVPeictHC/n+Mtq31MP5UavavHzWs063Wjhuq5CF7HhUSdN
         iw4Im3XTeSL6Na4DLF+1t4soU0Yc1981gAlxJOjj26HAiXaKtXcatArYrqc5JFp3j+d6
         hKuA==
X-Gm-Message-State: AOJu0YwxYlIrjzxyt0b37HtTpo8XVZqJ5QZkzyEz78qrxWKkUNAFzSov
	8I/OGVe/hLWQ38RzCUbXT1l7RTu2d5lb5g+hHZFRSI0GMEOTuWcKTWVX1vpkQAQ=
X-Google-Smtp-Source: AGHT+IFwtqFNdOmhuTbmewPDpOKdfsBFMHbGRKypLdnZt42ifFJqVgEK8ybhcLmPeLNzN2MNoRLjfw==
X-Received: by 2002:a50:c317:0:b0:575:c1a:4948 with SMTP id 4fb4d7f45d1cf-5750c1a5334mr1863831a12.4.1715876929193;
        Thu, 16 May 2024 09:28:49 -0700 (PDT)
Message-ID: <61966287-10a6-415c-9902-82f5e19e35f4@cloud.com>
Date: Thu, 16 May 2024 17:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tools/xg: Move xc_cpu_policy_t to xenguest.h
To: Anthony PERARD <anthony@xenproject.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
 <20240207173957.19811-2-alejandro.vallejo@cloud.com>
 <33f7fbc5-6bbf-4f84-9d83-96cbb106d7de@perard>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <33f7fbc5-6bbf-4f84-9d83-96cbb106d7de@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2024 15:13, Anthony PERARD wrote:
> On Wed, Feb 07, 2024 at 05:39:55PM +0000, Alejandro Vallejo wrote:
>> diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
>> index e01f494b772a..4e9078fdee4d 100644
>> --- a/tools/include/xenguest.h
>> +++ b/tools/include/xenguest.h
>> @@ -784,7 +784,13 @@ xen_pfn_t *xc_map_m2p(xc_interface *xch,
>>                        unsigned long *mfn0);
>>  
>>  #if defined(__i386__) || defined(__x86_64__)
>> -typedef struct xc_cpu_policy xc_cpu_policy_t;
>> +#include <xen/lib/x86/cpu-policy.h>
> 
> I don't think it's a good idea to expose "cpu-policy.h" to "xenguest.h",
> and it's going to break the build of every tools outside of xen
> repository that are using xenguest.h. xenguest.h is installed on a
> system, but cpu-policy.h isn't.
> 
>> +typedef struct xc_cpu_policy {
>> +    struct cpu_policy policy;
>> +    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
>> +    xen_msr_entry_t msrs[MSR_MAX_SERIALISED_ENTRIES];
>> +} xc_cpu_policy_t;
> 
> Would using an accessor be an option to access `leaves` and `msrs` for
> "xen-cpuid" tool? That would avoid the need to expose the "cpu-policy.h"
> headers.
> 
> With accessors, we might not need to expose xc_cpu_policy_serialise() to
> the world anymore, and it could be internal to libxenguest, probably, I
> haven't check.
> 
> Thanks,
> 

That would work out for xen-cpuid.

I'm on the fence in the general case because I think it'd be
advantageous to let clients (i.e: xl) manipulate directly the
deserialized form of the policy. That would allow flipping features on
or off a heck of lot easier. We could create per-feature accessors, but
then we'll end up with _a lot_ of them.

I guess we'll get there when we get there. The xen-cpuid case definitely
doesn't warrant it. I'll give this a go.

Cheers,
Alejandro

