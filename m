Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFE4230E3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 21:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202464.357411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXqKX-00044L-IS; Tue, 05 Oct 2021 19:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202464.357411; Tue, 05 Oct 2021 19:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXqKX-00041E-EY; Tue, 05 Oct 2021 19:42:25 +0000
Received: by outflank-mailman (input) for mailman id 202464;
 Tue, 05 Oct 2021 19:42:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kL3v=OZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mXqKV-000418-77
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 19:42:23 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db1f637b-24eb-4c96-9dc8-c05457d92f21;
 Tue, 05 Oct 2021 19:42:22 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u18so408001lfd.12
 for <xen-devel@lists.xenproject.org>; Tue, 05 Oct 2021 12:42:20 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id s17sm1161173lfe.10.2021.10.05.12.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 12:42:19 -0700 (PDT)
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
X-Inumbo-ID: db1f637b-24eb-4c96-9dc8-c05457d92f21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=T3A0+TZLbkNYb83tjQH7ugFUuKxMDTQ3x0dHrMRAhB8=;
        b=bHQvUNvMTTe3JJPtP3VeowogZjpxLCqy3qjNtCxuzplKEuxFYJph5+rUdgqNxsnZk4
         TBTHBg3ZRC9rxuRhk4wCUVkkxnGEWrCRhaIoXQsCZ+yvpfTIx8du8IroXh/V/CNZWlPq
         LHdPNcpAM1YfNgD8b+2u/5fjx/F589uZuZ6+wZ6W76GiZL0X1a43/L1j+95JoT7rhYUC
         ev2MZADHNSN1QZh16ZgSyYveNsXxp1cbB1qcBHOzEE3p5Tw13QTC0gdtflr+yGqReBq1
         FrwSPeyx182vcdixDnjte16KUMtxOjDALTRqiO9vNYvFFvaW/NKDAm5Pn3+AMlWAAWH3
         qetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=T3A0+TZLbkNYb83tjQH7ugFUuKxMDTQ3x0dHrMRAhB8=;
        b=Rg11gcFO60/jpudz/ylcwqfGX6brN/5TEnJT7DhfSzJc/F0SK8BR+z/Dqi1bBAIGP2
         itqbPIKBoVT5eA7U2AzSGc74Mjn89cAPJOAWkr1+LtLsA4SOxY4ui6WDWZIGPVipYqYp
         vfS4l19m8q5tp1wrbW1MPJqmoKwU1MI5Lx8bDrKYjIGvW7+4+EhZgkJlSU2mf0QfDin4
         7on0gv/TK260kGFop2CIUVaN2Yd/qYm5NZdE08lKitvY3yyl6ZWDyznqTJW+DzlSWQvg
         oAzQ0NeQ5ruFFK3wnMnTmL9IeWXPbaljpZ4ngBRnnQf56YNhqaF+KpOtsIIB0VMrguQp
         FuJA==
X-Gm-Message-State: AOAM531FxwiyyC0uZZ6T8Alwslpcx2AEfGuu5coB4qb/ahVe5Ryvb0gk
	7+Is0/66rU1P0rXu/7olcZ8=
X-Google-Smtp-Source: ABdhPJz2tZgSNrAB5vVpNwPg1bqhxeyZFNbITpnKQZWejDPO36NO8H6S4VpUmuSVkXI7PzqnbQF4Jg==
X-Received: by 2002:a2e:864d:: with SMTP id i13mr24274977ljj.87.1633462939285;
        Tue, 05 Oct 2021 12:42:19 -0700 (PDT)
Subject: Re: [PATCH V4 3/3] libxl/arm: Add handling of extended regions for
 DomU
From: Oleksandr <olekstysh@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-4-git-send-email-olekstysh@gmail.com>
Message-ID: <c0184478-4af1-d9e8-a527-49ae7eebcc70@gmail.com>
Date: Tue, 5 Oct 2021 22:42:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1632955927-27911-4-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 30.09.21 01:52, Oleksandr Tyshchenko wrote:

Hi Stefano, Julien.

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.
>
> The extended regions are chosen at the domain creation time and
> advertised to it via "reg" property under hypervisor node in
> the guest device-tree. As region 0 is reserved for grant table
> space (always present), the indexes for extended regions are 1...N.
> If extended regions could not be allocated for some reason,
> Xen doesn't fail and behaves as usual, so only inserts region 0.
>
> Please note the following limitations:
> - The extended region feature is only supported for 64-bit domain
>    currently.
> - The ACPI case is not covered.
>
> ***
>
> The algorithm to choose extended regions for non-direct mapped
> DomU is simpler in comparison with the algorithm for direct mapped
> Dom0. As we have a lot of unused space above 4GB, provide single
> 2MB-aligned region from the second RAM bank taking into the account
> the maximum supported guest address space size and the amount of
> memory assigned to the guest. The maximum size of the region is 128GB.
> The minimum size is 64MB.
>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Acked-by: Ian Jackson <iwj@xenproject.org>
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> Tested-by: Michal Orzel <michal.orzel@arm.com>

I though a bit more on this and decided to make a patch more functional 
by trying to also allocate extended region below 4GB, I think we could 
do with it.
Actually if guest memory size is less than GUEST_RAM0_SIZE, we are able 
to provide unused space. I have tested with with various guest memory 
sizes and it worked fine. Also I decided to drop limit for maximum 
extended region size (128GB), we don't apply this limit in Dom0 and I 
don't see why we need it here, moreover the calculation became more 
obvious. I will drop all acks and send updated version. Are there any 
objections?



-- 
Regards,

Oleksandr Tyshchenko


