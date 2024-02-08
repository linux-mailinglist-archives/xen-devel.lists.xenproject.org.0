Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD384E4BF
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:11:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678321.1055464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6zg-0003TD-2B; Thu, 08 Feb 2024 16:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678321.1055464; Thu, 08 Feb 2024 16:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6zf-0003Q0-VA; Thu, 08 Feb 2024 16:11:19 +0000
Received: by outflank-mailman (input) for mailman id 678321;
 Thu, 08 Feb 2024 16:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N909=JR=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rY6ze-0003Ps-Ly
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:11:18 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afefc489-c69c-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:11:16 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-410475afeddso67095e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 08:11:16 -0800 (PST)
Received: from [192.168.10.199] (54-240-197-231.amazon.com. [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c16c900b004103400259fsm1967203wmn.29.2024.02.08.08.11.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 08:11:15 -0800 (PST)
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
X-Inumbo-ID: afefc489-c69c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707408676; x=1708013476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+az7xZn/dvncgU4RIhCZjis7qc7EUKrlPMvS+7lsMzY=;
        b=Dixpg7eHh7A6Uljthuk6+lrV7gldaTUOyW+2HQYyGMOMIuKOAyFUoovHNJti3K0jt8
         dZkUh8svQdq+dvThDG5F++yyZ1w5Yzy5YHPwOjqvpr6Qwuf/pYz9pG4wzCiuy7nM3/EM
         cIIoGQ1DsIQbFjBGnDVDVOBykjy5nz3M/PYItFrt4KbhZJxXt/g6D18x3xXVXV9DHMxQ
         K1x3oVDCCWrmqQexBtG5Ln+1ejqOD/EBUZWL1Yl3b5DUhzkusYzuIuK+9VuODziNU2oO
         iSzk6ITfsyStU/FaXId/P9bkRD8RW6IbgE5mQw48nco3aQhrCwqRpI6SVc46idTgCcyR
         5jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707408676; x=1708013476;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+az7xZn/dvncgU4RIhCZjis7qc7EUKrlPMvS+7lsMzY=;
        b=gedMfk1396LoH/DPglLS2dk6/ZrSq1ObB7CWDnteo3pnEftBP3o9XT/D+i7Mzz+2mo
         yWk0BQehvfUBUnNyj2+bGiPsS+5b62WTs6mhMexJLMsfjPkwDeDNPC0kvzamzzaJ0HEc
         8+FFli0EsLbu6PmYeHDDHh48MFCfxqM1CbVbkuUaIBDjQ/ENp+vWl7EPGjXBlVumi2bj
         KIlSfhtDRpSNR0RTK1QtO0+GXmeRNCp1gH3m8VVxnD2TYhdpZClego31RJieBDT3SEd/
         /PIdGsRioVIeE5z47R994QtOf5tfxYkcvVHg2Kdfw4sWL6E0Lkn/yKlnjmw7IXoHI01O
         z4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWr7n4WwZKEJjoB06f03dABxz8WXa8KCEuwmTf2mJ6iVLQjxpOCigmpbQk4Pm/XknQ2eWAhDXG7xhOdLelckmGn+A2tcZ+6F5cLss/nfPM=
X-Gm-Message-State: AOJu0Yz4pywjfvC6CYspF0t9p6nQk8iDZCcn1CGxLVkEqRcCenocQq5K
	4SCRrxw0qbNiOmmtC9kxg46Nw1rZNv0y/FKZd0OndoBCCWPGVoXV
X-Google-Smtp-Source: AGHT+IFYpkvr4trMVeU0gWqW1he4OnOUM+21Vvv73CpCSPxSCCye6rF2uWOL3gd9pqLSPhfPIppMUQ==
X-Received: by 2002:a05:600c:1ca4:b0:40e:e025:8d4e with SMTP id k36-20020a05600c1ca400b0040ee0258d4emr7355372wms.27.1707408675786;
        Thu, 08 Feb 2024 08:11:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkfXZMKgSmW92XYuQiEmIQD9bQKUUylP5f6+z+yr+N0K3LAY6KKkSyPg3afcP5kj44XL+VFVdlxIkmvEOiSQBqMHunKaGFkqZEVgiXZvtYuzx/qVCiSakF0iYiwMgSVea6Xb2LK0MSIffP3w+vyjASvUgs4NloyxebL+E46dpSMATf9fc1CN4=
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <d4e3ea26-961a-4c30-a366-d0afba475813@xen.org>
Date: Thu, 8 Feb 2024 16:11:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH] x86/HVM: tidy state on hvmemul_map_linear_addr()'s error
 path
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
References: <c4c1d2b3-591e-403f-879b-bbb897f7ff25@suse.com>
 <c0a2b6fe-e64f-433a-accf-124a7cee3f91@suse.com>
Organization: Xen Project
In-Reply-To: <c0a2b6fe-e64f-433a-accf-124a7cee3f91@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/02/2024 15:59, Jan Beulich wrote:
> On 06.02.2024 13:06, Jan Beulich wrote:
>> While in the vast majority of cases failure of the function will not
>> be followed by re-invocation with the same emulation context, a few
>> very specific insns - involving multiple independent writes, e.g. ENTER
>> and PUSHA - exist where this can happen. Since failure of the function
>> only signals to the caller that it ought to try an MMIO write instead,
>> such failure also cannot be assumed to result in wholesale failure of
>> emulation of the current insn. Instead we have to maintain internal
>> state such that another invocation of the function with the same
>> emulation context remains possible. To achieve that we need to reset MFN
>> slots after putting page references on the error path.
>>
>> Note that all of this affects debugging code only, in causing an
>> assertion to trigger (higher up in the function). There's otherwise no
>> misbehavior - such a "leftover" slot would simply be overwritten by new
>> contents in a release build.
>>
>> Also extend the related unmap() assertion, to further check for MFN 0.
>>
>> Fixes: 8cbd4fb0b7ea ("x86/hvm: implement hvmemul_write() using real mappings")
>> Reported.by: Manuel Andreas <manuel.andreas@tum.de>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Just noticed that I forgot to Cc Paul.
> 
> Jan
> 
>> ---
>> While probably I could be convinced to omit the #ifndef, I'm really
>> considering to extend the one in hvmemul_unmap_linear_addr(), to
>> eliminate the zapping from release builds: Leaving MFN 0 in place is not
>> much better than leaving a (presently) guest-owned one there. And we
>> can't really put/leave INVALID_MFN there, as that would conflict with
>> other debug checking.

Would it be worth defining a sentinel value for this purpose rather than 
hardcoding _mfn(0)? (_mfn(0) seems like a reasonable sentinel... it's 
just a question of having a #define for it).

Either way...

Acked-by: Paul Durrant <paul@xen.org>

>>
>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -696,7 +696,12 @@ static void *hvmemul_map_linear_addr(
>>    out:
>>       /* Drop all held references. */
>>       while ( mfn-- > hvmemul_ctxt->mfn )
>> +    {
>>           put_page(mfn_to_page(*mfn));
>> +#ifndef NDEBUG /* Clean slot for a subsequent map()'s error checking. */
>> +        *mfn = _mfn(0);
>> +#endif
>> +    }
>>   
>>       return err;
>>   }
>> @@ -718,7 +723,7 @@ static void hvmemul_unmap_linear_addr(
>>   
>>       for ( i = 0; i < nr_frames; i++ )
>>       {
>> -        ASSERT(mfn_valid(*mfn));
>> +        ASSERT(mfn_x(*mfn) && mfn_valid(*mfn));
>>           paging_mark_dirty(currd, *mfn);
>>           put_page(mfn_to_page(*mfn));
>>   
> 


