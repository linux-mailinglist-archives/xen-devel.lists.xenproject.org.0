Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347622B1D72
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26536.54965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda4T-00010A-6d; Fri, 13 Nov 2020 14:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26536.54965; Fri, 13 Nov 2020 14:29:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kda4T-0000zl-35; Fri, 13 Nov 2020 14:29:01 +0000
Received: by outflank-mailman (input) for mailman id 26536;
 Fri, 13 Nov 2020 14:29:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kda4S-0000zY-B1
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:29:00 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfef669a-5725-4ab2-bca0-be643314ca98;
 Fri, 13 Nov 2020 14:28:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 74so14086353lfo.5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 06:28:54 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u9sm1574268lfo.181.2020.11.13.06.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 06:28:52 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HVgh=ET=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kda4S-0000zY-B1
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:29:00 +0000
X-Inumbo-ID: dfef669a-5725-4ab2-bca0-be643314ca98
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dfef669a-5725-4ab2-bca0-be643314ca98;
	Fri, 13 Nov 2020 14:28:54 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 74so14086353lfo.5
        for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2020 06:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=B8uzbkP85RAfT7LVEI0HOKe9zMgG+kbxKO7hUX2Hku8=;
        b=YofW5QmYt4bjKvVqGoafWvwNU/DI/LEKeNSOMjSDt19DWiJZGf9CbZXwo8NdFgxstC
         +mFdOrUQiMbUsYjADaEdz6wUOFHoTVm1HpeLF3ARuHWhGPye0TNmaRSc4loYHkLrpISj
         QHD3nAGO3vh7duv5yfTgjd+togNr+djtF03h15srKDpkKGnRyyRwJfFyB3In8Bo/BPzP
         vCJi9TS/RA9c7e3nq58Mo3QH0YgCX+yE7KZBm10rnG1Ix/1OcYs4gQ9iTfj0tnnJAemq
         N6Dlc9j73s+A0pwgALByR9lRC7Hm78/l6og+Rpw1WMv+db+Otw9RC3OHrSQEfIKhNhde
         TKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=B8uzbkP85RAfT7LVEI0HOKe9zMgG+kbxKO7hUX2Hku8=;
        b=ui97l725FEb0lBHkulcG6geuMaazjf1BfJTdy+FIuyF6Hgi2vgbwEuu59RuEU9HdGX
         4IKbnw5vu58eSWkHdmyEApH6lbeofeCgSeIkjxpSBs8WAbFz0wwYwWRm5VXXD5W77yTa
         KsoKp5ai8GSRxlmpWF1kkLSE8G1o4fLRl+RtyHuPMNPzBE8TTrSvHbpcZd07hrNcK1UT
         h6evVu3RMEAZHwdN06Q2vds0spG+VeXfb7fBs/QJCn/AVos6NwAreUm+8fnDLShiNraR
         Pe8ly5QazU1aA6WTb0aFDhqaPnccrn1GGTlBSxlnlW7DVHppyRlvM+S1OZztGBA9BHoX
         +HRw==
X-Gm-Message-State: AOAM531BZ4HxT1t8UviOsmLOlAt5tR40Aao3noqu/sgHOSoki/WRHF5H
	bT1eIO1Rxjp1lPlXq6l5qHlaB2/8bjZgCA==
X-Google-Smtp-Source: ABdhPJywFRi+yrc2L+35uSWOjxJRqQ+5uutGWGQuJUEZq9EZsY+N4QJalzTq6JgP4Feqx8P8sV7fkA==
X-Received: by 2002:a19:2389:: with SMTP id j131mr1014656lfj.324.1605277733458;
        Fri, 13 Nov 2020 06:28:53 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id u9sm1574268lfo.181.2020.11.13.06.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:28:52 -0800 (PST)
Subject: Re: [PATCH V2 09/23] xen/dm: Make x86's DM feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-10-git-send-email-olekstysh@gmail.com>
 <3f432fdb-0625-4803-3a16-62200a6264ca@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <51dcd1c7-3a1d-a269-12df-84db3bafecce@gmail.com>
Date: Fri, 13 Nov 2020 16:28:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3f432fdb-0625-4803-3a16-62200a6264ca@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.11.20 13:32, Jan Beulich wrote:

Hi Jan

> On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> splits devicemodel support into common and arch specific parts.
>>
>> The common DM feature is supposed to be built with IOREQ_SERVER
>> option enabled (as well as the IOREQ feature), which is selected
>> for x86's config HVM for now.
> Did you consider doing it the other way around? It would seem
> more natural to have the top level dm-op handling arch-specific
> and call into e.g. ioreq_server_dm_op() for otherwise unhandled
> ops, just like e.g. do_domctl() calls into iommu_do_domctl()
> (indirectly via arch_do_domctl()). I ask because in the long
> run I expect the ioreq server sub-ops to only be a small part
> of the overall set of dm-ops; already now it's 7 out of 18 if
> I got the counting right.
>
> This would then also leave compat_dm_op() in x86 code.
>
> But yes, there are also downsides with this alternative.


No, I didn't consider. I separated the proposed DM changes from Julien's 
patch without modifying the logic.
My changes on top (except rebasing of course) are updating XSM code and 
introducing a xen/dm.h for definitions.

-- 
Regards,

Oleksandr Tyshchenko


