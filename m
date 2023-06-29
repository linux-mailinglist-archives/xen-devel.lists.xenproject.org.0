Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C8742F99
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 23:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557131.870243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzPe-0004sB-8D; Thu, 29 Jun 2023 21:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557131.870243; Thu, 29 Jun 2023 21:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEzPe-0004mx-3w; Thu, 29 Jun 2023 21:42:50 +0000
Received: by outflank-mailman (input) for mailman id 557131;
 Thu, 29 Jun 2023 21:42:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzPc-0004hW-J1; Thu, 29 Jun 2023 21:42:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzPb-0000O3-Jd; Thu, 29 Jun 2023 21:42:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEzPb-0004J0-F7; Thu, 29 Jun 2023 21:42:47 +0000
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
	bh=e6G69M0iMJlhQPviP0mJBv8R1G7Fl1lgxWMhqkCo7Ps=; b=RC5AJuJ+6BuEK72M03zo9lhDOa
	+Yg9XMxbihFRDZQrbn0GMUu2XzNDk0uv3QXitvGlvnkB0gwauyEFgk4RJKdEhJn+huC1GRq/ffDW7
	ZpotRdgwqp+tpB+T/GvDCklc+uOVmk7bxhpplTJlMpcps5w+mchdOc7AOrZMY1gCajZw=;
Message-ID: <8bf66b4a-7f3b-22e0-6c09-c003ac972fe5@xen.org>
Date: Thu, 29 Jun 2023 22:42:46 +0100
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
 <1ef5a5a6-01ea-4f3f-c05f-7dfd204a1861@xen.org>
 <CALqm=dd494P-BWCiemXJYgE4QbZ09MfE_bmae75LqGQcV=PiXA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CALqm=dd494P-BWCiemXJYgE4QbZ09MfE_bmae75LqGQcV=PiXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2023 15:54, Jiatong Shen wrote:
> Hello Julien,

Hi,

>     Thank you very much for your reply. Can you teach me how to find the
> relationship between MBI-gen and devices?
> I am not sure how to find out the mbi-gen backed devices..

I am afraid I don't have any experience with the MBI-gen. I have also 
looked at one Hisilicon Device-Tree but I don't know whether this is the 
one for your board.

My recommendation would be to check if there is any technical 
documentation for your HW.

Cheers,

-- 
Julien Grall

