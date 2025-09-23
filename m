Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F905B9686A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 17:15:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128497.1468835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14k5-0003Cz-EQ; Tue, 23 Sep 2025 15:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128497.1468835; Tue, 23 Sep 2025 15:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v14k5-0003Ax-Be; Tue, 23 Sep 2025 15:15:45 +0000
Received: by outflank-mailman (input) for mailman id 1128497;
 Tue, 23 Sep 2025 15:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u1Uj=4C=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1v14k3-0003Ar-ID
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 15:15:44 +0000
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net
 [46.105.63.230]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b59cf86-9890-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 17:15:42 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.110.58.221])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4cWNpP3QCjz61Ct
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 15:15:41 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-qz28q (unknown [10.108.54.212])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5CC341002C5;
 Tue, 23 Sep 2025 15:15:40 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.105])
 by ghost-submission-5b5ff79f4f-qz28q with ESMTPSA
 id W8PTBZy50mgwnQAAfDlrFw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 23 Sep 2025 15:15:40 +0000
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
X-Inumbo-ID: 2b59cf86-9890-11f0-9d14-b5c5bf9af7f9
Authentication-Results:garm.ovh; auth=pass (GARM-105G006abded6f1-020e-4577-a8dd-717f329057bb,
                    4804EDC472500D38916C4D805CCC5D85F75C271A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Tue, 23 Sep 2025 18:15:35 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 06/22] xen/arch/x86: reserve TXT memory during Slaunch
Message-ID: <aNK5l7olUcGCwRSu@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <8d5ba2e7a0a8bd05bb9cdb89db3f15b831f7f4f7.1748611041.git.sergii.dmytruk@3mdeb.com>
 <45ed8b90-ce0c-419e-9c7d-2ab58ee539a2@suse.com>
 <aNHBIkJt2HvxlcMe@MjU3Nj>
 <0e901379-41a0-4fa0-bfbb-3407162437ff@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e901379-41a0-4fa0-bfbb-3407162437ff@suse.com>
X-Ovh-Tracer-Id: 13374846470647690329
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGW+fB3FvHuHalR6aa/VleIM8DGerkyqnGAZiWZTY3GNP//LyrJGoKNWHJwaW/EoQgHQ1JdLjIPtC8Bt9fxwhQXT2f8pZgJMSnNWpxAaCzefp3I5VZLbmnIfdtzlq0oDwhoay/jek9atYOS+1uo30iXKl1EZ3QZrjqCPDbKI8NAguC3NTi1eqUySaoUKeWydZWMTycS2SVFvjVbri15Pyy4OOf1Espje8kDQbPBIMcLwxI5yFO+rgp3wTey8Qs5nbobZY8cGRkNc11Y1kWsZ6D6svV3gCi82USuhI1GMLtj0chCzYrchedVzmPMn1S7kxL84UFep6vSr7k8f2uNds1JW1/+4vOxkSrREzAQnIbpWp2B6Hk2VUqFRPFVoj2ngm7pdXWVlduf5x4Y2vULftsqEh3wNUbB5/xzy+bkUeozh+21vg88rkYdB2iA5iWaleYxJNfxEeKN9hheHWIj45psSoZcI9vvnjgCSsyjGGHWX9LIjCuyKbJU4tiBcNGXEuffs5R1EMyIUg7UQ622pQZRGPUrKYWRE4B01Im0uDrbD386jDyEXm/2GXYrEZaK1eyd+zZ0P9tUpt0y8dlzQp2fbL0YAYYJNQUSHXrw4Mse4JqGEzxpBMqaoR/duSJ7OW/WdulmAVNLVZXSt7rxODvTRfjqJ2UT1/pPY+OqDpSStA
DKIM-Signature: a=rsa-sha256; bh=y/DqvfLeECh6dzUzGl4pfXs7tw2bn9zxdpOj5/tUNHU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1758640541; v=1;
 b=MYOXOaZi403oYvn8gVHnX8ol99SV+rVgyMbvfm/Bc0sBNPnE+Fr00tYH0QQfm4pUxjWSdaZo
 mMHOJV5qQkekizq7H3JnA1dmJf+isoOKA4w3uoTjwKvg/fBM2tpMV3dhuvqYPDxWZY+IMhfbOuA
 PFVAZWFABsDBb0WNgceE6GgoZqxORWFIrSVwd/mHuq2S7Ty2LITc1xnOY8obz4tbwzVYN6/qHZa
 mGJxamzGMGD6OM+DIhLgVegW2ztS3nQMoZlggaovgV17CuAiZ+Y1dGBlhcODqRbHWibA7/xABhV
 BlhZSF21+yWhJbBZhHukYcyeh7G5EeTJ6br3/ow5vjdnw==

On Tue, Sep 23, 2025 at 12:48:55AM +0200, Jan Beulich wrote:
> On 22.09.2025 23:35, Sergii Dmytruk wrote:
> > On Thu, Jul 10, 2025 at 03:00:07PM +0200, Jan Beulich wrote:
> >> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> >>> +void __init txt_reserve_mem_regions(void)
> >>> +{
> >>> +    int rc;
> >>> +    uint64_t sinit_base, sinit_size;
> >>> +
> >>> +    /* TXT Heap */
> >>> +    BUG_ON(txt_heap_base == 0);
> >>> +    printk("SLAUNCH: reserving TXT heap (%#lx - %#lx)\n", txt_heap_base,
> >>> +           txt_heap_base + txt_heap_size);
> >>
> >> Please log ranges in a way that makes it unambiguous whether they're exclusive
> >> or inclusive (especially at the upper end).
> >
> > I'll use start:end notation which I think suggests inclusive bounds.
>
> Please use mathematical notation when logging ranges, i.e. [a,b) or [a,b].
>
> Jan

OK, initially I thought it's too uncommon in log output.

Regards

