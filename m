Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17F27CE0C
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:49:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178.412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNF4O-0001L6-VM; Tue, 29 Sep 2020 12:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178.412; Tue, 29 Sep 2020 12:49:24 +0000
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
	id 1kNF4O-0001Kj-S0; Tue, 29 Sep 2020 12:49:24 +0000
Received: by outflank-mailman (input) for mailman id 178;
 Tue, 29 Sep 2020 12:49:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNF4N-0001Kd-1P
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:49:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9813ff9-8551-4872-b146-9577a3959e67;
 Tue, 29 Sep 2020 12:49:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7344FAC84;
 Tue, 29 Sep 2020 12:49:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNF4N-0001Kd-1P
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:49:23 +0000
X-Inumbo-ID: e9813ff9-8551-4872-b146-9577a3959e67
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e9813ff9-8551-4872-b146-9577a3959e67;
	Tue, 29 Sep 2020 12:49:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601383761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=od8Wdl/WiuBrBidDbiRlDWVWqpfELnx+aJUsclOc8AY=;
	b=fLrMbhiuRyrt6UvD3z3EIdGsTk8hZbqOOswwt0Iq2O4JDbmDBeDN3o+cYANaZl6vqM4GMS
	jPcBEQTnP2luCUjNdkT3//PF4z6oVogOaxu0DO2CjghYMyLwBXby3VPzvxaFnXFi8SL8sa
	z4eLKa3fkhae0ti3q9Uf6wUSrGiQhgA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7344FAC84;
	Tue, 29 Sep 2020 12:49:21 +0000 (UTC)
Subject: Re: [PATCH 09/12] evtchn: move FIFO-private struct declarations
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
 <c96bc8b8-6399-596e-27bf-1b5f1d634dad@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a753b1c-e1d0-058d-c31d-f69498165311@suse.com>
Date: Tue, 29 Sep 2020 14:49:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c96bc8b8-6399-596e-27bf-1b5f1d634dad@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.09.2020 14:26, Julien Grall wrote:
> On 28/09/2020 12:00, Jan Beulich wrote:
>> There's no need to expose them.
> 
> We are going to need them for LiveUpdate and Non-cooperative Live 
> Migration as the save/restore is happening outside of event_fifo.c.
> 
> This is because we tried to keep all the save/restore code in a separate 
> directory.

I'm afraid I don't view this as a reason for the change not to be made
right now. If, when, and in what shape LU will hit upstream is unknown
at the moment (unless I've missed some indication of a time line). In
fact, if we didn't expose things like the ones here to far too wide an
"audience", I wonder whether ...

> Although, I could also see pros for scatter save/restore across the code 
> base.

... you wouldn't have chosen this route anyway, just to avoid exposing
items widely that are supposed to be (almost) private.

Jan

