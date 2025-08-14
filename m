Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9480B26FAA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 21:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082424.1442274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdXN-0004ov-0G; Thu, 14 Aug 2025 19:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082424.1442274; Thu, 14 Aug 2025 19:22:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umdXM-0004mm-TJ; Thu, 14 Aug 2025 19:22:56 +0000
Received: by outflank-mailman (input) for mailman id 1082424;
 Thu, 14 Aug 2025 19:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umdXL-0004k2-1J
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 19:22:55 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12d3f335-7944-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 21:22:53 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9d41baedeso743505f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 12:22:53 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c70cb83sm31261025e9.27.2025.08.14.12.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 12:22:52 -0700 (PDT)
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
X-Inumbo-ID: 12d3f335-7944-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755199372; x=1755804172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X8psSapV7C1ENqgkkCPKgquvOZX0QY9OZ5KZkH3TqcU=;
        b=t2H1tJFHicbkAXruqWu4SIthsYrryTvt2px0qnPIL39G2ZRfpu6P1BTLOacPLG3UWM
         7mYcvwZVHv2d2CmngZGKCxhtQxUoYi0RGQEpZypBVl8g3IArqR81lH4W+zTh6WWyPHKG
         VcTgUBdgndYJeFzUrm25BiXxiA4mU1GJeAciE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755199372; x=1755804172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8psSapV7C1ENqgkkCPKgquvOZX0QY9OZ5KZkH3TqcU=;
        b=PMIjm8AIonBfexxAQpGFnhTUrxJld/NsuXxeIl75FZO7k9ZDGl5poZXWycznLVTNJ/
         uigg6AWyDlY8DzE2rPhxOB0JSooCvNUrZMi7ucua41M7Bn9bdF3ov5T/+bG27VEmVjXy
         aAgOSuSOyjPsL2AUpaMn+h6NqvbfAb4S4B1DDtytpm6jzfApgyy+o/uqi0p2PjIeGrxD
         DjLIOVsFPa2b/w9r+BdNc1qRjVTd817joQ3zinTjkldK05jGrocERP3qo33jPV8SnvLt
         aKUkRrCFfI1CKKaPSyf0EHfwqM9cxpNDXqIDCzg1+ozvU3BbIAalrD1UIjIIc6X3hIfx
         JFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqRBXEOgKS2ed20lLK96GmKZcCtreoe8j85x+sD6NYV67gFCgUUbNO3+0gekfjj58tnQMZaV6gjjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgIKzHjXOfvAQLVJZ6y2b/Jg5RG/8wYbDfJtP+NshWHr+drX36
	P2tC0ewZz8GaHGtCxfEcXSHedx0eR4Fxc9B3TXnKFi2mNKRwDznQn9PDvU1DltGY1q4=
X-Gm-Gg: ASbGnctNwGz1djPw6q5wiH++fHHhxSnuEFIqqnjBYX3n0cnHkuahnA6BNt+o/1lBXPP
	rWv+Mt+uD6pbMtrtz+W73RrOoUUO71aQxgOC6xlOfNyqeVLF5Ydp3L2NhBBRFyifovdWeRaGFZX
	q7xm9JIwo6CxDOKN/i19JlSW05kB/SbC58+7FwHL2kP/AwoP12AygKDVmHshnNI0jo/DAL5rDYs
	0qUSdUyHFjOY3XcW6yRGY3NE/hPDD5XUidKPIbc7Ulzfwgtf7AN/HlR4yScbRdFylBJ3M74jiKI
	CLzCXzbXPkFDl30xRX+nmVgJlMd4TJFps+ABj/gc41uN8Z19Q5jNfKSY9ES2HcgZ3UryXPs/GUh
	to1SfGEkPr1fOG5AK62jPuGZhFtU5NJOwzeRtmUCtBW4sss1okHp9NAeXFEqO3sPx4RPQ
X-Google-Smtp-Source: AGHT+IEX8JhrveqNbHIrD32CDXIweyb9ZuOkJGOwK234Jr8q/qkavNlEJWO3T7WR+VXeT5aN31fDpw==
X-Received: by 2002:a05:6000:401f:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3b9edf903e9mr4028619f8f.8.1755199372429;
        Thu, 14 Aug 2025 12:22:52 -0700 (PDT)
Message-ID: <17e90568-36f0-439a-aa8e-00779d07de49@citrix.com>
Date: Thu, 14 Aug 2025 20:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] x86/boot: Adjust CR4 handling around
 ap_early_traps_init()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-17-andrew.cooper3@citrix.com>
 <270b2ad1-fb8a-4a0a-8733-a8f3f8f25a94@suse.com>
 <64dc9f62-b48e-400b-8840-feff2f688913@citrix.com>
 <b4315516-289f-4495-a0c7-f504f92ec5cd@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b4315516-289f-4495-a0c7-f504f92ec5cd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 3:56 pm, Jan Beulich wrote:
> On 14.08.2025 16:54, Andrew Cooper wrote:
>> On 14/08/2025 3:47 pm, Jan Beulich wrote:
>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>> --- a/xen/arch/x86/boot/x86_64.S
>>>> +++ b/xen/arch/x86/boot/x86_64.S
>>>> @@ -11,16 +11,19 @@ ENTRY(__high_start)
>>>>          mov     %ecx,%gs
>>>>          mov     %ecx,%ss
>>>>  
>>>> -        /* Enable minimal CR4 features. */
>>>> -        mov     $XEN_MINIMAL_CR4,%rcx
>>>> -        mov     %rcx,%cr4
>>>> -
>>>>          mov     stack_start(%rip),%rsp
>>>>  
>>>>          /* Reset EFLAGS (subsumes CLI and CLD). */
>>>>          pushq   $0
>>>>          popf
>>>>  
>>>> +        GET_STACK_END(15)
>>>> +
>>>> +        /* Enable minimal CR4 features. */
>>>> +        mov     $XEN_MINIMAL_CR4, %eax
>>>> +        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)
>>> ... this could be 32-bit stores, even in the longer run.
>> ... no, they can't.
>>
>> The store also serves to clear out stale X86_CR4_FRED, prior to FRED
>> getting reconfigured again.
>>
>> fatal_trap() uses info->cr4 to decide whether it's safe to look at the
>> extended FRED metadata.  Strictly speaking I probably ought to read the
>> real CR4 (in read_registers too), but using a 32bit store here would
>> extend a 1-instruction window into quite a larger window where exception
>> handling would not work quite right.
> Oh, I see. Mind me asking to add brief comments there to this effect?

I've changed it to:

/* Enable minimal CR4 features, sync cached state. */

~Andrew

