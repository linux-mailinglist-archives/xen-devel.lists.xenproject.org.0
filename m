Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E71CB0047
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 14:08:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181660.1504687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxRw-0008Gy-LA; Tue, 09 Dec 2025 13:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181660.1504687; Tue, 09 Dec 2025 13:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSxRw-0008EZ-II; Tue, 09 Dec 2025 13:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1181660;
 Tue, 09 Dec 2025 13:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSxRu-0008ET-Iu
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 13:08:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d83feb0-d500-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 14:08:12 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42e2ba54a6fso1907124f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 05:08:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222506sm33659189f8f.28.2025.12.09.05.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 05:08:11 -0800 (PST)
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
X-Inumbo-ID: 1d83feb0-d500-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765285692; x=1765890492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pMiVUzm8asTDH+CVtzYaOPE+6g1fAOaVu1cBSl+DPY4=;
        b=cS3YolBzUwghkOodWo9Lp3FohOcTNT+TcMYpL4x2RRKRG1qf3dicvBFdFynxs1Pb3n
         m8x2RYURZnRTvUW1vF/yfyS75JhUPAb4mqPyM8Pveme8NaVZTpL+rvgLzLOJXJ/uTEgC
         PiaP5YgD/srRRqmD0Uf3YeVrXkz9t6PCiONw6Du5qGVM2fXN1dxYbNjHW04aTR4jfV8d
         8S7MWeWXk8jE0lbBrXNcbkCH70pBKoYfkh3ycp9mXc+f7+CS33WR09yCEt5Fx4Lw+2EI
         DwsaQ4WCxm4SWjsYeJ12v6azTVoGdMoYI3XpP0Wmj+zl61wDDSk5RLP0Qbleu53nBe4U
         HuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765285692; x=1765890492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMiVUzm8asTDH+CVtzYaOPE+6g1fAOaVu1cBSl+DPY4=;
        b=ap7WNw6K1vnw6GyyELUW8gaqX+xsSvZBq+ophzcQL5Wl7rVQ2tk1Vj5xPCgMBGpOZp
         2M8W7qJeM6kMXa3KgAjbLYl7MmQz3YWJmAvwQHz6QPlBu9H9DsV07UwnZZaY2omILpV1
         ZHK31egbf/LrlrjVzz3HXEJmoz55cfzwgkObcLPXY6e/4j5evp961AF3ncFekxysnKg8
         kPnfoOmkE58eDYKEs0XZObkHuqj3SD3SlGKFB3RzkNqAOq3nuv4bKckRIFOQ0YW8xsse
         SCpsyTIA397BwzmiBFjTX75eiSXYKJsr1gZHSoYcvF+MO7RmSgbVyu5albuTAJ+7n/eZ
         0lwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJFzDgLFsqACUZbqx0DMwPBO0dDLcCtvAgDPzXFi5rj8023Cy2NrMqjap4ku4HhB96RWN15wmXKvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxn6/mMwy1R9EXkAl5diFfwCCUj/9k7UmEbYjCSKxX2yElbUEk8
	GfiMPu2yUj/qjHk4+3uGKOQbKDW2ZPuQtDlKIt7V+P4IlPIBBY9prxwegbeL/C3Eaw==
X-Gm-Gg: AY/fxX5+L6os/WLpUY0EGOu3JY/gdT/zGreIC5nliaDvfWysab/IW4dzRx5EiCgHOp1
	WAvVfcAB2Ldj5ifOUrusZCKP84+o9r8CnOqtoyn0w56hbR3sGqozPNPP6nFI0gP4gRzVsyiYI/8
	oWa40H0DbTWoO9UyaoE4q1EUlXrp7x+b4WE2fgukbU5xJ8YXM82ISDbShQ5RtQCS/0MwAOcfA9A
	zkv2Zeorzl+zJj8SpnY/Erm5WJHtPIAHxo5FBKcmGHLdkbz1s8DdrOVqI9azqwCZkkRf2F0ePm+
	iId8rIbEJVmx8q4BJ8gRhiNol2O/qa+JsriVoYErn9wqJjffZ/DWxc8zv1Bp3gS9SimLmeCiaPo
	pSOJeXMs/zm6yUI6sWlcysr0qFMFlEW+Lfyxn9vipKU35WHxxviZDOWdKGnsDxSrb6sc5yo60H1
	9GvaShfQZYpHzuomncqOoMHCia/cRGkFGRFY0PBOK9biVXGVcs+65TzqpJ58eiJ3RaMJs2YQZCJ
	00=
X-Google-Smtp-Source: AGHT+IFH+XZl2ULnlq0TQ77CqtWVsTgKBvaDJSspeH/H1vYPH7FfxcE3DwZmG3HGmZs/hGT0zfSsfA==
X-Received: by 2002:a05:6000:bc1:b0:42f:9faf:4170 with SMTP id ffacd0b85a97d-42f9faf42eemr1601806f8f.31.1765285691639;
        Tue, 09 Dec 2025 05:08:11 -0800 (PST)
Message-ID: <2f8eba17-2fa0-47d0-8970-dba21ccd2759@suse.com>
Date: Tue, 9 Dec 2025 14:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] domctl: Provide appropriate error code when PIRQs are
 not supported
To: Milan Djokic <milan_djokic@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <b38b7b65630d1f167d1589d21556be1493c180be.1764961645.git.milan_djokic@epam.com>
 <88ab7d88-9b25-418c-bc5a-fc080c5e78ff@suse.com>
 <c2749a60-daa0-40d7-9d98-27868d37a560@epam.com>
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
In-Reply-To: <c2749a60-daa0-40d7-9d98-27868d37a560@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.12.2025 13:48, Milan Djokic wrote:
> On 12/8/25 14:08, Jan Beulich wrote:
>> On 05.12.2025 21:36, Milan Djokic wrote:
>>> When PIRQs are not supported (e.g. for arm), XEN_DOMCTL_irq_permission
>>> command is not handled.
>>> This results with default (-ENOSYS) error code returned to control domain.
>>> Update command handling to return -EOPNOTSUPP if control domain
>>> invokes it by mistake when PIRQs are not supported.
>>
>> Did you consider simply replacing the bogus ENOSYS by EOPNOTSUPP? (Assuming
>> the difference in error code really makes a difference to callers.)
> 
> Yes, this is the simplest approach. I didn’t do it because I wanted to 
> keep a distinction between commands that are part of the Xen interface 
> but not supported on the current configuration/platform, and commands 
> that don’t exist at all. I also tried to follow the existing pattern, 
> where unsupported commands are handled explicitly rather than falling 
> through to the default case (e.g. set_llc_colors, soft_reset, etc).
> If this distinction isn’t useful, then yes, I can definitely just rely 
> on a default-case error.

Before you (possibly) follow this route, maybe I should mention that there
have been discussions around this in the past (sorry, no pointers, too
long ago). IOW ahead of any consolidation (and making things consistent),
imo as a community we need to settle on where exactly we consider ENOSYS
valid to be used. My take is that almost all of the uses we (still) have
are wrong. In particular all the ones for "unknown sub-op".

Jan

