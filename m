Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122C8B5704
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 13:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714018.1114979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PRO-0001RN-QI; Mon, 29 Apr 2024 11:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714018.1114979; Mon, 29 Apr 2024 11:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1PRO-0001Pf-Nc; Mon, 29 Apr 2024 11:45:02 +0000
Received: by outflank-mailman (input) for mailman id 714018;
 Mon, 29 Apr 2024 11:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1PRN-0001PZ-Lj
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 11:45:01 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8533ef3-061d-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 13:44:59 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-34b029296f5so4385238f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 04:44:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t13-20020a05600001cd00b0034c66bddea3sm8045627wrx.37.2024.04.29.04.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 04:44:58 -0700 (PDT)
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
X-Inumbo-ID: e8533ef3-061d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714391099; x=1714995899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcKb1hsA8BC5Tyn3xNa0Pv+fwnyK1HojJWwmPM01kDY=;
        b=Q96HcAravZ1yMMrwaqfHHeinIHeUvkjSwxacPADUFjOLRQbTFbK5Z33qK6ypPIku5y
         aJqcGbkXRd7bak9iugHzsdTG5A9SmCfE7uDIme5sb4ffzLFClusgAu3k2u1A6SEVB3Mt
         3krRErIOLRGurhcToWbt1ga3OCc3CUBwV0Swq3HRtb2oWNIt5A3Cghd8pisDunGNQs3u
         aBQKE5t1oJYRGpwW+gS67V+joqsJYtHr71/wgbChHMcX7UElJ3d8WVliwC/h0Q4dX4al
         DRa8PtSS9zz0lKEPVYSVHX2uTAPoapoYzBwRi6oRPnFSanzpbxRdnFa5nXh61Oy2ices
         JToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391099; x=1714995899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcKb1hsA8BC5Tyn3xNa0Pv+fwnyK1HojJWwmPM01kDY=;
        b=YcwZxJmKTza3t4Lkt2o1H/Ne10Tl4gFknoFsnyhNfEhTn3Jy1cnb71iITEM+rsNvz8
         A9nxTeP8tHEBOJBCZdgnY4JAIH/q3njo3yPQyn3nE0+gHg2gsecsFq+njtkBmtx+HQPa
         Hq1oFqXL6epU0+2r2CTITRNHtsSxbrkroDPeEoxGSEx/ZXJEs5D6QiFXqcoG4XqbuOTy
         Fe0B1hq7MFdu/xeVBn2L8yLs+8KqgtCcbacU5LdYNTPAu60fdKgSBP+Z1CHu2O4XMWe0
         PgkYsOe96QoKFMWIfdynkH8hc2eCb5JADmprtaljv+gh7fRDStTiR29rNFMg7To1NzM/
         Txlg==
X-Forwarded-Encrypted: i=1; AJvYcCWf96AHX7hhrL+9RHNWhsllHjTVcDHyeoPS5Xde73Jwnd2kpV6QSUi+rPrFIVo7TGVekdeWKVSCO0jmOQUgvJWIM3543XH3dMwMu99XDWU=
X-Gm-Message-State: AOJu0YxOi3YsQhEGhp4U8h3ekXrZ7SS1elMYjwUA8t9tsqEsZ1dhZTU3
	MC04CUZ/SwEd4maN0Onyjc1nwaSdgD1H+ajiKLXPD6HmnDzLM4kv/xgwct5IZg==
X-Google-Smtp-Source: AGHT+IGYMUEG9y68OcQneSLaeUhQhcJZI8GLEOmnEqT7TzkUyryL2wf93zRKhBkanAgGcRBrZgtMEQ==
X-Received: by 2002:adf:ed4a:0:b0:34a:3e3a:a23c with SMTP id u10-20020adfed4a000000b0034a3e3aa23cmr8680527wro.64.1714391099004;
        Mon, 29 Apr 2024 04:44:59 -0700 (PDT)
Message-ID: <1587a623-7cb4-4095-8023-6cc36ad1ff0f@suse.com>
Date: Mon, 29 Apr 2024 13:45:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] x86/boot: Refactor pvh_load_kernel() to have an
 initrd_len local
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240426140140.465506-1-andrew.cooper3@citrix.com>
 <20240426140140.465506-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240426140140.465506-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 16:01, Andrew Cooper wrote:
> The expression get more complicated when ->mod_end isn't being abused as a
> size field.  Introduce and use a initrd_len local variable.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



