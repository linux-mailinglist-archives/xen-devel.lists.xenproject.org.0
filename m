Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57165AB7E45
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 08:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984779.1370712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFSMM-0006oT-8N; Thu, 15 May 2025 06:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984779.1370712; Thu, 15 May 2025 06:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFSMM-0006lK-2W; Thu, 15 May 2025 06:46:26 +0000
Received: by outflank-mailman (input) for mailman id 984779;
 Thu, 15 May 2025 06:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFSMK-0006in-RJ
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 06:46:24 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eca9434-3158-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 08:46:19 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad4d03700e6so89701166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 23:46:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd37dsm1051599466b.124.2025.05.14.23.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 23:46:21 -0700 (PDT)
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
X-Inumbo-ID: 4eca9434-3158-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747291581; x=1747896381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1YpvPcSjXKUHMYH8M2xEo9gcgitIwHrVEuJEATILAng=;
        b=RaTKUe71Y6aNWgCEHdLrZ/2dXFKqKomxU4j3QvYxW9AGZnwktE+gshbC4dDUTp2gZy
         yciVtQK48MC3WbOGkzgIeKZC5MycYUq0JgOWv9icchHSgJ4LdbXqhUKH5rVx2ghf6vm1
         6qP9qsWACj8tRadqy41QeEC/0GcXyUJE4B4wx8Is1t1sCZ4NkslVVy8ccTkDvXNNfZXg
         lrYpLQiEkJe45oUSv5BDUHkjd12Npu9f2P9/3h38sQUVe9wNYAV2Wb3w0hOa3Yo3jZp3
         4ZYZECNaY/7+VY6VVB/cRFd68xHWRIY9wK14RyuowrXIVogQZYa8jvlX9iUD0ONotaXz
         eo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747291581; x=1747896381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YpvPcSjXKUHMYH8M2xEo9gcgitIwHrVEuJEATILAng=;
        b=dCfpaeYAwz0MrscQ67wMAc6oWKrxgvm7h1HNhcu4x0AqQY6dyGhYL+yDpFVDaEVnE8
         nNIc84xNlyJfAGzf+9vwZVwyChzhvkkX3YpMNNyPB3cVkstnbIpQ3LjaMoMmSNREY6H/
         PwUbbRodvjsoghxONt+qHfKLB+BhQN07h42jpCnDsL6/HR3R2xAsbChY0WD4wgoAVzGS
         4XP1LSA6V+lXW+pqaO/BJeEb9p5eOCy7E3rPtl4bf5LaK1Ie9uuJbBgitMMVcLxcqH9+
         7z/6vgPlrNIXEodbA9GCVH55ZxwiuVN3NHZdCyqRT3JIV71+c7Ym7Q4Fl0HIsksQ9pho
         G+ew==
X-Gm-Message-State: AOJu0Yw3cmNc4ljV+ozE54rHumGoj3nFlBBe2Zr4IoligqHwBdaSreoq
	JJa+5Ebamw3v5ZlQh/fWhikkJn5i0VUfVFh/nJsbEyYHGs+h11npfsHJ2AjJMezQrEtdXw/z/y0
	=
X-Gm-Gg: ASbGncuFnNLY677EG4q0pz1s7pePjZWb5H4e5NM7ohVJdCYfyyX9ms4IynR1WMteV7h
	PrNJKXvTxWGc+yfL2UywFosU2+bwlwevixx77wSpvOXSpEGTDQ7vodxqUF/7d7+vmfNlfqxO+ai
	kyz4ibftA6rZ9OQ7TPodvXjl1rWYVaPy76pvZJcBHVXZgIj65TRqHN4d0dOCuBWqewckEa34/wb
	hY7hgfwsj4Ub/AGV1x+IhZJLA6SIlQx7A0hF96gyqFlK3YxOvn64P5ycKCGdF8CDO4ySfh/ehWs
	4VsQZwbFNqHBNeUmFTb0Bgp46hnW3VBv2Q7ZmZ+dLnKQxlQLfbV+6fPHKvKBQSK5fqryhyHgPJf
	IRbiMxiQpteiUawHjsMiu3Kc3MKQGK+6cA4di
X-Google-Smtp-Source: AGHT+IFGtS2aIoEVSzVMWVIt8HJtC/bOKKFjkseGTfp4sNj7xLr3cwlqvh2ZW/LXb9dtAnTcYIvSuw==
X-Received: by 2002:a17:907:97c9:b0:ad1:766a:9441 with SMTP id a640c23a62f3a-ad4f71a9f6dmr638296966b.23.1747291581540;
        Wed, 14 May 2025 23:46:21 -0700 (PDT)
Message-ID: <3aa40c42-8f46-499b-8427-d79b25e8bb01@suse.com>
Date: Thu, 15 May 2025 08:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86: FLUSH_CACHE -> FLUSH_CACHE_EVICT
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <ca63920c-b349-bcd3-8c1d-c869d8de4d99@suse.com>
 <aCSCNUGdbuwrJLd6@macbook.lan>
 <5aeca684-4ff1-4299-ab07-95d02be12f46@suse.com>
 <aCSsmEa3_XszwJZL@macbook.lan>
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
In-Reply-To: <aCSsmEa3_XszwJZL@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 16:45, Roger Pau Monné wrote:
> On Wed, May 14, 2025 at 02:52:39PM +0200, Jan Beulich wrote:
>> On 14.05.2025 13:44, Roger Pau Monné wrote:
>>> On Wed, May 03, 2023 at 11:46:41AM +0200, Jan Beulich wrote:
>>>> This is to make the difference to FLUSH_CACHE_WRITEBACK more explicit.
>>>>
>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>> This is however missing the previous calls from SVM/VMX that at this
>>> point in the series have already been switched to write-back instead
>>> of evict.
>>
>> Hence why it's this late in the series, i.e. ...
>>
>>>  Maybe this patch should be the 1st of 2nd, so that changes
>>> from evict to write-back are done afterwards?
>>
>> ... I wanted to avoid touching those places twice. (IOW re-ordering would
>> be possible, with the extra changes you mention, but I'd prefer not to.)
> 
> Given the concerns with patch 2 I think some re-ordering will be
> needed?

Well, if patches 2 and 3 need dropping, this one would naturally move forwards
of course. The more that 1 was already committed, and 4 is soon going to be (as
being independent of 2 and 3).

Jan

