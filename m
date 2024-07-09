Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517492AFB3
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 08:01:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755780.1164252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3v3-0005Gw-4J; Tue, 09 Jul 2024 06:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755780.1164252; Tue, 09 Jul 2024 06:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR3v3-0005Dm-1Q; Tue, 09 Jul 2024 06:01:41 +0000
Received: by outflank-mailman (input) for mailman id 755780;
 Tue, 09 Jul 2024 06:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sR3v1-0005CI-K0
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 06:01:39 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4228098-3db8-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 08:01:37 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52e9f863c46so5085125e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 23:01:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b4396841esm911966b3a.132.2024.07.08.23.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 23:01:35 -0700 (PDT)
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
X-Inumbo-ID: b4228098-3db8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720504897; x=1721109697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2/oDrPjYTRtL4CaFzN35PxxO+aFEvs4QyrW41Ac2CO8=;
        b=RSXLG3Y+Wm6QG8zCiGdbUtlHKECmMSQMDy3WLI2Hq9tQS6NWc+oY1zefRaCZGtFnMA
         CeYjLPxFyuiHcdODoA9WnQPSltP7WtsFYxzGJMQHYL04GHVFfYLDFOUSg4NsX05bc9YC
         Jwz9/xMA0vkEKPZ7Utcf+HB56/E1dvYNyBrJTEORLmkexxs6zSu1osrGgoYAnsGAI6rw
         WY8XwEJ8HfouhEzZFpJu4rUy2Mpec4QT6LNYMZLr/DoYSWQH1Prc04cduh/iwbnaFygA
         A6KwOBOvrOtQGQtfnVchaI4tzLHThl8HuBatFRPnqGSm8OJCLRUyshB4dVThAHTbS6sO
         IieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720504897; x=1721109697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/oDrPjYTRtL4CaFzN35PxxO+aFEvs4QyrW41Ac2CO8=;
        b=Uh9Y9Z+x0oRGWu2qRuHj77IALTBWEpw76Fwuql1RupMAkaBeREDR2FB20k+fw3WNI5
         yeC2vK8qf0nZBQy9tGdo/iIo8zJ6GvR/sS4MgBYut2zLmOPkaJVzospG0uzJE/4AGiQW
         xlw4dHlX+otTH2c64I9dZIC5/4hfyVkMeWsaBv3iGmvsUQLk8EtcDubNQ1kXRStidVFi
         OkcbEiBjORVpFeR1WztLFUEotble1KQcGfSWNgskkVNZFNWRDrd3IxphN3bX190CTipm
         rBgj0KsHESfsTHEtjV3CJxB3e+zLNgd+f+o3P5EDGOK0SnyG3U9JaZ7MOr+zonqt2ReJ
         bl0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJBLpwzp9q4+vlOCICQ85JA3MOmM2nacZCEdgTWIvT3h4UrTlKPDGgPSzjB7voroiJzY47dWdSMwIYDUWKcKAKPSi/RHQCErKBmdzTMC4=
X-Gm-Message-State: AOJu0YxGfEx0kzPGu4+B3tnZ1xJxWBgxhy6E27pacxdNxincPEmhH6ub
	apOKjmohOnTI2gf1nuoavIUv1YSf7ZB2zlZdwlxPIRwHQTa/0FTMkrHVqmtrHg==
X-Google-Smtp-Source: AGHT+IHBPQ9uHFuBP+cxx+Qjzu9OQ9TQKiU6Iy0lPJRneRIaGKC0kI4W34IZ+6n6VtyIVpGkdiCm6Q==
X-Received: by 2002:a05:6512:3190:b0:52c:8a39:83d7 with SMTP id 2adb3069b0e04-52eb99d15c2mr904412e87.52.1720504896303;
        Mon, 08 Jul 2024 23:01:36 -0700 (PDT)
Message-ID: <ce036655-b947-4591-93e3-44e87b44e9f2@suse.com>
Date: Tue, 9 Jul 2024 08:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com>
 <3b2c9019-b907-44d0-b767-315f7d42a2a1@suse.com>
 <BL1PR12MB5849A3D071213C5CA8BE5F1AE7DB2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849A3D071213C5CA8BE5F1AE7DB2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 04:47, Chen, Jiqian wrote:
> On 2024/7/8 22:56, Jan Beulich wrote:
>> On 08.07.2024 13:41, Jiqian Chen wrote:
>>> When a device has been reset on dom0 side, the Xen hypervisor
>>> doesn't get notification, so the cached state in vpci is all
>>> out of date compare with the real device state.
>>>
>>> To solve that problem, add a new hypercall to support the reset
>>> of pcidev and clear the vpci state of device. So that once the
>>> state of device is reset on dom0 side, dom0 can call this
>>> hypercall to notify hypervisor.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Thank you very much!
> 
>>
>> Just to double check: You're sure the other two R-b are still applicable,
>> despite the various changes that have been made?
> Will remove in next version.
> 
>>
>> As a purely cosmetic remark: I think I would have preferred if the new
>> identifiers didn't have "state" as a part; I simply don't think this adds
>> much value, while at the same time making these pretty long.
> Do you mean: remove "state" identifier on all the new codes?

"part of identifiers", yes. As that's a personal view, I wouldn't insist
though, unless others shared my perspective.

Jan

