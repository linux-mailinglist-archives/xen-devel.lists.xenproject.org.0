Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02C398A13F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 13:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807290.1218666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svF17-0006Ns-9F; Mon, 30 Sep 2024 11:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807290.1218666; Mon, 30 Sep 2024 11:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svF17-0006Lo-6O; Mon, 30 Sep 2024 11:56:41 +0000
Received: by outflank-mailman (input) for mailman id 807290;
 Mon, 30 Sep 2024 11:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svF15-000625-TD
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 11:56:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d3028bd-7f23-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 13:56:39 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fad6de2590so1718751fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 04:56:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ab37sm4386953a12.62.2024.09.30.04.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:56:38 -0700 (PDT)
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
X-Inumbo-ID: 0d3028bd-7f23-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727697399; x=1728302199; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BmHyv08QH3aD6TY5XOf1zFLeE5HscFG2uI1h63RDYrg=;
        b=RSgGTA4moPpkG3LEHQa48fefa2HAMmYP+DC72/R17+pRQEPzi/ydl7CGv/FYPcZMBr
         cNa+XGPokoHr0fVnGg96HBCYnQS2WfgBobclpQ1kPeVs2rGUeogYSwlpaKe6Re3hJow2
         2rdfWWjZjFSybAv8xenITPAbJCAZ8e63I+8YDCOmlVQ4J+PVQ+BL8ByXbanhy5lJz+mL
         GUuL/4K2APgn+Zqgu9zbSwMXlm69W4AahXOa3XCKBCBPABv9TauKkNUK4alW8oFYfUt5
         xBpWVFqdn9DyeJqUFvC4XQiimUFTPSqF3OvAni6JKjPfnx5Fabbw8Nacj+QtgTJ0Pr3c
         e4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727697399; x=1728302199;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmHyv08QH3aD6TY5XOf1zFLeE5HscFG2uI1h63RDYrg=;
        b=NWMZ9uF2YJoNBxX9edJdp6GXGBi6fpUuCnTDXIVKAavUMoq8sLUvLtbscJhW+/In0E
         xX050ffVH+UNE3dWrRRd8IRsVwOcf1TOIZPQYu7Ts/mHrr5b6ZZdQSIKSNPe0+1NmTX0
         kjzOr1dFZdjxKWtbM8ffDxyllKULjH7ZHv7oigW1yeNN10VvwnX1s+gLtqO5TVLMLmWN
         TMw0z9Bcvs5P248/04cIlc4tUuk4RdgFZBEx0zDe6NcjOSwQGwyVCOEE9UcwfD116RrU
         yGvNDGzW1PdzSOEWKUZc8SFgIor0dgFDW4LQD/3fEAit7U4KxIXAfDI1QpgFKnWcXchW
         AfaA==
X-Gm-Message-State: AOJu0YxrD73sWak87o/ngisyGghIqAXadnP4iJPIn5Pi/4sbUPsxDejd
	v2dxMYCoq+bawjQwLo4y6FzGRsURpsMJhdhF+Ee6V9ghZTBFUJFspGXeYAaoDzXxwTQ/xFFTIoM
	=
X-Google-Smtp-Source: AGHT+IF/bNNYAYwKtXoLpfoqRoHT0hYQEDLex/n+4fRYoE5DGPb/PpmAGDlQTKmEha/ZNSFhnvvqoA==
X-Received: by 2002:a2e:719:0:b0:2f6:4a89:9afa with SMTP id 38308e7fff4ca-2f9d3e59e96mr57422911fa.22.1727697398628;
        Mon, 30 Sep 2024 04:56:38 -0700 (PDT)
Message-ID: <88b00dbf-b095-4ce2-9365-2a195ca0d65c@suse.com>
Date: Mon, 30 Sep 2024 13:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 0/5] x86emul: misc additions
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

1: x86emul: support LKGS
2: x86emul+VMX: support {RD,WR}MSRLIST
3: x86emul: support USER_MSR instructions
4: x86/cpu-policy: re-arrange no-VMX logic
5: VMX: support USER_MSR

Jan

