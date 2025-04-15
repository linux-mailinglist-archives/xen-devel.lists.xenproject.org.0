Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B08DA893EF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952021.1347606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zm0-0001ya-Kf; Tue, 15 Apr 2025 06:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952021.1347606; Tue, 15 Apr 2025 06:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zm0-0001x6-Hk; Tue, 15 Apr 2025 06:27:56 +0000
Received: by outflank-mailman (input) for mailman id 952021;
 Tue, 15 Apr 2025 06:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4Zlz-0001wr-BG
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:27:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c37f480b-19c2-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 08:27:54 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso36237735e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:27:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43cf42sm13253207f8f.64.2025.04.14.23.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:27:53 -0700 (PDT)
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
X-Inumbo-ID: c37f480b-19c2-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744698474; x=1745303274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RdrnSi/Vd4fjZDRiajwwQokME9zz6KZPZcHritbxGd8=;
        b=GCjboNsAsuiVP3oMxZgs30WfRtlmFxMXmQnl81cLFDHW/GrCOkDDMJ0Kh9+JI5AwnM
         tjqVZfjnxEjep4MzNbEG0+RYsyNS7WP++QSFUprrkGl9gpQfLKb4vftOAxkTSStHNUaa
         /G505BML6OTDMOraVWzNLpdo/gXVewAQ8fnicNDMKXc+35ex2DfOal9kUkqgeeoM23ry
         YNFHUbYVMCVKDsPe5i53vsKbjUloGG/QQ2k2cL41tr5bjX05g8lIC/cBBd6I1X0Wz28O
         euK045e8OqU22CL0ntUqIBXdYR8KbUhhk3fCrJeVwqIJMqtOLLWryyqwjk/IaGvpZBzE
         KXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698474; x=1745303274;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdrnSi/Vd4fjZDRiajwwQokME9zz6KZPZcHritbxGd8=;
        b=Elryswrm42KeOUgl6JzK4JWcwFROT2Td5+U8jh7EaOwjzil2/tlLATOWrzNfc63Qre
         IiOeU/zvRO65lSWltPb348UbW8zTAs6NA5HTKKxAw5ttYpSVtMSi/iKeaWgNiJu2bM5g
         pYEiwnInzGMYX34yCDjBdKPhnazeBjkCRtdFM3taf4nJibM3I2ty5wom5Xy95XBCXi92
         BvpdXOGzlGP/Ox7NrClA0qCrfjWubT688A8wBPVSgtuxtTnLb/4lSCnP9QZb+4TZFfQN
         rAl0U2cfjwXvBvR4pqT3o9xymCFwI4EOJbclRUmWm9RuakD4ekdr13kOQ9JdQNY90Yg1
         8qSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdoJRLqP4vbVt4MFkuW9G8RcABAz74akj/yh5fH2YeJ6mieTnFInfYCgjY8WGWhb9IK1fSSm/gxwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9Uqqc/qGbx2SsC7TmD3HipTGSCN6U8AG35iHWiafR//KhG4To
	XJm5tg+xCcyI2KsRpt1+2RnvPqPLycf7BU7kTEjzDZO2Z5QpOXpU0V0EndMsyw==
X-Gm-Gg: ASbGncvXrRTbaPKjrLAgfY2D2cgntCwPPTCs+ZSq/ubQQNGBAI7GlRlbGqKzRrCEDZp
	lF0ethpsY/AsZl4B8NXYDf9PkLMFlfWZpv25Y4LpC+sEHa2eCb9iQJ9IiPs4HDOZmuCzsz/QYb9
	nJCMpK3UpEdepTSQQgDwBNhIyZkS5S4RfI7Ob77+zmoytyJtm79LFb5FJsraO4BKHPPSERyykXo
	f1Kh7ayzekA3kNJQArUhiMR7QcpYd1Eo7Wd3vqKLhmOEV2lRgSGXTT4qj4/oRUpjTy/pPLcobqf
	kImQdZSlSpwsT/eLcolRFO+B+IKAKVcFvkeES3X0lXGnEGv4Wc4+xXeAjigvTycXeqaeo4wx4Ja
	xHZIhE/1UIifSiyYdhc+UBc0PJw==
