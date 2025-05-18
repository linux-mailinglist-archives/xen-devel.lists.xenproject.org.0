Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D0ABB01A
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 13:45:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989025.1373372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcRs-0002Sg-2X; Sun, 18 May 2025 11:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989025.1373372; Sun, 18 May 2025 11:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGcRr-0002RC-Vv; Sun, 18 May 2025 11:44:55 +0000
Received: by outflank-mailman (input) for mailman id 989025;
 Sun, 18 May 2025 11:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGcRq-0002R6-Kf
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 11:44:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82e6f05e-33dd-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 13:44:52 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso37461495e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 04:44:52 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a369140048sm4395130f8f.57.2025.05.18.04.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 04:44:51 -0700 (PDT)
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
X-Inumbo-ID: 82e6f05e-33dd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747568692; x=1748173492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUVGFaRpGvlS/Wi86yKY81ZWPOYmg2FwKplMhYbHfmA=;
        b=Kr78/edJFkMDUbgKhP7eFCkhAY9qk7GwvC63pbFvpWW1+/GhUT7k0x0kxXEv7jHZjQ
         04jms1bUzGCEda6pHUxQhaqf2lV4NMVzD3sdeWqfb9HdS8CksDHWV5nRaSnpnDxuuHxa
         5EuxWUGM9HM2Z/60JVB2ITzWrgg5GAuMvIF+0AUFCu0l7lpgfuUDaVBMYy1dtWCJqBG0
         YpjYj1Z8ZZHBIR5a+erSdiXYBOJT/rMh69y+rbLU3x+XOkPvu10Povg6rrlMBs74wffB
         STo5ARblNuwnY4AcNmr80RWlp6MLAqDjD2bd4zRq2ay26GulzPr+fV30/snzalmQyc9V
         VCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747568692; x=1748173492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUVGFaRpGvlS/Wi86yKY81ZWPOYmg2FwKplMhYbHfmA=;
        b=JJknLvxUucIsKpv7yZ8l9BNJ1A4obKV5kSihBRHABDHgZ4F0cHLUAqzoNO+Lmo+C2N
         NMhnKS2e9JcVHaKqBvTtmXV6mavESkXTmcDzQsIh6BmYEFHiO4ErPA5E+Mmv3kN50Kat
         ranVceZQWmp06CfV4ew41lVRNH6uAHZU0BuCOG0QPWWetQGoYL3xc2G1JTnvLWQtqyC9
         oK3UcjubhklgmGCvKIDhyq1ldsLldI0UWjKlYFmevZR0+td5tHtxahs2Tj8roBFEW0/j
         r5c8bF4C/cftgfdFdosxEOIPupJeO1Cdm67wuPrHaL5cPQ4Xi+Es8kGu0eNaxih3pn82
         RUXw==
X-Forwarded-Encrypted: i=1; AJvYcCUxb6Y6HlXuLPt0vVKuoG3UELj/IxooerRFg3+CDE3oEgGKbrzzWNHTR/d8nIoETp6EFe5HUNhSBRs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDv4QE59iW4ln8XwUVRYUwytXMcNDTD2ZqnOE0XODa9V/ibYp7
	p9EDW/lXu+Ov66zNTWpU6tNccdR3zwFjAcedzQI+pkSF9NB2VN5+V0kV928IL+fE9Q==
X-Gm-Gg: ASbGnctAK36xzJ50eXTYT/slddv7xumO/BsPzKqZ0lP7K3MlORE1+krJuF0xxwstHMK
	vQXnv2pmJbcKavyh+JiTJyOdvoHoFSHVFLtBevYQYZn+dOwMFAWfbAiQt9x8O/6cHMAXkaVHKt5
	4SVLQGX4Wq8kzF1FeZe8Mu8W2BNL4deIZo0ry8I3PUNaiN18BXVK29QJlr7k/YhBLJg6UMwCjGZ
	nhv+xVRNd/N+Cg3i6g3oyhediAsTK/T/FqK4PLzOXwrz6N+mVw0hYIzZZb2Ox5pSGOaA8E9rzp9
	tKpoUHJieNeKrRouunhFsAwgANCZcohOrKDTln9bgoRWUz0KCRPvnUzsBhsyediq050+GlZ/Ni1
	HPDH1mJkD8z/oXs/7lVj3xAbA
X-Google-Smtp-Source: AGHT+IF1LWny7MFyhW03YpKrhd0rkHi7jURU3la5NzeYa0Xspyd5K41CZH1Ws+OoVPa3Hw6JUE3p4A==
X-Received: by 2002:a5d:64e3:0:b0:3a3:6cf9:9b63 with SMTP id ffacd0b85a97d-3a36cf99d95mr1046773f8f.31.1747568692042;
        Sun, 18 May 2025 04:44:52 -0700 (PDT)
Message-ID: <c01ec6e8-bb45-4072-a527-99a7c72fc714@suse.com>
Date: Sun, 18 May 2025 13:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/hvm: reduce the need to flush caches in
 memory_type_changed()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-7-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250516094535.63472-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.05.2025 11:45, Roger Pau Monne wrote:
> The current cache flushing done in memory_type_changed() is too wide, and
> this doesn't scale on boxes with high number of CPUs.  Attempt to limit
> cache flushes as a result of p2m type changes, and only do them if:
> 
>  * The CPU doesn't support (or has broken) self-snoop capability, otherwise
>    there would be leftover aliases in the cache.  For guest initiated
>    memory changes (like changes to MTRRs) the guest should already do a
>    cache flush.
>  * The IOMMU cannot force all DMA accesses to be snooping ones.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Not sure whether this attempt to reduce cache flushing should get some
> mention in the CHANGELOG.

Err on the side of adding an entry there?

> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -782,14 +782,21 @@ HVM_REGISTER_SAVE_RESTORE(MTRR, hvm_save_mtrr_msr, NULL, hvm_load_mtrr_msr, 1,
>  
>  void memory_type_changed(struct domain *d)
>  {
> -    if ( (is_iommu_enabled(d) || cache_flush_permitted(d)) &&
> +    if ( cache_flush_permitted(d) &&
>           d->vcpu && d->vcpu[0] && p2m_memory_type_changed(d) &&
>           /*
>            * Do the p2m type-change, but skip the cache flush if the domain is
>            * not yet running.  The check for creation_finished must strictly be
>            * done after the call to p2m_memory_type_changed().
>            */
> -         d->creation_finished )
> +         d->creation_finished &&
> +         /*
> +          * The cache flush should be done if either: CPU doesn't have
> +          * self-snoop in which case there could be aliases left in the cache,
> +          * or IOMMUs cannot force all DMA device accesses to be snooped.

I think this could do with "some" added ahead of IOMMUs (maybe parenthesized),
to clarify the route to take here if and when we change the global to a finer
grained property.

Jan

> +          */
> +         (!boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) ||
> +          (is_iommu_enabled(d) && !iommu_snoop)) )
>      {
>          flush_all(FLUSH_CACHE);
>      }


