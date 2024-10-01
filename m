Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F318798C3EC
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 18:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808398.1220298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svg5z-0003Aq-MC; Tue, 01 Oct 2024 16:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808398.1220298; Tue, 01 Oct 2024 16:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svg5z-00038i-JZ; Tue, 01 Oct 2024 16:51:31 +0000
Received: by outflank-mailman (input) for mailman id 808398;
 Tue, 01 Oct 2024 16:51:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oTF=Q5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svg5y-00038c-R1
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 16:51:30 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67a5cf64-8015-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 18:51:29 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a8d4979b843so831387966b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 09:51:29 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27773c0sm747303366b.1.2024.10.01.09.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 09:51:28 -0700 (PDT)
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
X-Inumbo-ID: 67a5cf64-8015-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727801489; x=1728406289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xv3rrZiNcm+n2nqp2GvJrpbr4TIBAARtZcc3Wfzj5gs=;
        b=qDBOBDHAyY45BOS7mVUwbQvcLvvmn8XkKgPrPm4tCqbtUh0LIprwp+DdfgujzU8Z/a
         ksoPRPAjfqZbh381O0t+FenGMvmNV2cw/jx9bVy/jkD+A6vWIoqgQ7cQmR/2+P6ZCfgd
         1ptgFijmPlen8bV4MbR1j12mPqX4KNlk3CuRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801489; x=1728406289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv3rrZiNcm+n2nqp2GvJrpbr4TIBAARtZcc3Wfzj5gs=;
        b=v5Z1sggLpmBn/tlDfMcIzg7a4EqzSKwqr5QdvrrKJpZlUEkUwdL/S0oOO3gn4UOrEa
         YI/wLzh1vJDSIfdE0cVj9vLLOy1NneIZhfJwqx5yo+vhU2bmR9qAIjZy8pFsvf73ibMu
         rr/YbuWvJJzS1hDm9H2XKKGTUsbT7yiCxEA8XmGUbLH4bxVHU+VXzCu41Ac72e9uAYhb
         heajeBKBu9affirJr46vKxjllFond6x3BpVrEUhFhV4RPRszW/6zu8n0eBXGfs3/RIUK
         d16poOFWf6cq0gMBq29MXyNgmrwzVk7wbFkkm2+bmhmQJLTxwfPYeioHLFAeE0v906wx
         +Ziw==
X-Forwarded-Encrypted: i=1; AJvYcCX83NnBVTmJrG7c+EFhxEqXfqpU5gee/GLsSKFyy5g6ky/j7cRJiCk3jrsPsGrLaLa6/y1K8hMfLuQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM5t9ZTMweDB5fGtEh77jrkV5bHUso5ai/prmLwmPs4ixIdbpE
	QbTxN1iVHjvE8SewqmAibTyobOfOZNs4HhIuiP9CRx0mAnWb70duc1Jy+gq/oRlO6883kJaoRmq
	E3xI=
X-Google-Smtp-Source: AGHT+IEP98NygWggo87c3QYABHFfJ90JDiaCssRZb462dr0n4nIJFhdZIOdt02gr0N/Plwzek3mcTg==
X-Received: by 2002:a17:906:6a11:b0:a86:b38d:d703 with SMTP id a640c23a62f3a-a98f836ee33mr19665366b.50.1727801488857;
        Tue, 01 Oct 2024 09:51:28 -0700 (PDT)
Message-ID: <13168581-c5b1-4c85-a7bf-a865914ad9e4@citrix.com>
Date: Tue, 1 Oct 2024 17:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/11] x86/ACPI: annotate assembly function/data with
 type and size
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <4f828e91-aa90-4b44-b778-234812e4f8e1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4f828e91-aa90-4b44-b778-234812e4f8e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 4:14 pm, Jan Beulich wrote:
> Use the generic framework from xen/linkage.h.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> although...

> ---
> v7: Make do_suspend_lowlevel() a single function.
> v6: New.
>
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -7,7 +7,7 @@
>          .text
>          .code64
>  
> -ENTRY(do_suspend_lowlevel)
> +FUNC(do_suspend_lowlevel)
>          push    %rbp
>          push    %rbx
>          push    %r12
> @@ -43,7 +43,7 @@ ENTRY(do_suspend_lowlevel)
>           *
>           * Everything else, including the stack, needs restoring.
>           */
> -ENTRY(s3_resume)
> +LABEL(s3_resume)
>          lgdt    boot_gdtr(%rip)
>  
>          mov     saved_cr0(%rip), %rax
> @@ -132,6 +132,7 @@ ENTRY(s3_resume)
>          pop     %rbx
>          pop     %rbp
>          ret
> +END(do_suspend_lowlevel)
>  
>  .data
>          .align 16
> @@ -142,5 +143,4 @@ saved_cr0:      .quad   0
>  saved_ssp:      .quad   0
>  #endif

... we do need something for these 3 variables, or they want to move
into a C file.

~Andrew