X-Google-Smtp-Source: AGHT+IGZiZGwlNzANQL16XcGwCynvcr0pQSJnpUNhYfp+skO5ZhvX3iIEiaSSAJnVD4qq942zEySAw==
X-Received: by 2002:a05:600c:1c8e:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43f3a958fe5mr115510695e9.17.1744698473779;
        Mon, 14 Apr 2025 23:27:53 -0700 (PDT)
Message-ID: <1235d73d-ec62-4223-a92f-7a19d802c306@suse.com>
Date: Tue, 15 Apr 2025 08:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain
 config
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <6ce79cc0-1fec-4ad9-834e-680ef1f81549@suse.com>
 <D96KUGJTQO7F.39OKDX33SSKYH@amd.com>
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
In-Reply-To: <D96KUGJTQO7F.39OKDX33SSKYH@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 20:35, Alejandro Vallejo wrote:
> On Thu Apr 10, 2025 at 12:49 PM BST, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>> @@ -158,12 +159,42 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
>>>  static int __init process_domain_node(
>>>      struct boot_info *bi, const void *fdt, int dom_node)
>>>  {
>>> -    int node;
>>> +    int node, property;
>>>      struct boot_domain *bd = &bi->domains[bi->nr_domains];
>>>      const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
>>>      int address_cells = fdt_address_cells(fdt, dom_node);
>>>      int size_cells = fdt_size_cells(fdt, dom_node);
>>>  
>>> +    fdt_for_each_property_offset(property, fdt, dom_node)
>>> +    {
>>> +        const struct fdt_property *prop;
>>> +        const char *prop_name;
>>> +        int name_len;
>>> +
>>> +        prop = fdt_get_property_by_offset(fdt, property, NULL);
>>> +        if ( !prop )
>>> +            continue; /* silently skip */
>>> +
>>> +        prop_name = fdt_get_string(fdt, fdt32_to_cpu(prop->nameoff), &name_len);
>>> +
>>> +        if ( strncmp(prop_name, "domid", name_len) == 0 )
>>> +        {
>>> +            uint32_t val = DOMID_INVALID;
>>> +            if ( fdt_prop_as_u32(prop, &val) != 0 )
>>> +            {
>>> +                printk("  failed processing domain id for domain %s\n", name);
>>> +                return -EINVAL;
>>> +            }
>>> +            if ( val >= DOMID_FIRST_RESERVED )
>>> +            {
>>> +                printk("  invalid domain id for domain %s\n", name);
>>> +                return -EINVAL;
>>> +            }
>>> +            bd->domid = (domid_t)val;
>>
>> And a conflict with other domains' IDs will not be complained about?
> 
> Hmmm... sure, I can iterate the domlist and check.

Well, just to clarify: The checking doesn't necessarily need to happen here
and now. It may also happen as domains are actually created. Yet then I
think a pointer there (in a code comment) would be helpful here.

>>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>>>          return -ENODATA;
>>>      }
>>>  
>>> +    if ( bd->domid == DOMID_INVALID )
>>> +        bd->domid = get_initial_domain_id();
>>> +    else if ( bd->domid != get_initial_domain_id() )
>>> +        printk(XENLOG_WARNING
>>> +               "WARN: Booting without initial domid not supported.\n");
>>
>> I'm not a native speaker, but (or perhaps because of that) "without" feels
>> wrong here.
> 
> It's probably the compound effect of without and "not supported". The
> statement is correct, but it's arguably a bit obtuse.
> 
> I'll replace it with "WARN: Unsupported boot with missing initial domid.".

But that still doesn't fit the check, which compares the given ID (i.e.
there's nothing "missing" here) with the expected one. The "no ID given"
is handled by the plain if() that's first.

> As for the first branch of that clause... I'm not sure we want to
> support running with DTs that are missing the domid property.

This I can't really judge on.

Jan

