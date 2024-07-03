Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654E92644E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 17:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753186.1161476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1Zs-0001Z4-NB; Wed, 03 Jul 2024 15:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753186.1161476; Wed, 03 Jul 2024 15:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP1Zs-0001Ws-KZ; Wed, 03 Jul 2024 15:07:24 +0000
Received: by outflank-mailman (input) for mailman id 753186;
 Wed, 03 Jul 2024 15:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sP1Zr-0001Wm-6P
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 15:07:23 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2e4d8b6-394d-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 17:07:22 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so65229911fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 08:07:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-753c2f79474sm2568226a12.44.2024.07.03.08.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 08:07:21 -0700 (PDT)
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
X-Inumbo-ID: f2e4d8b6-394d-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720019242; x=1720624042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UrcB9AB+XlFI1B1hsgVUbIM3kgiMsC2mWiMD5eSt+hI=;
        b=YCWV1EXC+6lZ7g716q0Ls55t3jUF7HJWoAd0wYJZxk9KE7HkBRPk0u3VDNmqlOyCI5
         HX8kXz/3GtmLe/T7rTl10sWqejm5jA4raZBBTPo39Pr6ZJjp7TsIoapto5Yx2iUJyuJk
         wC30XgfKJHhpfsEVOHEOB2Ip4YS2mdN1npseTShnvvgL9ngnWG1+XFcSPURPvSaNggSh
         Hgg5NzXwoWMhmBiWKb9V5LeSv4IqvrePonar2VN+3IvVDbRgnBpbKSezkag//D0M8t4u
         yZ6DU27FcYouNmDn5KdyH4dAPGrMW3eu/SEHPrxcnOkja/DT9oig3JaiCU7LLedrjFWr
         IXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720019242; x=1720624042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrcB9AB+XlFI1B1hsgVUbIM3kgiMsC2mWiMD5eSt+hI=;
        b=Soh7/ROCX8bmsJY+15r9/sLFhJqlkbSGht6IswXYWBY/NqL8hsc9EhxbhlvKUq9djU
         rvKW6b8Gc9DMyeD0HFL4GLgguaho/WYEDt8BwnmRyEgW5lJ5uTX+DH0obFuGRdVmTFnR
         G4dFbsFnmcplJ9RHRQAAEoNeaWiUN6EZ7JTLaTVeQZEIwX7qiH9Q1TyLzUYL3EzZgYbD
         rOJEmVYzBXpFzu/tUi92lkAj3yBLgVa95WjHJRulNtC3QTJJ90UDoQLP6kAml4VlUoiB
         znonuJy3hotbyooytwwBSvNVo8Oa/Xs4H50gNP0Sm4GLdWone9IfnV746MbYAW09ZH2d
         dVEA==
X-Forwarded-Encrypted: i=1; AJvYcCUHNA9/k3+7pb0hATuuw7D0/sezgSoHMS9/ZJJWuwfHtHr4OnczcBoScH8sP9X3U7BNrQFuEb9+WEzEA4z6pbtneYzg66JmVKsbOK1p6XQ=
X-Gm-Message-State: AOJu0YyAAHlC7rfLQhT5tOoC7ykcW6IEp4RMxY56S3s5EQeBMGGLjK4g
	ziVNHcAruYSEz0eRYnO6++0hrfr3IRXoPKA2oX7zlZrfPr6MQ8cPj58MQglGNQ==
X-Google-Smtp-Source: AGHT+IEEkse3/CFRrR8yE7PdeVYpA5Dwaniutvuq9TWjOBUqLeowr+5wa9BSxC5S8BkSeIIwpJh9WQ==
X-Received: by 2002:a2e:8687:0:b0:2ec:4d48:75f3 with SMTP id 38308e7fff4ca-2ee5e6f4bb6mr67590391fa.45.1720019241630;
        Wed, 03 Jul 2024 08:07:21 -0700 (PDT)
Message-ID: <0f883617-f4c0-43af-895f-3f70d4143a34@suse.com>
Date: Wed, 3 Jul 2024 17:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/cpufreq: move ACPI cpufreq driver into
 separate file
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1719832871.git.Sergiy_Kibrik@epam.com>
 <d8a13eb8c53d8cde99d7fa1d8e4fce2a597f02fd.1719832871.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <d8a13eb8c53d8cde99d7fa1d8e4fce2a597f02fd.1719832871.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.07.2024 14:03, Sergiy Kibrik wrote:
> Separate ACPI driver from generic initialization cpufreq code.
> This way acpi-cpufreq can become optional in the future and be disabled
> from non-Intel builds.
> 
> Other than acpi_register_driver() helper added and clean up a list of
> included headers no changes to code were introduced.

And perhaps that's okay despite the many style violations that you move
around. However, acpi_register_driver() is too generic a name. How
about acpi_cpufreq_register() (not not have it grow overly long)? Plus

> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/acpi.c
> @@ -0,0 +1,622 @@
> +/*
> + *  cpufreq.c - ACPI Processor P-States Driver ($Revision: 1.4 $)
> + *
> + *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
> + *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
> + *  Copyright (C) 2002 - 2004 Dominik Brodowski <linux@brodo.de>
> + *  Copyright (C) 2006        Denis Sadykov <denis.m.sadykov@intel.com>
> + *
> + *  Feb 2008 - Liu Jinsong <jinsong.liu@intel.com>
> + *      porting acpi-cpufreq.c from Linux 2.6.23 to Xen hypervisor
> + *
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or (at
> + *  your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful, but
> + *  WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + *  General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + */

... I expect this should be transformed into an SPDX line. I expect the
one in cpufreq.c wasn't picked up when the conversion was done because
it doesn't fully match whatever pattern was looked for at the time.

Jan

