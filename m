Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5879BA260A9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880939.1291041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezmX-0003FR-W5; Mon, 03 Feb 2025 16:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880939.1291041; Mon, 03 Feb 2025 16:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezmX-0003Dh-TH; Mon, 03 Feb 2025 16:58:45 +0000
Received: by outflank-mailman (input) for mailman id 880939;
 Mon, 03 Feb 2025 16:58:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tezmW-0003Db-HT
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:58:44 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20058003-e250-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:58:43 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5dc7eba78e6so8540691a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:58:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ff98bsm790120766b.101.2025.02.03.08.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:58:42 -0800 (PST)
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
X-Inumbo-ID: 20058003-e250-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738601923; x=1739206723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OSbrmsg7FjY0BHPsbHWpDr6/AeUrQW1H3rWcZb4hqfU=;
        b=buGSYNnm2/XXoWt14vfKB5cVZSGTUiiZlVW4NxLHvIJfOspUo6F5NkVQDSwS8BL/kp
         RLx1zGlWWRN5xxNerjf5hGbweN62jqx1zez2Qkkwi34/mYlIU/QuSJF2kkpOu/1cekmN
         YllStMi3R7zicAp43tRJoE9Vr3/mJtUBJixqL3HeQL6//Js5XT3CKOsr0phyYwfQeqSc
         bvx3APdOfs91bkcwdfUi7fUxg+Vw4uY2syi6mYjL4hlHEDHQCACo0ivsH+8fmsm+FveJ
         ZyD9pMSm6KV01BFRUo2cLHxMzwY1HcykQPgmXmb7rFM/6Lhtg/jdSQEdvrn9yyON15rv
         PqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738601923; x=1739206723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSbrmsg7FjY0BHPsbHWpDr6/AeUrQW1H3rWcZb4hqfU=;
        b=sDHfOYMHI/9dxCkiCDFv67TV6McGLjm+lNj830ynR3yX/0KWHWLPswOMzP/D4G3JMJ
         O9bhXLO+UwZlG4XPQNjKrrN2l0cgwntmI5imRuzx+d9d63RZ6Z2iVPCAxYrYydjO8CSm
         6ZcHZw4uWMNsuQWbUYmTF0ltvEsWWEfB9qzqiIgmVnWp9L/vEYJvaIEXJDKWVh4bVwTv
         bFMlnLCh+j22iyZKA1RiuseNsCND1CCZVxaNxAmw4Kkyis9BS9pCExQgKAHW3H9w5Km2
         i0FZWqxRsaQQxZubL1LBlpSX8uI1GRTjQHBy7VDOUBsKAmlpRPskuvLEPOWOXLsqOqOI
         aRBA==
X-Forwarded-Encrypted: i=1; AJvYcCUniYtbMqn0fFcBNc6rJu65+NNFc52BVUV7+Q5EJj/iIPWzqzYV2vhlhLVHERL/Vv04Z2IGcludVXk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHd6ASJyR+jBS7wCMRM/Az86zEZrJmZ5y6mWsQZY2E+JA7UJzK
	4edUp/vwJ2D5IiRX9ZS53ca4u5RZB+1XAKbqvpN3g1aQW0xscWvchhEAwnaZjg==
X-Gm-Gg: ASbGncuFLRWgzXYAa6IkQy9za6yVO2xEbb4bZNbQS75cudRH8NgHY52Pz9fXLEtLslr
	rv8EAjj4ruhScQHEOTBxwfW4KCkRZpbv/MBcPZisgoRwt/HqKrgO3fVywiH0sTYNNRGcUcJJDeE
	f1ZEPY7QumHO7uCRmADLQ2GU4790AefdztqRpKsNCmDXKYyKR34vecyjlK6V3PmVpAvJoUff0pw
	sV5KEl5uP1h4CSP4l+ubHKIrnLGiT59hYMzpLjEJb6BsweywjnyJMhGbaWOxTJ2iPqvgGaGp2gJ
	H1AYvWUiuJYpcmcgMiqiZfv+5xb2F3PCSff0G0vot9zRvOI7EtcSCMW1Y3ZeftlEk8wlKIN/SRX
	o
X-Google-Smtp-Source: AGHT+IEosuQe8379ioXWqiH9NYmVH79LZfQfPaKb422p3A9hYnV5aQZPnMdM2LYAm1gcUvVJfSbH5g==
X-Received: by 2002:a17:906:6b17:b0:ab6:d575:9541 with SMTP id a640c23a62f3a-ab6d57596fcmr1974151166b.19.1738601922986;
        Mon, 03 Feb 2025 08:58:42 -0800 (PST)
Message-ID: <3facc3f9-fd75-49f9-aa8e-ecee3c67dc80@suse.com>
Date: Mon, 3 Feb 2025 17:58:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20? 5/6] radix-tree: introduce
 RADIX_TREE{,_INIT}()
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
In-Reply-To: <528e3341-45ce-4e82-bdb5-ee3dc72a6925@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.02.2025 17:48, Andrew Cooper wrote:
> On 03/02/2025 4:26 pm, Jan Beulich wrote:
>> ... now that static initialization is possible. Use RADIX_TREE() for
>> pci_segments and ivrs_maps.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'd not considered having RADIX_TREE() but it's nicer than my attempt.
> 
> However,
> 
>> --- a/xen/include/xen/radix-tree.h
>> +++ b/xen/include/xen/radix-tree.h
>> @@ -72,6 +72,9 @@ struct radix_tree_root {
>>   *** radix-tree API starts here **
>>   */
>>  
>> +#define RADIX_TREE_INIT() {}
> 
> ... this ought to be (struct radix_tree_root){} so it can't be used with
> other types, and radix_tree_init() wants to become:
> 
> void radix_tree_init(struct radix_tree_root *root)
> {
>         *root = RADIX_TREE_INIT();
> }
> 
> instead of the raw memset(), so the connection is retained.

Can do; in fact I did consider both, but omitted them for simplicity.

> Assuming you're happy with these adjustments, Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com>

Thanks.

Jan

