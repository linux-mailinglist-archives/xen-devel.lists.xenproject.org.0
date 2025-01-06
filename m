Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96100A02176
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:08:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865575.1276816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUj5c-0003eG-4C; Mon, 06 Jan 2025 09:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865575.1276816; Mon, 06 Jan 2025 09:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUj5c-0003cI-1a; Mon, 06 Jan 2025 09:08:00 +0000
Received: by outflank-mailman (input) for mailman id 865575;
 Mon, 06 Jan 2025 09:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUj5a-0003bw-CR
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:07:58 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b85ff077-cc0d-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 10:07:57 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38637614567so6377969f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 01:07:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a28f17315sm41944822f8f.108.2025.01.06.01.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:07:56 -0800 (PST)
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
X-Inumbo-ID: b85ff077-cc0d-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736154477; x=1736759277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USpGyjrA+JrNjT+NfIaQhGg7WBh5lnUT4kfannP2Jhw=;
        b=czLSgaN28zXl1+d5O8JHiKvqJQdXeHJMdh/zRa9ARp15fTml7ElTBR9x2NMfhEXyWO
         QSw1KpeTAagD+qN7iuFti9Vl+iOeNiVN01Rrm5PrDCoqjx1AO1n7KrToNs1GpTgHukBi
         rE+O4885ej90S7pUK71kT2yYBz0UQszhIwnF4YhSv1Yxm/ocb3oqjESUN6fzavC6L625
         NBGmVm9UfV8GTMhmCfdhG5mURr7E+nyXQuaObCxhxzb9cbmkcBFqnz61mWDSb/xIMS5i
         2Six/DpJU2egRkhaivbvuEuIgvRSMPikzZ3uVhwqpKJTFX3NpmeXd2qEkvaugVSbOljj
         k2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154477; x=1736759277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USpGyjrA+JrNjT+NfIaQhGg7WBh5lnUT4kfannP2Jhw=;
        b=xBEytRfM2dDyx6Ij8ZfBn3d9KZTKGqPygMRVnZzV4mB70OxcfZTBQ4/LvkmAAxFLUJ
         0+jrhm+c+PD5qy3Lq69bVmO8vGsrdCWRvAo8dQt2PyGdrFaRLyzHJDUziQnqgt/OmZTp
         prhh0foqHAmNbKz6VqIJQ0wbNTanjE0Wo6PzcD1qzbc+9IV3ZUzg1eJP+BMQnBSWy2I2
         3vgVNPoCZRJuDLTNE4sLrKWIVLLzuhtVxyJy4DqXfZiaE8Z3LaA/XyoqUVig00UoLDqW
         zxRLuFHfp5Aeo1Gl6XNfV3rBO4yEfKMbWEC7bSTKtffkci97y/FgOkJ2AOl8AtbAnNN+
         G8Xg==
X-Forwarded-Encrypted: i=1; AJvYcCWoEwbht8pr7SPPQoPDotaiZsXI09hGtRAx6TqfL8rAQKKQYpVNXXfK6WyojrV4cx2htYueO4y14UY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzgX0XjEIYTkraJO/yJnvxLJtUaDUPv+g9jfR7TtvpplLKHUVjJ
	mt0TG47+RQ3Lx84Q+fJ2ATzB3YQ/trwzJZl5oy/sIe1dl5LTyTRNSNVxEPsNTA==
X-Gm-Gg: ASbGnct3sSI6fbIEsfwYac/bcBcDyc0BLM1lzAgfHAgfaNj7Yjw5x1qdLzAuKRyKeQv
	gWS32RSlqGdMzv27dQPYnAdlPu/VnDB4FqxHKg9es9PR4Ri3rkH/046gLiCQDGRLJ/Mm9nI/OCP
	JGXSbeRMiB3vqeKAfhuGf3D1+tz3JdN+5hESh9zV0ix6+N4XzjeMyFcLiysNqJ/8v5xZGeQPgpE
	/pirPlvrFPZuZulU67Z07V5UgKB9FTlimJ66FZySmck7GWKjbWqNglLbAWNqTxzj00E/teEskJx
	5usPHmKlaujGM/AxvRhuqOkzmN7V0aGpQsiDa+InFA==
X-Google-Smtp-Source: AGHT+IFO88iORJObK8PzgZyJivBj38Z36lAxRvVm1XyweSU86HhFkFeU1UHHr5Uc3kLMWUM1SNcS6g==
X-Received: by 2002:a5d:64c9:0:b0:385:f17b:de54 with SMTP id ffacd0b85a97d-38a221f11f9mr53624643f8f.5.1736154476767;
        Mon, 06 Jan 2025 01:07:56 -0800 (PST)
Message-ID: <bb1ea738-8abe-42a2-a959-504c980d55ef@suse.com>
Date: Mon, 6 Jan 2025 10:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/35] xen/console: introduce console_set_owner()
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-19-e9aa923127eb@ford.com>
 <d9c8e9bf-7eac-48f7-a347-b78e97a16f8f@suse.com>
 <CA3mSmUEpURgjpQUifNWDKDNS2HBsE68ad-RudxX4F45CCn2JL1wLo63_ZYcA7qx4nkD23GvE3BVlMjV0oz75Mssd0A5wQQ6zKlcWRLfhyM=@proton.me>
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
In-Reply-To: <CA3mSmUEpURgjpQUifNWDKDNS2HBsE68ad-RudxX4F45CCn2JL1wLo63_ZYcA7qx4nkD23GvE3BVlMjV0oz75Mssd0A5wQQ6zKlcWRLfhyM=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 04:07, Denis Mukhin wrote:
> On Tuesday, December 10th, 2024 at 7:02 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>> +int console_set_owner(domid_t domid)
>>
>>
>> static? Iirc Misra doesn't like non-static functions which aren't called
>> from any other CU.
> 
> Yes, but there's a follow on patch which will undo static - hwdom_crashconsole=
> patch - to drop the user to xen console once dom0 has crashed.
> So since there's a need in globally visible symbol, I decided to get rid of static
> right away.

Yet you realize that any series may go in piecemeal, and therefore no Misra rule
may be violated at any patch boundary?

Jan

