Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFECA37C94
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 08:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889763.1298807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvxW-0001ez-PP; Mon, 17 Feb 2025 07:54:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889763.1298807; Mon, 17 Feb 2025 07:54:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjvxW-0001d1-Mk; Mon, 17 Feb 2025 07:54:30 +0000
Received: by outflank-mailman (input) for mailman id 889763;
 Mon, 17 Feb 2025 07:54:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjvxW-0001cv-3J
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 07:54:30 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a487b10-ed04-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 08:54:29 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab7430e27b2so692037666b.3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 23:54:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb948b4978sm219299966b.151.2025.02.16.23.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 23:54:28 -0800 (PST)
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
X-Inumbo-ID: 6a487b10-ed04-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739778868; x=1740383668; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fOXLupMIaHUXojOwhOzbm9B4gskNHn9Q4RNcv+Q5kqk=;
        b=Aa1E4aOlrwC0dipS8UJyxhofqCq7/Dc9Jp5cVi4xg5tlP6TZb978EG8yRjmq3Yodfy
         EZFBNPCBJi+E/b8G5UuZ4Gf4O1qPHzl7eH4jcnn1OTsGXBaA5B0r8C2vfzBvU5xUKC12
         StjxpwxYjp6zuuEo9r5rSDMEG7IRJaha0HjZEHyxWGdvK/PsgFXjGqN368lGBiBLPkdI
         jwduNswjpik5wJeUF+Q+qRAYf/Ir2vU2YizTUmQh9o0uPQbXLcwUe5y2mWUn9RBnCY2u
         Eb8sCluXsMsTcWRF0HJbFT6bAUle8/aESuU9/nrHJxOIBuIjzNjjrK3eSz/xubT3V8+8
         tiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739778868; x=1740383668;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOXLupMIaHUXojOwhOzbm9B4gskNHn9Q4RNcv+Q5kqk=;
        b=Sn89MXo9b7WdXV+MWQy1xLCTpwOwLNVFeTU94CuvBJYYLeGb8mzOLjdiYLePTA0tX3
         HEYY1yiCqApl5mbtTvVsGI6K2MRm2dwtrfmc++5o8o1aHy9/GxEDksas4CTtOI3tnqpX
         pGOdIllLLG/x+r3VZI8GHyP96RU3p5RqEmCIw9QvQMecjnkucb/EPuSNbwzXfD+Td/4U
         L+0xMA4IPT9IY4nV5XZ6BsITDr7vZmiRu86kfCiuwNjy/J1oWzI2g1Km8kZJmNr4KlaL
         MW5IFKqZDJzNym/W7gTg4kG79N9O1MjRwLv3BPVWo5SD3TEfjdD470+XbCuEj624g0In
         PQqw==
X-Gm-Message-State: AOJu0YzDpkW+7ZdRGlkY74OkIOW22NPO3khiUkVRCiMRbF6Ohs3oX7RZ
	JLXaInQ9rYCFEsDXk4ih/MvfwquUuCLNYRT4zETgdKPzbC335qJdm61XmaNa3Q==
X-Gm-Gg: ASbGnctv03vbbKAAzY2f/OiaqcdU+RF6J3ljO1cpWAS2jEBOqYUYrZmHQgUr4S1c4qo
	Tv3SBwBWqPntoiXka+fl5FYCwSFJ16Rq5NKY206btzbeoo+5+a9QEe64qMOx/sewEd61ETOvoVo
	AzGdox3IDPTWxvnvZLk2oSHZGiGyFiMo6jhWxcjyTekhowjrbfJ8qaQ1Prg2Qg5yp0GQJIqFF+8
	aSNWof4lVLisNK05YAif0fayHI2hsB+21j++IbfMn7P/GxaygRbVfqSyhWX6ctWxetkT7tdz7/k
	wrVVuaK2bvDxuGZZzTaREYUedWXZnxQAo2tydbTTaRoL4pDVZGNHwa5sCo4u5uf/8yd9hH25DF1
	f
X-Google-Smtp-Source: AGHT+IFO5H3MxI9dkxrakEj5eyV8xZCzOrxxC9vhAjDdChdluGGg0/gjJ6ZJuAKO+OBtJEoSxglOIA==
X-Received: by 2002:a17:906:f0c9:b0:abb:a88d:ddaf with SMTP id a640c23a62f3a-abba88dde9cmr77274966b.55.1739778868552;
        Sun, 16 Feb 2025 23:54:28 -0800 (PST)
Message-ID: <180090ff-f0c1-4040-8c42-6ded7536a527@suse.com>
Date: Mon, 17 Feb 2025 08:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] xen/sched: address violation of MISRA C Rule 8.2
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com>
 <36cd255a8d4068a66ad8cf45060d60b84b9d4c6d.1739564781.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2502141303380.3858257@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502141303380.3858257@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2025 00:04, Stefano Stabellini wrote:
> On Fri, 14 Feb 2025, Nicola Vetrini wrote:
>> Rule 8.2 states: "Function types shall be in prototype form with
>> named parameters".
>>
>> The parameter name is missing from the function pointer type
>> that constitutes the first parameter.
>>
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> This small fix is needed in order to keep the rule clean in the
>> follow-up patch that changes the Xen configuration under static
>> analysis.
>>
>> I wasn't really certain about the right name to give to the parameter,
>> so if there are better options I'd be happy to accept them.
>> ---
>>  xen/common/sched/rt.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)

This is a specific scheduler you touch, which I think wants expressing
somehow (e.g. via an adjusted prefix) in the patch subject.

>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -500,7 +500,7 @@ deadline_queue_remove(struct list_head *queue, struct list_head *elem)
>>  }
>>  
>>  static inline bool
>> -deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *),
>> +deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *q_iter),
> 
> I think it should be "elem" instead of "q_iter"

Why would it matter what the name is? There's no separate decl to stay in
sync with. (That said, I'd be happy with "elem"; it'll be a matter of the
maintainers to judge.)

Jan

