Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC28931B5E0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 09:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85085.159514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZFp-00060Q-CH; Mon, 15 Feb 2021 08:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85085.159514; Mon, 15 Feb 2021 08:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZFp-000601-9H; Mon, 15 Feb 2021 08:29:13 +0000
Received: by outflank-mailman (input) for mailman id 85085;
 Mon, 15 Feb 2021 08:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lBZFo-0005zw-AJ
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 08:29:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fec3e451-c3fc-4633-aef3-05a460a88629;
 Mon, 15 Feb 2021 08:29:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8BD59AE03;
 Mon, 15 Feb 2021 08:29:09 +0000 (UTC)
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
X-Inumbo-ID: fec3e451-c3fc-4633-aef3-05a460a88629
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613377749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbWKccuo2a3z5eO8bLDWyss52tPylGtvuT6EX1VGiGk=;
	b=Dw5oEpDGrFciPPG6xRO//TnP2MkmSBCnTP0N9Xx6mtm7iolQLIK5tAGza/3SrTh6NPXGj7
	mJie/LMCgs/ElOez5z+U3H2UIyujmVWg7BTmVqFO2rF4TUF+ZWXW6RPuGtfGGrOJ5dZ3US
	G6ARbWNcVBm99Vw0Y1V6yfSztoRZIac=
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, cardoe@cardoe.com,
 andrew.cooper3@citrix.com, wl@xen.org, iwj@xenproject.org,
 anthony.perard@citrix.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210213020540.27894-1-sstabellini@kernel.org>
 <20210213135056.GA6191@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com>
Date: Mon, 15 Feb 2021 09:29:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210213135056.GA6191@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 13.02.2021 14:50, Marek Marczykowski-Górecki wrote:
> On Fri, Feb 12, 2021 at 06:05:40PM -0800, Stefano Stabellini wrote:
>> If rombios, seabios and ovmf are all disabled, don't attempt to build
>> hvmloader.
> 
> What if you choose to not build any of rombios, seabios, ovmf, but use
> system one instead? Wouldn't that exclude hvmloader too?

Even further - one can disable all firmware and have every guest
config explicitly specify the firmware to use, afaict.

> This heuristic seems like a bit too much, maybe instead add an explicit
> option to skip hvmloader?

+1 (If making this configurable is needed at all - is having
hvmloader without needing it really a problem?)

Jan

