Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A6867C35
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 17:40:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685634.1066653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree1l-0006A4-4y; Mon, 26 Feb 2024 16:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685634.1066653; Mon, 26 Feb 2024 16:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ree1l-00068C-22; Mon, 26 Feb 2024 16:40:29 +0000
Received: by outflank-mailman (input) for mailman id 685634;
 Mon, 26 Feb 2024 16:40:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ree1k-000686-68
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 16:40:28 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bec5a5a9-d4c5-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 17:40:27 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so4331523a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 08:40:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 la22-20020a170906ad9600b00a3df13a4fe0sm2610636ejb.15.2024.02.26.08.40.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:40:26 -0800 (PST)
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
X-Inumbo-ID: bec5a5a9-d4c5-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708965626; x=1709570426; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mAHNRAuYB35r/tg8UzZgPMbCFo1xfBZxNT28rnMxLh4=;
        b=MBwXxpTvKQdsecawDLdSJ2hmnz2gQFcsjy1V5YUdlYKz2ZDRof1y3gTOAnQxquYHf9
         gMiXwYVfKU2dSIIwLwlTL31I5zWaaRVfHi9tcWqwmdm/hLP9AHCMZv+7jS6uBVGsogHG
         b9bomRD9CnRNdMP67pJmQBMY1LBFlj6fw8Npf206GB95x1QMgBMM6brlRhZyQCs11Slr
         fXymeL+TyReOZAEzR4zl+jPNgejrg7fFDNxPUoXw8cMEE+GARJ+kxvl6U8Q9Wpp0SIVW
         njACv2Bq2jvKBYhoalwM9OyJZJmmBWXH0uAwKDoFxjqfkmpJMqn+O5C14X6lmLWIxBei
         T/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708965626; x=1709570426;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAHNRAuYB35r/tg8UzZgPMbCFo1xfBZxNT28rnMxLh4=;
        b=qpP9TW3rIHRTWFmEwj5TdTicdgfVJgy+7j9ZK18hfoKnGdrJAJcDXSkQX6KQzymyOr
         WbVRiPpy5qI0xMjVF1FVz+u2vib85DoJkqsNG1pbEEWczt/bhV8uoA2vex/4bWJgUOit
         W+R2KmKclnV5NbnzBZrAYcF8S1YdEnrr2YqR7CtaN/TGdfkR1YYmEBGxFakAIp1wbudJ
         WGV8mSvoBAmExyRczccHKlhADOEJcM2acxQGuSo4x6boXgcKPze7o3IFDtsCPR4toiyy
         mBADVItLSlYBihmxyBtYnHpM4MRYi5LTVMqIhEy5vOMizz4IfctImehLiPYjertNLi4r
         1DpQ==
X-Gm-Message-State: AOJu0YxWC3ZBDzgiMXjWYdydZHy7d9RRStW3V5K7fttG38oKmzYtsaD9
	HgjrqpfGVJhWfj2wzKQdb0ZLt0/wqm9XVy5tdCrnkh+ZJUdeoUUG0NOYTs9+Zjg2OmV2GTWYmEU
	=
X-Google-Smtp-Source: AGHT+IFzZTbfeA6/Gu2WGferDekLyB+goXbWrH3uPiwEeQgxxT0R26sUo5M6n6SjjzrYw9PUiHTYvw==
X-Received: by 2002:a17:906:69b:b0:a42:f3a6:9f7f with SMTP id u27-20020a170906069b00b00a42f3a69f7fmr3873194ejb.13.1708965626402;
        Mon, 26 Feb 2024 08:40:26 -0800 (PST)
Message-ID: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
Date: Mon, 26 Feb 2024 17:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 00/12] x86/HVM: misc tidying
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
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

01: VMX: don't run with CR4.VMXE set when VMX could not be enabled
02: x86/HVM: improve CET-IBT pruning of ENDBR
03: VMX: drop vmcs_revision_id
04: VMX: convert vmx_basic_msr
05: VMX: convert vmx_pin_based_exec_control
06: VMX: convert vmx_cpu_based_exec_control
07: VMX: convert vmx_secondary_exec_control
08: VMX: convert vmx_tertiary_exec_control
09: VMX: convert vmx_vmexit_control
10: VMX: convert vmx_vmentry_control
11: VMX: convert vmx_ept_vpid_cap
12: VMX: convert vmx_vmfunc

Jan

