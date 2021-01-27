Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D699B30613F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 17:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76264.137546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nzl-0002am-Hr; Wed, 27 Jan 2021 16:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76264.137546; Wed, 27 Jan 2021 16:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4nzl-0002aP-El; Wed, 27 Jan 2021 16:48:41 +0000
Received: by outflank-mailman (input) for mailman id 76264;
 Wed, 27 Jan 2021 16:48:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4nzk-0002aK-9I
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 16:48:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d20af2e-ab7c-4772-bc24-0d0767b26961;
 Wed, 27 Jan 2021 16:48:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94DECAD78;
 Wed, 27 Jan 2021 16:48:37 +0000 (UTC)
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
X-Inumbo-ID: 2d20af2e-ab7c-4772-bc24-0d0767b26961
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611766117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=td2fbXm2ndfeImPLzvYulf1e4pnv4Zdjgj+6SY9UH5E=;
	b=kPnv37vc7iD83N0hRNA1pNAg1fCsi3FOV0Ic/YLG91y2j2RkwkFMsNwuF67AacJ8jxEU9k
	89qr7sXL/Uh6zm6kQfkHTrJT2twjDvEWl4n+CpWLCsZROjZaHCHuuEJPdOUoraHmSqcjsH
	Bfy04KiMQvNVU5LWFacM6iFOQLGlShc=
Subject: Re: [PATCH V5 01/22] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-2-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f358b9da-1e3e-a27b-4a73-b6427d6a66a6@suse.com>
Date: Wed, 27 Jan 2021 17:48:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611601709-28361-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.01.2021 20:08, Oleksandr Tyshchenko wrote:
> Changes V4 -> V5:
>    - add Julien's and Paul's R-b
>    - update patch description
>    - remove single use variable in arch_ioreq_server_map_mem_type_completed()
>    - put multiple function parameters on a single line in the header
>      where possible
>    - introduce common ioreq.h right away and put arch hooks declarations
>      there instead of doing that in patch #4

And with this, faod (the patch doesn't strictly need it),
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

