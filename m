Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B50328799
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 18:27:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91835.173331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmJm-0000ak-BO; Mon, 01 Mar 2021 17:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91835.173331; Mon, 01 Mar 2021 17:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmJm-0000aL-7m; Mon, 01 Mar 2021 17:26:50 +0000
Received: by outflank-mailman (input) for mailman id 91835;
 Mon, 01 Mar 2021 17:26:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmJk-0000aC-Qp
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:26:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmJk-00055p-Q7
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:26:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lGmJk-0003Wm-P6
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 17:26:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lGmJf-00052J-0N; Mon, 01 Mar 2021 17:26:43 +0000
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
	bh=+FEMkIATtnZI7BsizNrwoeGSCwC1sVnqxPyGZaV7X8w=; b=g2I0GaITg+hx+V+j5DQBzVbJSC
	yYN6fcIqzEg3mw0xi1tPpZAehIaBzPq43l5tPAItSxzCsDwbm9UIf/bOAOOUkPEn3C4ia9bRQhmgH
	HUQnDHirdMD+LnNI/vNcxvv2/S0Hd+AqzQ1z5A+EReaKFo87QTG62nt77VUQxMxT1Pxc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24637.9170.803610.335317@mariner.uk.xensource.com>
Date: Mon, 1 Mar 2021 17:26:42 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Tim Deegan <tim@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    "Wei  Liu" <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH][4.15] x86/shadow: replace bogus return path in
 shadow_get_page_from_l1e()
In-Reply-To: <1ef6a569-f6c1-f20c-6b63-a5577cf95e36@citrix.com>
References: <d6cf1205-d537-fafb-a082-e973bfe11315@suse.com>
	<1ef6a569-f6c1-f20c-6b63-a5577cf95e36@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH][4.15] x86/shadow: replace bogus return path in shadow_get_page_from_l1e()"):
> On 26/02/2021 15:08, Jan Beulich wrote:
> > Prior to be640b1800bb ("x86: make get_page_from_l1e() return a proper
> > error code") a positive return value did indicate an error. Said commit
> > failed to adjust this return path, but luckily the only caller has
> > always been inside a shadow_mode_refcounts() conditional.
> >
> > Subsequent changes caused 1 to end up at the default (error) label in
> > the caller's switch() again, but the returning of 1 (== _PAGE_PRESENT)
> > is still rather confusing here, and a latent risk.
> >
> > Convert to an ASSERT() instead, just in case any new caller would
> > appear.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Yikes, and only 9 years to notice.
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Ah here we are,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks

