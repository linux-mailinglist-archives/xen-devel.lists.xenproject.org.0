Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423EE879864
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691933.1078553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4TL-0005Ng-ID; Tue, 12 Mar 2024 15:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691933.1078553; Tue, 12 Mar 2024 15:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4TL-0005Lf-Eu; Tue, 12 Mar 2024 15:55:23 +0000
Received: by outflank-mailman (input) for mailman id 691933;
 Tue, 12 Mar 2024 15:55:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rk4TK-0005CN-0v
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:55:22 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee4d3727-e088-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 16:55:21 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so640561766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 08:55:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ld1-20020a170906f94100b00a461c74bbbfsm2699283ejb.91.2024.03.12.08.55.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 08:55:20 -0700 (PDT)
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
X-Inumbo-ID: ee4d3727-e088-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710258921; x=1710863721; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUAB7QbBrOuy75xiVNXmLPTl1p+19b/5Fs5tqFgq71A=;
        b=RbISJ+wGXXHOCmF6eJvSj+OkERih6uAMAPvgJCdzKt7rCybtirLH0/70Reu3RPSEpw
         kv7tMhzEyqhUtbdmWA2UQnSVNtz4dDunoisTkcLbUdhenZC5HxLKeUqhbsVUsLjoN15Z
         WqMn6TIcaSXC8iY4Nc56AwwUWhUdM/Q2mScokpcq0S2GYeqaW0MuS27r5E2/VvshhM4p
         /4TErUeRfR9xigVWz27LZR/9ZIq/Kcn2/3T0/sBSEkspC67W5cIvuwIOUdzH3mp+JOGb
         n94ydae8QN8Z8oxIn/2niGpu0kEzTLt6ocqIH/zs2pNOkNEu39tPSCJhS5XzUWQx56aY
         Uf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710258921; x=1710863721;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUAB7QbBrOuy75xiVNXmLPTl1p+19b/5Fs5tqFgq71A=;
        b=Du90hjtrkFVnqeoToCbapPuaeIGzw2hyhTVSWOhOmQdSUKUUiVD3xDyAsSpIAZ0Q/5
         dZwtKateB8T1cLPmcV6ixLUGTC62+7JRPwGlh/7co3zqQ5sgI9WProNh4/ir85N04676
         5mXDBSmjoThqAuyz7p0vPNv17fqFLs2sTxKpXyK0LpYsK2fzGujYfu5nzOpBTjAl80vK
         R0eEDMI2pY7eIALD9DOhb1vnJ8avr82OJp9lmRWkvq3DRt2hN/SBJRabxn/mtEcAJEjk
         V6OV4LDe/TLdlFVLE3m9jtbQ9T803hjaualYxe87jmmKZlqGpQr5Xi9dSD7uyTKOKe0A
         +bUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsng+k7HHuDTDTifhxq8B7tuo7eOs+AYYgRdYf+ldsTI7ItLGd7VDT1sSyXUkiWxBKemvLNrXjR7h3THaCCqK7XEsiKgS9Hik6DrBVv2Q=
X-Gm-Message-State: AOJu0YxjiP+/jtbPZXjxsI7eIJEUujIEYRE9PvFKQ9YFwAJk1YrZhx5j
	SVO5XxE2GFxj8iVLN/9PNpAda4uMleDjiNRUefUcQwXDtyCSk+i2ed3C/gwk4McYIHlO/12Ogcs
	=
X-Google-Smtp-Source: AGHT+IGWq3EAubyD3sdivTPr2QhuG4+z35NHCHejXN7B/+f1MJzxzD1cVVSfL7DhnQkdSMKJJT20Ng==
X-Received: by 2002:a17:906:bf4a:b0:a45:bf67:bab2 with SMTP id ps10-20020a170906bf4a00b00a45bf67bab2mr6682747ejb.59.1710258920914;
        Tue, 12 Mar 2024 08:55:20 -0700 (PDT)
Message-ID: <a11df04d-eeba-4aca-8d93-3ec20b9a5837@suse.com>
Date: Tue, 12 Mar 2024 16:55:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 15/16] x86/mtrr: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
 <33413c877af70c8aed05ed1bc7b259c59087cb96.1710145041.git.simone.ballarin@bugseng.com>
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
In-Reply-To: <33413c877af70c8aed05ed1bc7b259c59087cb96.1710145041.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 09:59, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Add inclusion guard to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
> prevent the contents of a header file being included more than once").
> Mechanical change.
> ---
> Commit introduced in v3
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Somewhat reluctantly
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

