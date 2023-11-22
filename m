Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1697F4C39
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638879.995814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pxn-0004VH-Fy; Wed, 22 Nov 2023 16:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638879.995814; Wed, 22 Nov 2023 16:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5pxn-0004SX-Cd; Wed, 22 Nov 2023 16:20:31 +0000
Received: by outflank-mailman (input) for mailman id 638879;
 Wed, 22 Nov 2023 16:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5pxl-0004SI-OT
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 16:20:29 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c319f9a-8953-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 17:20:27 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3316c6e299eso3321188f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 08:20:27 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d59ae000000b0032f7cc56509sm11894171wrr.98.2023.11.22.08.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 08:20:26 -0800 (PST)
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
X-Inumbo-ID: 0c319f9a-8953-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700670027; x=1701274827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fVNqdDo79oFbehNswTSM9zIKl9E9+nWQNS9DtE4S/eA=;
        b=UEY+4aoKMsB8CwmaylhkS2ka6YT1M6/LKBC/mQPXhZt5yoAIb4WGbWYST8Pxu5Bmei
         XTCaIsv8k4KZ8n1kTG7CI41NIh2CDaFwmsxjTzhZJ6vjYbYM6H2oB47aWlqAxJwNMbIo
         0uA1JCUNFrALDXDknmBuHFAGogPHPYUXqfYHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670027; x=1701274827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVNqdDo79oFbehNswTSM9zIKl9E9+nWQNS9DtE4S/eA=;
        b=MaGos99XpU/IciCTWtkKchL4ROweXKofWhErO9bPQ4bbNgqcW5J35mdl1cZ7AHJM3E
         v6kPQFV3B+xDHGcnbY268g62pvi1qHBf5HtwZSgBvZyFLGk0ieoML6A06Huf31bhxJ0E
         Ixs0Jh6b/jxjfZd4dHX+EWtNjm5xwNt9kwXQJ6CrcvSTFHGSZGZhcezNVqdV2pIhaeV2
         JX7fMjuHWmtAcwFv9xAC1wftdG/uKj9pAOXyvTMpTCqUm9nutf/wAoyDzzDEG+PH6nWs
         7DAA0+oCIwuTU+PdJBlwfmePjh3HO3vbXP8zRvIg/d/1ObVo+lBKEdM1G2auPY9fMv/q
         krHQ==
X-Gm-Message-State: AOJu0YyOtais1aoS06bFf2Ku72J4Bdv4I8KMluoXoslh9cwe2aTM1CFa
	g+hTptTefFYcgS3PDheqvAQ5mQ==
X-Google-Smtp-Source: AGHT+IGO6IlSsTIyt5Ibrh9vtrf4T+3p/5MFH9dacGT2Kk0pBSPw293CxdjaNhG12md+NXL2fd9Mkw==
X-Received: by 2002:a5d:457c:0:b0:32f:dcce:bf38 with SMTP id a28-20020a5d457c000000b0032fdccebf38mr1907491wrc.62.1700670027038;
        Wed, 22 Nov 2023 08:20:27 -0800 (PST)
Message-ID: <b190898e-2c10-49cd-9dc5-40ddd8c71c74@citrix.com>
Date: Wed, 22 Nov 2023 16:20:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/setup: Clean up cmdline handling in
 create_dom0()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-2-andrew.cooper3@citrix.com>
 <a6c8bac9-5bbd-44cc-b516-51a8a57d360f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a6c8bac9-5bbd-44cc-b516-51a8a57d360f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2023 9:02 am, Jan Beulich wrote:
> On 21.11.2023 21:15, Andrew Cooper wrote:
>> There's a confusing mix of variables; a static dom0_cmdline[], and a cmdline
>> pointer which points to image->string before being pointed at the static
>> buffer in order to be passed into construct_dom0().  cmdline being a mutable
>> pointer falls over -Wwrite-strings builds.
>>
>> Delete the cmdline pointer, and rename dom0_cmdline[] to cmdline extending it
>> to have full function scope.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with two remarks:
>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -873,6 +873,8 @@ static struct domain *__init create_dom0(const module_t *image,
>>                                           module_t *initrd, const char *kextra,
>>                                           const char *loader)
>>  {
>> +    static char __initdata cmdline[MAX_GUEST_CMDLINE];
>> +
>>      struct xen_domctl_createdomain dom0_cfg = {
> While I think I see why you're adding the blank line there, I'm not overly
> happy about you doing so: Our usual use of blank lines after declarations
> is to separate from statements, not from other (in this case non-static)
> declarations. (And really, just a remark, leaving it to you to keep as is
> or adjust.)

We have plenty of examples of this pattern in the codebase already.  Not
quite half of the cases with both static and local variable
declarations, but not far off either.

From a clarity point of view it is helpful to separate the stack locals
from the globals-with-local-scope.

>
>> @@ -913,33 +914,30 @@ static struct domain *__init create_dom0(const module_t *image,
>>          panic("Error creating d%uv0\n", domid);
>>  
>>      /* Grab the DOM0 command line. */
>> -    cmdline = image->string ? __va(image->string) : NULL;
>> -    if ( cmdline || kextra )
>> +    if ( image->string || kextra )
>>      {
>> -        static char __initdata dom0_cmdline[MAX_GUEST_CMDLINE];
>> -
>> -        cmdline = cmdline_cook(cmdline, loader);
>> -        safe_strcpy(dom0_cmdline, cmdline);
>> +        if ( image->string )
>> +            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
>>  
>>          if ( kextra )
>>              /* kextra always includes exactly one leading space. */
>> -            safe_strcat(dom0_cmdline, kextra);
>> +            safe_strcat(cmdline, kextra);
>>  
>>          /* Append any extra parameters. */
>> -        if ( skip_ioapic_setup && !strstr(dom0_cmdline, "noapic") )
>> -            safe_strcat(dom0_cmdline, " noapic");
>> +        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
>> +            safe_strcat(cmdline, " noapic");
>> +
>>          if ( (strlen(acpi_param) == 0) && acpi_disabled )
>>          {
>>              printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
>>              safe_strcpy(acpi_param, "off");
>>          }
>> -        if ( (strlen(acpi_param) != 0) && !strstr(dom0_cmdline, "acpi=") )
>> +
>> +        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
> As you're touching this anyway, how about replacing the strlen() by just
> *acpi_param? We don't really care exactly how long the string is. (As an
> aside, strstr() uses like the one here are of course also pretty fragile.
> But of course that's nothing to care about in this change.)

There's the same pattern just above it, not touched, and this patch is
already getting complicated.

I think there's other cleanup to do here, so I'll defer it to later.

~Andrew

