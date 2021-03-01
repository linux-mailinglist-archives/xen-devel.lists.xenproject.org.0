Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92922327948
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91359.172669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdzc-0002DL-Tl; Mon, 01 Mar 2021 08:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91359.172669; Mon, 01 Mar 2021 08:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdzc-0002Cw-Qr; Mon, 01 Mar 2021 08:33:28 +0000
Received: by outflank-mailman (input) for mailman id 91359;
 Mon, 01 Mar 2021 08:33:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdzb-0002Cq-83
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:33:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53762bc6-7901-4236-8bd3-2b3a3bd2d099;
 Mon, 01 Mar 2021 08:33:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 96E59AAC5;
 Mon,  1 Mar 2021 08:33:25 +0000 (UTC)
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
X-Inumbo-ID: 53762bc6-7901-4236-8bd3-2b3a3bd2d099
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614587605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pqhfnyH9L6Rou+FpVgtBbRJOQNYLqRsohcmJGbMbmTo=;
	b=bDhmyRQHtrJtCOYRqEx5TXMES4u6lSOK3kSLenMpLTBdGebjA21m1b7SRr6Ejc8+b2uZQ3
	R6/W3kaOZAoulifIMWEsLHLbp6m9BOVBXxwYxvp4FroSst/ECryKhYz/PatULx06Ep9G6h
	rSAL32tRsJGnqDmyWPvf8GYjb0ixaUE=
Subject: Re: [PATCH 0/2][4.15?] fix build when NR_CPUS == 1
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
Message-ID: <8a1adfcf-fb9b-ec44-5222-25016a031ad4@suse.com>
Date: Mon, 1 Mar 2021 09:33:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.03.2021 09:27, Jan Beulich wrote:
> While we've long done away with CONFIG_SMP, we still allow
> CONFIG_NR_CPUS to be set to 1. Hence at least randconfig builds
> may fail, and the first of the two issues addressed was actually
> observed in the RISC-V bring-up work. I didn't check whether Arm
> would also have issues like these.
> 
> 1: sched: fix build when NR_CPUS == 1
> 2: x86: fix build when NR_CPUS == 1

I've tagged this with a question mark because on one hand such
configurations are unusual and hence unlikely to be overly
relevant for the release. Otoh randconfig failures would better
be avoided.

Jan

