Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC59C840B7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 09:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171758.1496785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNogT-000226-AA; Tue, 25 Nov 2025 08:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171758.1496785; Tue, 25 Nov 2025 08:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNogT-000213-7H; Tue, 25 Nov 2025 08:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1171758;
 Tue, 25 Nov 2025 08:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNogR-00020v-TB
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 08:45:59 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29058627-c9db-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 09:45:57 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso39307545e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 00:45:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052c9621sm10814895e9.5.2025.11.25.00.45.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 00:45:56 -0800 (PST)
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
X-Inumbo-ID: 29058627-c9db-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764060357; x=1764665157; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Kvaw0Dt53j32KMU/0Jg0rzqtggM78NH9Bnke/iPFCA=;
        b=grNsHonag+Jfqnu8HwUWvdRg0yxf281YBJIaOeuvMgxq/t8MzhM36JEYj8Kn/leuC7
         IIHCcmh6ZcybkFF5FBlUVtW87WVLw9kg9mWm3iA1J51KRArnwaRPzVQ/m6Z0ApYx9Ski
         X5/lC6A4e4dfW7/4FD8f0NPt+4tXR+1YG0MV4m05hWenRzpwzln6CFOV6x0itYtnYPEB
         j3cW5J7uGq3lPcHXRxAdmwRknai6Pf/ShAtDwb4fzSpFS5DcAzszpehHBIWVtmSr90jJ
         HFwGPPrpvHp5uWIO0CTBXDnsyQJiwRimIi6MAE/gmMSsJcdu2+byITjjKiMKsEXfptU4
         dqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764060357; x=1764665157;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Kvaw0Dt53j32KMU/0Jg0rzqtggM78NH9Bnke/iPFCA=;
        b=RRIwfEtKIwyZCIKqKxiI8mryO0SLAsvP9y085iJejHmX1h65k7dedxq6X1+Y//DDdU
         FWotQDYJcoNf8+52ZWDmTKEcgON2Hs/B8dXSKG3gPQDqgiYtt0ZfXyNHjzEDCI0C1ucI
         /Z3FJZiqj9fVwq8wjrZKeVUKxpffYFqSBC7Pba4oQnG8m8BzSkpdqSL+smTuX+8hWVn6
         /p0qRbeRr5UgpeRXd1BAt/HxYHcI1kel9N/GzjBkKpAq2c+F8wNUQM/SDvXHnxdy2Qhy
         EaMKuhRaG1csGSWCY0/X1rwrA1eevIe6u2VfWmmO6UC5xeoxvWUSyg7Q2TcNx+wk/eyk
         rFOQ==
X-Gm-Message-State: AOJu0YxoklHOmSB1EXnrMNvrOvw195q8s4RgqxL3Zuv9NvvL0XYRWMoc
	lhc5J804pM36hgzo8+P7fjLHAwvrntSMQQXUqXQL1pY60uA3RteRqxm7LIMw/Drwio5Udj8kCke
	ZC6c=
X-Gm-Gg: ASbGncuOH0duXWhsC0U58IO2D964wa1+gxHB7rPp/pdgntUseEzLEnqFw14Au01TEwD
	jMnRHGKp4QtkBdSr8OqV0ly+XVEYMVELyutYURv9m/c8Pj/3hllpYjnoeXc0dBqH2BZak/SNnzE
	aW6n+eDSCvPS38iy/a4NT7RS1saL7x6Jc4473xF+p5ds8JichxxQEtno87ZXy0FvCHADRf2c7S3
	3PcQsDjWwZ6zcaU0OuDCS2i95qKgGApxT1NJ5TZzVTl1xiUcB7U2D5TOY/DOJ54qz6J1JI5L4sR
	8OaExEoy/iEhG5lcNc/tu7HRFj3jo9DrLlbxZ4LggTlmytA37WHe/9Zs0bMYvQ0IA9Nqhyb+mv5
	vR3XHiUyibR/OQf8JyApKUdMyUBSjXmLTAXCq4xrKWB4ym5w7MJraDD78dXEWqB8zWcg4h904c0
	g2kTD8ANxTJucoS8rldk6733Rc80wmK93Hcf4tM8HKMwdwpHvf+Xc49BALFdXes9y5ePg5WB9Fn
	SrDar+VvegdMg==
X-Google-Smtp-Source: AGHT+IHXDXp8/UCZ4/eekVwoad1aNbM8F5iZ3LdKYm5f/hE+plC61R0T4MxDVBixLwFHh/pep8kMPA==
X-Received: by 2002:a05:600c:45ce:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-477c04c36a7mr143932355e9.4.1764060356682;
        Tue, 25 Nov 2025 00:45:56 -0800 (PST)
Message-ID: <37edf1f1-19a7-49df-8479-b01f29d4b46c@suse.com>
Date: Tue, 25 Nov 2025 09:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.19.4
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All,

the release is due in a little over a week. Please point out backports you find
missing from the respective staging branch, but which you consider relevant.

Jan

