Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9C338F73
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 15:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97145.184377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiTD-0007C9-DS; Fri, 12 Mar 2021 14:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97145.184377; Fri, 12 Mar 2021 14:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiTD-0007Bk-9s; Fri, 12 Mar 2021 14:08:51 +0000
Received: by outflank-mailman (input) for mailman id 97145;
 Fri, 12 Mar 2021 14:08:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiTB-0007Bd-9G
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:08:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiTB-0000zy-5A
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:08:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lKiTB-0000bd-3G
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:08:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lKiT0-00044q-EE; Fri, 12 Mar 2021 14:08:38 +0000
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
	bh=m5H7FgXfFnbYQQT7H+HBh4eIcgFfUsHEIhLz/wbXR+w=; b=Avdr/bYw6HrGphUaJ+k1aKB5/9
	BgehS6zytBjBNuI7ioep+QBW0fNBkyXi5AdluLb5YlxLkIDyFphPw2Dx/GvPybB2QnQ1qZ6V5CpuO
	InbBF6P7W2NhpBCj/ydr49nCDDH0gUp7FBwHqoxwdk8lpOj7bNHEETiC55KtCH4iH1wo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24651.30182.179324.184928@mariner.uk.xensource.com>
Date: Fri, 12 Mar 2021 14:08:38 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Paul Durrant <paul@xen.org>,
    Wei Liu <wl@xen.org>,
    Ian Jackson <iwj@xenproject.org>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard
 from public API
In-Reply-To: <ffd35de5-d130-4b82-8397-085d7ea70b6e@citrix.com>
References: <20210310150722.27194-1-andrew.cooper3@citrix.com>
	<d375232a-d1a7-737c-0887-8b7e1c9a772d@suse.com>
	<13f03a67-18c2-e564-a0f6-84eccc7eeb76@citrix.com>
	<556ce32b-5087-b8b1-432e-643218dd8c6e@suse.com>
	<9ca069ab-8b6c-c8f1-d68b-4a9bb0cf5c56@citrix.com>
	<YEomtoHmq7UH/P6T@Air-de-Roger>
	<ffd35de5-d130-4b82-8397-085d7ea70b6e@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Andrew Cooper writes ("Re: [PATCH for-4.15 v2] xen/dmop: Strip __XEN_TOOLS__ header guard from public API"):
> On 11/03/2021 14:18, Roger Pau Monné wrote:
> > I think using __XEN_UNSTABLE_ABI__ would be way clearer than
> > __XEN_TOOLS__, or even placing those in a separate directory as you
> > mention.

+1

> I plan to submit a rename for 4.16.

+1

> I don't expect I'll have much luck arguing for a release ack at this
> point, and isn't totally risk-free.

Indeed, I think the value for 4.15 would be very limited and I
wouldn't want the churn.

Thanks,
Ian.

