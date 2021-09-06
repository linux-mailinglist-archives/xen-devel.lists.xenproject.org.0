Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8871401B6C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 14:49:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179791.326179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNE3M-0002F4-C5; Mon, 06 Sep 2021 12:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179791.326179; Mon, 06 Sep 2021 12:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNE3M-0002Bd-90; Mon, 06 Sep 2021 12:48:48 +0000
Received: by outflank-mailman (input) for mailman id 179791;
 Mon, 06 Sep 2021 12:48:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNE3L-0002BX-0N
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 12:48:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNE3J-0003xM-5w; Mon, 06 Sep 2021 12:48:45 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNE3I-00010W-VM; Mon, 06 Sep 2021 12:48:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=rwy7AxNwfFwlsMnF38Gr4XwnPq0UVzT9byovRhnT+jY=; b=A4i8Ezp016dum75EUVFwvLVBqg
	PmENjNsYxSmwhI+J7psgcyB+22jjdZxTK+XfTnlzDVua2bXpMZJEzlrbh4ivrHOPSdC1DdsvwqK0c
	8zwubBuX5aXb5TPWIN6vaGwPz3PBOroCJ+JLByoH2oKDG0lFqo4uw1EVJ8+V3B/k/vLs=;
Subject: Re: [PATCH] ns16550: MMIO r/o ranges are maintained at page
 granularity
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <05d055aa-2981-8c0f-33c6-62139859aeb2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a3b91f7a-ceb0-cf10-04cf-4249667c81fa@xen.org>
Date: Mon, 6 Sep 2021 13:48:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <05d055aa-2981-8c0f-33c6-62139859aeb2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/08/2021 14:05, Jan Beulich wrote:
> Passing byte granular values will not have the intended effect. Address
> the immediate issue, but I don't think what we do is actually
> sufficient: At least some devices allow access to their registers via
> either I/O ports or MMIO. In such aliasing cases we'd need to protect
> the MMIO range even when we use I/O port accesses to drive the port.
> 
> Note that this way we may write-protect MMIO ranges of unrelated devices
> as well. To deal with this, faults resulting from this would need
> handling, to emulate the accesses outside of the protected range. (An
> alternative would be to relocate the BAR, but I'm afraid this might end
> up even more challenging.)
> 
> Fixes: c9f8e0aee507 ("ns16550: Add support for UART present in Broadcom TruManage capable NetXtreme chips")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

