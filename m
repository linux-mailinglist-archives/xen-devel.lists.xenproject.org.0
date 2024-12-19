Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799929F7E4B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 16:43:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861317.1273260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOIgU-0007Jy-C9; Thu, 19 Dec 2024 15:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861317.1273260; Thu, 19 Dec 2024 15:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOIgU-0007Gp-8l; Thu, 19 Dec 2024 15:43:30 +0000
Received: by outflank-mailman (input) for mailman id 861317;
 Thu, 19 Dec 2024 15:43:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOIgT-0006zr-5o
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 15:43:29 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcb8a468-be1f-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 16:43:27 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361d5dcf5bso10625755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 07:43:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661219578sm21414355e9.20.2024.12.19.07.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 07:43:25 -0800 (PST)
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
X-Inumbo-ID: fcb8a468-be1f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734623006; x=1735227806; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z88oIDxYFcxmf5Ec0JMWyA2Sht4xh4MyozFkoMes2aQ=;
        b=ftZY5KYKWpX7XRZmT1pB128R8N43OfJG8AWTGs3CcPZ19tJ3OEFknf7e3nUoJ+p2yL
         Y5WThMMLBab7ZB17jCIqiD24pu97IiSrbymcY1k30iKpB3MjJvEfk4aeZuPfqTpNG9sY
         kurxL2jmlWDSt+SNFGNmamBRvzjnqSmz80LeQAuG2YZe7WWnK9DoZ/tJ2CpNPFthFTJM
         69V5f7Y6y/5ppN0/yN5hZSO6X46YME4GKsJwe/AFv8dY7cePdgfZZUmwukfioimwZ4Zf
         Bdo8C3GngaXOzdYpgxnpaJGHkv/od5CvGb3Ax3zdWYPXwhUYyY+D8dWjENka54zvdRR9
         ct5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734623006; x=1735227806;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z88oIDxYFcxmf5Ec0JMWyA2Sht4xh4MyozFkoMes2aQ=;
        b=TW9/p6+arl0IV9Loy0Q9BPv4WyNAtdyhImq6F3ccOe3fM6q8vRjdxinHUX2XfeHZpU
         taLczuAMt20lhhfT/hEX6iuiQRvPz9w8FVtvTEJrsGvW2Pt9WlgTzJJqYZ6BvZugH2W6
         o4NwolWADbGcG451G1c7tAlHgdgpX57rgYecAHGTjA3bd+wxw8XbyO2EA5uRHFQcqsXW
         c/9rldSQ7w0YObqsmegO1a5QxpJoyePANxl7JgkzcargiXUmeTB3tcksTPUfjMXMORlE
         yC0IA1BWA78VCx+YmWLovEbFOUtRb/rjRPIjPOgl3V8SAUyNydKkMI9hRaq0mprX1GgW
         k4CA==
X-Gm-Message-State: AOJu0YxLk59JWeVIn+SKa1DcJKxGdDwZNcBzRoY9N2ugBNlD38cNJCC4
	UilhqWzpoEbWGeckgP5zKmqi1c3oh9YJLIhVgNZkq4iccAN87EyOq4E5H3r2gAPQcdSR3QSKMkI
	=
X-Gm-Gg: ASbGncv3BrNn/fA69q6KP6zwcIxTrCsqVito9+J4cRY8i3q+LHK+PKAmP2VXqigccjf
	D5018cc4R5yjulFxQ/gXFHxp9Q3+G8ggh/jp3PtTOEm3B2vyrrwckP0+uLZ5bV8VnEh8ghHecdU
	aKsjsh18gJZse7rRqTNN4itN9wFo0/xiYQTX4rbr2YAoptkbPZtjoZrmhu7PwiGct9hfLb96vHH
	WJRYUYIJ6tVuZLp37Vjns8bV1eHDBGzHfWBLaw3/FCR+Zl50jxIIcfmHwfJzY3AhqEQ9NBUbRKt
	DxHpWkO1bYN7Pq8oHYnvxxzoQLP3daOyn9GEwm4/UA==
X-Google-Smtp-Source: AGHT+IE5Mkrsu+DdJYMpcTRx83qAIFHWtG2uNNAhmCVVzZbKXQ3kr5fC60BOcxFWpHPvEEEQf8v0TA==
X-Received: by 2002:a05:600c:4f89:b0:434:fff1:1ade with SMTP id 5b1f17b1804b1-4365535b845mr66301465e9.13.1734623005959;
        Thu, 19 Dec 2024 07:43:25 -0800 (PST)
Message-ID: <827fa8dc-77ab-487d-9563-24e3f1411d6d@suse.com>
Date: Thu, 19 Dec 2024 16:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18.4 released
From: Jan Beulich <jbeulich@suse.com>
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fa373eb6-038e-4c3f-a9f9-6397fdd4e5b3@suse.com>
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
In-Reply-To: <fa373eb6-038e-4c3f-a9f9-6397fdd4e5b3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2024 16:37, Jan Beulich wrote:
> Xen 4.18.4 is available from its git repository
> http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.18
> (tag RELEASE-4.18.4) or from the XenProject download page
> https://xenproject.org/resources/downloads/.
> 
> We recommend all users of the 4.18 stable series to update to this
> final full-support point release. The branch is moving into security-only
> maintenance mode now.

Apologies. I was under the strong impression that the above was true, but I
obviously should have checked before hitting the Send button. There are still
a few more months to go until the above is supposed to be happening (in mid
May 2025).

Jan

