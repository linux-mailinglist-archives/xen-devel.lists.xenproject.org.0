Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A1ACCB31
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 18:24:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004683.1384400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUQT-0001In-Ew; Tue, 03 Jun 2025 16:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004683.1384400; Tue, 03 Jun 2025 16:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMUQT-0001HI-CP; Tue, 03 Jun 2025 16:23:45 +0000
Received: by outflank-mailman (input) for mailman id 1004683;
 Tue, 03 Jun 2025 16:23:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1uMUQR-0001HC-TS
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 16:23:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMUQR-000HNY-1l;
 Tue, 03 Jun 2025 16:23:43 +0000
Received: from [2a01:e0a:1da:8420:b77:bd5:6e45:7633] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1uMUQR-006SJG-26;
 Tue, 03 Jun 2025 16:23:43 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=Cwx6Rqps1LuDQSxWQKEUHa/luYpJWhqKmQTcwM4fePU=; b=qxiyRAFnCnLISIOVpNR+4sznVX
	CFQbc2rNEtndFhLdMN9E8HSdMpHU50+Tz58bDxN+LMd8qbb+kuB2jnF+JxOdZHEm6oN/sk3j982v7
	Gu/v9AUjEEFJZqdP/PBfr5LjhHmxSmk/lOJFkAOK9VJLaQlZKtjBbo/t6QzrD1IMw8N4=;
Date: Tue, 3 Jun 2025 18:23:41 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 8/9] CI: Workaround extra content in junit
Message-ID: <aD8hjZNt-iwbO4_-@l14>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-9-anthony@xenproject.org>
 <86d3655f-f541-441e-bb6c-1dda0b03540f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86d3655f-f541-441e-bb6c-1dda0b03540f@citrix.com>

On Tue, Jun 03, 2025 at 03:12:32PM +0100, Andrew Cooper wrote:
> On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> >  if [ -n "$retrieve_xml" ]; then
> >      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> > +    # Workaround duplicated data been received
> > +    sed -i.old '/^<\/testsuites>/q' tests-junit.xml > /dev/null
> > +    extra_line_in_junit=$(($(wc -l < tests-junit.xml.old) - $(wc -l < tests-junit.xml)))
> > +    if [ $extra_line_in_junit -gt 0 ]; then
> > +        echo "WARNING: Found $extra_line_in_junit too many lines in junit."
> > +    fi
> 
> Is this the cause of
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report
> getting a row of 0's for ADL ?

Well, the error I had was this one:
"FATAL: Extra content at the end of the document"
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1848598740/test_report

And indeed, when I managed to dl the junit.xml, there were the end of
the document duplicated many times.

> Why are we getting duplicate data?  nc is running in TCP mode, not UDP,
> so it's not that.

I think Marek talked about some notwork equiment in the middle?
I managed to find in matrix where they were talk about this duplication
of data, well, with `nc` dl for ever, with lots of duplicated data:

https://matrix.to/#/!XcEgmbCouiNWHlGdHk:matrix.org/$OkZmPOandaPy_OVAU8hpoAs14JWHtI6rXYrIZawUqDE?via=matrix.org&via=nitro.chat&via=aperard.fr

from marmarek
> So, it appears to be a bug in pasta - the thing that podman uses to
> proxy traffic out of the container's network namespace. You know, an
> additional network stack in userspace.

I have no idea if it is the same issue, but I had extra content in the
junit file with nearly all my jobs.

Cheers,

-- 
Anthony PERARD

