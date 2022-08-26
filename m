Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25DE5A227A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 09:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393689.632784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRUF0-0002rL-9h; Fri, 26 Aug 2022 07:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393689.632784; Fri, 26 Aug 2022 07:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRUF0-0002oV-5X; Fri, 26 Aug 2022 07:58:58 +0000
Received: by outflank-mailman (input) for mailman id 393689;
 Fri, 26 Aug 2022 07:58:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHiH=Y6=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oRUEz-0002o7-1f
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 07:58:57 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef10ddd9-2514-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 09:58:56 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id h22so1668843ejk.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Aug 2022 00:58:56 -0700 (PDT)
Received: from [192.168.1.10] (adsl-47.176.58.181.tellas.gr. [176.58.181.47])
 by smtp.gmail.com with ESMTPSA id
 14-20020a170906300e00b0073ae9ba9ba8sm593063ejz.3.2022.08.26.00.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 00:58:55 -0700 (PDT)
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
X-Inumbo-ID: ef10ddd9-2514-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=uwON+J0KicNZiomyFSukDkJggnZdAe5BWTs1bDIfC/U=;
        b=KGU/haig9RbUtm8XViHjLfivSH2b23EFUm+NXGrpBhXzoadGq/KRpKjbzXW6mCYgqq
         Tav5xEg5do/ZuCjiYEc8gj1fJdy02Z7Kf80gp+2sY8YPzNPFH5gCSx2pjmY629BkSTdN
         PQeBqOwhasgp/GpI8wtv6cMmE6Q8hxf2YMszm8i1zIcKwEfrsaxUV7LqFrx2xIV7kQAV
         XgeWLmD3ccMHEUuTzPz/kWNX3X4sGQoJXL+axNcLxpPtuVTj/WroRZbaq1vqJgKsA+0w
         TosH3xUDWtaPtCcpdpS7boeE5DWYjnb/+d/hoIVyCnCE43UF6KXTLLSiTKyddPkAJmMD
         nQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=uwON+J0KicNZiomyFSukDkJggnZdAe5BWTs1bDIfC/U=;
        b=O3Tw+I4BeM7a7Dv9gVmNzjJ1wRzp7NGBMP6wU9Rb1kq6FB1tK7Xr2kj7i3BDACCnSk
         divm8GAPG2tlDxkhdmLRfOyWlRTTxSIYWPnfIIikOUzq7ZFsW8Vl1j8/sYrx6uUo+Gbo
         Blr/ECb4gSQbH3BOfrymNdPFV5XNaMQf0/cut2MZ4DXPznTxtAADHFoEfYWYUPwM5Nf4
         I1YOciyvWK4B1xZ6QtqGxozn9zsqT98zrNR1UhlJJSPMldn+YUYSiEh3RPfEcih0oytr
         QbgxUatSdeQucADnqU4eEpGr6jKRsRzUD5PY2XqfNaTShCP1+2k/TOMF+4fSBZ5MpHIX
         u2Gw==
X-Gm-Message-State: ACgBeo3APZB6HpIB6A+Z6owYPzjgd90MTspynIuq7jeR0InUVE/qZ3rO
	NqDs3K9pE9k0C9wliEFfMNA=
X-Google-Smtp-Source: AA6agR5FvrnGcTJbVd6lnt+qz65DRUCHDq8BTfMahrDuHi7iaq/Uwz9HxPLBVhQnD2JuUOfBL9cy2Q==
X-Received: by 2002:a17:906:fe0b:b0:730:3646:d177 with SMTP id wy11-20020a170906fe0b00b007303646d177mr4550304ejb.688.1661500735573;
        Fri, 26 Aug 2022 00:58:55 -0700 (PDT)
Message-ID: <7348b3d9-4ab3-743f-252d-0441cd25dfa7@gmail.com>
Date: Fri, 26 Aug 2022 10:58:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 7/7] xen/device_tree: Fix MISRA C 2012 Rule 20.7
 violations
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 andrew.cooper3@citrix.com, bertrand.marquis@arm.com, roger.pau@citrix.com,
 roberto.bagnara@bugseng.com
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <20220819194359.1196539-8-burzalodowa@gmail.com>
 <9b053c3f-0274-a63b-2a6b-a1715c639092@suse.com>
 <25e4c770-9b97-a96d-5f5a-fea815bf9737@gmail.com>
 <7d32d3d3-daa6-5492-02fb-db6ca5f154c9@suse.com>
 <852c68d0-bda1-e56e-85c0-500c498054a0@gmail.com>
 <2ff949e4-5f02-f476-7b14-252252d1b8b5@suse.com>
 <alpine.DEB.2.22.394.2208251045380.733916@ubuntu-linux-20-04-desktop>
 <11fc391d-f53b-1bc0-19ec-168ec827a1c0@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <11fc391d-f53b-1bc0-19ec-168ec827a1c0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/26/22 09:21, Jan Beulich wrote:
> On 25.08.2022 20:09, Stefano Stabellini wrote:
>> But first, let's confirm whether this change:
>>
>>
>>   #define dt_for_each_property_node(dn, pp)                   \
>> -    for ( pp = dn->properties; pp != NULL; pp = pp->next )
>> +    for ( pp = (dn)->properties; pp != NULL; pp = (pp)->next )
>>
>>
>> is sufficient to make the violation go away in Eclair or cppcheck.  I am
>> assuming it is not sufficient, but let's confirm.
> 
> Well, even if for the lhs of assignments there was an exception, this
> still wouldn't be sufficient. The minimum needed is
> 
> #define dt_for_each_property_node(dn, pp)                   \
>      for ( pp = (dn)->properties; (pp) != NULL; pp = (pp)->next )
> 

If pp is assumed to be a valid lvalue, then why it is needed to add 
parentheses here (pp) != NULL ?

For the violations to go away, parentheses should be placed around all 
macro parameters that represent expressions, that is
#define dt_for_each_property_node(dn, pp)                   \
       for ( (pp) = (dn)->properties; (pp) != NULL; (pp) = (pp)->next )

-- 
Xenia

