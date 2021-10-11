Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF071428D2C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 14:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205942.361376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZuXg-0007fr-VP; Mon, 11 Oct 2021 12:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205942.361376; Mon, 11 Oct 2021 12:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZuXg-0007e4-SN; Mon, 11 Oct 2021 12:36:32 +0000
Received: by outflank-mailman (input) for mailman id 205942;
 Mon, 11 Oct 2021 12:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=obo4=O7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mZuXf-0007dx-C3
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 12:36:31 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba118ec-415d-456f-beab-1e62c217275d;
 Mon, 11 Oct 2021 12:36:30 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r19so70945917lfe.10
 for <xen-devel@lists.xenproject.org>; Mon, 11 Oct 2021 05:36:30 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id w16sm721944lfq.272.2021.10.11.05.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 05:36:25 -0700 (PDT)
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
X-Inumbo-ID: 5ba118ec-415d-456f-beab-1e62c217275d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fUGu/UwFqbU9uXC3nxwSHkYP0fxyfms+M5VnCYuMyUE=;
        b=Ff1vfBxJbp5Tk53te1JsxAzlw4ImXswyXr50Om0/eYuYkAEvY6Q6d7/vs4fB6Ig+QB
         xwbbG3eHJizq6hxx2VM7TjcmPJszMlV470QahuCF0VUujIWr3i1kSLunuoBHf7TH/YeH
         0zWjDpBciTWfU6jO+X7E0PUgxjRFEPilAACZKDDU5WLh2dbPBV92a1R3APv+diOzAp/9
         kDk2diYIHDYwVvUcNkkvozlqvdFrWUKxpkb5RSA2j1RxXG3/VUiAAzZ2y9TljxhXy1U5
         9CmbRIlTjMptsaBthWbAjAw++Z+WlM9Bs4bPrEi5KNpVAAO7F3q4kMBqbL/Gzs01lwkS
         goUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fUGu/UwFqbU9uXC3nxwSHkYP0fxyfms+M5VnCYuMyUE=;
        b=VANsNv4EaGcGzvOcbMFWD4LHeFfFUw5MX67c8S6fSRKim+lvg7uNFYjxmplWifJ7fp
         Mknb6Az0JZzlRpi87EjdtgiCkwymf6A4pP1WNSIO0tMqpKERTncCZ6T6SwbzccWAOnbf
         tvn6IvhXv7/NVCfGpJfVxvlTYrsbIJ3pHR1FrL6g46g+Er3Yj+6bnULPVdvDlRYMN4gc
         sgZ4nK+mR0Kp81g4R1NMxSmaQVkA5g4xJOljgRccPioXDQDsvIHxlydIXm7AFL5JhYR+
         XTbC+VlqVY2gKEC9aBgRXKxgR5z4+s2JBrDDgVBMzYVQ42qiCLkXutEF8/yrLa1R6U3P
         /c3w==
X-Gm-Message-State: AOAM531y+W8y6y83Kof5LSoKQetnMH9xwkar2ejwEoU0CgNEmyxADbKU
	8IUzdwXc0ZI4Rj9iRlaEteRR5MPC970=
X-Google-Smtp-Source: ABdhPJzZhcvYaJQTLm5SNWSK8YuHQlY2tA+oij0bJhA8o6Ff4aiwa9e6uhXUU7at6+j6+2tlX6DMvw==
X-Received: by 2002:a05:6512:2143:: with SMTP id s3mr3408387lfr.451.1633955786183;
        Mon, 11 Oct 2021 05:36:26 -0700 (PDT)
Subject: Re: [PATCH V5 1/3] xen/arm: Introduce gpaddr_bits field to struct
 xen_arch_domainconfig
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
 <1633519346-3686-2-git-send-email-olekstysh@gmail.com>
 <68cb29bb-7d84-dc27-eead-4a079b9caf68@suse.com>
 <e77eea6f-163d-0920-2e90-fb9f3a602743@gmail.com>
 <ffb40f3b-2394-7747-2c06-955e2aa87cfc@suse.com>
 <387608b9-c7b2-e814-7fa5-a262acc0c73d@gmail.com>
 <ae852345-66ff-7bcf-f68e-2161e23933a1@suse.com>
 <alpine.DEB.2.21.2110071311450.414@sstabellini-ThinkPad-T480s>
 <b8e868a2-9af3-de6c-0683-4bb2ff7821f3@suse.com>
 <b36e5fb7-6ed0-dc7d-5ed3-c3c9c9ae70b5@gmail.com>
 <ff760c65-1041-aac6-40ed-981f0b900678@suse.com>
 <2fcb101c-28b0-67c5-0f4d-e3d75b9f4d33@gmail.com>
 <alpine.DEB.2.21.2110081458120.25528@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <21e649ef-a081-14c3-b68e-ffdec03e0f28@gmail.com>
Date: Mon, 11 Oct 2021 15:36:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110081458120.25528@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 09.10.21 01:14, Stefano Stabellini wrote:

Hi Stefano

> On Fri, 8 Oct 2021, Oleksandr wrote:
>> On 08.10.21 15:36, Jan Beulich wrote:
>>> On 08.10.2021 12:25, Oleksandr wrote:
>>>> Just a quick question. What do you think can XEN_DOMCTL_getdomaininfo be
>>>> reused to retrieve gpaddr_bits? I don't see why not at the moment, but
>>>> maybe there are some implications/concerns which are invisible to me.
>>>>
>>>> I see that arch_get_domain_info() is present, so the field will be
>>>> common, and each arch will write a value it considers
>>>> appropriate. This could be a good compromise to not add an extra domctl
>>>> and to not alter domain_create.
>>> Technically I think it could be reused. What I'm less certain of is
>>> whether the specific piece of information is a good fit there.
>> ok, thank you for your answer.
>>
>> I am also not 100% sure whether it is a *good* fit there, but I cannot say it
>> is not fit at all for being there. I might mistake, but it is almost the same
>> piece of information describing the whole domain as other existing fields in
>> that structure.
>  From a domctl point of view, it looks like XEN_DOMCTL_getdomaininfo
> could be a decent fit. Looking at the data structure, the arch specific
> member of struct xen_domctl_getdomaininfo is:
>
>    struct xen_arch_domainconfig arch_config;
>
> which is actually the very same struct used in struct
> xen_domctl_createdomain for XEN_DOMCTL_createdomain, but somehow it
> doesn't get populated by neither the x86 nor the ARM version of
> arch_get_domain_info?
>
>
> In any case, I think we could make use of XEN_DOMCTL_getdomaininfo for
> this. In that case, I would add a new common field to struct
> xen_domctl_getdomaininfo after cpupool and above arch_config.
>
> Then we can set the field from arch_get_domain_info.

Yes, this is what I had in mind, thank you.


-- 
Regards,

Oleksandr Tyshchenko


