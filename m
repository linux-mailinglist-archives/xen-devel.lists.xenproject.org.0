Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E81338999
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 11:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96952.183924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKef6-00058v-SN; Fri, 12 Mar 2021 10:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96952.183924; Fri, 12 Mar 2021 10:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKef6-00058W-PD; Fri, 12 Mar 2021 10:04:52 +0000
Received: by outflank-mailman (input) for mailman id 96952;
 Fri, 12 Mar 2021 10:04:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKef5-00058R-N7
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:04:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKef5-0005E0-LB
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:04:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKef5-0001SZ-KC
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 10:04:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKeeu-0003SU-Ee; Fri, 12 Mar 2021 10:04:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=5EFwyi/1U7cGcp4J6tCUQbQYFIWfW9Mdj5LoNQxbRzo=; b=dEbZO8Y87HwwVdIO94zJDgnzao
	0MEHA8mXZqzZLr7IZgKwGOf0e/tSttLjUeWiDIOZbsPopsiyhmCNoLv1s3qoE11K8AMVX3sIkqNtg
	0gWO4f3qdhGuvi6AHtExCRqSnjoRcwHxx4pc5JFiT6qthyEk56Je4pMIE3pOWcV3IE8k=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24651.15544.142804.468744@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 10:04:40 +0000
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
In-Reply-To: <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
	<ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
	<6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
	<e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH][4.15] gnttab: work around "may be used uninitialized" warning"):
> This is pretty much what we are already doing slowly by initializing 
> values to shut up older compilers. I agree this is more limited, but we 
> also waive off diagnostics from every single compiler in that code 
> rather than just one version.
> 
> Hence why I suggested dropping -Werror for older compiler. This is not 
> ideal but it would give us the ability to keep support for dinausor 
> compiler and not hamper our ability to take advantage of newer compiler 
> diagnostics.

I agree with Julien.  I think we should avoid adding these redundant
initialisers for the reasons he gives.

> The ideal solution is to drop support for older compiler (see my other 
> thread). But this sounds like a daunting task so far on x86...
> 
> Anyway, I will not Nack the patch but will also not Ack it. I will let 
> another maintainer ack this patch.

But this is outside my usual area so I won't nack it either.

Ian.

