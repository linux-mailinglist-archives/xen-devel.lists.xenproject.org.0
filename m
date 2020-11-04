Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09FA2A60C7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 10:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18955.44100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaFJa-0001sL-NE; Wed, 04 Nov 2020 09:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18955.44100; Wed, 04 Nov 2020 09:42:50 +0000
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
	id 1kaFJa-0001rw-K8; Wed, 04 Nov 2020 09:42:50 +0000
Received: by outflank-mailman (input) for mailman id 18955;
 Wed, 04 Nov 2020 09:42:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaFJZ-0001rq-4X
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:42:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 508c9b3b-252a-4f83-9cf1-b6b9affc7fb3;
 Wed, 04 Nov 2020 09:42:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E373AF16;
 Wed,  4 Nov 2020 09:42:48 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaFJZ-0001rq-4X
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 09:42:49 +0000
X-Inumbo-ID: 508c9b3b-252a-4f83-9cf1-b6b9affc7fb3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 508c9b3b-252a-4f83-9cf1-b6b9affc7fb3;
	Wed, 04 Nov 2020 09:42:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604482968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t9wPQ7lokfVzzlp/v4PGMhUOS99/dsu0jEfvYazpJqc=;
	b=MSBzHC7CK9BjXnmbmjgUDzXRpkB5nbEOXEumM/32Ue2L26vrj10tTrI7GyacGgwJVH2IsW
	ufrmEs4xwFFUAgxxnL8JXoW+pdIQYHyLyH/vIYOUm4FyG31wkso52Pu625BOYBTMrpkAlf
	N3L9jc/mYkLf6avU80ku1WSPKAbcV8w=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0E373AF16;
	Wed,  4 Nov 2020 09:42:48 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] xen/rwlock: add check_lock() handling to rwlocks
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201104081549.3712-1-jgross@suse.com>
 <20201104081549.3712-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36e3c54f-41c2-e407-39eb-8fd19e17641a@suse.com>
Date: Wed, 4 Nov 2020 10:42:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104081549.3712-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.11.2020 09:15, Juergen Gross wrote:
> Checking whether a lock is consistently used regarding interrupts on
> or off is beneficial for rwlocks, too.
> 
> So add check_lock() calls to rwlock functions. For this purpose make
> check_lock() globally accessible.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

