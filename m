Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C07C1D313
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 21:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153113.1483578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vECju-0000HD-AH; Wed, 29 Oct 2025 20:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153113.1483578; Wed, 29 Oct 2025 20:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vECju-0000FI-7e; Wed, 29 Oct 2025 20:25:50 +0000
Received: by outflank-mailman (input) for mailman id 1153113;
 Wed, 29 Oct 2025 20:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U31q=5G=raptorengineering.com=tpearson@srs-se1.protection.inumbo.net>)
 id 1vECjs-0000FC-Ti
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 20:25:48 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73a952b1-b505-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 21:25:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4D3317790D19;
 Wed, 29 Oct 2025 15:25:46 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 48YLHWpjOBs0; Wed, 29 Oct 2025 15:25:45 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3C56E7790E6F;
 Wed, 29 Oct 2025 15:25:45 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Y8ACrqfGwDZ3; Wed, 29 Oct 2025 15:25:45 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0A2B47790D19;
 Wed, 29 Oct 2025 15:25:45 -0500 (CDT)
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
X-Inumbo-ID: 73a952b1-b505-11f0-9d16-b5c5bf9af7f9
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3C56E7790E6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1761769545; bh=RCjUr++IbWxXT2IrtGMqgMYD5LPd0MxFrIr6EPa0M8k=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=T15P3raTgd+gb1T/g2e01nadqY+ncn07J4HVC6RvgSr6DQzz4eFeb7Fx0zXCyeO8d
	 AA/fvYo0DfKqSnAAxwP9YqrqgTtP0eyFjsmtJ35xXlhCbKaufWdMnOLmem0MZZwiyY
	 o0/GtjwLyNFeB5UkQegNr18LGOC37T/egA2qlqA4=
X-Virus-Scanned: amavisd-new at rptsys.com
Date: Wed, 29 Oct 2025 15:25:41 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	shawn <shawn@anastas.io>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Wei Liu <wl@xen.org>
Message-ID: <197699840.5283.1761769541964.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <alpine.DEB.2.22.394.2510291238140.495094@ubuntu-linux-20-04-desktop>
References: <1794235010.4856.1761754917625.JavaMail.zimbra@raptorengineeringinc.com> <alpine.DEB.2.22.394.2510291238140.495094@ubuntu-linux-20-04-desktop>
Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64
 maintainer
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC141 (Linux)/8.5.0_GA_3042)
Thread-Topic: MAINTAINERS: Remove Shawn Anastasio as PPC64 maintainer
Thread-Index: +XT7QrLv4xCCvrMCL4S70bLJo/6UfA==



----- Original Message -----
> From: "Stefano Stabellini" <sstabellini@kernel.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "xen-devel" <xen-devel@lists.xenproject.org>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "shawn"
> <shawn@anastas.io>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "George Dunlap" <george.dunlap@citrix.com>, "Jan
> Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Wei Liu"
> <wl@xen.org>
> Sent: Wednesday, October 29, 2025 2:38:53 PM
> Subject: Re: [PATCH v2] MAINTAINERS: Remove Shawn Anastasio as PPC64 maintainer

> On Wed, 29 Oct 2025, Timothy Pearson wrote:
>> Shawn is no longer with Raptor Engineering.  For now, add myself as PPC64
>> reviewer.
>> 
>> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index ecd3f40df8..c8764a8c5f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -472,7 +472,7 @@ F:	xen/drivers/cpufreq/
>>  F:	xen/include/acpi/cpufreq/
>>  
>>  PPC64
>> -M:	Shawn Anastasio <sanastasio@raptorengineering.com>
>> +M:	Timothy Pearson <tpearson@raptorengineering.com>
>>  F:	xen/arch/ppc/
> 
> The "R" letter is used for reviewers. The change can be done while
> committing.

I thought I had made that change, at least it's in my local tree.  Sorry about that.

