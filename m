Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D933535810E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 12:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107145.204800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSBF-0002D4-Jz; Thu, 08 Apr 2021 10:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107145.204800; Thu, 08 Apr 2021 10:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSBF-0002Cf-GZ; Thu, 08 Apr 2021 10:46:33 +0000
Received: by outflank-mailman (input) for mailman id 107145;
 Thu, 08 Apr 2021 10:46:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUSBD-0002Ca-R2
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 10:46:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fad5d21f-5615-4327-b85a-f7fa0f1db9d5;
 Thu, 08 Apr 2021 10:46:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02B79AF0C;
 Thu,  8 Apr 2021 10:46:30 +0000 (UTC)
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
X-Inumbo-ID: fad5d21f-5615-4327-b85a-f7fa0f1db9d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617878790; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZQUEv3YsWgUeNnzbHKfFcDKRbv7xchLw1z2v6sYugo=;
	b=g4q7YekVYuUKUf//Wz89zIwK7OfYkyXMxKed6hgXTQaS3nnwIc4+yeaaV0QmXvRkSCxwsa
	wgAvKWZAzdTQQwKLJ8Ro1W7lVYdcnXa269s2VP29lWWXMtUS8lzgVFXGpsniGDAylLBhEa
	7JStoUadm3rJEV7/CHg5Gm387ZoRXJQ=
Subject: Re: [PATCH v2 3/4] xen/arm: Reserve domid 0 for Dom0
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-4-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19fd45ff-b373-dd89-9377-79cb77ffee5b@suse.com>
Date: Thu, 8 Apr 2021 12:46:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408094818.8173-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.04.2021 11:48, Luca Fancellu wrote:
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -419,7 +419,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              {
>                  if ( dom == DOMID_FIRST_RESERVED )
>                      dom = 1;
> -                if ( is_free_domid(dom) )
> +                if ( (dom != 0) && is_free_domid(dom) )
>                      break;
>              }
>  

I don't think this change is needed - I don't see how dom could
ever end up being zero. The code is already intended to be safe
wrt accidentally creating a domain with ID zero. (Granted "rover"
would benefit from being moved into the yet more narrow scope,
which would make this even more obvious.)

Jan

