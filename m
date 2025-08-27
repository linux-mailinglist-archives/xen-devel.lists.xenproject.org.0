Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D582B37DEC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 10:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095723.1450630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urBb4-00006B-QG; Wed, 27 Aug 2025 08:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095723.1450630; Wed, 27 Aug 2025 08:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urBb4-0008WF-MX; Wed, 27 Aug 2025 08:33:34 +0000
Received: by outflank-mailman (input) for mailman id 1095723;
 Wed, 27 Aug 2025 08:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urBb2-0008W5-De
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 08:33:32 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81fe84e7-8320-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 10:33:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-619487c8865so1383926a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 01:33:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c3119f6f9sm8747417a12.3.2025.08.27.01.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 01:33:28 -0700 (PDT)
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
X-Inumbo-ID: 81fe84e7-8320-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756283608; x=1756888408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=80uT325EDtrAKgyiUnqHrTQGzz0robfPrk5P2uPWnAw=;
        b=S5BiBV+Ggu70rkq5pguwDYGHwD1fxd6RFk/xxZp6yTEFeQjFmY4QNCcXcsIOAIVk9X
         irS27FpmLpXBiUZXhpqQk2mko0RdRIyD7l0ikDSLhzBPgp8YVtjD6o+/2Z+z1hkaPnqm
         f+g8gR9jhj27kXKjvA9ZW5v6poUjcuJEub1e/5Q0EXGUl86ukiji2VkO7u1Q1iQbl+Mm
         jduhaXBr+MubndoQoER/LPCIrqMw0/6P5Imvl/QeP6e2pRGx195AYDxyELvj1c+pHRlg
         +nek2km5n9jAzx72oSnfflTgAKofO1el+C1d3KXyQIofr5C5rcb3EUqgBowzgE6FoBHm
         YLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756283608; x=1756888408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80uT325EDtrAKgyiUnqHrTQGzz0robfPrk5P2uPWnAw=;
        b=wb1ecXv6aLT+xh9X7tvSp6j1CCjImNI6O6D7ojbiMLZX6BtAtvVf0VB5C/Pw2X8ig0
         KGQ2FKbH0QUebfoFsEo4sUK3UTUTCRNmidmqe9IB5HaQYkDz8dexVfAS/SansiO0qLPv
         aiCb4lNG6/Cqv1vSDowTebwSnibQ9zo1CJEMQvc3dSU/29y5vL6DKoMSaSnZI8shDvDE
         Cmr41ycr+WDMCYFl9e4bHrALoTHZza/anPoq9AKhFgcPWzOynLfa+lyAhY2WOy0D2ZEQ
         uKFBbyt5hPdo3MZihYqv6eZuDzvTYqNNbt+KF2gwWRi67xoTHqPB54dOXmnggbeuwGhu
         H8BA==
X-Forwarded-Encrypted: i=1; AJvYcCUyFFrd/JJstHWERrop+0KXwQFRqsaMviTM6o/PufmcZ+xT1QHQ+dUunTDXQ/s5lhEgxWHck9uSwTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZoAxi2ZhmiCNGeJMalQjrEo2O4Kt0uxQ28eRt87v3jUe7lSoC
	9oUWndALmxshBWacXqLfD/exNslz+qhpZWQDglG9KlajaJbJeDOpRoJwAVsoJfhPcQ==
X-Gm-Gg: ASbGncvUASSnNBSHAZrlgNHiR8fM+qMZOZ64k8R0q0Vc+Lp3EojEo8YiL3crhxMDsLV
	Mq6TCYJZaWQ+bWbhTI6pOMmSPambqr0bZiNmmsRXXsOIduC3pH93HkwrosT2XD8dxvYXZPnGdt3
	jz1aee4a4fgQOyvEz2JXCJ8+qdWVv5BAowi0F8szfZthwpYgnuYjoSqgN76Xp9aa+3d/aF+0jnM
	JHUIMisWoVNEhRrXfDrwwrsqBZmmz8YmXnXTBGPz6fwbk/qBbHttjRrv5kIbc+g1taqSS7Qc5Lu
	KYhPqR0tOP01dHGmQbRfgL++LBR8iaWAE1HQkQ59/ZXl6O6C/W8S12TNg+NBSi0ObVya/EzRLbY
	Gmji75ZHihAXVbgLEt3Rfw7uobMQ5P3d2hJArOstUbxGYkVjXfW/zcfML7fQTKfdnpXbqUqpsuD
	zn9Hiuo9ASq1/Rrcdf2w==
X-Google-Smtp-Source: AGHT+IGUdtoCGTcO+32nQk8uBvDUblzLKYJ268psbKWwAbw+e//v4pT/LvABW5U86YyQ+f+oubVjnw==
X-Received: by 2002:a17:906:4790:b0:afe:94d7:7283 with SMTP id a640c23a62f3a-afeafeccdf0mr441002666b.32.1756283608555;
        Wed, 27 Aug 2025 01:33:28 -0700 (PDT)
Message-ID: <3a116cdd-fa79-40a6-82d1-3c1c88044a37@suse.com>
Date: Wed, 27 Aug 2025 10:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] hvmloader: fix SMBIOS table length checks
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1755987697.git.w1benny@gmail.com>
 <58f42aaaf460c33d9d0935d670aab9f54eb184b8.1755987697.git.w1benny@gmail.com>
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
In-Reply-To: <58f42aaaf460c33d9d0935d670aab9f54eb184b8.1755987697.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.08.2025 00:26, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> SMBIOS specification dictates that tables should have a minimal length.
> This commit introduces further validation for user-input SMBIOS tables.
> 
> As per SMBIOS Reference Specification:
> * Type 0: For version 2.3 and later implementations, the length is at least 14h
> * Type 1: 1Bh for 2.4 and later
> * Type 2: at least 08h
> * Type 3: 0Dh for version 2.1 and later
> * Type 11: 5h (+ strings)
> * Type 22: 1Ah (+ strings)
> * Type 39: a minimum of 10h
> 
> Notably, this also fixes previously incorrect check for chassis handle in
> smbios_type_2_init. Chassis handle is a WORD, therefore, the condition now
> correctly checks for >= 13 instead of > 13.
> 
> hvmloader currently implements version 2.4
> 
> Furthermore, this commit introduces smbios_pt_copy helper function to substitute
> previously repeating pattern of locating the struct in physical memory (via
> get_smbios_pt_struct), checking the length and copying it into SMBIOS region.

I've added
Fixes: 4d23036e7096 ("HVM firmware passthrough SMBIOS processing")
here.

Jan

> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>



