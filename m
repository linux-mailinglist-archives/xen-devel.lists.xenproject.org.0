Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014A8C57C4
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721557.1125054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6swA-0006ov-47; Tue, 14 May 2024 14:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721557.1125054; Tue, 14 May 2024 14:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6swA-0006nL-1N; Tue, 14 May 2024 14:15:26 +0000
Received: by outflank-mailman (input) for mailman id 721557;
 Tue, 14 May 2024 14:15:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6sw9-0006nF-0I
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:15:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6794a4da-11fc-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:15:24 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59a0168c75so43043966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:15:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17cc5sm719942666b.205.2024.05.14.07.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:15:23 -0700 (PDT)
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
X-Inumbo-ID: 6794a4da-11fc-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715696123; x=1716300923; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1GLDoU14y5eUwMiaXoQUSfTMj41T6Dyac8dRbqUddk=;
        b=cHJmjORC3XKGoWUeTSoPVj1tqc7aCJ3bVJ5M6CXee40iwtAh5QFxAwDWK+YnxB3k19
         4Zypxt56j9wak90yVRwouKTi5tdYCt/+U4rsOAre6T2ZgvxzVb0BxkM7ERtBHRWDRfXY
         98SbBx66dQNyx33IoiEy8njpPU4t5539vLl1DJ9y67E8nPv1ZFlrq61YcLXJ7G7OHXKu
         FHnLLgRvFjP/C1B2EGqchgakusMZDFUIGNTG9f6HpPVRla860ggVu0cUuJbaJ8W2gf5s
         QC4AX4ixJsCC8snSC7zqDkK4FZmubIak8pqOwkiYrgdlH0BZLEdvN2T4jDmzm/AnaAjs
         Z/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715696123; x=1716300923;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1GLDoU14y5eUwMiaXoQUSfTMj41T6Dyac8dRbqUddk=;
        b=OWlGg46BtGYePNT11yu80OaUuhIkwZDd9XV9jQ8owZtv2wKYUL5bAlRAey9LotANAA
         bm0RWYE7SpDVUluQA7vVt1sphhF8wCYSqutRozfYmYBr5hxrHrib47aVwf14OV9bsBFD
         bfKuS81d/FGGE2dgQaA12fRAKBROzryGvfwUdDI4e/gMVIMcsSZkQqTp4SeCZqGA2edc
         iLsyh6DkfUVkdJmqggvFwVNfsQ49YJaH3D01RJmGjZtvTaiabYj21WRgjXQutjBxQljo
         LaAbRvFDE/5RXYKDZQgQ+P79fIusWViCRUmXi2W3XG7uEcHtmopPdMo5Fp6kF/cghUHl
         qpEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCVz4WCWKJO5IlsmBHnneP5Z2PqeHQ9iSWshbN1xU7gCD1x/kVU7vzwZjhzEuA6V4Cd2SA0NjQbxPLRMSrhwJT50LUlnWTBog+P+BsdPE=
X-Gm-Message-State: AOJu0Yxy0flG2itPF3e93YtxPeZFURprb4Jjn+UUP5w5WdwtsISvgRE2
	SOMYnFz6jQ2DF5qRTEGUsIAK6QltmLl+myfMxevN7LKMWcVFX1nJqJ9SKWSbFQ==
X-Google-Smtp-Source: AGHT+IFzhraK0ytrSmu2exG+GvhWAovJoylge2mhnUmJLeUs4iBiERVceC8XgJW5wGqSXHuG+0HjaA==
X-Received: by 2002:a17:906:2dd5:b0:a59:c728:5430 with SMTP id a640c23a62f3a-a5a2d677dc0mr837681066b.76.1715696123383;
        Tue, 14 May 2024 07:15:23 -0700 (PDT)
Message-ID: <a93c9b9b-4066-4ffd-9c61-73301044a3ab@suse.com>
Date: Tue, 14 May 2024 16:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] tools/lsevtchn: Use errno macro to handle
 hypercall error cases
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <8bde5ee38597a86334b86822de920802483a7179.1715100071.git.matthew.barnes@cloud.com>
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
In-Reply-To: <8bde5ee38597a86334b86822de920802483a7179.1715100071.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.05.2024 13:04, Matthew Barnes wrote:
> @@ -24,7 +25,18 @@ int main(int argc, char **argv)
>          status.port = port;
>          rc = xc_evtchn_status(xch, &status);
>          if ( rc < 0 )
> -            break;
> +        {
> +            if ( errno == ESRCH )
> +            {
> +                fprintf(stderr, "Domain ID '%d' does not correspond to valid domain.\n", domid);
> +                break;
> +            }
> +
> +            if ( errno == EINVAL )
> +                break;
> +
> +            continue;
> +        }

Hmm, I'm not sure "black listing" certain error codes is useful. I'd have
expected a "white listing" approach, special casing just EACCES and EPERM
(which iirc is what XSM would return). I'm also not convinced of the
error message text of the ESRCH case you special case: There are valid
domain IDs which still cannot be used with rcu_lock_domain_by_any_id(),
e.g. DOM_IO and DOM_XEN.

I'd be curious to hear what others think.

Andrew, ftaod - this is the patch I've mentioned in reply to your revert
touching evtchn_status(). And as mentioned there - lsevtchn should never
have outright bailed on _any_ error it gets back (i.e. even ones coming
from XSM).

Jan

