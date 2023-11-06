Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6ED7E296A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 17:07:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628195.979388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r027y-0006M9-Jj; Mon, 06 Nov 2023 16:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628195.979388; Mon, 06 Nov 2023 16:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r027y-0006K7-H3; Mon, 06 Nov 2023 16:07:02 +0000
Received: by outflank-mailman (input) for mailman id 628195;
 Mon, 06 Nov 2023 16:07:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gUrR=GT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r027w-0005oQ-KG
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 16:07:00 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 841584e8-7cbe-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 17:06:59 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso65275271fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 08:06:59 -0800 (PST)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b15-20020a05600010cf00b00318147fd2d3sm9749787wrx.41.2023.11.06.08.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 08:06:58 -0800 (PST)
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
X-Inumbo-ID: 841584e8-7cbe-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699286819; x=1699891619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpU+dF1Q0CmsNv/cFqnoD09TDGC8Jje+Aks60P0puqY=;
        b=dgfye3WfVBE8TgaGb0qOkrtekqHrSBKTjmHWeyo03nWO3hD9dw0LrM604xGHl5yN93
         93B+N7YR6Qfu7P87U6Aty+R4xSMIX5gT16FZYtvqQaCVMYayumJR7cHTEEPsTpwx3QL2
         kn8+R7OrJEaBCoPyok7vBy3QYKm9WnRuZh9+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286819; x=1699891619;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpU+dF1Q0CmsNv/cFqnoD09TDGC8Jje+Aks60P0puqY=;
        b=lg+WWSPuxL4tDyDj+aErTTA24lxS5/JXDWuoWvADoHVg62XkNeelQKVeii/83eFIXz
         P5jpmBwSgsXc8ctEt1wjhUTX1XwenVSTSwosucHJXBPPvPfu4NEkJVJAhzZeR1yxsvQz
         zJOyOJBcMS1WON82h95VdJKjrAXXFnS7dh0k2FbsOluJ1UM0DIHlfnERGCaJVu7Lu3Yu
         U8/MaL+v8kxqdjg1mc/VkTWQqgI83DmfRVScv+gIsDiKHgyYxJ5DmAjXfVeNshI3s4uD
         DPttFr1uHz5U8sm5hyEKuldAMymEADpP6pkpnLIW3EZrz4UpKz0tbF6haMeNflTq2jMM
         Bsrw==
X-Gm-Message-State: AOJu0Yyc9OmXhSPajiwC4wqwxrwzUFQFYEZECRWSnXCNz+5w+79UeENe
	2Y7fUirYGtYfbji+nKUWg5/18A==
X-Google-Smtp-Source: AGHT+IEJebUuvC+dbzHh4zCl/eWf4BtYaAvd9577EaEVLCGMaGmrh7O4A45eflAvn61fQBVXKrjxEg==
X-Received: by 2002:ac2:5634:0:b0:507:aaab:528c with SMTP id b20-20020ac25634000000b00507aaab528cmr21226759lff.69.1699286819097;
        Mon, 06 Nov 2023 08:06:59 -0800 (PST)
Message-ID: <e52bf34c-0aca-4204-8502-11a45ecdb94d@citrix.com>
Date: Mon, 6 Nov 2023 16:06:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/x2apic: introduce a mixed physical/cluster mode
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20231106142739.19650-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20231106142739.19650-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2023 2:27 pm, Roger Pau Monne wrote:
> The current implementation of x2APIC requires to either use Cluster Logical or
> Physical mode for all interrupts.  However the selection of Physical vs Logical
> is not done at APIC setup, an APIC can be addressed both in Physical or Logical
> destination modes concurrently.
>
> Introduce a new x2APIC mode called Mixed, which uses Logical Cluster mode for
> IPIs, and Physical mode for external interrupts, thus attempting to use the
> best method for each interrupt type.
>
> Using Physical mode for external interrupts allows more vectors to be used, and
> interrupt balancing to be more accurate.
>
> Using Logical Cluster mode for IPIs allows fewer accesses to the ICR register
> when sending those, as multiple CPUs can be targeted with a single ICR register
> write.
>
> A simple test calling flush_tlb_all() 10000 times on a tight loop on AMD EPYC
> 9754 with 512 CPUs gives the following figures in nano seconds:
>
> x mixed
> + phys
> * cluster
>     N           Min           Max        Median           Avg        Stddev
> x  25 3.5131328e+08 3.5716441e+08 3.5410987e+08 3.5432659e+08     1566737.4
> +  12  1.231082e+09  1.238824e+09 1.2370528e+09 1.2357981e+09     2853892.9
> Difference at 95.0% confidence
> 	8.81472e+08 +/- 1.46849e+06
> 	248.774% +/- 0.96566%
> 	(Student's t, pooled s = 2.05985e+06)
> *  11 3.5099276e+08 3.5561459e+08 3.5461234e+08 3.5415668e+08     1415071.9
> No difference proven at 95.0% confidence
>
> So Mixed has no difference when compared to Cluster mode, and Physical mode is
> 248% slower when compared to either Mixed or Cluster modes with a 95%
> confidence.
>
> Note that Xen uses Cluster mode by default, and hence is already using the
> fastest way for IPI delivery at the cost of reducing the amount of vectors
> available system-wide.
>
> Make the newly introduced mode the default one.
>
> Note the printing of the APIC addressing mode done in connect_bsp_APIC() has
> been removed, as with the newly introduced mixed mode this would require more
> fine grained printing, or else would be incorrect.  The addressing mode can
> already be derived from the APIC driver in use, which is printed by different
> helpers.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

