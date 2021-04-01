Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5A351598
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104539.200055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy89-0003Dl-M1; Thu, 01 Apr 2021 14:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104539.200055; Thu, 01 Apr 2021 14:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRy89-0003DP-Is; Thu, 01 Apr 2021 14:17:05 +0000
Received: by outflank-mailman (input) for mailman id 104539;
 Thu, 01 Apr 2021 14:17:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRy87-0003DG-Sh
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:17:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1741e65f-18c6-4991-8feb-2be4e4e6d6a0;
 Thu, 01 Apr 2021 14:17:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 24A23B15F;
 Thu,  1 Apr 2021 14:17:02 +0000 (UTC)
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
X-Inumbo-ID: 1741e65f-18c6-4991-8feb-2be4e4e6d6a0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617286622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvO5C0SRpjkQLKwcYLbhj9/Kcb0lIHrpUuAKPqxabU8=;
	b=cK1OAgb51tVnFKwGYSe8xiYno1mYAr6AEEfVrmgo4VT7isz68yxAbpfA+nwcqTM7Ld8HGB
	5nI9S2ONaSIV9WkIKrrcQXso7CiwvUBJUAudc72S67O0L1zDL24amv6Xvuo2QBOM2bfv0K
	hIh/9a8ab76EtWpC+puTqyXEJL1J1AE=
Subject: Re: [PATCH for-4.15 7/7] CHANGELOG.md: irq-max-guests
To: George Dunlap <george.dunlap@citrix.com>
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
References: <20210401133827.362216-1-george.dunlap@citrix.com>
 <20210401133827.362216-7-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37b76a6d-e81b-1581-d89c-0d99a9d2eba9@suse.com>
Date: Thu, 1 Apr 2021 16:17:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401133827.362216-7-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 15:38, George Dunlap wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -33,6 +33,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - Some additional affordances in various xl subcommands.
>   - Added the following ARM errata: Cortex A53 #843419, Cortex A55 #1530923, Cortex A72 #853709, Cortex A73 #858921, Cortex A76 #1286807, Neoverse-N1 #1165522
>   - On detecting a host crash, some debug key handlers can automatically triggered to aid in debugging
> + - Increase the maximum number of guests which can share a single IRQ from 7 to 16, and make this configurable with irq-max-guests

Acked-by: Jan Beulich <jbeulich@suse.com>
albeit I again wonder if this isn't too small / niche a change to warrant an
entry here.

Jan

