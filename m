Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1979DBFD1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 08:45:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845718.1261064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGvfg-0006n5-Aq; Fri, 29 Nov 2024 07:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845718.1261064; Fri, 29 Nov 2024 07:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGvfg-0006ks-8A; Fri, 29 Nov 2024 07:44:12 +0000
Received: by outflank-mailman (input) for mailman id 845718;
 Fri, 29 Nov 2024 07:44:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGvfe-0006km-W9
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 07:44:11 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b585eb78-ae25-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 08:44:05 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa53ebdf3caso300347866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 23:44:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097dd617asm1552162a12.42.2024.11.28.23.44.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 23:44:04 -0800 (PST)
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
X-Inumbo-ID: b585eb78-ae25-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI1ODVlYjc4LWFlMjUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODY2MjQ1LjY1NjIxMiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732866245; x=1733471045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yOG7yv+MN1iFNYFD0nzQtxRdykEReEn9OMMLf5/ayAE=;
        b=Mpf6OXM1bDEEL5ajTK3zmdCiXswEXo/vZm5SqOQCTLo+tL1EfSKNOR3O44K3vcT2L5
         b/BOJ8pmueg1Thk2KGgpW4lN3GvO68zgbB8eBv4B/4uWoFMSorDfZCOyupEI4eTg7V80
         hZvp4DFPQxiP4bmT1275rdvrfV33BNkM5ccc2AQbctLvGGf2peUGeZnA6RmcUK1KJrAl
         H9HHlaoXz0/F88uwvW1LBJoqG3z4BN8oL1VndMmsD9EWZxhmRdlTqAOvkAK/BQ3q8U1J
         AZaprkj4KXfotflrDgO0ueaUk1mhso5akrUBX9SzhW4HC27TtgIIQvfufwCgBt6frzH/
         tGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732866245; x=1733471045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOG7yv+MN1iFNYFD0nzQtxRdykEReEn9OMMLf5/ayAE=;
        b=T6b0Ew3nMs2+Umy2Rc8CRR7ezC34SsLjYjh/l3TzMoLRTsljSLSyQnadsPyIqkveZg
         2J/ATnOgwkve7GD+skPt525IqMsRn3uH/osTPLpsZJ235NNKrSraGdcc1gk2AsgnapyZ
         lVgrxR/BRaUcmwHMyNDVOnI763vp/4FEGRQsjT8urIK/YwVgycrwyCBIgHh19qMVZM25
         /wK5kJYstNouqc2APJkxBl667SywbUbiP3GilqKgqCjSFWzI4YVIm/bow3WYz0kE83/E
         0PZbXCXOtUXYZKH8sDTSeDmgCI3Aj0XOqQBwcpeIfq5MilN3dSUUk/cc8BdPaYgU/pi/
         gXyw==
X-Forwarded-Encrypted: i=1; AJvYcCV/sWvf0BpywmC6Vfo1LFGn9HBUsdonmMUr8lY0wi3haMJ6RBrV782fgUKcg/ds1rgI7n66l2danZ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyjG+pdG2ebck5Q5aiaKDenuFGNhqcUP/HtU5RP/z9AbW2dbDg
	Is2BHL1YMVOmdhicK06bu4Cr01s62AWsA04oNaJlbyQaEWI0wBZrZQsLh+Jvww==
X-Gm-Gg: ASbGnctEOdV58xlfOj9YvK/BUMd9mU4u5SrUTL29+LPAvM5aDUyexTr1eVQmx6QTCfN
	ya9LLXcNMpYoRjVs+3CfCfABux4wJNEMnQpmeU0zdtoXexmtci6Lat3ysL3pXVwu+ln+TjLYSnr
	iwWb5qRubF7F+p98oY8Rt2F7NbF30iG6JRwpsKzXtTFH+e0XKOXiFFIDhDIFQOR9fLrWWcMc5S/
	o0LOCbGYfOkAukDygPou1Ug76v6b7dG55XZxi8ev+SbJit0/4ZYKV09KyOCoRSSsszz8Q0m9XsM
	BNW1xZyvcd3AbFo76/Wz62pwukrekzH5aoM=
X-Google-Smtp-Source: AGHT+IFW27UF8h8vHXALqw1sw8LY9WSjgcx3KzmqA8U+cWT/lp5OcAUv433siLSu/Go+zQH7xt7Gig==
X-Received: by 2002:a17:906:3143:b0:aa5:11fa:626d with SMTP id a640c23a62f3a-aa580ee013dmr1055389566b.3.1732866244992;
        Thu, 28 Nov 2024 23:44:04 -0800 (PST)
Message-ID: <c31bf522-41d6-46be-8e04-5f7ec566d925@suse.com>
Date: Fri, 29 Nov 2024 08:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm: bugframe: emit msg offset only if msg is present
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
 <20241129014850.2852844-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241129014850.2852844-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.11.2024 02:49, Volodymyr Babchuk wrote:
> Before this change, compiler would generate symbol that points right
> past .rodata.str section. While GNU ld handles this just fine, LLVM ld
> will complain:
> 
> ld.lld: error: common/device-tree/device-tree.o:(.rodata.str): offset is outside the section

As this is pretty clearly a bug in the linker, has that been reported
there? A reference to such a bug report would then imo want ...

> --- a/xen/arch/arm/include/asm/bug.h
> +++ b/xen/arch/arm/include/asm/bug.h
> @@ -47,7 +47,11 @@ struct bug_frame {
>           ".p2align 2\n"                                                     \
>           ".long (1b - 4b)\n"                                                \
>           ".long (2b - 4b)\n"                                                \
> +         ".if " #has_msg "\n"                                               \
>           ".long (3b - 4b)\n"                                                \
> +         ".else\n"                                                          \
> +         ".long 0\n"                                                        \
> +         ".endif\n"                                                         \
>           ".hword " __stringify(line) ", 0\n"                                \
>           ".popsection");                                                    \
>  } while (0)

... attaching as a comment here, to make clear why the extra complexity is
needed.

Jan

