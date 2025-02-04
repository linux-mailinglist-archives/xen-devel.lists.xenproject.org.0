Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2FA26D7D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 09:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881187.1291309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfEYo-00019u-3N; Tue, 04 Feb 2025 08:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881187.1291309; Tue, 04 Feb 2025 08:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfEYo-00018Q-0X; Tue, 04 Feb 2025 08:45:34 +0000
Received: by outflank-mailman (input) for mailman id 881187;
 Tue, 04 Feb 2025 08:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfEYm-000184-Ai
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 08:45:32 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 637a7009-e2d4-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 09:45:30 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5da12292b67so8792864a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 00:45:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab702d70c8fsm658848066b.161.2025.02.04.00.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 00:45:29 -0800 (PST)
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
X-Inumbo-ID: 637a7009-e2d4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738658730; x=1739263530; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PX7Lq7jODcKGGWk2JCfiSnKjkwgzt1qvAZgkhzfOMBk=;
        b=BM+DI/wtFBqckm6u3ontby4uJwPKW/1N2b86A5fzI+yxluTuHWBEMRA/EDlvWmKChs
         XFuMGL1QtK6x9QxGbJXuO5YYweCuaKKXm2Zd+78R2Db6qEAn7nssOj4k/OnMwVwguL1y
         iBGgYn6GVqMhomD8/AVbLgkvCi9iOl3id2FfA1aEVsYPsyH1oaDl4edPS0on0lYTNGJ/
         CVbk9MmJ+J8RIsmaoaYPRIUwqQuhmbpIOmqtcA40cAV5ikgwV6UDHBFRVArFFjNnTphQ
         HmJtFr05rpGKK2UjdS3j1+bXRGO1bX3ghqnI6sxP2gfEKpPiYICVYVSI2zHywE7A6856
         f8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658730; x=1739263530;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PX7Lq7jODcKGGWk2JCfiSnKjkwgzt1qvAZgkhzfOMBk=;
        b=HZ1TUu1USFVwbVhjLGZoZN690IpRpozFZjmovnNmwcTfAXxfeRveymTdeVY6NkOokU
         5JS39HtNxEcgOOC2ds4f2oZlGnV6AqfcRdQIhYQwJZGdU7+ZDO2anghIXqKS+/eQJAqf
         xmalOUOQVwv0hz36NheXyBRWriJeIe7hMwYFdj1KUiZZF8lRl4ps9ZfLYvNDN1TOimCK
         Mois3Kgvqlno7x3u+O0K/fJEyCxeTE8s48OP3PWiXJVoikNVEX8MwgZLsq1KPDt4Izwu
         iGNw0slkhuD+k6pFAKH7DUkIqE3C6gLqpr+9HA8jWALXy2prp086911KuJCdtjoBWG9r
         iZdA==
X-Forwarded-Encrypted: i=1; AJvYcCV75eMtfJY+8aOqFCfW18xVVdcRF/7k9eveULmIGwG4lHplpn3IFcPc7F02a7ZSky7M4O2WjNYU5nk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFNDh525tVUYZRV57JgEQ0WvPcNzikPNqBfVqe8AnlSg9t7Eji
	qGummMdPZbWVvV71TGrZJ02M/zhbqEEOs6IpGC4sSTrjlszZ4CXGIprgpIEP0g==
X-Gm-Gg: ASbGncsxQmTtT/TgpP5of3WYJMGS2y44fkzv0SbLb6CzMmwrnoAMC8Yelz2BR48UG02
	4bn1VqLPe4hlSLsH7+O5WjpEA8rnU+di+sDUgSm/AX3d+W8BJx70YmM8feKsjD+02/d0TQfYVWx
	CmBUY7P+G19lefxFAegwrdqQSS9TTELpAoTrJSjoeWDEls06i4klCGk8mHVM7VgQevKMZFAZyCc
	ro7A02aONnpR4Gf53xt29Acj/QkHFwpcbl+8SHFX4c4IOqQWNvcZW9w9jkaBtkRAhKbFof+512h
	+9JhY0mdxnePXyA91ckAvqnIAm3s+qOkyFZY7z6aaSxWYPp97FufCG/Cz+5TfoI1VmQbfHMpyyh
	o
X-Google-Smtp-Source: AGHT+IEdtebNmjBrhcoNjZnYKliOgl+NJTR/DJ3XasNKtlaTBuwqv2c8lpa0C6S7jcj6mA4ko20Zqw==
X-Received: by 2002:a05:6402:3890:b0:5dc:92a9:8af with SMTP id 4fb4d7f45d1cf-5dc92a90a7fmr36004271a12.31.1738658729585;
        Tue, 04 Feb 2025 00:45:29 -0800 (PST)
Message-ID: <d3a0a617-d744-4822-968e-48980c11a841@suse.com>
Date: Tue, 4 Feb 2025 09:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 5/6] radix-tree: introduce
 RADIX_TREE{,_INIT}()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <bd8d65e6-e887-4afe-8ff0-df86416fa869@suse.com>
 <528e3341-45ce-4e82-bdb5-ee3dc72a6925@citrix.com>
 <3facc3f9-fd75-49f9-aa8e-ecee3c67dc80@suse.com>
 <a75d8a6e-bdb5-4bf9-a94e-073f630d5c69@suse.com>
Content-Language: en-US
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
In-Reply-To: <a75d8a6e-bdb5-4bf9-a94e-073f630d5c69@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.02.2025 09:36, Jan Beulich wrote:
> On 03.02.2025 17:58, Jan Beulich wrote:
>> On 03.02.2025 17:48, Andrew Cooper wrote:
>>> On 03/02/2025 4:26 pm, Jan Beulich wrote:
>>>> ... now that static initialization is possible. Use RADIX_TREE() for
>>>> pci_segments and ivrs_maps.
>>>>
>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I'd not considered having RADIX_TREE() but it's nicer than my attempt.
>>>
>>> However,
>>>
>>>> --- a/xen/include/xen/radix-tree.h
>>>> +++ b/xen/include/xen/radix-tree.h
>>>> @@ -72,6 +72,9 @@ struct radix_tree_root {
>>>>   *** radix-tree API starts here **
>>>>   */
>>>>  
>>>> +#define RADIX_TREE_INIT() {}
>>>
>>> ... this ought to be (struct radix_tree_root){} so it can't be used with
>>> other types, and radix_tree_init() wants to become:
>>>
>>> void radix_tree_init(struct radix_tree_root *root)
>>> {
>>>         *root = RADIX_TREE_INIT();
>>> }
>>>
>>> instead of the raw memset(), so the connection is retained.
>>
>> Can do; in fact I did consider both, but omitted them for simplicity.
> 
> Sadly I've now learned the hard way that the former can't be done. Gcc
> 4.3 complains "initializer element is not constant", which - aiui - is
> correct when considering plain C99 (and apparently the GNU99 extension
> to this was introduced only later).

And then I can't use RADIX_TREE_INIT() in radix_tree_init() anymore. All
quite unhelpful.

Jan

> What I can do is make this compiler version dependent, adding type-
> safety on at least all more modern compilers. Thoughts?
> 
> Jan


