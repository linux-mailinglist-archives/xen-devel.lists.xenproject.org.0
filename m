Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4850F6E671A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 16:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522939.812606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomGq-000429-2r; Tue, 18 Apr 2023 14:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522939.812606; Tue, 18 Apr 2023 14:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pomGq-0003zh-0B; Tue, 18 Apr 2023 14:25:24 +0000
Received: by outflank-mailman (input) for mailman id 522939;
 Tue, 18 Apr 2023 14:25:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pomGo-0003zb-7S
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 14:25:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pomGl-0006mm-5v; Tue, 18 Apr 2023 14:25:19 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.26.51]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pomGk-0004F7-V9; Tue, 18 Apr 2023 14:25:19 +0000
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
	bh=jr0CkdzxrtGTXuZcfeBcPc5F9ABh5BiZuEkLntsQRRs=; b=nkDpxpwzemHnIVwJX6r+JU7TnR
	qCKAeVd+Evk5JdUkhUoEXltTw0loXl8JQ+BYp3n7GvyczfigJB+Uw5TfkE4esHvl6A8IVRZg8zZDe
	Q/G3vsLhsUTgRX5Km+rDnV08Ye64T0R5XY5gbISJgQ9xyJGBbZy44PdxKjY6/eHPG5C0=;
Message-ID: <bdb1b5e3-c3d9-1c39-f7f7-8f48157ba7b3@xen.org>
Date: Tue, 18 Apr 2023 15:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 00/12] SVE feature for arm guests
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <08BE4F94-C4B5-4B05-AD92-61C5C5D24F39@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/04/2023 14:13, Bertrand Marquis wrote:
> Hi Luca,

Hi,

> On this serie I would like to open a discussion on how to handle the vector size
> and the corresponding command line / configuration / device tree parameters.
> 
> In general the user must either give a vector size it wants or has a solution to
> just request the maximum supported size.
> 
> In the current implementation if a size bigger than the supported one is provided:
> - we silently disable SVE for dom0
> - we silently disable SVE for dom0less
> - we do not create a guest when done through tools
> 
> This is not completely coherent and i think we should aim for a coherent behaviour
> unless we have arguments for this status.

+1.

> Is there any good reason to silently disable for Dom0 and dom0less only ?
> 
> I see some possible solutions here:
> 
> - modify parameter behaviour to use the supported size if parameter is bigger than
> it. This would at least keep SVE enabled if a VM depends on it and could simplify
> some of the handling by using 2048 to use the maximum supported size.

My concern with this approach and the third one is the user may take 
some time to realize the problem in the xl.cfg. So...

> 
> - coherently stop if the parameter value is not supported (including if sve is
> not supported)

... this is my preferred approach because it would be clear that the 
value passed to Xen is bogus.

Cheers,

-- 
Julien Grall

