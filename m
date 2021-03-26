Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300334A83F
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:39:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101815.194984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmgT-0007Pd-1k; Fri, 26 Mar 2021 13:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101815.194984; Fri, 26 Mar 2021 13:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmgS-0007Ou-Ui; Fri, 26 Mar 2021 13:39:28 +0000
Received: by outflank-mailman (input) for mailman id 101815;
 Fri, 26 Mar 2021 13:39:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmgR-0007OZ-Br
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:39:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmgR-0007lC-B4
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:39:27 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lPmgR-00004x-9p
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:39:27 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lPmgJ-0002gl-4G; Fri, 26 Mar 2021 13:39:19 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=G2vhk5BPoGY6U2w0yPmDSJWDv4UAOPYYX1cWmYU6xs4=; b=NQt10yOJHy4tcyDQZVWh5F+4OV
	fyLam+N4lZmIhi5SXsDA7OquqMw14fAWwVtNcEbHcETO9URqP3tFJHEeZIzCVi+Z5utv9aiPAwAYI
	l+kwt6KB5F48oo3FAZiT59Xl9HuDBVeDWP5hh7xcNQWnWjLZ9DMeQ5w9q2zs2qqjSliE=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24669.58374.923784.665582@mariner.uk.xensource.com>
Date: Fri, 26 Mar 2021 13:39:18 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=  <marmarek@invisiblethingslab.com>,
    =?iso-8859-1?Q?Fr=E9d=E9ric?= Pierret <frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
In-Reply-To: <6077715e-8ea6-7dc6-c226-ccfad2b8f3ba@suse.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
	<20210325172132.14980-1-andrew.cooper3@citrix.com>
	<24669.52641.499147.88002@mariner.uk.xensource.com>
	<24669.54213.173154.400771@mariner.uk.xensource.com>
	<CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
	<6077715e-8ea6-7dc6-c226-ccfad2b8f3ba@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally"):
> I guess I don't see the serial console aspect here: This sort of
> boot issue can be seen on the normal screen as well. It occurs
> neither too early nor too late to be visible. We could amend the
> output by a hint towards this option.

Changes to message strings would be fine even if done next week.

It looks like I am going to have to do the code review of this change
myself, if I want it today ?  This is far from ideal as I am no expert
in this area.

Ian.

