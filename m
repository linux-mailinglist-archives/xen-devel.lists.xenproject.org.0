Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50A334146
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 16:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96181.181752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0YC-0006za-Cs; Wed, 10 Mar 2021 15:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96181.181752; Wed, 10 Mar 2021 15:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK0YC-0006zA-9c; Wed, 10 Mar 2021 15:15:04 +0000
Received: by outflank-mailman (input) for mailman id 96181;
 Wed, 10 Mar 2021 15:15:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0YB-0006z5-6k
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:15:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0YB-0004PV-1n
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:15:03 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lK0YB-0003hi-0h
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 15:15:03 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lK0Y7-0006XG-OH; Wed, 10 Mar 2021 15:14:59 +0000
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
	bh=udJnr+Ah07Tgqjp3r46mOigwVDrWqWV0YEwaKv/gyLk=; b=q/H1eOOqZKwMuUjCYBEdAFRcX6
	LOpDA1GxKg0VoR6wxnTcPntjuR5Zuz38mmE8ZZIwRd1oIwGkXgdyIaeEBsVvYR2aJINfqQVxtdPD6
	FdYh3jp5Rimat9l5cVf/HDs6K3xPT1/He/jkZw1YIEGvZDV4IujBlGvse6e2AJLZIwwY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24648.57971.488443.593050@mariner.uk.xensource.com>
Date: Wed, 10 Mar 2021 15:14:59 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
    Jan Beulich <JBeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Wei Liu <wl@xen.org>,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API
In-Reply-To: <20210310150722.27194-1-andrew.cooper3@citrix.com>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("[PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
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
> devicemodel's private.h.  Fix the dmop design doc to discuss both reasons
> behind the the ABI design.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> 
> v2:
>  * Patch dmop.pandoc as well.
> 
> For 4.15.  This is a build fix, even if current staging can't spot the
> breakage.

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I am going to stop giving acks for this kind of thing fairly shorty.

Ian.

