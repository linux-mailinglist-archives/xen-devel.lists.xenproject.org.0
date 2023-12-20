Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC5981995F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 08:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657397.1026202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFqvm-00034N-13; Wed, 20 Dec 2023 07:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657397.1026202; Wed, 20 Dec 2023 07:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFqvl-00032h-Tl; Wed, 20 Dec 2023 07:23:49 +0000
Received: by outflank-mailman (input) for mailman id 657397;
 Wed, 20 Dec 2023 07:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFqvl-00032b-13
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 07:23:49 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5943959-9f08-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 08:23:47 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3365d38dce2so4240491f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 23:23:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d5551000000b003333521a1cesm6660172wrw.57.2023.12.19.23.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 23:23:44 -0800 (PST)
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
X-Inumbo-ID: b5943959-9f08-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703057025; x=1703661825; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5XVZet7T2QTrOPi3oToIQti5iFLZ2zJAIFsd1nyI8A=;
        b=DIvMwxWjSYvJqmCwIq6MKnrNIDPftkkfE3k21EeazwibZqCG8TI1uWyYZXlnZTlEFZ
         x6dDmOKpfG0tlTdHo8X2879nekspx9aHQwMVtmnH2WwuZP5S198wP8drzHjIqpQsAzNp
         U/jKQIexVTqtCWMKhCRynSdsujn6SPU55occHD4lb4p/c7d8WYykgKjngtGU4mn4wFJc
         MQ1OnuvwhzXGe3kV1OdaCHlQRw1MTZGHtfImUWyxXp1Ih80U6We4FhCZxScZj7hVXaLf
         9BdLfbjZienm0sVU5iJAaSmV0MMii3S5P2p3mDs2ed6CAiiQNWsu3yP4/QgOKRj7aDWO
         Nupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703057025; x=1703661825;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u5XVZet7T2QTrOPi3oToIQti5iFLZ2zJAIFsd1nyI8A=;
        b=rbBZsgWSrFkmRpKSgQ3Jjhg7rkNjoZdjHq1MmrbvRMj6L66GGYrK7sZyICpaBSVeMP
         Y2bg9Q4nrUpfoWY4Rmvt5j+E4KUm3qmAqERmO6t+3d7h8++Ab11cXbCYl+sVqQrjMfrx
         dUWvNxqlP/qpNsCQQNeLWhUpfJvgP42/VXhQJJ5UtcZYNxtkm+YTlF52oGuO9jnMJI23
         GvBJ65BStEU+RNl2282R7Hj8Hg1J5Sf4IhTkHK0TgT634Vc4oG4KzQLrHzYUhSNlKx0Y
         Pe718ZMIvQOMEut2/iE/SBQ1if3RmcxjxXX9NSDd0A8WWHCNxa+yG9RJBp4psOR81nHP
         oa2w==
X-Gm-Message-State: AOJu0YyFPy/WpGInV46yvtorUbRKMnC09Mb47XBHQmo6sp2w7H5HzlKx
	YZ0qOK1oib0614+UJq/twUrP7lxewtwTmH3Ud13h
X-Google-Smtp-Source: AGHT+IGVvF/US2wfnHrPrWhk/wfybsms9up+K65bDEhZGWFwivkLBWqdoQePOl5kTTYCbdwUB/O60Q==
X-Received: by 2002:a5d:6a01:0:b0:333:46fe:d933 with SMTP id m1-20020a5d6a01000000b0033346fed933mr6451302wru.201.1703057024736;
        Tue, 19 Dec 2023 23:23:44 -0800 (PST)
Message-ID: <29518ae7-2511-4db9-91ec-c3490839d6c3@suse.com>
Date: Wed, 20 Dec 2023 08:23:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/asm-generic: Introduce generic setup.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <1e4f48d753871bf61de3af97a3009e069d25d01e.1702607884.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <1e4f48d753871bf61de3af97a3009e069d25d01e.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.12.2023 03:43, Shawn Anastasio wrote:
> Introduce setup.h to asm-generic based off of ARM's to define all
> stubs necessary to compile bootfdt.c

And - I'm sorry to ask - how's that "generic"? I'm also not convinced at
all that a generic header can validly use BUG() in the way you propose.
Some of these go far beyond what presently we have in e.g. altp2m_vcpu_idx().

Jan

