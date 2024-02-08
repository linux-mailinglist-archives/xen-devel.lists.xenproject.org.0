Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E491784DFBD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 12:31:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678131.1055179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY2bg-0006Xt-KF; Thu, 08 Feb 2024 11:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678131.1055179; Thu, 08 Feb 2024 11:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY2bg-0006W1-HL; Thu, 08 Feb 2024 11:30:16 +0000
Received: by outflank-mailman (input) for mailman id 678131;
 Thu, 08 Feb 2024 11:30:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY2be-0006Vs-WE
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 11:30:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bb1d238-c675-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 12:30:11 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4103fc91755so2890585e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 03:30:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h18-20020adffa92000000b0033afe6968bfsm3383070wrr.64.2024.02.08.03.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 03:30:10 -0800 (PST)
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
X-Inumbo-ID: 6bb1d238-c675-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707391811; x=1707996611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdhg3xSGzFMAZb/LNRGGE+OJKIs3hiKXgSsLNVGtgZU=;
        b=Do02MTB8GlOYbkiod3I5T6fhY16nVaq0t9Vsb5sPYpjdRzT8ihDN8ECHvFdVMXjR0M
         kWaHvNjqFEnChOG8mLmJO6QrKzu9TVft3TokmSt8dJErwbseSqRt0kJ3ShmRvvmNLjhx
         4KyqWGl+F4nxGT14+WA9bldgwvMEvqQ8NRsWXl/4/17+YWaYh4xLPMQo03jvdEHQG2ys
         4ydWiBqsjTG5p2+WJLCW65vc1SAaO6U6YErQ5iuy6zOhqj2srJoRNcs6YeHP9PYqy8FX
         0Ra3/SJDmdPH7nRzN0Lwe69IhM7rulZMPTVYkF6y5cjC+uuhwBZC/Ekh7H6wkvGXY/5/
         9T3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707391811; x=1707996611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdhg3xSGzFMAZb/LNRGGE+OJKIs3hiKXgSsLNVGtgZU=;
        b=Uw9Re8kuuXTwZrRDu5G51mjszk6r/TJKoc9lYk5mGesATi9w8QjOUpRjdw2h3PRmFG
         vUvaNX78h54HdMCxf6IMhLh225uPxW2i2a2KBWo9edqAupwQSUSgOhvzvjfW6crDh7Pr
         iefhrnqvLwPPHn9bdXo9bwPNYMm0sjPXra614OyRzd289ZhBsCFAb4C36VaKq7EGxc45
         q6CCh+/+2B430ShxYmJqIYxxMcX/TUplQreIlwxeMHoRDzECy1cIgtW6en4nH9i2Q9oc
         zkDHLGlSeG+LaFk8r6khV8oeQfQdDi/Y2kiKur+Q1odYAeOS4uzf778PNrJbq7NaKh7A
         um4g==
X-Forwarded-Encrypted: i=1; AJvYcCX9KSr4vAY4mh3UlnFjoI6bZihLBZhAv3p5G9FkXWlQXbQuFdOr1z3SnhspeMzfxEEA73PXVwvgK4S17sU6L7HZVo53yN2+25RLkNSAzyg=
X-Gm-Message-State: AOJu0YxiwfqZeg5uAgOPGaML/QEoE8/fQPc5iULOdrw023uQHm+UCTam
	uQZ3eFwKfNprLVNyk5O9BYbI2BSHQyAPfeVbdJdH1T4YSP/w8xxkk2cAjzxz9Q==
X-Google-Smtp-Source: AGHT+IGVyLts7G7/0rMJP9J77GnwsYcyC3kh2E1fvSbU0yiPw2dAHZndzGtfkZ/7KQFAoqNVWNSpXg==
X-Received: by 2002:a5d:4cc8:0:b0:33b:381d:a71e with SMTP id c8-20020a5d4cc8000000b0033b381da71emr5010235wrt.17.1707391811150;
        Thu, 08 Feb 2024 03:30:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+cVVYw+FTFCL5I3+hLQHLJHW1THwBycf9d6eIICWEUyEfM49SUvNOr5nXRh8SIX5R+JRNJ7WP7jJ3a/aiLLxObqWh501Dwm0GXGeUMBY7nRxYqcVcNim/xtRL2yXK4/OIM4knXttjQkTZR3XkHn3+
Message-ID: <665c7f47-a218-4187-858d-562bb5b9513b@suse.com>
Date: Thu, 8 Feb 2024 12:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/9] x86/shutdown: protect against recurrent
 machine_restart()
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <87b0e650f28038c2fb64c5eb607c8fdaa7b4db07.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <87b0e650f28038c2fb64c5eb607c8fdaa7b4db07.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:50, Krystian Hebel wrote:
> If multiple CPUs called machine_restart() before actual restart took
> place, but after boot CPU declared itself not online,

Can you help me please in identifying where this operation is? I can see
two places where a CPU is removed from cpu_online_map, yet neither
__stop_this_cpu() nor __cpu_disable() ought to be coming into play here.
In fact I didn't think CPU0 was ever marked not-online. Except perhaps
if we came through machine_crash_shutdown() -> nmi_shootdown_cpus(), but
I'm sure you would have mentioned such a further dependency.

Jan

