Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0905B468B
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 16:02:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404751.647322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX13A-0004bH-5n; Sat, 10 Sep 2022 14:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404751.647322; Sat, 10 Sep 2022 14:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX13A-0004YC-2Q; Sat, 10 Sep 2022 14:01:36 +0000
Received: by outflank-mailman (input) for mailman id 404751;
 Sat, 10 Sep 2022 14:01:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oX138-0004Y6-EQ
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 14:01:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX137-0004zt-SM; Sat, 10 Sep 2022 14:01:33 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX137-0003ny-Lf; Sat, 10 Sep 2022 14:01:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=5ZEoyji53cRCV76JF0zz9cdIdNOD3S6Xipmze9D463w=; b=42aPZBcvm5K5x6UJ+PXmrYota8
	kuSnq3ZCAY4fZ+p/PHZ1sDakxeZuuyWxq10Y62f2XMvqFjV19sIMCfZcWvF6EHGY1s2PnKZTu7jZI
	IOH3hPfCmrlTHUBlkHE06y5nmxaxD5E8ThnUTAKRwpzF8HIMk+2dPWEXT9lDR8Ge8UQo=;
Message-ID: <a073d250-ade5-8048-e638-025dcf90ba96@xen.org>
Date: Sat, 10 Sep 2022 15:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-9-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 08/12] Revert "xen/arm: setup: Add Xen as boot module
 before printing all boot modules"
In-Reply-To: <20220826125111.152261-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/08/2022 13:51, Carlo Nonato wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> This reverts commit 48fb2a9deba11ee48dde21c5c1aa93b4d4e1043b.
> 
> The cache coloring support has the command line parsing as a prerequisite
> because of the color configurations passed in this way. Also, the Xen boot
> module will be placed at an address that depends on the coloring
> initialization. This commit moves the Xen boot module after the coloring
> initialization to allow the order of operations previously described to
> take place.

The commit you revert was created in order to print the position of Xen 
on the console. So while I understand your aim, you are (temporarily?) 
not printing Xen address anymore.

Therefore your commit message, should contain some words explaining why 
this is fine and how this problem will be addressed.

Cheers,

-- 
Julien Grall

