Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39884B2F5C4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088495.1446240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2zl-0003uz-Cv; Thu, 21 Aug 2025 10:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088495.1446240; Thu, 21 Aug 2025 10:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2zl-0003sv-98; Thu, 21 Aug 2025 10:58:13 +0000
Received: by outflank-mailman (input) for mailman id 1088495;
 Thu, 21 Aug 2025 10:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up2zj-0003m3-7n
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:58:11 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9fbe2d1-7e7d-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:58:10 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7347e09so148051266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 03:58:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4ca67fsm371030866b.92.2025.08.21.03.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 03:58:09 -0700 (PDT)
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
X-Inumbo-ID: b9fbe2d1-7e7d-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755773890; x=1756378690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FjwG1DWfSFofvB8XBnFDmHUdLo0hicU7CroMspGQlB4=;
        b=QlEmEHVfSfXs3x9CPUG0a0vAbuviBbgLi/4IlSUV4fimXznuYzFjj7Brm5Rb8vm7vW
         2DUMnSl8M+mVZCOLCPo7MGJzhcviQhZUpMmdKwfXZ9w1i6FXl4r/Ku7xULrqylfLq5nG
         hlES4GndkHDZfQ+xQzVZqLx7o0CA3U1Lpp5TgRzuR6nnqmFgvCvk43kuQHDIWImssES6
         vX3XAFjxyIeIL+TssNk4GHyoHxOBQpUH5c2unn1nbI9ySSOybXDFo9kS0FhLW6WNthWT
         X4Hm/eRW4eluAOOcz7VtCskDjKR1nbWJzhNNkCJ6E58scDTpBzlTa/eRs1XJd8e+5OVj
         n5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773890; x=1756378690;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjwG1DWfSFofvB8XBnFDmHUdLo0hicU7CroMspGQlB4=;
        b=WWVk13sO9vkcY9Nf+CajQ33dt0jk8Tf0dQa6mn1LAVL0u9k7ZscByBVKa8XeLlNCKo
         pGmG93KS4JGsr+fiBQa1P4wv0Xyc5BQ3+qxekthczutQQx59VyS17RfuAmd1AQOG+PNU
         OoktBvuRxbUnKSG9yTb1yK//ttlw8AmSuNQD7roalLs1RSccXw42Lf6G+PjG6/TRBenO
         nc+z55WR0ttd499ITrhzTckpRFH+bZVKrGBQygWBsgPqN/LLq93ruqCcR6THYs8LUmAw
         V5/2S8Ih6o01ySsaCMEuCO00OAlTsFKsZx0Qtaqw+cN05RYgunJPGvpdJNGJd13TjJKb
         tDlg==
X-Forwarded-Encrypted: i=1; AJvYcCX0+U2B6OY4taHi+byjPwpVWXTu7IwthvcMhY+IoG8jeKQiQaQjJEWE+LiDFwVH/wxUK+MUVoNNpb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0XGVh44Ck5PfWpPpH//TEVvBEQwUG/rg0NIXI82y+gfkdegU8
	QT6QeOgZAelXfmUsh8iOEZLlZUL3L/dnhwdWjZXZuOJRVZm+S5uPufgFE3BY3c8hQZBAtKBbxpb
	r1pI=
X-Gm-Gg: ASbGnctqk7CogdeTSPzK2a0rB087rpp512mZKOOr+jvQ94mgS7gcXvypGvHp3lE7eeE
	wCH5NFry2fK4zGsEjH1XqWjB4gPvBnyyGoAuwLKLFptTH4n/AVtKttYB/pRagcqkVQI4Cyu2AqS
	17puUbVbkxgm3AD1DAR/d4PhtJ0auf2IAOalICQHPsn+ueuwGvFLLkLNNRe5+i6ea0wgMfCPi32
	mvj+2hCJdjNyJUx4wf0kOAR4htPxga514CZufsdG9ac1kTyq6Zo1ux5yyGVn972CY0oUrIVU7tL
	CXHYBV6jeukv9AOsnLbwrCh03qjrw0ovuGnf40tJQMQ7pOmSlYxcwbERRPJtaZCtnBp8YiPLSdw
	O3b5m2VlLuTB6hYl48Jp0D+pBe2mzrCynSF2jkv5MK10qi5r0fj5gmLa4uU7MrCB19QZFXawXfp
	J8VLhV8e68x3C6FTq/7A==
X-Google-Smtp-Source: AGHT+IHjdRDri9ezYCuMAym/+IvLH+x1Rz9R4z/pvNBIpiLX8dlj51pkhHkB5p74j4bd2tG1VwBawA==
X-Received: by 2002:a17:907:6e87:b0:ade:4339:9367 with SMTP id a640c23a62f3a-afe07a278f7mr180340066b.26.1755773889748;
        Thu, 21 Aug 2025 03:58:09 -0700 (PDT)
Message-ID: <a2211b6f-4dcc-4e8a-bff8-ed162ac3bf36@suse.com>
Date: Thu, 21 Aug 2025 12:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
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
In-Reply-To: <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 12:50, Mykyta Poturai wrote:
> With PCI disabled the build fails due to undefined struct
> pci_host_bridge.
> 
> Add ifdef guard around pci-host-rcar4.h to not include it when PCI
> support is disabled.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Oh, and - Reported-by: ... please.

Jan

