Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262AA26D5E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 09:36:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881176.1291299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfEPp-0007lb-6l; Tue, 04 Feb 2025 08:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881176.1291299; Tue, 04 Feb 2025 08:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfEPp-0007j2-32; Tue, 04 Feb 2025 08:36:17 +0000
Received: by outflank-mailman (input) for mailman id 881176;
 Tue, 04 Feb 2025 08:36:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfEPn-0007iw-W8
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 08:36:15 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17fa0bc3-e2d3-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 09:36:14 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5da12292b67so8778949a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 00:36:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7de5sm886951866b.35.2025.02.04.00.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 00:36:13 -0800 (PST)
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
X-Inumbo-ID: 17fa0bc3-e2d3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738658173; x=1739262973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A7W9dNNIJ/E90zFfd3itcAHh0zJAiyR9Ildvu2AFR+I=;
        b=S8f2vgOLhWcn3tX6CTjMo027WYZMlkSAAuOkjZVPvI4ws51zgrd+jb+Cm5GzcFYrSK
         TqVztTO4oqZUPUa/SXMgCih5Gxridt8A5BX5WG3PEUOmak/Kxb+RXoYXqkM8n12BVWgm
         pnRyV09wvmfFddx9kxL7M2T1KoA65ZzzRHlyqyH6qaR+P2TzGd0p8JICRITAUxbnJXsd
         clTZJ4n4fuIDhZ8o/egorQN0Wezpx+jJeqcjCL/g/a/6PL4a0+EbUydaZj84T0dtiFxz
         i/PKUptFyi8FJTdMYTMhwEb+iYqirPpxU1OpCLxamWOPmWsZIUW55nkeIiVdDQkNzczd
         7C5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738658173; x=1739262973;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7W9dNNIJ/E90zFfd3itcAHh0zJAiyR9Ildvu2AFR+I=;
        b=fjtDO0gifCE73EdAj5d0nfzrZ8jzc56/D3LMHqF4QwE9iPwfPSIBshRIvZ1o0jlpYf
         uBiLnJR6Rrnv5Y++6LgrUSnXfQkw+jLI//3/joZqYkEWC+jH/F3hHgpgGbuIhGnWl4HT
         sKfKdpSUt94HuWQGaU3SZ//PGFdNhuaulykbtPo74MXjdov85QAK9jU5oN1HfuqHrQme
         mGVYhAUZ+V/gY50vrQrYv2/ha7sCXE7UxHrAegVeLBoATVl7Lsa8czCgA9wlFqZoFWIK
         WXj9L2VCEFT7I77M8Roab397jr8+30P31ORql7UH6gOe6QnxEqWGOOXlXRlMwQcwXeJ+
         e6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR02N5n3ORMH05kQBNx92XxQJOxyHp9CAb/O5QuYbYz0LadeAeBmzWemo9RmVro6crhlOgtz0QsiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyV5SGOqvszHnl3/cOFMNLCIP7vQuDy/2QYX0l2BQkNaLKli3ut
	fE79RM9KX5o5lyCTE2UqVabXhlajKoDrSGQPbPM7EksgLqBQ63jimdEIzo7hYQ==
X-Gm-Gg: ASbGncsNiEJkLv7Xad5JSgid8rTsrpJzPuHMct2SAUx3nAkFYYbUEfbVksICWnRaYbJ
	so0BhzfibhBPcBPpdrRdzfL3ocyy0KHQmRSC72Oav3MN1zsR7VIPFaW+lCQhcVhBzPkkVCGHOvm
	nwyg8ZGrFOYo7sC+Peh21HOp4nCh+BSheom3160JNGqA73CeT0pKSQRmhOUzLYw9H5cwHrm5MR/
	GHnnB6fptU1zff6K2tAyTSv4bsWnZi3oq5toOzLYku3bzZJwD+l/DdWPOj9h13MglQ6zQbBjI12
	ptL406HjLrtxj+wWTbU6EQuQGNsHMzJ/dfYLxUR9qeHROop27OwCGWBwq5Zo+mDNkpPsFjX+Crk
	l
X-Google-Smtp-Source: AGHT+IEoiJer9Bphde+1vOl48rG2mo++5Mj8/w5sHE06g2IpO9cgSwcPZV/xuejPg6UFjkS6LgXqCA==
X-Received: by 2002:a05:6402:1f8e:b0:5dc:caab:9447 with SMTP id 4fb4d7f45d1cf-5dccaabca8bmr2603028a12.18.1738658173461;
        Tue, 04 Feb 2025 00:36:13 -0800 (PST)
Message-ID: <a75d8a6e-bdb5-4bf9-a94e-073f630d5c69@suse.com>
Date: Tue, 4 Feb 2025 09:36:12 +0100
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
In-Reply-To: <3facc3f9-fd75-49f9-aa8e-ecee3c67dc80@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 17:58, Jan Beulich wrote:
> On 03.02.2025 17:48, Andrew Cooper wrote:
>> On 03/02/2025 4:26 pm, Jan Beulich wrote:
>>> ... now that static initialization is possible. Use RADIX_TREE() for
>>> pci_segments and ivrs_maps.
>>>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'd not considered having RADIX_TREE() but it's nicer than my attempt.
>>
>> However,
>>
>>> --- a/xen/include/xen/radix-tree.h
>>> +++ b/xen/include/xen/radix-tree.h
>>> @@ -72,6 +72,9 @@ struct radix_tree_root {
>>>   *** radix-tree API starts here **
>>>   */
>>>  
>>> +#define RADIX_TREE_INIT() {}
>>
>> ... this ought to be (struct radix_tree_root){} so it can't be used with
>> other types, and radix_tree_init() wants to become:
>>
>> void radix_tree_init(struct radix_tree_root *root)
>> {
>>         *root = RADIX_TREE_INIT();
>> }
>>
>> instead of the raw memset(), so the connection is retained.
> 
> Can do; in fact I did consider both, but omitted them for simplicity.

Sadly I've now learned the hard way that the former can't be done. Gcc
4.3 complains "initializer element is not constant", which - aiui - is
correct when considering plain C99 (and apparently the GNU99 extension
to this was introduced only later).

What I can do is make this compiler version dependent, adding type-
safety on at least all more modern compilers. Thoughts?

Jan

