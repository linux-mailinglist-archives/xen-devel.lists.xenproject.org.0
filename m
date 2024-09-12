Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F1F9768FD
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797405.1207354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soinQ-0004Sd-Jr; Thu, 12 Sep 2024 12:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797405.1207354; Thu, 12 Sep 2024 12:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soinQ-0004Q9-GQ; Thu, 12 Sep 2024 12:19:36 +0000
Received: by outflank-mailman (input) for mailman id 797405;
 Thu, 12 Sep 2024 12:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDyH=QK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1soinP-0004Pq-2V
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:19:35 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 451b1f34-7101-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 14:19:34 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so111278766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:19:34 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835adfsm737494866b.44.2024.09.12.05.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 05:19:32 -0700 (PDT)
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
X-Inumbo-ID: 451b1f34-7101-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726143573; x=1726748373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SecHCAtrUgeT30CsVRRASDBR/1XJMNDGsB2Wa8ET/NI=;
        b=r8U1GeX+cOxWz0VfbuAXOy8OuMEFNfdl3FvvO/jKMZo2cQMI+GCyhuvPxuLwQ6VXoY
         xsp4jcIbOi6O0JWhIQ875p4BHYCaXvz+mi7Yk3VcGjqkazHqUCJCTPrDsnyVXW7HmN2U
         xLOdfIsGjo0SBh9CX4nQsuuqlhGiQ/issfYh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726143573; x=1726748373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SecHCAtrUgeT30CsVRRASDBR/1XJMNDGsB2Wa8ET/NI=;
        b=RtG5IE7XpPhJugO4ttkpycvyCct8QaKNf2SiMI/zndxQhSNqLFV+9YjdugmPkRw3m7
         Kr4PBId+YFQDEuERizZ7gsmSAnKwtCRyEy9miVISsIB/ptWruA6XhUQnwIEELA7Ejy3e
         zBEf1hiQo62By0RcjvvMJqQM+Xx8dZFoXIBB0jyRj8WFbs5mzBb4fJlCQ+6GbHMpP8SU
         7dzV748o0Ym1PuIBQr1Wbsx135eoxHnD+IcJhnjP5iiJrkzqkHBOLMZu2rvCxCmv62o9
         ZDHKlpr5IGlAOmdX+wwM3UZawRWNIksNGnUeOnYT0cQpOsCJy6VcLow8U6QMLq9UJG6J
         elQA==
X-Forwarded-Encrypted: i=1; AJvYcCVCy+dE/UH9Pl/5v3oBhOg2AHwV45KFHPszj2yfUzigz+FE8DJnQ0paCdgsl4dlTPCgcRiOfrVknY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwahOjDzAhhAcIrhnIeAua/EF0w8QJ+YI6YvJVH+NhtFxhqxGot
	Rhhkw35KT816anbOAeZi8L9WcH/5kK2LKY2NTmb/Q4ND33mpkpmtnxAC0ghrZv8=
X-Google-Smtp-Source: AGHT+IERVJWlPg6d03eda0CuqmYND4TS3YxvnZ8FBDITIkFRPe5ENlxMTrymxs2nQ7i+JkA6JyG0xg==
X-Received: by 2002:a17:906:bc10:b0:a8f:f799:e7d4 with SMTP id a640c23a62f3a-a9029635dcamr252021666b.59.1726143572546;
        Thu, 12 Sep 2024 05:19:32 -0700 (PDT)
Message-ID: <fda030c0-7c7e-4573-b29b-93cd8706a912@citrix.com>
Date: Thu, 12 Sep 2024 13:19:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Simplify stdvga_mem_accept() further
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240912120602.1677194-1-andrew.cooper3@citrix.com>
 <7e7f879c-55df-404f-b35f-edddbadc0962@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7e7f879c-55df-404f-b35f-edddbadc0962@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2024 1:10 pm, Jan Beulich wrote:
