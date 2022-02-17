Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44EB4BA9E5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 20:36:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274970.470622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKmZP-0000lb-8D; Thu, 17 Feb 2022 19:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274970.470622; Thu, 17 Feb 2022 19:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKmZP-0000je-57; Thu, 17 Feb 2022 19:36:03 +0000
Received: by outflank-mailman (input) for mailman id 274970;
 Thu, 17 Feb 2022 19:36:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nKmZN-0000jY-4E
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 19:36:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKmZK-0004YG-Hs; Thu, 17 Feb 2022 19:35:58 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nKmZK-00006k-Bp; Thu, 17 Feb 2022 19:35:58 +0000
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
	bh=xq3ofygjMKSKuKTtVeabYxNwbicydvZfsrah2LpbYg0=; b=OMBkrot6LxhYEdjbZsZGxpPsc0
	KkqhNjH5J0JTBEwYPfxv/svBI/zBEkQwpwHLojuCCnSkR5pfJ9IIKfAV0mkgk54xGosU+nZVkw2Zc
	zWAmgBPF6uc0Gd0VeM+3mMGwdaCy4gMYWOPgxOdTtOCe9Yzca3JjbQLqpFlkGI5gdnV0=;
Message-ID: <4162e249-3a75-eb31-0871-71261af88247@xen.org>
Date: Thu, 17 Feb 2022 19:35:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v9 30/30] build: adding out-of-tree support to the xen
 build
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-31-anthony.perard@citrix.com>
 <Ye/g7P0wV5Vj8OoT@perard>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Ye/g7P0wV5Vj8OoT@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/01/2022 11:37, Anthony PERARD wrote:
> On Tue, Jan 25, 2022 at 11:01:03AM +0000, Anthony PERARD wrote:
>> This implement out-of-tree support, there's two ways to create an
>> out-of-tree build tree (after that, `make` in that new directory
>> works):
>>      make O=build
>>      mkdir build; cd build; make -f ../Makefile
>> also works with an absolute path for both.
> 
> Maybe I should have made it more explicit in the description that those
> only works within the xen dir, i.e. not the whole project.

That would be useful. In any case:

Acked-by: Julien Grall <jgrall@amazon.com>
Tested-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

