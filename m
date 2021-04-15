Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 968A2360B43
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111189.212610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2YY-0004eB-Ux; Thu, 15 Apr 2021 14:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111189.212610; Thu, 15 Apr 2021 14:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX2YY-0004dm-RG; Thu, 15 Apr 2021 14:01:18 +0000
Received: by outflank-mailman (input) for mailman id 111189;
 Thu, 15 Apr 2021 14:01:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX2YX-0004dh-2m
 for xen-devel@lists.xen.org; Thu, 15 Apr 2021 14:01:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c574ad02-c730-498b-8600-86717c1a2968;
 Thu, 15 Apr 2021 14:01:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 904C7AFAB;
 Thu, 15 Apr 2021 14:01:15 +0000 (UTC)
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
X-Inumbo-ID: c574ad02-c730-498b-8600-86717c1a2968
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618495275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxTtTuySnsDyqsCR0lMb0cEKRyC26Dy4kIi+JxtD2BU=;
	b=eCkifXH04nqoY1IRazpfmXvz94uVRkMEzIHd4yrx4OowJIQgUKXXKERGd+3gVknupLw6Pz
	0oDuooXO4bfKphptXjF1O5QV6/kYoEJvMCAuSYTyiVnV25wbWaFJPNAIl+VgS/0yA642C1
	D1WNbkznw6ro9hQwSoRIpQar1IV7pmk=
Subject: Re: Failed to enable debug messages in xen 4.13
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>
References: <CAAQRGoD4yEEhiQk8LkKuOU_F2As3BsichHNY_ijoiVWwd3JZPw@mail.gmail.com>
Cc: xen-devel@lists.xen.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e8c69e6e-e600-7f78-fb66-eddec17d618a@suse.com>
Date: Thu, 15 Apr 2021 16:01:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CAAQRGoD4yEEhiQk8LkKuOU_F2As3BsichHNY_ijoiVWwd3JZPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.04.2021 15:55, Charles Gonçalves wrote:
> I've enabled the log_lvl=all guest_loglvl=all,

The first one is mis-spelled and needs to be "loglvl=".

> tried the xl debug-key +,

If this didn't help, did you perhaps not do a debug build of Xen?
Debug messages get completely compiled out of release builds.

> configured the build with
> ./configure --enable-debug

This, in any event, has an effect on the tool stack build only.
The hypervisor build gets configured via kconfig, with the settings
tracked in xen/.config.

Jan

