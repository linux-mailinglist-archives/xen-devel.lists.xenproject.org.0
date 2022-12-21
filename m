Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76398653321
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 16:23:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467971.727036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p80vs-0003Ud-UO; Wed, 21 Dec 2022 15:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467971.727036; Wed, 21 Dec 2022 15:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p80vs-0003Ss-RG; Wed, 21 Dec 2022 15:23:00 +0000
Received: by outflank-mailman (input) for mailman id 467971;
 Wed, 21 Dec 2022 15:22:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eskD=4T=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p80vr-0003Sk-5r
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 15:22:59 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 595081a5-8143-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 16:22:58 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id z92so22502498ede.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Dec 2022 07:22:58 -0800 (PST)
Received: from [192.168.1.93] (adsl-43.109.242.137.tellas.gr. [109.242.137.43])
 by smtp.gmail.com with ESMTPSA id
 ch16-20020a0564021bd000b0046c5dda6b32sm7166080edb.31.2022.12.21.07.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 07:22:57 -0800 (PST)
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
X-Inumbo-ID: 595081a5-8143-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WEVYJIcIYodE8lPDzyPG/IV52X2I9UG6b0xBTbaerc=;
        b=MsREc2VLkxXd8FMFo1j8uR6sA/7Tb57BnZn/76EHqkplp5PHNqkwGtYoEqoSOYaft8
         Z37XiPtDnOQpR724ej4tYs0DnsSoEYRqF0bwtE/HRv7zRizLXp1o6JB1xKgJfMiGTGQ3
         oqBiiafuL/kk6lB31wgDXJrTz1YW6EpP0A+4BynMoqCXtqXIZns7qefP0j7oIw2hrP1h
         Fxc1AjOhRwoUOtlq0/XDWvocttHCFDi3bHwGP/CA6gOGXs2c9sc7AhbRsJt3MEGedLZa
         dZS+vS9mDV1+/pWe3/++EQjJKV4lWmliqJ0ZLX50dDipHUoBxv5cPYOLrqwqtUWl496g
         jj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WEVYJIcIYodE8lPDzyPG/IV52X2I9UG6b0xBTbaerc=;
        b=T9FfaL6NJh3wm9DmbOwYcAYYRDF8lSmretpXmZ21aa759F9sTxYf1//9/SeqXQDsH3
         /2Er0ZPDEbjjeMyYhzHHSc9Rjs6aLpPI1ONOCOvcpT8dX8MyuU4rHt277c3VgGFPoYsL
         2XPBYRFBJW/tvx6rzxLNjzDiMeVbzHIcADDNGJGkpkcWZQk27aHAza1nW2PQRYTUDFJI
         c7oS3rA21aftE2KcjrEm54per4wZneag/PbpxeDsV67n6YT0lDnYaSQ9b2zDZcwi252y
         KeOFM8Vtw1pAPoHbAUkfeesIfgPs+HsKfye6U+UtYc0exZA6yZlY2KmNpX3+cfRFK6k0
         nhSQ==
X-Gm-Message-State: AFqh2kqZHaJNLv+2ECaO0NoNqBjVjbc5tkk7q6nmN9vpc5mDihKzv7oB
	bPgtJZD4zYk4EJkIRzmygVo=
X-Google-Smtp-Source: AMrXdXvKGK3KFMzSi7IIBiKUMREEIz8izPbfZOsExhcEe90PMGwsC1I3HciEElH+3CjxPRCtsauyyQ==
X-Received: by 2002:a05:6402:e0a:b0:46c:b25a:6d7f with SMTP id h10-20020a0564020e0a00b0046cb25a6d7fmr6332705edh.8.1671636177614;
        Wed, 21 Dec 2022 07:22:57 -0800 (PST)
Message-ID: <13b1c5a5-35c3-a413-3458-ce39c7799a10@gmail.com>
Date: Wed, 21 Dec 2022 17:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC 5/7] x86/iommu: the code addressing CVE-2011-1898 is VT-d
 specific
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-6-burzalodowa@gmail.com>
 <5a78ab9f-ce3a-a4f5-9768-725bd9f8a745@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <5a78ab9f-ce3a-a4f5-9768-725bd9f8a745@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/20/22 13:09, Andrew Cooper wrote:
> On 19/12/2022 6:34 am, Xenia Ragiadakou wrote:
>> The variable untrusted_msi indicates whether the system is vulnerable to
>> CVE-2011-1898. This vulnerablity is VT-d specific.
>> Place the code that addresses the issue under CONFIG_INTEL_VTD.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Actually, this variable is pretty bogus.  I think I'd like to delete it
> entirely.

Nevertheless, I don't think that it would be appropriate to be done as 
part of this series.

> 
> There are systems with no IOMMU at all, and we certainly used to let PV
> Passthrough go ahead.  (Not sure we do any more.)
> 
> There are systems with DMA remapping only, but no interrupt remapping.
> These are known insecure.  I'm honestly not convinced that an ISR read
> and crash is useful when the user has already constructed an
> known-unsafe configuration, because a malicious guest in that case can
> still fully mess with dom0 by sending vectors other than 0x80 and 0x82.
> 
> In particular, this option does not get activated on AMD when the user
> elects to disable interrupt remapping, and I'm disinclined to wire it up
> in that case too.
> 
> ~Andrew
> 
> P.S. It occurs to me that FRED obsoletes the need for this anyway,
> seeing as it does properly distinguish the source of an event.

-- 
Xenia

