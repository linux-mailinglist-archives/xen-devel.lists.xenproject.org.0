Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91633780C30
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 14:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586194.917415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz2H-00077q-O3; Fri, 18 Aug 2023 12:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586194.917415; Fri, 18 Aug 2023 12:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWz2H-00075U-LC; Fri, 18 Aug 2023 12:57:05 +0000
Received: by outflank-mailman (input) for mailman id 586194;
 Fri, 18 Aug 2023 12:57:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYDY=ED=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qWz2F-00075O-Uu
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 12:57:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9346adb-3dc6-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 14:57:01 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 268A64EE0737;
 Fri, 18 Aug 2023 14:57:01 +0200 (CEST)
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
X-Inumbo-ID: b9346adb-3dc6-11ee-9b0c-b553b5be7939
MIME-Version: 1.0
Date: Fri, 18 Aug 2023 14:57:01 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
In-Reply-To: <alpine.DEB.2.22.394.2308161221580.6458@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
 <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
 <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
 <3a6ab847-fd31-60e4-2558-feed71d670dd@suse.com>
 <b0581f49ac01c923809c0e15c1a1dfed@bugseng.com>
 <6e1dbf093687e5fa66295621ce67e4dc@bugseng.com>
 <2b26baf0-6a82-0bff-99b5-ade067e0d74d@suse.com>
 <c9197dca7802b08765c0b2b6800e548c@bugseng.com>
 <e7e2eef0-5f88-e10e-81e3-57931f22f76a@suse.com>
 <alpine.DEB.2.22.394.2308161221580.6458@ubuntu-linux-20-04-desktop>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f2e5410ecdbffd9890c303c938bdb388@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit


> Jan has a point: I think we should record all our deviations and unique
> ways to interpret the rules under docs/misra. And the Eclair
> configuration should reflect that. It is not a good idea to only keep
> the information in the Eclair config because, even if it is now 
> upstream
> in xen.git, it is still a tool-specific configuration file -- it is not
> a proper document. MISRA C and its interpretation is important enough
> that we should have a plain English document to cover it (which now is
> docs/misra/rules.rst).
> 
> Nicola, I volunteer to send patches to make any necessary updates to
> docs/misra/rules.rst and other docs. Please send out to me a list of
> deviations/configurations and I'll make sure to reflect them under
> docs/misra so that they are in sync.
> 
> Cheers,
> 
> Stefano

Sure, I'll let you know when I have it.
Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

