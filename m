Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9168777B8
	for <lists+xen-devel@lfdr.de>; Sun, 10 Mar 2024 18:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691150.1076848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjMrZ-0001QU-54; Sun, 10 Mar 2024 17:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691150.1076848; Sun, 10 Mar 2024 17:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjMrZ-0001NI-28; Sun, 10 Mar 2024 17:21:29 +0000
Received: by outflank-mailman (input) for mailman id 691150;
 Sun, 10 Mar 2024 17:21:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QUU5=KQ=outstep.com=lonnie@srs-se1.protection.inumbo.net>)
 id 1rjMrY-0001NC-FH
 for Xen-devel@lists.xenproject.org; Sun, 10 Mar 2024 17:21:28 +0000
Received: from mail.outstep.net (mail.outstep.net [213.136.84.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0113fc2-df02-11ee-afdc-a90da7624cb6;
 Sun, 10 Mar 2024 18:21:26 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FAEE234103E
 for <Xen-devel@lists.xenproject.org>; Sun, 10 Mar 2024 18:21:20 +0100 (CET)
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
X-Inumbo-ID: a0113fc2-df02-11ee-afdc-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outstep.com; s=dkim;
	t=1710091286; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=IuAIS+Yo07L+MdDuJ67c6r2QR6m4nIQe1JVvrg4/eEU=;
	b=N4LFpq27zCztWcTzFbmxzbBL0GiRQUpMR2GX/5dC+SWjUM2H96i+9MEcF+/w6sSqYhAqqy
	mozXPurzhaH+O9EKJGX57Jg+xgF19PuDRVzP45GBwmFUyKwPSrgbsdxsgDucs7hLOAjas/
	MWcdBdHUz9dge1wqXMnknEDJUX4T4fxTX52HcxJblqAt58VW/EguFy0iOL8mqFHEIA6rHU
	+P6w5FUohmGjPP9+eOOIbbdZARvP/sqkkGt/LNhWY6RUJ9fhUnkMCNzy6c9tBWJHhTwb9R
	KOHNfHcGFmhApv9YfRI99QkuYKTx3R1l6DbVSpoBv/SUYv9/n9J2rb2isTDCZQ==
Message-ID: <637c0919-e12c-4e1e-b7b7-95706a63951e@outstep.com>
Date: Sun, 10 Mar 2024 13:21:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xen-devel@lists.xenproject.org
Content-Language: en-US
From: Lonnie Cumberland <lonnie@outstep.com>
Subject: Local VM console PoC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello All,

I am beginning my exploration with Xen (Alpine-Xen and XCP-ng) for a PoC 
project in which I think that I might have to figure out how to modify 
the latest Xen source code to make it happen, but wanted to see if I 
might be able to get some guidance and advice from the developers forum 
here.

What I am initially seeking to do, and while I also know that you can 
get access to th VM consoles via VNC (Not sure if RDP is compiled in as 
well) and also knowing that after booting Dom0 has the console (text and 
graphics if available), what I am seeking to do is to have Xen boot and 
the instead of Dom0 hacing the console, I would like to be able to 
auto-boot a DomU and then let it have the console in full screen mode. 
This will probably be a DomU VM with a graphics frontend running after 
it boots. (i.e. Ubuntu, Windows, etc.) but not Dom0.

Of course, once I can figure this part out, the second step would be to 
have multiple DomUs running and to then be able to page between them via 
some universal Hot-Key sequence.

Basically, I want to modify the Xen code so that it can do this on the 
local physical machine.

While, I do not think that Xen can do this right now, although I could 
be wrong, I would like to edit the sources to allow for this, if possible.

Any ideas, or guidance as to where to look in the code to get started 
would be greatly appreciated.
Thanks in advance,
Lonnie

