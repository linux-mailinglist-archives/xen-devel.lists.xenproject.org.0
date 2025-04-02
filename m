Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B6FA78B24
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:33:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935396.1336815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuTM-00060R-2L; Wed, 02 Apr 2025 09:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935396.1336815; Wed, 02 Apr 2025 09:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzuTL-0005zG-Uz; Wed, 02 Apr 2025 09:33:23 +0000
Received: by outflank-mailman (input) for mailman id 935396;
 Wed, 02 Apr 2025 09:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzuTK-0005zA-PQ
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:33:22 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 840b5770-0fa5-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:33:20 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso42747715e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 02:33:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6589e4sm16652693f8f.10.2025.04.02.02.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 02:33:19 -0700 (PDT)
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
X-Inumbo-ID: 840b5770-0fa5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743586400; x=1744191200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MeCf6n989tXLOJZFpJnmN0Q/GEGGOoSiAkvUxACvkTs=;
        b=R345YPZODtBcO1ydXv3HA+EN0J7YfCa0VrNdlu3LM+KdxOEM/m4Mxz79fAROkR5Dz8
         v0nt4e9ypjGaWJNXfiRy/mv7kxZJypO64eKS0jeb1qyrpf7M4XJr5x7S5zqEYIROwDy0
         DJWoQEDvFYTiAHYKoIa8coy24WN7EgglIh9OhCfbqfuWt2hGtJpi++kztbYCx3Cd/loO
         bu7uY8uZyJ7t/CD4cl5GzrmKbsvsLADWnakH1ePBYsssP5X4P8qfvL/yNDPTFSO8M2XG
         aCPkHyzJzcDcSI47IbyF6igKnL1TLHzDQ1xkii7wsgN+2gaY8BHYTcL+ciXgVVCejyjD
         dGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743586400; x=1744191200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeCf6n989tXLOJZFpJnmN0Q/GEGGOoSiAkvUxACvkTs=;
        b=qDW9BtasnNq/ksuPyYCNfOrBi3nfAvfGGXtQkV2qXO1TcxqyLwxPSiTpOKYI+B8zKZ
         P9NKR+OAXIzgmXieDlja53a6HU5SaJccOq/uoo/X/6f0T8Twc31bFtd+tevTxtjoswLh
         0fi+ivUzczeRyF/QRM5JgAHUxf+8m4qpDkH/VNJQ80brFqWhUlSzXe5KVnf8OwhtWxY+
         lY7S8gg3gMdyi8lZHbvTNGuHaqi2QfTJhDsi1970Sy34B8t3sE/4F+6pZAOCGBUoQIxW
         fMHrQtxCNc9312BPHOMoHaA8zuS4VhGp4+GPzVZA9FzNF2zJP7ZPsSdwAJPmULKQkKG1
         v7EA==
X-Gm-Message-State: AOJu0YzPg3gmScQhcVulXqlhl+uuPLjIE7vqskB0aPlvch1LvfSHiRc1
	0fDfl7EbJS8SyGCL3FbXhuPXU/24tKmLkEleAZCM6S9byqvm6Nb94On+JMwdgA==
X-Gm-Gg: ASbGncv07Ogup/YlCrADxrxX2fmh04fo2Vch39J44iSxEGiMV+kt98Z+BbRp5zq8X6X
	+/D/bmTvCBpKYj55HLmbPiCptyJHTYf9SqRNKll80660ytU5lJybe//Q8zMCVxqelCKmdzV0bOt
	5Z6HCDH2QpOCzhX5Hc+FtfRJJmUpr/IkCqs6OTQBAb00EHCarAZqUR9nVtvQ9LT6Ilde2a0d6R9
	FohlSLEJOFErCAHieCdvHanax62gtetkaGwCZfin86uwNN38PVFCSE2mrrGtZSRhxGoGuglpBvO
	IJazF6wC+JiPkdLa/fpuNDNxu6PBK7ekzTcl+oFj9B+kUHD7PN2mQ49AMj+K2bQw7m+wd0gdeif
	8/J27+KuhJd29pDzQIlPVDD4J3KBhMA==
X-Google-Smtp-Source: AGHT+IH+twusrWPZo08mPCvhSf9OkIeFlwbB7n1v6KtGQFRD6Hj2CA/V+OuUsEKticEaxX4yWsyIJg==
X-Received: by 2002:a05:6000:210d:b0:39c:1257:dbab with SMTP id ffacd0b85a97d-39c1257dd00mr9578013f8f.59.1743586400325;
        Wed, 02 Apr 2025 02:33:20 -0700 (PDT)
Message-ID: <a6264b70-5880-42a8-96fb-bc0d69785227@suse.com>
Date: Wed, 2 Apr 2025 11:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Domain IDs and Capabilities
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <0dd25ebd-34f2-4391-aa08-3d873ec72347@amd.com>
 <cc53bc20-51f4-49f9-b35c-77805147e603@suse.com>
 <8e2ecb31-6fea-46b4-b236-65a663510973@amd.com>
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
In-Reply-To: <8e2ecb31-6fea-46b4-b236-65a663510973@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 19:32, Jason Andryuk wrote:
> On 2025-04-01 04:07, Jan Beulich wrote:
>> On 31.03.2025 23:46, Jason Andryuk wrote:
>>> It is useful for a domain to know its own domid.  Xenstored has command
>>> line flags to set --master-domid (the local domid) and --priv-domid, but
>>> it would be better to autodetect those.  Also, domids are necessary to
>>> set xenstore permissions - DOMID_SELF is not supported today.
>>
>> Setting permissions for oneself?
> 
> Any call to xs_set_permissions(), AIUI.  Say you have two domUs, dom1 & 
> dom2.  dom1 wants to create a shared xenstore node with full permissions 
> for itself, but read-only permission for dom2.  dom1 needs to know its 
> own domid to set the permissions:
> 
>   *  struct xs_permissions perms[2];
>   *
>   *  perms[0].id = domid1;
>   *  perms[0].perms = XS_PERM_NONE;
>   *  perms[1].id = domid2;
>   *  perms[1].perms = XS_PERM_READ;
> 
> perms[].id doesn't handle DOMID_SELF

That is, XS_SET_PERMS only ever fully replaces existing permissions, rather
than allowing incremental permit/revoke?

Jan

