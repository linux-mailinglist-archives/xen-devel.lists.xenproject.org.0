Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3DB8B9E2
	for <lists+xen-devel@lfdr.de>; Sat, 20 Sep 2025 01:12:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127155.1468256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzkH4-0005YF-Ae; Fri, 19 Sep 2025 23:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127155.1468256; Fri, 19 Sep 2025 23:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzkH4-0005VT-7m; Fri, 19 Sep 2025 23:12:18 +0000
Received: by outflank-mailman (input) for mailman id 1127155;
 Fri, 19 Sep 2025 23:12:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uzkH2-0005VN-Nd
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 23:12:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1432c0ae-95ae-11f0-9809-7dc792cee155;
 Sat, 20 Sep 2025 01:12:14 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee13baf2e1so1797622f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Sep 2025 16:12:14 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698019730dsm66047435ad.63.2025.09.19.16.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Sep 2025 16:12:13 -0700 (PDT)
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
X-Inumbo-ID: 1432c0ae-95ae-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758323534; x=1758928334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b5qMQhkQeGpHEygJsBFZiEEDWkyBSngSeyf238ocapg=;
        b=L7xumqCsQs2n1/lpgwfXW/Chc8B8zy8x2EKI3JpO4fz6ewJBUrWA7qN/pJSD53LNsx
         IRp3EaB8p5colwkkTyFG3eyTSb8GoDNPRWWPFjfI+81hr0U5hfrkLDy3otBcqwFy622Z
         2pCK0ffL1SoIlBrVeNWr2O8PRXV2aUIvdU/6ygEudDlDaa/AH4YPu63XzBa9HvWbIWgW
         78n2yoVnj+GMVY2QJ3wR6EZsh0zvlLQ4sCL1L7ZSwgkXVvo7BVZULZZ44BJ54CSx5OP0
         uoGDNvPCQZD0HA7tWUzRW7OUIMpX+TgsM3MK5NLMxYnYUYqgAVqsVnjA7idaSIyaQutu
         bijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758323534; x=1758928334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5qMQhkQeGpHEygJsBFZiEEDWkyBSngSeyf238ocapg=;
        b=s0VXdKzcC+skei60Meems8FzbjDC+dEImqC2+b78G23tDd8S74dQoKa/0QYzhkughg
         l/gbUdwFFHAs2H8hjMNEzqraXaAl9Okn9mcAjPTRAPpF7vzRSPhXnxxKwP0ChR14T5yj
         LxcPLz8RLIIUtpaMsPse8wwAT7m1j6Az40UowgqiVq1+uMzDVN3r3vYtsVB2HzVM7FvB
         vMQS2XpiDvZ5DZUBlNRs45wyW3FweMZXrwTeJZzCIvytGdGw+2MsNmzm8MjD/PPR1lgZ
         YZy+L/cKGiGLwzKF9VJWwXv3dr/x7sBpokLFdStom3yZAAWlddOnR+HsaY+R2jDWIHL4
         ZG7g==
X-Forwarded-Encrypted: i=1; AJvYcCUjt9PtZRx0iO6Ku8BeWPcEkxSjG8GethVwluDlJzXG5fqi9tyEoXG9/a1T8KciUlYMfjzU7c9MGr8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0SZv8Noly+0rey7vC7mg8hku2CW/zC9hwB95J5lSRhSrIse92
	zdaj1QRuApRWUGZN9/6+G/To2C9JUU9FKIzgkQoyz1jj4y3ClkytrYljNtgQgiFHqA==
X-Gm-Gg: ASbGncv7iuD1L9jgxIJRFHcApY9MuvE4VjYvCj67U/woRiIrwbZYvMg4NVswlqaBqq/
	pbPESl97/5NZW/oAD35/MzJqFai0CXr6SNH0AmcoHnEbTYO5KuVu2lQmq8EeE8ckmzLVzh0MMl2
	xEDNK/r1tVK3FtdpwPo0MG2CrLfDNp0zLCb0q9QX1mvCf4exUjXV0Qn3VIoL6aMRWQmhJcHUYFb
	xfRr8sPRPlEFJUXos3X6mxE9QV9DlZs03fso+ruPjXV0oqloX75rvkiMeR/0LPesZIebB84aI96
	s1+iPlxoMeRAJBAUhtLR1lEtqN7WyJHTdtf4qhe1RpPLKJzS/RXkMyXFW0uMlHpFZZFLaxz/oDL
	PHtUjikrnKFc90tLnXWPLYi4+CNE37gUn
X-Google-Smtp-Source: AGHT+IFfwLjxIJ020kbVMv48PnOuhEq0e7ktnQ6KZ5NGyk9xl+05mkejAx6olEhlmychQkvUhYmY/w==
X-Received: by 2002:a05:6000:2f83:b0:3d9:7021:fff0 with SMTP id ffacd0b85a97d-3ee8481fe2amr3258860f8f.37.1758323533980;
        Fri, 19 Sep 2025 16:12:13 -0700 (PDT)
Message-ID: <031a4dfd-6e4c-4373-b064-f87906ef85a1@suse.com>
Date: Sat, 20 Sep 2025 01:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/18] xen/riscv: implement function to map memory in
 guest p2m
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <abdcb86a0aea3bd614d342caaaa482e82d576d2e.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <abdcb86a0aea3bd614d342caaaa482e82d576d2e.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/p2m.c
> +++ b/xen/arch/riscv/p2m.c
> @@ -96,6 +96,41 @@ void __init gstage_mode_detect(void)
>      local_hfence_gvma_all();
>  }
>  
> +/*
> + * Force a synchronous P2M TLB flush.
> + *
> + * Must be called with the p2m lock held.
> + */
> +static void p2m_tlb_flush(struct p2m_domain *p2m)
> +{
> +    const struct domain *d = p2m->domain;
> +
> +    ASSERT(p2m_is_write_locked(p2m));
> +
> +    sbi_remote_hfence_gvma(d->dirty_cpumask, 0, 0);
> +
> +    p2m->need_flush = false;

While with the p2m lock held it shouldn't matter, purely for doc
purposes I would recommend to clear the flag before doing the flush.

> +/* Unlock the flush and do a P2M TLB flush if necessary */

Don't you mean "P2M" in place of the first "flush"?

Ideally with both adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

