Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B069255A7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 10:44:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752794.1161024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvai-0006fP-Ac; Wed, 03 Jul 2024 08:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752794.1161024; Wed, 03 Jul 2024 08:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOvai-0006dR-81; Wed, 03 Jul 2024 08:43:52 +0000
Received: by outflank-mailman (input) for mailman id 752794;
 Wed, 03 Jul 2024 08:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOvah-0006dL-Aa
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 08:43:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dee1559-3918-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 10:43:49 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so213888f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 01:43:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70aee2bbf17sm649963b3a.29.2024.07.03.01.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 01:43:48 -0700 (PDT)
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
X-Inumbo-ID: 5dee1559-3918-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719996228; x=1720601028; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gZzNfk2HuwNPdiQxm9q03aWIREj2JhAxXzJk5x19kaY=;
        b=EBVHQtLjWaTztBj+DdDNFi0EsZAZYrK+RdtsMbMwnylzXPH0fCQC+N7bfRoAe3xfYo
         q8FjqCgY9hxtl6JIqtMGn3hI7CA2L5Ehx4ZBrI5z0a2tpR3gQo2KydWh7bgB2EurlBHS
         dslspRl/iLi/kC7j4zc3nIPjGJ7sDc2oPyMg9tVBH0KYeWP+sOUSYJIaTRS/nBsrPJOI
         V6wEHR4ATGwOLKjFF9wFzxkX1E54Jz/QeqzRQ7ri1iWC5vZueFPW7Lrb2WtLKVpQ9GU6
         rErycT9Wf8I8h5V1svlVK+2zNoJiU11++zdrP49dgzSws/XZQ11Fp7D2P+r9SqgA8pwF
         dbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719996228; x=1720601028;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZzNfk2HuwNPdiQxm9q03aWIREj2JhAxXzJk5x19kaY=;
        b=dK+KvHbLNU5ZWGZvyr3RU1jOEsGrDUkYJRxzrzhQRate8UJtVLupUil52wof8AvIL0
         0sQ31avOq0mxASQjtp5UsoFrk+XY3PLFlYzK5Y2OjCF2gKya60aTvzqPiDBSypW1XriB
         P10RqGeuOpfMnFxEZn6fztKBPIOBpm2FKy9k30PM2c5KIQkQVV0TzgM+kSRX2M+KRdm9
         w2RSrUf296I3cXDrRZNO6cSvKUjNldgm6YffS8eIbGhv5j9DCE393msCFAOaJ4Aca9OM
         /tQmTiFML9Iak6SLdQvN115kAb0pGuhzSmBUgpdFsX6jqzKopaFIzqwpk2iu/iQBTY7g
         RAMw==
X-Gm-Message-State: AOJu0Yzd47Zsqa7UDs8Nuw657qm1UyFcnSybp4MGGqQ5HQu0HQ8SduCL
	516IO3pJQ+Q3QY5dwVm9I1mTBQ/jrvVGR0Bx/GHOh5rvcyKLlpzJikXAycl4pYwGvtj85LWjb/E
	=
X-Google-Smtp-Source: AGHT+IFf5dDqprezV+7XEqWt4TdsI9OzI5wSLS5kaGIpaiTOSdOA/keVEOwaMNjwltHplRBXftpoAQ==
X-Received: by 2002:a5d:4f8e:0:b0:360:7856:fa62 with SMTP id ffacd0b85a97d-367947a35e3mr820279f8f.15.1719996228493;
        Wed, 03 Jul 2024 01:43:48 -0700 (PDT)
Message-ID: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
Date: Wed, 3 Jul 2024 10:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 for-4.19? 0/2] new extra_guest_irqs adjustment
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

New patch 1 addresses late review comments raised by Roger for a change
that was already committed.

1: amend 'cmdline: document and enforce "extra_guest_irqs" upper bounds'
2: cmdline: "extra_guest_irqs" is inapplicable to PVH

Jan

