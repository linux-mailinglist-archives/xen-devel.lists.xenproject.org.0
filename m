Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A72A23993
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 07:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879867.1290079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkjl-00025P-99; Fri, 31 Jan 2025 06:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879867.1290079; Fri, 31 Jan 2025 06:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkjl-00023L-5w; Fri, 31 Jan 2025 06:42:45 +0000
Received: by outflank-mailman (input) for mailman id 879867;
 Fri, 31 Jan 2025 06:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdkjj-00023F-22
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 06:42:43 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916ee933-df9e-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 07:42:41 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so15946335e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 22:42:41 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f10a:3123:f9e9:b484:6874?
 (p200300cab741f10a3123f9e9b4846874.dip0.t-ipconnect.de.
 [2003:ca:b741:f10a:3123:f9e9:b484:6874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13139sm80415345e9.3.2025.01.30.22.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 22:42:40 -0800 (PST)
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
X-Inumbo-ID: 916ee933-df9e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738305760; x=1738910560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UBqOVcMx4Rdr9/LDw3ArS6B/3yoE9+MIImqGwur+LN4=;
        b=O0BdLQXgHvWG3h/whO6bpmcPn+Qd8eoSwE8yE4Gfw7k8LSsiPoz/gdcPZjODeOhRfA
         wiZgc5tUrkAm4QsxpvGurNWEb17PCXfSrq+DEkpJMmvUEH2qdnkjMeU/f9p6WH+V9WkB
         Bln0KH9Sa/kS+1XEM8E7L0YNObzdYYA8bjn/lq9yaBwGK+4ar/PlXfXX0aVOFi23E5II
         /JHX6bU058rCGhTD2302+qXIcTv0+jm2JJiNQ8OxNLFOI/zfqlQBV5NcJmB+OtTmrUb5
         0Z4tYqp+se5K1umXgCw9K0CHk0yH9rYyZQYMOTav2E2+1tjlReG1ZL345r2+yd59C8cJ
         9lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305760; x=1738910560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBqOVcMx4Rdr9/LDw3ArS6B/3yoE9+MIImqGwur+LN4=;
        b=ETCMMF7BtA7E1vhafbOZFN77GyAt60ntyRjaEo9ZnjgHhBRbzjNLApvvpGGpJQ3RA1
         0AKbEdxkDA9TPXo05L8UmJkFYor0Gp07EdbygCjvIKEIoOxYBAz+ea+2NscgkkJtZ8p2
         /iOyGAxSXLD4V2ywpt1UldwBUofMhUnTnoJOAEWIN9Wj3VqIrmIe1EqHYq9W4Yz2QorZ
         cxV/G0PZ6ESTw5rSEntq5h/R/ZAwoVQ0TVrMYq6e6O4rk9K4koSP3sL6Zuzmmj7yMXg/
         +LBJk/XQidXrzLDD9WflKpLnoE3EB6aRmDoVxsASkA0XWHA9CJj7Z5jZFBw893QpxQhM
         bH9A==
X-Gm-Message-State: AOJu0YxXOC2E8c19XHHFKfDJy/nBZggUgEC4DPA9ijgWQuYglxv2aqSb
	0mdxqIYkRTd33TxJ9WqctpNqCO5VwSZmyvk16dBA7NZyxYKi2dmUjYrPao8W6A==
X-Gm-Gg: ASbGncuE/UbAxolSvdwVH98XAuvTNY5RqcpJUEy8MfKDqG6fRJbQJAWPLDZJePt4Epe
	H5+SC3KDlTVyfkTXXbiIWw5BbG10+hJ0CBPwa/ij1kvoM/08Hg+3dth3lXAaHPuA9CX+V0GegtK
	26ezA1VbeJ0prmY0ktTTl8GPOpOWq59Nyzh/GIbIPi63EE8m5YVOGCk8vYeYM+VXl71i+zjvleQ
	s9xsj/4FYXUuOGqgT748Ly7amEpR/etFqqANRlove0zKeQaBKVtVdJ93Sn3G8GOvO3tCDGQ4erJ
	nYHDFH7k8cVb+OjgZWx8ulYnRwpivBKoUXphImoj4r1ViLSbrfw0lJlvqOMbKB59ksZ09XJLayq
	Uz7JD0XaIe3RA9Jp1EBVsIaCQuCzVOQsnxjIc8Bzo/D8spm/vlA==
X-Google-Smtp-Source: AGHT+IHrk0BokgmR76KgxthvytDivGsyKqRqKTEDwL5BoGyF1r1DM7RAhjCSe0J+F4KVo1cyjFhyaw==
X-Received: by 2002:a5d:64cb:0:b0:386:1cf9:b96e with SMTP id ffacd0b85a97d-38c520bcb9cmr8097108f8f.55.1738305760553;
        Thu, 30 Jan 2025 22:42:40 -0800 (PST)
Message-ID: <36708a3f-2664-4b04-9f5d-f115d362d100@suse.com>
Date: Fri, 31 Jan 2025 07:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
References: <cover.1737452864.git.Sergiy_Kibrik@epam.com>
 <2e8b9c5390019ef66610a21d9a8744282e2badeb.1737452864.git.Sergiy_Kibrik@epam.com>
 <CABfawhkw-MDvVnfgTi44YHA9JYSkzFS6VkdtLdH33big9BcHdA@mail.gmail.com>
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
In-Reply-To: <CABfawhkw-MDvVnfgTi44YHA9JYSkzFS6VkdtLdH33big9BcHdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.01.2025 01:33, Tamas K Lengyel wrote:
> On Tue, Jan 21, 2025 at 5:25 AM Sergiy Kibrik <Sergiy_Kibrik@epam.com> wrote:
>> --- a/xen/arch/arm/vsmc.c
>> +++ b/xen/arch/arm/vsmc.c
>> @@ -330,7 +330,8 @@ void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr)
>>      }
>>
>>      /* If monitor is enabled, let it handle the call. */
>> -    if ( current->domain->arch.monitor.privileged_call_enabled )
>> +    if ( IS_ENABLED(CONFIG_VM_EVENT) &&
>> +         current->domain->arch.monitor.privileged_call_enabled )
>>          rc = monitor_smc();
> 
> Why not wrap this entire if block above in an #ifdef CONFIG_VM_EVENT?
> I think it would be more explicit what code is being compiled that way
> instead of just relying on the compiler optimization to take care of
> removing it.

Well - we generally prefer things being written this way, where possible.
This is to keep as much code as possible exposed to the compiler no
matter what configuration. This way the risk of bit-rotting is a little
lower (e.g. when making changes affecting such a piece of code, but not
noticing the need for a change because things compile fine in whatever
configuration(s) the person tests).

Jan

> The rest of the patch looks fine to me.
> 
> Tamas


