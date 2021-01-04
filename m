Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880622E9A1C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:11:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61342.107852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSSB-0002aa-QD; Mon, 04 Jan 2021 16:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61342.107852; Mon, 04 Jan 2021 16:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwSSB-0002aB-Mv; Mon, 04 Jan 2021 16:11:31 +0000
Received: by outflank-mailman (input) for mailman id 61342;
 Mon, 04 Jan 2021 16:11:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwSSB-0002a5-46
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:11:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc36cfe6-cd0e-4304-a2e1-c2d01e5d0713;
 Mon, 04 Jan 2021 16:11:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 947F8AD6A;
 Mon,  4 Jan 2021 16:11:29 +0000 (UTC)
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
X-Inumbo-ID: fc36cfe6-cd0e-4304-a2e1-c2d01e5d0713
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609776689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aLgfKIo1GmOGoGHnciCkAXy4NF0V4UxdvT7tJXiEW3I=;
	b=pDDAQHaa0fMEn3GCOTazYzzkgaEqVUtxc8I81fTgETaxOHXpBu8WrLJg9n0mT2RIsDECe3
	SLl7TKTTkm8ZDQaOPO1rSte/YJN94gUiUEB5faKGkTHrh8vyOBXZ5/ecZ6qF0oyNIDOKTS
	2F/dz3YSnYWkdT4Zu7co8utrtdJpAa0=
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <20201228153004.qip3v6er5rk22fnu@Air-de-Roger>
 <0341c1f1-dc50-552c-f246-56605ae7c83a@suse.com>
 <20210104155358.snzakj4kcs47tt22@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b9709b10-2dd0-087d-836d-d1ae089643ad@suse.com>
Date: Mon, 4 Jan 2021 17:11:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104155358.snzakj4kcs47tt22@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.01.2021 16:53, Roger Pau Monné wrote:
> On Mon, Jan 04, 2021 at 02:56:12PM +0100, Jan Beulich wrote:
>> On 28.12.2020 16:30, Roger Pau Monné wrote:
>>> I would like to have Andrew's opinion on this one (as you and him tend
>>> to modify more asm code than myself). There are quite a lot of
>>> addition to the assembly code, and IMO it makes the code more complex
>>> which I think we should try to avoid, as assembly is already hard
>>> enough.
>>
>> Well, while I can see your point (and I indeed asked myself the same
>> question when making this change), this merely follows the route
>> started with the addition on CONFIG_PV conditionals. If we think that
>> prior step didn't set a good precedent, we ought to undo it.
>> Otherwise I see no good argument against doing the same kind of
>> transformation a 2nd time (and further ones, if need be down the
>> road).
> 
> I think we need to apply some common sense and reach consensus about
> where it's fine to make code conditional at build time as to not make
> the existing code much harder to read and reason about. This is mostly
> a subjective decision, so I understand your concern.
> 
> I still think I would like Andrew opinion on this one, as said you and
> him are the ones mostly doing assembly coding. I find it already hard
> to follow myself without the conditionals.

Oh, sure - my prior response in no way meant to be an objection to
your request for Andrew's take on this.

Jan

