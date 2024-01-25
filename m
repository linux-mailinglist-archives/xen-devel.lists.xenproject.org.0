Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A583C7DA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 17:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671637.1045083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2Z7-0000Bj-9a; Thu, 25 Jan 2024 16:26:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671637.1045083; Thu, 25 Jan 2024 16:26:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rT2Z7-00008v-6Z; Thu, 25 Jan 2024 16:26:57 +0000
Received: by outflank-mailman (input) for mailman id 671637;
 Thu, 25 Jan 2024 16:26:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rT2Z5-00008k-GQ
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 16:26:55 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d2b31c0-bb9e-11ee-8a42-1f161083a0e0;
 Thu, 25 Jan 2024 17:26:54 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cf1288097aso35196271fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jan 2024 08:26:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c8-20020a056e020cc800b0036197f7f157sm3760360ilj.2.2024.01.25.08.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 08:26:53 -0800 (PST)
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
X-Inumbo-ID: 8d2b31c0-bb9e-11ee-8a42-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706200014; x=1706804814; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lS/QFd9JgayhWPSwlPdPzOLOtKzV6aRZX87ksbq+cQI=;
        b=J4dk2hpA9HlAZ2/sixTf5/kWzyHiryTHy3kf/q8uw8pFrUiyCaYEAOif2KrvG4AkoK
         8qEaYVqIJmH/6Tqpp1w2TuMXV+CDcwwrixODPMs30qXqebseG2FWH0z78RbJmmEAkfxV
         izxPI6UvU+FFCHzxG4peI2u+IuZQa5gGh0L2Mc6iXIatISRTq5PEpnopNnqAphn9j6jf
         aFljzeqH75LDaBqux1cRMk6KLJQjrmFHtiGhR7THe0ZS1LHXZie2THHvol+lQNc0MPN/
         pBW04xNbTTWsV+MiKjt/X2UndgLSrz9fQelXj94p4jKzFqNwkoIzV8Ds8XCQhGcZwDpH
         n6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706200014; x=1706804814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lS/QFd9JgayhWPSwlPdPzOLOtKzV6aRZX87ksbq+cQI=;
        b=uhKfohm/tA+ZdHaI5zPRP4xRDTYU56PJD6gc4vTfX9OpivnXUJk7QV+jPBtR/csLYi
         yf68vgcEw5KNp9nIROoajmDyPb3w9hrekWy58VRBceEzGD/3rPFEyNvPu4Iqor3cwLf9
         OpiuRC+jgfoluEPtuOJZ/K8H7A7IlZPbRlvVZuk3gFB5GBMYuemwNekbdjivf69BVF0P
         +IRWcWesyR0O5U215FZ+oUofWEaxEb9hJvj/sZmim+0K1CYrD3iRgBObONxOHqp5wH0w
         4kQf1qxFROEqUyBrEtJnJXcFueFdLLBiRiutHDJaxY8Yg6FjfgHN+I7V5dPvL+bBs2Vc
         cgYQ==
X-Gm-Message-State: AOJu0YzF3XNdxnJDychLZw8rEQFQc54yoCc6RKHnDhMbZBM+9SBji2c0
	QURrkbsazfZiJYuq0PQdbLoUpssFi7TkaroDYnciJnyHWAQmZyW5tduqKq20sg==
X-Google-Smtp-Source: AGHT+IFV0j6XSP5o7onfbyQ1UP/b4txN7/eQie5kCCaqtWl8WNLr+ESMo8ftYiYr2Hmt6gDBFrPMKA==
X-Received: by 2002:a2e:b059:0:b0:2cc:6210:1dce with SMTP id d25-20020a2eb059000000b002cc62101dcemr792266ljl.4.1706200013931;
        Thu, 25 Jan 2024 08:26:53 -0800 (PST)
Message-ID: <f4c31d93-ec71-4d63-8412-14b94bb078b4@suse.com>
Date: Thu, 25 Jan 2024 17:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 (resend) 03/27] xen/vmap: Introduce vmap_size() and use
 it
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240116192611.41112-1-eliasely@amazon.com>
 <20240116192611.41112-4-eliasely@amazon.com>
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
In-Reply-To: <20240116192611.41112-4-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.01.2024 20:25, Elias El Yandouzi wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> vunmap() and vfree() currently duplicate the (small) logic to find the
> size of an vmap area. In a follow-up patch, we will want to introduce
> another one (this time externally).
> 
> So introduce a new helper vmap_size() that will return the number of
> pages in the area starting at the given address. Take the opportunity
> to replace the open-coded version.
> 
> Note that vfree() was storing the type of the area in a local variable.
> But this seems to have never been used (even when it was introduced).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

I'm not really happy with exposing the function, but alternatives coming
to mind for the next patch aren't great either. Hence
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

