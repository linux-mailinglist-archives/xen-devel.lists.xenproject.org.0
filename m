Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F6ABA695
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:30:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987774.1373022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4V8-0002dF-DP; Fri, 16 May 2025 23:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987774.1373022; Fri, 16 May 2025 23:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4V8-0002aQ-9y; Fri, 16 May 2025 23:30:02 +0000
Received: by outflank-mailman (input) for mailman id 987774;
 Fri, 16 May 2025 23:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uG4V6-0002Si-QL
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:30:00 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acb9b335-32ad-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 01:29:55 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a363ccac20so611992f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 16:29:55 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca62c70sm4382829f8f.54.2025.05.16.16.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 16:29:54 -0700 (PDT)
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
X-Inumbo-ID: acb9b335-32ad-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747438195; x=1748042995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HKK9RX4hR0A5SUlwzKQTLFqzQ1hDvrAFwLmvW3QQULc=;
        b=vt3avghyseVEtYw4p4hLlUcSgOPbQ/pPTxcTmzJkSxl8BcqHI6PvzBELKtVSBSFVSb
         iGe23Ea56ZGxj/faJSzAKwjN4dNiRv/zB8s64soj3vtdBg16wPafG0TH2V9gRgQXpLbZ
         QGigG14DaTmUkUYkezaugBqtvEvszrCd/85mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747438195; x=1748042995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKK9RX4hR0A5SUlwzKQTLFqzQ1hDvrAFwLmvW3QQULc=;
        b=eWRnzZcvDmzeHDEGkYMLeEq6T5hvzQTvp+tg7NWygfUjztgZS+COpBrADg0i+jXNxI
         70tCwSAVhMjEgrHsBYqxpCulJAEmyR24O7kHEhZb379kTLJ8w0x5jsQ27cdtgLtWeETD
         RFuLxL9v6dEx6zW+SKmCGUPpCzsF8H/xrk1qDihQhS1Qm7SDZ2nl6FTDKyRNe9HmUEED
         Ec8sjo0Jtf2A29cXNk7SB4U9vxrkgvRrjyQh3/oUSI4zcGkUiUCfWUeHlQPOsZ+IX/Xq
         clfPZO232zLjVMqRXy86ApxOiVezClqloTPF6ldCfk2ugYFRSWRadOobjal5y2F3++w7
         D3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX1GQ3hX7OLSftuJJSxcmNpCRpVPLvfhleOCPqWFxorKSdNhojatK5Vh7Kj0JQb4mL6eiBZjWu6SjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuLv3jG7SP8V/vJbooyY4AXJ5K0utns2IBKbYkVis6Cz0NsT8K
	uNrllXILKIr3qOSl8g2mJG+y0cM4WyGo29u1j2g4M0ewynJlbpmTdl2Cd8/2l+gmLv4=
X-Gm-Gg: ASbGncutNEU4ORaEEct0JDYwXQd3D7lbQrEA3LLJM5M+3ru43TIfpqQ4ReX5HIVLZzS
	2KFk22j9l0JkoUtm1c9xkXvJ0e/+ns4que3PpKEHyzwTW0Z/3QbPzJvJS6dl1kED+qihwyetjHI
	4JzDpMh2oxnXFuPX/ETFkKxrVCbiGwkwkPbkw2CPzDGMBcx3XhrAVlMH3hI/baFcSqP8cWEQInc
	fdv4DTnJTMOR/Fam8z8b06zvs0QmibNkSIOeP9oCwdfYCv8D1MDA7mrlW55TDcslcAqD0NWPM0I
	wZevZYuQ8d5MxQiBU/i7QNB2RX2I2af/BPkd0pDeLt2n0GRkv3ygwUJBOvizl9F+y4r0BMFe3RQ
	xjV08XQn5ZmnIK2d4
X-Google-Smtp-Source: AGHT+IGrcLeQ/94xxk+A3dFEzG1GERItZMl+P1wUOYX4bUU3PFpVR8ume06p+yRRSWEWeXRfd2H/Cg==
X-Received: by 2002:a5d:64eb:0:b0:39c:12ce:6a0 with SMTP id ffacd0b85a97d-3a35c826787mr5432307f8f.21.1747438195307;
        Fri, 16 May 2025 16:29:55 -0700 (PDT)
Message-ID: <d1bcab8a-873c-42ed-b7e8-071c009bcc3a@citrix.com>
Date: Sat, 17 May 2025 00:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] xen: refactor include guards
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, jbeulich@suse.com, julien@xen.org,
 roger.pau@citrix.com, sstabellini@kernel.org, bertrand.marquis@arm.com,
 Federico Serafini <federico.serafini@bugseng.com>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
 <20250516232130.835779-4-stefano.stabellini@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250516232130.835779-4-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/05/2025 12:21 am, Stefano Stabellini wrote:
> diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
> index cbdd1bf7f8..5bdf8b215c 100644
> --- a/xen/include/xen/err.h
> +++ b/xen/include/xen/err.h
> @@ -1,5 +1,7 @@
> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
> -#define __XEN_ERR_H__
> +#if !defined(XEN_ERR_H)
> +#define XEN_ERR_H

I know this is just rearranging the existing like, but both the
defined()'s should turn into the more normal #ifndef's now they're split.

Same for softirq.h

> +
> +#if !defined(__ASSEMBLY__)
>  
>  #include <xen/compiler.h>
>  #include <xen/errno.h>
> @@ -41,4 +43,6 @@ static inline int __must_check PTR_RET(const void *ptr)
>  	return IS_ERR(ptr) ? PTR_ERR(ptr) : 0;
>  }
>  
> -#endif /* __XEN_ERR_H__ */
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* XEN_ERR_H */

I realise this is personal preference, but for the end of a header like
this where each is annotated properly, I don't see much value having the
extra blank line.

~Andrew

