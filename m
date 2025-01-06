Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E52A02E38
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 17:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865848.1277118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqID-0001Mt-1Y; Mon, 06 Jan 2025 16:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865848.1277118; Mon, 06 Jan 2025 16:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUqIC-0001KA-UL; Mon, 06 Jan 2025 16:49:28 +0000
Received: by outflank-mailman (input) for mailman id 865848;
 Mon, 06 Jan 2025 16:49:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUqIB-0001K4-AL
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 16:49:27 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f997d3e-cc4e-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 17:49:25 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4361c705434so105667685e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 08:49:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828bd3sm47601120f8f.10.2025.01.06.08.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 08:49:24 -0800 (PST)
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
X-Inumbo-ID: 2f997d3e-cc4e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736182164; x=1736786964; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oo3N0ACOin0EaGOAKGJtbFhWYpUk8Cnbo9KMVud7ZtY=;
        b=DPlBS9rrcqgv3xA09TWtabMgXp6QjvWosztXGelQkoBmXJoKrAWDZticx9mzyiUpeU
         VjTX1NF3jbSppHQyGY0T4GS13+HqtV3jw1bkfv5/0oFv0QsoL+0yphOxp5g7HwhFZOWi
         rEsoeYA9vEdZG+l5WiBqlV6TfmnIm4LtrIGA4jnKCbtoTRUXWV7Omi+tZ85DMIhhbrwc
         v1r6Ta4KEO/a7L1fMSQs76JTKl4vQNeCSS9M5XJBYk1aJmE0n3VfTJywVwNHV1Lzresr
         AGsj96VWrb6o/QMysXR/5GVpVaxu4O7oCI8aNaJBtyCBpRGjxOLbmq+8tzxPuU3GJazr
         d9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736182164; x=1736786964;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oo3N0ACOin0EaGOAKGJtbFhWYpUk8Cnbo9KMVud7ZtY=;
        b=Lz2JAuLJe7nqbU6cSeTfAEwyt8LRh7rRRzs9gcAwlVGnNkC3EBqruVvvVwUrjpCnUE
         O/djLMs/qrvWApdJSWj4vthexVh2ynAIQ3U7pV08K++FP7zSNYvNu2fYNUB32Ba/1FHA
         cX47Oln5fEZYFPz99zbcNlaj8LZs6GQ6xcw4i2zCBvo/csinqa3jdJFswZdmxg+Y8hkh
         Em1VG/yNdTvFSbn3EaDy1yTst2JQHWOJYmPvgRTnBynmfp7tOTGV+HsjlWN2VmCVlGri
         Iqb0w/hVfo+uOvlZONtVWs/ZfGsLngW9j1HtmYUymKHFU50O9tQsWh/z0DyYw+Zb2vxn
         rbOw==
X-Forwarded-Encrypted: i=1; AJvYcCXyNcByZpkd761NbDai/wuRallhgvjJXuXB7L1w8GB0g/vAsX6v17p9sV/x/Tm39hvLTZUxUQ2BmBo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAdcTGzv40DR+Tj65EaePKKhhtr8UikrstR4wGMiFY0eW5Yn7j
	hOXEz2y590V6a9f2r5NheqpcKKJOQUPu7eIwaTvDwl06X6NMS0hgSn499xQm6Q==
X-Gm-Gg: ASbGnctlSAcvsqoESaA5vzKlIFMzhvGLz3hlfmiKPQR6ZHVT5MRzIiGwxU6KkUN5VSt
	U151/yDIeqnwNsUFN43vbHAm1ZFJm0iSsmpdZSMGiLfSnkLmbpHDk8CvrERi13CfuoVQkK62/3i
	zu2nz2d5FwYr/IvhVv+7flWVIXigggx9Op+RsWkyAmyJ9CciEn4FpheuyR/rAJAGFEaUi1Onm7M
	pqXfn5Z3TfejIzlAxkmRHNlhiII0lZSxgkP7BQ3aK+7Nl0rireIm1MGKBRZWj6/YHcb1OjxSR0H
	VM+aIPyQVFbwCyWKaqdVEucdUvgcUP3gOTnhWFDs6w==
X-Google-Smtp-Source: AGHT+IFS8Z6aK1ppVG5fMNbCPIE8ir8rD/4kNJPr4/Mp4eKOHo+b7C6sKLrOQC+ySBjExKn7DoX4VQ==
X-Received: by 2002:a05:600c:35d2:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-436686464cemr537404185e9.18.1736182164582;
        Mon, 06 Jan 2025 08:49:24 -0800 (PST)
Message-ID: <eab6cc64-bbc9-4b7e-8f80-3bba69cfd1fd@suse.com>
Date: Mon, 6 Jan 2025 17:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/amd: Misc setup for Fam1Ah processors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250106141929.615831-1-andrew.cooper3@citrix.com>
 <614a8615-7448-4601-92ff-04217f77a38f@suse.com>
 <03d356de-d3ba-4cb9-acd6-408bde58e77b@citrix.com>
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
In-Reply-To: <03d356de-d3ba-4cb9-acd6-408bde58e77b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 17:37, Andrew Cooper wrote:
> On 06/01/2025 2:41 pm, Jan Beulich wrote:
>> On 06.01.2025 15:19, Andrew Cooper wrote:
>>> Fam1Ah is similar to Fam19h in these regards.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> With this patch, I think we're in an ok position to declare support on Zen5
>>> CPUs.
>> What about amd_log_freq(), where the 0x19 upper bound may need bumping?
> 
> The Pstate MSRs are still there, but their layout is quite different. 
> FID is 12 bits, and Vid is 9 bits in two split fields.

Oh, okay.

> As this is only informational for now, I think I'll leave it.  This
> needs a bigger rework to make the code tractable.

Fair enough then. And with the adjusted ucode size:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


