Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2D89320B9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2024 08:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759307.1168962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTbyd-0001WU-AR; Tue, 16 Jul 2024 06:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759307.1168962; Tue, 16 Jul 2024 06:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTbyd-0001TK-7f; Tue, 16 Jul 2024 06:47:55 +0000
Received: by outflank-mailman (input) for mailman id 759307;
 Tue, 16 Jul 2024 06:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I1NN=OQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTbyb-0001TD-KQ
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2024 06:47:53 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f8bb7e4-433f-11ef-8776-851b0ebba9a2;
 Tue, 16 Jul 2024 08:47:46 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so94603041fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 23:47:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc39fd4sm50986505ad.187.2024.07.15.23.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 23:47:45 -0700 (PDT)
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
X-Inumbo-ID: 4f8bb7e4-433f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721112466; x=1721717266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1gHlN5V/RwP8yuJyupkHq/ObfEomCy5rg0ItZ37AkUY=;
        b=gt/5Lm5dRG9emkVGOteFXjUWkw9cjsAlgxEWQgzyQb9aDUIG58noW4SXlSLkql6Les
         gAy6kyy2AaPRi2/P7UeHcFaJ7M/OY28zfUQuzfjM/aC0LUdhPeid39zcyIweoWsOXQzE
         fiM9A8OwhiQZ44xq4ywNZUA+ef03FfyzuYFBosAz5nxjFZpW8eMipXo/Lgi+bGz7aC6Z
         6Rtv/RRX/fPXDcZReKC2G4AZO8MMvIMkag8p+OuFzd+1N6vz58UaHQPmpW/Yfy1JdDVw
         ZR+Rgg80w6zZ0GwvbRxiD9gUqCDy3TQ0Sga67a2vcrFUnu9W9uqrjoMJx6XKcMxJ5q48
         s/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721112466; x=1721717266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gHlN5V/RwP8yuJyupkHq/ObfEomCy5rg0ItZ37AkUY=;
        b=e52pLSPOc4rJ9/VTjc146digCndL4zLjVq4kvY4YyfA/m2aTQCWYNNcezrvuJw3MM2
         KKNnOBj1LZaDEVwSwwcxejatMCyle7Cqtl1FgGmoIXCr5Pv5CHLIwETnDKhJeIl/rrLY
         gBl7jfmW+tVgAHvUEVt9zNnyIm5U18XlOAIo5hakdNY1D7G5M2eBZCb6XIoK1XNOqRbV
         pEyln18BzbDkp6rVDIhckqTxDNObS06UEDXCy9pIPzXLjcNDZwNw9g/Ilv9LwYhz5N4Z
         5BN1t9umom1xUInan3/DJOyZnWsSVb6dCDRIZufHNWd3+LJ7uf/x+0+Q91Bxf6N8Nv9s
         NmIg==
X-Forwarded-Encrypted: i=1; AJvYcCUlRBXluyKEaWQuaWv+w07XptuR2D6dQvZ2n/mJDVYkhUdlgzpWnl+WPzqLGh0A5wlFrxk0BRhQ0Te0QpDyk6UtK4Gcix5JeZKNafw4QPI=
X-Gm-Message-State: AOJu0YxFFlZNow96rwdF46OAZtpHiB9GcDD6pocPN9YDpaNPL3/W3JvV
	LoAw0d6hLPXeGTSymFl7icwpvSyKnB3Aw+fJBGJMRGMfcCvQu+/dYuXxsoxwtw==
X-Google-Smtp-Source: AGHT+IEXvsjdc4BgsJOHWtkAJtX81075x+46dCn0b9iohIPE+Sy3uB9Zr7KFqLRVVCpJY2QdJ/7Tkg==
X-Received: by 2002:a05:651c:1247:b0:2ee:80b2:1ea9 with SMTP id 38308e7fff4ca-2eef41eaa08mr8874131fa.49.1721112466323;
        Mon, 15 Jul 2024 23:47:46 -0700 (PDT)
Message-ID: <423412a9-e969-4126-8e39-7e77e67d2fd8@suse.com>
Date: Tue, 16 Jul 2024 08:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/checklist: Fix XEN_EXTRAVERSION
 inconsistency for release candidates
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240715155051.3375999-1-andrew.cooper3@citrix.com>
 <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
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
In-Reply-To: <3b188f84-50f7-4e13-bcde-1d6076e5cc2d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 18:56, Julien Grall wrote:
> On 15/07/2024 16:50, Andrew Cooper wrote:
>> An earlier part of the checklist states:
>>
>>    * change xen-unstable README. The banner (generated using figlet) should say:
>>        - "Xen 4.5" in releases and on stable branches
>>        - "Xen 4.5-unstable" on unstable
>>        - "Xen 4.5-rc" for release candidate
>>
>> Update the notes about XEN_EXTRAVERSION to match.
> 
> We have been tagging the tree with 4.5.0-rcX. So I think it would be 
> better to update the wording so we use a consistent naming.

I find:

4.18-rc
4.17-rc
4.16-rc
4.15-rc

Do I need to go any further? Your 4.5 example also doesn't fully fit because
at that time we were, in addition, still appending RC numbers (up to and
including 4.9 as it looks). In 4.10 it then (intermediately) indeed was
4.10.0-rc. In 4.11 it became 4.11-rc.

That said I wouldn't strictly mind the .0 infix. It's just that imo shorter
is better, and the .0 doesn't really convey any useful information anymore
now that we don't do / tag stable release RCs any longer.

Jan

