Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A749CFB9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:30:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261024.451508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClBP-0006p6-1R; Wed, 26 Jan 2022 16:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261024.451508; Wed, 26 Jan 2022 16:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nClBO-0006nZ-UX; Wed, 26 Jan 2022 16:30:06 +0000
Received: by outflank-mailman (input) for mailman id 261024;
 Wed, 26 Jan 2022 16:30:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nClBN-0006be-AJ
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:30:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nClBM-0006ny-7J; Wed, 26 Jan 2022 16:30:04 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.95.98.192])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nClBM-000761-14; Wed, 26 Jan 2022 16:30:04 +0000
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
	bh=7wBdUjxQnn4HKwaIdhUvyCU0JbRjwYsdHWpZJ+g8lL0=; b=Gj4ebjSZ+PT2oG/xPVTqWTyne7
	gYmdZ3nP9NAxPAYEVhW68DxWas25rmCVG8FuneEkIYIkgMKqeqGGkt4FhZf2DkRU9p5s6h2r0prx+
	r/H/C3Z9Yp8ZK3ljw6NIwo9T23mwePYz2yTb0f07TkiOs3/e9I3dEQx8BbVA7568sDfU=;
Message-ID: <a3caab80-c843-3cd3-e303-3c5d064a772e@xen.org>
Date: Wed, 26 Jan 2022 16:30:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <e2c94aba-8636-cebe-b90a-bcc19affd061@xen.org>
 <CAPD2p-kLksv1SWGB5GHZvgVVRKZp_qf-dbSQsvw-X3TZyxn5UA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAPD2p-kLksv1SWGB5GHZvgVVRKZp_qf-dbSQsvw-X3TZyxn5UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/01/2022 16:28, Oleksandr Tyshchenko wrote:
> Please note, this is V1. But V2 [1] was pushed a couple of weeks ago and 
> all patches are already reviewed)
> [1] 
> https://lore.kernel.org/xen-devel/1640034957-19764-1-git-send-email-olekstysh@gmail.com/ 
> <https://lore.kernel.org/xen-devel/1640034957-19764-1-git-send-email-olekstysh@gmail.com/>

Ah! I was looking at the bottom of my inbox and didn't notice the next 
version. I will have a look at v2.

Sorry for the noise.

Cheers,

-- 
Julien Grall

