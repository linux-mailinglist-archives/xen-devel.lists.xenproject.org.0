Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D8A14A0F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 08:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873886.1284802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYghd-000186-3P; Fri, 17 Jan 2025 07:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873886.1284802; Fri, 17 Jan 2025 07:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYghd-00016L-0W; Fri, 17 Jan 2025 07:23:37 +0000
Received: by outflank-mailman (input) for mailman id 873886;
 Fri, 17 Jan 2025 07:23:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b505=UJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tYghb-00016F-Of
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 07:23:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f43d95e7-d4a3-11ef-99a4-01e77a169b0f;
 Fri, 17 Jan 2025 08:23:31 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso16451125e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 23:23:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c752910esm85600795e9.28.2025.01.16.23.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 23:23:30 -0800 (PST)
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
X-Inumbo-ID: f43d95e7-d4a3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737098611; x=1737703411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IJkQQXkSc73VEbb4qnL4cwBsQbLzEFyJJDAPga3driA=;
        b=DXwSRTgpO3C/4DEH76EfoHYdFEy3UqShPCvyQyLYhRF+UGsFl3lgwza3SPxDTMQPwg
         1wGWKXL0KkNJDzJsax658ABQyDfT2BZZoxjQBwfJpLdTQmh0Q1osfeh3HdRBeIGkcRKU
         mPyi/8tgBPNSSTG82G3LsM3Elcq2Z+BP2kBV+U5CVrdGVK6lkPWjU8pcmJN57bTQb8ZA
         pcmi12hp+8QPaMyzq1DlHMI2hGypa2m6HIcXXDcnb7iB8TDjRF9/8nuU59n3ThfnZT65
         ZoWc+gXK70Pd5AWX/2iOSJRycvgr59wmI9+voHhcMmIAPGFR+dJyCH1jTaxFX4a8auVm
         fzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737098611; x=1737703411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJkQQXkSc73VEbb4qnL4cwBsQbLzEFyJJDAPga3driA=;
        b=hhhpbhiaqzIPPNVLLDiDfpn6tGizS+KNqbqBh6joXjxohBZtki07vQNvLs3//rp/+y
         dZU23IWi5OPOx51iegTg3sT9Ng6Q5LA9uy6466ZYfeTKRkbG2QB8mNu7P39hc+z//Kzr
         AhwgaH4pn0xlFK17zXbCO/sDvMJLLqKUf9B8fhYd9BKpMYcNo/n3k+rW1CPHJizgt/Q2
         MrASKUIAuD52YAod+MA2MijNz/nZC+gXd/+ukyvm8pABY+HvGrVSzePDz4OO1Db1NFz6
         JMyclDXO55ryMifoOKHoQOIqLzu4lryRMhZQddaxvQax+207VD4gP3lfi1A7RWikHbh1
         jWUg==
X-Gm-Message-State: AOJu0YzuVMrFI1S5ab/RJN5Xkfgz+w2RYtQIw0iLqd0fqafk16BFhQXe
	KOOIYcxAJE7yH+4k+fqmlm8t81Aycshi/51OJA+XJcYj21rcf1ua15eerrAwoA==
X-Gm-Gg: ASbGncslLdPkctrZoG1elGC0HMrjmPlZjHZZZTP8gngpg+4mbHVcAkfUvu/cIMHSoVn
	MlsuKekrUJbcsKve5S2NiQstGW4LNfbJkbtL7OnaHjBkPsz7Ken93xKg8Sani/2Kluj32VYxFD8
	FB9W1Ok04iofLdi4Db6yFGIJmaUNia/lJ/+pkO2JmBdydBe89DmxEIch1Xyg1vPBkiUtmqlUisU
	dO6KiSHOFO18BpaSfQ3TqJ/Ak8rTmb4laY64g7zH+t4eLQParM5VKWRU5ox8JVfJ3G11z73mD8o
	aDdEvUHSBfl0wqcEuLOXMeI0q4C0T4z9Re36fZsqGw==
X-Google-Smtp-Source: AGHT+IFGRZVGhg+yXHTXDsh9nXaJk4/mMSWvEdaWpaihb/28Oj7LdRKX9riLRoFaQ5t9IYubZy6wcg==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr14740705e9.0.1737098610924;
        Thu, 16 Jan 2025 23:23:30 -0800 (PST)
Message-ID: <afe1350b-249a-478c-ad27-7c1c80ad3558@suse.com>
Date: Fri, 17 Jan 2025 08:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, sergiy_kibrik@epam.com
References: <da5f5bac-6d5d-092d-d872-f1120dcd2661@suse.com>
 <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
 <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.01.2025 01:31, Stefano Stabellini wrote:
> On Wed, 1 Mar 2023, Jan Beulich wrote:
>> While we want certain things turned off in shim-exclusive mode, doing
>> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
>> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
>> a result. Yet allyesconfig wants to enable as much of the functionality
>> as possible.
>>
>> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
>> C code using it can remain as is. This isn't just for less code churn,
>> but also because I think that symbol is more logical to use in many
>> (all?) places.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> ---
>> The new Kconfig control's name is up for improvement suggestions, but I
>> think it's already better than the originally thought of
>> FULL_HYPERVISOR.
> 
> I think the approach in general is OK, maybe we can improve the naming
> further. What about one of the following?
> 
> NO_PV_SHIM_EXCLUSIVE
> PV_SHIM_NOT_EXCLUSIVE
> ADD_PV_SHIM
> PV_SHIM_AND_HYPERVISOR
> 
> This is because I think the option should be tied to PV_SHIM. Keep in
> mind that users are supposed to be able to use "make menuconfig" and
> pick good options based on the menu. An option called UNCONSTRAINED or
> FULL_HYPERVISOR or any other name that has nothing to do with PV_SHIM is
> very confusing to me.

Hmm. That was actually something I was specifically trying to avoid. Imo
the connection to the shim only wants making in the help text. And I fear
I view all your naming suggestions as hard to grok.

Jan

