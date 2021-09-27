Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B452141A04A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 22:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197167.350133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxRH-0007mf-Io; Mon, 27 Sep 2021 20:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197167.350133; Mon, 27 Sep 2021 20:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUxRH-0007kG-FT; Mon, 27 Sep 2021 20:41:27 +0000
Received: by outflank-mailman (input) for mailman id 197167;
 Mon, 27 Sep 2021 20:41:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWny=OR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mUxRF-0007kA-SZ
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 20:41:25 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b5f3a60-c7b4-4c32-acdc-1f5c0540db32;
 Mon, 27 Sep 2021 20:41:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z24so83861013lfu.13
 for <xen-devel@lists.xenproject.org>; Mon, 27 Sep 2021 13:41:24 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id d7sm1704777lfn.27.2021.09.27.13.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 13:41:23 -0700 (PDT)
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
X-Inumbo-ID: 5b5f3a60-c7b4-4c32-acdc-1f5c0540db32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tgzBmsSO6dG09PN9iOtRQkEfhICE0+hS9rhKv7aTfrU=;
        b=IgmdJfYw2FOSQp+AVZ1yt3bCmhbVbFG9GYowhZiUuGJ8lUcemd9pHb/4mNs0kxZeQE
         XeUNT7osS+fzO8ec++WdtJWHR8fuP8d9XJRXfQV/6waIZ3ZC3qZD4tQNPquphlLJjIJ1
         pU5L+j83JdvgtlgwmZxyrXUR4HiNR2KmaLA/8qe2o2MGjTXKcoz/q0N8ARST5gvnhRiv
         QkJfwK1ZzXVTen2mydOYgxVCTzzn04FxkULJuNLhtt6Jjk16Rm+8ss+XjmZBDSnaJ2kg
         cblHWLkRDvsMRGy31zOlTdapKvw2xPkTcr35R69ZZvfFUUavgidHpptKQUxu4Yhe2NdW
         8Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tgzBmsSO6dG09PN9iOtRQkEfhICE0+hS9rhKv7aTfrU=;
        b=iWA2IJwJkofVgkKeV+OiUyBbHQvK3ydrSKVmZPcrLNEheH7lQt/p6DiDMpvceRGUfH
         F6iczCm76TDeFlNCqpNd6IVE6xI5KPhnFaPkn8Bp9iIu+00CG5s5M5Mnd/cdpFT81KVY
         kb7g0TNwLYimUI5Vqxrlv7hAjCO4mYMNxxRKsxfvblCJyEDKzEA8z1mXWQyj1rL/eUzn
         EHnygvHWpcifh2EHcmeW1FtPxf51Wrcb1S9It2dse4PVzljkYDSrwBZcLVCOnWREVvgh
         Sr+v8ubXIhGQ0EFvypdb4te0BaB86TYCuKSovQDtk/3Va7lgcxOzojvBQm+w6P2FO/5A
         VJgA==
X-Gm-Message-State: AOAM532Q2JecJQ/1j61xaMRJXr6QsZYQ2xi0axvCi+houirPT1Jdoes9
	+Jryusb81iDi9TOnWnyeOKA=
X-Google-Smtp-Source: ABdhPJypb143HeGyegdyodh/txXPmGMs8AzmZnKEQd3JmMOCehnZRzd4kPi1v49DcKwvpvYXySueSg==
X-Received: by 2002:a19:f517:: with SMTP id j23mr1658922lfb.371.1632775283887;
        Mon, 27 Sep 2021 13:41:23 -0700 (PDT)
Subject: Re: [PATCH 0/2] grant table and add-to-physmap adjustments on top of
 XSAs 379 and 384
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <be1dc77b-829e-e8cc-eb04-2a826d6bc03b@gmail.com>
Date: Mon, 27 Sep 2021 23:41:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 13.09.21 09:39, Jan Beulich wrote:

Hi Jan

> I'm prepared for the "how" aspect of the 1st patch here to end up
> controversial. Since the observed quirk will imo want dealing with,
> I'd appreciate any objection to the proposed change to be accompanied
> by an alternative suggestion. An intention of mine was to not further
> increase the number of arch hooks needed. I further realize that this
> change conflicts with Oleksandr's "xen/gnttab: Store frame GFN in
> struct page_info on Arm", at the very least contextually.
FYI, I have a rebased version of my patch on top of your patch #1 
locally. I preliminary checked that combination on my setup (Arm64) and 
didn't see any issues.


>
> 1: gnttab: remove guest_physmap_remove_page() call from gnttab_map_frame()
> 2: memory: XENMEM_add_to_physmap (almost) wrapping checks
>
> Jan
>
>
-- 
Regards,

Oleksandr Tyshchenko


