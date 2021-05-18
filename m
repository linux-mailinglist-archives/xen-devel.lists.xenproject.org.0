Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E78387D4E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:24:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129444.242961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2Vc-0002pz-AD; Tue, 18 May 2021 16:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129444.242961; Tue, 18 May 2021 16:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2Vc-0002nt-79; Tue, 18 May 2021 16:23:52 +0000
Received: by outflank-mailman (input) for mailman id 129444;
 Tue, 18 May 2021 16:23:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJ9Y=KN=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lj2Vb-0002nn-0H
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:23:51 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e330265-db04-42b0-8e92-cec01f22dee4;
 Tue, 18 May 2021 16:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 44EF421786;
 Tue, 18 May 2021 12:23:50 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xl3Chf79Qxz2; Tue, 18 May 2021 12:23:50 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 17BE82178C; Tue, 18 May 2021 12:23:50 -0400 (EDT)
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
X-Inumbo-ID: 9e330265-db04-42b0-8e92-cec01f22dee4
References: <87o8dw52jc.fsf@vps.thesusis.net> <20210506143654.17924-1-phill@thesusis.net> <YJRRCEJrQOwVymdP@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Xen Keyboard: don't advertise every key known to man
Date: Tue, 18 May 2021 12:20:00 -0400
In-reply-to: <YJRRCEJrQOwVymdP@google.com>
Message-ID: <871ra4yprd.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Dmitry Torokhov writes:

> By doing this you are stopping delivery of all key events from this
> device.

It does?  How does the PS/2 keyboard driver work then?  It has no way of
knowning what keys the keyboard has other than waiting to see what scan
codes are emitted.

If the keys must be advertised in order to emit them at runtime, then I
see no other possible fix than to remove the codes from the modalias
string in the input subsystem.  Or maybe allow certain drivers that
don't know to set some sort of flag that allows them to emit all codes
at runtime, but NOT advertise them so you end up with a mile long
modalias.


