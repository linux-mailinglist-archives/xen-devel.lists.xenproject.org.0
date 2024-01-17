Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D118303CD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 11:44:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668377.1040537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3PW-000705-6x; Wed, 17 Jan 2024 10:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668377.1040537; Wed, 17 Jan 2024 10:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3PW-0006yT-3N; Wed, 17 Jan 2024 10:44:42 +0000
Received: by outflank-mailman (input) for mailman id 668377;
 Wed, 17 Jan 2024 10:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3JKZ=I3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rQ3PU-0006yN-SR
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 10:44:40 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a6d6fe6-b525-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 11:44:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e8cc3b738so1620535e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 02:44:39 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0040d53588d94sm26032550wmq.46.2024.01.17.02.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 02:44:39 -0800 (PST)
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
X-Inumbo-ID: 6a6d6fe6-b525-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705488279; x=1706093079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4861IsudPfMIVVV7aTNU17RkB4FwrCCK619tCXmEcUY=;
        b=f9KzKUKWzKXjqJhL88U3WJ2nVSBS5qRhh5Lf0/MQvg+/BYKjLPqTISA2637YA7iLO8
         ADVtAt1xwPMPCVhm3LbkGqd2KOvBoxCfpOQLa52row1+ceVL8xrGnIBJseJMQuf6tT0Q
         cuLoh4iMWd9OS6uotGEcgamb6BFAjLPKblMUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705488279; x=1706093079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4861IsudPfMIVVV7aTNU17RkB4FwrCCK619tCXmEcUY=;
        b=UZFKo9d6Hd1hGTuXg/PoRq4Eco9qlBDC5e9pHiEl05Tf8KAdgKu2W03/ILSwQOyoSx
         M2a/kyPvxO+CbOQS85PO0AckP4pmxMU3Uw2Gset2289lCCQArDCirdcMDWqNu+0J+6P6
         grgtANNwGZbiFDa/XqF/F07XyjH1Ls49CnRn2O6ZGxv4w6fZ9/mpxm0o0MeAVOQiqgeQ
         Ee1ia8o+Qohyrsqg4qProjSsEoz6+HTvWN25XLLx7S+xBe9m0vMTDAD3+ACm7V/EuSYR
         T/gEyLS0mABEnkOEJFJX+BERBIc4MzcH8J+p6FKYfzguiN14enXDUu2H/KOvTsYLOhad
         TwnQ==
X-Gm-Message-State: AOJu0Yzq+KUIjBMXimZl0e+Gh8+GxrZsRq1A/boDtuBZkH9laXvxRjwI
	f34pMhuwWbTbqmxdPqJJZ0aeISHgzkS4Xw==
X-Google-Smtp-Source: AGHT+IE2AEXg6gx5jTteMtMtHuG0lZ7XdLmM+RMBnLhcF8wvJkDadWUelT0kcqw8YlCY3SMkJLxGIA==
X-Received: by 2002:a05:600c:22cf:b0:40e:3a68:ac9b with SMTP id 15-20020a05600c22cf00b0040e3a68ac9bmr5014206wmg.186.1705488279309;
        Wed, 17 Jan 2024 02:44:39 -0800 (PST)
Message-ID: <7a6d5eab-dd30-44c5-a5b2-6fb34a01b746@citrix.com>
Date: Wed, 17 Jan 2024 10:44:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: Dom0 "broken ELF" reporting adjustments
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
References: <fda7586f-a1d1-4500-a6c4-d0e010223ee2@suse.com>
 <ZaerAAt1EnFAZpo3@macbook> <de31c22f-6cb8-40dd-bb00-1e523fc3e9be@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <de31c22f-6cb8-40dd-bb00-1e523fc3e9be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/01/2024 10:42 am, Jan Beulich wrote:
> On 17.01.2024 11:25, Roger Pau Monné wrote:
>> On Wed, Jan 17, 2024 at 09:53:26AM +0100, Jan Beulich wrote:
>>> elf_load_binary() isn't the primary source of brokenness being
>>> indicated. Therefore make the respective log message there conditional
>>> (much like PV has it), and add another instance when elf_xen_parse()
>>> failed (again matching behavior in the PV case).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>> @@ -570,6 +570,8 @@ static int __init pvh_load_kernel(struct
>>>      if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
>>>      {
>>>          printk("Unable to parse kernel for ELFNOTES\n");
>>> +        if ( elf_check_broken(&elf) )
>>> +            printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));
>> I would rather use "%pd: kernel broken ELF: %s\n", in case this gets
>> used for loading more than dom0 in the dom0less case.  The 'Xen'
>> prefix is IMO useless here (I know it was here before).
> Can do. But if I do, I'd like to bring PV in sync with this as well,
> right in the same patch. I hope you don't mind that.

Sounds good to me.

~Andrew

