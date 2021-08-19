Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DF33F2034
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 20:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169099.308886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn9c-0005GQ-Ho; Thu, 19 Aug 2021 18:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169099.308886; Thu, 19 Aug 2021 18:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGn9c-0005EF-Eh; Thu, 19 Aug 2021 18:52:40 +0000
Received: by outflank-mailman (input) for mailman id 169099;
 Thu, 19 Aug 2021 18:52:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hQ7n=NK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mGn9b-0005E9-0v
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 18:52:39 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e55e4df1-9f39-49bb-841c-b609eef813a7;
 Thu, 19 Aug 2021 18:52:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q10so10556196wro.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Aug 2021 11:52:38 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id p12sm2869167wmq.44.2021.08.19.11.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 11:52:37 -0700 (PDT)
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
X-Inumbo-ID: e55e4df1-9f39-49bb-841c-b609eef813a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lr+dEammPH1071muYMd9h71zEsYB8zMaCj5NdNt/Jgw=;
        b=FyqecJOV3o6BdAand/SLWNYs5XpzXkTRl9/tvkhVAEjic+iGuHL7YO22NiQvhaGUqt
         Cz4ZchkPo+9roWMQZFAnTZwgNpmj8nxc3jSMOgmV03xodPqGGHrHjB8smO7uIJxAqn3I
         EL7Tj48b6KsIJr/ip9cMTB6aqJSaU3QMEVKid1WMNHSHNUq82OIWNi49Zx7fnpFdcfzF
         7kTVOpEMOvi3QkYi+4Lfxhnnqt8BApWlu2j0U2j0hQKOpYtgyRDlWmI4ss2VDbhtsBSS
         lQTswtvRKk1eKHSsbJ/mYCV6fW15dvmkbeT4Pf8j1s65SnLlm1SKeeFyKydeI/Ahy9qb
         niow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Lr+dEammPH1071muYMd9h71zEsYB8zMaCj5NdNt/Jgw=;
        b=UT5iaH7QfbpG81gk601jtMN4x6IKeeUQ/BgO3Da6IC/VkXLII8O8lR55IL8VCe6Pr5
         L7gI1POA6IjtfG/LDI+1Ie2YxqNVIxdO3rOZX5AerFkdzXlypPXWkbCEGoHbq/EkeDmr
         m59azPWHluZL9sNlFoM5p0HuN+DobbmI7q4Q/KVoIoRVN4chPbe4hFG8PxjjZQycTeQQ
         oqgbbas9j89ShZalLjXnPLQULplXftrccAYRYotyTnwv8FK/xvZjiLSj6JueiKi4HyNm
         uDv4KKZdkzjMBRWiWF99rastAxMhU6ni5RMjYF5SuLzzz7MZalGXorrmj976L7/bNyvk
         STZg==
X-Gm-Message-State: AOAM532xJNQQNndVfe2P5ozAYt6u7D3csfjqJzhpIEl2CJoRNtMFNqLE
	R36QS4tUVIytSk2AH2rJrdc=
X-Google-Smtp-Source: ABdhPJx9Ifm0dAnUIJhmMCRE2KiBpcN4zDlVBpjmoq4aoYQyHYUkBgoa/gEU08AL2mjEU0R4gQnmcw==
X-Received: by 2002:adf:e107:: with SMTP id t7mr5550712wrz.165.1629399157501;
        Thu, 19 Aug 2021 11:52:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH] VT-d: fix caching mode IOTLB flushing
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <8b873e30-c1d1-3174-9e67-506887deedcc@suse.com>
Message-ID: <e4ff3535-e96e-0e65-1cc8-60cc75402186@xen.org>
Date: Thu, 19 Aug 2021 19:52:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8b873e30-c1d1-3174-9e67-506887deedcc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19/08/2021 09:05, Jan Beulich wrote:
> While for context cache entry flushing use of did 0 is indeed correct
> (after all upon reading the context entry the IOMMU wouldn't know any
> domain ID if the entry is not present, and hence a surrogate one needs
> to be used), for IOTLB entries the normal domain ID (from the [present]
> context entry) gets used. See sub-section "IOTLB" of section "Address
> Translation Caches" in the VT-d spec.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

