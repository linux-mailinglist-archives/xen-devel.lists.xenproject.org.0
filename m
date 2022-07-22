Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C40757E4AA
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373368.605539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvpL-0007BZ-7v; Fri, 22 Jul 2022 16:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373368.605539; Fri, 22 Jul 2022 16:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEvpL-00078y-5G; Fri, 22 Jul 2022 16:48:35 +0000
Received: by outflank-mailman (input) for mailman id 373368;
 Fri, 22 Jul 2022 16:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEvpJ-00078s-Do
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:48:33 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ed443f1-09de-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 18:48:32 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso4840910wmq.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 09:48:32 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 m39-20020a05600c3b2700b003a2e1883a27sm12428818wms.18.2022.07.22.09.48.30
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 09:48:31 -0700 (PDT)
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
X-Inumbo-ID: 1ed443f1-09de-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7QhYqcqhb3JRPzK1WchfWG6GW+FTDQHvg0lGPxPhVMU=;
        b=PeYJe5CldcZaQw5zqx95/CLyqb1bQyZaG40o40NxI89FDfO9qG1zhX8ujr0OIJyZHQ
         QzsOXnIcq+vNBc6FFA7mfC93nAgcmMLY5q3NKXmSOzvFN2i/wN+uVhQC2aB7qCuxgwrC
         Uj4RlFIHzAAHpiZk7nXwC7/AymS8JGjKAJEQpwabDFGasGOYGPQznxteCOOXffN7bmem
         LVmKdqb0CWiGbQFvQ4vbB4iqkLm1BfTI1rbkp31ULo6W6x4NCmDuHgnHuPoIrnZj3xg5
         Juv8L20sm0rh9vz/j2WUQxSYDDYHfk/GxKzZ4rwkdGiCgOMy4wdiUxwTqQStnCVgmoOx
         hu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7QhYqcqhb3JRPzK1WchfWG6GW+FTDQHvg0lGPxPhVMU=;
        b=z/dn5Nu+4wn4R01+Uv2FHRB3ph/Eqm8yHVDNxPJBuI6/KECwmEkzCJID+eIRmPVjRD
         8uYrVVMLSKUBgdpNR5XPDDO5/GvejomfPfgabZut5u/m7+Uj4coBc0LwlVj5iLOoF23r
         YLmo2I5y8cRTJHljfhjvwNoBu0ib5fZnTEHl4q7jsH5qnxhxcXV2XxKuI4GLoIilxtm7
         KLHO6wcknA5a25HUaWShR6Q5gpBwH4vDylSyNA+fyDPhk5rWwSWwUvbWyVdsT2o3S8qX
         rLxtWhX4KH7jvm7dSwlfdxrteFj17zcdKYbTtFvzj+/BpVSd0pi55ul9QHMsFZa4NkXn
         dYsg==
X-Gm-Message-State: AJIora9h8lF6c3BYTmSRv0q1LCxfjmx0EZarDMCDpiE4RdaDhCHUOZ2l
	8tYSENiJjWGihKSzNP54J1vTuGOfdcmiuQ==
X-Google-Smtp-Source: AGRyM1v9ySo7/thzvGGCvf6v4P5b7LMpRF2wIyI7Hae3pIdxkfACaV4DPTJRvsifxMd2/ToM18FpuA==
X-Received: by 2002:a05:600c:1e8a:b0:3a3:20fc:a651 with SMTP id be10-20020a05600c1e8a00b003a320fca651mr439767wmb.39.1658508511952;
        Fri, 22 Jul 2022 09:48:31 -0700 (PDT)
Message-ID: <4538079b-8aa0-df72-0b1a-9382887aa9c9@gmail.com>
Date: Fri, 22 Jul 2022 17:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 05/14] AMD/IOMMU: allow use of superpage mappings
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <fbafed29-ae2f-6227-ed30-9157230a041b@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <fbafed29-ae2f-6227-ed30-9157230a041b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:45, Jan Beulich wrote:
> No separate feature flags exist which would control availability of
> these; the only restriction is HATS (establishing the maximum number of
> page table levels in general), and even that has a lower bound of 4.
> Thus we can unconditionally announce 2M and 1G mappings. (Via non-
> default page sizes the implementation in principle permits arbitrary
> size mappings, but these require multiple identical leaf PTEs to be
> written, which isn't all that different from having to write multiple
> consecutive PTEs with increasing frame numbers. IMO that's therefore
> beneficial only on hardware where suitable TLBs exist; I'm unaware of
> such hardware.)
> 
> Note that in principle 512G and 256T mappings could also be supported
> right away, but the freeing of page tables (to be introduced in
> subsequent patches) when replacing a sufficiently populated tree with a
> single huge page would need suitable preemption, which will require
> extra work.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

