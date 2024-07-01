Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F9991E441
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:36:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751821.1159895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOJ4H-0001sf-Kw; Mon, 01 Jul 2024 15:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751821.1159895; Mon, 01 Jul 2024 15:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOJ4H-0001pV-Hf; Mon, 01 Jul 2024 15:35:49 +0000
Received: by outflank-mailman (input) for mailman id 751821;
 Mon, 01 Jul 2024 15:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ypwj=OB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOJ4G-0001pP-D2
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:35:48 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95705c37-37bf-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 17:35:46 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-79c069554f8so124066485a.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:35:46 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692f064esm357668085a.89.2024.07.01.08.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:35:44 -0700 (PDT)
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
X-Inumbo-ID: 95705c37-37bf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719848145; x=1720452945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/vAiAQO2Cggt3dxwvEwn2y0Wx6GoDzfj8YvIYDi0Z+A=;
        b=ETA/xwDim93q/NUybuP96YJOVReqJd9u/axCJ9EXq/DYQxVUHAXyiFQeC0pKP3dVly
         wYb9eBvkAvkSdt4XdeCaYFKEmO2i1pcfG244W7Y6eHfHUSxPQ6UXFO3S0l7Z2rQEI0UK
         /J8ZSiYwHMZTn9X38g20fnTQ8w8DKRTJvkwvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719848145; x=1720452945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vAiAQO2Cggt3dxwvEwn2y0Wx6GoDzfj8YvIYDi0Z+A=;
        b=sRcnLJfcaHPjHJCOdpk7Q8cx4Ib/jIF5dt0ie6rbuV123Lv5fhXK+NP/ZrdeD0lU3o
         gcnDsG3AHgsAXcIagYRGdiFEuejJIhImj5d+UMTNMGY9bnD81RpQtybw8w5YaaNeKbpm
         lYZb6qAlV7gtpHHY5SnA4tfz3qtSXg10HPgG6pbV+P22oB1z2FTrnU4Mba+8j+NX+4lF
         juCoUqm/BI85yJjE4AcsFoaZ2guRYsATJXLFMk5Uu3oinCrI9sSp1GDRx7FBqexzBRnf
         RORZorYpG+SOtUTdWGAy0Dc19IYIhiJGhPaQaKlh8+J541dWHHivtNvrhwniO0w5pD84
         YGPw==
X-Forwarded-Encrypted: i=1; AJvYcCXtNq4ojHArJYNCVx/hqgJ8lkXMBwBwTSclHY22yhIcUuKV0OxSo4UysmNZ1oi5w9b3gJSXGj0bqG0g2I1teHnXROW491ZFsWH4IJVnbXQ=
X-Gm-Message-State: AOJu0YyZ0idV0TiHUMOpXOo01HwI5eO8+x/cAXhJIehS/LCsHTocpw/X
	VZlECayhCKfSq8jcBjjDs1EH2/z0REeKT6waTQ/NnCi0o7BM29+u+uz98zfhgnQ=
X-Google-Smtp-Source: AGHT+IGPdrbEBV0CeeCZNeTrRgNgJf7aHqaEJBRKpNuH0WmTph6aSccbMzRMxPdK2WuLUOoTdgv8Ig==
X-Received: by 2002:a05:620a:450c:b0:79d:8000:b2e0 with SMTP id af79cd13be357-79d8000b4dcmr821286485a.6.1719848145257;
        Mon, 01 Jul 2024 08:35:45 -0700 (PDT)
Message-ID: <378af810-02ea-4a66-b003-c1303f599e2a@citrix.com>
Date: Mon, 1 Jul 2024 16:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/entry: don't clear DF when raising #UD for
 lack of syscall handler
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <36cf1c15-faa5-4e25-8fdd-9c52076f4ca2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <36cf1c15-faa5-4e25-8fdd-9c52076f4ca2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/03/2024 1:44 pm, Jan Beulich wrote:
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -47,12 +55,13 @@ UNLIKELY_START(z, syscall_no_callback) /
>          testb $4, X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_flags(%rdi)
>          setnz %cl
>          lea   TBF_EXCEPTION(, %rcx, TBF_INTERRUPT), %ecx
> +        or    $~0, %esi                 # don't clear DF

Our predominant comment style is /* */

>  UNLIKELY_END(syscall_no_callback)
>  
>          movq  %rax,TRAPBOUNCE_eip(%rdx)
>          movb  %cl,TRAPBOUNCE_flags(%rdx)
>          call  create_bounce_frame
> -        andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)
> +        and   %esi, UREGS_eflags(%rsp)

Could we gain a /* Conditionally clear DF */ comment here?

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

CC Oleksii for 4.19.  This fixes a subtle regression in the PV ABI
caused by a post-XSA fix a few years ago.

It's a low-risk fix to take; while I still don't have an XTF test
covering this, the corner case it's changing used to be completely fatal
to guests, so it's a corner unused in practice.

~Andrew

