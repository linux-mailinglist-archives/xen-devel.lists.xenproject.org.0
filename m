Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C1597EB1C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801992.1212090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshdc-0002s1-Pb; Mon, 23 Sep 2024 11:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801992.1212090; Mon, 23 Sep 2024 11:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sshdc-0002pG-Mk; Mon, 23 Sep 2024 11:53:56 +0000
Received: by outflank-mailman (input) for mailman id 801992;
 Mon, 23 Sep 2024 11:53:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sshdb-0002pA-FF
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:53:55 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81653436-79a2-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:53:53 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a8a7cdfdd80so609995566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:53:53 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a28sm1207320766b.152.2024.09.23.04.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:53:52 -0700 (PDT)
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
X-Inumbo-ID: 81653436-79a2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727092433; x=1727697233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zpKSYEnzLe7XZHI13Bucs17ogGSkJmZ2U2LJFQV2lyQ=;
        b=qRGfG5HDOuZjA5OpMvqEwGRBNsmiZdMjDmWzS34ga3kfC+95xZ5q7US/h/Zwt3IaeH
         MYzDcAFhBHKcBkEuAHtu1J54JWdazCb5rYGcxo1rEllIq7G0DfO2rb+qw9wP+1HBTWqr
         5NYUeHSIbK/wM1AFCHEegCBoJjXLoarNL/0ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727092433; x=1727697233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpKSYEnzLe7XZHI13Bucs17ogGSkJmZ2U2LJFQV2lyQ=;
        b=xFKu+e6MGlfPUKICDlENerI9GaDSIXt+E3BU9D2gMYioeOL3fvUICRzQ0XHvVolD3i
         WkiuXRNoOd3w4G2h652s3Vuclw1QMmeOLJv1+D0id5i31ejEhpWfkcWrUL3hanj38y+J
         82fTBQ25SXne1VVte+oNxEvcnRACcgLlf+5mW8+o9EzI1q5g19ba1HHt0NkKGiJZ76d4
         PrcCpkVFei5rj3W9LBjDFokxOGMUYrxAYgEn5KcVYeMx2wV9nNXzg/R/p7y77R3T4Awz
         f/ChbKGMN9u6Yz68/kcNGD8lOyFjGe6oIdV7/iLmxWtiKY7LGaApaxsMahT+syc2KSmp
         /+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCX1z+P2y8DkmT6SdIhiADGPXxTTbikhWn89w+6A7jIWnZRR3qfkenjZ1ZMwY9ZE2wjDj91gZF+dDvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyqqoAqk9Cs2iXNtzGv/i7h95xHN+jw1s00c4uuiY+SyzECxZA
	xLSyyS42TJFunpjLIBjiaOitLdp4wWY1dlj4v7vMFJSPinOzgSbdP5rdSLeHoY8=
X-Google-Smtp-Source: AGHT+IHjdb+ZZtjOq/cHYXdThkqbELb91UpSu/04mEIWtVsJF6m50EIp+Za3BcM/1JBCJqOrNvcRyQ==
X-Received: by 2002:a17:907:e213:b0:a8d:6921:e17d with SMTP id a640c23a62f3a-a90d5034e98mr1125936466b.33.1727092433025;
        Mon, 23 Sep 2024 04:53:53 -0700 (PDT)
Message-ID: <55638099-629d-4ed6-b4ca-c1dd62c1e5dd@citrix.com>
Date: Mon, 23 Sep 2024 12:53:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen: introduce common macros for per-CPU sections
 defintion
To: oleksii.kurochko@gmail.com, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
 <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
 <a4e3de2c-2316-435e-b22f-e6efb3aa4216@suse.com>
 <3caf9e9f66a00b8c85b723a90ef830c3c0feca1f.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3caf9e9f66a00b8c85b723a90ef830c3c0feca1f.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/09/2024 12:48 pm, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-09-23 at 12:56 +0200, Jan Beulich wrote:
>> On 19.09.2024 17:59, Oleksii Kurochko wrote:
>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -321,14 +321,7 @@ SECTIONS
>>>    DECL_SECTION(.bss) {
>>>         __bss_start = .;
>>>         *(.bss.page_aligned*)
>>> -       . = ALIGN(PAGE_SIZE);
>>> -       __per_cpu_start = .;
>>> -       *(.bss.percpu.page_aligned)
>>> -       *(.bss.percpu)
>>> -       . = ALIGN(SMP_CACHE_BYTES);
>>> -       *(.bss.percpu.read_mostly)
>>> -       . = ALIGN(SMP_CACHE_BYTES);
>>> -       __per_cpu_data_end = .;
>>> +       PERCPU_SECTION
>>>         *(.bss .bss.*)
>>>         . = ALIGN(POINTER_ALIGN);
>>>         __bss_end = .;
>> Like the _SEC in the other patch I question _SECTION here, albeit for
>> a different
>> reason: This is no separate output section, and it's more than one
>> kind of input
>> ones. Perhaps PERCPU_DATA? With that
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Sure, I will drop _SECTION here too. Thanks.

Can we call it PERCPU_BSS?  Just to highlight the fact that it really is
BSS, and not initialised DATA.

~Andrew

