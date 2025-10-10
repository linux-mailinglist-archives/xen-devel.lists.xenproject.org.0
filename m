Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1490BCC1A4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Oct 2025 10:21:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141028.1475630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78NL-000589-UB; Fri, 10 Oct 2025 08:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141028.1475630; Fri, 10 Oct 2025 08:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v78NL-00056M-Q8; Fri, 10 Oct 2025 08:21:19 +0000
Received: by outflank-mailman (input) for mailman id 1141028;
 Fri, 10 Oct 2025 08:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v78NJ-00055s-Q6
 for xen-devel@lists.xenproject.org; Fri, 10 Oct 2025 08:21:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 178822c6-a5b2-11f0-9d15-b5c5bf9af7f9;
 Fri, 10 Oct 2025 10:21:16 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e4473d7f6so11355625e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Oct 2025 01:21:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ac60sm35015485e9.16.2025.10.10.01.21.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Oct 2025 01:21:16 -0700 (PDT)
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
X-Inumbo-ID: 178822c6-a5b2-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760084476; x=1760689276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rhjmOqIgu8aItGBfLYrD9RBPv3rXfAt1Nu0jPh8bEd0=;
        b=EMP1nyk8//MYpv0nTH3IW4h95Jua/iECr1Au9fQ7t4sGYdMrtE9NQKtuueDtOfBbS/
         gos7NfHtUG5A4DVwFhZHY2Rn3TjqAlASk7o+f+9gSHMtvriI9uUw9bj5u2axDtFesad7
         8KOriWnfyFZ1Y0Tz15NFvdb/SwycwiBVcP/pL2EP0kPtuKWiN/B6+LLTwb9WggehjF6x
         8B6xUeKv9dYzTDSX0Dwfz2SC6/SSWBNUI+Hm3cY1MB/4zW3HU5DntG6LMbioVzF08te8
         dKJ8Oqqi23UTTgWe+FVde4qoAVwh07d0KiffcfXzrbN59NL7UwNwl8D1lzxwmqi3cxNo
         2l8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084476; x=1760689276;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhjmOqIgu8aItGBfLYrD9RBPv3rXfAt1Nu0jPh8bEd0=;
        b=OA83HzGlh4whaBdhsKeG/Gi6T7k2Tzaap8qB7uoEcJTn871m27/3M2TQx6RrM61nk0
         HPrFIvIJPWb9YzetUBJlFPrWBd/Pv3QNVIJCMr7X3bEPoS0wixz4xqclpVbCrIehqblU
         TNyjqq38tSkbZfSEsBdx+NmWtg/927eN6thu5GEQ18yRXKqwXutGHfqziAutoGrZXh0C
         lLrRxNbrpL4qiAI9vZGqktLx1j9w353OGoniC8O7qg4X6IwUi7WW9KBm5b1Sd5o7X183
         upp8gTQkvm2Jf/iDHVopzCpKW3a+q+GFtTG8ZPPnXP5DBtFB0xZox0mUNcEVeE1Voa/B
         FMVA==
X-Forwarded-Encrypted: i=1; AJvYcCXuOfnDfm0LJa/djyteISzZ9SxebMeAG6rOlhotAo48MnqXdZFOA+59UotzAWLUxs+lp7GLF8TD57g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtvMR6xvzk5SgKo04oqo3jQK5fsonWRxn1Y+g0C0zg2kv173xA
	DyAxLyi/O1CyTeTtqL8FJvNgszVMzFlhjLpapkhOJyXFBJaPJvshxmKKxUGhNrbpqg==
X-Gm-Gg: ASbGncvXkm03ZfWEOIustW1+d6NKr8z1Cidbf74Z47RJdKHF1eyzTcB+XPkj7c8aLeX
	f5+4FgJdNrxeOKeQ1B+6ILTczOr7tB3b5Dhew0bQeLCRmxvszWkwy+VFepJxLsFBXID0RaqP1FR
	j38WCtPxjjaW+2w8UAkafirvn0pHBGaO91WRcfPKwwK6JmN23OP+UftDVSsx3HNreGDrTs5yb8Y
	muhw9q+C00F9BcnrlwWFSJKC6JmM0zn+EEK0ao3rYsz/aDMiKEzCCRjP7sVBW7sY6+i1x0/lgSu
	B7IKWo+MrR2hlb73MjRl43z1KE9tHMtGS7Rd59DgxiiaUBq/iw77Xp8gMIkJh81nAIAQmiv1r+N
	+r+qP8p2gG2/vtcs2SrWe0JUwb+Smos5oM6gSm4Dct2IQqLVq3je6cgTixKAuNhockgN0VeSRYA
	UQj8AyFSvXS5Rao/jFomuyT6ONfmSwf0BZs5F9
X-Google-Smtp-Source: AGHT+IFEFw2FgjIpIGvC9Wv/6UGmrCUJDpGT9KYtCPq2O7RweyQp1xIUeeMxKq2UP2J69KLhnbV1vw==
X-Received: by 2002:a05:600c:4688:b0:45c:b540:763d with SMTP id 5b1f17b1804b1-46fa9b18258mr75018035e9.33.1760084476254;
        Fri, 10 Oct 2025 01:21:16 -0700 (PDT)
Message-ID: <cca4f19e-c72c-496e-8a17-db413d837b21@suse.com>
Date: Fri, 10 Oct 2025 10:21:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools/libs/light: fix BAR memory address truncation
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20251010080029.29328-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20251010080029.29328-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.10.2025 10:00, Jiqian Chen wrote:
> 64-bit BAR memory address is truncated when removing a passthrough pci
> device from guest since it uses "unsigned int".
> 
> So, change to use "unsigned long long" to fix this problem.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Oh, and - please add a Fixes: tag when addressing bugs.

Jan

