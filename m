Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27772CBB32
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 12:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42622.76688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkPvf-00060z-B4; Wed, 02 Dec 2020 11:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42622.76688; Wed, 02 Dec 2020 11:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkPvf-00060a-7s; Wed, 02 Dec 2020 11:04:11 +0000
Received: by outflank-mailman (input) for mailman id 42622;
 Wed, 02 Dec 2020 11:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkPve-00060V-8g
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 11:04:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c066b43-7e00-4eeb-aa77-5e132e291d94;
 Wed, 02 Dec 2020 11:04:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A77D2AB7F;
 Wed,  2 Dec 2020 11:04:08 +0000 (UTC)
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
X-Inumbo-ID: 0c066b43-7e00-4eeb-aa77-5e132e291d94
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606907048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pdUvgVfYTqrQvV5+apl5wpCLRdSrGYgq/Idh/t8BaEE=;
	b=C1S5nT7paL9iTIylL1BpvzoqcU9Neii7qkak4Q5w8YXLQFeK9WGvdpadmpPuRWnI5uqvr7
	wReoYSFZHLNUS0DpadXU939QcyVoVv1o5JPoOwU9sj5S+dk4URHzLGmP4ykUEwnk4y2LU+
	lR7jVRwA1bSWv4KeFWNjBMlGKJ6R2A4=
Subject: Re: [PATCH v9] xen/events: do some cleanups in
 evtchn_fifo_set_pending()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201202074852.30473-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28c90eac-82a5-d1f6-f1dd-2d469a793af6@suse.com>
Date: Wed, 2 Dec 2020 12:04:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201202074852.30473-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 08:48, Juergen Gross wrote:
> evtchn_fifo_set_pending() can be simplified a little bit. Especially
> testing for the fifo control block to exist can be moved out of the
> main if clause of the function enabling to avoid testing the LINKED bit
> twice.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

