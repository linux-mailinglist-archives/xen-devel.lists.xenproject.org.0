Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE7B2374D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 21:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079127.1440094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluNy-0002hU-Uc; Tue, 12 Aug 2025 19:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079127.1440094; Tue, 12 Aug 2025 19:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluNy-0002ew-Q1; Tue, 12 Aug 2025 19:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1079127;
 Tue, 12 Aug 2025 19:10:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BkKW=2Y=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uluNx-0002eX-BY
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 19:10:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87144d7-77af-11f0-a328-13f23c93f187;
 Tue, 12 Aug 2025 21:10:12 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so39723685e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 12:10:12 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3abec8sm47083546f8f.8.2025.08.12.12.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 12:10:10 -0700 (PDT)
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
X-Inumbo-ID: f87144d7-77af-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755025811; x=1755630611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=liYN9p+w76I5yk0XmtckGD/YtX7vKJXADbbeud4KcVk=;
        b=RQt1E751HEnsHaLwVpYCqgjHoEiATrkpY0lavGxfSVUsNespNbt3Ll3bIUIVRbbK8A
         WAj2pcedGyp9zVnMsDf4MVAnngRqbGtUbW8vcgdUTyjOzJOaeC4n1x8ksRHByEpMN5WG
         UtIKY5gJulGCUgvN5rzJNUFElhDP75Bg/jjbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755025811; x=1755630611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liYN9p+w76I5yk0XmtckGD/YtX7vKJXADbbeud4KcVk=;
        b=R2Rz1eM0MvkHx7Z//pk3WUctVtyCGSWBQtReJ/QDTbolH9Fbbnc0nLUxIx4C2L0Efi
         TtFsrnKXhztlWcIYeaFhB1GtOmaYSkQNd2i/JPwhdgnhNkMsD0H88akMQ8sJEhXkbyZ1
         vcHQ998wEfoy71r9tV0ZKnElzZ+fhrnuSYgeevVMOw+VO6WAv9fU7u6UqK9kzcc0DBln
         /DkbFJGVpV94ghiVGt+sWKQjGhIF3IpH7D+JfB7UhKEsUZyeIQYh3gzEbvCbuXfOiUP3
         8Yrm03R83IBkMjQpYpQctJYWR/rEn4VsmTtm8XBIPmY8+2/L0FvrnKtTcwqNc7lIchnA
         Gh4g==
X-Forwarded-Encrypted: i=1; AJvYcCUDGZ3YgcG52czjq0mm/RLrljXXJf12wR27rS6QZMGjEb0D6YkKsz91hWWIDb/oIOA8rzassITWzOQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAp14eIWE9+YiLPVTFBzm4Dy+U6rAYqdoI+ure4cR10pQwGLBT
	crUHlonBQ9w1R5UONRgJ41w9+QDohBFw+UAAYiIexoacWVbh9prK3+Nelhbf5BhlRxI=
X-Gm-Gg: ASbGncvkupw4ao68Bhyq5l6vG1PmzPQHYmvaawPZev+dT1vWvrDzxx+JvaQCE/ctrRC
	DWvCfsd6MGrbjtjfZ4pq6q5OgLlfW+876sCjQjUtAHfnudqgzWuo4xaWvosr6qDr+kfFWieXOT/
	e/1aXeEjRr5zJvzLPLj5memTqPOYypuWj7KHFAAjLtZuZpFM3XRzEHZcH6YxyRFkRvwhVTCFf3+
	39IF7/5yQhdqEPYUysJZ+3/0+unkdLMZGb6KYKrMRHMDksak9ReO6eM2govGFxMP/wYFW2GJQqZ
	rLtYw8Hkv62ZQvSMEKto0v1aCc5A/+/2bm9A7jNIBjuKAcHBa1ExFDSGSWyuh2gsGbyUWx8/s+4
	4b1XwP7GkRQl/zGdyWeqcVMbaIk69QWjife1C3U0VLcYFD5L/BYq/+CEHyiFSo2dpNH7k
