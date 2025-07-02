Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84405AF5F82
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 19:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031436.1405248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX0wz-0005zs-2O; Wed, 02 Jul 2025 17:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031436.1405248; Wed, 02 Jul 2025 17:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX0wy-0005wm-V1; Wed, 02 Jul 2025 17:08:48 +0000
Received: by outflank-mailman (input) for mailman id 1031436;
 Wed, 02 Jul 2025 17:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uX0wx-0005wg-T3
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 17:08:47 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34af144c-5767-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 19:08:42 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so36183045e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 10:08:42 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a99666c3sm3557925e9.2.2025.07.02.10.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 10:08:41 -0700 (PDT)
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
X-Inumbo-ID: 34af144c-5767-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751476122; x=1752080922; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PSFEBzbKRDYyuuQ84jvdxoTQxFP4fcovGE0A2AR8obE=;
        b=pjV820g9drKIMUvS9anuq8nNsNW4WIbZB3rU6lqjPbdCaddTHPkzY8pPnj0PEfPJF1
         Rq/d3i1g0Um/4PUWRbJ9C+5paq1qzB6umtcHJ6U55vnovFbQLG8rKpBRA/MRAbYDNgJR
         nxTMMZdOAaMC9O0eSxPmQ3mqzw53bph/BvNcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476122; x=1752080922;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSFEBzbKRDYyuuQ84jvdxoTQxFP4fcovGE0A2AR8obE=;
        b=XdhsOJg1qCMc8GzBPs9eXffbVFrB/vPc9hon00wTv5W/IUdidaN6gGfvnGOHeo7SwY
         SYsX5hZaFbTwJIn1S+FQtvnmzr8PFaaphsPFv9kTz6Keq6oBT38bbddRoHoC2b15gB0S
         FwbaK00WpEwOFcduq1JeZLbyx4cZIDj6MujbNi57ULkCLGsWpeyWjAuzN6AXX1CQ1yq1
         O5cXgHvdZjGato8HelW4vqHF7o2ECirulnq2tv64Iy88cf16pwlXTM3imRm5OXUXHi2D
         QBjuKoQK8wvy87+0IUquhgT5/7x+weG5iWGbRB3G7TtP7zwmfULWoJwvld3AhXgsOol1
         f5rw==
X-Gm-Message-State: AOJu0YwyhvNoDAsXLma/wayZQx5ti8GTAlpI38nBNGG6X2kwFEQMUTk6
	cg0Z+QaBgEZtwuP3ffUL+YDNH93T3p+epGncTEnpP10Uffwa4DzMFaf1uSRd3vugIrZk+8X/uX+
	nKZ5VYru62g==
X-Gm-Gg: ASbGncvOxDldZO4elceHa6e52a81O6VtoAhDTa4se0fr4zKxnS+9Wht2vecacLl8p01
	yMkBIFjqYPumvQS4C8uf0Er/WtVLesaAOl74gCKzLFlYHSg1kK999aN3sXKwCc23wSKNOZvxFSI
	lnVlEgzP8HO9n6qCjagDxDnWvQ5TJ2thE7ptpzAkLA2SpNXQxrgoZsmkgDU1inp2qohasrPMl7c
	floZIrpO6m19uIUR7x/moEke+ti38I9i8XhWINQubQxBlbdn5MXUNBXcRME6Hm59UJa12wlRBN4
	yH7HUn5qa8xoUDNlH3x+YpJoAVTI9fomapbFTX/LTV/+AFv7Iff99GzbOQvwSPpUU/BQg+5mngE
	O9EFjwMCxhzlIuAQM+m+LmQuHohW+B4EaX+c6ZQ==
X-Google-Smtp-Source: AGHT+IGeiYG2HLrC1rRHG5Y1goZHxrsNO/JfLSdDs7+H8zcjQFqKcS3rhp/HV0SasUQg9DqW+sG57Q==
X-Received: by 2002:a05:600c:3488:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-454a9c71dd2mr6273025e9.10.1751476121848;
        Wed, 02 Jul 2025 10:08:41 -0700 (PDT)
Message-ID: <4247a051-f26b-43b9-b5f0-465145417bdd@citrix.com>
Date: Wed, 2 Jul 2025 18:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix handling of leaf 0x80000021
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250701105307.705964-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250701105307.705964-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/07/2025 11:53 am, Andrew Cooper wrote:
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index f43e1a3b21e9..aeaa16bbc732 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -325,7 +325,10 @@ struct cpu_policy
>                  uint32_t e21a;
>                  struct { DECL_BITFIELD(e21a); };
>              };
> -            uint32_t /* b */:32, /* c */:32, /* d */:32;
> +            uint32_t ucode_size:12, /* Units of 16 bytes */
> +                     rap_size:8,    /* Units of 8 entries */
> +                     :12;

Having tried this out on a real CPU, it's not correct.

The APM and Genona PPR say that ucode_size is 12 bits wide, with the
rest of the register reserved.

However, the Turin PPR says it's 16 bits wide, with rap_size being 8
bits starting at bit 16.  The raw value is 0x00080382, which matches the
PPR.

Therefore I'm going to turn this into a plain uint16_t and uint8_t as
there's no need for bitfields any more.  (Which I suspect might be why
the 12->16 change was made.)

~Andrew

