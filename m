Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8CA662DA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918203.1322931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuK4w-0003sC-HZ; Mon, 17 Mar 2025 23:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918203.1322931; Mon, 17 Mar 2025 23:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuK4w-0003q0-Es; Mon, 17 Mar 2025 23:41:06 +0000
Received: by outflank-mailman (input) for mailman id 918203;
 Mon, 17 Mar 2025 23:41:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuK4v-0003pu-3g
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:41:05 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4947bdc7-0389-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 00:41:02 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso19492005e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 16:41:02 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda2dbsm118908895e9.2.2025.03.17.16.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 16:41:00 -0700 (PDT)
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
X-Inumbo-ID: 4947bdc7-0389-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742254862; x=1742859662; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hLn+cZWQQQi+D4BK3x1bQ6M40SBT245bCWtzLbfAazA=;
        b=Cl5D+Um3QmEZE7nQJEhu4+8Vud1+5NDdROGHKPQAatJmuD27lD9dFAS+OTsaR0FTAL
         +mquYVcSwBijn7M/h9Y0KtS/R8LfNjp6MK204e0FQzANzaUbb4Yfmq/m0ZdUkRu15EVA
         1xvczi95ABLSzv5GlyjwgDRNEhkto+7tWgYM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742254862; x=1742859662;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLn+cZWQQQi+D4BK3x1bQ6M40SBT245bCWtzLbfAazA=;
        b=mtzLSIrdzW8X+yxnDK3HGb6I9w1RxmpHDeNc7pf6tWODltgL54Ct9rWs5Vyre+W8Bw
         pERLVjUmLZSXdpsZ+o8PRYUBSgBESclg/OEPrKCYASDsFHfaMI254QmrVxhfIY4uhQV5
         MGZuRpqdkddPihmyRljra92hxM3mV4jZ8L2UX9iPatwPY8W1/yYiRf0Upf8ENCiOIjlD
         Lel2gRSTU0CqpJQ95JlmwGFTFPdJCOfK3L/+WWMsMuBLdeA+Ausx6Uty4IocnoiBeysh
         Ljl79K9tvUZ8f1GRHT4Ze8KCcIQK8jTlhfM7Wl9/V8zATuet+ZAn3qeOxnO6CelgKx7D
         Gkfw==
X-Forwarded-Encrypted: i=1; AJvYcCXhD8PCUPf3RajbhkDKvVKUOcLbjEtuW8ojjH/qL/76kSggmRzaFprRNCo0/c7zL6+3WsGmHsSDrzg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuZbbpL1LyPr1Kw+TEPnG10nQgPU4g10UaweJ80pnW3gKRiV29
	8o98iAXY+EFN/cI0FrlAmpZQ7Hd+iOZmdBEdX3kY0rKJksxZsRCCt0zSGKbsews=
X-Gm-Gg: ASbGncucf94edZcGHVzmUofFH+VLL+aq6EIiqtucIkparSnQxhH6TnekJpbpomfBdF1
	o+YMvvbSum7v0S94pEzrb2bVydF4kl3two/yEHGCb4kRv4BtoXY6jwqYBvbHpyfcyDExJsOqJk7
	LatHM+NjN6nQ7Tr8PUxvtjUETVV6Vf/mso1BgJbRElQHoG6RwaAWOMFvZuUq4f0uFTJC++HoQay
	J8EAqt4wy8mzvD9m9jHe5X+HqR6ajU+QRA/NdplYETZ1pwdnjNxzXAjdP1HQIqmtJ/zCWja6Ufj
	gXmKovR5AkkrvBoFzY9tozWuvSUOEETqDFLCZL2CYXWfGHrs6XkqEsKMI+FrBd/ceoHrWEjAIM/
	Qx/IU0SWl
X-Google-Smtp-Source: AGHT+IGjB+frjehLzO9BrlMVgSSE9lT+TasUMLt40aM+ebeJ7gIi+ZDmu4AKKwOMjiFgMV9+Fv18eg==
X-Received: by 2002:a5d:47c5:0:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3971dae9542mr16692700f8f.25.1742254861840;
        Mon, 17 Mar 2025 16:41:01 -0700 (PDT)
Message-ID: <497de03e-4dbb-4025-806f-46274d7a7c19@citrix.com>
Date: Mon, 17 Mar 2025 23:40:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: vm_event: do not do vm_event_op for an invalid
 domain
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <20250317230806.1179478-1-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250317230806.1179478-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 11:08 pm, Volodymyr Babchuk wrote:
> A privileged domain can issue XEN_DOMCTL_vm_event_op with
> op->domain == DOMID_INVALID. In this case vm_event_domctl()
> function will get NULL as the first parameter and this will
> cause hypervisor panic, as it tries to derefer this pointer.
>
> Fix the issue by checking if valid domain is passed in.
>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> ---
>
> This issue was found by the xen fuzzer ([1])
>
> [1] https://lore.kernel.org/all/20250315003544.1101488-1-volodymyr_babchuk@epam.com/
> ---
>  xen/common/vm_event.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index fbf1aa0848..a4c233de52 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -600,6 +600,13 @@ int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec)
>          return 0;
>      }
>  
> +    if ( unlikely(!d) )
> +    {
> +        gdprintk(XENLOG_INFO,
> +                 "Tried to do a memory event op on invalid domain\n");
> +        return -EINVAL;
> +    }
> +
>      rc = xsm_vm_event_control(XSM_PRIV, d, vec->mode, vec->op);
>      if ( rc )
>          return rc;

Oops.  Git blame says this is my fault.

This behaviour is intentional.  See XEN_DOMCTL_vm_event_op (along with
test_assign_device and get_domain_state) early in do_domctl().

It was introduced in commit d48e1836074c ("vm_event: Add a new opcode to
get VM_EVENT_INTERFACE_VERSION") so that XEN_VM_EVENT_GET_VERSION could
succeed.

Apparently I deleted it in commit 48b84249459f ("xen/vm-event: Drop
unused u_domctl parameter from vm_event_domctl()"), and that wasn't
intentional.

That will want putting in with an extra comment.

/* All other subops need to target a real domain. */
if ( unlikely(d == NULL) )
    return -ESRCH;

Don't both with a printk().  It's just noise, and -ESRCH is correct code
to use.

~Andrew

