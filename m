Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3589D8902
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842834.1258507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFarh-0002uz-U3; Mon, 25 Nov 2024 15:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842834.1258507; Mon, 25 Nov 2024 15:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFarh-0002sr-RW; Mon, 25 Nov 2024 15:19:05 +0000
Received: by outflank-mailman (input) for mailman id 842834;
 Mon, 25 Nov 2024 15:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFarg-0002ed-2j
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:19:04 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9912bfbd-ab40-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 16:19:00 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43163667f0eso40907375e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 07:19:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433cde98b4dsm132705555e9.43.2024.11.25.07.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:18:59 -0800 (PST)
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
X-Inumbo-ID: 9912bfbd-ab40-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmYiLCJoZWxvIjoibWFpbC13bTEteDMyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk5MTJiZmJkLWFiNDAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTQ3OTQwLjgxNDM0MSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732547940; x=1733152740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bbzl4+WdF2uCFxZFiU3I43axHjlGKuMk0FeLDNxovys=;
        b=HffpTL2H8oENuruUV13AYX3TKdBdG8CieOEBiLTz5GiwEnz3kw9ZbWe3qG0K3gJ4jg
         zFOr1Xrq4yloyNyMNpv5woSMBUVf1g8oPAGrwevoatd5HLl7vqgFsPsOZ38PwcCGOppa
         mQbQXHr4mol8JGcgM4+2EKZSNPVrcf0yEXXMzILoK8Yb8hXdkGNIb8HjMKJnBQC180Bx
         A57lu5nxI8e6sHwAA/3+ryGtHDR/uerQJCLYRLZRgenrSLQ/jr11wGOkcfoiupj9KYaF
         gDnPNopHU2hTrT6bCRVtsXppFwqfvIziuWIn5gIQ6jpzrUQ6ufrx4b0b8wuxP7x4Qe6U
         8VrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547940; x=1733152740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bbzl4+WdF2uCFxZFiU3I43axHjlGKuMk0FeLDNxovys=;
        b=q/WcdMAHTPJQInZJcMT9lGSsCpJxu6fIh76FrsHq2qNuZwVCA++ApeGNKyp/gCMH0l
         EqRIeRRvB97pyz4a1HG26hRkLcHB5Ly2CYI09YHyYMKfsdNkPqHdvi04/gTnkYTcNBGg
         faA/Vwlej2iEJxFgedjQvx8aRCqa3PYj4DiFHLFtd8wUwlvwxC6jIf+Js/rQeuZaUkmv
         m2XrHQBlemj2HK+h4Rd/g/FqH6FYM4W6yW+AqpDmyK6MNe2wf+T7tFCuL+03XdKah+8a
         AqcdslHe67nMV4wkzfVuG2NZnKGpKlBn8GTgGAWf/boojO13Pmlrz2M01hCDEOMiC4vs
         uh7A==
X-Forwarded-Encrypted: i=1; AJvYcCU6himAwL8HlV3A846nn2ZLn5QxOv5eiQdElS96f2qKFCobTddOu2z40POW/521vZKqapjCwmezmbk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziQEQXjjcIsx1ta5as4VBkuIh/QGPRzjyX9xfkO7S/rDEY+04/
	mM6cXnrk6fSjLQwK8AEOP1fvMAXjjVc1pE8TQ2Y7H6E+vcz5RP0WK+YoZ/EC/g==
X-Gm-Gg: ASbGncsG+jCHTQYA12p7t4vkVCKQ7IEZaA0tfkC29HrUDOcrzJRL6oiWV1pT0baGP/k
	RiE6rcM2EFwLmXo+PFR/3T4UgIGcqX8iKDH9sbWCudpGvCRFbJae5Yupixi44KmA2tyFMK0gppV
	4KPrNnag4QSWwOLRRUONuH9krlbgv7ruCrrNTHEYC4OV+FKo+wmA6B1XN3IL9H0jbajud4gunsI
	fKZfSOj6j8gXI8m1guuSBa8t2Yvf5ycz+VmyhDn0tjq7tEG/bLyNSDl+fdZr2ZZEJrzgsHGXgDj
	WtKhhIr3IitYn4VeDPVzxN4xBT27tm8hSM8=
X-Google-Smtp-Source: AGHT+IFZSvI10ODL8rU+rszr/9jzKHlhkzvR+dY/mPY0TikooRIWjPIp8s0uT+OGSAmbtpMdNl0W7w==
X-Received: by 2002:a05:600c:3d8d:b0:432:d82d:6a6c with SMTP id 5b1f17b1804b1-433ce4e74f4mr122093825e9.30.1732547940238;
        Mon, 25 Nov 2024 07:19:00 -0800 (PST)
Message-ID: <095d7f9b-ca64-4241-a268-ae481dec4535@suse.com>
Date: Mon, 25 Nov 2024 16:18:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: don't populate the GDT/LDT L3 slot at domain
 creation
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241121171504.55383-1-roger.pau@citrix.com>
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
In-Reply-To: <20241121171504.55383-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.11.2024 18:15, Roger Pau Monne wrote:
> The current code in pv_domain_initialise() populates the L3 slot used for the
> GDT/LDT, however that's not needed, since the create_perdomain_mapping() in
> pv_create_gdt_ldt_l1tab() will already take care of allocating an L2 and
> populating the L3 entry if not present.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



