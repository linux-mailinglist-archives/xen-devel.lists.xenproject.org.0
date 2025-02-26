Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86FA45FD4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 13:55:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896537.1305274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGwM-0003dX-5K; Wed, 26 Feb 2025 12:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896537.1305274; Wed, 26 Feb 2025 12:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGwM-0003bc-2Q; Wed, 26 Feb 2025 12:55:06 +0000
Received: by outflank-mailman (input) for mailman id 896537;
 Wed, 26 Feb 2025 12:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnGwK-0003bQ-Sr
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 12:55:04 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e461631c-f440-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 13:55:02 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso68636975e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 04:55:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba532d33sm20436305e9.15.2025.02.26.04.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:55:01 -0800 (PST)
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
X-Inumbo-ID: e461631c-f440-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740574501; x=1741179301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2477vRx63Q+Xa3CS7rxVQh6FCSOJy9jlP91UvCLugyI=;
        b=GcSA907EKPGu1Ncoc7/EMB8h54aDin6p4BES4ZG6VH0Lr/L/ea+mx5B5O81GBVbzfr
         PUuvW8iXUi3h/cSN0K7K+Ko27jjeln7ZfgLfM3MyXxsEb1Fv0NAk/TMfs50S9vDdYDBy
         03U/Y7TT1B63GedlSoIYHCSZ7UxHVETFcHboe4TsHTjHckyPaXKUxEa5GRc0fR+q9SBM
         89tmx8hhUsNdgljSqAdVTAtzR9VMvUGVXgrdZXRw4kVC0mHopNLZ2mQn0vuTmLG16+B7
         apcft02mNCf/IBscqJ8kTCnVYXpb21JXsrhLjoLcW7yvnB/mtT0WtTsdyeR/FNS+wQ/3
         XfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740574501; x=1741179301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2477vRx63Q+Xa3CS7rxVQh6FCSOJy9jlP91UvCLugyI=;
        b=cPuI14M+bZxVm1ovwvlIpqKCYdWLo79Vqn3FluSVH5KKBCTkok17ZaxTfAgNDRSc7b
         n+zU8cCv5jHi986Ls+63h5rze3xD14dj7lmFbvYvocw6eaYj8zduMwI9mNyquu8s6trJ
         zTO8ToVDoxeIsJuEtsjiXmjg4VPK4I0l3Y27gimVIn0pic2ECfLudchqAkUHobG6dkoG
         rs3ErnLyawwWyI+DmmJoHyH3Lex7HZVMgRp0FA4B9+QK6SGr0235krqLoNRf1yvzQES4
         4Lqsloioi+I4rqeR3j7d20FLL1UUzLCwBYhjm3zGqrExoTOgnguUnDg8mtMuqQtRiQqr
         Gg1A==
X-Forwarded-Encrypted: i=1; AJvYcCXNGUVd2CDL2wNWG6UYNUfFmEbGCqn7rIZB7F0c9caQWvJnXmcN54phwro4lY6ZHnqKD1wo260OjJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGNKmdjJ5BpNp5OJcXW+J73gJrbthQLtAj59dofq0Mjuxlp0dz
	WBBHv+OBSFCzrIrVLGjO4y1CN9Qm/N0ZD+FMKLd1/EpI/fXoiImZaM7BxEL0iQ==
X-Gm-Gg: ASbGnctFTjxaVGXWdbFbLyAocEJ4+JUjiWXXiRxZzRkHRAW2WWBtzNwcEFTKoZVksCh
	lFfuEoGfawOtyLQ3ROq0+fwayAaJVSqPEMKO0uPlCFdgD/nYsJivmhb7xs1djNXtLsd51ipTxiY
	8q4RUzkajOGS8/4KpcK1SzO4ro03UjW+bMdm7oWOLfI+mjphTVgiamrRmqmb9fPIALMzidq0tKg
	NZkgTUWE88uGUqvEVHV75NwXTfqGwqI/uctVnJzv7KbgUPSQ7ym0W9OuOSpHilaISlA3aDtglX6
	+mP3L/zLp+E4n/ef2dGcHNBfBWB21xt3uevDR6d2KBKakBc6dTdurHm/L/uexfVGGVfEYTdvCIg
	tTf2SiTAWhQ4=
X-Google-Smtp-Source: AGHT+IGRBbUlMrq8cNLOarKSkrZSDEneWZKRyTa8CCkXX04i9T/mVW3NtmChoLx/RZD9RPaqipV5Fg==
X-Received: by 2002:a05:600c:1d1a:b0:439:916a:b3db with SMTP id 5b1f17b1804b1-43ab0f28872mr72614385e9.6.1740574501410;
        Wed, 26 Feb 2025 04:55:01 -0800 (PST)
Message-ID: <0585fd30-7052-4600-9edc-a17dd252bd1b@suse.com>
Date: Wed, 26 Feb 2025 13:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v7 2/4] xen/riscv: drop CONFIG_RISCV_ISA_RV64G
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1740071755.git.oleksii.kurochko@gmail.com>
 <c48d287edf04f6960a16ad763e09b790bc1bc89b.1740071755.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c48d287edf04f6960a16ad763e09b790bc1bc89b.1740071755.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2025 18:44, Oleksii Kurochko wrote:
> 'G' stands for "imafd_zicsr_zifencei".
> 
> Extensions 'f' and 'd' aren't really needed for Xen, and allowing floating
> point registers to be used can lead to crashes.
> 
> Extensions 'i', 'm', 'a', 'zicsr', and 'zifencei' are necessary for the
> operation of Xen, which is why they are used explicitly (unconditionally)
> in -march.
> 
> Drop "Base ISA" choice from riscv/Kconfig as it is always empty.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



