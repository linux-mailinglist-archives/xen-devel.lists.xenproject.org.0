Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53977984A15
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 19:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803241.1213732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8uq-0007tq-34; Tue, 24 Sep 2024 17:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803241.1213732; Tue, 24 Sep 2024 17:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8uq-0007ra-0U; Tue, 24 Sep 2024 17:01:32 +0000
Received: by outflank-mailman (input) for mailman id 803241;
 Tue, 24 Sep 2024 17:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4pT6=QW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1st8uo-0007rU-3Q
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 17:01:30 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a353b6c3-7a96-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 19:01:27 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so783465866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 10:01:27 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f541b8sm106136566b.84.2024.09.24.10.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 10:01:26 -0700 (PDT)
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
X-Inumbo-ID: a353b6c3-7a96-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727197287; x=1727802087; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DNyYKFS5cy4rdmNq4M2ay8GljPc1ADeHBChXTk3bcMA=;
        b=Sf8XN52EywGPcE5v+Tob6KSbr7Fl7BkEguuCprEbnDXA+MbVeLEkq5OYJuBrPZ5iG/
         uQas+kdxJ9iXBd44Rnl/7LnoP4Qjwrq0T+p0cjkmlJmZmiNddadCTUn3h5G1YPVw4YaO
         FJFADx49tQwe+Uj45aMwLjRT1Bz5FcH2BEGwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727197287; x=1727802087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNyYKFS5cy4rdmNq4M2ay8GljPc1ADeHBChXTk3bcMA=;
        b=vwd+gScO6icuU71PNrrZgCoJ2YD3dn/3XBBT9X2IfNVGJTp4a0lqglr+1nON1PfTYE
         iLSocUTZyFRF0Rg3SLZGdFgrr3MYUC/7ALXlromX5X07Vp6fgtt82/V8yQjsK7LCoAy0
         /RfiIZpnmXIkJAZElDZm/ZDk+pHHF5iQB8aAd9vy3EDmCR4MkCs2G8ihbpWNb5JjAhTA
         9c6C/JjKI5uDmRizGHAtUgW+3WYoSlvbsAopg8nKrXJev0nkGnNXxD61XG+pmMW5SBsB
         L+PaneBbkgekAd47Z7qDN1GNQl0uZYZxNLbRcRfbQnAkd08lRNBYMrd3SuJxoVhSFmz0
         ToIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOkqK74JlXr4V3M+U35nRsAtb0jwe1pYckpSzy7CuSFhAz8zjTSBl+UZ4eaiU/qx6U5MY1qZltoJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlR5FxbsR8kwQPkcSF8A/+yoc3a+VCE4Ju4f03jUnItCYxwkl8
	tFrFq4KxTOfHMC3aOP9JMOeZ0B16OTRBnwVF/EcdS0KBb5XSs4Z3QOmxb3FKBCc=
X-Google-Smtp-Source: AGHT+IGADDibSrG0FdPiSkkkp91cQd7nmFhEOJqmCr0oJvSy7OXqQqMcNkWUMATs/3NUJATVs6poOg==
X-Received: by 2002:a17:906:7308:b0:a8d:29b7:ecea with SMTP id a640c23a62f3a-a90d5182575mr1560021866b.61.1727197286965;
        Tue, 24 Sep 2024 10:01:26 -0700 (PDT)
Message-ID: <7857cbd9-c26d-4d31-97c6-8a1f34dd4559@citrix.com>
Date: Tue, 24 Sep 2024 18:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen: introduce common macros for per-CPU sections
 defintion
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>
References: <cover.1727185495.git.oleksii.kurochko@gmail.com>
 <27aba3aae7f4a5d4694ab141dca325d7231f2f66.1727185495.git.oleksii.kurochko@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <27aba3aae7f4a5d4694ab141dca325d7231f2f66.1727185495.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/09/2024 5:42 pm, Oleksii Kurochko wrote:
> Introduce PERCPU_BSS macro which manages:
>  * Alignment of the section start
>  * Insertion of per-CPU data sections
>  * Alignment and start/end markers for per-CPU data
> This change simplifies the linker script maintenance and ensures a unified
> approach for per-CPU sections across different architectures.
>
> Refactor the linker scripts for Arm, PPC, and x86 architectures by using
> the common macro PERCPU_BSS defined in xen/xen.lds.h to handle per-CPU
> data sections.
>
> No functional changes.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V2:
>  - rename PERCPU_SECTION to PERCPU_BSS
>  - update the commit message
>  - add Acked-by: Julien Grall <jgrall@amazon.com>
>  - add Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
>
>  xen/arch/arm/xen.lds.S    |  9 +--------
>  xen/arch/ppc/xen.lds.S    |  9 +--------
>  xen/arch/x86/xen.lds.S    |  9 +--------
>  xen/include/xen/xen.lds.h | 10 ++++++++++
>  4 files changed, 13 insertions(+), 24 deletions(-)

Aren't you missing a hunk in riscv/xen.lds.S ?

~Andrew

