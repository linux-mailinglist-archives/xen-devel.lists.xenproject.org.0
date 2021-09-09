Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE69405BE3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 19:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183438.331620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONhf-0003HM-4F; Thu, 09 Sep 2021 17:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183438.331620; Thu, 09 Sep 2021 17:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mONhf-0003FM-0q; Thu, 09 Sep 2021 17:19:11 +0000
Received: by outflank-mailman (input) for mailman id 183438;
 Thu, 09 Sep 2021 17:19:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mONhd-0003FG-OH
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 17:19:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mONhb-0002xR-2E; Thu, 09 Sep 2021 17:19:07 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mONha-0008Fx-Rx; Thu, 09 Sep 2021 17:19:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DSXntFz1K6MMSBxiwjqUnifCkDzWAFsf49MNV7vK8WI=; b=KoQ9pphil1aCm0O0mSFqlVLMH2
	EBerKzE3ezYFlElJ8RvYLRDseiIgwwMSvv1g2pxvvu+7h40HaQllQm9PaU4Lw8eCraciGLrLV8cM7
	Wkps7de0vxejnGqCA0us+4Yx3lDa/6udY4eKJRmfz3ZKXKREafyIW+KM+Ts1zKY1Sqiw=;
Subject: Re: [PATCH 01/11] xen/arm: Add new device type for PCI
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-2-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5a32422f-0782-342d-911b-116af2c85859@xen.org>
Date: Thu, 9 Sep 2021 18:19:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210903083347.131786-2-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 03/09/2021 09:33, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add new device type (DEV_PCI) to distinguish PCI devices from platform
> DT devices, so some drivers, like IOMMU, can handle PCI devices
> differently.

I think it would be better to fold this change in the next patch as this 
is where you add all the helpers for converting dev to PCI.

> 
> While at it fix dev_is_dt macro.

I would keep this change separate. It also needs an explanation of 
what's the problem and mention it is a latent bug because no-one use it 
(so we know this doesn't require a backport).

Cheers,

-- 
Julien Grall

