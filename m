Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D98C57E8
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721572.1125084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6t9F-0001p8-PN; Tue, 14 May 2024 14:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721572.1125084; Tue, 14 May 2024 14:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6t9F-0001me-Ml; Tue, 14 May 2024 14:28:57 +0000
Received: by outflank-mailman (input) for mailman id 721572;
 Tue, 14 May 2024 14:28:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0FJY=MR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6t9E-0001mY-BI
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:28:56 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a5259fb-11fe-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 16:28:54 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-69b782287f9so22399266d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:28:54 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1cd250sm54259666d6.98.2024.05.14.07.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:28:52 -0700 (PDT)
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
X-Inumbo-ID: 4a5259fb-11fe-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715696933; x=1716301733; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+0vaDs9ONyd+jd6O8LXAoP+3ueJtHfSC/x11kcgHlJM=;
        b=WJfE+uY/swiJiIPNARYI5qaRXzHZv6Kh6dPblD2Jk1lNPaq0AgjIGZ/+KGs7gGtVfC
         eRWZloe2ZXKZ73drxSNBUQ3wV/SWcM3xOnGN0ndB9VmTKJvwug63lb5MEkC2Emd/YxjM
         2QfR0sfhwebG/oYkApo91e9bKDdMxNBTr0zY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715696933; x=1716301733;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0vaDs9ONyd+jd6O8LXAoP+3ueJtHfSC/x11kcgHlJM=;
        b=nTS7zAMx79JMcGMhWiOsjAcOowW2HHgJEe6Qp/3F1YIFGmb8qe9NS0TVDP5e3ZS2Ui
         fpwWqja5LTTtxOZ2f0c+Xf9rrk2uXoR/et3vsapRH9x7tuVq9+qDWNph6zvBXbKzuUeh
         lfxoQpVORqwReqwjkNgaKl1DfCxrcom9qZkrXyNrVy/9+QOwOqNw++T2Dmw+X2rtfjXs
         8T+Zxu8onTjKcw4e1GqfFviRBwe5YrVdcBQLI5c4uyoPncLfeo9IRbfB/yRzul9kR7iw
         zwm9A6/5+HvVfi0jXFtX7h1aixDa9ObI23owCX1sc3gTJu0nWmjQgSXl/W9JUJNsYXy2
         4DOQ==
X-Gm-Message-State: AOJu0YzEM83llP9qAQOd/xjgkJ7sw/KWDuVeA32SLDIlSSCPCCwmJGT7
	vhnSfPO5PREKHGrrdCbbaDR6oTOjZMOUZxNEKVXFe2eSFHfmOm9xDi+bf04CkII=
X-Google-Smtp-Source: AGHT+IHBQXOjytTn8+ExGS0hsGaPG4cHfG6LqY0nogLjLm4G/jAYlsVwQr8UbLH2mh+BxIsUIcftvQ==
X-Received: by 2002:a05:6214:3c9f:b0:6a0:b19d:e0a3 with SMTP id 6a1803df08f44-6a1682406dbmr161962156d6.55.1715696933257;
        Tue, 14 May 2024 07:28:53 -0700 (PDT)
Message-ID: <3ce16a4d-bff1-4a6a-8f66-62b49191fe41@citrix.com>
Date: Tue, 14 May 2024 15:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufreq: Rename cpuid variable/parameters to cpu
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240511194237.2596271-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2405131723240.2544314@ubuntu-linux-20-04-desktop>
 <36b89590-9bd9-4a64-9150-f2819bcd4a0e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <36b89590-9bd9-4a64-9150-f2819bcd4a0e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 9:52 am, Jan Beulich wrote:
> On 14.05.2024 02:24, Stefano Stabellini wrote:
>> On Sat, 11 May 2024, Andrew Cooper wrote:
>>> --- a/xen/drivers/cpufreq/cpufreq.c
>>> +++ b/xen/drivers/cpufreq/cpufreq.c
>>> @@ -459,21 +459,21 @@ static void print_PPC(unsigned int platform_limit)
>>>  
>>>  int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
>>>  {
>>> -    int ret=0, cpuid;
>>> +    int ret=0, cpu;
> Would be nice if the missing blanks were added here as well, while touching
> the line.

Will adjust.

>
>>>      struct processor_pminfo *pmpt;
>>>      struct processor_performance *pxpt;
>>>  
>>> -    cpuid = get_cpu_id(acpi_id);
>>> -    if ( cpuid < 0 || !perf )
>>> +    cpu = get_cpu_id(acpi_id);
>>> +    if ( cpu < 0 || !perf )
>>>      {
>>>          ret = -EINVAL;
>>>          goto out;
>>>      }
>>>      if ( cpufreq_verbose )
>>> -        printk("Set CPU acpi_id(%d) cpuid(%d) Px State info:\n",
>>> +        printk("Set CPU acpi_id(%d) cpu(%d) Px State info:\n",
>>>                 acpi_id, cpuid);
>> This cpuid should be changed as well?
> And with that adjustment

Yes - this was a victim of a "trivial" post-test fix.  I fixed it just
after sending out the email.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

