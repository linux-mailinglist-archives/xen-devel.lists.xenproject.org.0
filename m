Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4DE32648C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 16:14:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90395.171092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFep6-0007iz-U0; Fri, 26 Feb 2021 15:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90395.171092; Fri, 26 Feb 2021 15:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFep6-0007ia-QZ; Fri, 26 Feb 2021 15:14:32 +0000
Received: by outflank-mailman (input) for mailman id 90395;
 Fri, 26 Feb 2021 15:14:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFep5-0007iV-9L
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 15:14:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72f69eb1-0c91-449f-8077-94d82702036a;
 Fri, 26 Feb 2021 15:14:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 548EBAD57;
 Fri, 26 Feb 2021 15:14:29 +0000 (UTC)
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
X-Inumbo-ID: 72f69eb1-0c91-449f-8077-94d82702036a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614352469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rNcdar0ziOksxnU4RbiKXFpr3QFbD2o4W65027z3aRw=;
	b=N85DuCOg1ZcpLLo6vzh+HqneJRE+55lUHPsr6Haf6icfksx/8OkFTKdcrnZRF/a6QRC7Y5
	o0NvSy1HPddA44cn6v1B5bFTLB0ZTO2+IkuAp6npN6F81jtv8jNfpxeZKJjtPyza07ZVZ7
	CPbGtVrOoSoNZ7RuJK6ex4C2tHmSt2I=
Subject: Re: [PATCH][4.15] x86/shadow: replace bogus return path in
 shadow_get_page_from_l1e()
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
Message-ID: <8bb04a4d-70ad-c557-c334-e1e55a429353@suse.com>
Date: Fri, 26 Feb 2021 16:14:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 16:08, Jan Beulich wrote:
> Prior to be640b1800bb ("x86: make get_page_from_l1e() return a proper
> error code") a positive return value did indicate an error. Said commit
> failed to adjust this return path, but luckily the only caller has
> always been inside a shadow_mode_refcounts() conditional.
> 
> Subsequent changes caused 1 to end up at the default (error) label in
> the caller's switch() again, but the returning of 1 (== _PAGE_PRESENT)
> is still rather confusing here, and a latent risk.

The confusion on my part was so significant that I screwed up
the shadow mode fix for "VMX: use a single, global APIC access
page" (which turned out to be necessary) initially. Hence my
proposing this for 4.15. I'm on the edge at this point whether
I'd even consider this a backporting candidate.

Jan

