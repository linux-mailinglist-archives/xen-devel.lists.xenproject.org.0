Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B398B085B4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:59:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046245.1416517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIam-0004oy-Mj; Thu, 17 Jul 2025 06:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046245.1416517; Thu, 17 Jul 2025 06:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIam-0004mu-K0; Thu, 17 Jul 2025 06:59:44 +0000
Received: by outflank-mailman (input) for mailman id 1046245;
 Thu, 17 Jul 2025 06:59:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucIal-0004mo-BV
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:59:43 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d2e7e84-62db-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 08:59:42 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a53359dea5so251236f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:59:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1b540sm15002793b3a.74.2025.07.16.23.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:59:41 -0700 (PDT)
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
X-Inumbo-ID: 9d2e7e84-62db-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752735582; x=1753340382; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OtcnQn6I3tPthY9L/6nuYnF1TKGlC7LcsA1Jlvp7xIw=;
        b=ZVafoCMu2z47ezmn6ZzpcdeQ9WDTEJt8/Ra6IcUWEAmtjoqYGZQJSrQhzA5WxmDHoT
         QelvZv9eSYcv/qIen0RgCfzmSxRm1KxpmAyLUrsKbB4E6iwQcwMVyKvTBTZ+yqpv5XDN
         Qr6lqg4HCeG3Bkj9wBk5x6hU+wDL+8LQZlT02epl6NjfFh4+4X+E2qjuwAA41BwCeIjg
         fy2oSQzm3Ozdlz/o59J+D5GTBknEUXVSjZO6D+DktW1IiLqh6XCqYfLENWutvVRamJ+/
         wsNxvkarGbfoDBPcVofSWidoi9M0WeZuxj6SCk0HvoDtbNaAiJOkrGkHy8CQ/D41WRQU
         bLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735582; x=1753340382;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtcnQn6I3tPthY9L/6nuYnF1TKGlC7LcsA1Jlvp7xIw=;
        b=YTtrnCeffJCyfhcEbGui0FtCVHdEPoQlnyaMVKSbuv4yHCrseZi/n2JOkY+NZHoASL
         Tv2t1Mg2Qm3RJpvEe45f+wdQW1/7QCsT+aGkzWMvFbWp6aSv/nqr9wo9q4VEV4QfH1zx
         8sWHGWsXP0FyAeHC+kuydjtiUCOzEkhXS4/kTgin+X0H0zMFuR4oVnCBpBHpcAJi4rCH
         bQnKew8aM9wA64Kh12q/Ju45CZRP969kLk23w0Yr122qEo440/+a6qqxNBUkc3l832Jq
         naTfmmjQ+HLy3y6rOdIWtuf0x86sn53vHxrumU3ohpuHgsH9Gm0hLWLWstD8rfAkmOYL
         8ftw==
X-Forwarded-Encrypted: i=1; AJvYcCVc1wYz6sTQdgdUcHeUT1fqmAoZJ655CNmr/nd8/EFj967Hf/19Qp4qFJXEpeT8UktuHqO1niuTehs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAQXqeOvz/7t86Oiu0xXw6cuq8VBBF59xwpVQYbSDzZMv920QW
	IR5W54gt0Xu+XdT1Bmkj76zuMTnjwKaINWooG56iNJ3zVSNksNAXZkIFpaqzK5nNuw==
X-Gm-Gg: ASbGncu5Zp/J6UQtybP+vkuaojboxj6qVxyFPerAefMFFVdtx4+Hgdbqz9za3FpX+Bm
	DRYUgdvlwoktt9ZN3AQTr0BjmxKXuZQ26XRuxk8PqoCnhJA/V0EkMkqqvmI4r2MBKNw1wlwP4B8
	3CR2Y04xOLdObS2EsLiPr/ta3raVfnI+/Zc9Qw1iN49zZTrhwzRJJxWbSYHcmiWIQr9ZVtusudH
	6r1Dr5p1fAwPjePNzNAAPilTXYUgPnRG5Aw+imy8W0c9HXcxKzrlh4+vOegmp6hu8c5qPwjNaiB
	NnDhrxabxud0mHj/YXHMsMD1ZTum9Vcen36JUaPNXD/3CaFYmyh/XwAm5T0Ub6Ksto6RQIeBgO2
	cqLAtA0MlHY2zErJdLnGFqStpLzKjCcTL6rmndZasvKCYJW8SieJe+MfgpXHPSPtFrlOiz3SpFK
	NPxn/NPl8=
X-Google-Smtp-Source: AGHT+IFp0x5d1NCqmkNLFDCecpW39Gd00EcvfqHKX+cMRDBOLs0kosw5NGF+mnMAGTBA5yDeLv5RUQ==
X-Received: by 2002:a05:6000:420f:b0:3a5:2257:17b4 with SMTP id ffacd0b85a97d-3b60e55003amr4185494f8f.55.1752735581840;
        Wed, 16 Jul 2025 23:59:41 -0700 (PDT)
Message-ID: <0f0495a9-4ac1-44e0-babe-8fe278d37fec@suse.com>
Date: Thu, 17 Jul 2025 08:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config: update Mini-OS commit id
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250717065648.10163-1-jgross@suse.com>
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
In-Reply-To: <20250717065648.10163-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 08:56, Juergen Gross wrote:
> Use the newest Mini-OS.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


