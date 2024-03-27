Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF9988D72D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 08:27:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698321.1089879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNgt-0005f3-DH; Wed, 27 Mar 2024 07:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698321.1089879; Wed, 27 Mar 2024 07:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpNgt-0005dA-AA; Wed, 27 Mar 2024 07:27:19 +0000
Received: by outflank-mailman (input) for mailman id 698321;
 Wed, 27 Mar 2024 07:27:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cRKJ=LB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpNgs-0005d4-EN
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 07:27:18 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 709851c7-ec0b-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 08:27:17 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a466fc8fcccso812652566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 00:27:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 la5-20020a170907780500b00a45621ded4bsm5137613ejc.146.2024.03.27.00.27.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 00:27:16 -0700 (PDT)
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
X-Inumbo-ID: 709851c7-ec0b-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711524437; x=1712129237; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EegPNsgq9Inh1Ns5GWaVBbwJz0FYVVfBErgh6ZZ7rWE=;
        b=I+TfbD8d4uERSRnrUNeOxDfwlyImL5oW7TkQG84qmTiS0UKF9e7/+lDpo/dArvqI/p
         l3EPdV+G4qAtN6zZUY/+cQ2OTUpoRidkxNhh/wYr1V5ol/og+CDai7XM4i830PNNCr1V
         fj+srSjJlBM0K7PQNeTwFYmcMcGH/kGmHoplrma4IgJYUMw8xSHxMZjz9BBIzT1D/YWy
         1fkuGpuYJp3FW7gmqrMq8AyT4OH+njsPqLsy9p8DmAjUxPNwgtjiww2itXSdgX/FMAxI
         Dk8PlCUImVYDJtOvwevKz9Wy8TOEJ93VV6N2JirWxl+3c3QEKhdBJHwEIeGR5Dedwcz0
         XMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711524437; x=1712129237;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EegPNsgq9Inh1Ns5GWaVBbwJz0FYVVfBErgh6ZZ7rWE=;
        b=MMmfGdZdpwpkTj+5mHVmgoT2mm37nsYnE29V+qSizXKkAAoqgnIqgnvLir3hsuC+dc
         FAMbhfqMcP/8ojNX1e+ISqFk7aBiwTw6yNpLYIVvXnC7KAlsgpZiL2Z19d85+WNyaQaq
         91WOiKxL7NvX9zFK4TQUe2QSyZMYBsF/APZrmzVgE8Uk48mAK5ih22UOp40BhehXFIrO
         PT2GgNgn12d7dv8/WOd3EVgsJfsrijDDgGc2VMmFTSr++AbGjCIPRq+sn/0FqYhO9RRB
         XhRWQGWY8+o+LRVtopIyk4G+MIHN3z1Xeq2nuWpM9r8vhb8nbk4L7CSvUXlai3Em4TUJ
         R5+A==
X-Forwarded-Encrypted: i=1; AJvYcCXakMV9t+k1DyfaQNEZCnwMPgPVmXI2kxC2kWTCzVDeSnV9GyRfjj0rwJFl82AvvN8EDuCYrT5pueHP1LVifFrKszy2NpPdObaWl8w11s4=
X-Gm-Message-State: AOJu0Yw5HFfKktYVdPU2b1S9G0YImcUgvPgPUR/QszxQQBrgl/+38AhW
	WuRgeZ8j2rDo+L4J11y+bCNY0EgXC+ndLYLrNzi7RnL73pToU8jB9fWtxUAt7A==
X-Google-Smtp-Source: AGHT+IE3/kowIttJBjYObYBDpXYDXn6cHdQfpP9umz1tZDCLOSXhQcGF5Qw/Qi3OHuCeMU3da9VoLQ==
X-Received: by 2002:a17:906:2987:b0:a4a:3403:342e with SMTP id x7-20020a170906298700b00a4a3403342emr2172457eje.56.1711524436957;
        Wed, 27 Mar 2024 00:27:16 -0700 (PDT)
Message-ID: <aa400a30-3f1f-4125-a759-d4e5825fea60@suse.com>
Date: Wed, 27 Mar 2024 08:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] libelf: Expand ELF note printing
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240326213847.3944-1-jason.andryuk@amd.com>
 <20240326213847.3944-5-jason.andryuk@amd.com>
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
In-Reply-To: <20240326213847.3944-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 22:38, Jason Andryuk wrote:
> @@ -145,13 +150,20 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
>          elf_msg(elf, "ELF: note: %s = \"%s\"\n", note_desc[type].name, str);
>          parms->elf_notes[type].type = XEN_ENT_STR;
>          parms->elf_notes[type].data.str = str;
> -    }
> -    else
> -    {
> +        break;
> +
> +    case ELFNOTE_INT:
>          val = elf_note_numeric(elf, note);
>          elf_msg(elf, "ELF: note: %s = %#" PRIx64 "\n", note_desc[type].name, val);
>          parms->elf_notes[type].type = XEN_ENT_LONG;
>          parms->elf_notes[type].data.num = val;
> +        break;
> +
> +    case ELFNOTE_NAME:
> +        /* ELFNOTE_NAME has a newline printed at the end of the function to
> +         * optionally allow printing customized details. */
> +        elf_msg(elf, "ELF: note: %s", note_desc[type].name);
> +        break;

Well. I said "brief comment" for several reasons. One of them being that
it would best fit on a single line. Since now it doesn't, I have to point
out that this way comment style is violated.

/* NB: Newline emitted further down. */

?

Jan

