Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812219255C6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 10:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752819.1161055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOveU-0008QA-DT; Wed, 03 Jul 2024 08:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752819.1161055; Wed, 03 Jul 2024 08:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOveU-0008O1-Af; Wed, 03 Jul 2024 08:47:46 +0000
Received: by outflank-mailman (input) for mailman id 752819;
 Wed, 03 Jul 2024 08:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOveT-0008Nv-K1
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 08:47:45 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9b5e098-3918-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 10:47:43 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eabd22d3f4so51247271fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 01:47:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac10d20c1sm97649595ad.30.2024.07.03.01.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 01:47:42 -0700 (PDT)
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
X-Inumbo-ID: e9b5e098-3918-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719996463; x=1720601263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TXPVmiae5JlIZDhZS6lJxRwLBbSAAG6pDUgsS72qZek=;
        b=SXu34zf/oIcCJNS/9Hr2FPC25tSbF4gQQFjDQJbpJQ+f2Guz6z+GydGbDBhiDJbHC7
         9aaiKTZEpWKINb3XTw/f1yM1wZbpw7i7XurB5KQ+auAtZUANfpYej66JijcVgbnHzKZw
         7rgec+Gb2uMvKCePCgH5QBYZTchDol08AOqnRIzwVwir8BWt1+vRgu/PxJPU1geVQPXv
         6hro6/2sB4+32aDkttV6DD3ubl8HC9Q7bNnuiEKbqur0PZ8SPXBHWVb/5K4SxtjU00NF
         iSl2zAAS5FVoCOGW/wWH8zxr4WE0DQYnK3LmDreWHafkXrtQpr3s4ZxvFbbBVsCQEY5W
         UKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996463; x=1720601263;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXPVmiae5JlIZDhZS6lJxRwLBbSAAG6pDUgsS72qZek=;
        b=aKrXZ7F3oDqoTCQysQSKxu+ImOUQtT+VdYaE/w9AdCazJLD9lHVuASlRTtkgOTuqil
         /eIBap9gAT2HyhJ9jVZYDt07kusPCWoQXxdBgRsRlvs6rXCRzgSNKGZczYmoHdZFUXFT
         ncj+A1JFU7wJyTy5DLZ9YYhQ26bq15P8H9pvjR+uhqooHxLu53Xt2sy68Hljw8JxTS4/
         9gkmI7JP2qZZEgR4ZkDa7HRB9WufS7Fs1v5aFGhPtH6//mpu2V0AEyxUA77xM9KQyzhs
         mecCJMQfeFGMew1HHlKHaOvKiuLsN4h8G36ma18VWGm+Jx0vrjiDQCfKDTyYBupJ5iGq
         F2ow==
X-Gm-Message-State: AOJu0YxrGbXtUnscVRF2A6OyiEPhxEA46wFPEyQryJ0n6SRqAHoTCVXd
	zkQIEaWuq26VH+I+l2N3tyPD5W4ixmiw8KDJMOCByqp4ByFz0RcjRqqkxbeFS71YbniXQJtAkvQ
	=
X-Google-Smtp-Source: AGHT+IEa+A69UTkkpvxJCGfR9GWDmolgynmzYM6cj2/wSRoRphL7ueaSV2iNB5njrGFjSni3cb9efw==
X-Received: by 2002:a2e:240a:0:b0:2ec:1708:4daf with SMTP id 38308e7fff4ca-2ee5e6f542emr61016051fa.47.1719996463066;
        Wed, 03 Jul 2024 01:47:43 -0700 (PDT)
Message-ID: <0d0eb666-fc0b-4775-99ce-61f74b6c584b@suse.com>
Date: Wed, 3 Jul 2024 10:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 for-4.19? 1/2] amend 'cmdline: document and enforce
 "extra_guest_irqs" upper bounds'
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
 <37f1a5b8-9b54-42f1-845f-dddcf0b0401e@suse.com>
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
In-Reply-To: <37f1a5b8-9b54-42f1-845f-dddcf0b0401e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.07.2024 10:44, Jan Beulich wrote:
> Address late review comments for what is now commit 17f6d398f765:
> - bound max_irqs right away against nr_irqs
> - introduce a #define for a constant used twice
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Actually should also have added

Requested-by: Roger Pau Monné <roger.pau@citrix.com>

above the S-o-b.

Jan

