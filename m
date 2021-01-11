Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF32F14CF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64836.114622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxHt-000092-Sm; Mon, 11 Jan 2021 13:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64836.114622; Mon, 11 Jan 2021 13:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxHt-00008b-Oj; Mon, 11 Jan 2021 13:31:13 +0000
Received: by outflank-mailman (input) for mailman id 64836;
 Mon, 11 Jan 2021 13:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyxHs-00008W-EU
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:31:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af7a4497-36e8-49cf-abe5-c2e2e3f358ae;
 Mon, 11 Jan 2021 13:31:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D318FAB92;
 Mon, 11 Jan 2021 13:31:10 +0000 (UTC)
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
X-Inumbo-ID: af7a4497-36e8-49cf-abe5-c2e2e3f358ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610371870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmJqRfbO9GIu/BE78wUPUZSAE3wb0fspx5cHDEnD+xs=;
	b=AUTrDBjp0rYuxKFt9G5EsdlkOZsaGkFC0oU4cGhS93GE+AsdRCIAkYz2h9599Gm2JH+HYq
	uvGKfI8nfBQ7fdnemxyTBGs3U0U3l359skyVvg/B5YACb1rEYcwBwdPyL3Ei9P4bmOCH04
	rZYO+xx+zJhqOwWZ2aSUR8IEKKAgiec=
Subject: Re: [PATCH 3/5] x86/PV: _PAGE_RW changes may take fast path of
 mod_l[234]_entry()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
 <11633161-6809-db0c-44e6-e5f383f4ebd2@suse.com>
 <20210111110841.timv43eteslr54xz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0e9df02-5eed-55cc-7fba-0a9acd93d15b@suse.com>
Date: Mon, 11 Jan 2021 14:31:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210111110841.timv43eteslr54xz@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 12:08, Roger Pau Monné wrote:
> On Tue, Nov 03, 2020 at 11:57:10AM +0100, Jan Beulich wrote:
>> The only time _PAGE_RW matters when validating an L2 or higher entry is
>> when a linear page table is tried to be installed. Therefore when we
>> disallow such at build time, we can allow _PAGE_RW changes to take the
>> fast paths there.
> 
> I think it would be helpful to note why PDEs with linear page tables
> aren't allowed to have the RW bit set, likely here and in the comment
> below.

I've changed the description to

"The only time _PAGE_RW matters when validating an L2 or higher entry is
 when a linear page table is tried to be installed (see the comment ahead
 of define_get_linear_pagetable()). Therefore when we disallow such at
 build time, we can allow _PAGE_RW changes to take the fast paths there."

Considering there already is a code comment explaining this, I'm
less convinced of also editing the comment. An option might be to
move up the #define-s next to define_get_linear_pagetable(), but
imo this should then involve moving FASTPATH_FLAG_WHITELIST as
well.

Jan

