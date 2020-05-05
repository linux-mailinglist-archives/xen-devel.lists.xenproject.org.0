Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BF1C562A
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 15:02:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVxCW-0003jy-1c; Tue, 05 May 2020 13:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZEp/=6T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jVxCV-0003jt-0A
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 13:01:31 +0000
X-Inumbo-ID: 897eea30-8ed0-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 897eea30-8ed0-11ea-b9cf-bc764e2007e4;
 Tue, 05 May 2020 13:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jh8l5a0f3O0hS8f0yce1Ky168iVxZ8G1XGOqcTqcB3I=; b=jiV9fTXaIDDuv0Tk9mgBKSrlHw
 efTzMFDUKcCekr6y4NQ04DEnzvsI5bYSiIVcEcIu/UJZ1E0FL3Z7cNf5UDd8Dw1j2cSVqSRUldROA
 1iZjAF8N73O6JNxwQwzp5QrJ/Uwh6MY1sPjCpOGeWYl4aPO02NeQfiWYbqTuLJFPCA/M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jVxCN-0002J9-9t; Tue, 05 May 2020 13:01:23 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jVxCN-0002PQ-1p; Tue, 05 May 2020 13:01:23 +0000
Subject: Re: [PATCH v5] docs/designs: re-work the xenstore migration
 document...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200428150624.265-1-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <2bf7dc13-65a4-317e-2c8c-bd6972dbb35a@xen.org>
Date: Tue, 5 May 2020 14:01:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428150624.265-1-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 28/04/2020 16:06, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... to specify a separate migration stream that will also be suitable for
> live update.
> 
> The original scope of the document was to support non-cooperative migration
> of guests [1] but, since then, live update of xenstored has been brought into
> scope. Thus it makes more sense to define a separate image format for
> serializing xenstore state that is suitable for both purposes.
> 
> The document has been limited to specifying a new image format. The mechanism
> for acquiring the image for live update or migration is not covered as that
> is more appropriately dealt with by a patch to docs/misc/xenstore.txt. It is
> also expected that, when the first implementation of live update or migration
> making use of this specification is committed, that the document is moved from
> docs/designs into docs/specs.
> 
> NOTE: It will only be necessary to save and restore state for active xenstore
>        connections, but the documentation for 'RESUME' in xenstore.txt implies
>        otherwise. That command is unused so this patch deletes it from the
>        specification.
> 
> [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

I will wait until tomorrow afternoon (BST) to give an opportunity to 
other to comment.

Cheers,

-- 
Julien Grall

