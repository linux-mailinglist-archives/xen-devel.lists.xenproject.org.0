Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C148D0491
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 16:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730801.1136014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbe1-0003Br-T6; Mon, 27 May 2024 14:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730801.1136014; Mon, 27 May 2024 14:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbe1-00039Z-Pp; Mon, 27 May 2024 14:48:13 +0000
Received: by outflank-mailman (input) for mailman id 730801;
 Mon, 27 May 2024 14:48:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9k1s=M6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sBbe0-00039T-8V
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 14:48:12 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21d56d6c-1c38-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 16:48:08 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso948315566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 07:48:08 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93b54esm501293266b.89.2024.05.27.07.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 07:48:07 -0700 (PDT)
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
X-Inumbo-ID: 21d56d6c-1c38-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716821288; x=1717426088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/akndZUowcan2n2TtFR3JQ/wHLAG3/zGHe8EITN8Q0=;
        b=ZwtGp4RFggH0dwZkAKvoVLaNIVkkcwM3rCFQqxm285OyafQpBnwTxXG79+K/yz7rOC
         nO2GUNVkxMG57ZbNOvy/yIp1FKG6ECabNgs3dzAIbzBH4ezRfm2Ai+x1YnCgb5tWotkd
         oUydQn6SH2YkJi8+6yfwC6smd5mDiP5DFtdfTomCnDEtQM111ejx9cBq9VZHVt2YYxuf
         JX9GgQ4VF97qr/gUY690tOmtuaQd/wYdgIlkK6RvJx4B0OWgMXV2p178yQwxm2FePs/0
         /Pec0LA4bi9HzOxl3/1mcr4AffharrdhqNQN0G59544AHUTVDHwuCQehWJwwh/TzghE0
         49Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821288; x=1717426088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/akndZUowcan2n2TtFR3JQ/wHLAG3/zGHe8EITN8Q0=;
        b=P6aYxmzB3pniurxYmxPQjwK/e3CKduY7kjlkGeDY+q6zPArNFtGWaMXibnYFiDyZvk
         +2YSMoWQlazwHTYJC3xRYS2+lh4PX1c7B5uEa6lxIZRZWJgtXnG0Ln+3lKluLDm4J+8R
         OfPBPFdsZcV59GBJAAG0ecNx5sY1lGK+9pjYjUwzpOYWFBO8+kX3kHqJNH81+b/0G1wz
         MRGZZS0Notgd9Ec4MK6cmHM5oxV/+mtUaGMffM159hcliY6BLiPk1sZySfI8C3dMYJRp
         EbWPxVRS5aYU/YlH/aaFaAn7ZeBs0+a17C/RZUjnx60NJ0911Aj/1aAuHMtxy44dvEIU
         f6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVMtzJ2U0im8E/PPLey+XHdUI4G2JPvn1PH22MADb15pmcVTgeojzy/v1AYGb3RMtYyek3/QH9CI5zauTUBu4QYmpCCSRf0l/BSryzgbo8=
X-Gm-Message-State: AOJu0YwGr6w//6Pix/YqfSt6689vEfy4TlNhTnKr1vIbY8Ak+R1Cvqan
	J68I1a/UvftUAqnn8Q6PVC1V+H+1VFg5oWUz0Vw3rxuOnrJMQMsLyx37Fq4XOiI=
X-Google-Smtp-Source: AGHT+IGUGz+k/k1nUKygyac88+AdCLKn3pLf2n7A+4lnDgtaO/UkXgOwKt+pgC6cahMXyr427gbZKQ==
X-Received: by 2002:a17:906:69d0:b0:a59:c62c:344d with SMTP id a640c23a62f3a-a623e8d879emr976668066b.9.1716821287868;
        Mon, 27 May 2024 07:48:07 -0700 (PDT)
Message-ID: <480ccee9-a50a-4b30-92c4-3f39e4202bca@suse.com>
Date: Mon, 27 May 2024 16:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Henry Wang <xin.wang2@amd.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-3-xin.wang2@amd.com>
 <cf0a096a-0fe8-4d91-a064-910bd6c43951@xen.org>
 <d3aca96b-2b6b-4bb8-99bf-7c0ede4c94fe@suse.com>
 <alpine.DEB.2.22.394.2405241614370.2557291@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2405241614370.2557291@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25.05.24 01:19, Stefano Stabellini wrote:
> On Fri, 24 May 2024, Jürgen Groß wrote:
>> On 24.05.24 15:58, Julien Grall wrote:
>>> Hi Henry,
>>>
>>> + Juergen as the Xenstore maintainers. I'd like his opinion on the approach.
>>> The documentation of the new logic is in:
>>>
>>> https://lore.kernel.org/xen-devel/20240517032156.1490515-5-xin.wang2@amd.com/
>>>
>>> FWIW I am happy in principle with the logic (this is what we discussed on
>>> the call last week). Some comments below.
>>
>> I'm not against this logic, but I'm wondering why it needs to be so
>> complicated.
> 
> Actually the reason I like it is that in my view, this is the simplest
> approach. You allocate a domain, you also allocate the xenstore page
> together with it. Initially the xenstore connection has an
> "uninitialized" state, as it should be. That's it. At some point, when
> xenstored is ready, the state changes to CONNECTED.
> 
> 
>> Can't the domU itself allocate the Xenstore page from its RAM pages,
>> write the PFN into the Xenstore grant tab entry, and then make it
>> public via setting HVM_PARAM_STORE_PFN?
> 
> This is not simpler in my view

Okay, fine with me. I had the impression that violating the 1:1 mapping
of the domain would add complexity, but if you are fine with that I don't
mind your approach.


Juergen


