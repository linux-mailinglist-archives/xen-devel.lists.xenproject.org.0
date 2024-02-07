Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C784CB9C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:34:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677554.1054207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi4L-0007Ad-JN; Wed, 07 Feb 2024 13:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677554.1054207; Wed, 07 Feb 2024 13:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi4L-00078P-Gi; Wed, 07 Feb 2024 13:34:29 +0000
Received: by outflank-mailman (input) for mailman id 677554;
 Wed, 07 Feb 2024 13:34:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi4J-00078H-Jv
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:34:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cba63ec-c5bd-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 14:34:26 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4101fc00832so1597055e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:34:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:34:25 -0800 (PST)
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
X-Inumbo-ID: 9cba63ec-c5bd-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707312866; x=1707917666; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XqtG+cLyvuCJcFuJ5L5v3nQUvmQ55x8jdSxLBkC+bBI=;
        b=Y0/Lf4hQL6BIGqAU5VJymHVp8BNntDvI1Rp1Sh7GgjHNbUW2Pz6iz6XSfAEBXLsarx
         4noocEs7dwdV6dGTIh8RMr98rpQcyzVc2zV38bCzdJvkBD0LfYQNsV+tAytrpAWbV8rJ
         IXunMToIXC4QFTv4QqCl/lT8MdIYrdpaoYatxNyaA4iY2Oe/KUEQIoImY9jog7qaWaOx
         3k0euunLQtDfxO2RjCdfOS52Aq1lVCAOFcU90J6Bs029WJFfAORKZzbC8SuVof4+hLgx
         7GzeddLzh/FVxS/HabYyhGUeKKf3/Y5alRPGd7FKCmWHqNMh1VWm3WAtw3Dzu2gwRIT8
         BMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707312866; x=1707917666;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XqtG+cLyvuCJcFuJ5L5v3nQUvmQ55x8jdSxLBkC+bBI=;
        b=i5PhkE6zdmgwDGG/tJbtIC7P/ZGZERyUcKEg2VuD5CfSovhqimEugigE4tGzVT/kTY
         11sz91tmpwvC6dIgA72xLvHbmnYpXwREDjFWqgXtM5IBMDxSdSZL31U0ktaONibd0wOs
         tI2R1Yi64enIDF8rQSls+H8w4VHwpUT1p5sTHvDM1NxdnQqbagLQMYNHGijTacmY6PgF
         ObOmZwxeqPfhG8mCBovzs0f8DthNHcDwxF/Kqhpg8sIG5IHXsMW9q0mOsDQz3NJtX3Dn
         kv+OQwsy3OlwUHWPh5vloUfsr9t9LSv/FB3w3WPmgV+QvxRerIQpYa8ERrCFzBpOhaQg
         IsBg==
X-Gm-Message-State: AOJu0YzZ00TZw6BXRN3gr0wxJ22tdFnqc3511dcVt1ylUOV3sZ0a8qi8
	o/hpcUu44v0IQNzteJAZ/YCoGIM22K/7OUWqWv8BH2xLPxZE40KR0VN8SEgRLPdv5Czj6dTX5xQ
	=
X-Google-Smtp-Source: AGHT+IHLnZH3SlWA6FxETBF8HPAoCyGLozRz1XspjDqS4MuHTytt5KBoz7tZz2gkAOiRfb5qLw83SQ==
X-Received: by 2002:a05:600c:3b85:b0:410:40d:6eac with SMTP id n5-20020a05600c3b8500b00410040d6eacmr1690150wms.18.1707312866076;
        Wed, 07 Feb 2024 05:34:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRlJnf3no8t/086ixNowgAF7dgqO1CQAtJjDRCys5pvucapDgbJTdwv5LV7F8ccZ9xWr+dDwyMhuA5Ah8FnqXu0BMv/Sl9sDHbySfi16QHypCp7F/Jk227dZ5PWA9dkFu7l4IhdkJLS4SH
Message-ID: <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
Date: Wed, 7 Feb 2024 14:34:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 7/7] (mostly) x86: add/convert entry point annotations
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
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
In-Reply-To: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: common: honor CONFIG_CC_SPLIT_SECTIONS also for assembly functions
2: SVM: convert entry point annotations
3: VMX: convert entry point annotations
4: x86/ACPI: annotate assembly functions with type and size
5: x86/kexec: convert entry point annotations
6: x86: convert misc assembly function annotations
7: x86: move ENTRY(), GLOBAL(), and ALIGN

Jan

