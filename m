Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8408FDE9A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2024 08:15:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735907.1142026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF6OS-00039f-CG; Thu, 06 Jun 2024 06:14:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735907.1142026; Thu, 06 Jun 2024 06:14:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sF6OS-00037P-9C; Thu, 06 Jun 2024 06:14:36 +0000
Received: by outflank-mailman (input) for mailman id 735907;
 Thu, 06 Jun 2024 06:14:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sF6OQ-00037J-Oc
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2024 06:14:34 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a297257-23cc-11ef-b4bb-af5377834399;
 Thu, 06 Jun 2024 08:14:32 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35dcff36522so614717f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jun 2024 23:14:32 -0700 (PDT)
Received: from [172.31.7.231] ([62.28.210.62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e96c15sm644603f8f.75.2024.06.05.23.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 23:14:31 -0700 (PDT)
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
X-Inumbo-ID: 0a297257-23cc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717654472; x=1718259272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kRKrKhUC+jacDQ6vyLo09CgzUBl80TIrI9om95rMHjY=;
        b=W6WLq8xEqYum0C3domXE8AVrlrChQZaN7Tvfl9GoJko83Br+8swFYU7oIv61LU39yJ
         b4oKZsRphlK6+BI56YMBQ684HOid6L4dMHsYi8ee4dEmlkaBJ7LSasKnUgrtAFnk8GO3
         vf34Br10zWmXZR1U58HVs7z/mZy+GwMvhF/TKYjQ2A3OOAtIVjdkThzYYaRwqtgBAiTv
         lXjcv18yQxHBzqGc4l5C19hta/+yrzC8ZbuVnzkl5XYbBe2MUzwX/Sif6Uj1h8jaFNtx
         wJiXyM9UXpUGVYpr8URdkYNgIMx4YMH88+PWEnigx5gzIf1P4nf1gxvqvzwzXjgYvkXN
         ctjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717654472; x=1718259272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRKrKhUC+jacDQ6vyLo09CgzUBl80TIrI9om95rMHjY=;
        b=vMJWh/3dtuMyWnMKC7HOGOSCEGfDocX4oVfcnHDQuTPir3zXu7cY5OmwBD38vHtSTJ
         LFrpnqt6PfgQ8u0CkxpqXqnvcmBECvDZood3KPJgwHXhp5VdxsZdhMo5dQABaBHErGqo
         tnqPSANqZ076CWQtFScXFblVCIFPTygGaZhZQZ/xY92JElCRRnfPIQ+RaGg/BthWLFad
         a2xbapck+5IpUmlhYUP6xLVHHyji3Ndpxl7ntNYptBeRFxyDQlD0PTtwey9oYlBqSEWz
         aZ8PYagL6wXRjh4DkQO1ViM8L98cmOO4OaT3FAnsxvWynqz36bPxwNDwekfwHfeGyKwe
         uuKA==
X-Forwarded-Encrypted: i=1; AJvYcCXg/Y4lvIvIol7K0wH+41+hERr4Ov3I1YTz04osnYaxd+WRU9ZSYP3A0soWp+KgmEe3qCwUzuLEgchnBqe5cdd2SCglktdC2lcRJ6beV6Q=
X-Gm-Message-State: AOJu0Yy0C5otPZKgWixqR0zWLvB2HeYHUtC+s7P7Pn4fwRABH3Q6a2/G
	O3DGretbcYBKfCLwva1La9MS75ROYu7DRgdkmWyTaJU9atWg0pZehuS+nX67+w==
X-Google-Smtp-Source: AGHT+IEI0uoyaFiPKkVpQ7TkAvRlOxIZZCvxldIDqD8mPU9mkQzgsjMUmWfk+rR1Q4J+of6VyaMtaQ==
X-Received: by 2002:a5d:4b0a:0:b0:354:e746:7515 with SMTP id ffacd0b85a97d-35e8ef15cd1mr3061975f8f.34.1717654471751;
        Wed, 05 Jun 2024 23:14:31 -0700 (PDT)
Message-ID: <053fe7c5-4f91-450c-b00d-24ae231e2e8c@suse.com>
Date: Thu, 6 Jun 2024 08:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
 <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <67960b60-3108-4920-8bf1-68a00e117569@suse.com>
 <BL1PR12MB58490E8F1F26532B0FDFFFD6E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <46b884e2-cbec-46f0-9070-7013307a310f@suse.com>
 <BL1PR12MB5849C1D40FCF9861BFE7B208E7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
 <6d2e49bf-7be2-48f1-8075-dc0626015c17@suse.com>
 <BL1PR12MB5849932D0F3D280E4B8574DCE7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB5849932D0F3D280E4B8574DCE7F92@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2024 12:22, Chen, Jiqian wrote:
> On 2024/6/5 18:09, Jan Beulich wrote:
>> On 05.06.2024 09:04, Chen, Jiqian wrote:
>>> For now, if hypervisor gets a high GSIs, it can't be transformed to irq, because there is no mapping between them.
>>
>> No, in the absence of a source override (note the word "override") the
>> default identity mapping applies.
> What is identity mapping?

GSI == IRQ

Jan

