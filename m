Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA67C8EB3F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 15:08:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173970.1498955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcft-0000hX-Pm; Thu, 27 Nov 2025 14:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173970.1498955; Thu, 27 Nov 2025 14:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOcft-0000f8-N1; Thu, 27 Nov 2025 14:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1173970;
 Thu, 27 Nov 2025 14:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mf1n=6D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOcfs-0000f0-Qj
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 14:08:44 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9472c0a1-cb9a-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 15:08:42 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477b91680f8so7134455e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 06:08:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791165b1fesm33040715e9.15.2025.11.27.06.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 06:08:41 -0800 (PST)
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
X-Inumbo-ID: 9472c0a1-cb9a-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764252522; x=1764857322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaH0ZIRt2Do4HRTTyT3IBwAakZKu5KSgnO4ebnwW/G8=;
        b=f6pU7i4NaItGnXSnfzl2VjeCXtPcaFVeK0B+MMAf6i4Gb3jr1G/FF1zz1phJKHtK/Z
         tCdCRHMKjqtSFhFtx5JrTUJXrRWk63AOLEgCXFkLfFRHxYfDCZ36rYPq2p4dzuQF466m
         49ksIMDv2rvlu3tSvkJKObuP1jhfsCxljKzmoHT+f2xTQ8sYJVj2Vrpt0yY7RGkO1Onr
         bbg2nsIdbMBzlU/d/wVX2grldD/mR4gR/ya5lgp9SipUv7dX2yy1dDsE/EPP7KbFaCLp
         bG9csNXsqap/I4shfZYNpOlf5L10PO6T6lUMrf8o9jmEKwP1XNsx7qMzgGgCFXFAiTAX
         ThTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764252522; x=1764857322;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaH0ZIRt2Do4HRTTyT3IBwAakZKu5KSgnO4ebnwW/G8=;
        b=M+iPSgDuhh+Acncie51F7J5vGFwsp24cbFttR76r+KKe6asNxKHUpNBY49B0/zplDv
         oLZTdtnPoIhIkgGkavJatYJ5v5YATXQAhc9+3LAvllSeLh0u6mg76L4F6IuMbjh3cCXm
         Ap17syVv6qytKsKwodkkrIg/HEemWKcMWUBtMqY00U4AA+0MYXii74nmdRtPcrLysJLg
         BeePGkzBN3utlO6ML5il1G3qkfY+wbk3zedH0ymWLMKRsfECyVHN4vjcaQUUBpOf97xp
         kWdJF5R3+3nYP1IG5QpPRv+0N2XggJ1i/Ks7w8A7cdGSCLwX3NbQZDTWk2j4ynqiEyiS
         d8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVNMM8qoEJy/UfSY1rU9/KHlWnq+zHLVwBxYMuyFY40OSykRh3xJabDyJslvdXWArgZyjNYzxoItR4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw20PvaDgOFAvWFhCA8+k2HETvOYcxQLilm1qRyGhKSurBjtQCM
	1l34ohauQCMVUu3YDVDbD5Ca79CW1A4nrb9MZDiMlKloQWepfFoiRRt64sy6XpWt6g==
X-Gm-Gg: ASbGncvce7cNZbOuhG/fdenIFcgdpy2WFrdkPXe1dPZTZ7XjEUTZnIOz5euRDV5slak
	P6rTlnqebntKOc2qiWlnjDZpmJiZZEqqzB3dsvCZyEmY73Ta3TAK5msphH1rm9nSg2AqYl4jO9e
	cSonO799BWoQOGip0la0zKfatq5ybt5vmu1rcmWKkhplAXK4UVBo7C/amKGBKoKCsKy5Dna0xQN
	66b1lf80Ec+FDMRsJWxTqonU3svT5BN8Am1+U6jnW8XWgx2p0Vqyl2mZJ/SGLiSOjQYbvsa/4C/
	MDt85Gxurqzdo3tywoeLc0E7gj6azEqfewR93TREewZKHgXA7S7kXGOsnXngtsUq0oqcLxETp9z
	qD/lkh0AOKdY1vLWupHN19k5AkGFQum18WVZT/NnmiEPyMA9G4nZl7r1aXYAgBXKeV0xZpAa9Sb
	q5tPck8AU5qhMkba6DoZ/qKRWSyIzuKc+xSTsYEaujYqO9YvycJFRCv0L4WJVVXROCmle95V5AF
	Mo=
X-Google-Smtp-Source: AGHT+IGfLdLUgH7ZswQZ5ifsXdW86HZJJaRcK8NH6sYr8ZIawSQ+TFHYOttW6/kqwfJ9Kn+iMybpXQ==
X-Received: by 2002:a05:600c:4f89:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-477c10e2bb4mr241045495e9.14.1764252522024;
        Thu, 27 Nov 2025 06:08:42 -0800 (PST)
Message-ID: <42fd724a-ec74-47bf-9310-74969f1d3aa5@suse.com>
Date: Thu, 27 Nov 2025 15:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] x86/p2m-pt: Set p2m->need_flush if page was
 present before
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1764248710.git.teddy.astie@vates.tech>
 <8f5a0cecba14cd38d739a9f29a5c8344c2f6bd11.1764248710.git.teddy.astie@vates.tech>
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
In-Reply-To: <8f5a0cecba14cd38d739a9f29a5c8344c2f6bd11.1764248710.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2025 14:39, Teddy Astie wrote:
> Update p2m->need_flush if page was present before (requiring a tlb flush).
> This causes p2m->flush_tlb() to be now be reachable, make sure we call it
> only when set.

I don't follow. Why would p2m->flush_tlb() not have been reachable? There are
other places where ->need_flush is set to true.

> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> This change is important for the next patch.
> Would it be better to merge it with the next patch ?

I'm inclined to say yes, but without understanding the description here I
cannot be sure.

Hmm, wait. The sole place in x86 where the flag is set is in EPT code. So
do you perhaps mean that for NPT or shadow those call sites can now be
reached, and hence - with the hook being NULL there - checks need adding?
Then, by its title, the next patch actually may be making use of the hook,
so the checks then can be dropped again?

Jan

