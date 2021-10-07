Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640A425316
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 14:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203528.358663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSXv-0005Nz-Di; Thu, 07 Oct 2021 12:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203528.358663; Thu, 07 Oct 2021 12:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYSXv-0005Lw-AE; Thu, 07 Oct 2021 12:30:47 +0000
Received: by outflank-mailman (input) for mailman id 203528;
 Thu, 07 Oct 2021 12:30:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYSXt-0005Lq-QE
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 12:30:45 +0000
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffbc5a0e-8e36-4965-a989-56207da03f0d;
 Thu, 07 Oct 2021 12:30:44 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id l7so22729842edq.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 05:30:44 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 19sm10039976ejw.31.2021.10.07.05.30.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 05:30:42 -0700 (PDT)
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
X-Inumbo-ID: ffbc5a0e-8e36-4965-a989-56207da03f0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=tdvL5IqU9ZE5cw9OHmnOpjbbyF1jxDGO10SRGnkq+oM=;
        b=hfCDvc7K1JIK1v2gjykIcMdqLhTXLcmhgWeJwMzMpZVhP2J9bMsjy087tOTQHJ08W4
         YlMosetJofqBIF/IjYT7WgkP6jExCVaC3FifgFfiRiRsI6KM5RFL+G/eqof1YES5jdag
         uBxFfXWxfxs0tFd7m4miA2NREwobezi49BvMZ/RbRa4WNUHYbWvbnLDDvfv4TZsF9C5K
         qFeamXRnNnR2+qJzfYj9DJQu/SEgTep5dSSMTUg5n1QhcnV/CCl05RVYYVC8eEF9xtyg
         v1uwvQOBUIn5XFP+6wxK3TpQWcSqVdb869UH0/wnraFOgMcRBg5aY7D3/W2qjnDOTs0T
         cXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=tdvL5IqU9ZE5cw9OHmnOpjbbyF1jxDGO10SRGnkq+oM=;
        b=LmoMTy2ijf/uMFMGk6y6QvMeVrsiN73qax+l920ArsT11X3D5o+vlUH49VODwKizpO
         0UyHckRzaPxGMLyEqLla6j1WhFc7Ud3+MwFztPxizpnWIm140xXquYE5TnovbzRxFS3T
         +d+vDjfJvdBhFLxTje/R6+ySb3KCDdjMF4Qfp+4S4POxEBApZzvsHfCxZ44EbfPmKsiz
         GbplCJj2tJohyqechcc+FTwRxRrRuEK+jlgKzIZK9kWy9Ymz8tk9Ro0iBHGKYZBIRFtE
         yKaq4h3em0JhsCACe38qbfz5Xk8b4lHFUm2Sr7D15tdOApNG1RnQTtuHiuxO2oLMUfXT
         vI3Q==
X-Gm-Message-State: AOAM532o2ygl2pOWD4urh77V/WHL8hHZ7fdO0iKs7FlkQsGIVPzXVmwY
	YjdGj1Po7WQlWPLAgYBcgF4liPT6MWI=
X-Google-Smtp-Source: ABdhPJy/bHQgC4bVJYYzw48mAQnbsi4nTyQQ2SDBZffhHpm7WO+ncgd/+qE2RCYbxWTEk+HNjOFAew==
X-Received: by 2002:a05:6402:40d0:: with SMTP id z16mr6149438edb.220.1633609842909;
        Thu, 07 Oct 2021 05:30:42 -0700 (PDT)
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
Date: Thu, 7 Oct 2021 15:30:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.10.21 10:42, Jan Beulich wrote:

Hi Jan.

> On 06.10.2021 13:22, Oleksandr Tyshchenko wrote:
>> Changes V4 -> V5:
>>     - update patch subject and description
>>     - drop Michal's R-b
>>     - pass gpaddr_bits via createdomain domctl
>>       (struct xen_arch_domainconfig)
> I'm afraid I can't bring this in line with ...
>
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -333,6 +333,11 @@ struct xen_arch_domainconfig {
>>        *
>>        */
>>       uint32_t clock_frequency;
>> +    /*
>> +     * OUT
>> +     * Guest physical address space size
>> +     */
>> +    uint8_t gpaddr_bits;
> ... this being an OUT field. Is this really what Andrew had asked for?
> I would have expected the entire struct to be IN (and the comment at
> the top of the containing struct in public/domctl.h also suggests so,
> i.e. your new field renders that comment stale). gic_version being
> IN/OUT is already somewhat in conflict ...
I am sorry but I'm totally confused now, we want the Xen to provide 
gpaddr_bits to the toolstack, but not the other way around.
As I understand the main ask was to switch to domctl for which I wanted 
to get some clarification on how it would look like... Well, this patch 
switches to use
domctl, and I think exactly as it was suggested at [1] in case if a 
common one is a difficult to achieve. I have to admit, I felt it was 
indeed difficult to achieve.


I thought that a comment for struct xen_domctl_createdomain in 
public/domctl.h was rather related to the struct fields described in the 
public header than to the arch sub-struct internals described elsewhere. 
But if my assumption is incorrect, then yes the comment got stale and 
probably not by changes in current patch, but after adding 
clock_frequency field (OUT). If so we can add a comment on top of arch 
field clarifying that internal fields *might* be OUT.


> One of the problems with
> _any_ of the fields being OUT is that then it is unclear how the output
> is intended to be propagated to consumers other than the entity
> creating the domain.
If I *properly* understood your concern, we could hide that field in 
struct libxl__domain_build_state and not expose it to struct 
libxl_domain_build_info. Shall I?
[1] 
https://lore.kernel.org/xen-devel/093bc1d5-bf6a-da0a-78b5-7a8dd471a063@gmail.com/


-- 
Regards,

Oleksandr Tyshchenko


