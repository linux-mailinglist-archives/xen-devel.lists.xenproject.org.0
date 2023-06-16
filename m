Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C1733B37
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 22:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550468.859586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGTL-00089w-1q; Fri, 16 Jun 2023 20:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550468.859586; Fri, 16 Jun 2023 20:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAGTK-00082q-T6; Fri, 16 Jun 2023 20:55:06 +0000
Received: by outflank-mailman (input) for mailman id 550468;
 Fri, 16 Jun 2023 20:55:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGTI-0007zF-Tn; Fri, 16 Jun 2023 20:55:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGTI-0007kl-A6; Fri, 16 Jun 2023 20:55:04 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.4.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qAGTI-0006dl-4l; Fri, 16 Jun 2023 20:55:04 +0000
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
	bh=5L0WNm+pYd5n/HG5ntEgpIphfBSos7jxxesVwyaIfrw=; b=7BE4D+eC20UQ0UEbsuEjkr87VX
	QcJoxOy5jGTUkzSMGzQy2vMkWnzM2E+q1mS4rO7p1aCGxnte0bP1N3nRkvIMiQpR0npjqf3vkg2RG
	pfeXLYL+au2h5tTvcG1fNmh5G4drvoNGULNKqMg/gw77/dt9h5sbVKmj6Sq9m9OiOjOM=;
Message-ID: <ebdfe8a6-7aee-a553-907e-e788c3b3df33@xen.org>
Date: Fri, 16 Jun 2023 21:55:02 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <CALqm=dfE=Ni0gzs8F692DmXzBs-EbqCs7sXenBt0qOGV=iyj0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/06/2023 22:52, Jiatong Shen wrote:
>      Thank you for your answer! Adding console=hvc0 indeed provides kernel
> output serial console. Looking at the log message,
> I found dom0 kernel failed to initialize a lot of device drivers (network
> cards, raid cards, etc).
> 
>     Is it related to iommu? 

I am afraid I can't tell without seen some logs.

 >I remember iommu is not enabled during the xen
> kernel booting stage.

At the moment, the IOMMU is not hidden from dom0. So Linux may try to 
use it. However, IIRC, it is only becoming a problem when booting a guest.

Best regards,

---
Julien Grall

