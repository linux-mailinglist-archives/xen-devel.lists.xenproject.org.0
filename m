Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDFA703C3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 15:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926576.1329412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5LB-00075X-8R; Tue, 25 Mar 2025 14:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926576.1329412; Tue, 25 Mar 2025 14:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5LB-00072O-5a; Tue, 25 Mar 2025 14:33:17 +0000
Received: by outflank-mailman (input) for mailman id 926576;
 Tue, 25 Mar 2025 14:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx5L9-000723-BU
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 14:33:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c1cdd2-0986-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 15:33:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso51699295e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 07:33:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f55c99sm203795165e9.24.2025.03.25.07.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 07:33:13 -0700 (PDT)
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
X-Inumbo-ID: 15c1cdd2-0986-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742913194; x=1743517994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uNb/UcQUKuUNuqn7UqodJ2unX51sb4j+EH38k+212fE=;
        b=R3FzPnoMClid/cWJWRj4lwtrxQ4wDfTAuyS5Ncks4xiujrzKdJo/EkTQFosh1wMIXf
         Px6CVxkeFPqV3IeMuykqaHDum1Gq/nGxKJ/oVvjIMz4QawDQJbdSEzo+il3GfC+Py/or
         CRGXyj5TM+WCJgKJxVablw+XnKDytEuY5JohKyd7llb8+OxvaDDXd/tKjZ9UyjTKl1Hn
         9tSXx5RWnuukCEFQh1I8Ie+SGGM+yxkztav3mMESxhLLgvI7wbhXDeM445kpsL5Qe5nK
         McIT08wL7FbZWk6EWZZUhFgObH40xN3MmUY7VHqR6xsmybFaS+GAjcTEYSuCo2N9qGTY
         S3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742913194; x=1743517994;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNb/UcQUKuUNuqn7UqodJ2unX51sb4j+EH38k+212fE=;
        b=Av5PxNOun8yvBmRq/lFt/QqM4ZtxVuoPNecxmNmkxwGw3oJReI1RNOVIpK/18VJ120
         qJ2lKFevX06rBc4Rt1XeuEDwFkq34jZIolfshV2GBn2szz81GVQS9J5/GQwid2W64gAK
         KspzfvsaRoKe6FkKdLCW/lDpX4LRQ+xFqIbE/tR8ErvFz4YDXnQ2bKGKtZG4lxcAUjXf
         7pG8VZwpSwesFFxZrj5PKjn1JpSPTfodxl3mE1T8pJdOCz6wIQ6aoMl8nCIGp491yAC7
         XEE363a7A66Nsay01Bio7SWNtoprzfVrFb5Uevc/iEnqyeClvpW7p2+wrOmRCKjLiIS8
         ajSw==
X-Forwarded-Encrypted: i=1; AJvYcCX0rloIg6ICWvEFNdG0M7D7GYsa4YfiMfJDaELSK8RcYZEmKJa/fjvNOUP8VBa22tEEjAVXgBIBacM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBzf+rjpW0C9lPnn/AK2MUhqrQhxvm3GhBiP+RVWeNCEygqb8s
	XbwL7GjQYa9qUXeS0qLZfPEBuPooUEAiU2bMc+5qdFIywaVSb/9sWoq6//WV0g==
X-Gm-Gg: ASbGnctecHy+2DJsUl1XZd52drw5RmkNCAR1mgtoaI+BLnrAheFMVPSbwQhY1r6ZlCv
	AHNzemGag5ASo34g57JD+zrSNWaHLWmjCg3OlVYk2zNXzDdqdfHeL3J1QQFUj8eSSjX+dqNyOEV
	QUGNwzpcAdSIs4Az+qTeUTWqEVQwQx0gyjt/b49+V7qoifm5b2dNglmuzFWi0fUHsoIL3Fi8R/K
	7E01+bPmJJQqFHzIBSC7CVzh28cdGkBZw2XpkW7Suc9PkevcxgcmuPrNAmoDZx+Swil8jP3goHc
	dzxuym/je3IL86wZeq/xDmEiGSG0GvPrc3p7RXZ7T+N+bJTB7vfT4q+ByGcFCaUukges5yO1FwQ
	z0X7L8nV7ES41jii9jKkpTwvUln0rwQ==
X-Google-Smtp-Source: AGHT+IG+xpKytnrknf8Bcfsgr2i4Ee6k2I5LXtLvJ16ombDiu0I9VVwURPEq9k1TmyzErxiE8Spkjw==
X-Received: by 2002:a05:600c:3c9e:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43d50a4f8camr170412745e9.30.1742913193908;
        Tue, 25 Mar 2025 07:33:13 -0700 (PDT)
Message-ID: <441d92bc-713c-4a7f-9d7d-e17c73080f1a@suse.com>
Date: Tue, 25 Mar 2025 15:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenpm: sanitize allocations in
 show_cpufreq_para_by_cpuid()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jandryuk@gmail.com>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d1fca705-bfed-4370-a907-ca090dea58e5@suse.com>
 <fdab048e-3738-4e3a-8865-41af3180bf3c@citrix.com>
 <a2cbbd03-b91c-4d64-9392-7db46dc582be@suse.com>
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
In-Reply-To: <a2cbbd03-b91c-4d64-9392-7db46dc582be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.03.2025 15:30, Jan Beulich wrote:
> On 25.03.2025 15:20, Andrew Cooper wrote:
>> On 25/03/2025 12:51 pm, Jan Beulich wrote:
>>> malloc(), when passed zero size, may return NULL (the behavior is
>>> implementation defined).
>>
>> More importantly, this is the Musl behaviour, so is how ~most of Gitlab
>> CI behaves.
>>
>>>  Extend the ->gov_num check to the other two
>>> allocations as well.
>>
>> I'm not sure what you mean by this.  Only one of these hunks has a
>> ->gov_num check.
> 
> Not sure I see a better way of wording this: What I mean to say is that
> the ->gov_num check that there is already is being replicated (with "gov"
> replaced accordingly) to the other two places where similar allocations
> happen. Maybe simply s/Extend/Mirror" would already help?

Oh, and to clarify: The ->gov_num check mentioned isn't the one visible
in one of the hunks. It's entirely outside of patch context. It was put
there (for [now] questionable reasons by the HWP work).

Jan

