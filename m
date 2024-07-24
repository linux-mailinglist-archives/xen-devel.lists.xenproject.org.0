Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8E93ACD9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 08:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763770.1174080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVt2-0006W9-Vv; Wed, 24 Jul 2024 06:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763770.1174080; Wed, 24 Jul 2024 06:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVt2-0006UB-TM; Wed, 24 Jul 2024 06:54:08 +0000
Received: by outflank-mailman (input) for mailman id 763770;
 Wed, 24 Jul 2024 06:54:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWVt1-0006U2-HN
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 06:54:07 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84e2231b-4989-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 08:54:06 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58ef19aa69dso5174997a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 23:54:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a59be83c69sm5180416a12.58.2024.07.23.23.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 23:54:05 -0700 (PDT)
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
X-Inumbo-ID: 84e2231b-4989-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721804046; x=1722408846; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LsOjcoGm+30jXQP9UfeyD1a5hhEGlKTQno0S2gPuCU0=;
        b=fZbbRmqT73RETm9TB80OKEHW4ER/+aYzo7BkpShA9BNIxwWKGBYEbYOvlmgLTlXrbY
         vRsQ2OIyGB3YRD58xyOkp425leM6EidmwaQWPrTSrfW1rMcruqO2X6+SK0YzsXm1+fWa
         DAiL5dA5kjuSORt6HmiSerZIZNFE/v8trnPnySGW0T5cJeATY5wUwABES7j4Ryvnb1Li
         XXWPPB0KYH14VIsc0EAvJ5deyP7TvqJ9VGGgEykk58Mtyp0TcW/Xim8ZGjd4aVQZUkT8
         MjqqyT19RdbYnt8KCtHgzxnEwjXbR894vyY9HrsBc2nlBjktwXBLihhrl6FI0CQ8qXC3
         DSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721804046; x=1722408846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsOjcoGm+30jXQP9UfeyD1a5hhEGlKTQno0S2gPuCU0=;
        b=ujxAJ9mHDBn+P2Y9HFdqnXNO/d2apqbMXv0RVzOVEe2KqSQK8LEPyjvVWOv6CzcTmI
         ePcOkIA2tpE/Aa2RbkvEU00kvzgxAPN5sja6mVC7wHr96ozeijAtnkc5CbInILMh1PN8
         ay8WGxg9cN0RK6yQqbNiqawq2QEwSt6YlR7NPD3sx9QEKw75vtNtLKfdLa1G71tqMLCS
         IshbkSjY6+DylTTGkRhxBohGiH4crApvnDvsC1hyaBEvoRcvo8QkHiCfH448gn8dr0e+
         9Fs1V2o+xd+ImqHw9K7UyDcVyIZWDFrxQ5rbmQZ2tihlueLrYlbrk458V2BC8LcUHwrV
         Vjqg==
X-Forwarded-Encrypted: i=1; AJvYcCWzakfnTXbOEVMhJZQEphHIJt53JoF36b22IByZY4+OdPC3tHpgBNFwg68TkU1bU178SocHPIt3PMdQaVvR+q+bGsJ8Fh+BaYDBMC0XExQ=
X-Gm-Message-State: AOJu0YwYlIAAMOZfuIMo0OZ+cyJPSKTqpimOjcqI0DYy8RErvKF+CliI
	KI49pKA8cjXwQe7wMWXN8uTe1CJxSUlbY8ysbU0JN10pqztX8ez7Qt6kmnGSQQ==
X-Google-Smtp-Source: AGHT+IECdLND7sCB3+z89RmfXnP2F4KLDLgbhuGIiPK2EUeg3/+ackv4rufs8Q97rg24KpVjA09SPQ==
X-Received: by 2002:a50:871c:0:b0:5a2:763e:b8bf with SMTP id 4fb4d7f45d1cf-5aaedfe2befmr814539a12.25.1721804045653;
        Tue, 23 Jul 2024 23:54:05 -0700 (PDT)
Message-ID: <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
Date: Wed, 24 Jul 2024 08:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel test robot <lkp@intel.com>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
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
In-Reply-To: <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 08:07, Juergen Gross wrote:
> On 24.07.24 03:08, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
>> head:   368990a7fe30737c990f628a60d26d9854a9e690
>> commit: 368990a7fe30737c990f628a60d26d9854a9e690 [12/12] xen: fix multicall debug data referencing
>> config: x86_64-randconfig-012-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/config)
>> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240907.u0NJHgTu-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
> 
> With current infrastructure this is not easily fixable, as there is no way
> to tag a percpu variable as __refdata.

Would it be an option to drop the static initializer and set CPU0's value
from xen_parse_mc_debug()?

Jan

