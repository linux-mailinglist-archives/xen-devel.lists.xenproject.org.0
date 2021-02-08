Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF88312D79
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 10:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82659.152615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l930C-0001Bl-4Z; Mon, 08 Feb 2021 09:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82659.152615; Mon, 08 Feb 2021 09:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l930B-0001BT-Ra; Mon, 08 Feb 2021 09:38:39 +0000
Received: by outflank-mailman (input) for mailman id 82659;
 Mon, 08 Feb 2021 09:38:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZIyB=HK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l930A-0001BN-1K
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 09:38:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79c6eac7-0d17-4fae-b7f6-f9abd47d8d78;
 Mon, 08 Feb 2021 09:38:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2EDB9AD62;
 Mon,  8 Feb 2021 09:38:34 +0000 (UTC)
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
X-Inumbo-ID: 79c6eac7-0d17-4fae-b7f6-f9abd47d8d78
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612777114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ey4KeQ4wI8Ow8TBhYfMVHQwpaYnFFEiIsiUIit12DQc=;
	b=X3B/SXktu9OMTy3gCQxKfATO0YpQH5xheJaVU3VFlUCboSnM0ZJ3XMUnFDT4Nb0M3RXbQt
	/XfS7+BQnhF2x43SmgC72bRa4C5wB08RgIEcwa/NPXW0LO5bxZTYw4zykSZJ6+jMUiEnYr
	rCEC9iNZdEEoaRqQbhVaGX7lqbQvV44=
Subject: Re: [PATCH 6/7] xen/evtch: use smp barriers for user event ring
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5cef0d0e-8f03-7cd2-4246-268a67a87dc5@suse.com>
Date: Mon, 8 Feb 2021 10:38:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210206104932.29064-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.02.2021 11:49, Juergen Gross wrote:
> The ring buffer for user events is used in the local system only, so
> smp barriers are fine for ensuring consistency.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Albeit I think "local system" is at least ambiguous (physical
machine? VM?). How about something like "is local to the given
kernel instance"?

Jan

