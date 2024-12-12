Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 846659EEFAA
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 17:19:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856203.1268905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLltn-0001wJ-EW; Thu, 12 Dec 2024 16:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856203.1268905; Thu, 12 Dec 2024 16:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLltn-0001uZ-BV; Thu, 12 Dec 2024 16:18:47 +0000
Received: by outflank-mailman (input) for mailman id 856203;
 Thu, 12 Dec 2024 16:18:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLltm-0001uT-OK
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 16:18:46 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c249cf22-b8a4-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 17:18:44 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso128473966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 08:18:44 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa66f671da0sm743250966b.17.2024.12.12.08.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 08:18:43 -0800 (PST)
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
X-Inumbo-ID: c249cf22-b8a4-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734020324; x=1734625124; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EmoOxdJWcpYNHrfRxKU9VYSkBeucXZYJGur1RrRhPZE=;
        b=IpB4ezz55+eFcX/hUEUOZDhhRYGhQbQf4UpgeoUd+AmtS4yhOOYyOq36yK6C4Njdws
         LEdoL5oPyf3T8jGP5m78DawmNkA9rtIe0HImCa8hyQI2aLxl12muJuw8cLb5R3gL0qzH
         i7yYEVYdJsgXs7/TtIl8ldf2NHn4jqafinC7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020324; x=1734625124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmoOxdJWcpYNHrfRxKU9VYSkBeucXZYJGur1RrRhPZE=;
        b=KkvCjBS7o4uruPydFkFU2ImlJM2I5nPfa05a60/iMXtZkCwGliLxzJJFsXgrBWKPsx
         qKiQgHk6kUXeEkWx/uhMOLB7mxCEX3dXdWCZDrj6JyCye/dy4N5wRoEtKaCq6LbFMQQO
         dd7koutokdkNYpKgsT2OTpx6jHi09gyRjjo6XXwwDWTTJtblcJrGiyqsLfekTKQN5Taz
         jAIDhULzaw381AcHw3MXGG3sXfKvepirGrrAsqOBaGsoaAjL9MV7KDdYlCeuq3OpENHy
         oz6qLcKnFnZnjyRIJQlxRF2iDufKsuTMe4/t/z+4+3DGjBQK4Ivf9lttLJGK52VqvPFR
         IqsQ==
X-Gm-Message-State: AOJu0YxWhqN1HM+zZ64ihvmtIJOzIQXo+zaFBOsqBP/UWr6f3bIYCiOf
	HOjxlbvOwKL5zMW30PzrmXXi0abe/paXTUqmW+OA48ipyHfO3bM4U5CwAZMfH64=
X-Gm-Gg: ASbGncvZPFoHKgzuSTcsx66ZFAfQvoMOVMUrbvFNzVP3yJw6/WCtalQtJDZ85IAT6JF
	FtnixCtBrz3ti4yCJR1QJKrYkBupR3vQoP5GobstPkES93evwURvhGOiPz94Kj0ChLpbQILGFoW
	8d2BQ88CWULWhvWZ/5UxST3+Ak3FuOziQgbafDyfciCvlzKsEXAEunYMr1kxlweH4rJYdQfBUVz
	kbteheg9DqHG/oWhHuaXd/03mzMZslIBrCc2LeTI6wH9nKVyIwkvzWji2/KQpUMSQ==
X-Google-Smtp-Source: AGHT+IGvX6XpphB37MBimPyiDifCJfoY2C6CAZ7Cs4ZYmw9ziTWSspRMbPobCVjjaNpC0LbqbxjoLw==
X-Received: by 2002:a17:907:7717:b0:aa6:7cae:db98 with SMTP id a640c23a62f3a-aa6c1ab6285mr465110066b.10.1734020324054;
        Thu, 12 Dec 2024 08:18:44 -0800 (PST)
Date: Thu, 12 Dec 2024 17:18:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 30/35] x86/hvm: add helpers for raising guest IRQs
Message-ID: <Z1sM4pri0oJRyMPJ@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-30-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-30-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:42:00PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Added convenience wrappers for asserting/de-asserting interrupts in the
> hardware emulation code.
> 
> That will be used for PCI-based NS8250 emulator.

Strictly speaking the ns8250 uart should only generate ISA interrupts
as I understand it, as it only uses IRQs 3 and 4?  IOW from that code
you should only need to use hvm_isa_irq_assert().

> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>  xen/arch/x86/hvm/irq.c             | 24 ++++++++++++++++++++++++
>  xen/arch/x86/include/asm/hvm/irq.h |  3 +++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> index 1eab44defca4c82ec35769617c66c380cc07d1b6..9e3a50d21dcf281c1015116094e47795c51ed5d0 100644
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -242,6 +242,30 @@ void hvm_isa_irq_deassert(
>      spin_unlock(&d->arch.hvm.irq_lock);
>  }
>  
> +void hvm_irq_raise(struct domain *d, unsigned int irq)
> +{
> +    if ( irq < NR_ISAIRQS )
> +    {
> +        hvm_isa_irq_assert(d, irq, NULL);
> +    }
> +    else
> +    {
> +        hvm_gsi_assert(d, irq);
> +    }
> +}
> +
> +void hvm_irq_lower(struct domain *d, unsigned int irq)

It would be better to use the assert/deassert nomenclature, like it's
used for the functions that are called.

> +{
> +    if ( irq < NR_ISAIRQS )
> +    {
> +        hvm_isa_irq_deassert(d, irq);
> +    }
> +    else
> +    {
> +        hvm_gsi_deassert(d, irq);
> +    }
> +}

The parameter to thins function is kind of fuzzy, as I understand it,
if the parameter is < NR_ISAIRQS it's an ISA IRQ, while if it's >=
NR_ISAIRQS it's a GSI?

It would also be helpul to mention that hvm_isa_irq_deassert() will
already do the ISA IRQ -> GSI conversion in case there are any source
overrides.

Thanks, Roger.

