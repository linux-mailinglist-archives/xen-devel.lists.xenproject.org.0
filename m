Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7377E4707D6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 18:55:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244160.422288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvk6w-0006mJ-0O; Fri, 10 Dec 2021 17:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244160.422288; Fri, 10 Dec 2021 17:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvk6v-0006jn-Te; Fri, 10 Dec 2021 17:55:09 +0000
Received: by outflank-mailman (input) for mailman id 244160;
 Fri, 10 Dec 2021 17:55:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mvk6u-0006jf-0X
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 17:55:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvk6s-0003A2-Um; Fri, 10 Dec 2021 17:55:06 +0000
Received: from [54.239.6.184] (helo=[192.168.9.67])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mvk6s-00009m-On; Fri, 10 Dec 2021 17:55:06 +0000
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
	bh=Iajxf5ta7fKeN0+HACku7QAAo95zMRvzTiF6WPwht0I=; b=ldb10Jrdziyw8HqoamDiiR+5c5
	yOLVcp3VAYa7B1KHYXwta7ho86lvfogTZd81k2y2HMNycWVCCZEcQO2TGGYWGTLmlLjvt5pRHldmc
	Mw5Ec4HZxXkT/alZi2yNLWzsQDkMVRXdpyqFzQuWc5UCAEiQkpNCIEfVqLAsKMnYH7PI=;
Message-ID: <19c43763-966d-e336-9282-ff12b1b3b2c6@xen.org>
Date: Fri, 10 Dec 2021 17:55:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v5 02/14] vpci: fix function attributes for
 vpci_process_pending
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-3-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125110251.2877218-3-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 25/11/2021 11:02, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vpci_process_pending is defined with different attributes, e.g.
> with __must_check if CONFIG_HAS_VPCI enabled and not otherwise.
> Fix this by defining both of the definitions with __must_check.
> 
> Fixes: 14583a590783 ("7fbb096bf345 kconfig: don't select VPCI if building a shim-only binary")
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

