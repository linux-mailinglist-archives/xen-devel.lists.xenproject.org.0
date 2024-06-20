Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE6D910E5C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 19:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744871.1151999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKLUO-00006c-4S; Thu, 20 Jun 2024 17:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744871.1151999; Thu, 20 Jun 2024 17:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKLUO-0008VU-0v; Thu, 20 Jun 2024 17:22:24 +0000
Received: by outflank-mailman (input) for mailman id 744871;
 Thu, 20 Jun 2024 17:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zX/I=NW=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sKLUN-0008VO-8u
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 17:22:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5846fa4-2f29-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 19:22:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 40A378286B5C;
 Thu, 20 Jun 2024 12:22:18 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Z-KWaynxdQCl; Thu, 20 Jun 2024 12:22:17 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8AD7882870EC;
 Thu, 20 Jun 2024 12:22:17 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QB0WaMTuvcmS; Thu, 20 Jun 2024 12:22:17 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 1035F8286B5C;
 Thu, 20 Jun 2024 12:22:16 -0500 (CDT)
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
X-Inumbo-ID: a5846fa4-2f29-11ef-b4bb-af5377834399
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8AD7882870EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1718904137; bh=xtuUYe8Jk0KeSbFjN2K+KMrzPH6CZWP6yg0zJhSZ/7A=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=k3yrrYinYIEnUb954iOytL9//k57bYGflYFw7arGZ+fFMSNlr+UApHaYueTkxRkj/
	 cF0bfO8h7fz2tZGwt+QJCr/+rZ+tw7Rwj8nZOeLf59q4fSTIGyHCHcVl7jG4UF56tl
	 92ngIfUj13OziYb9lNYvQS2o4Us8IO5bFqEzDLIc=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <0460ce5d-0fcc-4f9d-9548-6e86bfb8bc4b@raptorengineering.com>
Date: Thu, 20 Jun 2024 12:22:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arch: Centralise __read_mostly and
 __ro_after_init
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/24 7:49 AM, Andrew Cooper wrote:
> These being in cache.h is inherited from Linux, but is an inappropriate
> location to live.
> 
> __read_mostly is an optimisation related to data placement in order to avoid
> having shared data in cachelines that are likely to be written to, but it
> really is just a section of the linked image separating data by usage
> patterns; it has nothing to do with cache sizes or flushing logic.
> 
> Worse, __ro_after_init was only in xen/cache.h because __read_mostly was in
> arch/cache.h, and has literally nothing whatsoever to do with caches.
> 
> Move the definitions into xen/sections.h, which in paritcular means that
> RISC-V doesn't need to repeat the problematic pattern.  Take the opportunity
> to provide a short descriptions of what these are used for.
> 
> For now, leave TODO comments next to the other identical definitions.  It
> turns out that unpicking cache.h is more complicated than it appears because a
> number of files use it for transitive dependencies.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This seems like a reasonable approach, and removing usage of the old
cache.h __read_mostly from the PPC tree should be a relatively simple
follow up patch from my end.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

