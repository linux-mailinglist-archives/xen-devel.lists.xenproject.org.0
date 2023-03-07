Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA36ADC77
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507295.780612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUym-0005wt-N3; Tue, 07 Mar 2023 10:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507295.780612; Tue, 07 Mar 2023 10:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUym-0005u3-Jo; Tue, 07 Mar 2023 10:55:36 +0000
Received: by outflank-mailman (input) for mailman id 507295;
 Tue, 07 Mar 2023 10:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZUyk-0005th-VN
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:55:35 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 945a3c87-bcd6-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 11:55:32 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so6915788wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 02:55:31 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a7bc04a000000b003e876122dc1sm16145657wmc.47.2023.03.07.02.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:55:30 -0800 (PST)
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
X-Inumbo-ID: 945a3c87-bcd6-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678186531;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AAVcnYx3QZnRAXDufYHLkIsodJ4tM4KvNy14RA4QE6M=;
        b=a2gVlMiiU7S5mZPCuXPp1IpSMVC+Ak7HPfIQRaEpo37lxzMJri9lb4k6bMUE2znpp9
         +P5S5bcv+G6hwCEVBnr83uEQiNmOKdZRnZUFc+7GTEGesu2Cj28KEVHTSuxr5Ue677wL
         bHQTLKtf3KlHExJYrJiht5K60X7omSVw2xjcsOnkO1ahV7QeBOzYstc3kSCyuQ10L+1Q
         5+4axwdeDX8rSr1vw9xx2502MyzKNaSqdbMf27UO5wADXT1u3hUhgb6ePe3iMCohPA9B
         TFwepiM5syMTsH6S1/V+tHvZW/6ci5jde3EsSozaoD6nQo+AdD2qKcNVh+GGdHCUxJtw
         wObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678186531;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAVcnYx3QZnRAXDufYHLkIsodJ4tM4KvNy14RA4QE6M=;
        b=Jqx/kmoYSkXBuHTQVSeEMpXpYq1haeUKL5J5H7pooBIdHXtj5Yjx5Szz+xKzaj0TTh
         hWlvut6OMOnG0t6yMGJ15U2rFfV7qQY0O+1DK7MGteDtEo3JsxlqKn0cYNwfpEjW1Uwe
         jWvvSFRbCS/FAuUJThF76Lp9jse/HyrPXMLHIQ4dOXPAA58fZauqS9Tdg3fvlb3IsV2p
         B6z5hjhF60vUz87GqLpqZ1etlpGdxpLJGzeo+cm6e642BBHad9PxUCutaqKtLtoAS6SU
         pOSaMi+DKWyrSbNDfklw3TLr8DShFkipTWcS0qnW1I6lis+TRafiy71jfH8RRay+MIuH
         M8Ig==
X-Gm-Message-State: AO0yUKUmVCV1pGw0AQ6HEGVqVdavFt/DVaUqmPmymF+LU0Sz2MABojFU
	SmELszdmoCilp4/G8XYnnsI=
X-Google-Smtp-Source: AK7set+BkQbMolHKG9tsxmouOdNPkJc43l0g6ZwDn7TZkxqZPIfcbEg+j+eVA5m18GT2O3Gmz9a6Eg==
X-Received: by 2002:a05:600c:a47:b0:3eb:2b88:9adc with SMTP id c7-20020a05600c0a4700b003eb2b889adcmr11175851wmq.25.1678186531216;
        Tue, 07 Mar 2023 02:55:31 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e33bba43-5f5d-80e6-34ff-62c7b6eafc1f@xen.org>
Date: Tue, 7 Mar 2023 10:55:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 01/25] hw/xen: Add xenstore wire implementation and
 implementation stubs
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-2-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This implements the basic wire protocol for the XenStore commands, punting
> all the actual implementation to xs_impl_* functions which all just return
> errors for now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build     |   1 +
>   hw/i386/kvm/trace-events    |  15 +
>   hw/i386/kvm/xen_xenstore.c  | 871 +++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xenstore_impl.c | 117 +++++
>   hw/i386/kvm/xenstore_impl.h |  58 +++
>   5 files changed, 1054 insertions(+), 8 deletions(-)
>   create mode 100644 hw/i386/kvm/xenstore_impl.c
>   create mode 100644 hw/i386/kvm/xenstore_impl.h
> 

Reviewed-by: Paul Durrant <paul@xen.org>


