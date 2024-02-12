Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9D4850EC8
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 09:21:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679313.1056732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRYm-0004gx-ID; Mon, 12 Feb 2024 08:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679313.1056732; Mon, 12 Feb 2024 08:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZRYm-0004ei-FL; Mon, 12 Feb 2024 08:21:04 +0000
Received: by outflank-mailman (input) for mailman id 679313;
 Mon, 12 Feb 2024 08:21:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZRYk-0004ec-Qy
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 08:21:02 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a70aba47-c97f-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 09:21:00 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so1892254f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 00:20:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ch8-20020a5d5d08000000b0033b75b39aebsm4590733wrb.11.2024.02.12.00.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 00:20:58 -0800 (PST)
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
X-Inumbo-ID: a70aba47-c97f-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707726059; x=1708330859; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QxAED0Upw3UUaTw/PsXjs9hNGEU9EnOi2nrcGLgAIxM=;
        b=A2W/Ayp0d8nJl3EOjg1Wdd9B2V5omEcVHTSYRKQ5LO8fwkC5h3AK/ePd2jcl6QG6uw
         ASGyDRpZjaCYmnzBhV0/qXMzl8JO6FR8VcjstPqpZuDGOlLBiaQPYSL/YqmsNcbsfv5F
         frpbUIzg7MUBW7p+oheXrYzIMn+J/Oq4SEQltdbp2HLRd9bC5CiHfWTnYb+iVsB6KnYq
         mkia4UC7GOqlYnqu3NYN8qLdYgmQiOa0y/Cd9YojKGydZTxKqaqTnrgwWb/fIB1ikWHo
         YceYoMhA/yrn4sZcVs+QYmgtAptqKgy9OoP0MQLBgzru6tipIC8Y02+TDyoT3LWo8UyH
         u01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707726059; x=1708330859;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxAED0Upw3UUaTw/PsXjs9hNGEU9EnOi2nrcGLgAIxM=;
        b=cfKVZX/je9TQKNFJLQwxVmug88bgVS84yWGDBZQLFnxn8Lk9nYh7/gtBn/CYIPj51J
         XaN6Cp94WZW1fATbwP3rSnLcDEu9DkidRQq+h34TXesYjH83ZmuzhkqE8t2l20GGHKbu
         Ya7v+fp/7LRj5AsggAvwA4QA/uCYGFUUnX5FK33HC4gCAlOcNp3eWeYkqf9L5DcsmRX+
         mZaFBkfUpk1JqgNlsjybov6cUmEyv9bAEL4V0skpzTakLbPwXoI/KrtFmmyRyrFl7VKf
         tEGfjAlO5Iom9V58qGWfXg9bQydA+776Z3N0EdUHB0MBPAlDBjWYzOAFXPk1R0eKZ1I9
         RFpQ==
X-Gm-Message-State: AOJu0YwjtSJHZOyz/UR5Dv8kDWx/TwY2/b4i1KjHDxtdD+rqqSM3Q+hB
	PPPdFxG7sV+CQLOrQAfh2NFkxOl2BmT2cU35F+Un7dqtHUfRHa8u9/y5xTjDNw==
X-Google-Smtp-Source: AGHT+IGx2zqaW6JEG3NSgsQFKqNrjcogYI42tO8A6DBU4NB0ynUvwdNIrwbIB8JjMeTrlCv1lxLjxQ==
X-Received: by 2002:adf:e6cf:0:b0:33b:6d59:61cd with SMTP id y15-20020adfe6cf000000b0033b6d5961cdmr436163wrm.11.1707726059066;
        Mon, 12 Feb 2024 00:20:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0SN4jQE371CBe6vPPZpj768cGL5NO3XajAMUN7PKjOREoPX4nZ75xhifvAosgrZEWz3blgFwb1KUgTHw2dWwzQujdPxmwW+hKEBvWaEknqrJn1dQnVz6ttkUotV72KDV9sV2+4iijJaAG95cdnNC5OK1o6XhWGAD2D6OAhwxK2JKP+fHgsku7/fNA28+ZqeefRbFZgJ8VEH9PxXDmau8xpClwiJHOHb5YDJV9q8nSblwVedZz12Uj03fKIe40BPrD/xj92uP7zNhDjofW8bjB20jQ4BmwUtVzaLjw/ILUNKJllWk=
Message-ID: <9504e77d-6f52-489c-a91a-f4d1a6ce9a33@suse.com>
Date: Mon, 12 Feb 2024 09:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/misra/rules.rst: catch up with accepted rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com, roberto.bagnara@bugseng.com,
 federico.serafini@bugseng.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2402091653110.1925432@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2402091653110.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.02.2024 02:00, Stefano Stabellini wrote:
> Update docs/misra/rules.rst to reflect the MISRA C rules accepted in the
> last couple of months.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> 
> In the notes section I added some info about the deviations, but in any
> case the appropriate info will also be added to deviations.rst,
> safe.json, etc.
> 
> I also added Rule 14.4, which is older, but when I first tried to add it
> to rules.rst, Jan had a question I couldn't reply clearly:
> https://marc.info/?l=xen-devel&m=169828285627163
> 
> I think now with this series, the impact of Rule 14.4 is clearer:
> https://marc.info/?l=xen-devel&m=170194257326186

This series is about enums only afaics. Yet the rule is much wider, and iirc
we had agreed that for integer and pointer types the normal language
conversion to boolean meaning is fine as well. Not only do you not mention
this case in the entry, but it also continue to mean that effectively we
limit the rule to a very narrow case. Which continue to leave open the
question of whether the rule is worthwhile to accept in the first place.

Jan

