Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADD797378E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795499.1204884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so070-0001xa-UR; Tue, 10 Sep 2024 12:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795499.1204884; Tue, 10 Sep 2024 12:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so070-0001vp-RS; Tue, 10 Sep 2024 12:36:50 +0000
Received: by outflank-mailman (input) for mailman id 795499;
 Tue, 10 Sep 2024 12:36:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so06z-0001uL-9x
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:36:49 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58b4829a-6f71-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 14:36:48 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f75aaaade6so33979871fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 05:36:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8cdd3sm4237156a12.96.2024.09.10.05.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:36:47 -0700 (PDT)
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
X-Inumbo-ID: 58b4829a-6f71-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725971808; x=1726576608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a3xqhKe2V4hP7VjyNfJjl2E35TafJrVbJyzMXlI9uuc=;
        b=CzkGy53lavj/YTRU4ow5JAA2FO+VuJmwIcMOzUHS3kJi4Qo33UkjbQK750j5Q/Pafc
         9CggGwNSrh1TB9On5vO3Bt+HPCe441aupaK0Xqrra3/CLoKTp29qmOAYLRh6+eRTsJuG
         bZlYoWMy4BEcmXuQM7ETmoUP1O+K31ejmRrZulY4PiC3obYnlHbzCUQzUtaWE02TnH3n
         nAuMuMpptD9bmzqyQkUhPJgHbCgXUpInHVtCX9p1h7zJ2QXN8UPVlOG0ZE2RBE8w9SWg
         U9XBuXYVz1ZT4DDMP6+Z8YIGU99VkyQyA28vtT7zew0yAzdpaUdFPXRjmwByYNYgLtKk
         jv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971808; x=1726576608;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3xqhKe2V4hP7VjyNfJjl2E35TafJrVbJyzMXlI9uuc=;
        b=xAmODOl3aFwk7polv5eENrhtT/I1oqjD+m9nFow4BU1nBP1vzqfdwMinZNKLc9tZ47
         nsHSxAApvOC1w7IenNlm932fVdTf9etBOgpexi8cyIkSjxATxc9vutP8zF9sF439t2mo
         hJI3TDitA2L9Z0sD0kVu9L8mERtP3IAjnGF7OH8WC+XdW9HlSiOnu5lgesm+5Mc3Hv6x
         q/C/7MPeYhA2QJj4i+e3GYs/DVmHltdtx5dRqdLj/TODFG5b+WxprfWdia83b4g3oTvO
         mXqwPidNn0Y2iu2lRuGMX9JUvfu5ofPFkp6hLbR3sW+DNI9RydQPYqoODq6YMxcPc841
         z4+w==
X-Forwarded-Encrypted: i=1; AJvYcCUuHJvf3isLlfelFl2QAYeIsXtjkDhQdJCUeWS3qiDgtI99z+92O9T56haHO8SgYWeClFzT0EEjNuw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbuHQTuIInwvg3b52XFkIhH1B5pjREtp5QXUOzT1iH3WVTJI14
	kvx/iQ2fQQg+uUPIvb8idmW7DOy+7LzKrJaQ0vdLIxpdM07PB1eExXSLco7pTA==
X-Google-Smtp-Source: AGHT+IF3MoHGt1ik2VoSI/zIwXkBeiwZ9N+LJCLGLJBDe7Y5/hECHzQfOWFESmPwN/oMzTzhzfvfug==
X-Received: by 2002:a2e:801:0:b0:2f3:f8d7:d556 with SMTP id 38308e7fff4ca-2f751f01fafmr65227181fa.18.1725971807575;
        Tue, 10 Sep 2024 05:36:47 -0700 (PDT)
Message-ID: <3fb809a5-d0a2-4b72-b810-13e4ee93b8b7@suse.com>
Date: Tue, 10 Sep 2024 14:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] xen: tolerate ACPI NVS memory overlapping with Xen
 allocated memory
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20240910103932.7634-1-jgross@suse.com>
 <20240910103932.7634-8-jgross@suse.com>
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
In-Reply-To: <20240910103932.7634-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2024 12:39, Juergen Gross wrote:
> In order to minimize required special handling for running as Xen PV
> dom0, the memory layout is modified to match that of the host. This
> requires to have only RAM at the locations where Xen allocated memory
> is living. Unfortunately there seem to be some machines, where ACPI
> NVS is located at 64 MB, resulting in a conflict with the loaded
> kernel or the initial page tables built by Xen.
> 
> Avoid this conflict by swapping the ACPI NVS area in the memory map
> with unused RAM. This is possible via modification of the dom0 P2M map.
> Accesses to the ACPI NVS area are done either for saving and restoring
> it across suspend operations (this will work the same way as before),
> or by ACPI code when NVS memory is referenced from other ACPI tables.
> The latter case is handled by a Xen specific indirection of
> acpi_os_ioremap().
> 
> While the E820 map can (and should) be modified right away, the P2M
> map can be updated only after memory allocation is working, as the P2M
> map might need to be extended.
> 
> Fixes: 808fdb71936c ("xen: check for kernel memory conflicting with memory layout")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



