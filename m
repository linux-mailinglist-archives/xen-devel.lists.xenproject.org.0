Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAE304091
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 15:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75135.135205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PUF-0000Be-Rr; Tue, 26 Jan 2021 14:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75135.135205; Tue, 26 Jan 2021 14:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4PUF-0000BF-OP; Tue, 26 Jan 2021 14:38:31 +0000
Received: by outflank-mailman (input) for mailman id 75135;
 Tue, 26 Jan 2021 14:38:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4PUE-0000B9-3M
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 14:38:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51af6012-c9c8-4654-a655-153ec1c9e00a;
 Tue, 26 Jan 2021 14:38:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1DA4FAC6E;
 Tue, 26 Jan 2021 14:38:27 +0000 (UTC)
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
X-Inumbo-ID: 51af6012-c9c8-4654-a655-153ec1c9e00a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611671907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3tuH6wJWu7g/a/W6i5XVgH2ZehdeELYpGPcEzKrWP8=;
	b=VBQ+FCAOhyE1hQ7i6j4EZngxGeytM8ZKaQjr2WyPSejqibJoOZK4ijrQrxf15oBlg9g3ks
	00MByEsI7eWIscqzVjT5E82I0j5N0ZERecI5FdDR10h2bVtaQMQwLXD1TuDMSh0KLvA5Pj
	cHJSv5NO/kxt0QxA8oOG3gvB87gycGg=
Subject: Re: [PATCH 1/3] x86/irq: remove duplicated clear_domain_irq_pirq
 calls
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210126110606.21741-1-roger.pau@citrix.com>
 <20210126110606.21741-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <10af3f2a-6f4f-372c-6d9a-c02fc730af4b@suse.com>
Date: Tue, 26 Jan 2021 15:38:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210126110606.21741-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.01.2021 12:06, Roger Pau Monne wrote:
> There are two duplicated calls to cleanup_domain_irq_pirq in
> unmap_domain_pirq.
> 
> The first one in the for loop will be called with exactly the same
> arguments as the call placed closer to the loop start.

I'm having trouble figuring out which two instances you refer
to: To me "first one" and "closer to the start" are two ways
of expressing the same thing. You don't refer to the call to
clear_domain_irq_pirq(), do you, when the two calls you
remove are to cleanup_domain_irq_pirq()? Admittedly quite
similar names, but entirely different functions.

> The logic used in the loop seems extremely complex to follow IMO,
> there are several breaks for exiting the loop, and the index (i) is
> also updated in different places.

Indeed, and it didn't feel well already back at the time when
I much extended this to support multi-vector MSI. I simply
didn't have any good idea how to streamline all of this
(short of rewriting it altogether, which would have made
patch review quite difficult). If you have thoughts, I'm all
ears.

Jan

