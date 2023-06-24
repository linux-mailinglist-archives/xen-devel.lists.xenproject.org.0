Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587173C91A
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 10:25:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554519.865804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCyYy-0004po-Im; Sat, 24 Jun 2023 08:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554519.865804; Sat, 24 Jun 2023 08:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCyYy-0004lD-Cj; Sat, 24 Jun 2023 08:24:08 +0000
Received: by outflank-mailman (input) for mailman id 554519;
 Sat, 24 Jun 2023 08:24:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCyYx-0004hs-9n; Sat, 24 Jun 2023 08:24:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCyYv-0002NZ-V3; Sat, 24 Jun 2023 08:24:05 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qCyYv-0003GE-O4; Sat, 24 Jun 2023 08:24:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XKVeNK4nZuoy81jPfnNXAF8mkWnlQ7qSHUiFXJiiZ4c=; b=KV+nj0g3ZWIPiNpLMQyHbZ8wi/
	Gf79ZF6fnqdb5Sd5siwgcl7keIKuvEYpCvlg/gi3vu0JSq0d5ohF7QnlNSXHvfBTiv93MgvRktYjf
	F2JArzX6vM0EnuvCUrPOUv7HoWZnVXTG+ix7BOCcgooZRT00wx/TFo1ywtiXXjPjzvDs=;
Message-ID: <1ef5a5a6-01ea-4f3f-c05f-7dfd204a1861@xen.org>
Date: Sat, 24 Jun 2023 09:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Asking for help to debug xen efi on Kunpeng machine
Content-Language: en-US
To: Jiatong Shen <yshxxsjt715@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-users@lists.xenproject.org, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com
References: <CALqm=ddiMwWvdYMgyCtaKMocUEkEJyTgSQup9wJiXm4PrcDuVw@mail.gmail.com>
 <alpine.DEB.2.22.394.2306081537590.3803068@ubuntu-linux-20-04-desktop>
 <e729d60e-b290-dec3-e35b-65c24ffbfda6@xen.org>
 <CALqm=ddc3BhqRQmPDjnZ3TeMEXPTMUDfj7JCSj0QEDxnMaKLvw@mail.gmail.com>
 <78899eac-9de8-3626-8f40-98f993984f95@xen.org>
 <CALqm=dfrudbnsy7RdP9GdSmyO2m9JN=8mKD7wQvz2WBv6afJhQ@mail.gmail.com>
 <CALqm=de+zGitK2ofX=gExMX1mVUbN1S45fMtf5a9iBR-WBZpcw@mail.gmail.com>
 <CALqm=dcn02oe=nrL_SEo+y5aTJX8SD3OB3fccFyEwPch6fLfDg@mail.gmail.com>
 <CALqm=deNDzc83QEAUqTE5iKb7g106V_k_F6AEJc19R=W-0TDsw@mail.gmail.com>
 <e3f54279-db7a-973c-e792-712dc2b19eb7@xen.org>
 <CALqm=dfE=Ni0gzs8F692DmXzBs-EbqCs7sXenBt0qOGV=iyj0g@mail.gmail.com>
 <ebdfe8a6-7aee-a553-907e-e788c3b3df33@xen.org>
 <CALqm=ddPaaF8PG=ycb0u0iGHR+=35SV9taSo7Q-0FqH9QeMiEA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CALqm=ddPaaF8PG=ycb0u0iGHR+=35SV9taSo7Q-0FqH9QeMiEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/06/2023 08:09, Jiatong Shen wrote:
> Hello Julien,
> 
>     Sorry for the delay.. I obtained the full xen log and attached it in the
> mail. Please take a look when you are available. Thank you very much

Thanks for sharing the logs. The following lines are interesting:

[    1.081905] Hisilicon MBIGEN-V2 HISI0152:00: Failed to create mbi-gen 
irqdomain
[    1.082107] Hisilicon MBIGEN-V2 HISI0152:01: Failed to create mbi-gen 
irqdomain
[    1.082204] Hisilicon MBIGEN-V2 HISI0152:02: Failed to create mbi-gen 
irqdomain
[    1.082294] Hisilicon MBIGEN-V2 HISI0152:03: Failed to create mbi-gen 
irqdomain
[    1.082381] Hisilicon MBIGEN-V2 HISI0152:04: Failed to create mbi-gen 
irqdomain
[    1.082466] Hisilicon MBIGEN-V2 HISI0152:05: Failed to create mbi-gen 
irqdomain

Looking at a Hisilicon Device-Tree, this is an interrupt controller 
behind the GICv3 ITS. You will need to rebuild Xen with CONFIG_HAS_ITS=y.

Also, can you confirm which devices are behind the MBI-Gen? If this is 
only PCI devices, then you are probably fine to give the controllers to 
dom0. But for PCI passthrough, you will most likely need to implement it 
a driver in Xen.

Cheers,

-- 
Julien Grall

