Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB26B08568
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046232.1416497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIRT-00034x-MA; Thu, 17 Jul 2025 06:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046232.1416497; Thu, 17 Jul 2025 06:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIRT-00033W-Iz; Thu, 17 Jul 2025 06:50:07 +0000
Received: by outflank-mailman (input) for mailman id 1046232;
 Thu, 17 Jul 2025 06:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucIRS-0002wy-5O
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:50:06 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 443bc0c3-62da-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:50:03 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b611665b96so300520f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:50:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4285ee1sm136549845ad.38.2025.07.16.23.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:50:02 -0700 (PDT)
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
X-Inumbo-ID: 443bc0c3-62da-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752735003; x=1753339803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rRLOFQcJTfpKuyv4K++mQ5zYdfEDDXLN1zP3OLwuoq4=;
        b=aToWr9Zh+JMPWwwyzmBInQGZW34zSMN3HovpR2/cJxmR3yEmBcYrJzvCMqPaJ9lCQy
         09iXUy+CWwOqxIWJgJOAYwPqmBKRnaXaQxSPpGS6R6RDITePVDCgQxjtBym8A4CN8OcJ
         zCe1waAzXV+RENxwxHKcs1fnDlZZGq7daRJE1ZxCngUcyQ2TOE1DWLQEBpSCR2tRO3Fp
         KpVB7GHi2MEBB7dD6HB4ZyFVFlc58iTKvghOU67EooXXiQNi+CuI7gbQicoUi6GAUqMO
         kupaoFDjkEvCIMPTrZNwfR0lM2IAtluCXvTVTGvRTSv5R3VZI/fqi30UyQo66pbiAc9Q
         GdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735003; x=1753339803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRLOFQcJTfpKuyv4K++mQ5zYdfEDDXLN1zP3OLwuoq4=;
        b=VYT18uVU9ed2Ih7FlmC9/hs1IgcOhmSDWKwcJrGfjOqOmp7Gjib2V041IdRW/CGvsM
         18gCtvKia3meB938HFo1lTiF14lZv3FEt9AK/9hJeJtdKmG/x8sjOuFNYOXzdXnwpz2d
         w6+eMhPeCSlSFS0Sl9J0kngezq5VC0yDcX+osp+dqHF/yk62enGjJpASLBsR9kwLKqr8
         LDV8dAfyNrIGQq46VRbDTgan2TTMJhHiMVyP0F/taWfGzBZ72gozepsjpvrKoIycvb6i
         aG/sb/KUIzls8HOJqs8Qt/uMcTTt2EyrMT2uOpezWPD9SS3yIe43zBzGpPXtlG0s3aHu
         maTw==
X-Forwarded-Encrypted: i=1; AJvYcCV5+hHRXZpSHUHg842JHJSLvMXDCreWw7ihz2KfG094LNf2FmaK7bWFXO/0m7jNJQSXcnr5zuqoeAQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyidJv/J7CpLci+E+KkX+EpeXoztKCNU2f5r0L1vfKtBa8u71FQ
	XFJ+27GNXH8WG+E8Thi6NdAoCDKEl0E42tXv3+139OyvmZDiP+EmBQuEyl/AkECaZQ==
X-Gm-Gg: ASbGncujnS/IeXygYU2xoG6lWII9b465PzawNCEgE2SB52B9k4pepXUlPxUnjJ/VO12
	mypSLPKRsfy+fnqV57Ag5b2m1amhA8UdzyZktIkEgospodDMGu9YRbRDQnjSBlQlYD7LW7jIwvY
	wBcfi5Ql2JCWb4qkJpQAVxJVnJN1i11RAt/HgOF9BB4wTg9StWenoStX/BpEeThlwBCEMLIP92w
	P6lxVXO9eCkYw6INkEGytAmaORsx6/QV/rx0NDDV7nve7yqBXNzc/9yZfG2qxsePmWFu0qJyGpO
	Rr5XvUXSQif4hl5J6M8UHX6bwOJcfiflK8nXEbGnJbQomBVOjm3X9l9U6FB5Mkj1Tg7s3vmrpuL
	rdD0LldX48HGCyUH0dXiMfuQ+8F55e74+lDYbk8K2eK9mm4KuGxHC+SIqCL72ACWgm18TgeroYK
	hFyjpaYEc=
X-Google-Smtp-Source: AGHT+IGcJeZNmBUKovqH1Fti3H/x+pt4vZOaLU4C+js8mE8Dvtcek2GVHl9ckau5RY16Omx+pVuBmA==
X-Received: by 2002:a05:6000:1ac5:b0:3b6:938:86b7 with SMTP id ffacd0b85a97d-3b60e513724mr4528984f8f.35.1752735003085;
        Wed, 16 Jul 2025 23:50:03 -0700 (PDT)
Message-ID: <39f6555a-acea-4fd6-acdc-f19b681705c0@suse.com>
Date: Thu, 17 Jul 2025 08:49:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Prefer d->max_vcpus to dom0_max_vcpus()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250716141807.52585-1-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 16:18, Alejandro Vallejo wrote:
> These days d->max_vcpus is populated on domain_create(), so use that instead and
> avoid a function call.

One further nit though: Please limit commit message line length to 75 chars,
such that certain git output (indenting by 4 chars) still stays below 80.

Jan

