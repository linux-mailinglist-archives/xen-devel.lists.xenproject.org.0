Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E3DB084E2
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046181.1416427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucI83-0004P1-Mh; Thu, 17 Jul 2025 06:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046181.1416427; Thu, 17 Jul 2025 06:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucI83-0004Lp-Jx; Thu, 17 Jul 2025 06:30:03 +0000
Received: by outflank-mailman (input) for mailman id 1046181;
 Thu, 17 Jul 2025 06:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucI83-0003yh-37
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:30:03 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7729a5c7-62d7-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 08:30:00 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso324109f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:30:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ebfd2d26asm13414914b3a.76.2025.07.16.23.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:29:59 -0700 (PDT)
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
X-Inumbo-ID: 7729a5c7-62d7-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752733800; x=1753338600; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zJhgk75TSen/8gpSOKaI+DYa5yxcM2Lboo2pZZ3NkAA=;
        b=dHgCNN1VyGmql/YO094JXEJFb6RmUNop8TFfWn34YpENwVPpf/qpwz0Nz1Ih+PriFP
         WHiHeEsiQMWWPrUC7xqNGkWzk6qeQgtDLLDYQnsmUJNI9D3FBeyRVShimpR0U/A55UQg
         2oKtT8lkd1W045voi0nwzx0LJ28s+EFAV5/zsiqkHhy5gUb3XvZpTtqK2Scq5EK7Gs9g
         g9wKWqAX5ntfFtHR0nMm+XzWpnRHt1FTIrlMk+RybAB0SCw0QPpKTeiw0kSK184aV6ah
         t+cjW2iHBlCJqwBaiGx9i+0nrVCrkv26VRIt8fgHGEwa8cTdg4uzCRyNwUYmKhyuniyU
         q+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752733800; x=1753338600;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJhgk75TSen/8gpSOKaI+DYa5yxcM2Lboo2pZZ3NkAA=;
        b=jh5c5AVD8zQO2Q/RAvS8zUHq/N4LMWYmIFa0E+nAqCwxCkFInTJkt60vxGNh0yNZH7
         +I5Ju3OqMLlzEF2rpmS7YRSoKEyKiqiY1mRsR5s6PXXJd8gft2HuQCDZmvR3YbTlsHt5
         S7uVgaytVPRRxa6ushqJtj2SVCJ2sNAd1zpDXUiIFcJzCe7POHlA7UGWKSKGThrYzQ/k
         FqkQ5qiVVcnbrLvDGt7edXvamzot+bUxHR5xvg2Pf4CgtpUQydPdBsMeOF/nJmoa/tYW
         Teqc75jcrb3eEQHvOg7K6h0W/LDcKbK0tMaDG9bZOf11fbiLUqvd+jsy61yFjM7LttPo
         0p5g==
X-Gm-Message-State: AOJu0YxXWETqckVCHQwN2svhQIwalJewnPL9PZaE/oIRseXEdP0lY5Rj
	PTmCLRiHxP6HljtabGseLWWDOb15Glw0a5NqB4V+n8o9Ykh3Dte0jh+8AZv4qi/EXw==
X-Gm-Gg: ASbGnctTQ7lqYHPndg+OKo6PBFbDnfzirBYcCNe17eMNO+xxgXvDcBJ2i4LH+Zwh3KP
	l7/6nrZ87Q8isCLm2b6he83jcoEOZexaVxU+V5XadJi5pQCA1dfldneJyYIjb0PuZimovn/lIrM
	TwRZUV953OEXZ/gVKgmNlh4RDXL7aqRU8Sr+QYvTff4U5NMIz2Kh6b7peEZi/tTLozYGqSjgP4o
	JFEGiPPCItl2w9vjP/XSp6eH4ttYnGMDaXOX/IqFCgMDmw/r9u0npzwdAdmufo+SsiG7pt4ACuO
	zAS3yayWZsBf/zoAvxzsrCy6zjatetB3BdiVQ2ntMppjycl0Pc8JA1F2Hx9zlfWbQojIVbk19Ql
	UKL4xuILB/2akZ5fDkkxVohGT2AOXVfNXziOSSOzheml/nmjZqRDmIOuRQK5MUzCO9fS6ygy67G
	DJDYkPDws=
X-Google-Smtp-Source: AGHT+IGD8uV+NCbPKS56SKr5QMRzsfywTWU7Y59Tw6SYB7WhhBiDPaw4Niz7JbJRAGjMoU7CCe4KFw==
X-Received: by 2002:a05:6000:40ca:b0:3a8:6262:e78 with SMTP id ffacd0b85a97d-3b60e513909mr3701556f8f.37.1752733799950;
        Wed, 16 Jul 2025 23:29:59 -0700 (PDT)
Message-ID: <f1021db3-ecd1-4c27-890f-b474e20cc5e3@suse.com>
Date: Thu, 17 Jul 2025 08:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] xen: introduce CONFIG_SYSCTL
From: Jan Beulich <jbeulich@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <alpine.DEB.2.22.394.2507151823170.15546@ubuntu-linux-20-04-desktop>
 <4df052eb-1757-488c-ae8a-3a9cc2c38a49@suse.com>
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
In-Reply-To: <4df052eb-1757-488c-ae8a-3a9cc2c38a49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 09:01, Jan Beulich wrote:
> On 16.07.2025 03:24, Stefano Stabellini wrote:
>> Heads up, I intend to commit this series shortly as it has been
>> thoroughly reviewed by multiple people and has been on the list for a
>> long time now.
> 
> I would have already committed it if it had all necessary acks. XSM ones
> in particular are missing.

While the XSM acks did arrive, you still committed part of this series not
fully ack-ed. As much as I can understand your eagerness, I think chasing
all necessary acks is important. If nothing else, then to avoid after-the-
fact discussions (as I could see happening for the second to last patch of
the series).

Jan