X-Google-Smtp-Source: AGHT+IGfmjf8JsGQUca7vkYCPtAmZK9nxXpEiIAbePK3VMkH+hfJD9ojk3aIkYnpPKD9PoVOzbAcZQ==
X-Received: by 2002:a05:6000:2c0c:b0:3b8:893f:a17d with SMTP id ffacd0b85a97d-3b917eb5b74mr88711f8f.49.1755025811336;
        Tue, 12 Aug 2025 12:10:11 -0700 (PDT)
Message-ID: <5407877d-4c7c-494f-8fc1-d44eea4762b9@citrix.com>
Date: Tue, 12 Aug 2025 20:10:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
To: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Chris Wright <chrisw@sous-sol.org>,
 Jeremy Fitzhardinge <jeremy@xensource.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: stable@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20250812190041.23276-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250812190041.23276-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 8:00 pm, Jason Andryuk wrote:
> VIRQs come in 3 flavors, per-VPU, per-domain, and global.  The existing
> tracking of VIRQs is handled by per-cpu variables virq_to_irq.
>
> The issue is that bind_virq_to_irq() sets the per_cpu virq_to_irq at
> registration time - typically CPU 0.  Later, the interrupt can migrate,
> and info->cpu is updated.  When calling unbind_from_irq(), the per-cpu
> virq_to_irq is cleared for a different cpu.  If bind_virq_to_irq() is
> called again with CPU 0, the stale irq is returned.
>
> Change the virq_to_irq tracking to use CPU 0 for per-domain and global
> VIRQs.  As there can be at most one of each, there is no need for
> per-vcpu tracking.  Also, per-domain and global VIRQs need to be
> registered on CPU 0 and can later move, so this matches the expectation.
>
> Fixes: e46cdb66c8fc ("xen: event channels")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Fixes is the introduction of the virq_to_irq per-cpu array.
>
> This was found with the out-of-tree argo driver during suspend/resume.
> On suspend, the per-domain VIRQ_ARGO is unbound.  On resume, the driver
> attempts to bind VIRQ_ARGO.  The stale irq is returned, but the
> WARN_ON(info == NULL || info->type != IRQT_VIRQ) in bind_virq_to_irq()
> triggers for NULL info.  The bind fails and execution continues with the
> driver trying to clean up by unbinding.  This eventually faults over the
> NULL info.

I don't think the Fixes: tag is entirely appropriate.

per-domain VIRQs were created (unexpectedly) by the merge of ARGO into
Xen.  It was during some unrelated cleanup that this was noticed and
bugfixed into working.  i.e. the ARGO VIRQ is the singular weird one here.

In Xen we did accept that per-domain VIRQs now exist; they had for
several releases before we realised.

~Andrew

> ---
>  drivers/xen/events/events_base.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index 41309d38f78c..a27e4d7f061e 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -159,7 +159,19 @@ static DEFINE_MUTEX(irq_mapping_update_lock);
>  
>  static LIST_HEAD(xen_irq_list_head);
>  
> -/* IRQ <-> VIRQ mapping. */
> +static bool is_per_vcpu_virq(int virq) {
> +	switch (virq) {
> +	case VIRQ_TIMER:
> +	case VIRQ_DEBUG:
> +	case VIRQ_XENOPROF:
> +	case VIRQ_XENPMU:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/* IRQ <-> VIRQ mapping.  Global/Domain virqs are tracked in cpu 0.  */
>  static DEFINE_PER_CPU(int [NR_VIRQS], virq_to_irq) = {[0 ... NR_VIRQS-1] = -1};
>  
>  /* IRQ <-> IPI mapping */
> @@ -974,6 +986,9 @@ static void __unbind_from_irq(struct irq_info *info, unsigned int irq)
>  
>  		switch (info->type) {
>  		case IRQT_VIRQ:
> +			if (!is_per_vcpu_virq(virq_from_irq(info)))
> +				cpu = 0;
> +
>  			per_cpu(virq_to_irq, cpu)[virq_from_irq(info)] = -1;
>  			break;
>  		case IRQT_IPI:


