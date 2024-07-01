Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F991DA62
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 10:48:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751378.1159318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOChU-0005Av-2m; Mon, 01 Jul 2024 08:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751378.1159318; Mon, 01 Jul 2024 08:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOChU-00058c-0A; Mon, 01 Jul 2024 08:47:52 +0000
Received: by outflank-mailman (input) for mailman id 751378;
 Mon, 01 Jul 2024 08:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kQX2=OB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOChS-00057h-Em
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 08:47:50 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97c7b17c-3786-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 10:47:48 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so36988381fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 01:47:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c69b53bf2sm3957364a12.2.2024.07.01.01.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:47:47 -0700 (PDT)
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
X-Inumbo-ID: 97c7b17c-3786-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719823668; x=1720428468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3N44dv4jm8TiQG5tTnIpJMOe6ZctV9pz5x1SDWPXP+Y=;
        b=bDf8BA1w1kSXJEcRNk3BEk/zeuF/SJwaP2aeS5JUqxcuaVBp2sgCDS4X91Tcu9d9HD
         B3aqUG1jSn3kNvm0Tx8VadMm6Y/40rgJP7u2LJI7CWvFCJfxFJGdvssFK3OkQsh4W8rO
         xDgnOLWAzo+iVZPrtrlhYK67IL7vTbJ2otGRQtei18Ns7SBWgF9l9q+X8HZ94MyoVKGv
         7MReMqeO453uE71JKrjwKM7wtopLiQbc8gRqe3jl6srIo4bG72Ul60IOSqrqsQtpucTe
         3/jzMmfXZd0LboNPL1/Mc5kiJOXd60+zEJMOvzK4ZhwoMWHBMwrStDvcH7bCbjJYro9c
         n8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823668; x=1720428468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N44dv4jm8TiQG5tTnIpJMOe6ZctV9pz5x1SDWPXP+Y=;
        b=h1WQ8s1SD6RGkElfYKeSY3S48+mb/eXMBQIYaP5SGDdeJh5iO6gGqoHbXJTfYczm8c
         5eTs3Jl3TDkxH4ViQH5zyBySesrFa5exnsPfsWSAlspMAV8+APnubeWl3g/rYuV/isfN
         WHgI9N+Htq9f7faM8OmCP4pzIRgtxVll3RHf+Ug9JwzLYYmHg5jA2gw0sN4dtaN+Onfa
         2irKewCob1k74gE02U7plt5D6sWSdLxgZsoxio8M5ItW7808DiLYZd9NRZVpe4sixv5k
         +nXmo2D9t76Ntjo3eVh/X6e5BKIjoFZNVbn20HEnFpX3iLheQQlg0sUVpTfn6uaRRGCk
         aYrw==
X-Forwarded-Encrypted: i=1; AJvYcCWhYreZtJP1W+Rrg57CGrp1tYYPzHM+iRB4CNhTMT2cMwOFLrY0LoU0GPHRoODGYRYVmANyeTOmteLhQ+u+Z1caxe8g7qyHKrNkNgqPF4k=
X-Gm-Message-State: AOJu0Yw+7XmUJgjqKtEWL7X0HjjJ+0eOESF7vwiJ6rhs6KhIrZxFEdtv
	lPl16AI9tXpKfN0XxI2fA+PGGIioui/UwORQGdeymzI3tz1P2MwbxWeG1xlg8g==
X-Google-Smtp-Source: AGHT+IGL/E46BFvOgFXyUotFUORaiWMTGjzSDFj8mvqxD6k3zxX0Bww7f12V9+1KJ+LK3TEJVS2hlA==
X-Received: by 2002:a2e:b00e:0:b0:2ec:5785:ee97 with SMTP id 38308e7fff4ca-2ee5e707ddemr35225031fa.53.1719823667888;
        Mon, 01 Jul 2024 01:47:47 -0700 (PDT)
Message-ID: <2c60ef16-e17c-48dd-911a-d1734aed6da5@suse.com>
Date: Mon, 1 Jul 2024 10:47:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 07/12] x86/hvm: address violations of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1719383180.git.federico.serafini@bugseng.com>
 <87cfe4d3e75c3a7d4174393a31aaaf80e0e60633.1719383180.git.federico.serafini@bugseng.com>
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
In-Reply-To: <87cfe4d3e75c3a7d4174393a31aaaf80e0e60633.1719383180.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 11:28, Federico Serafini wrote:
> @@ -2798,11 +2800,12 @@ void hvm_emulate_one_vm_event(enum emul_kind kind, unsigned int trapnr,
>          hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
>          memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
>                 hvio->mmio_insn_bytes);
> +        fallthrough;
>      }
> -    /* Fall-through */
>      default:

Can you clarify for me please whether this arrangement actually helps?
I'm pretty sure it'll result in a Coverity complaint, as my understanding
is that for them the marker (comment or pseudo-keyword) has to immediately
precede the subsequent label. IOW even if you confirmed that Eclair is
smarter in this regard, it may still need converting to

        hvio->mmio_insn_bytes = sizeof(hvio->mmio_insn);
        memcpy(hvio->mmio_insn, curr->arch.vm_event->emul.insn.data,
               hvio->mmio_insn_bytes);
    }
        fallthrough;
    default:

> --- a/xen/arch/x86/hvm/hypercall.c
> +++ b/xen/arch/x86/hvm/hypercall.c
> @@ -111,6 +111,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
>      case 8:
>          eax = regs->rax;
>          /* Fallthrough to permission check. */
> +        fallthrough;
>      case 4:
>      case 2:
>          if ( currd->arch.monitor.guest_request_userspace_enabled &&

Arguably the comment could then be dropped in exchange. Yet I won't
insist on you doing so (and others may also disagree).

Jan

