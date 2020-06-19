Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F3201745
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 18:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmK9t-0002Ox-Ai; Fri, 19 Jun 2020 16:46:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DmpW=AA=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jmK9s-0002OM-Kx
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 16:46:28 +0000
X-Inumbo-ID: 6835d63c-b24c-11ea-bb8b-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6835d63c-b24c-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 16:46:23 +0000 (UTC)
Received: from webmail.moloch.sk (w3-s.a.lucina.net [62.176.169.73])
 by smtp.lucina.net (Postfix) with ESMTPSA id 0E521122804;
 Fri, 19 Jun 2020 18:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1592585182;
 bh=oAGUPnrn4Qyr0dXzpsV9TWyYeXe15zTyF+cf1o6lts0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mWEOVhcL6UHDibFbWtvYEO8ki/QNwXfxWJZV7HgRAw0kerywsa3ieRyu7m0ekcRGQ
 WVb5/9Sg6WopcXdclVeyVAl0pbdZSKs4Z2A93DW3lgFg0bf1xxv/ox1drRuXLYit2S
 8uztEoM8mGWOAX/8CzwivdCyVNR5hWPhFjr1FBkQEo9J1y0QcdFAzeio6DmO901ps8
 ciCHkgJvVCAui/riDLanE9Elyv6pLURJpHQIJ5sW+gy1sVEcdFhyW2zHWBITQTKKVG
 fH9H9KpjKFvDWwu1Ozs1F0k8XTxJsVs4qeZ2vIihqmNPwn5Io3WHzH2CM9/EzXmXHX
 GW+5O/4cg94gg==
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 19 Jun 2020 18:46:22 +0200
From: Martin Lucina <martin@lucina.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Event delivery and "domain blocking" on PVHv2
In-Reply-To: <0ebf1417-49e5-d9b2-81b0-b02c7e6cf833@citrix.com>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
 <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
 <0ebf1417-49e5-d9b2-81b0-b02c7e6cf833@citrix.com>
Message-ID: <89c4e6e5bc1b986989e549a467eed439@lucina.net>
X-Sender: martin@lucina.net
User-Agent: Roundcube Webmail/1.3.3
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-19 13:21, Andrew Cooper wrote:
> On 19/06/2020 11:28, Martin Lucina wrote:
>> RIP 0x209997 is the 'hlt' instruction in
>> mirage_xen_evtchn_block_domain() so we are indeed blocking waiting for
>> events to show up.
> 
> I can't find this in the code, but it might be an x86-ism you're 
> falling
> over here.

Solo5 only contains the lowest-level bits, and only then those parts 
that
"fit" the responsibility of that layer. The rest is here (WIP, not 
cleaned
up yet):

https://github.com/mato/mirage-xen/tree/xen-pvh-via-solo5

The event channel code, including the function that blocks the domain,
is in lib/bindings/evtchn_stubs.c.

> 
> Its not safe to use hlt with interrupts enabled, unless it is exactly
> `sti; hlt` where the STI instruction transitions the interrupt flag 
> from
> clear to set (i.e. you had interrupts disabled beforehand).
> 
> Otherwise you can take the interrupt intended to wake you on the before
> the hlt is executed.

Hmm, so what is the right thing to do when blocking on PVHv2 in this
scenario? Just use SCHEDOP_block? "cli; sti; hlt"? (Tried the latter,
doesn't help).

Martin

