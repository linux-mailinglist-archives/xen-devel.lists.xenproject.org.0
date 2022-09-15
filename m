Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72CF5B9CEE
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407438.649967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpjt-0002Bz-JG; Thu, 15 Sep 2022 14:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407438.649967; Thu, 15 Sep 2022 14:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpjt-00028U-GV; Thu, 15 Sep 2022 14:21:13 +0000
Received: by outflank-mailman (input) for mailman id 407438;
 Thu, 15 Sep 2022 14:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKZT=ZS=eikelenboom.it=linux@srs-se1.protection.inumbo.net>)
 id 1oYpjr-00028M-O0
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:21:12 +0000
Received: from server.eikelenboom.it (server.eikelenboom.it [91.121.65.215])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1dca4b7-3501-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 16:21:04 +0200 (CEST)
Received: from 76-24-144-85.ftth.glasoperator.nl ([85.144.24.76]:42219
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <linux@eikelenboom.it>)
 id 1oYpjX-0006eu-NL; Thu, 15 Sep 2022 16:20:51 +0200
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
X-Inumbo-ID: a1dca4b7-3501-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=22uognlqXI1+pHDvRBF2Ij3fKa4BYOwUs5ctj3tBVJQ=; b=UE/s+hXseF49gZ5LNSId9Ercfj
	AETi0neENLCJrx5csxzUl+hnvNSDYJ1cULxJ+GLAmngTxTgNZX1PgBGOkOc8nQcDwNCcEehfZe9pA
	JCTloRMdjvUhJeXP3pFu218noA0g0vMIRTly6ZSczrcB0Y2UYznAQQBC7shsU++9cFsM=;
Message-ID: <f0572573-c1ac-5ffe-2178-a25016ecd337@eikelenboom.it>
Date: Thu, 15 Sep 2022 16:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Bisected: drivers/block/xen-blkback/xenbus.c:327
 xen_blkif_disconnect+0x24f/0x260
To: Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c38ca372-e3ea-2f72-6cdd-81433002d21e@eikelenboom.it>
 <17313adf-2881-9902-0d66-a4e723158434@suse.com>
Content-Language: nl-NL
From: Sander Eikelenboom <linux@eikelenboom.it>
In-Reply-To: <17313adf-2881-9902-0d66-a4e723158434@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/09/2022 15:10, Juergen Gross wrote:
> On 15.09.22 14:49, Sander Eikelenboom wrote:
>> Hi Juergen,
>>
>> I'm having trouble booting my DomU's when trying to use a linux-5.19 kernel for
>> both Dom0 and DomU.
>> A dom0 5.19 kernel with a domU 5.18 kernel boots fine.
>> I'm using durect kernel boot to boot the domU guest (kernel=  and ramdisk=
>> parameters).
>>
>> Since both xen-blkback and xen-blkfront could be into play,
>> I bisected this by keeping dom0 fixed as a 5.19 kernel and do the bisecting on
>> the domU kernel.
>>
>> Bisecting leads to commit 4573240f0764ee79d7558d74fc535baa1e110d20 "xen/xenbus:
>> eliminate xenbus_grant_ring()"
>> Reverting this specific commit makes the domU boot fine again.
>>
>> I have added the splat from dom0 kernel below (from using 5.19.8 kernel for both
>> dom0 and domU),
>> the domU does not seem to have any interessting logging,
>> apart from not being able to find the root filesystem.
>>
>> Do you have any ideas ?
> 
> Ouch. What a silly, silly, silly error!
> 
> Does the attached patch fix it for you?
> 
> 
> Juergen

Hi Juergen,

Yes this fixes the problem, thanks !

--
Sander

