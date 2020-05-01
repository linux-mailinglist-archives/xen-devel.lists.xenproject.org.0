Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FCF1C11C2
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUULE-0002ib-Hg; Fri, 01 May 2020 12:00:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLKT=6P=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1jUULD-0002iW-4E
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:00:27 +0000
X-Inumbo-ID: 5769e3a4-8ba3-11ea-9b00-12813bfff9fa
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5769e3a4-8ba3-11ea-9b00-12813bfff9fa;
 Fri, 01 May 2020 12:00:25 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 041Br5FN133462;
 Fri, 1 May 2020 12:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=L7cRxAV2fSsC98+NEgXP0poAtObZaznUM2AQxwN8m4c=;
 b=XoBp7z6LoEoz4Zmn9+pncrkBf8HB9TKUGJCadEq0tUuPXzcBfb0qP6P03607f8ncCc1i
 D3lNxYY+BMSN3itr0fdbzK0xYhPa8n99fgGZDkD3JVDmbDlSGhO1K41Y8iR2KIgGynIJ
 gf0TXWf5fb3X08qe9tgxDkIgPmPgwMPBfAF2bGxYughgkBKJ3hKlxGh6u7ix7J5fwD2H
 j0CDrbVx2byzd5JxWtZvM3JOKr+0c0iAWB9h9Bgs6LCsF6XUyKpMTP0qDT1edDstTNlQ
 uafH0vBG8zdSTuIoQHZmQENgD4U/5x411SBVlZfWC7qRUc52IvP/TWkP+S4fUZ4BSSzr XA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 30r7f3hwjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 May 2020 12:00:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 041BqxOa146692;
 Fri, 1 May 2020 12:00:12 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 30r7fabrb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 May 2020 12:00:12 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 041C037G022330;
 Fri, 1 May 2020 12:00:04 GMT
Received: from tomti.i.net-space.pl (/10.175.206.116)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 01 May 2020 05:00:03 -0700
Date: Fri, 1 May 2020 13:59:59 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
Message-ID: <20200501115959.m5pwm735mxbrs66a@tomti.i.net-space.pl>
References: <20200429225108.GA54201@bobbye-pc> <20200430222717.GA6364@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200430222717.GA6364@mail-itl>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9607
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005010093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9607
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005010093
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
 xen-devel@lists.xenproject.org, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 01, 2020 at 12:27:17AM +0200, Marek Marczykowski-Górecki wrote:
> On Wed, Apr 29, 2020 at 05:51:08PM -0500, Bobby Eshleman wrote:
> > # Option #3: Lean on Grub2's LoadFile2() Verification
> >
> > Grub2 will provide a LoadFile2() method to subsequent programs that supports
> > signature verification of arbitrary files.  Linux is moving in the
> > direction of using LoadFile2() for loading the initrd [2], and Grub2 will
> > support verifying the signatures of files loaded via LoadFile2().
>
> This description gives me flashbacks to how xen.efi loads dom0
> kernel+initramfs (Loaded Image Protocol). Practical issues encountered:
>
> 1. It works only when xen.efi is loaded via appropriate EFI boot
> service directly. If xen.efi is loaded by a filesystem driver in
> grub/other bootloader, it can't load dom0 kernel+initramfs.
>
> 2. Given variety of UEFI implementations and boot medias, it was almost
> impossible to force bootloader to use the right file loading method
> (cases like the same file accessible both via UEFI fs0: and via grub's
> filesystem driver). Which means loading xen.efi via a bootloader (as
> opposed to directly from UEFI) was hit or miss (mostly miss).
>
> 3. To avoid the above issue, one was forced to load xen.efi directly
> from EFI. This gave up any possibility to manipulate xen cmdline, or
> even choose system to boot in case of some EFI implementations.

Are you talking about GRUB chainloader command? If yes then use "set root=..."
to select ESP before running the chainloader. Of course the xen.cfg,
kernel and initramfs have to live on ESP then. Xen uses UEFI file system
calls which understand FAT only. And if GRUB root points to non-FAT
partition than Xen cannot read anything from it...

> 4. Even if one is lucky to boot xen.efi via grub2-efi, then still only
> xen options could be modified. But not those for dom0.
>
> 5. It was impossible to load xen/kernel/initrd using fancy grub/ipxe
> features like HTTP.

Why cannot you use multiboot2/module2 to load Xen from GRUB on x86 UEFI
machines? It does not have issues discussed above. Additionally, the
Multiboot2 protocol works on legacy BIOS machines too.

> In practice the above points mean:
>
> * To get a usable product, one is forced to enable all kind of
>   workarounds (not only related to EFI) _in default configuration_,
>   because otherwise there is very little chance to enable them only when
>   needed.
>
> * If something goes wrong, in most cases you need to boot from
>   alternative media (to edit xen.cfg, or efi variables). If you happen
>   to forget your rescue usb stick, you are out of luck.
>
> So, please, can someone confirm the LoadFile2() approach wouldn't have
> any of the above issues?

If it is done properly it should not.

Daniel

