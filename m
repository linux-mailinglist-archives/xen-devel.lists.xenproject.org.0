Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DD36EC24
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 16:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120059.227014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7ME-0006oH-Fx; Thu, 29 Apr 2021 14:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120059.227014; Thu, 29 Apr 2021 14:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc7ME-0006ns-Cq; Thu, 29 Apr 2021 14:09:34 +0000
Received: by outflank-mailman (input) for mailman id 120059;
 Thu, 29 Apr 2021 14:09:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc7MD-0006nn-4U
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 14:09:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a72244b9-74ee-4745-b9b7-8d40458d34f1;
 Thu, 29 Apr 2021 14:09:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 354BFAFEF;
 Thu, 29 Apr 2021 14:09:31 +0000 (UTC)
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
X-Inumbo-ID: a72244b9-74ee-4745-b9b7-8d40458d34f1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619705371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKda29C6GYFrABuEbzPGpGpuYIDjiSuo344X77Amdyc=;
	b=lFDv8p6eQa6htqjMVnoIzFSjBAiWlCdU7VS5ZS0i+/fXVFmtO707nhHwWkCbxZ4phWuCHW
	7YXE4pf3aMp0CapqEv+PPJLfvV8jPyElGef0WlTJKEH7QBksqKx6oHCWa2Ts6yDzRS982h
	4mL+D63Dpe1vwPmixOzzuZu7Thxl1N4=
Subject: Re: [PATCH v2 01/12] x86/p2m: set_{foreign,mmio}_p2m_entry() are
 HVM-only
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <4b842581-e24d-6b74-eef5-7ac48f0ff0a4@suse.com>
 <YIqx3LahSx1bmgNo@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9dc64292-d87c-77ba-1356-80cb14348973@suse.com>
Date: Thu, 29 Apr 2021 16:09:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIqx3LahSx1bmgNo@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.04.2021 15:17, Roger Pau Monné wrote:
> On Mon, Apr 12, 2021 at 04:05:41PM +0200, Jan Beulich wrote:
>> Extend a respective #ifdef from inside set_typed_p2m_entry() to around
>> all three functions. Add ASSERT_UNREACHABLE() to the latter one's safety
>> check path.
> 
> Wouldn't it be better to also move the prototypes in p2m.h into a
> CONFIG_HVM guarded region, so that it fails at compile time rather
> than link time?

In the header I'm fearing this ending up as spaghetti more than in
the .c file. I think where possible we may want to do so once we
have a clear / clean set of APIs which are generic vs such which
are HVM-specific (which I expect to be the case once p2m.c as a
whole becomes HVM-only).

Jan

