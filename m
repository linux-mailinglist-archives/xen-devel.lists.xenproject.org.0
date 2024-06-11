Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7268903400
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737957.1144485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGw82-0006It-Ub; Tue, 11 Jun 2024 07:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737957.1144485; Tue, 11 Jun 2024 07:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGw82-0006HO-Re; Tue, 11 Jun 2024 07:41:14 +0000
Received: by outflank-mailman (input) for mailman id 737957;
 Tue, 11 Jun 2024 07:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGw81-0006HI-BE
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:41:13 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8bf255b-27c5-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 09:41:11 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7955c585af0so50776085a.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 00:41:11 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-440ee9ca87esm16532421cf.23.2024.06.11.00.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 00:41:09 -0700 (PDT)
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
X-Inumbo-ID: f8bf255b-27c5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718091670; x=1718696470; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XG4UrLljBpRJt7MEDg4S7rUqsAvR0Hgz2iYi7r9pP6c=;
        b=UMe5XbVxfVPzu+kuY01BlO/sA2FnnFlUBzMRsl0lqcRP9K6asf8ZgSIwdjXQbnpHoS
         M2vzmnfWi6rw24P3qymiVYCzr6j4gdmmaUiqMeC5+ZBEmG8fxVoiA40CimJy2lAloiLO
         cxWESF3YGSz5cwYdpncOxwUeKUFv/9zSKCqV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091670; x=1718696470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG4UrLljBpRJt7MEDg4S7rUqsAvR0Hgz2iYi7r9pP6c=;
        b=Ylt7snudkRLR5oO+MhcmqNgRIiAnbwOuksfCxpdhVIYTJbD94SPEngZAt/nGU2NKsT
         tPg898GppuhtfBxtuBX1ximQdZA/hlCsyP8MkK8FNeKRHQ+uYf5lCO4RVKECYh/pKKW3
         P//na+dZxekQjLHqcGDKRJt6JENDLskX7gSvgI1+p8gDhmYkD2ucyINa/dakplyZ7kSK
         WuSB2tQUeUdDPzNeV3mbFm3vlYsei0PV1HIrgxm1Rl59MB2LmZvkT+SElJZKUIOSz19Y
         BwVqSl6wwfzMO9aTa9b5jnXTQN92Pdlgw2NucapNx9wutcJvzIMdz2EVSc25EPzI2X59
         HZRw==
X-Gm-Message-State: AOJu0Yyfss7DlVf52AXf8DQGeNUZCyiZgBCp1zK+ny0cd76ny+0xJyOi
	zchh+uPEP67AVfcbDET8XjORfjYLjF5hB+Y33hgLkJr8zjomyW/ZipZ1JqEWToMXaTONYu34VUf
	O
X-Google-Smtp-Source: AGHT+IHsq+vu4+N9ojz+udTBXM5pQ9W+lTRzU3ByNBUxG4x42gqYouv/A4AL02Nq9L04MV54PGE8YQ==
X-Received: by 2002:a05:620a:4792:b0:795:5fc1:3217 with SMTP id af79cd13be357-7955fc133c9mr561960985a.61.1718091670119;
        Tue, 11 Jun 2024 00:41:10 -0700 (PDT)
Date: Tue, 11 Jun 2024 09:41:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/EPT: relax iPAT for "invalid" MFNs
Message-ID: <Zmf_k2meED8iG3H5@macbook>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>

On Mon, Jun 10, 2024 at 04:58:52PM +0200, Jan Beulich wrote:
> mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
> access to actual MMIO space should not generally be restricted to UC
> only; especially video frame buffer accesses are unduly affected by such
> a restriction. Permit PAT use for directly assigned MMIO as long as the
> domain is known to have been granted some level of cache control.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Considering that we've just declared PVH Dom0 "supported", this may well
> qualify for 4.19. The issue was specifically very noticable there.
> 
> The conditional may be more complex than really necessary, but it's in
> line with what we do elsewhere. And imo better continue to be a little
> too restrictive, than moving to too lax.
> 
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
>  
>      if ( !mfn_valid(mfn) )
>      {
> -        *ipat = true;
> +        *ipat = type != p2m_mmio_direct ||
> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));

Looking at this, shouldn't the !mfn_valid special case be removed, and
mfns without a valid page be processed normally, so that the guest
MTRR values are taken into account, and no iPAT is enforced?

I also think this likely wants a:

Fixes: 81fd0d3ca4b2 ('x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt()')

As AFAICT before that commit direct MMIO regions would set iPAT to WB,
which would result in the correct attributes (albeit guest MTRR was
still ignored).

Thanks, Roger.

