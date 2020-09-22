Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 414ED273D49
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 10:29:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKdfG-0005PV-CF; Tue, 22 Sep 2020 08:28:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0tL6=C7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kKdfE-0005PQ-J9
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 08:28:40 +0000
X-Inumbo-ID: 53f17f65-e5df-4428-9181-0eed4a057bac
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53f17f65-e5df-4428-9181-0eed4a057bac;
 Tue, 22 Sep 2020 08:28:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600763319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8UKue6UM3k7rs00oRlc4/xqaO5IBn0HQYNhdMcr1kkc=;
 b=Jv3/baHUr2WE1SNT33DV3G9xiRPB3xAt4Es9XyYOCWpaWWPrR39yftY004Wv5EiIBej8a9
 LIC4w4Bhci+CSEnezdnfuBlGpxrm9vxaD1xcp4OQaoRFGvcyyjzPp66UsK160E8muiCPnx
 wNcYMcmGIjqp2PYAbnsAhLMMw4Oj9Wg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 81DA4AC82;
 Tue, 22 Sep 2020 08:29:15 +0000 (UTC)
Subject: Re: Ping: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
 <de999174-604d-5874-cf11-4fab15c583d4@suse.com>
 <43a4240c-baba-ca52-0a9f-a884c0f297be@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6de6cc3-7bde-6f99-1525-cc046a136a19@suse.com>
Date: Tue, 22 Sep 2020 10:28:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <43a4240c-baba-ca52-0a9f-a884c0f297be@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21.09.2020 13:39, Julien Grall wrote:
> On 21/09/2020 11:17, Jan Beulich wrote:
>> On 14.09.2020 12:15, Jan Beulich wrote:
>>> Switch to $(call if_changed,ld) where possible; presumably not doing so
>>> in e321576f4047 ("xen/build: start using if_changed") right away was an
>>> oversight, as it did for Arm in (just) one case. It failed to add
>>> prelink.o to $(targets), though, causing - judging from the observed
>>> behavior on x86 - undue rebuilds of the final binary (because of
>>> prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
>>> because of .prelink.o.cmd not getting read) during "make install-xen".
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>>   xen/arch/arm/Makefile |  4 +++-
>>>   xen/arch/x86/Makefile | 18 ++++++++++--------
>>>   2 files changed, 13 insertions(+), 9 deletions(-)
>>
>> May I ask for an Arm-side ack (or otherwise) here, please?
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks. On the Arm side this is actually addressing a (minor) bug,
so I wonder whether I should queue this up for backporting. Do you
have an opinion either way?

Jan

