Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAE9AE66C3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023712.1399751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3sz-00069j-Ae; Tue, 24 Jun 2025 13:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023712.1399751; Tue, 24 Jun 2025 13:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3sz-00067D-79; Tue, 24 Jun 2025 13:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1023712;
 Tue, 24 Jun 2025 13:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU3sx-000677-RM
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:40:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c92c7efd-5100-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 15:40:27 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so300678f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 06:40:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-749b5e099e1sm1940517b3a.12.2025.06.24.06.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 06:40:25 -0700 (PDT)
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
X-Inumbo-ID: c92c7efd-5100-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772426; x=1751377226; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P4W8EzzMsYXIxMULGqXve/loefSjiI4D8JGjlFBJPCw=;
        b=JvgKo05Z07Nn4cYu46XpXhpiL5NYx5/3b3LEWokHoydmONZBf1NLcpnRjpDTvU/Ydg
         5ht4oV+mA2bQ+cKKQM4r4jMsDK7vw3r5HJrvwJkzxph2xRPFTt88c5xkTFeb9GF4QZfq
         IvEheRi5AbHhJabPyPq/4kb5UYIiNwvkR/ET8CzTqjkxzW/eT8J3jQ0csqh+wy4kM3QK
         YWhPGFISBvNti/We76s/dERhOsOCo+B7/uzMajhq2i9P7IZ4x4ZsOq/6Lx7iDhMbnLGE
         EqTkemxMlFeQADdYw5oRcanCxR9wMDZunqhygQi5i+5nhXZKphAzWwC02fTTLm/QtNCn
         qNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772426; x=1751377226;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4W8EzzMsYXIxMULGqXve/loefSjiI4D8JGjlFBJPCw=;
        b=TiyvX3+j4nh+lp+S6TTN5oQtMwiflzRv5KfSPEcMyizBiwKxzfqWxTSsm6nlL21c/K
         hPqxnkpcz0pYp8l0YiWM03H8WC1GKqSIF7HJhIHjuffcapUKRRi8hKp3F2nMHmv0mser
         RDVMAgWrEzk1dGizbhkDSLWNtXTMTL9fzB9u7sWl829L6s8P8qoBwy1b0sDVFRotcpna
         14sIBuoigNn9MzU9i94gvSDDHDKGsc4y8Igng3PBypXhoxKtKUtQIujlmwouIwQ8GSoG
         6e2ii6PYpYL/3mXDtc+R1vP6NMhWIU08iE5ICDgyypXM6QDgh4xsTejLnyANcWiXybYs
         /ssA==
X-Forwarded-Encrypted: i=1; AJvYcCW/aOryCOTh568WlLfQYx+8dy7Nw+c5YM6iyhoh7xQmmMOfcP0153ySafloP0JjpD/LHfA3xdZE3yY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTi7RclgNLe5s3BJXjvatKbEnCq6K0yNZ4AhzaAi6WA9uGEmEN
	H4kvxWMOiEDolatIugEn32S2L/XqRX7J2LwfASMBrZkBU5J2VWPIi0UitkvhNu6TPg==
X-Gm-Gg: ASbGncsqB/9uRAs2SHUrxx0ie8JmlDtZ0bI7OEB7EFDt0ZFTe5el5E7f3fiLcyQ0lGE
	WGTms+HkPRzQRaYAkuSh04GON2Pa8i4SHEcRE/RpfwAq8dB7HEjWxdf6NLIMVrxkVIIhCxiDk2U
	XiNPOnERKoKclR9ibQcmS+qY017I/iHB7xSN6WPs8p+7f9yImtPMIccekqXcowSD62QLQFd8foa
	9giDQzLyuiKqCxXTWV8uMDQHGOgqsOGUOLhlnanUPag/EDhj70wu1uK0kYaAiu6Q79mkw8GtCHS
	ylv3pihrnZgWL8/jsGrVUKgXETJxbNvtBco4SjqfuRNAbjaB2ibWXmW8k79XhlRmDEggr6WVCkY
	JtQOSVjfFgyOUUUDoDWvnm12Z/DMA8FnfgaC+/wQfkzZObW8=
X-Google-Smtp-Source: AGHT+IHCcXHeQFoG7GMczBbS84suP+92TOrdWuur3W5nGARpVZ4QmJ7tElLR9TR8EAE6VQ4ispNZTQ==
X-Received: by 2002:a05:6000:4912:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3a6d12a15e6mr11232208f8f.17.1750772426045;
        Tue, 24 Jun 2025 06:40:26 -0700 (PDT)
Message-ID: <b7e9bca9-5fd6-479c-91eb-202f85efa44e@suse.com>
Date: Tue, 24 Jun 2025 15:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] pdx: introduce command line compression toggle
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-5-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
> Introduce a command line option to allow disabling PDX compression.  The
> disabling is done by turning pfn_pdx_add_region() into a no-op, so when
> attempting to initialize the selected compression algorithm the array of
> ranges to compress is empty.

While neat, this also feels fragile. It's not obvious that for any
algorithm pfn_pdx_compression_setup() would leave compression disabled
when there are zero ranges. In principle, if it was written differently
for mask compression, there being no ranges could result in compression
simply squeezing out all of the address bits. Yet as long as we think
we're going to keep this in mind ...

> Signed-off-by: Roger Pau Monné <roger.pau@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

