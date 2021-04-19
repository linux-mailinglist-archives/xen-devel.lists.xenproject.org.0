Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D51273641BB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 14:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112885.215223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYT5X-000640-TT; Mon, 19 Apr 2021 12:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112885.215223; Mon, 19 Apr 2021 12:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYT5X-00063b-QE; Mon, 19 Apr 2021 12:33:15 +0000
Received: by outflank-mailman (input) for mailman id 112885;
 Mon, 19 Apr 2021 12:33:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYT5V-00063W-Qr
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 12:33:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7333ed3b-c18d-47bd-8863-b70392d22516;
 Mon, 19 Apr 2021 12:33:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67C9DB2F1;
 Mon, 19 Apr 2021 12:33:12 +0000 (UTC)
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
X-Inumbo-ID: 7333ed3b-c18d-47bd-8863-b70392d22516
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618835592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t03M4jUAZ+QoCH0ewLO/1575kRUEHCkE5EB40iuS948=;
	b=XUx3TrXQ11JeHZbwB5dt5Y4jaVkmcr1VCnYmEQExIuVK4BzlknHwlHWyVUQFJ46CHK/Xwc
	jjvr3S+MuhRoXYRuP5Qw7gMdidGrrbUaArWzPOGr3EuNkc+/YpUN8mAZ8z6rAaFmdBO3dC
	srPKxC4GQdMd29hz+tuCI3F5bRh3hUQ=
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
Date: Mon, 19 Apr 2021 14:33:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.04.2021 13:54, Julien Grall wrote:
> For the time being, I think move this code in x86 is a lot better than 
> #ifdef or keep the code in common code.

Well, I would perhaps agree if it ended up being #ifdef CONFIG_X86.
I would perhaps not agree if there was a new CONFIG_* which other
(future) arch-es could select if desired.

Jan

