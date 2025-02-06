Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A5BA2A89A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 13:36:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882823.1292911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg16w-0004Vw-8V; Thu, 06 Feb 2025 12:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882823.1292911; Thu, 06 Feb 2025 12:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg16w-0004Tl-5W; Thu, 06 Feb 2025 12:36:02 +0000
Received: by outflank-mailman (input) for mailman id 882823;
 Thu, 06 Feb 2025 12:36:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tg16u-0004Tc-Cd
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 12:36:00 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea96be28-e486-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 13:35:58 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so203786666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 04:35:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f486e9sm92716466b.35.2025.02.06.04.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 04:35:57 -0800 (PST)
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
X-Inumbo-ID: ea96be28-e486-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738845358; x=1739450158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wmBXYKMKqloqlowmBUqvDbgcuEYSCMe9t9GV6WTK2Pc=;
        b=SkiiXdQCfGiApCd8lxibpXiUDrM2cbBYKhSB8y0GLBbKMKbLvUgUMgyVobtXYXY9co
         hGs3QGB9I3t7+VoZj+R1x2J8rxglgzV5EGkTCWcwirM/iF2bDD1u57MP1QOCGdOwxj4/
         4gGsxOkCdkfxMd7TxlGBxZrSr4ylCH69YX/ql3z3fPoB2FFJrsUI5KUM/pamWJVFDnek
         E+UiTOtVZYNZtCtSSfglejsoPXdynjcCNAIgeU7dAvurSvSXIQsHvhcD3752Hv7A0iVv
         CifPGURDSuRyzNnermqdZZHPHY+oGBhGiHDMmyqNmgcjxdWL3J9qbz1djT+9nAF5wso7
         GujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738845358; x=1739450158;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmBXYKMKqloqlowmBUqvDbgcuEYSCMe9t9GV6WTK2Pc=;
        b=YKVTXGhYkCChWHOREXzVmS7lQ/Sg8UivoE9XrYhLTOtR0DNJE69tF8R/0zIHsbWI7X
         eN7i7QYnpZs2JfFn3QA8c8SQ8Os2IoZA+h+5EnoFeHYgxsqrcURr8hN+ul1FBqKbbnv4
         w7CAPKp140/b6n6Sogla4vdbwvRQJGgpX9jXwBc/0Inqa9lGBWK97kOKxZzfPxK91EUL
         /0Tk9KwT7XFMCnDSBhExuwjXO8G8gvfJjbeTmjgqPLAIx17xxtxxQtev4/0sjaRiO7K2
         RFTCCSZHVO7DAJFRDqJLuF3arMdcjTjiSS8Lw8EbcwPwsfd6kEETRsAi1yk/in+ZfREa
         UadQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOVovmyN5EvfBJFuKB40fECCuSeq2g6b0ebwXIJjaShSP65SVIy0gkqfXvfrs29PPLpkCFlpUeO+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVPPlRENLzB7dARmiV4aj6AxVwE29lq33gxGWB23IB6Tyu4dzH
	ju2DIdoShL6SBvFZJfQTv3ajR5jZjYmvbNOqYqF4mh2VtKlE6mEPP8BOMVDqkw==
X-Gm-Gg: ASbGncsYZxRN9AKpfHjBPw+PspRdIsF0o0wLGL2WNBVy22RU4oXNITiZHT0tKX2gJLP
	yVrAPS7/gaUrIEtA/E8jLs37QnrERRUkvIR8QPCdneSW3sTIEiZ3y4k/0ZEcsNLkcfqLC/cln9/
	8JXOZyuwn0ao+YO6zDHXtiGH2p5WCYpSm4wXIzGk1eYAWqHYKRFGi8iBvLjRZYTDzvxlsBQ6Ucb
	4T2vXD602CdK7WQy92Q/C//ynRSB2arcafq9kCQ2IcccWXW4btJWiEN/oPvkZ96L/WRbXI9bsDG
	GOtxb1WMD3SgukZK1dhBKtX8Qt7M0Z8ndK5M+OJ81wGBYLIFDxNPhLU6zwjVWOebaeXTQw6iKNS
	L
X-Google-Smtp-Source: AGHT+IFQVLhETzZYC/GhLF8G36R+VaheVBBw/kvwoNegHoZiHW6VXb/vWYwvBD7hk0I2yA2K4VUuLg==
X-Received: by 2002:a17:906:6a1a:b0:ab3:974:3d45 with SMTP id a640c23a62f3a-ab75e24c011mr777721066b.1.1738845358046;
        Thu, 06 Feb 2025 04:35:58 -0800 (PST)
Message-ID: <b43ab925-a735-4954-b8b9-1e67419ce7cb@suse.com>
Date: Thu, 6 Feb 2025 13:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.20 0/4] AMD/IOMMU: assorted corrections
 (leftover)
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
Content-Language: en-US
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
In-Reply-To: <0a006732-2b6e-46f0-a706-f432abd45d2c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Oleksii,

On 04.02.2025 14:00, Jan Beulich wrote:
> What previously was the main bug fix in this series was dropped for v3. It
> turns out what is now patch 2 is sufficient to address the issue, while
> doing the requested tidying. The latter two patches are for 4.21 only, with
> the final one being up for debate altogether.
> 
> 1: radix-tree: purge node allocation override hooks
> 2: radix-tree: introduce RADIX_TREE{,_INIT}()
> 3: radix-tree: drop "root" parameters from radix_tree_node_{alloc,free}()
> 4: PCI: drop pci_segments_init()

any verdict one way or the other for the first two patches?

Thanks, Jan

