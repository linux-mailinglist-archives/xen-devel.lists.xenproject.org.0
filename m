Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AFAFC586
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 10:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036270.1408526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3en-0006nB-5S; Tue, 08 Jul 2025 08:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036270.1408526; Tue, 08 Jul 2025 08:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ3en-0006kV-1u; Tue, 08 Jul 2025 08:26:29 +0000
Received: by outflank-mailman (input) for mailman id 1036270;
 Tue, 08 Jul 2025 08:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ3el-0006kP-WE
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 08:26:28 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d38430a-5bd5-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 10:26:26 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so2195237f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 01:26:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce4180b6fsm11563840b3a.80.2025.07.08.01.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 01:26:24 -0700 (PDT)
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
X-Inumbo-ID: 3d38430a-5bd5-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751963186; x=1752567986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9sSTOaxx7fDq22eqn1MYr4yNu+PkpTvmK5nkFrDm55k=;
        b=BmEQ6D7w6rAa2YqthH9fhqz+FMu8dVY6qFaQ20QhhqLoSwTYRUtBjMIL+TQCrg6BgC
         h1tbg/8ROZ/xvHVRYdQBofeq+OMtzxVPGy8W3RJXHvfWbcTjoieZ/w0KXprLsLxlI6sw
         djcVwB/72IXLs7t64Y1o6MrUHts1TudsoE+9916I8kI+nOKA6dsW8crXlBM5TDUmHTfB
         4XN5CT49iBqelSYjgCpR99nTEWHcWpPGTtP7EDGDMCUzME0xh5sW14dRIgkGjQbRt2ER
         Yk+QhTL0fl/9lF42PpyWJmD80iRxLWe6i15fKR6mBgB+CAjcQgQySxW/ntQCsJKvA8c4
         3PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963186; x=1752567986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sSTOaxx7fDq22eqn1MYr4yNu+PkpTvmK5nkFrDm55k=;
        b=N+i51vTsdODDONKSR4nTdpuh2P8BccYi5yMqdsK5z9Z2hKBEqXtmkJEBnWv4lqdFNN
         pQ0LIqnqMV64FVWb2SbZCGRIdxChFwqLPDKEnu3ETTMX06dxtcUsNAwLsn7nM5h+YAwc
         5io+MNPrezrfezR9Gez+XFJkJa91Pa/+3OTywfAstnvrTHLe+XbEOKZ2idIPYaHha7tF
         sH6z43iOaidaM/wQILiaExtmI3OMwgCT0+J9zbhveY4++izkCokWY/R8AMDpJH65qQCE
         ZfmyhfEn+SHY/S958aFeJRCxUBg08V0L9Se1RnBG5flRROFyhGPAaYn56nfAcRkgNt1E
         gYLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNVqdxC5xJDTG9xWIO7lwM2MK6bCX6Iwy1o7W/hE6Q0YDmgCEVY3ughQd1Z3dbgkI7/nWl0V3Qvr0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHbzMU54O1xocJa2YsZYe30gtOYGfWGa6APVWp0b7mkK4Tmu6X
	ruBcbG+lP4Tyo9DSYjk+ephVs8XVX1kFfJFEbqeOuWYlMIifYBKLNvUJkT4+M5Igvw==
X-Gm-Gg: ASbGncvVGM8ZaOgjCDFxTaybEB4Qff+XqpVvsdHiQUC+mBT42t/qmDVuNfGsMfeXSES
	2tUXDaHRIGQ3jdv+NKHceiKW2Ds7FmTsl6WX0o0XvijtcjjgwQHxfkfcCaUp8qMIahl/0OLUWi4
	ZnaH7aG3//f956ElRNFyhIsHHXCNGNiWiasP3LPNumD6gD0Jf1XgjjjQM/lFUpnDqV4poVC38X4
	zYvOUTRaMRGNrhbdauQ5SggNZt2ouwW1qiCoQv9Yfx0BPZDFy+6UISjrVyjioyCS67GrcKujzvJ
	LLpOxbwaJtZ3x9agpwu7UxKgFd8OPF6DLOxekL0trUJYrkPiw36Nu5hMICL4+cdLOX84KwukjqF
	cU1oI3SUZGU7HzYiF18fBU4VkjIQ3WWoy0xGNTPU27iKryEY=
