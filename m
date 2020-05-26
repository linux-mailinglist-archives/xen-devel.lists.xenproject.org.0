Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608641E27D1
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 19:00:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdcve-0006CA-L5; Tue, 26 May 2020 16:59:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gj5j=7I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jdcvd-0006C5-Fy
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 16:59:49 +0000
X-Inumbo-ID: 4e717dc4-9f72-11ea-9dbe-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e717dc4-9f72-11ea-9dbe-bc764e2007e4;
 Tue, 26 May 2020 16:59:48 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HiL4jJvAzT0oY0O/XFxaWSH6mJVeMrECIAY7/aklf1RLqIVa/d+YREem0bBy9P4/kkVElbpzr6
 bZR64mhmdDkee7+L6lVQwnqVmJ/Jjum6/5bPNtdFM0eOqWxb1EncQ9IXuF1euKtNfSqHHoh8ak
 6gW+1VInzBeDqVfM+TNLATBzqApsugvwh7U/xhZkUqIGQEqgq84C4qE53rRPs9aI2hpT/aanSU
 pMJVjsvPKHODmO/5MOD78GQnJJ7pUjwhiszqiCh29xIFoCDLfHq7kquIfDUHV482NDHQ69LlqO
 mhM=
X-SBRS: 2.7
X-MesageID: 18474234
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="18474234"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <24269.19198.604986.160896@mariner.uk.xensource.com>
Date: Tue, 26 May 2020 17:59:42 +0100
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 5/5] gitignore: Ignore golang package directory
In-Reply-To: <A525D330-BCF9-4998-BEC5-425BA6C26CCF@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-6-george.dunlap@citrix.com>
 <24269.8059.28506.353748@mariner.uk.xensource.com>
 <A525D330-BCF9-4998-BEC5-425BA6C26CCF@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

George Dunlap writes ("Re: [PATCH 5/5] gitignore: Ignore golang package directory"):
> [explanation]

Sounds quite tangled...

> Nick, any opinions?
...
> > Is there not a risk that humans will try to edit it ?

Anyway ISTM that you have definitely considered this so

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

assuming that and Nick convince yourselves you've addressed this
possible issue.

> I suppose someone might.  If we decide we want to support older versions of go, we probably want to figure something out there.  Options:
> 
> 1. Copy the files to a temp directory instead.  This is complicated because we have to find a good temp directory, and we’d have to copy them every time, slowing down the incremental build (though not that much).

I don't think that helps much.

> 2. Put a file in the generated directory like “GENERATED_DO_NOT_EDIT”.
> 
> 3. Put them in tools/golang/GENERATED_DO_NOT_EDIT/src instead.

Do they not have a header comment saying DO NOT EDIT ?

3 is pretty ugly.  I'll leave it up to you whether to bother with 2.

Thanks,
Ian.

