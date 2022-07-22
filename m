Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7A857E51A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 19:11:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373422.605638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEwBI-0007Ap-2E; Fri, 22 Jul 2022 17:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373422.605638; Fri, 22 Jul 2022 17:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEwBH-000789-Vs; Fri, 22 Jul 2022 17:11:15 +0000
Received: by outflank-mailman (input) for mailman id 373422;
 Fri, 22 Jul 2022 17:11:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/THL=X3=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oEwBG-000783-Cn
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 17:11:14 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a10e7f0-09e1-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 19:11:13 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so5592743wme.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jul 2022 10:11:13 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9?
 ([2a00:23c5:5785:9a01:c8eb:68b3:50cf:a1a9])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b003a31d200a7dsm5807044wma.9.2022.07.22.10.11.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 10:11:12 -0700 (PDT)
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
X-Inumbo-ID: 4a10e7f0-09e1-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+uHNPRHasGp/zLvSnnqRXk//D9PCQ6LVhMfCDxKqXNM=;
        b=GG4IV6TRIXP4SDhyFqMZOKL4iaxU9XVC1wqaEnf831GteSYKvbLVEcBOFk6KD+vBlM
         SYPhb6thDE4hWi8M9976v+RvW6rTXYWYEwHXPMNhQ+9G2Dwv0YQ7QM3UBkahwPNDjKuN
         Qcu1Vrf/moofyEMm+NbivEh4x8KNZbTrp/+Igi50mjksUPrPnJiJrEt4acDP66h6NnoQ
         3g9ctN5Yj4Y1QmfDUaG5Lqu68YSGHn1gnj+L3JoxC3kN52eMmt6rRG3nfaiffP2BX2iD
         ivs/JfWR21jtXp1N3tVQB1A46vm46YPhwQ87a6bEFVOQfYU/auI2d4PURmigLQdIzE4W
         RR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+uHNPRHasGp/zLvSnnqRXk//D9PCQ6LVhMfCDxKqXNM=;
        b=3PRaYrFNa4Xh6Ifd5hO7S7p9IOGb24sfaOQjfyBAnfXgWW+p+jh73Cl5XaMQPUMIlv
         s/+8CUqkImtwbT68EI63+YON27vv8WcDabTtyJZ7Wlkxoac9WsPRl/odPf/MCDKML4I5
         Z84c/xPNM1wU4VOCvVjakbQTks+c5DGDT4Lw3FigoqObtsOjR9Q3YdgcwIByvzANZa4g
         wrJZzVPwrZi2nsB3jChtHNyX64/YyA7VFU3n2KsRiNDHU/9lmtdLZZYQQYjrXgdbQrpC
         Ds0PROwsvbxpQN+tK1nwvosWa8tvnt7gVZ7SL/JmAMBmxAB0GA+A5a6Qb4rx2XhYE0Ee
         NcTw==
X-Gm-Message-State: AJIora/kjsbADOBe66a7VGUqvDo7Uzt4gJTsuqg17v/JTYE716Z44kKG
	QZwGqcWm2K6FYDmDN4BSUkRZKDTX9brC8g==
X-Google-Smtp-Source: AGRyM1vBTXIH7YaNO6XQMXH9ayrQs8i5n1T42h3KaSOQqeWS+bCPJ9T24kX9SKH9RHqVBrJvbevzcg==
X-Received: by 2002:a05:600c:4e01:b0:3a3:342:5f55 with SMTP id b1-20020a05600c4e0100b003a303425f55mr521459wmq.150.1658509872825;
        Fri, 22 Jul 2022 10:11:12 -0700 (PDT)
Message-ID: <a3366abc-b679-d38b-565c-6035c9b28098@gmail.com>
Date: Fri, 22 Jul 2022 18:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v7 14/14] VT-d: fold dma_pte_clear_one() into its only
 caller
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
 <20b9d343-fe6e-b5f1-1ad4-6795aaae0fcd@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20b9d343-fe6e-b5f1-1ad4-6795aaae0fcd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/07/2022 13:49, Jan Beulich wrote:
> This way intel_iommu_unmap_page() ends up quite a bit more similar to
> intel_iommu_map_page().
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>

