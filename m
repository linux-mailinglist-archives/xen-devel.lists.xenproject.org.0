Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6854901C0F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736988.1143090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZgT-00024b-9T; Mon, 10 Jun 2024 07:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736988.1143090; Mon, 10 Jun 2024 07:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZgT-00022L-6h; Mon, 10 Jun 2024 07:43:17 +0000
Received: by outflank-mailman (input) for mailman id 736988;
 Mon, 10 Jun 2024 07:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZgR-00022F-Bu
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:43:15 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17e098c3-26fd-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 09:43:14 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso5709656a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:43:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c7ef8d914sm2024293a12.71.2024.06.10.00.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:43:13 -0700 (PDT)
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
X-Inumbo-ID: 17e098c3-26fd-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718005394; x=1718610194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j5u/j9/F2TaKM7M8J4V6qUJPouKbIf2M6wWnZ3N5XIw=;
        b=EDpA/Y+pEYCOXHKZSSrJ+OlqrDWy2cG2u7SXwRlKs1C9zU02JDee1VnZQTqAadc5+V
         SjSgENXkkGPPPv+ijUdxRVfZZoEQMLsGrJecRtRFlEGMZSiThKUMAuzd/oqRsgiz8tZu
         WY+gzoIKxAHD8d7W0SNX7hRG0G45oexo+YBWwKCScSZsSqFNJXXiz+UcB28igXO9WYK2
         pGIugv7eBF2Q+1pF95m/X4+WyT5HahHkNZzwKzXyyyBCI2ho4MtuEBBcj/5sUctyBs87
         eUrgvcXvvDveOPoxpZQ1B/tEEH5N5v3JGVFeLa5T6nxTU1OoZ8WSgqeXT9+qedi8ZP4y
         GCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718005394; x=1718610194;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5u/j9/F2TaKM7M8J4V6qUJPouKbIf2M6wWnZ3N5XIw=;
        b=oNy/F5hoxsEeAlGb+m1gSMZ2VZLwRbLabQgFzkBDi0TEF3aw1Hz6cRDi/CP3hbyNYa
         OfESi/ROwFfUktzuG8ghtMLqTe60B+I6rAVIVcEgOK8WvN9+lOUoxEHBSju9IBvQ4LjJ
         gtOGJXCXODmsgxvNtmK+35OL2DuER9cXn9S2W1A9EbvFIMdc8pdhXMiEmkQerKHyjReq
         cjw5MIZA4i2lFPMlUNzLqPNyZNvccRNVfEooh2FHfDXcw5a20FJMffW4PR5krWOqUY1+
         9CT7fWEwba6359CzAl+VUskzHQ3JQ3oq7jE1xY+q9iPKXoARybf6rv0tMN+jjQENiUd0
         Hqlg==
X-Forwarded-Encrypted: i=1; AJvYcCUPaTFUT1y0f2snShXOUvUT8rtVBuZAU7vFC60n0LG2AEnOhiQYvzkE3o/+kr1Qrlvt/Vj40ufWFngDw7BpG+ljvMWm+37gJnqgIJJtkXk=
X-Gm-Message-State: AOJu0Yy2L/+LlAu8JjYfu+RzyMuRVWdxpU6j/vuvmStuxMU9OU6YnC6+
	DKEx57Qs67cHr7rP1pP5aKA7v0PvQIkOzJpr0zZ7boZhr183YjXXWKQvFLZuxQ==
X-Google-Smtp-Source: AGHT+IFuoiUXC7QXNxXo/eU9Ev/B3kLDrNuHwucf4pdJysLcZKaof4bQYwNNl+6Ib8h8HN0RSttTpg==
X-Received: by 2002:a50:d591:0:b0:57c:60d1:a4f4 with SMTP id 4fb4d7f45d1cf-57c60d1a54dmr4020709a12.39.1718005393625;
        Mon, 10 Jun 2024 00:43:13 -0700 (PDT)
Message-ID: <0cae0e19-8512-40e0-9ef2-6e91069779ec@suse.com>
Date: Mon, 10 Jun 2024 09:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.19 v2 3/3] automation/eclair_analysis: add more
 clean MISRA guidelines
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1717790683.git.nicola.vetrini@bugseng.com>
 <42645b41cf9d2d8b5ef72f0b171989711edb00a1.1717790683.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <42645b41cf9d2d8b5ef72f0b171989711edb00a1.1717790683.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.2024 22:13, Nicola Vetrini wrote:
> Rules 20.9, 20.12 and 14.4 are now clean on ARM and x86, so they are added
> to the list of clean guidelines.

Why is 20.9 being mentioned here when ...

> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
> @@ -60,6 +60,7 @@ MC3R1.R11.7||
>  MC3R1.R11.9||
>  MC3R1.R12.5||
>  MC3R1.R14.1||
> +MC3R1.R14.4||
>  MC3R1.R16.7||
>  MC3R1.R17.1||
>  MC3R1.R17.3||
> @@ -73,6 +74,7 @@ MC3R1.R20.4||
>  MC3R1.R20.6||
>  MC3R1.R20.9||
>  MC3R1.R20.11||
> +MC3R1.R20.12||
>  MC3R1.R20.13||
>  MC3R1.R20.14||
>  MC3R1.R21.3||

... nothing changes in its regard?

Jan

