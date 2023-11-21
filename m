Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B177F34E2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:23:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638069.994354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UTE-0002q3-0B; Tue, 21 Nov 2023 17:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638069.994354; Tue, 21 Nov 2023 17:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UTD-0002nX-Sk; Tue, 21 Nov 2023 17:23:31 +0000
Received: by outflank-mailman (input) for mailman id 638069;
 Tue, 21 Nov 2023 17:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qy+O=HC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5UTC-0002n3-Is
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:23:30 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afda5fba-8892-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 18:23:29 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so18820495e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 09:23:29 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 fc16-20020a05600c525000b004054dcbf92asm17662853wmb.20.2023.11.21.09.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 09:23:28 -0800 (PST)
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
X-Inumbo-ID: afda5fba-8892-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700587409; x=1701192209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6MVjz21MkAYciOQfLcyNdlSyQV1QXuslEw7sigZlAk=;
        b=pNbNEzYZX1Q5dgX+5xOqjZGkKY05DU2+6Pk0Eo43P70cr/mRaEfgGFY8orc4sDTPAt
         DMU+T1QcIViJMi9GsfNlkcMm/58y2GyD/xPMT+7bRZo41yBFYwWL5AcwbrrZAdjXQ9L7
         4IlXrrn431SStMFsnpb5ol0PA5RsgYenVBHT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700587409; x=1701192209;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6MVjz21MkAYciOQfLcyNdlSyQV1QXuslEw7sigZlAk=;
        b=wJw1PTS6exc1Eb9dc+67uVWuhRAP8zigraC84h2Fcg4vL0Q9D4UIlDWCfcVcN0qtld
         NGn9OWm9OMaHn+/EuVMPFfFkre1Nz+zeDxnxtY2heVvKVyAV/pUgCPfzOYcqSluAWeKa
         59E0s7+SH+iVzhRy3xXnHx2eJAl2xX7DDYtWU2FMcsSqG/ddtDyZl2tK/1MuVTXBz+Qp
         U55GJI0xPXygBVdgeJ21F4X3TBfkj/tH7VVJZjC5IM9UJNLZATPInL3P9dVU82AAtufD
         dvHu2ubuQN3efj/xfSQ+AN+qBCaKRwNl+vPYpdhrgM2L1UMBtCMj3l1bQ992GYjZ/Uf5
         ystA==
X-Gm-Message-State: AOJu0Yz0k8SngG6YUtNcZDrQazwGhJQaNGJdtFjsxAx4/s14n26GddpT
	PluDe6B6Th21bnlJk7r5MnC59Q==
X-Google-Smtp-Source: AGHT+IFWzbK479gtl9NlYu85YvAa8SjAUmYAaXa0S4OU13snzpPrwL1Q5W8MVuRUQ/SljWeJOqiKZQ==
X-Received: by 2002:a05:600c:3b8d:b0:408:411c:4f6d with SMTP id n13-20020a05600c3b8d00b00408411c4f6dmr2803254wms.14.1700587408700;
        Tue, 21 Nov 2023 09:23:28 -0800 (PST)
Message-ID: <e613b1f0-c79e-446d-a93c-827c098b43ec@citrix.com>
Date: Tue, 21 Nov 2023 17:23:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] x86/setup: Rework cmdline_cook() to be compatible
 with -Wwrite-strings
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
 <20231120224912.1421916-3-andrew.cooper3@citrix.com>
 <7c954d5a-b2dd-4a8a-8b3f-2ec398bf5a25@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7c954d5a-b2dd-4a8a-8b3f-2ec398bf5a25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 8:21 am, Jan Beulich wrote:
> On 20.11.2023 23:49, Andrew Cooper wrote:
>> Constify both cmdline variables in create_dom0() and __start_xen().
>> Initialise Xen's variable to the empty string to simplify the parsing logic.
>>
>> Update cmdline_cook() to take and return const pointers, changing it to have
>> an early exit for a NULL input (which can happen if the mbi-> pointers happen
>> to be 0).
>>
>> Note this only compiles because strstr() launders the const off the pointer
>> when assigning to the mutable kextra, but that logic only mutates the
>> mbi->cmdline buffer.
> And a good static analyzer would spot this. At the very least I think this
> warrants a comment next to that code. But really I'm inclined to re-write
> this to eliminate the issue altogether; I'll try to remember to do so once
> your change has gone in.

This string handling leaves a lot to be desired.

>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -837,9 +837,10 @@ static bool __init loader_is_grub2(const char *loader_name)
>>      return (p != NULL) && (p[5] != '0');
>>  }
>>  
>> -static char * __init cmdline_cook(char *p, const char *loader_name)
>> +static const char *__init cmdline_cook(const char *p, const char *loader_name)
>>  {
>> -    p = p ? : "";
>> +    if ( !p )
>> +        return "";
> This change is now needed only for create_dom0(), whereas the call site
> change to __start_xen() is redundant with the change here. Did you
> consider doing a similar transformation in create_dom0(), thus
> eliminating the need for this check altogether? Alternatively I'd like
> to ask that ...

It occurs to me that __va(0) != 0, so this path isn't actually taken,
even when there is a bad mbi-> pointer.

But the mbi information is already processed by us earlier on boot so we
have reasonable expectation that the pointer is good if MBI_CMDLINE is set.

>
>> @@ -885,7 +886,7 @@ static struct domain *__init create_dom0(const module_t *image,
>>          },
>>      };
>>      struct domain *d;
>> -    char *cmdline;
>> +    const char *cmdline;
>>      domid_t domid;
>>  
>>      if ( opt_dom0_pvh )
>> @@ -971,8 +972,8 @@ static struct domain *__init create_dom0(const module_t *image,
>>  /* SAF-1-safe */
>>  void __init noreturn __start_xen(unsigned long mbi_p)
>>  {
>> -    const char *memmap_type = NULL, *loader;
>> -    char *cmdline, *kextra;
>> +    const char *memmap_type = NULL, *loader, *cmdline = "";
>> +    char *kextra;
>>      void *bsp_stack;
>>      struct cpu_info *info = get_cpu_info(), *bsp_info;
>>      unsigned int initrdidx, num_parked = 0;
>> @@ -1027,9 +1028,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>                                             : "unknown";
>>  
>>      /* Parse the command-line options. */
>> -    cmdline = cmdline_cook((mbi->flags & MBI_CMDLINE) ?
>> -                           __va(mbi->cmdline) : NULL,
>> -                           loader);
>> +    if ( mbi->flags & MBI_CMDLINE )
>> +        cmdline = cmdline_cook(__va(mbi->cmdline), loader);
>> +
>>      if ( (kextra = strstr(cmdline, " -- ")) != NULL )
>>      {
>>          /*
> ... this last hunk be dropped, along with cmdline's initializer. No need
> for extra code churn when not gaining us anything. (Also but not only
> because the reformatting here is actually beneficial from a readability
> pov imo, the variant with applying the same transformation to create_dom0()
> would seem preferable to me.)

I'll see what I can do.  I definitely do prefer this form, from a
clarity point of view.

~Andrew

