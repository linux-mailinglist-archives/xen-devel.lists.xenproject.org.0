Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6968D41E8FC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 10:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200482.355005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDle-00058I-J4; Fri, 01 Oct 2021 08:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200482.355005; Fri, 01 Oct 2021 08:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWDle-00055H-Fl; Fri, 01 Oct 2021 08:19:42 +0000
Received: by outflank-mailman (input) for mailman id 200482;
 Fri, 01 Oct 2021 08:19:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcpL=OV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mWDlc-00055B-TT
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 08:19:41 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fc64892-f7f6-47b1-8e13-1ef00c4c38f0;
 Fri, 01 Oct 2021 08:19:39 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id i25so35706152lfg.6
 for <xen-devel@lists.xenproject.org>; Fri, 01 Oct 2021 01:19:39 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 8sm600788ljr.10.2021.10.01.01.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 01:19:38 -0700 (PDT)
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
X-Inumbo-ID: 5fc64892-f7f6-47b1-8e13-1ef00c4c38f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R1+zef/LR7kVhhXEmdP6iIBCi010Oykuu31XKn+GGII=;
        b=mhyA9da7dX2Q8z+ZRcoubqjmlBCyJA/yUeUgYbWFkUsMiC/6+9g7x0P5QdylX50DOs
         UeE2teyenWQ0tENUBtvDyuw5l/clCxl6Aol2P8YaRaO1n5/t/5n0X9EWnPcqP1kz39D8
         //MifxjA/GLqRYLjMrjVk8bjIgnrLkHvOwVQD5U9V3xzz1rh9CgZufDXpV+ZTuftpMgX
         FKyosz9A0C7dzuumsGHTFLna6xtgiiLxmXFyV+bZddky5rSHucH42GTW62CgBtAY6jQu
         nWnJX5VJXd3A/8dEEyNWX+5ibp1KLsvtquaWaHjZFxwRP36CrknMdwgND4DVZdTl/30K
         cISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R1+zef/LR7kVhhXEmdP6iIBCi010Oykuu31XKn+GGII=;
        b=Ul+gLvVKEvpmH0vyaEiC98xrgBzSGJvxrx7qTsnAoJSKASrsiUK1v0prCp8KZR6eW5
         35DHCG02BNuqTiRt3fW5ElhX2DCtMMy8TZc0VzS7YfOIWZebwIG1TW/qgqtVmTWK3f0H
         NI0+gHMNDANwODsounIGM2vqBRITE5fx66b5SNtEf+JsGClLvmdWshfHaAMEfgMvhKV6
         AAzahOhMqqjfr8cPqwJFuLQ4hKP7CsO25oQfaU6VvnD0RRp6jFjnIjbsTRqDbyjAtytt
         GptJoicw5T3DnGFhKtrvT4z1zUTL/QAALUkiJHbI7Cyb25tOLeTSUSApJ8YMiTq0pvlE
         KcoQ==
X-Gm-Message-State: AOAM530mrABPHI4EbQmv/xgdgbcy8Jjrx7YhT2JTySkrlz9Um1f9Riu6
	0iBdHNWrQqX/hUTVK3qT/20=
X-Google-Smtp-Source: ABdhPJzzU4Uf4RUlVFBstKgqJ++y6nd9xgptmKSYgIwMoVvwqRY5pQ6QJAms3KFTCOapMOZmr7HguQ==
X-Received: by 2002:ac2:48b7:: with SMTP id u23mr4083116lfg.51.1633076378871;
        Fri, 01 Oct 2021 01:19:38 -0700 (PDT)
Subject: Re: [PATCH V4 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-2-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109301600060.3209@sstabellini-ThinkPad-T480s>
 <05b040b0-a069-47a1-1f5e-85be62fa35f3@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bbbceae1-c382-5e48-0c6b-fbb23fc720f5@gmail.com>
Date: Fri, 1 Oct 2021 11:19:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <05b040b0-a069-47a1-1f5e-85be62fa35f3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 01.10.21 10:50, Jan Beulich wrote:

Hi Jan

> On 01.10.2021 01:00, Stefano Stabellini wrote:
>> On Thu, 30 Sep 2021, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> We need to pass info about maximum supported guest address
>>> space size to the toolstack on Arm in order to properly
>>> calculate the base and size of the extended region (safe range)
>>> for the guest. The extended region is unused address space which
>>> could be safely used by domain for foreign/grant mappings on Arm.
>>> The extended region itself will be handled by the subsequents
>>> patch.
>>>
>>> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
>>> hap_paddr_bits.
>>>
>>> As we change the size of structure bump the interface version.
>>>
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> I have to admit that I'm a little puzzled to see these R-b-s when ...
>
>>> Please note, that review comments for the RFC version [1] haven't been addressed yet.
>>> It is not forgotten, some clarification is needed. It will be addressed for the next version.
>>>
>>> [1] https://lore.kernel.org/xen-devel/973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com/
> ... Oleksandr makes clear this patch isn't really ready yet.

Unfortunately, this is true. I am still waiting for the clarification [1]



> The tags
> could misguide a committer into putting in this series despite the
> open issue(s).
>
> Jan


[1] 
https://lore.kernel.org/xen-devel/6a2a183d-c9d8-df2a-41aa-b25283fab197@gmail.com/

-- 
Regards,

Oleksandr Tyshchenko


