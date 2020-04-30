Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9221BF64D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 13:15:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU7A6-0002U3-EH; Thu, 30 Apr 2020 11:15:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lQFv=6O=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1jU7A4-0002Ty-VY
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 11:15:25 +0000
X-Inumbo-ID: e2d309a0-8ad3-11ea-ae69-bc764e2007e4
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2d309a0-8ad3-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 11:15:24 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03UBDIlI112155;
 Thu, 30 Apr 2020 11:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=UmHe1H6wPtrCHpXlVgbnEScgG23D8lHVT+O3L6FXUrg=;
 b=uRnGYT/jYknvwDMEHxo5L1MPnbt/xVFwbxZd/WNjWn4At9V+Y7iw2KbJGB/s03+sEKxz
 5X85hmmckUI92A20joYC5pUFta2vx20qMa8+uw3D/7nKnRtkZnzaRCOK4BsGEoJNdg6W
 wbj7zGbTXgcRBlj60yeoRyGGu4fzC4p0H83BKdRk/wDwICJCLUSObR2TzZ4qdo+i3yqE
 IV3UC/iPVs+3fQTR0rs5eAXNHiVk0BCG838DI+qUyLmGbkNwWkdXaRN2zPxsegLN2IUD
 HV4vgPPQcf+tDdr8PHM8KYoLebGl8UPGg2m2D8ZzCXypLdcSqDhxNLRe/ZNU6iXipXDn Lw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 30p01p1bwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 11:15:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03UBDPDp190368;
 Thu, 30 Apr 2020 11:15:12 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 30qtjwvg6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Apr 2020 11:15:12 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03UBF6Z9011614;
 Thu, 30 Apr 2020 11:15:07 GMT
Received: from tomti.i.net-space.pl (/10.175.213.85)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 30 Apr 2020 04:15:06 -0700
Date: Thu, 30 Apr 2020 13:15:01 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
Message-ID: <20200430111501.336wte64pwsfptze@tomti.i.net-space.pl>
References: <20200429225108.GA54201@bobbye-pc>
 <ebdd7b4a-767b-1b72-a344-78b190f42ceb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebdd7b4a-767b-1b72-a344-78b190f42ceb@suse.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004300093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9606
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004300093
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
Cc: michal.zygowski@3mdeb.com, Bobby Eshleman <bobbyeshleman@gmail.com>,
 olivier.lambert@vates.fr, krystian.hebel@3mdeb.com,
 xen-devel@lists.xenproject.org, ardb@kernel.org, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Adding Ard...

On Thu, Apr 30, 2020 at 09:01:45AM +0200, Jan Beulich wrote:
> On 30.04.2020 00:51, Bobby Eshleman wrote:
> > Hey all,
> >
> > We're looking to develop UEFI Secure Boot support for grub-loaded Xen and
> > ultimately for XCP-ng (I'm on the XCP-ng team at Vates).
> >
> > In addition to carrying the chain-of-trust through the entire boot sequence
> > into dom0, we would also like to build something akin to Linux's Lockdown for
> > dom0 and its privileged interfaces.
> >
> > It appears that there are various options and we'd like to discuss them with
> > the community.
> >
> > # Option #1: PE/COFF and Shim
> >
> > Shim installs a verification protocol available to subsequent programs via EFI
> > boot services.  The protocol is called SHIM_LOCK and it is currently supported
> > by xen.efi.
> >
> > Shim requires the payload under verification to be a PE/COFF executable.  In
> > order to support both shim and maintain the multiboot2 protocol, Daniel Kiper's
> > patchset [1]  (among other things) incorporates the PE/COFF header
> > into xen.gz and adds dom0 verification via SHIM_LOCK in
> > efi_multiboot2().
> >
> > There appears that some work will be needed on top of this patchset, but not
> > much as it seems most of the foot work has been done.
> >
> > AFAIK, the changes needed in GRUB for this approach are already upstream (the
> > shim_lock module is upstream), and shim would go untouched.
> >
> > # Option #2: Extended Multiboot2 and Shim
> >
> > Another approach that could be taken is to embed Xen's signature into a
> > new multiboot2 header and then modify shim to support it.  This would
> > arguably be more readable than embedding the PE/COFF header, would add
> > value to shim, and would fit nicely with the mb2 header code that
> > already exists in Xen.  The downside being that it would require a shim
> > fork.  Grub2 would be unchanged.

Here you have to change the Multiboot2 protocol and singing tools too.
So, I do not consider this as a viable solution.

> > I'm not familliar with Microsoft's signing process.  I do know they
> > support template submissions based on shim, and I'm not sure if such a
> > big change would impact their approval process.
> >
> > # Option #3: Lean on Grub2's LoadFile2() Verification
> >
> > Grub2 will provide a LoadFile2() method to subsequent programs that supports
> > signature verification of arbitrary files.  Linux is moving in the
> > direction of using LoadFile2() for loading the initrd [2], and Grub2 will
> > support verifying the signatures of files loaded via LoadFile2().  This is set
> > for release in GRUB 2.06 sometime in the latter half of 2020.

s/for release in/after release/

> > In Xen, this approach could be used for loading dom0 as well, offering a very
> > simple verified load interface.
> >
> > Currently the initrd argument passed from Linux to LoadFile2() is a vendor
> > media device path GUID [3].
> >
> > Changes to Xen:
> > - Xen would need to pass these device paths to Grub
> > - Xen would be changed to load dom0 with the LoadFile2() interface via boot services
> >
> > Changes to Grub:
> > - Xen dom0 kernel/initrd device paths would need to be introduced to Grub

Maybe partially but certainly there will be some differences...

> > Potential Issues:
> > - How will Xen handle more boot modules than just a dom0 and dom0
> >   initrd?
> > - Would each boot module need a unique vendor guid?

AIUI yes but Ard, who designed this new boot protocol, may say more
about that.

Anyway, the advantage of this new protocol is that it uses UEFI API to
load and execute PE kernel and its modules. This means that it will be
architecture independent. However, IIRC, if we want to add new modules
types to the Xen then we have to teach all bootloaders in the wild about
new GUIDs. Ard, am I correct?

> > - Would this interfere with the DomB proposal?  I suspect not because
> >   the DomB proposal suggests launching DomUs from an already booted
> >   DomB, at which point other means could be used.
> >
> > We'd just like to get the conversation going on this topic before we
> > dive too far into implementing something.  Are any of these approaches a
> > hard no for upstreaming?  Do any stand out as best candidates?  Any
> > feedback / questions / criticisms would be greatly appreciated.
>
> A shim fork doesn't look desirable, which would rule out #2 unless there
> is an option there to avoid the fork.
>
> If the potential issues listed for #3 can be suitably addressed, I can't
> currently see a reason to prefer either of the two remaining options; I
> vaguely recall though that Daniel's change for #1 didn't look overly
> appealing, but perhaps this can be taken care of.

Daniel

