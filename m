Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598C0292306
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8620.23111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPkY-0007C2-5t; Mon, 19 Oct 2020 07:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8620.23111; Mon, 19 Oct 2020 07:38:34 +0000
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
	id 1kUPkY-0007Bg-2f; Mon, 19 Oct 2020 07:38:34 +0000
Received: by outflank-mailman (input) for mailman id 8620;
 Mon, 19 Oct 2020 07:38:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUPkX-0007Bb-8k
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:38:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fa34437-509c-4bbc-9af8-8ebbc3cb6b8b;
 Mon, 19 Oct 2020 07:38:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5806ACD5;
 Mon, 19 Oct 2020 07:38:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUPkX-0007Bb-8k
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:38:33 +0000
X-Inumbo-ID: 8fa34437-509c-4bbc-9af8-8ebbc3cb6b8b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8fa34437-509c-4bbc-9af8-8ebbc3cb6b8b;
	Mon, 19 Oct 2020 07:38:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603093111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b/rptmWF1YODygFtjxwcSlxU0uXAJxRUrPQcm5wLcJw=;
	b=QZiVZmm7sXRhMlHRcFsw46aFihDABPBlPqjUkPJJpSPH+Nm3nnYF2823Chi4SpQYB/y/Vd
	VAwht7eobCeyOzD9rf5tTESEx4AFtC5dtUafadudQyClHdaBYpzHQeyUu5bo2220XpfnQV
	PjPdd1TyHH2BAtUqBr6knGmpy6D0xHo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C5806ACD5;
	Mon, 19 Oct 2020 07:38:31 +0000 (UTC)
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
 <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
 <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com>
 <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
 <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com>
 <CAKf6xpv9qHJydjQ_TyZEKZAK14T4m2GLLqEwyMTraUxqvg+1Xw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d10143d9-0082-fa09-3ef0-2d13e5ee54ef@suse.com>
Date: Mon, 19 Oct 2020 09:38:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpv9qHJydjQ_TyZEKZAK14T4m2GLLqEwyMTraUxqvg+1Xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.10.2020 18:28, Jason Andryuk wrote:
> Looks like we can pass XC_DOM_PV_CONTAINER/XC_DOM_HVM_CONTAINER down
> into elf_xen_parse().  Then we would just validate phys_entry for HVM
> and virt_entry for PV.  Does that sound reasonable?

I think so, yes. Assuming of course that you'll convert the XC_DOM_*
into a boolean, so that the hypervisor's use of libelf/ can also be
suitably adjusted.

Jan