> On 12.09.2024 14:06, Andrew Cooper wrote:
>> stdvga_mem_accept() is called on almost all IO emulations, and the
>> overwhelming likely answer is to reject the ioreq.  Simply rearranging the
>> expression yields an improvement:
>>
>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-57 (-57)
>>   Function                                     old     new   delta
>>   stdvga_mem_accept                            109      52     -57
>>
>> which is best explained looking at the disassembly:
>>
>>   Before:                                                    After:
>>   f3 0f 1e fa           endbr64                              f3 0f 1e fa           endbr64
>>   0f b6 4e 1e           movzbl 0x1e(%rsi),%ecx            |  0f b6 46 1e           movzbl 0x1e(%rsi),%eax
>>   48 8b 16              mov    (%rsi),%rdx                |  31 d2                 xor    %edx,%edx
>>   f6 c1 40              test   $0x40,%cl                  |  a8 30                 test   $0x30,%al
>>   75 38                 jne    <stdvga_mem_accept+0x48>   |  75 23                 jne    <stdvga_mem_accept+0x31>
>>   31 c0                 xor    %eax,%eax                  <
>>   48 81 fa ff ff 09 00  cmp    $0x9ffff,%rdx              <
>>   76 26                 jbe    <stdvga_mem_accept+0x41>   <
>>   8b 46 14              mov    0x14(%rsi),%eax            <
>>   8b 7e 10              mov    0x10(%rsi),%edi            <
>>   48 0f af c7           imul   %rdi,%rax                  <
>>   48 8d 54 02 ff        lea    -0x1(%rdx,%rax,1),%rdx     <
>>   31 c0                 xor    %eax,%eax                  <
>>   48 81 fa ff ff 0b 00  cmp    $0xbffff,%rdx              <
>>   77 0c                 ja     <stdvga_mem_accept+0x41>   <
>>   83 e1 30              and    $0x30,%ecx                 <
>>   75 07                 jne    <stdvga_mem_accept+0x41>   <
>>   83 7e 10 01           cmpl   $0x1,0x10(%rsi)               83 7e 10 01           cmpl   $0x1,0x10(%rsi)
>>   0f 94 c0              sete   %al                        |  75 1d                 jne    <stdvga_mem_accept+0x31>
>>   c3                    ret                               |  48 8b 0e              mov    (%rsi),%rcx
>>   66 0f 1f 44 00 00     nopw   0x0(%rax,%rax,1)           |  48 81 f9 ff ff 09 00  cmp    $0x9ffff,%rcx
>>   8b 46 10              mov    0x10(%rsi),%eax            |  76 11                 jbe    <stdvga_mem_accept+0x31>
>>   8b 7e 14              mov    0x14(%rsi),%edi            |  8b 46 14              mov    0x14(%rsi),%eax
>>   49 89 d0              mov    %rdx,%r8                   |  48 8d 44 01 ff        lea    -0x1(%rcx,%rax,1),%rax
>>   48 83 e8 01           sub    $0x1,%rax                  |  48 3d ff ff 0b 00     cmp    $0xbffff,%rax
>>   48 8d 54 3a ff        lea    -0x1(%rdx,%rdi,1),%rdx     |  0f 96 c2              setbe  %dl
>>   48 0f af c7           imul   %rdi,%rax                  |  89 d0                 mov    %edx,%eax
>>   49 29 c0              sub    %rax,%r8                   <
>>   31 c0                 xor    %eax,%eax                  <
>>   49 81 f8 ff ff 09 00  cmp    $0x9ffff,%r8               <
>>   77 be                 ja     <stdvga_mem_accept+0x2a>   <
>>   c3                    ret                                  c3                    ret
>>
>> By moving the "p->count != 1" check ahead of the
>> ioreq_mmio_{first,last}_byte() calls, both multiplies disappear along with a
>> lot of surrounding logic.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- a/xen/arch/x86/hvm/stdvga.c
>> +++ b/xen/arch/x86/hvm/stdvga.c
>> @@ -69,18 +69,14 @@ static int cf_check stdvga_mem_write(
>>  static bool cf_check stdvga_mem_accept(
>>      const struct hvm_io_handler *handler, const ioreq_t *p)
>>  {
>> -    if ( (ioreq_mmio_first_byte(p) < VGA_MEM_BASE) ||
>> +    /*
>> +     * Only accept single direct writes, as that's the only thing we can
>> +     * accelerate using buffered ioreq handling.
>> +     */
>> +    if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 ||
>> +         (ioreq_mmio_first_byte(p) < VGA_MEM_BASE) ||
>>           (ioreq_mmio_last_byte(p) >= (VGA_MEM_BASE + VGA_MEM_SIZE)) )
> Arguably the function calls are then pointless (as generated code proves),
> but maybe keeping them for doc purposes is indeed worthwhile.

They're static inlines, but the code is more readable this way IMO.

One thing that did occur to me though.  The compiler doesn't know that
p->df is only relevant for REP instructions, and the p->count == 1 case
is ambiguous.

I don't think we can do any better, considering that ioreq is a public type.

~Andrew

