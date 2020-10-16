Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22776290047
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 10:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7842.20663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLXZ-0002hT-OW; Fri, 16 Oct 2020 08:56:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7842.20663; Fri, 16 Oct 2020 08:56:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLXZ-0002h4-LI; Fri, 16 Oct 2020 08:56:45 +0000
Received: by outflank-mailman (input) for mailman id 7842;
 Fri, 16 Oct 2020 08:56:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTLXY-0002gv-6E
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:56:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c96010d6-d6ae-44c4-b696-86114a01252d;
 Fri, 16 Oct 2020 08:56:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5006EAC0C;
 Fri, 16 Oct 2020 08:56:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTLXY-0002gv-6E
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:56:44 +0000
X-Inumbo-ID: c96010d6-d6ae-44c4-b696-86114a01252d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c96010d6-d6ae-44c4-b696-86114a01252d;
	Fri, 16 Oct 2020 08:56:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602838602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dy94yMzztdQsQpIhT40xhT2ki5Jo8sjdCZ511fC+Pk=;
	b=tlCeww70D4k6vNbikgYBYG9T5lcdLE5LDlnr7/ldWGNVFpg0pb2ohCbScR+19FcPzANgOX
	0V/ijDFM8lkuyAcx1E+Nwma1NxCBTesEgCQwz5qhoQMQNNj53ZfPcxH3SXcH/8Ly9zkdao
	W3HkbuJoycX8Um3SZGv86JDhtWSnICI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5006EAC0C;
	Fri, 16 Oct 2020 08:56:42 +0000 (UTC)
Subject: Re: [PATCH V2 21/23] xen/arm: Add mapcache invalidation handling
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-22-git-send-email-olekstysh@gmail.com>
 <cad29fdb-089a-541b-6c5b-538d96441714@suse.com>
 <b074eb70-a770-1f96-3d68-b06476b963ca@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e638b6b7-1939-4542-85fa-70d8e1f5e9d6@suse.com>
Date: Fri, 16 Oct 2020 10:56:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <b074eb70-a770-1f96-3d68-b06476b963ca@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 10:41, Julien Grall wrote:
> On 16/10/2020 07:29, Jan Beulich wrote:
>> Given how p2m_free_entry() works (or is supposed to work in the
>> long run), is the new code you add guaranteed to only alter leaf
>> entries?
> 
> This path may also be called with tables. I think we want to move the 
> check in p2m_free_entry() so we can find the correct leaf type.
> 
>> If not, the freeing of page tables needs deferring until
>> after qemu has dropped its mappings.
> 
> Freeing the page tables doesn't release a page. So may I ask why we 
> would need to defer it?

Oh, sorry - qemu of course doesn't use the same p2m, so the
intermediate page tables are private to the subject guest.

>> And with there being refcounting only for foreign pages, how do
>> you prevent the freeing of the page just unmapped before qemu has
>> dropped its possible mapping?
> QEMU mappings can only be done using the foreign mapping interface. This 
> means that page reference count will be incremented for each QEMU 
> mappings. Therefore the page cannot disappear until QEMU dropped the 
> last reference.

Okay, sorry for the noise then.

Jan

