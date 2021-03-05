Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD832EC0C
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:26:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93698.176803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIATC-0006q0-3x; Fri, 05 Mar 2021 13:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93698.176803; Fri, 05 Mar 2021 13:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIATC-0006pX-06; Fri, 05 Mar 2021 13:26:18 +0000
Received: by outflank-mailman (input) for mailman id 93698;
 Fri, 05 Mar 2021 13:26:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAT9-0006pJ-M7
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:26:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAT9-0006jW-LO
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:26:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAT9-0001xq-KZ
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:26:15 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIAT5-0008PD-9B; Fri, 05 Mar 2021 13:26:11 +0000
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
	bh=UCfUwpWMCIJsgTt0fuDfo/59MmUPhJuOtuM86PxmU5Q=; b=mi7Lzapb18Y5L1VSfeH5bTEwUb
	regfP/J64HXhFFQR6RIG5A4U+wDUUPj/2nfONpAOD1Rg2T4AAQMytu0r7vfrcuPvRLbxriLT5n3aU
	G7SHVGdRNfc5lK7akQ/u/4UhgYmT8R3L8SYS0WxOAbiajoUbEqaJ/THvEI3glNIINbyg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.12659.29219.954222@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:26:11 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from public API
In-Reply-To: <20210305124949.6719-3-andrew.cooper3@citrix.com>
References: <20210305124949.6719-1-andrew.cooper3@citrix.com>
	<20210305124949.6719-3-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH 2/3] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
> Exactly as with c/s f40e1c52e4, this is inappropriate for a stable library.
> 
> That change actually broke the build with:
> 
>   include/xendevicemodel.h:52:5: error: unknown type name 'ioservid_t'
>        ioservid_t *id);
>        ^
> 
> as libxendevicemodel.h now uses a type it can't see a typedef for.  However,
> nothing noticed because the header.chk logic is also broken (fixed
> subsequently).
> 
> Strip the guard from the public header, and remove compensation from
> devicemodel's private.h

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

