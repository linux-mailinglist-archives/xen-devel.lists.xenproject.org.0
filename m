Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E88D3C13
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 18:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732235.1138143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLyy-0002Xq-Dh; Wed, 29 May 2024 16:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732235.1138143; Wed, 29 May 2024 16:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLyy-0002W3-B2; Wed, 29 May 2024 16:16:56 +0000
Received: by outflank-mailman (input) for mailman id 732235;
 Wed, 29 May 2024 16:16:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ygCr=NA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sCLyx-0002Vx-LE
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 16:16:55 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc3b7df4-1dd6-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 18:16:52 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5785f861868so2858914a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 09:16:52 -0700 (PDT)
Received: from [10.80.5.21] ([160.101.139.1]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93d38esm738158266b.90.2024.05.29.09.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 09:16:51 -0700 (PDT)
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
X-Inumbo-ID: dc3b7df4-1dd6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716999412; x=1717604212; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSaFLAXaJOhnhik3iHCg3RZxOkBFRX4xe9SATGr9Lfc=;
        b=VbS8tQ/H8Xc1ocDBhLgq/wAwbC02jROk7Ba401IB4qRiKUJUg+NkBBYivARJXMT9a8
         K3+KQ0UFD4awfdy2aHGtDTOEKmbI+1U1qIvfMyrQLptiHu50SLFyTZs+FyEVml+dkkUO
         cHopFXQnZwydLiHE3jbnAVSB8Ie/IUFJJ3KAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716999412; x=1717604212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSaFLAXaJOhnhik3iHCg3RZxOkBFRX4xe9SATGr9Lfc=;
        b=VNSMDhlZliqgAVjFfBw/KbGO6zqSpIfcarsy5i48T3BEzGWpGkDAQCxq2BqakMDNVa
         9eGbZ2mM339rEAyl5lHJz4gK4Sb149Yln7AtcNRtqq63lkNmq9mdW3kUXG3+By1NDcQg
         uYGLoTuWvONkzZiTilGY5krtEmeKEytq3aCJ7hONYffeedteUz67Zw7OgSrWLzAQJNZh
         pgFk6jPjGvqf/yhdORPo+p/02VokXyV67tWtqr+belqt3NPF1zdFIUNo8alrAgH5njxb
         RUtPm2GnhuVV5CWCFaoal0ZfFrHkB9sC2eINRYgRjpdZjmEtQq0PTd8K8ub92JdZm1C1
         LXKQ==
X-Gm-Message-State: AOJu0Ywv0CGe4yG1gFXwyI79n4LIgkdFCrhuIgbBijn8qrLTWrULz83E
	PjvR1Q3xabAi498ECftdQMg0BO2hNVU3Z2RFBvIVcS42nm0lqhUNzBj6oB4hekLGXl1nYEWNDGu
	z
X-Google-Smtp-Source: AGHT+IFFxyxzsg9OyiN4hyIsTNVdhvWQ+UictNf335WOqAAsGG2PXqST1pyX/TzB9GZPMTf1iKL+Gw==
X-Received: by 2002:a17:906:184d:b0:a5a:8c59:d6d with SMTP id a640c23a62f3a-a62641c7f50mr1040014266b.17.1716999411884;
        Wed, 29 May 2024 09:16:51 -0700 (PDT)
Message-ID: <e554d88d-2164-4dde-9083-8e8db5a2712f@cloud.com>
Date: Wed, 29 May 2024 17:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony@xenproject.org>
References: <cover.1716976271.git.alejandro.vallejo@cloud.com>
 <eb7438639cc4755d3c959029d809451ee000ccbc.1716976271.git.alejandro.vallejo@cloud.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <eb7438639cc4755d3c959029d809451ee000ccbc.1716976271.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/05/2024 15:32, Alejandro Vallejo wrote:
> +static uint32_t read_apic_id(void)
> +{
> +    uint32_t apic_id;
> +
> +    if ( has_x2apic )
> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
> +    else
> +    {
> +        cpuid(1, NULL, &apic_id, NULL, NULL);
> +        apic_id >>= 24;
> +    }
> +
> +    /* Never called by cpu0, so should never return 0 */
> +    ASSERT(!apic_id);

Bah! Typo. That's meant to be ASSERT(apic_id).

Cheers,
Alejandro

