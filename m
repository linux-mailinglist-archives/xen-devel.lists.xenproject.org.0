Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC794667AC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 17:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236857.410797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msogv-0007nj-Sj; Thu, 02 Dec 2021 16:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236857.410797; Thu, 02 Dec 2021 16:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msogv-0007kz-PB; Thu, 02 Dec 2021 16:12:13 +0000
Received: by outflank-mailman (input) for mailman id 236857;
 Thu, 02 Dec 2021 16:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Yg1=QT=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1msogt-0007k4-Vo
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 16:12:12 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9af0fe3e-538a-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 17:12:11 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id x15so240299edv.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Dec 2021 08:12:11 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id gb18sm153885ejc.95.2021.12.02.08.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 08:12:10 -0800 (PST)
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
X-Inumbo-ID: 9af0fe3e-538a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3MyZGX7qoTD+ENznO6UCo37cfrjvGh13dEVD2WZQHDs=;
        b=E7CyYRNZNPApU9xsepRNYJuS6EWKRJniDpZBHXQZtkFPHPHUdSjbSn7SaOuJw5kvgQ
         I7vpQ06V/cJ6VjSw2p7jPklqGKybLyPbo3NVMsROuLszH1dxbufvamgU7TD2rIPAU74o
         vJK35LFQiQzKHEIEmBw9AaN18BrZsVUhh+tPkeelg8PQ78Z3bOjvBLiS7iRz+3niX6LZ
         GeL5MY8CjUoBpLrYZucOhHozY9/juNx/9VX05UCg1DxFFZQv/dZP3w2hh3BBo4j29OAw
         fFOxI+2poVPgVQBURwyR44gQJQAO2jVYnsJNwnKWzfCjvgpaQ64zML99vcrUmDl4+Jbp
         F3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3MyZGX7qoTD+ENznO6UCo37cfrjvGh13dEVD2WZQHDs=;
        b=zdpjYptnH5YMfbQ/2FdeTBnAiUJGIeKP1cbj9tZVKVhnF5/eNVb28auIfi50vPS4xX
         QkJEMMrDT45Upmdr1NRK8MtJm2xGKzzyq1qt/MkGhDWURgFE9xfB8mgVK2smVLNWJWfw
         jpvK46WJe0VuIOrFIXZjMmxVvv6pGoUu1yrAMgAQ5BtNmGo/t4Hl0aaoeZI81KRjs+/9
         sbAxy75PLCqQHrk3K7ZfhE36JOYzwCGBJZ8GZuOQqhLEizWYMv69HwsNvna1b01vordS
         g60OI1G5/nqvsve72I3q8Vf4NR62ZE9gHeYOGa/0jEkFS/B31kERGblqqM/u9KP6CRYJ
         xsSw==
X-Gm-Message-State: AOAM531h3SI90nK7riKW8hZ0CmzTCXmcxUCNfdTLBL3G9fqRCq1jaZxk
	QTboR8NqpdeL6Go6kdeup0c=
X-Google-Smtp-Source: ABdhPJzviC0vDr+1s5alzwkGx7hTKfRUWbJOBuQ6X5+WTtImCm37LXmt2372Q11vHdlghBfUWMxbUA==
X-Received: by 2002:a05:6402:d09:: with SMTP id eb9mr18491767edb.216.1638461530873;
        Thu, 02 Dec 2021 08:12:10 -0800 (PST)
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <b6eeab97-90ed-85f8-79ea-ac86e912dc43@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ac66cfd1-264f-9a29-4b58-4add78daa1e9@gmail.com>
Date: Thu, 2 Dec 2021 18:12:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6eeab97-90ed-85f8-79ea-ac86e912dc43@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 02.12.21 11:09, Julien Grall wrote:

Hi Julien, Jan

> Hi Jan,
>
> On 13/09/2021 07:41, Jan Beulich wrote:
>> Without holding appropriate locks, attempting to remove a prior mapping
>> of the underlying page is pointless, as the same (or another) mapping
>> could be re-established by a parallel request on another vCPU. Move the
>> code to Arm's gnttab_set_frame_gfn(). Of course this new placement
>> doesn't improve things in any way as far as the security of grant status
>> frame mappings goes (see XSA-379). Proper locking would be needed here
>> to allow status frames to be mapped securely.
>>
>> In turn this then requires replacing the other use in
>> gnttab_unpopulate_status_frames(), which yet in turn requires adjusting
>> x86's gnttab_set_frame_gfn(). Note that with proper locking inside
>> guest_physmap_remove_page() combined with checking the GFN's mapping
>> there against the passed in MFN, there then is no issue with the
>> involved multiple gnttab_set_frame_gfn()-s potentially returning varying
>> values (due to a racing XENMAPSPACE_grant_table request).
>>
>> This, as a side effect, does away with gnttab_map_frame() having a local
>> variable "gfn" which shadows a function parameter of the same name.
>>
>> Together with XSA-379 this points out that XSA-255's addition to
>> gnttab_map_frame() was really useless.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> As discussed in the thread, I expect the Arm part to be simplified 
> after Oleksandr's series.


I assume, current patch is going to be committed soon(?), so I am in the 
process of preparing a rebased version of my patch as both touch Arm's 
gnttab_set_frame_gfn at least (I did a rebase sometime, but I lost these 
changes somehow).

Anyway, according to the recent suggestion how to eliminate the possible 
lock inversion introduced by my patch and taking into the account 
changes in current patch, the Arm's gnttab_set_frame_gfn, I think, needs 
to be updated to the following form:



#define gnttab_set_frame_gfn(gt, st, idx, gfn, mfn)                      \
({ \
         gfn_t ogfn = gnttab_get_frame_gfn(gt, st, idx);                  \
         (!gfn_eq(ogfn, INVALID_GFN) && !gfn_eq(ogfn, gfn))               \
          ? guest_physmap_remove_page((gt)->domain, ogfn, mfn, 0)         \
          : 0;                                                            \
     })


> So for the Arm part:
>
> Acked-by: Julien Grall <jgrall@amazon.com>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