X-Google-Smtp-Source: AGHT+IGDMWX9au3UOZ6yJvubJ01LGtM9CfA++9KQ7uO7ty3DhrR8eyJNach7+gzdgEaavBPKDVfT0w==
X-Received: by 2002:a05:6000:2284:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3b5dde3f903mr1971789f8f.9.1751963185550;
        Tue, 08 Jul 2025 01:26:25 -0700 (PDT)
Message-ID: <f959300e-e625-4ad5-bc48-f33ae0cd31e1@suse.com>
Date: Tue, 8 Jul 2025 10:26:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Fix crash with initial empty EFI options
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20250707151122.292272-1-frediano.ziglio@cloud.com>
 <ab5d830a-8b59-46d6-9e97-12b351bcf221@suse.com>
 <CACHz=ZiiO4KwSPitaE261oBucAuZkHr3ugp+mCYhCnSbN8FyAw@mail.gmail.com>
 <c31947e7-f786-4213-9d91-28e1fa8908c1@suse.com>
 <CACHz=Zi9CAmdq6CmEF_CCEL9=w1ZLpCp7meA4rwhmQzYz_Et4Q@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <CACHz=Zi9CAmdq6CmEF_CCEL9=w1ZLpCp7meA4rwhmQzYz_Et4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2025 08:03, Frediano Ziglio wrote:
