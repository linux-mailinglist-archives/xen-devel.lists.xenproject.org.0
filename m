Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C585EC10
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 23:55:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684152.1063859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcvTR-00024C-SM; Wed, 21 Feb 2024 22:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684152.1063859; Wed, 21 Feb 2024 22:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcvTR-00022W-PT; Wed, 21 Feb 2024 22:53:57 +0000
Received: by outflank-mailman (input) for mailman id 684152;
 Wed, 21 Feb 2024 22:53:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcvTQ-00022Q-GZ
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 22:53:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcvTL-0007Pw-06; Wed, 21 Feb 2024 22:53:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcvTK-0005OV-OY; Wed, 21 Feb 2024 22:53:50 +0000
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
	bh=HG2wS8bjsKT7RcLwSoCzx+ndRPVLoiaDbJOeW7HDit4=; b=ZbmHzZL9IsZejGeKRWEysPdlHn
	QJfUSS5jS4/7MCriMWXXEZnptbQZmgtprq73KpoTqALYEqYZLAscKN148R3UVe1WIj6u690TBewfn
	pCrhcK+8Hoi7OpJcULSDoqdYJziy1Dnu85vXUPC5FdFpU0bFGgJZvF3DXmngcYu3TNMM=;
Message-ID: <0936a6c5-bac2-4de2-9155-1722d3bb28ca@xen.org>
Date: Wed, 21 Feb 2024 22:53:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stats on Xen tarball downloads
Content-Language: en-GB
To: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
 <ZdMt88BSNMYtq39n@macbook> <36229344-e2e2-46e1-839b-b7b3b0843f23@suse.com>
 <CA+zSX=YvTgEMC0S5OqSFvxfVDeruiO=FphyVx5fv75oT-QW01A@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=YvTgEMC0S5OqSFvxfVDeruiO=FphyVx5fv75oT-QW01A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi George,

On 21/02/2024 02:55, George Dunlap wrote:
> On Mon, Feb 19, 2024 at 6:38 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.02.2024 11:31, Roger Pau Monné wrote:
>>> On Mon, Feb 19, 2024 at 06:01:54PM +0800, George Dunlap wrote:
>>>> One of the questions we had with respect to changing our release
>>>> practice (for instance, making the process more light-weight so that
>>>> we could do a point release after every XSA) was, "How many people are
>>>> actually using the tarballs?"
>>>
>>> What would this more lightweight process involve from a downstream
>>> PoV?  IOW: in what would the contents of the tarball change compared
>>> to the current releases?
>>
>>  From all prior discussion my conclusion was "no tarball at all".
> 
> Or at very least, the tarball would be a simple `git archive` of a
> release tag.   Right now the tarball creation has a number of
> annoyingly manual parts about it.
At the moment we have the following steps:

1) Checkout tag
2) Create the tarball
3) Check the source tarball can build
4) Sign the tarball
5) Upload it

I managed to script it so I have only two commands to execute (mostly 
because I build and sign on a different host).

AFAIU, your command 'git archive' will only replace 2. Am I correct? If 
so, it is not entirely clear how your proposal is going to make it better.

Cheers,

-- 
Julien Grall

