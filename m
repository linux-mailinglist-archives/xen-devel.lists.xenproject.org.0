Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF10290473
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 13:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8040.21401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTOKH-00066F-9J; Fri, 16 Oct 2020 11:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8040.21401; Fri, 16 Oct 2020 11:55:13 +0000
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
	id 1kTOKH-00065q-5t; Fri, 16 Oct 2020 11:55:13 +0000
Received: by outflank-mailman (input) for mailman id 8040;
 Fri, 16 Oct 2020 11:55:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kTOKF-00065l-IH
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 11:55:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5f43027-5cc0-47ad-abe5-8d0bfc8aa616;
 Fri, 16 Oct 2020 11:55:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98E3AAF6C;
 Fri, 16 Oct 2020 11:55:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=S5YV=DX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kTOKF-00065l-IH
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 11:55:11 +0000
X-Inumbo-ID: c5f43027-5cc0-47ad-abe5-8d0bfc8aa616
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c5f43027-5cc0-47ad-abe5-8d0bfc8aa616;
	Fri, 16 Oct 2020 11:55:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602849309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zlJi1Cesr381khVhjfq6NZWQkLO3lRKR7GjIYz+O338=;
	b=qgg5JQawlbYHfwfXdayDKu/IKj3R53gC1kgziS6d8BynttBWqS4jihvWO1vrQrr1/pY0wI
	KXmcT5632CnW9feLePjHqNo8j8eXHzOph8RroOC7NA4qg2S6A4w9tgtehkWsXY8A9iLHDD
	tlbej6oqhQqtCgVxVhBZOKUuOK0AOA4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 98E3AAF6C;
	Fri, 16 Oct 2020 11:55:09 +0000 (UTC)
Subject: Re: [PATCH] x86/traps: 'Fix' safety of read_registers() in #DF path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20201012134908.27497-1-andrew.cooper3@citrix.com>
 <afc5c857-a97b-a268-e6b2-538f31609505@suse.com>
 <307753b0-fef8-658d-f897-8c0eb99ce3e5@citrix.com>
 <948f0753-561b-15e8-bf8c-52ff507133d2@suse.com>
 <dbd19cd0-316a-c62f-de7b-627ada4df350@citrix.com>
 <00ba5885-5ee6-c772-a72e-15431cd3b1f4@suse.com>
 <09049e52-548b-3ffc-5259-b1ffc26413a5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f3272d5-8ec7-26ec-33ec-2281539920e2@suse.com>
Date: Fri, 16 Oct 2020 13:55:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <09049e52-548b-3ffc-5259-b1ffc26413a5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 13:24, Andrew Cooper wrote:
> On a tangent, what are your views WRT backport beyond 4.14?
> 
> Back then, it was #DB which was adjacent to the guard frame (which was
> not present), but it doesn't use show_registers() by default, so I think
> the problem is mostly hidden.

I wasn't fully decided yet, but as long as it applies reasonably
cleanly I think I'm leaning towards also putting it on 4.13.
4.12 closes anyway once 4.12.4 is out, and I don't think I want
to pick up not-really-urgent changes for putting there beyond
the few ones that I already have (and that I mean to put in
alongside the XSA fixes on Tuesday); I could be talked into it,
though.

Jan

