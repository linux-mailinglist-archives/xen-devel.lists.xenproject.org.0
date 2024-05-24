Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836948CE70B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 16:31:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729595.1134803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAVwS-0000Lj-Hh; Fri, 24 May 2024 14:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729595.1134803; Fri, 24 May 2024 14:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAVwS-0000JY-Eb; Fri, 24 May 2024 14:30:44 +0000
Received: by outflank-mailman (input) for mailman id 729595;
 Fri, 24 May 2024 14:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nTfd=M3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sAVwR-0000JK-7i
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 14:30:43 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 328e77d1-19da-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 16:30:41 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2e576057c56so88332621fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 07:30:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578524ba2ecsm1814048a12.89.2024.05.24.07.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 07:30:40 -0700 (PDT)
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
X-Inumbo-ID: 328e77d1-19da-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716561041; x=1717165841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UskfpYP3fNcFRRBO5RaGcacGbH/+MAmEZ1kZgYhopzY=;
        b=KJ/FsZq42hctno7kMg+H6Ft6hgZD6Mqktqal+BwdZGxoO0En4snQGKSCf3wXFHjWdU
         tQgdM34UMdg6Ci1dYxRsQ/gT+cVlkB+Ap3MVjqoyX6Pmvc9zM5AVEyN6cd+FEHv4G3og
         xkrys5G4lvxFQ6trCnoujDFYB5zwtoTzgd5IolW4RHw4PRuOD6w8/NIsqOlS8Ebg5eRe
         FkHB43L0SpTruUOCZsuYUQBsQJnS6dCEI2/zaQZH/v+35BwtxqEU0FUf/+D1NVSw77Cj
         0tfpTdG8Jvgq8zRrCSY9XqtaQgNWrvpsK940l/Y2FTxHzaEwFlbrLSQ78fq/0grmyIzG
         L4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716561041; x=1717165841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UskfpYP3fNcFRRBO5RaGcacGbH/+MAmEZ1kZgYhopzY=;
        b=iuo+EdWFmlQpkcijVGnbPinCXstLZsETjKbe+lkoYwo8OR4GouONATDY/HfWIM7jyS
         AEkFE3Pg5FhXTHQLmafsgJciQQj151mK36rVDoxQP8oh3/ZxQOw3xoVNH4mtvzUK4XBz
         AMD0YG4KNXgYSYcdH6tUvvxqv6EGFCkm7VPedu3XAo+IaxRYuhAY63tbG3ChbBk7e/Sq
         quYJG8AF6O5/RLTtsYuozST5erUCNEopJ/XJnIpQS81PhfBEpZOCclItF7xDZPjJpN89
         mi9SQxWshJymyKD7vur3zdXfW16m8+GESinMPU/2jbTkEqm5Bf4ZlH/mFT4qAJ/DN6ef
         iInQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkoDIzkb3kpyPUZMBPy8l2gz6r+aG5GIKXqiemZn0QcWq6YSlZltgGWrCvW4ZPJcB96x6oosY7Z8NPAKcPlmrHWZiedkO+viEIrNqX5JY=
X-Gm-Message-State: AOJu0YwkUp/kQR5vUimS2pk1eMIcQscCq634YJe6TcqQDNeYg5V8uJxj
	a4h4yVA/AKCvZLY8rhk6U86sTuMX8eDqOdABtyHOBrImeKPaNzCbfAEACBtnFBo=
X-Google-Smtp-Source: AGHT+IEyuE87zelNLVGr34Afmmm9yCAyTVX1WQhxWWNJzDh3NIctepE6D+gV6VDQ3vrU61R+nV0mCQ==
X-Received: by 2002:a19:9143:0:b0:518:dbcc:4f8b with SMTP id 2adb3069b0e04-529644ec1demr1292112e87.12.1716561040782;
        Fri, 24 May 2024 07:30:40 -0700 (PDT)
Message-ID: <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>
Date: Fri, 24 May 2024 16:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
To: Julien Grall <julien@xen.org>, Henry Wang <xin.wang2@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-3-xin.wang2@amd.com>
 <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.05.24 15:58, Julien Grall wrote:
> Hi Henry,
> 
> + Juergen as the Xenstore maintainers. I'd like his opinion on the approach. The 
> documentation of the new logic is in:
> 
> https://lore.kernel.org/xen-devel/20240517032156.1490515-5-xin.wang2@amd.com/
> 
> FWIW I am happy in principle with the logic (this is what we discussed on the 
> call last week). Some comments below.

I'm not against this logic, but I'm wondering why it needs to be so
complicated.

Can't the domU itself allocate the Xenstore page from its RAM pages,
write the PFN into the Xenstore grant tab entry, and then make it
public via setting HVM_PARAM_STORE_PFN?

The init-dom0less application could then check HVM_PARAM_STORE_PFN
being set and call XS_introduce_domain.

Note that at least C-xenstored does not need the PFN of the Xenstore
page, as it is just using GNTTAB_RESERVED_XENSTORE for mapping the
page.


Juergen

