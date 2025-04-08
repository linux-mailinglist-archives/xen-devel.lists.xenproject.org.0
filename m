Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF3CA80F62
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942381.1341554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2AbQ-0006hO-8O; Tue, 08 Apr 2025 15:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942381.1341554; Tue, 08 Apr 2025 15:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2AbQ-0006ff-5k; Tue, 08 Apr 2025 15:11:04 +0000
Received: by outflank-mailman (input) for mailman id 942381;
 Tue, 08 Apr 2025 15:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2AbP-0006cw-NK
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:11:03 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad0c0c75-148b-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:10:58 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso3415524f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:10:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364d07csm162796335e9.28.2025.04.08.08.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 08:10:57 -0700 (PDT)
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
X-Inumbo-ID: ad0c0c75-148b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744125058; x=1744729858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hxYlY0fEp1rSgsoP3SUpC3jRSp2CVc0LVS6pPfeXnsU=;
        b=GQjQPBeDWLZ5W/z5M8B4sUITEEWgt5w+9VL7ChPeMVhlVzY2IV2TKlvqtSt9pNxwKW
         ZgZSAGPjWf4Fc4AVsk5KazY5KjB8CWBpJi0Y0/BMoFdsrTfg+18LYaFiZnUJD7AHd6I4
         YRzEDe1D7SyVr8nRqSUe0rUx4ok2EOnwtP9h0IUYFsZQRF/8pqIY9fbs1t514PnLxLKE
         c10MZpXvr/B5Oy9t9wms9DL/O/ZLRbC9Mbppp1qbSKxLFZd4Wjpo8JeaKTM5xyV1iLEU
         kDqIJejsGmMXdFrbhsAwQSYiRGEYjPNDb8atHFkZVSV/ned4dZBMrE1dFkYbF7Tpe2Pr
         487g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744125058; x=1744729858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxYlY0fEp1rSgsoP3SUpC3jRSp2CVc0LVS6pPfeXnsU=;
        b=MdqrpBNe38mIrZXlDr8DVPYasLq7cfn1fHiDmQcKVQhpLxD4kaIU/7k5ruTbPPDluP
         KTi9FkMFLda53mquwW9lSqr/wSQlBEQeTS8AEU1bHi03sRUCl0+FCNvjjTavW6tz0Kct
         vXAFxgAKbw04qTb9Ked51UYPJEJ6KkHDDlW26NQOxai2/GHVusR03hyEwumwob+wl+u+
         Y53AWflovKNB9/p5ZrcXjMn9X4s88fJQBcmp8+DKHzIryISHnQkg7MPKPRAhZGPagNdw
         O92pk7Ui6UbJiAYSIHPy6lT1iQoJ3UsJR3qr6mbL6mbFRbaJWxdS85Bcl2laGOoVXbSq
         0ixg==
X-Forwarded-Encrypted: i=1; AJvYcCUVP6JHrhFUhbMtjys2F1yYAcCRLmaNfkU0Pf+sju75cI7Pn5I2xN2H+wwsiAjzKajQ3YKdKcfwklk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPvv22dyND7Yg/ovd9B+9zOaQolEEdKJDPDIRBZOyE2cZ4Metf
	Py/VoakJnrDLRC2n/HQS2Gf/PAlfSgy/cF+ve5m5N2VV/ow7hcoYWMpUGbQ0+A==
X-Gm-Gg: ASbGnctbjdO7A1/FIeifLhqN4Xr2kml890YJL2ijYKwepvJ8fUm3Qz6tw2i0TYSMrbL
	UMgpucdLXl86UxR8IgWvaOPVrGWmK33oIvupB8eH0uG+UrhYkIc20z/n8MMmRr+ckW4lO07Dx7r
	enBazaSYFY5aq+PbN8wPcIdX+VsMdEL+CBAUe7aj5yjJYrm+wxFCrKlvHKW4AfWR4S1Ea261ifk
	hhL1cfpwkNghZj+4aNuDI7KbePCEBo8eR6ztxoa7yaW7fkkDwTg42Kj11+XV1dsIP9+TYNGN6kS
	OEjv6MSOQRYDPUUSR21d6oVLeDc5Ekk5ZwI7R2e4nUb1LsGe0EG54qMPTPOxJyQVxpI4WQo6e2n
	hMrzLXKRZ+e4aGrUorZzYmY1sHne7dQ==
X-Google-Smtp-Source: AGHT+IE+Z9jELoiN5pfluRM8pMctbx2JjYolW2vKI4gEVI9svsGnN+MSslWdbGhsSEI0kJwzTCDUVQ==
X-Received: by 2002:a05:6000:1a8d:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-39cba93cd39mr16475899f8f.47.1744125058078;
        Tue, 08 Apr 2025 08:10:58 -0700 (PDT)
Message-ID: <bff7ddac-9072-4cfc-a4ef-b73c87b98d18@suse.com>
Date: Tue, 8 Apr 2025 17:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/console: cleanup conring management
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250403000604.169619-1-dmukhin@ford.com>
 <20250403000604.169619-2-dmukhin@ford.com>
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
In-Reply-To: <20250403000604.169619-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 02:06, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Move console_locks_busted handling inside conring_puts() to remove
> tasklet code duplication.

I for one wouldn't expect tasklet scheduling to happen in a function of
this name. IOW I think the little bit of duplication is warranted here.

Jan

