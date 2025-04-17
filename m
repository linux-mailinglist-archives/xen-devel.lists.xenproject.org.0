Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93688A91DC6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 15:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957722.1350773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PDG-0005gM-8h; Thu, 17 Apr 2025 13:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957722.1350773; Thu, 17 Apr 2025 13:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5PDG-0005dh-5m; Thu, 17 Apr 2025 13:23:30 +0000
Received: by outflank-mailman (input) for mailman id 957722;
 Thu, 17 Apr 2025 13:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5PDE-0004vm-Id
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 13:23:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25ebb968-1b8f-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 15:23:28 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so6302465e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 06:23:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3086122a8absm3608044a91.35.2025.04.17.06.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 06:23:26 -0700 (PDT)
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
X-Inumbo-ID: 25ebb968-1b8f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744896207; x=1745501007; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vp0XsgfBCwSYXrqewNhPa0cqeDGB95WLcciTrdonSLw=;
        b=SCUnzlcA34jY1pAth1Rq6WkwtbYlTzjN/OJRnUmeX9MPC9ne9EC7lxObJ1K1wgsu3v
         8wl9CEv9aNUZf7MFlqtyXOuKmva6f9ZtliGIO6jhQgL/Nmiy+TNJLcT0hYQhNck9t0D5
         XLea2FgPW4tiPXLdvUpcS5qOaU+bPbTXdbBn2K7uEgrQSftFhRIp4O6/C8ygI1ILgVq6
         pjdSQRP9/hDc6PZEmmVkAQpQ5mfevV9oeWVZ++7SQQVVuKU4/tTnESyHnT7ZQshMxg+T
         497Z8cd6NFC+tuAGdFvdgpLd/wQnLCbPj6iKZCRiETPMBlGnFdciViWb9yxg2fEg4lb9
         WedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744896207; x=1745501007;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vp0XsgfBCwSYXrqewNhPa0cqeDGB95WLcciTrdonSLw=;
        b=PpAoFro8a8tT7sasamK8dSD5kaaL34oQ4NNLimrufPYpGCttDmYqFPfVPejzJPczYC
         xrM+7LReDGJMIUOFkQ0vc0N0Q0I39GCr9u0ig181V17PVLFOsIVJebaryLBtVVRaxmzJ
         L3M4pGNUUTUZFHhVJk7XJyyOxNVD4kgd/DPCAFyFig/KCI7C5ccXGlLJpE3c+TvGJ3UV
         yvksk0RaeMJD10t65rBXfAvhPbLzM9MP3Ch2yEa8F5Gs79DwYXyFhNsPgO3TihHP1gQ2
         Vmvl0sDDQXBG5Nl20F13cGwfiiXoSHrYZAUVXN4qwwnz6DJeEbEJtKaobGj3FtyfuEY9
         YuYw==
X-Gm-Message-State: AOJu0YzjUhfmCqn+FybFmhQZ/TvZ88TBDOXdUFld4SzLqu+KURxoSDjy
	NHHJwvP9N7bG1s6hK9ibinEYIQJ7PoZkIMQ0W9cwHsU2k+/PwX84Ek2ZA29tyNDCGTkuaVoayNI
	=
X-Gm-Gg: ASbGncsFKHyv/LGM8oio3HCZL1Hsv84V8i1OscX4Idwr0yi0TXyHhTe9ZYWy23+c8FN
	m7TvSmKb4n9/iYQr2hxTezqfWpUPitTu6frK9TYHoduHni1VjFFluEcIX0nVvQ5qJ1IELCfGsG/
	ZFFJwqfTMgsEr1MA7A17llKWFR6hg9Hu84/LJOorCNLI41A6+ySnaeVqO9DAb+24EGR8NIN9kbb
	zwTuiFzVhagKxX6fmaROYndUAJUa+4PpsjPrvbOISYUyDfYWfeWg6Ur3XdW6CWWSoyqBusfNob8
	RdNFnrE43kYTOfRnqFJGHTq94lHqpsidjssCBXSD3WSuMMaC4ScIVCUA2+x7ZqMjgPpJdefCTqT
	j2PJZHbbf39kAp88Jw9otBgRe3g==
X-Google-Smtp-Source: AGHT+IFEXz0I0y9M/Wr1hbDFMOzwZeFzeZ2SVNsjKxqYpTqPWY0mV9G726+Dnww/sR6QkVrLjJVk7g==
X-Received: by 2002:a05:6000:2210:b0:39c:1258:7e1a with SMTP id ffacd0b85a97d-39ee5b9f4b0mr5538409f8f.59.1744896207431;
        Thu, 17 Apr 2025 06:23:27 -0700 (PDT)
Message-ID: <37065e8d-33c2-4e6e-8c2c-f4f8a9cd3ce1@suse.com>
Date: Thu, 17 Apr 2025 15:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
To: Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20250417103000.827661-1-ross.lagerwall@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250417103000.827661-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 12:30, Ross Lagerwall wrote:
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -104,6 +104,14 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
>          cpufreq_residency_update(op->cpuid, pxpt->u.cur);
>  
>          ct = pmpt->perf.state_count;
> +
> +        if ( op->u.getpx.total < ct )
> +        {
> +            spin_unlock(cpufreq_statistic_lock);
> +            ret = -ENOSPC;
> +            break;
> +        }

Simply producing an error is not an option imo. See pmstat_get_cx_stat()'s
behavior. Imo the calculation of ct wants to become

        ct = min(pmpt->perf.state_count, op->u.getpx.total);

yet then the copying of the 2-dim array of data becomes more complicated
when ct < pmpt->perf.state_count. An option may be to document that this
array is copied only when the buffer is large enough.

Furthermore I think it would be a good idea to also amend the public header
with IN/OUT annotations for the fields which are input and output (also for
the Cx part, ideally).

And then - doesn't xc_pm_get_pxstat() have a similar issue?

Jan

