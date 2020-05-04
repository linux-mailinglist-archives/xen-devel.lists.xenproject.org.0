Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F371C39B1
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 14:44:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVaSJ-0000tF-7g; Mon, 04 May 2020 12:44:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVaSH-0000tA-PB
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 12:44:17 +0000
X-Inumbo-ID: f75eb6c4-8e04-11ea-9d1c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f75eb6c4-8e04-11ea-9d1c-12813bfff9fa;
 Mon, 04 May 2020 12:44:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4276FAF30;
 Mon,  4 May 2020 12:44:18 +0000 (UTC)
Subject: Re: [PATCH 01/16] x86/traps: Drop last_extable_addr
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ec06cb1-6b31-2fde-6de4-23938acab73a@suse.com>
Date: Mon, 4 May 2020 14:44:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-2-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> The only user of this facility is dom_crash_sync_extable() by passing 0 into
> asm_domain_crash_synchronous().  The common error cases are already covered
> with show_page_walk(), leaving only %ss/%fs selector/segment errors in the
> compat case.
> 
> Point at dom_crash_sync_extable in the error message, which is about as good
> as the error hints from other users of asm_domain_crash_synchronous(), and
> drop last_extable_addr.

While I'm not entirely opposed, I'd like you to clarify that you indeed
mean to (mostly) revert your own improvement from 6 or 7 years back
(commit 8e0da8c07f4f). I'm also surprised to find this as part of the
series it's in - in what way does this logic get in the way of CET-SS?

Jan

