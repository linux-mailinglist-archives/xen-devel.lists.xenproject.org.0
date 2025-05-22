Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124DAC04E0
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 08:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992967.1376422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzqD-00083v-GL; Thu, 22 May 2025 06:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992967.1376422; Thu, 22 May 2025 06:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHzqD-00081Z-Dc; Thu, 22 May 2025 06:55:45 +0000
Received: by outflank-mailman (input) for mailman id 992967;
 Thu, 22 May 2025 06:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ix6t=YG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHzqB-00081T-H4
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 06:55:43 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6d7c324-36d9-11f0-a2fb-13f23c93f187;
 Thu, 22 May 2025 08:55:42 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad574992fcaso757010766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 23:55:42 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4d27e8sm1035336566b.174.2025.05.21.23.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 23:55:41 -0700 (PDT)
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
X-Inumbo-ID: c6d7c324-36d9-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747896941; x=1748501741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osglV1z/xntQZBv5YjuhrlhT7HeQkSny8853lD77kYU=;
        b=C/2PILbq5TU4pyU/7LCx7Cg4lgIgbAKSWPJkFz8Q5BWAEExFG6kas+aN2shUtP9weI
         hlnrD64mI1jpGC/SWEmDbcOJjk9vxbfU+erkH09yZaxjU1HymZnmUtqZFiesWPvb+j8e
         0iMuS3JAbaCXc+GUH9KzwLnqe7Wf+QvFQG9P985eaeZ/k3Y/NIK4+QEVsYE5Vd1lRZAO
         66HPG/XE3fGW/spaV/rJfT8VlfaRE2A9tLhq80tgyaOI/vpIwRYFLdBgXUGRcVBZMOFx
         lbvpP6GOcdv6XohiY5Q+7o9uIv0tz0J36if7xk3TKHGVWiZetrrxae/561/NshpokcdM
         EmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747896941; x=1748501741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osglV1z/xntQZBv5YjuhrlhT7HeQkSny8853lD77kYU=;
        b=pSKoMVHXvWRBMxWebxzuMS/pJbZLkQhuf2B6PG1zGEHD9QkHC7fO2MVvlixefBH5eD
         K3FMvzRWWv5NtmGeWS+dCsLCvx+fW8pJ3U/annP6ovFB46QlsvEaND8NMiYJjqeTfcVo
         FsFJqhM+DsNwlYijYiC3KB3GBThy2/KKveft2sHcuS8FG/LYd6UrlypDMg0eNx0JfpJp
         ulumHSlbPSZHJtFrJ+Ft9YEDZ5MGAGRkh1Ph+kiLiKKSOOMldD5D1Cb48PG5nZ7egwyh
         svnlIIhWtGJAmvFZQ8/iDh5jA4bYfNOTUpsTmBs1OMYU/U3C+Rwv95rqR6m5Uw4z1M/D
         hXxg==
X-Forwarded-Encrypted: i=1; AJvYcCUvLSSMTVXGDcSz1pb8V4kpoDqzvzY0CXqBjN6JqfBH38CCWbqRwu/BwzrmmMtYPpqtYUIy8lcl934=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygbJntrMTQI4nAM1XMrRelZsqNEiG34j73ae41qyzpqE7sPaP1
	4A0fWHtEzz4yBYiUewpvKwh3iMyCYAegzyqn6hP9svMkqaxZHMGZcV3TtCRq6gFuRw==
X-Gm-Gg: ASbGncsO2zCqDQwGa/0JktMEhg0T9qhai58bI8flOCL0kTspjL/wqySsCWVL1pShnB+
	kettO14o/mDI8bAtJxeCn/vUrlPb0E7fFDVSMsqRHDpgk2qO0OTJFopArc+esroyAlLsT+lNQ7T
	XTXzorJxtwhR5y/900UmGoOcnUIRS6aqZlfTiVOerKaWoWwMJorI5I1iHpZzPN2vxcP70MEQfEa
	VPh47W0Xcm4EHQL0l/uqY9o85kAfnTLFkMQTOISRcZL8Y3kP+55+SyBGG8lAGTthY+h20yhegdV
	wCEtFKcQVNXMjj/PNpvIS0zZM69fFsCNVcmhWt5s6o6MpLx5aj5iNQVVjUTj/g==
X-Google-Smtp-Source: AGHT+IGVkUbAlS9lEJ+XZw8jgU+7FnmxHaBQhf1u5qgBeqH/zjmkazBWlG+RIMpBoeh51rPz2hKKmA==
X-Received: by 2002:a17:907:60cd:b0:ad5:a203:b6ba with SMTP id a640c23a62f3a-ad5a203b86dmr678213166b.43.1747896941534;
        Wed, 21 May 2025 23:55:41 -0700 (PDT)
Message-ID: <8ac2d7fc-214b-40dd-a5d2-6e1dc8c0e4ad@suse.com>
Date: Thu, 22 May 2025 08:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/12] x86/hyperlaunch: initial support for hyperlaunch
 device tree
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Denis Mukhin <dmukhin@ford.com>,
 xen-devel@lists.xenproject.org
References: <20250429123629.20839-1-agarciav@amd.com>
 <20250429123629.20839-4-agarciav@amd.com>
 <6f821e28-b182-4d27-b2db-e3be80910c12@suse.com>
 <DA20I56ZKPJ4.36GD5TP5BRZM6@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DA20I56ZKPJ4.36GD5TP5BRZM6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 19:24, Alejandro Vallejo wrote:
> On Wed May 21, 2025 at 5:00 PM CEST, Jan Beulich wrote:
>> On 29.04.2025 14:36, Alejandro Vallejo wrote:
>>> --- a/xen/common/domain-builder/fdt.c
>>> +++ b/xen/common/domain-builder/fdt.c
>>> @@ -13,6 +13,36 @@
>>>  
>>>  #include "fdt.h"
>>>  
>>> +static int __init find_hyperlaunch_node(const void *fdt)
>>> +{
>>> +    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
>>> +
>>> +    if ( hv_node >= 0 )
>>> +    {
>>> +        /* Anything other than zero indicates no match */
>>> +        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
>>> +            return -ENODATA;
>>> +
>>> +        return hv_node;
>>> +    }
>>> +    else
>>
>> Please can such unnecessary (and potentially misleading) "else" be omitted?
> 
> Not sure how it could be misleading,

For context, just briefly looking at such a construct may leave one with
the (wrong) impression that both branches of the conditional can fall through
to subsequent code. This may be less of an issue as long as both sides are
reasonably short, but then it is imo better to avoid the pattern altogether.

Jan

> but...
> 
>> As ...
>>
>>> +    {
>>> +        /* Look for dom0less config */
>>> +        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
>>
>> ... these will need to move to function scope then, one of the two may want
>> folding with "hv_node" above.
> 
> ... there is indeed a more compact form the function could take. Noted.
> 
> Cheers,
> Alejandro


