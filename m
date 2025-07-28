Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572EB138E6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061235.1426750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL34-00085u-AJ; Mon, 28 Jul 2025 10:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061235.1426750; Mon, 28 Jul 2025 10:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugL34-00083x-6j; Mon, 28 Jul 2025 10:25:38 +0000
Received: by outflank-mailman (input) for mailman id 1061235;
 Mon, 28 Jul 2025 10:25:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAI4=2J=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ugL32-00080f-TH
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:25:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32866f52-6b9d-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 12:25:35 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso45485565e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:25:35 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4586ec529e9sm120676625e9.1.2025.07.28.03.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:25:33 -0700 (PDT)
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
X-Inumbo-ID: 32866f52-6b9d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753698334; x=1754303134; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2vLUaULpNtvcxk+BfV0PVqqQpqQlNugNjWvx2by9rAE=;
        b=bUndlItrMFI5FLn7lDlbutOu4iORKEw/lxLq8OglP0a2an5+N2UlhXb0Ol1xKdiGWZ
         PwYu7TsHG8Mn7+Bo05p+2dILgUgu2GNx9g+1K1+R3mfeX/CHEAl0qwPjS5p7lGQDQSEk
         dgeKTS5UYcBetxZOjcOTmIJN0q+YLLbvlY0Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753698334; x=1754303134;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vLUaULpNtvcxk+BfV0PVqqQpqQlNugNjWvx2by9rAE=;
        b=KWAHq+bDNXrl4OOpWecTtIJJszinQm+Cd6cL8z7SAWpl78Lm0ytr8NMp1v4RdkXYmY
         Rj0e2noLOSqwXwPZdRUUZhjX5tgFM4kJrO/1ANEOg4Wb4e+bjzpj30gW5ZP+mRZKL+vA
         WCwjVnfsBT1YUFs/exUwh0Rqisl36uaUVzxj05iLYP4LzNY809g7ormC2k1dubOdFgU0
         ELjFRaHL1iYYYMRcFd0Pq73fZIjZVft/NdXdpTgCx4v02zZo6tTP+r/ZvBYTdcS1a9qo
         GxPUpHP1LvopydLVvh9CPXecqsyOLNyEnoxmFEF54DT05J7EfmqESvRzSlIEFsVo1wfe
         HPGg==
X-Forwarded-Encrypted: i=1; AJvYcCV1CT6qumpDD9uF4unlBwXWtiaN5Jq6eSttzPhfcL0zJR5CokAiRf8whvhLxazu8VCmqMKPbN8Lgvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyhlawn9YR9Y/YzCGXoZ7ta7OMvsZ6Mi9+wYvB33TiJ0yMiwUH+
	sArvoAjnHPAb5rr+qgSp444L1Ya9Wh9B6xtzktGpwPi4Uxb+peiD6nHXJE588hXqZqI=
X-Gm-Gg: ASbGncu+vYGblRrmATMj8NGnPdWT755jzw+KSeCxVIqK8haYSXgusLmbM/NnL48SrA0
	ImL/s5fMVxbKzsTxh101h5bd935+9V6S1SXTuTF0rdgI+yl3dNiL4LHQHfYmqUUyJUC+TMxaJby
	0Jj/7M95kkNkIxA3X+eMX1612snoI4SoMiPOZo43aXPQevZBiabBP7YbyY8+C3K+coo1/pOGauO
	B/lahEO5i71Y/uuJvkAzkBnxqHrT5+hzQDc+I4vYfESmH/NF2Mp/jmnpUaALeq5K5BRUWO0lKZ7
	Sipk1dom4q+aKNh1dQfHpTZL5Gpix/FYTvxhWZ/lt7e0IRvKggYj8qgxXO+y4Gz9NvA52vWNRJN
	GcZURMNyXKykIGWWS+5dBwuk/119hRLcj0sTs0C7LcxY2UzNAmM17ylWTPiVUc/IQG/RB
X-Google-Smtp-Source: AGHT+IGH7YSxJbopV4iJYdOU0PBY4JcORzJQ7HQrlQ0yF7B9a6jIgXkwvwnvuNCm+ThuHBANSzO04g==
X-Received: by 2002:a05:600c:45d1:b0:43d:745a:5a50 with SMTP id 5b1f17b1804b1-458765475b1mr89972995e9.19.1753698334464;
        Mon, 28 Jul 2025 03:25:34 -0700 (PDT)
Message-ID: <2874ee13-a978-4331-9c7e-70d4fcd11727@citrix.com>
Date: Mon, 28 Jul 2025 11:25:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 04/10] vpmu.c: factor out register conversion
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, andriy.sultanov@vates.tech,
 boris.ostrovsky@oracle.com
References: <cover.1753372928.git.edwin.torok@cloud.com>
 <ce2375387dcc5e00c3d55e903d9a2180eadb8685.1753372928.git.edwin.torok@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ce2375387dcc5e00c3d55e903d9a2180eadb8685.1753372928.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/07/2025 4:06 pm, Edwin Török wrote:
> diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> index 7be79c2d00..713311a1ac 100644
> --- a/xen/arch/x86/cpu/vpmu.c
> +++ b/xen/arch/x86/cpu/vpmu.c
> @@ -160,6 +160,31 @@ static inline struct vcpu *choose_hwdom_vcpu(void)
>      return hardware_domain->vcpu[idx];
>  }
>  
> +static inline void vpmu_convert_regs(struct xen_pmu_regs *r, uint64_t *flags,
> +                                     struct vcpu *sampled,
> +                                     const struct cpu_user_regs *cur_regs) {
> +  r->ip = cur_regs->rip;
> +  r->sp = cur_regs->rsp;
> +  r->flags = cur_regs->rflags;
> +
> +  if (!is_hvm_vcpu(sampled)) {
> +    r->ss = cur_regs->ss;
> +    r->cs = cur_regs->cs;
> +    if (!(sampled->arch.flags & TF_kernel_mode))
> +      *flags |= PMU_SAMPLE_USER;
> +  } else {
> +    struct segment_register seg;
> +
> +    hvm_get_segment_register(sampled, x86_seg_cs, &seg);
> +    r->cs = seg.sel;
> +    hvm_get_segment_register(sampled, x86_seg_ss, &seg);
> +    r->ss = seg.sel;
> +    r->cpl = seg.dpl;
> +    if (!(sampled->arch.hvm.guest_cr[0] & X86_CR0_PE))
> +      *flags |= PMU_SAMPLE_REAL;
> +  }
> +}
> +

This is fine in principle, except that you're changing the style away
from Xen style.

I can fix it on commit, but it's going to collide massively later in the
series.

~Andrew

