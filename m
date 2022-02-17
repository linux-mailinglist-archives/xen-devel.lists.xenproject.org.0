Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2E4B9DD3
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274634.470172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeT9-0003qD-Co; Thu, 17 Feb 2022 10:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274634.470172; Thu, 17 Feb 2022 10:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeT9-0003nC-8K; Thu, 17 Feb 2022 10:57:03 +0000
Received: by outflank-mailman (input) for mailman id 274634;
 Thu, 17 Feb 2022 10:57:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzVd=TA=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nKeT8-0003n6-AJ
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:57:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539eaaf5-8fe0-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 11:57:00 +0100 (CET)
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
X-Inumbo-ID: 539eaaf5-8fe0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645095420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZtW6VisS4ywH8dJriw3Ytb5KVKugn/0fU/ZsU7IJrwg=;
  b=RZS3u7l+em4yH00niIg3iwB2YfmNK6r3g7Snvuh3fO6IoF9pAEAEsYq5
   xhgFoDnILhhAZLBqDelK6/OS6EdfWd7UmShNojsLUJyRrXB2uZTA93hFf
   qMTvp/ZE893AjWlSGBqTNqQSl3zFhZ24vYU4dd2cq6swrvl9/szpeUy94
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BUc3DiS6lY9e4LfAqDVql4X4a+3j0ic+7/NPA7neb7JbKsnQnjYkwjetVdIdnJovPqwbiUMSE9
 fwWH4Z9hCRajICV4oAb6gFZtzEGlxbbCk6Z1hFLjYnipky80C1+e275M3L6I9BdpuVKLwmP04d
 8Sy7fNOvkzfnylFNoyWdw97NMKnlStydWXw/DV3QbaDjMakXyDpVxCR3Vzke6F4IEFMB1JPTHq
 IMS6/MBxktPHjJT+iUQQuNDT1Qjz7p07YH2C8pwCAZvOu7S+dB8eSPL2dMb0DPUvBC6KC2vnUp
 ObizTexrd1sgeLUq/z2gMi9g
X-SBRS: 5.1
X-MesageID: 64316964
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h3IXdqjmAeoy7ohTO5nYwJ5WX1615RcKZh0ujC45NGQN5FlHY01je
 htvCmmEMq7eMGb9Kdsjbtzn/UJS7Z7Wyt42SQJv+CoyFCkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1TsprqThg2OJeLp/hBeV5+LiYlZp9vreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiCP
 JNHOGQzBPjGS0QWeXIuN5I+oOahoX2mehEFtWmTiJNitgA/yyQuieOwYbI5YOeiR9hRn0uej
 nLL+SL+GB5yHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqEKX7nweDlsRT1TTifu2kEmlQPpEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsUwwDud78v4cJyS3TEvwkNpOy1YbHMGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgTZ5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkidS+F0e5eIFcFh
 XM/XysLu/e/21PwMMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhRxyfpgZ
 8vGKpnxZZr/NUiB5GDpLwv6+eV2rh3SOEuJHcyrp/hZ+eH2iIGppUctbwLVM7FRAFKsqwTJ6
 ddPX/ZmOD0EONASlhL/qNZJRXhTdCBTLcmv96R/K77SSiI7STpJI6KAntscl3lNwv09ehHgp
 SrmBCe1CTPX2BX6FOl9QisyMuyxA8ck/ClT0O5FFQ/A5kXPqL2HtM83H6bbt5F9nAC65fIrH
 fQDZeuaBfFDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJtsu
 aCk2yPaXYEHG1ZoAvHJZa/91Fi2p3Ucxr5/BhOaPtlJdUzw24F2MCit3OQvKsQBJEyblDuX3
 gqbGzkCouzJr9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKj7P
 Ldb1fDxNvEDjW1miYskHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHVNNdgooauOPiaMdljXItKlnJUz74Gl8/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L3nJO6mCBDn0cSKF25JgVDbjihhcv1lwfM4fXDTX74c3XZthBWqXwz
 uR4WEYWa2xg+3f/
IronPort-HdrOrdr: A9a23:VUNWfqHHL6MDWhMWpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="64316964"
Date: Thu, 17 Feb 2022 10:56:53 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xenstore: add error indicator to ring page
Message-ID: <Yg4p9eq4A7b+FimR@perard.uk.xensource.com>
References: <20220210111620.5256-1-jgross@suse.com>
 <YgvJyt5Jpvsb2Jws@perard.uk.xensource.com>
 <8891ed69-2ad2-2842-e34e-8252860b71d9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8891ed69-2ad2-2842-e34e-8252860b71d9@suse.com>

On Tue, Feb 15, 2022 at 04:45:28PM +0100, Juergen Gross wrote:
> On 15.02.22 16:42, Anthony PERARD wrote:
> > On Thu, Feb 10, 2022 at 12:16:20PM +0100, Juergen Gross wrote:
> > > +The "Connection error indicator" is used to let the server indicate it has
> > > +detected some error that led to deactivation of the connection by the server.
> > > +If the feature has been advertised then the "Connection error indicator" may
> > > +take the following values:
> > > +
> > > +Value   Description
> > > +-----------------------------------------------------------------
> > > +0       No error, connection is valid
> > > +1       Communication problems (event channel not functional)
> > > +2       Inconsistent producer or consumer offset
> > > +3       Protocol violation (client data package too long)
> > 
> > Is this meant to be the only possible error value? If in the future we
> > want to add more possible error, does it going to need a new feature
> > bit and maybe a new error field?
> 
> No, as the guest is not opting into this feature, but just gets it
> presented, there is no need to have another bit for new error values.

This probably needs to be spelled out in the documents that.

> Note that this is a purely informational interface. The error value
> (other than 0) is only for diagnostic purposes, there is no way a
> guest could react in a sane way to a specific error case.

This could also be spelled out in the document, in the new section "The
connection error feature", that a value other than 0 is a connection
error even if the error number isn't known to the client.

Thanks,

-- 
Anthony PERARD

