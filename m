Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F4A39BC7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 13:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891386.1300431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkMRG-0005mN-N6; Tue, 18 Feb 2025 12:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891386.1300431; Tue, 18 Feb 2025 12:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkMRG-0005kv-KO; Tue, 18 Feb 2025 12:10:58 +0000
Received: by outflank-mailman (input) for mailman id 891386;
 Tue, 18 Feb 2025 12:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J6eQ=VJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tkMRF-0005kp-98
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 12:10:57 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67ec9935-edf1-11ef-9aa7-95dc52dad729;
 Tue, 18 Feb 2025 13:10:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4396424d173so53852375e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 04:10:55 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43987396d3dsm48004915e9.36.2025.02.18.04.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 04:10:54 -0800 (PST)
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
X-Inumbo-ID: 67ec9935-edf1-11ef-9aa7-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739880655; x=1740485455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YI7cqddcIlqZemHfg2BZ5dh7PH2OSCWw9jxYU6hvAno=;
        b=B0FzOQEUWE91FvNp8nRa2agWyvu3wu3ZHa2rll9kUq+Pd3TNF8EqCqP/j1fAKq3Ot4
         thhS8lcA9j4QhDJhFiUXtKDllH/QIUtk8Nw5BZIuk+Sv0D335krm0zwWQwqTI5/bWHdC
         4h/yd3+RPoz0O0Gsq+20wUmJk9VAreuGvcVtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739880655; x=1740485455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI7cqddcIlqZemHfg2BZ5dh7PH2OSCWw9jxYU6hvAno=;
        b=PXpOEVFkO1fGNMI62MDprWW+Tbcon+ACok0Wpf/saeaVdxwlaUhoLfTUuOK3CxE6Te
         F4AFNiyRr1jBoAPJQ4pipWT945G0Q9SctyIyW5M90gx0hyRHP1wldx1bwStz06W5OOaZ
         NcorCCRq14QF1tQt+TfRB4nwzt1tVsNjtQPnMQm6KfDmBYRip1zGcZ4sIoO72apAjAf/
         +iyUSIrGvVD2wcvHk8Lrv1VujuID8Rot2GbBpDz2vM5I8m7aduDsJYKKJbMtL4/KOdwV
         EqnY+Qc31MQg3V2yXWNBhwf8xVyKZpnfK765m3FYUhHt7sT/Wa7DxDR+VU4vSfi+HB/4
         FIgg==
X-Forwarded-Encrypted: i=1; AJvYcCWey07FpHoNa6yU1bghexoNH5AnAlD+xIrb+eA1cZbPYPPEVeQCWUul9hEWrDSX5+TzfA8ARnkh4tQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yymd+V/RnOUFQCGeDn79mpr+KvjG7Z/fafjW1OSW4vCAwuoefQ0
	uuILfnLIPZwncf+BzVZXZ+TPhKaIO66WQm0+DzWPaHjD/Y99I2YIx8AcyPynLyQ=
X-Gm-Gg: ASbGnct1Pu7GhOOqh8UABZypicMmcbm4skb7mtl4EBWHijU2oediQ4ZzIOcm/GZ8TZ5
	p2Nt67MGoEhcWzmRavzlu5xkkT3xXCuIs+E4xWBH1EdUVtVH0NcMNqRZrPlZL2HcDWUHapd5YnJ
	FpMN19BSsRwOuNhaEPF1y8ThRDOg1BROy4qn+hcXuMUzUpSH9rM8yNm9v5YAdR/uGg0Glyd546k
	M5uBgRo5OpuyuV8iRbrqI1Sgabkg7fksr2d9tsmidALu8UPqZfeNzuAEXw/hsYdFtX7T3Fp0eBw
	qAVJaZLd4QdU09NksQpB0LpKsiG/1w6Y20iNq4Rkw6NAzcLwPESVL4k=
X-Google-Smtp-Source: AGHT+IEKd7BP53nECQJCIjT/mjsXuXIM1fMOADLVTtdLPFNLwzpwwdA5vJINo4eW/TOBJhXt2oWMTQ==
X-Received: by 2002:a05:600c:511f:b0:439:43b1:e60 with SMTP id 5b1f17b1804b1-4396e6df40amr131602115e9.17.1739880655259;
        Tue, 18 Feb 2025 04:10:55 -0800 (PST)
Message-ID: <ce5029f1-7c58-4c8e-99b9-aec5221954f1@citrix.com>
Date: Tue, 18 Feb 2025 12:10:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com>
 <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
 <CACHz=ZhuOL3Le=+y0zFRaWBDEdLO_faLKZ83072Z0e88wZMpPw@mail.gmail.com>
 <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com>
 <CACHz=ZijmMPntXjA-Zu3VTnWqH-1fR8SVRVB4d4Cqyg0f1Ce5w@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=ZijmMPntXjA-Zu3VTnWqH-1fR8SVRVB4d4Cqyg0f1Ce5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/02/2025 12:05 pm, Frediano Ziglio wrote:
> On Mon, Feb 17, 2025 at 4:56 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 17.02.2025 17:52, Frediano Ziglio wrote:
>>> On Mon, Feb 17, 2025 at 4:41 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>> On 17/02/2025 4:31 pm, Jan Beulich wrote:
>>>>> On 17.02.2025 17:26, Frediano Ziglio wrote:
>>>>>> --- a/xen/common/efi/efi-common.mk
>>>>>> +++ b/xen/common/efi/efi-common.mk
>>>>>> @@ -2,6 +2,7 @@ EFIOBJ-y := boot.init.o pe.init.o ebmalloc.o runtime.o
>>>>>>  EFIOBJ-$(CONFIG_COMPAT) += compat.o
>>>>>>
>>>>>>  CFLAGS-y += -fshort-wchar
>>>>>> +CFLAGS-y += -fno-jump-tables
>>>>>>  CFLAGS-y += -iquote $(srctree)/common/efi
>>>>>>  CFLAGS-y += -iquote $(srcdir)
>>>>> Do source files other than boot.c really need this? Do any other files outside
>>>>> of efi/ maybe also need this (iirc this point was made along with the v5 comment
>>>>> you got)?
>>>> Every TU reachable from efi_multiboot2() needs this, because all of
>>>> those have logic executed at an incorrect virtual address.
>>>>
>>>> ~Andrew
>>> I assume all the files in efi directory will deal with EFI boot so
>>> it's good to have the option enabled for the files inside the
>>> directory. The only exception seems runtime.c file.
>> And compat.c, being a wrapper around runtime.c.
>>
>>> About external dependencies not sure how to detect them (beside
>>> looking at all symbols).
>> Which raises the question whether we don't need to turn on that option
>> globally, without (as we have it now) any condition.
>>
>> Jan
> Are you saying enabling that option for all Xen? That potentially
> would decrease performances, we have a lot of switches in the code.

-fno-switch-tables is active by default whenever INDIRECT_THUNK is
enabled, and when CET-IBT is enabled to work around a GCC bug/misfeature.

With speculation protections active, indirect branches are *far* slower
than alternative ways of expressing a switch statement.

~Andrew

