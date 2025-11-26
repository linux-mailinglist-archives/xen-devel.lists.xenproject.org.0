Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B06C8A9DB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 16:25:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173050.1498142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOHOE-0003Ua-LF; Wed, 26 Nov 2025 15:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173050.1498142; Wed, 26 Nov 2025 15:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOHOE-0003Ro-IG; Wed, 26 Nov 2025 15:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1173050;
 Wed, 26 Nov 2025 15:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOHOD-0003Ri-MM
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 15:25:05 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 145d8e7e-cadc-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 16:25:03 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779a637712so42406845e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 07:25:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47906cb9715sm43983675e9.2.2025.11.26.07.25.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 07:25:02 -0800 (PST)
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
X-Inumbo-ID: 145d8e7e-cadc-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764170703; x=1764775503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mtssqZqnKkd8hqZPvfPDNLlSBhfYx6dXILpNJhil/O0=;
        b=CwmoJ4/UIwDDjFMRLbSd+JEJBVaByoYxOCWeyQXuPq4xCPRsvOVSBF+ouXsL5gySsq
         KKqnDlrpEicTe5qWJvSmCdIH9C/mu14duF26nQMdL9cR9mZ8+uJg6to+I7kHqjWK2N6g
         ZoFvvzvaYT10Exu0oc/6OrVlz7egnXmqkFGrB6YGOnXvPxD7wOnpa17fkP9C5YX/PKve
         POQ+Iv0RO1sbdGbHmrUa9XNITcCn/7lE1YeHJeeLiaO5zmlDIneUEA1d9Wtd6nn7R15y
         2inFZmIwK1OXwx6DWKp0DNw28m4rZ296rpGKYwXrMkRsAarAgK9+6NQmY2T1Uz5VK0k5
         7K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764170703; x=1764775503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtssqZqnKkd8hqZPvfPDNLlSBhfYx6dXILpNJhil/O0=;
        b=EblD0tqOZLJNNuLNXUuFrnYje0rsyUO/9GITbJBPdok2Qg0JYYtaSjcc1ofbnvIz8b
         3nUGVFUD50mE4PtWBX0g2nP8oj2ftIMJNo8sQQEHyukjRkZGBVIf/l/m3lDOVU5kCkKI
         f3qtvGJPVryHiCqzPZuMBWXmtWq1yy2H445ObA85zdcmwr2+w7U6b3cow4wc7jrqGWyJ
         Da4fkxq0diaUzf+JR0cEsjtHthHe2ZteCWG9nnl6mzal+zaVW/iXw9h8DjwMXtzIpvpl
         I55dzZ3GpUh6ynr8A/Dqcgmz2BVp6M9lvLymiAIz65MPc/PBWjzYwoVqcSZTRgZP9k70
         rvJw==
X-Forwarded-Encrypted: i=1; AJvYcCXtExjNpOGpxUEULObKv9S3xn8qOnKhjmLsK3pgNJdhAZgyXdWtbcOTFBI5thOYYKGgdtBtQ7Q5mw0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yza7UhmEIOHJiXSudbvTQPNdRR9rMuQNZlAY9IyzA/0E0XeSufn
	oWtm9MB3hz6txGakg9BibPdFo/3adZQgkZOLDgmFSbA4ae8+TzPYiWe7z3b84JDd7w==
X-Gm-Gg: ASbGncs/TQ4HlSHYjRaR6tm3fR4PNRzPBevOmcok+wOKjW1QXBWIrEXELb9EfWCX26i
	fQbcgTRc+p9Z8h5FYlX0dkBjrGaLRZfq/O9ImVmXl/C9mFvilG7IkHQ/+wuYi9JfVQgDbumzyKD
	gtnqZEDtZ+yDqno+vV9saGaj5Ws0Z4GzLoFkyhoGeMmyXZh6BNn5Oy1ase8oq0ki2eedDNngCYB
	69WqS44QcY8aLdpWw0bGc39HrhL+RezL2zTP+wNzNQ2bcyvH+q53McwRxoGZIMqxSyBbA2euAsR
	nn70XXHy34czmDVSo6HBGDbkDsCtyGQgEgfPilzv2qudF8+sRnOwWpgGZOuwBo1MUod6PAuHQnW
	A9jtazs9K2qoQ4aduVlfy8Ybgj6uRmLRQ4yXcjBK79bagSNrKL+Q4uz2VOH8rH8ObKuietX6Xba
	J2vUkTr151/3Ic6EvMYewGUH2ythXZNhu5BYLGUKpi4Yy1kDt4cIfBQ7MDJU1g9JphZdw5g2RMp
	bY=
X-Google-Smtp-Source: AGHT+IG8aRYUy3Z5Ssric0uS84QnHRxIRKKzo7uYDrYKI4BlvgCaX6+SYoxky9EMivGhZ5XinBBoeA==
X-Received: by 2002:a05:600c:474b:b0:477:9dc1:b706 with SMTP id 5b1f17b1804b1-477c01b494fmr187997205e9.19.1764170702653;
        Wed, 26 Nov 2025 07:25:02 -0800 (PST)
Message-ID: <9c72cfb3-ed12-4955-817b-84d7c33587af@suse.com>
Date: Wed, 26 Nov 2025 16:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-2-andrew.cooper3@citrix.com>
 <ab8dc060-7707-4ff3-a413-730555aefeee@suse.com>
 <fc9adc57-bb95-484a-9461-0751dc91cb1b@citrix.com>
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
In-Reply-To: <fc9adc57-bb95-484a-9461-0751dc91cb1b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.11.2025 16:12, Andrew Cooper wrote:
> On 26/11/2025 2:19 pm, Jan Beulich wrote:
>> On 26.11.2025 14:22, Andrew Cooper wrote:
>>> When re-scanning features,
>> What exactly do you mean with this, outside of XenServer (i.e. upstream)? The
>> only thing I can think of is recheck_cpu_features(), which calls identify_cpu()
>> and hence init_amd(). Thus ...
>>
>>> forced caps are taken into account but unforced
>>> such as this are not.  This causes BTC_NO to go missing, and for the system to
>>> appear to have lost features.
>> ... I don't really follow where features might be lost.
> 
> Well - it's a feature that we started upstreaming and I still hope to
> finish in some copious free time.
> 
> Already upstream, we rescan the Raw CPU policy after microcode load. 
> That has had fixes such as dis-engaging CPUID Masking/Overriding so the
> Raw policy comes out accurate.

Yet that doesn't take forced features into account afaics. So at the very
least this needs to come with a description which more accurately describes
what (if anything) is actually being fixed / altered upstream.

> The next step (not upstream yet) is to regenerate the Host and Guest
> policies.  I recently fixed a bug in XenServer's testing and noticed
> that the underlying logic had bit-rotted quite a bit, hence this series.
> 
> The purpose is to be able to activate new features added by a late
> microcode load, such as new speculative defences, or simply provide new
> FOO_NO bits.

Yes, that's a good goal.

Jan

