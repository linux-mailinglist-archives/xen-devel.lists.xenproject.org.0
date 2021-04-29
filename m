Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802C36F0E0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 22:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120208.227336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcD37-0006jw-B6; Thu, 29 Apr 2021 20:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120208.227336; Thu, 29 Apr 2021 20:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcD37-0006jX-81; Thu, 29 Apr 2021 20:14:13 +0000
Received: by outflank-mailman (input) for mailman id 120208;
 Thu, 29 Apr 2021 20:14:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yMpM=J2=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lcD36-0006jS-5f
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 20:14:12 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38c3b407-288e-4d0a-8f6b-7d62307723de;
 Thu, 29 Apr 2021 20:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 201FE2EC90;
 Thu, 29 Apr 2021 16:14:11 -0400 (EDT)
Received: from vps.thesusis.net ([IPv6:::1])
 by localhost (vps.thesusis.net [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id 89QMLZuC1OIo; Thu, 29 Apr 2021 16:14:10 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id D9C722ECB9; Thu, 29 Apr 2021 16:14:10 -0400 (EDT)
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
X-Inumbo-ID: 38c3b407-288e-4d0a-8f6b-7d62307723de
References: <87o8dw52jc.fsf@vps.thesusis.net>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: xen-devel@lists.xenproject.org
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Date: Thu, 29 Apr 2021 16:10:09 -0400
In-reply-to: <87o8dw52jc.fsf@vps.thesusis.net>
Message-ID: <87fsz84zn1.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


It appears that input/input.c is responsible for the insane modalias
length.  If I am reading input_print_modalias() correctly, it appends a
"k" plus every key code that the keyboard supports, and the Xen Virtual
Keyboard supports a lot of keycodes.  Why does it do this?

Phillip Susi writes:

> So I have finally drilled down to the modalias for the Xen Virtual
> Keyboard driver being so long ( over 2KB ) that it causes an -ENOMEM
> when trying to add it to the environment for uevents.  This causes
> coldplug to fail, which causes the script doing coldplug as part of the
> debian-installer init to fail, which causes a kernel panic when init
> exits, which then for reasons I have yet to understand, causes the Xen
> domU to reboot.
>
> Why is this modalias so huge?  Can we pare it down, or or is there
> another solution to get uevents working on this device again?  Maybe the
> environment block size needs to be increased?  I don't know.


