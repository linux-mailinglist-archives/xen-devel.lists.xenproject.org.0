Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8789ACB844
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 17:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003623.1383206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7Ee-0005As-AM; Mon, 02 Jun 2025 15:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003623.1383206; Mon, 02 Jun 2025 15:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM7Ee-00058u-7h; Mon, 02 Jun 2025 15:38:00 +0000
Received: by outflank-mailman (input) for mailman id 1003623;
 Mon, 02 Jun 2025 15:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uM7Ec-00058g-M4
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 15:37:58 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e2b451e-3fc7-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 17:37:56 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a3758b122cso3070066f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 08:37:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e2b51f5sm5750503a91.9.2025.06.02.08.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 08:37:55 -0700 (PDT)
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
X-Inumbo-ID: 8e2b451e-3fc7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748878676; x=1749483476; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osS3e7H1/IB8NKkOhZIrQllFgeNTqh100R+aLj5TLDE=;
        b=aAARYXUgTlrhgFw2FoeSuHprKeEX3BYxZ7uwh2eAk5NI9eLJqw9JQl/lD34S5dXjrs
         2M0C7/cM+uwtgJWoPkH1/a5NNoEEoKDj7dbJs+KqfQGCsLaVJYyHxCa1Zo2H9xg3+1h/
         u2dVseQA+At2gQQu9B40MX4jSoAyMvxoDTMMeGoVxgdAeH2MP0G9w9ZDktr1QEJK0+Ku
         b1U7hD1O2vsVohoV+LhMnBVLPH9rABdieaLNJ965S8No1pWZqxvaBwPvYEevXYdQ9cAn
         InmoT2OWc9uaXyr8PH0SuO+jIxJYqL+N0kKxZXh8VJ2VJ5a6adeBgJe5XYfe9hVi2NCQ
         t7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748878676; x=1749483476;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osS3e7H1/IB8NKkOhZIrQllFgeNTqh100R+aLj5TLDE=;
        b=nArhGa5JnnP/uyh/Jo+FlVTDSAPvPLyyBXcc2ssubRyv9M2o8++W5iftbqxX1nOEac
         j8ewL+zEaMxseKxp/q/7fj2+X5YS2N+LaW/BjD9m3+k8KVYJ0S9v0Up4SsZ6mz3WymqI
         pP+s3CRR0lrLfBuqm9JIRq1qGdCXpg8aiZiwrLQ56K/ctXtWt29AtVM0s9b9xN+M2+hn
         /uF+kWvIA3wK5BoWZe/YNbBF4pR20pH4lyvBrJbP54sO45OteFzE7/o0C0Fm/s8J5yNF
         LL+0B/t1G9AauRnx8cx4/7SnENlX8TnUDtFWisaz1v4lC/yVtTPWiooC7TNCXW5V27/3
         wPrw==
X-Gm-Message-State: AOJu0Yy0rb9YlRiIhy3pf291sb2OBiCw/DWBsg0ItonYLC9Te3QXqxUl
	WIT5B40S3VUq53traUKpie/+WvsOQ4ejOS/N5IctLvz4hLG/C8MtTpJtnIINmipojTjWBSrrRc1
	oRHk=
X-Gm-Gg: ASbGnctxQ9hZARuVOgRjmLGzhi2vXsZYz5uqSbLmiA1UndQL9wAy8YfHe7MKoXFTJJx
	vQL2ETmuaEuIeIYDR3LXRJa6DOQQs5J3j7Ih7bCAbkID9/WDLtz5VM771qzOzjYHvw9EXyP8XMh
	enuGixVjKovcvdvkPL5LB1NhGrddbabqyQ2Ixd0cez+bIMKfacmr6ZjdOKFZdUhD4x7AhO5LuSF
	y8zeWHe7hXCJ0YCXdKi4QB6yVqx/oUMR6px0/ljr8dkqT5coRAoYxXymTRAZmTRepJIY8Pm4v8a
	5Nu0eEkYfnmaxfFBh56q1cufhOQd3khI0kMYy9NKhdYPC4LwXn/FX7F/AP7BkXgnCZKpZfOqhY1
	1QfkElQIz6Vy0ANM1yvFTlGOH4/i33iKIlMyZg/MWuw9bxmI=
X-Google-Smtp-Source: AGHT+IES5LkjEkvP+9o45D1D3ev0KmTb26x2T3mQor3D+2QQSWOQFv9eq0si0S0zkBY8NL+IYqF+5g==
X-Received: by 2002:a05:6000:18ab:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a4f7aafa70mr12745942f8f.53.1748878676067;
        Mon, 02 Jun 2025 08:37:56 -0700 (PDT)
Message-ID: <421e2f85-c1ed-4989-b8db-36e261826fa0@suse.com>
Date: Mon, 2 Jun 2025 17:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Manuel Andreas <manuel.andreas@tum.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] vVMX: adjust VMPTRLD error handling
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

There are two issues there: When hvm_map_guest_frame_rw() yields a r/o
page mapping, we fail to indicate the failure to the guest, and we fall
over the NULL pointer in nvcpu->nv_vvmcx when subsequently invoking
nvmx_set_vmcs_pointer() (if no earlier VMPTRLD put in place a valid
value).

Fixes: 5dbbaa0fe121 ("x86/vvmx: fix I/O and MSR bitmaps mapping")
Reported-by: Manuel Andreas <manuel.andreas@tum.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1820,7 +1820,7 @@ static int nvmx_handle_vmptrld(struct cp
                 vvmcx = NULL;
             }
         }
-        else
+        if ( !vvmcx )
         {
             vmfail(regs, VMX_INSN_VMPTRLD_INVALID_PHYADDR);
             goto out;

