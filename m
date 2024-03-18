Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F787EDEA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:50:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694936.1084227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGBc-0001Tg-UV; Mon, 18 Mar 2024 16:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694936.1084227; Mon, 18 Mar 2024 16:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmGBc-0001RD-RK; Mon, 18 Mar 2024 16:50:08 +0000
Received: by outflank-mailman (input) for mailman id 694936;
 Mon, 18 Mar 2024 16:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmGBb-0001Lz-3F
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:50:07 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92ab38f9-e547-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 17:50:06 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a44ad785a44so541708666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:50:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e9-20020a170906c00900b00a46ce8f5e11sm564072ejz.152.2024.03.18.09.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:50:05 -0700 (PDT)
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
X-Inumbo-ID: 92ab38f9-e547-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710780606; x=1711385406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47KOIssaEzxtjQTqyt3uWH4deUrbCtDwYpwQMeCeJGo=;
        b=fwsYHxbAsQ5xvKuOpXWVq5f1bxUc2arfn59tJ419wBzXPkPkT2AvuDttZxOznfa6xg
         Oz5vzHlcSufUkCMTa0QDpiVnyUbSYGcmsj1zcAX1tQwkCD2kJxX/X5tI6SPl/RwbMuQ2
         XBUWdr8ZVunl4Wl7FRwRfnJscZGODLaZ+tyTAiXCwVdB9yTnKdDYHrASaJtieihtyxxj
         OqnxFi3My6Xe1AsuOblivKGfS/VpDerV0smIz+gYVYGWB4jFjjO0mDVMPMor3hGsexaK
         bWClyhEdkvBn3NW07Kpn+AwnlwMdmPMTsw1+AYCt1fXTau4l4i9wZ2W971jKUZ6GluJ8
         mroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710780606; x=1711385406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47KOIssaEzxtjQTqyt3uWH4deUrbCtDwYpwQMeCeJGo=;
        b=MuYPQEPl9bz9qeIY1Y8dd5Hif7UNpQAxe/QSJdQ616re19cHjZz+WThfmKpVZ8mYrL
         z0FLeSPwhXAld57zr6CPhxk6dLp2/PXhFbAPQDxWi1tVF4UcCNckEk4SYab2dynalQH4
         +cdOTmUvua4Z0Zx1XBGN6G8KJV3TpFHsZc45BzQEbxoGLx9X5e/Ck+1I1kq44xqXdFXB
         UbiCNuaK88LQIy9zd0FNqoi+cGOYlj2e8QqwPgA4kUVjhDi8gMawxXQtjPgJXE2JTrnV
         f6at4BM6s+ACWUlxM7vK/BAYJ+5I5/YdrkpbOi7E50YtSZZtohW17yLeMayN0WrsksaF
         OF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFfryNfablnWp49i6xEDgosyLZkLyQ2DsRC6JgK24k+VhbSkJ8fmoNesUiyyQvZAbeVFqNNhT54iZKlIgJmGWU4iN2qnTEwnTL8DwqSB4=
X-Gm-Message-State: AOJu0YzZs8DjOxX8X8DZnGykDSPoxXbt/laQ1k3fmYd9I1U5Sbmyn+xo
	7Ivxg2SJ3wGH0rQTp984fFs7GkSXu8K1fTDCiqHeODrkKw5+zlWpuaQ55lq7xA==
X-Google-Smtp-Source: AGHT+IH2yScdPKV+9YqN/Awa6O7r2yAdcDBXOtEiG7LW4RFn3DT6+Lzz8qSxpDBRbu8wthl08T5U1Q==
X-Received: by 2002:a17:906:ee8e:b0:a46:bdd8:64ef with SMTP id wt14-20020a170906ee8e00b00a46bdd864efmr3001261ejb.19.1710780605903;
        Mon, 18 Mar 2024 09:50:05 -0700 (PDT)
Message-ID: <6e6dce2b-dcfe-4fe9-add4-4f93dabc51a5@suse.com>
Date: Mon, 18 Mar 2024 17:50:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 08/10] xen/notifier: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1710762555.git.nicola.vetrini@bugseng.com>
 <5ea6d48a2af93c54693364eb5bfa7e575eb717a3.1710762555.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <5ea6d48a2af93c54693364eb5bfa7e575eb717a3.1710762555.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 12:53, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



