Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2420080CAE1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651816.1017688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgHA-0004EG-Mc; Mon, 11 Dec 2023 13:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651816.1017688; Mon, 11 Dec 2023 13:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgHA-0004BP-IP; Mon, 11 Dec 2023 13:24:48 +0000
Received: by outflank-mailman (input) for mailman id 651816;
 Mon, 11 Dec 2023 13:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCgH8-0003dn-DM
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:24:46 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a683e8a2-9828-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 14:24:45 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c38de1ee4so25357515e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 05:24:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c310900b0040c3953cda5sm9883227wmo.45.2023.12.11.05.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 05:24:44 -0800 (PST)
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
X-Inumbo-ID: a683e8a2-9828-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702301085; x=1702905885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O8qks4NZm7pw4UJIrlc3V00DWzpXG4PBarXADqLHIb8=;
        b=CJhz67+EoQ0QCg6N1uT2zEUVirfvpOOkrLR0uaRlvZ8/kvlYhm7IwgiREEW4OYo1WV
         HKrvPQUhtOPb+9lADlXRoODRM7SGq/TivRqNefVCGNXOZGUE/+kU+NZj8IIgeqd27mxY
         0CUvguyLHR0T0Yiy6EZUPduqPi8XubB9HiSAz5UGGw7CrAP7o9LIt20gleAvgilczYFd
         tXF90Ke2vGRK8xwJCtsXzCcPNmsCYrGVgZVhYNI/72wgC1alVxH7ucAdBLM4BgGk/lsU
         qUp+j9C7bY7wosaqPFIhqj68j1RCtq1Gc9wdM/JhPnzIbCom22t5j67aX3vHTFwEkpeM
         efHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702301085; x=1702905885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8qks4NZm7pw4UJIrlc3V00DWzpXG4PBarXADqLHIb8=;
        b=WLvmXdZeFXTagWlSl4jJNyC9RxCiwO/KllcWdqPiNhLAt3WnxowDZ/UowcWqnq2YOn
         mDczeIvpHTZ6M0eYRGNUtB3c5b8XRtJcHmyinEisivdG1O0Ab8EAuSZvbZU0CQfxTxcf
         0pmwf4AV09yk2tiL41CcnSD2OjAS2NcU+bwhpQqGS2kntXzbBgtl4pRBzrxK3FI200iJ
         XKJseQm1hVc6S+WYOGQfeB4VWstnvAVTlFeOh8GIphfgvEt7KFhBLrYtKBlay4CFjBa2
         AL6a4fDvCGwfiDhEQVloVYWZGwV/6i5r0+yxCegY1IbeLoewaMi/0Vlekdb+BgZJq6I4
         MBIw==
X-Gm-Message-State: AOJu0YzkDbgfkUHqWHWiDmn0t+frS1XeuM9SggHf6QkpG2D9ld2PGlss
	oMogvt0GXxoy9wGv64Ulug1V
X-Google-Smtp-Source: AGHT+IHnuLyBEw55NSU5rxgsZQ/fl7yCc5bE4eoRT5+KQBYNeUlaE7vFaCT6DS7DnlyBSGRaZMRkXw==
X-Received: by 2002:a7b:c4ca:0:b0:40b:5e1c:5c23 with SMTP id g10-20020a7bc4ca000000b0040b5e1c5c23mr2379484wmk.56.1702301085043;
        Mon, 11 Dec 2023 05:24:45 -0800 (PST)
Message-ID: <078ac081-e6d7-4de0-9d1a-d836ef8453c4@suse.com>
Date: Mon, 11 Dec 2023 14:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] AMD/IOMMU: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
 <68a1922cce9a68a8b69661d564fccc012cf5f414.1701936906.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312071639430.1265976@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312071639430.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2023 01:39, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Federico Serafini wrote:
>> Add missing parameter names to address violations of MISRA C:2012
>> Rule 8.2. Remove trailing spaces and use C standard types to comply
>> with XEN coding style. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


