Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48EB2C453
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 14:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086549.1444764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLsU-0007BF-AU; Tue, 19 Aug 2025 12:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086549.1444764; Tue, 19 Aug 2025 12:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoLsU-00079E-6k; Tue, 19 Aug 2025 12:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1086549;
 Tue, 19 Aug 2025 12:55:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h/XH=27=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uoLsS-00077X-8L
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 12:55:48 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3476aec-7cfb-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 14:55:47 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a1b0bd237so42322455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Aug 2025 05:55:47 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c61a66esm212586055e9.0.2025.08.19.05.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 05:55:46 -0700 (PDT)
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
X-Inumbo-ID: d3476aec-7cfb-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755608147; x=1756212947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p3YnrdDLKzQmkon5V2tjhG7jvyQSjMz9p6OXXJvMf+0=;
        b=XQaW4QNRYgBLpZjiukkF7UM+knkAHtC7lYy2j5z5G20qprnna30V3L35ODMwKOBYHx
         /D/oeLfbGE5P3uXk9s0FHQeOkFHEpqHMIAn3WtDDwnYV4tEwzGlUra/Aol0VBzY5ZORb
         NXf6e9oaUbnMh0M4ZlOkP4hORfnmfsvxlVomg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608147; x=1756212947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3YnrdDLKzQmkon5V2tjhG7jvyQSjMz9p6OXXJvMf+0=;
        b=q8+iMOvOsLswdmL6BjCcJS22duA8pJIe22CZOxTJRgV+80bq6kcyaEBOVYLDA24hud
         WlddNz17ZNw+K3GIgtZXfH0vHj2SJlmn1le8DfAGdFX6HXn/W0OFTdUlMJUUG7DCwMbM
         cBanPwXtai+aIb2suS8Kx74zYgTD3Lbs3tD88jlLzBBP+00B+Xo1f+2rnRFaiG5sTPRs
         DPolYxvzj1CIbwLwx/WjNziR+npddmSC7bLamfo6pysS1tAalYvCagSLbZlqej3yZk4Y
         aNNYAgLS/gBVTyxcTY3UGOLoYXOfvkbxFgvIGblWbb+hHvhsQQiuBFBjbSwyYVGVr+iL
         tfUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkskrUShuVz4LmXtmU4lAq7aHo6XcLt9/ITPKkWyqLQbyFPOZLULzKxFtzWVoi4CWqJ+yjcQrv5K0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYAKGU+Af2VaauUenlWSv8h9gwt8Wrw7nY2NPEFz4X/ys6KxqW
	ZW+4naHR63CkjTu2RJv6is4HaPEkeiKbii1Y4HIjdJyNlUwNbROs4P7voT2a26uaHNs=
X-Gm-Gg: ASbGnctDpMgHs0oyFR2oAT1TtYu/dDnbTIhp2chprBLV2NCArwAuFchOhvxSG2+cvup
	NAzhWXFD/YjUGga4H40/ZX4WHuoEiGR5wtaY7j/TgHS2Fvb6d42eepiTst2TpzXFDLHsza/HJ0K
	a76qSRm2dA5ao7CLfKdU2FxvEUfU1gW/3byO8gxThK5YkZBvFkn8o6chNZ+HUeGr1LDE1C/9rx6
	K1RCO52ba0SKanY56gTiBiyG0IjYXb3GeXH/po/UxGFOV4c4IQphoNvi3rxhUYpLHOvNjawLouT
	ZGtn37NPu4YWtxet4kwArvR/mu+fc98YV/9LIt38vV73ilh96Z/rxLs3AWLp+51tY6JXO9YRjs7
	iqbRbSmDrjD/P2ULOO1yC0JzYc2lyylzva1XHVf7Mo9EuCSsaBMlvZPL6SiL8yr4L33Q+GBqvCT
	cbcqM=
X-Google-Smtp-Source: AGHT+IF5ThW04yVCKWz6ODcDk1skCmc9xjiyNRZReIg2pHnZi3uZblAC8zUwkUSf47vpNraOlPGaOQ==
X-Received: by 2002:a05:600c:3144:b0:453:8bc7:5cbb with SMTP id 5b1f17b1804b1-45b43e1210cmr19499955e9.25.1755608146682;
        Tue, 19 Aug 2025 05:55:46 -0700 (PDT)
Message-ID: <72256390-91ad-40c8-a273-a98e0bbefc77@citrix.com>
Date: Tue, 19 Aug 2025 13:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] x86: Clean up asm/msr.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-10-andrew.cooper3@citrix.com>
 <9c1808fa-1865-40b6-91c2-d6e2cabd8ddc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9c1808fa-1865-40b6-91c2-d6e2cabd8ddc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 11:42 am, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> Now that content has been split out, minimise the header files as msr.h is
>> included by many translation units.  A few more TUs were pulling dependencies
>> in transitively, so fix them up.
>>
>> Give asm/time.h an SPDX tag, and strip trailing whitespace.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I think though that ...
>
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -1,18 +1,13 @@
>> -#ifndef __ASM_MSR_H
>> -#define __ASM_MSR_H
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef X86_MSR_H
>> +#define X86_MSR_H
>>  
>> -#include "msr-index.h"
>> -
>> -#include <xen/types.h>
>>  #include <xen/percpu.h>
>>  #include <xen/errno.h>
>> -#include <xen/kernel.h>
>> -
>> -#include <xen/lib/x86/cpu-policy.h>
>>  
>> +#include <asm/alternative.h>
>>  #include <asm/asm_defns.h>
>> -#include <asm/cpufeature.h>
>> -#include <asm/processor.h>
>> +#include <asm/msr-index.h>
>>  
>>  #define rdmsr(msr,val1,val2) \
>>       __asm__ __volatile__("rdmsr" \
>> @@ -113,11 +108,6 @@ static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>>      return -EFAULT;
>>  }
>>  
>> -#define rdpmc(counter,low,high) \
>> -     __asm__ __volatile__("rdpmc" \
>> -			  : "=a" (low), "=d" (high) \
>> -			  : "c" (counter))
>> -
> ... this removal wants mentioning in the description. I'm actually surprised this
> is unused - how does vPMU get away?

Kernel software can't really use RDPMC.  Everything else about perf
counters needs model specific knowledge, and given that model specific
knowledge, transforming the indices into another address space is just a
waste.

~Andrew

