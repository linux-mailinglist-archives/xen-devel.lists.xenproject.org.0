Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2C336F326
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 02:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120258.227444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcGt8-0003Hh-Gn; Fri, 30 Apr 2021 00:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120258.227444; Fri, 30 Apr 2021 00:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcGt8-0003HI-DX; Fri, 30 Apr 2021 00:20:10 +0000
Received: by outflank-mailman (input) for mailman id 120258;
 Fri, 30 Apr 2021 00:20:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=963z=J3=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lcGt6-0003HD-HL
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 00:20:08 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 76ac7c02-43e2-4ae8-b860-e1b2d6938946;
 Fri, 30 Apr 2021 00:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 6E9B22ECD1;
 Thu, 29 Apr 2021 20:20:07 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oj1xF6OGsgDn; Thu, 29 Apr 2021 20:20:07 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 3B0DE2ECD0; Thu, 29 Apr 2021 20:20:07 -0400 (EDT)
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
X-Inumbo-ID: 76ac7c02-43e2-4ae8-b860-e1b2d6938946
References: <87o8dw52jc.fsf@vps.thesusis.net> <87fsz84zn1.fsf@vps.thesusis.net> <YIszOwADJ8jdBov8@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Date: Thu, 29 Apr 2021 20:11:03 -0400
In-reply-to: <YIszOwADJ8jdBov8@google.com>
Message-ID: <87o8dw8vyg.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Dmitry Torokhov writes:

> Not every keyboard, but all keycodes above KEY_MIN_INTERESTING which is
> KEY_MUTE, so that interested handlers could match on devices they are
> interested in without first opening them or poking through sysfs.

/Shouldn't/ they be reading sysfs attributes to find that information
out though?  Isn't modalias there to help modprobe find the right module
that wants to bind to this device, which doesn't happen for input
devices?  If user space is looking at this information then isn't it
getting it by reading from sysfs anyway?

What in user space looks at input devices other than X and Wayland?  And
those aren't looking for particular "interesting" keys are they?

> I don't know why Xen keyboard exports that many keycodes ;) In general,
> my recommendation is to mirror the physical device when possible, and
> instantiate several devices so there is 1:1 relationship between virtual
> and physical devices.

Xen guys: any input as to why it supports so many "interesting" keys?


