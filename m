Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AFE30882D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78024.141732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RoO-0004zj-Af; Fri, 29 Jan 2021 11:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78024.141732; Fri, 29 Jan 2021 11:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RoO-0004zK-73; Fri, 29 Jan 2021 11:19:36 +0000
Received: by outflank-mailman (input) for mailman id 78024;
 Fri, 29 Jan 2021 11:19:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5RoN-0004zF-IW
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:19:35 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 552b4e92-5b9f-471b-b68c-dd1e424cc900;
 Fri, 29 Jan 2021 11:19:34 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id l12so10026062ljc.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 03:19:34 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h7sm2033545lfc.200.2021.01.29.03.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 03:19:32 -0800 (PST)
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
X-Inumbo-ID: 552b4e92-5b9f-471b-b68c-dd1e424cc900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Oc/Xzu5nS5pYewYRsYublPeqmYXEM5udbcYWn1L1dkg=;
        b=N4jLX7rfU3zKsfH+uLo3Qnm3GMdBP7DZGhTSPB1Cou8+PWymPruZubAVMpBcF3I8gf
         ntMpoIeHr4Wah58HzwR5x1kR2PY6OMwQI+AR0IVBc9injgngQtQS3Qh7Nm9dtBSSGFqe
         G2TRjLeEeIOsIELnw33Hay6znmR88nQ30EpaXiXHo+E1BSzJglaUqmcxrhLz7AisUqdH
         8pgdbRRdYotxk+p2QHPr5ErsZfyOtO72plPAogXF0Xby3dB7Y6hmgPnkNuq0uIzxFXm5
         ohB3UgHUein/wKrhcrsXdLLeqxqnyH5kJ2tPTqPEhb/mU5naFyo6ituaEZmlKWGLSZw7
         rc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Oc/Xzu5nS5pYewYRsYublPeqmYXEM5udbcYWn1L1dkg=;
        b=Bo4FlVrIZPBwgG/2A2Lr2P8mm4QKwjBITeSe/FmNgAFLhF+vQaRCiBtfWDeRkj0RtB
         J3HL0+MNPZMC+M+twhhpm/GFj0S5n8BjwYjs2x38e1GcfsSU0ESh6Qc4RymeB3ctrnj4
         UaUZrVVOkobs8dmx6/CYcgxqa6Ujo0dP6XCMLg6IB9DgxarT6bQkkTqFBEfoRCQ0ErRO
         MSOQGUwkgs8LgzT5ElFkQcr8vuEHwGnWF5burQA7KT/v5auy8tT1txeSfePESo8QR5Dd
         wZGsW46NnN1BP5T8AvfDf6Su/+/1UmuEqoJgfzKvezcBEx4PQ3O1HXdQdSqBxitQUSt8
         0foQ==
X-Gm-Message-State: AOAM531kf8VlqytqSgcXo64jUvug/DRMNZT1YaBEES5Lmp3DPwr5LtI+
	3OZLv8a0ry0gXiKaV4nfveU6EdQ9s/5GJw==
X-Google-Smtp-Source: ABdhPJyy3M6hAEHjdtHNis4ZCLMzapxzuN2hAOzvxWVuN7AawraLloaXrEfn6zCm99ltGmt9ynO7YA==
X-Received: by 2002:a2e:300d:: with SMTP id w13mr2133609ljw.383.1611919173061;
        Fri, 29 Jan 2021 03:19:33 -0800 (PST)
Subject: Re: [PATCH V6 24/24] xen/ioreq: Make the IOREQ feature selectable on
 Arm
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-25-git-send-email-olekstysh@gmail.com>
 <2d98fd45-a88a-a198-a42d-393a713e1d54@xen.org>
 <433f8d5c-f66f-874e-e08e-83427f9f2a29@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3fb55faa-8d05-cb8f-f567-4e099347b3e6@gmail.com>
Date: Fri, 29 Jan 2021 13:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <433f8d5c-f66f-874e-e08e-83427f9f2a29@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 29.01.21 12:06, Jan Beulich wrote:

Hi Jan, Julien

> On 29.01.2021 10:55, Julien Grall wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -137,7 +137,13 @@ config HYPFS_CONFIG
>>>    	  want to hide the .config contents from dom0.
>>>    
>>>    config IOREQ_SERVER
>>> -	bool
>>> +	bool "IOREQ support (EXPERT)" if EXPERT && !X86
>>> +	default X86
>>> +	depends on HVM
>> AFAICT, CONFIG_HVM will already select CONFIG_IOREQ_SERVER. So are the
>> two lines necessary?
> I agree they may not be necessary, but as long as they don't
> cause any harm I thought maybe they serve a documentation
> purpose.
1. Agree that it should be "If unsure, say N."
2. Agree that two lines are not strictly needed (just rechecked).
3. Agree that two lines indicates the *real* state:
- Although we managed to remove almost all (all?) HVM-ism in IOREQ 
common code, this feature depends on HVM anyway
- And it is should enabled by default on X86, and disabled on Arm

So what we should do with them (keep or remove)?



>
> Jan

-- 
Regards,

Oleksandr Tyshchenko


