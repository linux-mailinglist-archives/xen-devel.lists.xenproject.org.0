Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C84FB56989
	for <lists+xen-devel@lfdr.de>; Sun, 14 Sep 2025 16:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123907.1466592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxnKr-0007iQ-7J; Sun, 14 Sep 2025 14:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123907.1466592; Sun, 14 Sep 2025 14:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxnKr-0007gF-4e; Sun, 14 Sep 2025 14:04:09 +0000
Received: by outflank-mailman (input) for mailman id 1123907;
 Sun, 14 Sep 2025 14:04:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uxnKp-0007g9-Sa
 for xen-devel@lists.xenproject.org; Sun, 14 Sep 2025 14:04:07 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id accfb45d-9173-11f0-9809-7dc792cee155;
 Sun, 14 Sep 2025 16:04:05 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so2186448f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 14 Sep 2025 07:04:05 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54b169f2edsm6274277a12.19.2025.09.14.07.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Sep 2025 07:04:04 -0700 (PDT)
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
X-Inumbo-ID: accfb45d-9173-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757858645; x=1758463445; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsmjXoPv7LF/hLNfx6ZHyF/RI9YKI26DbYA/q8yIU8c=;
        b=Vz5LzdamoG4C7fRQCf9pzii+j9NThH1g+ipmV5j5d2NJSI+7QjY1Ud7v+fKBMLb1wj
         cs7uHeyP7sLkcH/iSH6oNKwKinUbuML+upXm+/zOypZJlYpD7Kjfp6Zlfcy9JlYOoErE
         R61oF7FeBmLGc25TrHki7Dtn6XZcHbxQwLFEWxYVHAFh0tzi1NS9VxgmO9C2nR+KEbCv
         v+cNJipZB029mwnxWxNLkN56A/FsJuBS2qxuJhytaGxwrm9TPeqC14in0DkXwsNMFMg7
         iVV2FjojCsJ8TAtra7hVHSFzrgHTDVQUL+/7uS+tVtYri0P73nzxoccmjP7EoV/JGPd6
         Jx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757858645; x=1758463445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dsmjXoPv7LF/hLNfx6ZHyF/RI9YKI26DbYA/q8yIU8c=;
        b=HbIkiLJUXFBlvYa2S6UVsWZL+8RMvDN+hEpReH3w9Ek8BgbKJrW51d+eEVvuQTNf8L
         GRzx8FBFc3C+e+m6cyDzmikOfzc4S4MkIJXvRuGFq+NEZzlisdhfYHPfJzLiNtKUJx34
         LMZXqN4DKI2LrZZvrUVk8j1axXXHOyn0lSHg1VaFJY5w664Y8M9Moxrp9pQbYQ50yjA6
         /4nKfbRUXbFWluezopDIGKDHziFdeVIvKrTxkN/L+YOkdGaZt31Wpr4H2QZyOVATlpNp
         keN1xA0YU0EWLQY/fyLaHhMML1PZnCy+o2QB7VunMQzSgUkWcf10cqDkY5Bn3pPDOnqG
         +7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPwybBCtk96HWnKBKX3kxG13pd3igJYw2KICw0wgEtgTG3ZH415hsdsE2i4o8+j/vCGEZmns7xuks=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+ULE34jb+RkBFRHqm0dMjjcGImiICImb8OojqNngGxxESes5I
	nt7CZ4oShMQZL+hvkOV3dv2sVbA5c64geraQi9cEHeLYJEXHr6U9JdS57V0n+N3u0w==
X-Gm-Gg: ASbGncve+z/TqKy7UVqoIxmcQatxUA2l9KYoAaBa6HxPe2u6myeYa0OovSQGqPO4o/t
	POkj4EHvIpYYBW5aK7M8iGmPsG97kyJMy+OdcxDvmu0E2PzvF2dgdx8VV3FROvjVcdjFLGA0Akk
	MMA7CNmXSVUY+EChVnMa6vSO12/j2f9oo235QfX36Sp9uzX29axVqYDOpckk0bastpLuLtOpsvQ
	t+cY9ceXfZxWTmss8aM9yJl6Ca06SNrzwR797imwc3/6CpodUMnuQf1f+ZHLT+j3CFPr1on6Uem
	VD0WtNtI524m9z2s1a3wGb+TT0S4p8Go4rdl/m3ZVCL0TH9VwkZAMya2cS+JvWA9PCE/djxpn8l
	nXYlPeObvTpyQcNvnUP6EyNrM2gpAv8w=
X-Google-Smtp-Source: AGHT+IG3EALCbIVw6udqHMHC4INP5RXjlKqtBvT93BHbdY4YVjI46JF3j0Dtesc4nV+Vm5ZQRgHxjQ==
X-Received: by 2002:a05:6000:2384:b0:3e7:484a:7428 with SMTP id ffacd0b85a97d-3e765a3dee2mr7947494f8f.60.1757858645101;
        Sun, 14 Sep 2025 07:04:05 -0700 (PDT)
Message-ID: <bbafea99-7f78-48e6-aa26-2e498e526f29@suse.com>
Date: Sun, 14 Sep 2025 16:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
To: Tamas K Lengyel <tamas@tklengyel.com>, Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-5-Penny.Zheng@amd.com>
 <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
 <CABfawhnzoDwo7vbFNN8wAnmEELoQND6snSE8m_VZnS0LWErMGQ@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhnzoDwo7vbFNN8wAnmEELoQND6snSE8m_VZnS0LWErMGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.09.2025 01:31, Tamas K Lengyel wrote:
>>> @@ -99,10 +98,40 @@ long p2m_set_mem_access_multi(struct domain *d,
>>>  int p2m_get_mem_access(struct domain *d, gfn_t gfn, xenmem_access_t *access,
>>>                         unsigned int altp2m_idx);
>>>
>>> -#ifdef CONFIG_VM_EVENT
>>>  int mem_access_memop(unsigned long cmd,
>>>                       XEN_GUEST_HANDLE_PARAM(xen_mem_access_op_t) arg);
>>>  #else
>>> +static inline bool xenmem_access_to_p2m_access(const struct p2m_domain *p2m,
>>> +                                               xenmem_access_t xaccess,
>>> +                                               p2m_access_t *paccess)
>>> +{
>>> +    return false;
>>> +}
>>
>> So this is needed when VM_EVENT=n and ALTP2M=y. Tamas, is this a configuration
>> which makes sense?
> 
> Yes, altp2m should be functional without vm_event being enabled. There
> could very well be in-guest only use of altp2m via #VE. This function
> is used in p2m_init_next_altp2m which means it being stubbed out like
> this when vm_event is disabled breaks altp2m.

Oh, indeed - the stub still needs to handle XENMEM_access_default. Of course
with MEM_ACCESS=n it's not quite clear to me what p2m->default_access ought
to be; imo in principle that field ought to also go away in that case
(becoming hard-coded p2m_access_rwx). While doing that will be a larger
patch, perhaps using the hard-coded value here should be done right away.

Once the code correctly handles MEM_ACCESS=n as an implication from
VM_EVENT=n, it's also questionable whether MEM_ACCESS_ALWAYS_ON should be
retained.

Jan

