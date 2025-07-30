Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3914BB15A18
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 09:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063492.1429205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1hp-0007px-3X; Wed, 30 Jul 2025 07:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063492.1429205; Wed, 30 Jul 2025 07:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh1hp-0007nw-0z; Wed, 30 Jul 2025 07:58:33 +0000
Received: by outflank-mailman (input) for mailman id 1063492;
 Wed, 30 Jul 2025 07:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh1hn-0007nq-DL
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 07:58:31 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb454c7e-6d1a-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 09:58:30 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b77b8750acso423161f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 00:58:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fd3fdf1f2sm88699135ad.123.2025.07.30.00.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 00:58:29 -0700 (PDT)
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
X-Inumbo-ID: fb454c7e-6d1a-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753862309; x=1754467109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GDZlrZ49Erd24XO/87MxTC6XiS4DrH2mPRhSF4E06e0=;
        b=NrD8HwQ8vZU5Oik6BctolRj0oG/2lmGPV62/yc8CCFzzb3K265A8/JzRNYEctxJGEK
         o6PAVmhGhKCSoXiCS6DlwR5tHIrRX/c2/l4IduoPugBId2nDeCWr29ju3HGA7+2hJ/rW
         s+tq7Fmk47WX0a2x4+xassxCLS0vfLkBs4iax38xL3Vf4Y/reWuT9NvITNZm1QAMhcGW
         Vhd4Y+y9g2byOoK+gSdV/IcEpke0JB/cpgUNhmeRGuSph9b88gC5CL9x6BJ6QiwIh/uX
         oNWS8r64vVy9rHljdV25Hgmc5jkupb2sKlp3l/5f4EzBttozU/ixcuqX/jlrGIDrKbju
         EWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753862309; x=1754467109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDZlrZ49Erd24XO/87MxTC6XiS4DrH2mPRhSF4E06e0=;
        b=WcjiqRwcjkZxddz4snDCjxJt8VvzHgp3MxUCg/RNS49UJJMep0eNM9aqsjuUf9lEIg
         bN2qiZnZAkjLpI0zdansHa6kp0vH1Fw+8A7smOkOQXxnEjWUdnT+hb1rwuShFpPToEvg
         PnsBP/aJotDPkiqp2oC3YMI9U03rk5kxxsofXQE8Tco1SYZmqVmMuW0vRrZOAjWZRu2y
         9nRqDgD1YbbttJavmjTUcFSvhl95wI/BO5GT70j1qU3fa++2qwQ7jjdesEUKIg/QhaLv
         frk3VooRBX6dnKHsQmAQa/BWPM+XItFuKcip9QkuASnCgHvcCokizjZw2j9lQqRMEmoY
         Sn4g==
X-Forwarded-Encrypted: i=1; AJvYcCVquP0Y9QMigibShaiqRa3nLw8RUsfOVf448wqtjEKSX0GVD0u6OZstphLovk0SjtaiMZYIwkPIV+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZfYgMoOLnmjMBxL81pNu+If6A9P4uYVLRAqtiyH4Ssg2/Zp1H
	1mnSAbDEnlyW3F9Ywq6pXA5TtJFY3FDHxpvfhtSavIQ9QHmCqCetUnBe0cOMZs4+mg==
X-Gm-Gg: ASbGncuz9Do8X6OgwQdWJFFOrkq4lqkWT8wTZpN+92CMvQbcaPtfrUhnBFc6Mbh3XkP
	K5wxXjLCOVGCY6dUc3JJdz6CybMtXja+0KhxOIhBoFFxXDTXpcj+c47Kw0hGg/I9+EaLp0nyzzN
	bzyZ8zVbqC6svXtc4Whn0nRAhfL86zgSBaSKcESRyiMkUJg09aUnyFJLohzdkFx6AZKNaMyk3Fk
	CTSf9Fe7G/6QBeMDS7D/ZAzm8679Cm0/W/9iEsDDTqKbU3ISBWcNbsMi0WoA3LQRCDTTADFWCtS
	sfKmGJfkx4R3Qz+XJ6l2GPLTlvUEwgvnfujurQIiSigGiwShCFw7E4dB6ESybiFsl36QfnswakT
	KFgAV2e7OPbIIDtbCiAA6jYexoRLDob6ibem8AUCNF3Pcrkax9VgRg5UDiAoJZbJ9fcYXHGL8xo
	+BSl30Yj0=
X-Google-Smtp-Source: AGHT+IFEtSTVPoEHxfvQRv8KRRth8sT/8CcTTx6XNRbk3J/sijCpOGPU7SuuqOPIl2048xiyKtcTZA==
X-Received: by 2002:a05:6000:25ca:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b78e726421mr4910168f8f.26.1753862309584;
        Wed, 30 Jul 2025 00:58:29 -0700 (PDT)
Message-ID: <30b88a32-dfb5-4f44-a6a3-8b997c2e070b@suse.com>
Date: Wed, 30 Jul 2025 09:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: remove trailing whitespaces
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250730031148.1613104-1-dmukhin@ford.com>
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
In-Reply-To: <20250730031148.1613104-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2025 05:12, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Remove trailing whitespaces in NS16550-compatible UART driver.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