> On Mon, Jul 7, 2025 at 5:04 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 07.07.2025 17:51, Frediano Ziglio wrote:
>>> On Mon, Jul 7, 2025 at 4:42 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 07.07.2025 17:11, Frediano Ziglio wrote:
>>>>> EFI code path split options from EFI LoadOptions fields in 2
>>>>> pieces, first EFI options, second Xen options.
>>>>> "get_argv" function is called first to get the number of arguments
>>>>> in the LoadOptions, second, after allocating enough space, to
>>>>> fill some "argc"/"argv" variable. However the first parsing could
>>>>> be different from second as second is able to detect "--" argument
>>>>> separator. So it was possible that "argc" was bigger that the "argv"
>>>>> array leading to potential buffer overflows, in particular
>>>>> a string like "-- a b c" would lead to buffer overflow in "argv"
>>>>> resulting in crashes.
>>>>> Using EFI shell is possible to pass any kind of string in
>>>>> LoadOptions.
>>>>>
>>>>> Fixes: 201f261e859e ("EFI: move x86 boot/runtime code to common/efi")
>>>>
>>>> This only moves the function, but doesn't really introduce any issue afaics.
>>>>
>>>
>>> Okay, I'll follow the rename
>>>
>>>>> --- a/xen/common/efi/boot.c
>>>>> +++ b/xen/common/efi/boot.c
>>>>> @@ -345,6 +345,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>>>>>                                      VOID *data, UINTN size, UINTN *offset,
>>>>>                                      CHAR16 **options)
>>>>>  {
>>>>> +    CHAR16 **const orig_argv = argv;
>>>>>      CHAR16 *ptr = (CHAR16 *)(argv + argc + 1), *prev = NULL, *cmdline = NULL;
>>>>>      bool prev_sep = true;
>>>>>
>>>>> @@ -384,7 +385,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>>>>>                  {
>>>>>                      cmdline = data + *offset;
>>>>>                      /* Cater for the image name as first component. */
>>>>> -                    ++argc;
>>>>> +                    ++argv;
>>>>
>>>> We're on the argc == 0 and argv == NULL path here. Incrementing NULL is UB,
>>>> if I'm not mistaken.
>>>
>>> Not as far as I know. Why?
>>
>> Increment and decrement operators are like additions. For additions the standard
>> says: "For addition, either both operands shall have arithmetic type, or one
>> operand shall be a pointer to an object type and the other shall have integer
>> type." Neither of the alternatives is true for NULL.
>>
> 
> Yes and no. The expression here is not NULL + 1, but (CHAR16**)NULL +
> 1, hence the pointer has a type and so the expression is valid.
> 
>>> Some systems even can use NULL pointers as valid, like mmap.
>>
>> Right, but that doesn't make the use of NULL C-compliant.
>>
>>>>> @@ -402,7 +403,7 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>>>>>          {
>>>>>              if ( cur_sep )
>>>>>                  ++ptr;
>>>>> -            else if ( argv )
>>>>> +            else if ( orig_argv )
>>>>>              {
>>>>>                  *ptr = *cmdline;
>>>>>                  *++ptr = 0;
>>>>> @@ -410,8 +411,8 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>>>>>          }
>>>>>          else if ( !cur_sep )
>>>>>          {
>>>>> -            if ( !argv )
>>>>> -                ++argc;
>>>>> +            if ( !orig_argv )
>>>>> +                ++argv;
>>>>>              else if ( prev && wstrcmp(prev, L"--") == 0 )
>>>>>              {
>>>>>                  --argv;
>>>>
>>>> As per this, it looks like that on the 1st pass we may indeed overcount
>>>> arguments. But ...
>>>>
>>>
>>> I can use again argc if you prefer, not strong about it.
>>>
>>>>> @@ -428,9 +429,9 @@ static unsigned int __init get_argv(unsigned int argc, CHAR16 **argv,
>>>>>          }
>>>>>          prev_sep = cur_sep;
>>>>>      }
>>>>> -    if ( argv )
>>>>> +    if ( orig_argv )
>>>>>          *argv = NULL;
>>>>> -    return argc;
>>>>> +    return argv - orig_argv;
>>>>>  }
>>>>>
>>>>>  static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *loaded_image,
>>>>> @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>>>>>                                    (argc + 1) * sizeof(*argv) +
>>>>>                                        loaded_image->LoadOptionsSize,
>>>>>                                    (void **)&argv) == EFI_SUCCESS )
>>>>> -            get_argv(argc, argv, loaded_image->LoadOptions,
>>>>> -                     loaded_image->LoadOptionsSize, &offset, &options);
>>>>> +            argc = get_argv(argc, argv, loaded_image->LoadOptions,
>>>>> +                            loaded_image->LoadOptionsSize, &offset, &options);
>>>>
>>>> ... wouldn't this change alone cure that problem? And even that I don't
>>>> follow. Below here we have
>>>>
>>>>         for ( i = 1; i < argc; ++i )
>>>>         {
>>>>             CHAR16 *ptr = argv[i];
>>>>
>>>>             if ( !ptr )
>>>>                 break;
>>>>
>>>> and the 2nd pass of get_argv() properly terminates the (possibly too large)
>>>> array with a NULL sentinel. So I wonder what it is that I'm overlooking and
>>>> that is broken.
>>>
>>> I realized that because I got a crash, not just by looking at the code.
>>>
>>> The string was something like "-- a b c d":
>>
>> That's in the "plain command line" case or the LOAD_OPTIONS one? In the
>> former case the image name should come first, aiui. And in the latter case
>> the 2nd pass sets argv[0] to NULL very early, increments the pointer, and
>> hence at the bottom of the function argv[1] would also be set to NULL.
>> Aiui at least, i.e. ...
>>
>>> - the first get_argv call produces a 5 argc;
>>> - you allocate space for 6 pointers and length of the entire string to copy;
>>> - the parser writes a single pointer in argv and returns still 5 as argc;
>>> - returned argc is ignored;
>>> - code "for (i = 1; i < argc; ++i)" starts accessing argv[1] which is
>>> not initialized, in case of garbage you dereference garbage.
>>
>> ... I don't see how argv[1] can hold garbage.
> 
> As I said, this happened as a crash during testing, not looking at the
> code. It's a plain string in LoadOptions, *offset is set to 0 so
> there's no initial set of argv[0]. argv[0] is set with the beginning
> of "--" but then when "--" is detected" argv is moved back to initial
> value and the terminator is written still in argv[0], so argv[1] is
> never written.

On the 1st pass, which path does get_argv() take? The one commented "Plain
command line, as usually passed by the EFI shell", or the EFI_LOAD_OPTION
one? From your reply above I suspect the former, but then the image name
is missing from that line. Which would look like a firmware bug then, and
hence (if so) would also want describing as such (which in particular
would mean no Fixes: tag).

I'm routinely running xen.efi from the EFI shell on at least two systems,
and I have never had any trouble passing "--" as the first option. Which
I don't do all the time, but every now and then a need for doing so did
arise.

Jan

