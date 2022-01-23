Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E349710A
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jan 2022 12:06:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259675.448143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBahK-00068b-67; Sun, 23 Jan 2022 11:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259675.448143; Sun, 23 Jan 2022 11:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBahK-00065q-2n; Sun, 23 Jan 2022 11:06:14 +0000
Received: by outflank-mailman (input) for mailman id 259675;
 Sun, 23 Jan 2022 11:06:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nBahI-00065k-Ke
 for xen-devel@lists.xenproject.org; Sun, 23 Jan 2022 11:06:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nBahI-0002hY-6K; Sun, 23 Jan 2022 11:06:12 +0000
Received: from [54.239.6.188] (helo=[192.168.0.182])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nBahH-0002DK-Tb; Sun, 23 Jan 2022 11:06:12 +0000
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
	bh=lpSyeJrnmOWCMqx5jxt46vhLl4VLh7U3mafwp5HQfJA=; b=yiNr7FbHeYU6c0nz6Xz6EIWaTJ
	ictxtEN909iZ7H/AnlT+aIBgqtlwcneGhkgY0rMbgOcEJZBCrWUP0c7kjYR98nb1Lgq0891Y7CVhK
	TMbbgcD/WU7P6weQtEgoGpnxYg6JVmLJbhT9DcvPz1/84ein+kWRxbOp+n4BnbXPu/vM=;
Message-ID: <62b2ebe5-5b15-ab0e-97ee-c1a6f5a2c2c1@xen.org>
Date: Sun, 23 Jan 2022 15:06:08 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [XEN PATCH v2 3/5] xen/arm: configure dom0less domain for
 enabling xenstore after boot
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-3-sstabellini@kernel.org>
 <B458F1F7-4DF0-4919-8E16-11E889A9ABB2@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B458F1F7-4DF0-4919-8E16-11E889A9ABB2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2022 14:15, Bertrand Marquis wrote:
> Hi Stefano,
> 
> + Penny in CC for the question.
> 
>> On 13 Jan 2022, at 00:58, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> If "xen,enhanced" is enabled, then add to dom0less domains:
>>
>> - the hypervisor node in device tree
>> - the xenstore event channel
>>
>> The xenstore event channel is also used for the first notification to
>> let the guest know that xenstore has become available.
>>
>> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Just one question: GUEST_GNTTAB_BASE is fixed but could it be a problem for a direct map guest in the future ?
It will be an issue. I think we can re-use the same method as we do in 
dom0 (see find_gnttab_region()).

Cheers,

-- 
Julien Grall

