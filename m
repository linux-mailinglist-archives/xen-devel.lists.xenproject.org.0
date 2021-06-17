Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233E3AB6D8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 17:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144039.265203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttYF-0004cF-DC; Thu, 17 Jun 2021 15:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144039.265203; Thu, 17 Jun 2021 15:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lttYF-0004ZS-96; Thu, 17 Jun 2021 15:03:27 +0000
Received: by outflank-mailman (input) for mailman id 144039;
 Thu, 17 Jun 2021 15:03:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6FJ=LL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lttYD-0004ZI-58
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 15:03:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3e924a5-c7cd-4c9b-8916-7be0fcb69ee8;
 Thu, 17 Jun 2021 15:03:24 +0000 (UTC)
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
X-Inumbo-ID: c3e924a5-c7cd-4c9b-8916-7be0fcb69ee8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623942203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wm0vOGc4ZaC1U6ndvEgQGngy86E0dxchxcXy/tppOuM=;
  b=QtsaFQ4UaLyJakblWHgBaftjELvd6pLj35hB1cZ8wtMxO3GjtDE3VHWl
   9Y50A92ow1T+u+IPCYyTIMVqKZAnqYLKB2inFvp64fsWaEwY6vbaQOa6q
   q5gPoyWEjwtQfK78KhNFVVKsJTtBiw1H9UcNsQORae+wJ2l9Mpd2gIW/O
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sSBG+VmRBs5zbMiKXFjkTuwkIocCrZVQ0PS/Aoh33mEhMH+s2vt1ArXuo5sFDXKCH3ujKRGO14
 jaTioFHwJoHOj3rvbwD2QoeDo+YeMOwlKCt7UXrklkWYxFQYEOZ8xDJ4p1VHGOtpuG4QC+DTNn
 iTh1Mk7Nwgs/mlEInSkOdN8TsDWCpH0tcaQt7lJ2Aln7BICF8ZdhHKaCfXQM1jzIqGOUue+VsO
 5COX8RVOIHnUYpOQnPNgKxO+ZHNbA0k9XrPcBtKZyTCF1kqiubHJLHoIewy0ElusvgDFYK6yjG
 XvE=
X-SBRS: 5.1
X-MesageID: 46378179
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:kTy/FawXkq8qkKHHjbnZKrPxaegkLtp133Aq2lEZdPULSL39qy
 n+poV/6farskdyZJh5o6HyBEGBKUmsjqKdkrNhT4tKPTOW/VdASbsJ0WKM+UyeJ8STzJ8l6U
 4kSdkPNDT8NzQbsS+Y2nj9Lz9D+qj4zEnAv463pBoDI2AaCNAGnmFE40SgYzxLrWJ9dOAE/e
 +nl7Z6Tk2bCAkqh6qAdwE4tzSqnayUqLvWJTo9QzI34giHij2lrJTgFQKD4xsYWzRThZ8/7G
 nsiWXCl+KemsD+7iWZ+37Y7pxQltek4MBEHtawhs8cLSipohq0Zb5mR6aJsFkO0aeSARcR4Y
 DxSiUbTp9OAkDqDzuISNzWqlTdOQMVmiffIJmj8CfeSILCNW0H4oF69Pdkm1Pimj4dleA56b
 lM2W2BsZpREFfvoATRjuK4By1Cpw6MunwlnvcUj3tDFa0kSJEUg7A+0SpuYcY99AST0vF0LA
 CrNrCO2B8eSyLsU1nJ+mZo29CiRXI1A1OPRVUDoNWc13xMkGl+1FZw/r1eop4szuNyd3B/3Z
 WEDk2orsACcuYGKaZmQOsRS8q+DWLABRrKLWKJOFziUKUKIWjEpZL76Kg8oLjCQu1L8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/rf8WL3oOyueT01GqbrinxzeOLyVZx
 +XAuMdPxbOFxqnJW955XyzZ3AJEwhWbCQ8gKdxZ7uhmLO8FrHX
X-IronPort-AV: E=Sophos;i="5.83,280,1616472000"; 
   d="scan'208";a="46378179"
Date: Thu, 17 Jun 2021 16:03:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
Subject: Re: hypercalls with 64-bit results
Message-ID: <YMtkN70EPzT1KO/I@perard>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <d38cd3a3-6139-5ebd-6a78-debc20c3b2bf@citrix.com>
 <1adf28a8-a0fd-4ea4-bbd0-52734630d52b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1adf28a8-a0fd-4ea4-bbd0-52734630d52b@suse.com>

On Thu, Jun 17, 2021 at 10:03:50AM +0200, Jan Beulich wrote:
> But it's not just XENMEM_maximum_gpfn that's affected; that's just the
> one pointing out the underlying issue. Plus if so, shouldn't we avoid
> returning values that are going to be truncated (and, as can be seen
> here, then get perhaps recognized as error codes up the call chain)?
> 
> > For now, I'd agree with trying to undo the change in OVMF.
> 
> Anthony, thoughts?

I can map the shared_info page somewhere else, that fine. The hard part
is figuring out where. I can probably map it just after the guest RAM
(as described by the e820 from hvmloader or Xen).

-- 
Anthony PERARD

