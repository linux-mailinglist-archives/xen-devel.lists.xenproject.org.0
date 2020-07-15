Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1382214F0
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 21:17:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvmtw-0001xB-FE; Wed, 15 Jul 2020 19:17:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mv0N=A2=panix.com=marcotte@srs-us1.protection.inumbo.net>)
 id 1jvmtv-0001x5-Fe
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 19:17:07 +0000
X-Inumbo-ID: c57e20d3-c6cf-11ea-9442-12813bfff9fa
Received: from mailbackend.panix.com (unknown [166.84.1.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c57e20d3-c6cf-11ea-9442-12813bfff9fa;
 Wed, 15 Jul 2020 19:17:06 +0000 (UTC)
Received: from panix5.panix.com (panix5.panix.com [166.84.1.5])
 by mailbackend.panix.com (Postfix) with ESMTP id 4B6Rw15XLqz1Bb8;
 Wed, 15 Jul 2020 15:17:05 -0400 (EDT)
Received: by panix5.panix.com (Postfix, from userid 13564)
 id 4B6Rw15RRSzfYm; Wed, 15 Jul 2020 15:17:05 -0400 (EDT)
Date: Wed, 15 Jul 2020 15:17:05 -0400
From: Brian Marcotte <marcotte@panix.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Subject: Re: [Xen-devel] XEN Qdisk Ceph rbd support broken?
Message-ID: <20200715191705.GA20643@panix.com>
References: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
 <763e69df40604c51bb72477c706ec24b@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <763e69df40604c51bb72477c706ec24b@EX13D32EUC003.ant.amazon.com>
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
Cc: Jules <jules@ispire.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "oleksandr_grytsov@epam.com" <oleksandr_grytsov@epam.com>,
 "wl@xen.org" <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This issue with Xen 4.13 and Ceph/RBD was last discussed back in February.

> Remote network Ceph image works fine with Xen 4.12.x ...
> 
> In Xen 4.13.0 which I have tested recently it blames with the error
> message "no such file or directory" as it would try accessing the image
> over filesystem instead of remote network image.
> ---
> 
> I doubt the issue is in xl/libxl; sounds more likely to be in QEMU. The
> PV block backend infrastructure in QEMU was changed between the 4.12
> and 4.13 releases. Have you tried using an older QEMU with 4.13?

I'm also encountering the problem:

    failed to create drive: Could not open 'rbd:rbd/machine.disk0': No such file or directory

Xenstore has "params" like this:

    aio:rbd:rbd/machine.disk0

If I set it to "rbd:rbd/machine.disk0", I get a different message:

  failed to create drive: Parameter 'pool' is missing

Using upstream QEMU versions 2 or 3 works fine.

The interesting thing is that access by the virtual BIOS works fine. So,
for a PVHVM domain, GRUB loads which loads a kernel, but the kernel can't
access the disks.

--
- Brian

