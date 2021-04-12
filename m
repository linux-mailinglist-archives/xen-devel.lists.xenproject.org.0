Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A021235C1C3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 11:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108874.207735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtDF-0002Cg-GV; Mon, 12 Apr 2021 09:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108874.207735; Mon, 12 Apr 2021 09:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtDF-0002CH-DK; Mon, 12 Apr 2021 09:50:33 +0000
Received: by outflank-mailman (input) for mailman id 108874;
 Mon, 12 Apr 2021 09:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVtDD-0002CC-Mb
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 09:50:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64d6431-4f9b-440a-83c6-f61235a847f6;
 Mon, 12 Apr 2021 09:50:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0910AF49;
 Mon, 12 Apr 2021 09:50:29 +0000 (UTC)
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
X-Inumbo-ID: c64d6431-4f9b-440a-83c6-f61235a847f6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618221030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H6kWfMg0gUyGaa9RXENbF9xOy3qyixJussWEJJGr+s8=;
	b=SbLG6rZpDZQulq1CWHptyOPnbkkyEjKFVzdSRtXzE67lJXOPSYe8RRp2jO1s7kSC0/St8D
	6fh9afusDJuoaa8/PIJJByggxOGRh/g8aFjNkP2OjiTBsx9tr5srSDp5e17fwoQ6f2gPJ8
	7V4v5u9iiPRcJ/rF+IG8FPcwFR/VHDA=
Subject: Re: [PATCH 3/3] xen-pciback: simplify vpci's find hook
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <158273a2-d1b9-3545-b25d-affca867376c@suse.com>
 <e9f358bc-e957-e039-235c-6a9f68328554@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea274ffe-4eee-9fa5-b5d1-e8528b112227@suse.com>
Date: Mon, 12 Apr 2021 11:50:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e9f358bc-e957-e039-235c-6a9f68328554@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.04.2021 23:45, Boris Ostrovsky wrote:
> 
> On 4/7/21 10:37 AM, Jan Beulich wrote:
>> There's no point in comparing SBDF - we can simply compare the struct
>> pci_dev pointers. If they weren't the same for a given device, we'd have
>> bigger problems from having stored a stale pointer.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Thanks. As the 1st patch of this series still looks to have an unclear
disposition (unless not getting back a reply on my responses to your
comments means silent agreement), I can't predict yet when I'd be able
to submit v2. Hence I'd like to point out that this patch is
independent of the former two, and hence would need to wait further if
you wanted to apply it. After all this one (unlike the other two) is
merely cleanup, and hence would rather want to go in during a merge
window.

Jan

