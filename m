Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433AB220C2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 10:27:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078444.1439442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkLf-0007DE-03; Tue, 12 Aug 2025 08:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078444.1439442; Tue, 12 Aug 2025 08:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulkLe-0007B7-Tj; Tue, 12 Aug 2025 08:27:10 +0000
Received: by outflank-mailman (input) for mailman id 1078444;
 Tue, 12 Aug 2025 08:27:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulkLd-0007B1-F1
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 08:27:09 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 228de14e-7756-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 10:27:08 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6180ce2197cso5538575a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 01:27:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618465fb431sm1708492a12.33.2025.08.12.01.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 01:27:07 -0700 (PDT)
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
X-Inumbo-ID: 228de14e-7756-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754987227; x=1755592027; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qz6ppPLgaBrJv0BjXlT/BwhWZfY0abwTkQmwUIAYXO4=;
        b=aCdP7WmsPxcP9DlIT1ICz6+RKzeDST6uyg/3yqMtf+en/y2xm5KPylgODjJZPOfPMN
         H38nmo4pSRXvHXvTC7/5rBBPwoBs85MltifUmKZuKxZPKCCnQ6XtPCJMfg7wZiqi8XF4
         z7BvQrITJ25Svri1kvr6zmLOgbgBz6gdlEIvGGRW8oOWmMnRbMSENLX3zd/f1imlvdXn
         wK35maAuA6Am8WpMoEki7lH/a20xsNhnRFRGxaWBegcCvACOJwBAwWh/YbktZvmLZCHJ
         /RvV/hqSxJEVjWNCam8CuKvpx4NFayziPuiEY+sCtlvtkn098XFl9W0Q3ePPJz8DyM1j
         lZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987227; x=1755592027;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qz6ppPLgaBrJv0BjXlT/BwhWZfY0abwTkQmwUIAYXO4=;
        b=AbZnsT1g8LA6B8SeoRKfYs0D8FDgwmH2qfHgQx314zYXW01pkNTD04Ub1f8kyjGO3x
         6Cb7+tHcX1tCYesUOBvdMzu2eHM0rSllWDkJ44OdsCr/QXBaW5BXOIgdPqrmyX8BfZNC
         We230wvSC4taAkdm/enwMgyR9UPlH3A2KyN+hcdsXR5zZholJN/JDjh6GN2ssZ1KoNiI
         c0aiLCcNJf9GjJPboLRMu/VppZG+JzVoD4vv9x2atg/0g8RJDC21ONh9g2Gx/ONJ3lkV
         tpF+x1kivmAYI1tnB5gtbBfy5imuLBn0yEGrSbuiwWe1MQGWaWgwMHyqdp+vXm/BxJs2
         fgsA==
X-Forwarded-Encrypted: i=1; AJvYcCVmdI1AT4r7FZHC3KbNIWOJhbZ0sMElZPLIT9qDCGHStqxfVMGDdda4ZkBaGG5CW9Hrx6qJUJhEY5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZho9HAiTzRxp9HfdrdU0keCry11GRPBTIMy+V6SWzaTG5UoP7
	XA+dMqrTeKANm29G2BvEt/DvzzXWpUASkongo5I/IBHBfF+CCiQcc2e3OCPCcaKVWQ==
X-Gm-Gg: ASbGncuwMdFLnGthLF0wX5W6ZQcWIMjI19SSEgwEr1DP1oO++z2yfWL45bcuF14LiNc
	F5Tm7gXAFlfxKbm8LOq3TKKhmHWGjb4PqYQjznrU6+db/wvGk5O3Oqtw743wMiKRRL+G+tWiX2o
	k9qKXMtYoDWwHzEPomcPJazwn3X9JiJDUaNwbxdxwLcQYaFv57U9zzTA24nGo2J3RPMR1OcpLg2
	j9FN7IgM2Exk0c/ZZlK0Teh6R6XMEW+rAvaU+ByNK9faeMjnu/o3mm7PwyKXX/8CLMeR9p0Bo0f
	k017uXFUmx2/OoVISookQ/zPta7jDN/A8aBW81WOeCsXvWCbMmE0DUwKOFSUOX0YgsXQcajAfXK
	jyAwaaXMvloA5MfPokvLsaUKLPMPwRAqxrupsvTI2ULbFSlk3RN6U0XShS+yKuGT+rhopEbM9M8
	uYdr9wTHg=
X-Google-Smtp-Source: AGHT+IHu+lqXqwKQu3owDql+kfucDs0OEsvC/CtOji1iwEGJxk9gILv0HhonOMUyAP1zJhfvWWe+EA==
X-Received: by 2002:a05:6402:84d:b0:617:b3ee:9be6 with SMTP id 4fb4d7f45d1cf-6184e3b3202mr2030235a12.0.1754987227333;
        Tue, 12 Aug 2025 01:27:07 -0700 (PDT)
Message-ID: <fa34bc4a-64d9-499c-bc07-787d2cdb36ea@suse.com>
Date: Tue, 12 Aug 2025 10:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/22] x86/spec-ctrl: Rework init_shadow_spec_ctrl_state()
 to take an info pointer
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:22, Andrew Cooper wrote:
> We're going to want to reuse it for a remote stack shortly.

Are we? From the titles of subsequent patches I can't judge where that would
be, so it's hard to peek ahead. And iirc earlier on it was a concious decision
to only ever run this locally.

> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Nevertheless, trusting that you have a good reason:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

