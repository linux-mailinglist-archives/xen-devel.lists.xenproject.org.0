Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B587DA453E2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 04:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896123.1304788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn7wM-0000UG-R2; Wed, 26 Feb 2025 03:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896123.1304788; Wed, 26 Feb 2025 03:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn7wM-0000RW-Nv; Wed, 26 Feb 2025 03:18:30 +0000
Received: by outflank-mailman (input) for mailman id 896123;
 Wed, 26 Feb 2025 03:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EFW=VR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1tn7wL-0000RQ-Fc
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 03:18:29 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539c6aa2-f3f0-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 04:18:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AD50B82880D2;
 Tue, 25 Feb 2025 21:18:18 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XpjWmOSKc88d; Tue, 25 Feb 2025 21:18:17 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D0C868288182;
 Tue, 25 Feb 2025 21:18:17 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8RS_yuiWuX3w; Tue, 25 Feb 2025 21:18:17 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 2D27982880D2;
 Tue, 25 Feb 2025 21:18:16 -0600 (CST)
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
X-Inumbo-ID: 539c6aa2-f3f0-11ef-9897-31a8f345e629
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D0C868288182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1740539897; bh=MArgYGLoH0zFz2KLW6t0r7u6cZLcE0p2rG4gv0KdFRg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=kSy9IlUazFycwE7l816+RbxLYo8aHhZErqk00tgVyotTWvwZ6It7B2ejQ0ewNj+BF
	 i6FRsOLYA0DDeLpOCzva7g5W/KzyWAbYwAeBs4ZMSx0KUKJZ4vsPUC/DUK/aRIw5bp
	 gAjHsE2oWS4MK5LqahsOEJqn57RFlB1bpfJo0CXk=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <02d80b47-8d7b-4a3a-aa90-022526a41248@raptorengineering.com>
Date: Tue, 25 Feb 2025 21:18:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/ppc: Fix opal.c's misaligned DT reads to avoid
 tripping UBSAN
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1740168326.git.sanastasio@raptorengineering.com>
 <f0b1f299d793c4302ee1b4c6a9c99057f924d4f4.1740168326.git.sanastasio@raptorengineering.com>
 <9cb2f3e5-5523-4b02-b8df-9975dab7c015@citrix.com>
 <4b9002fe-1e39-4ee9-a4fd-fc91cd0562d5@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <4b9002fe-1e39-4ee9-a4fd-fc91cd0562d5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/25 2:15 PM, Andrew Cooper wrote:
> Sorry, the other thing to say is that if PPC is generally fine with
> unaligned accesses, then you might want to follow what x86 does.
> 
> We use -fno-sanitize=alignment generally, because there's a whole pile
> of things which are misaigned and spec'd that way for backwards
> compatibility.

Oh perfect -- I did do an initial grep to see if this was done but
couldn't immediately find it. The Power ISA does guarantee that
unaligned word/doubleword reads are handled transparently by the
hardware so enabling this seems like a reasonable approach on PPC as
well. I'll submit a v2 that does this.

> ~Andrew

Thanks,
Shawn

