Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0211BEC29
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 00:51:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTvXw-0008Pf-UQ; Wed, 29 Apr 2020 22:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MXSB=6N=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1jTvXv-0008Pa-Gj
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 22:51:15 +0000
X-Inumbo-ID: edf673de-8a6b-11ea-ae69-bc764e2007e4
Received: from mail-qt1-x832.google.com (unknown [2607:f8b0:4864:20::832])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edf673de-8a6b-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 22:51:14 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id e17so3421950qtp.7
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 15:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=seb2/D9RvdMJfBjkiDlGc8MKTgqVCXYE1BAnT3EqnTo=;
 b=dUhH15OHuLOFuxTl1EGav/ft+g5kRqNDF1xEL2JSto9GgHmivyPpM9WtsLsbZQgzjf
 AE+oVrfLeS6mwKyRev5Ljy49inb4nq9thwarJFp/gpOYMsMmYndx5f2x0pFnGC/dkorP
 vnjPJKxe7j2hfe4H4YfAc+kdyuPCXUkmzFJagUusVCqmf86f9NpEzLa3xldB/5LIhuI+
 daJ+cy97MrncG1+7gg0SIEtlqVCT3EeIHvAxEJbH9YBWXVRE3f9V8hdjDDoBraQ0Qosp
 PKphiWufpt4IbZPNuNFw0DruL7NLoKF3MYxC0+dSaJe1pHF8i0fop+5l1UlbtYYr+2Ih
 iwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=seb2/D9RvdMJfBjkiDlGc8MKTgqVCXYE1BAnT3EqnTo=;
 b=CZFjrVDvwoaAgRLANbMbvmbusEn4S1croWBP+xoBDvJZBzUs/xEqodFcIqd2ZdDuhH
 abvSTkezL2IOgBaGJNHYd22srsILQrQhTKt/SvOfe9HEveeoQe5Mbzwa631jyoomDfYo
 rQR0QaEMbPP5uW2SCnivU31Vx7YtYX3Y7VkKb3i1LdvxjKo4lvdW9JCPXwaHpdJ8kCey
 1dhr/A0Ge9B8mkUfjJJOSoJSj61GSpnmQPZA3w2V5bjUJ2rtaKMAlefYX5Qy0Lso6CiP
 6PtIEs6xUFQl8AEgKRoNRaqIB9oqO+HIRv/60aIA6qde7xAaEGkGkRU2rC3YY0S51UsH
 uzEQ==
X-Gm-Message-State: AGi0PuZLD9kDuqJzwflFjpqg9yAW66o7bzW3WOK5Dgo+feQ6jk81VBCN
 0x1ZZiumEhUD/mJYkX1GY1/WETFpwn4=
X-Google-Smtp-Source: APiQypKPc4cD+wE26dyP4UCO3+l2ZkosPoQjmE6nnQbXERvg+KXqomZV+r1qClSgWPP8uiJfolo0XQ==
X-Received: by 2002:ac8:7758:: with SMTP id g24mr633111qtu.85.1588200673753;
 Wed, 29 Apr 2020 15:51:13 -0700 (PDT)
Received: from bobbye-pc ([216.186.244.35])
 by smtp.gmail.com with ESMTPSA id s15sm545122qtc.31.2020.04.29.15.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 15:51:12 -0700 (PDT)
Date: Wed, 29 Apr 2020 17:51:08 -0500
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC] UEFI Secure Boot on Xen Hosts
Message-ID: <20200429225108.GA54201@bobbye-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: michal.zygowski@3mdeb.com, daniel.kiper@oracle.com,
 krystian.hebel@3mdeb.com, olivier.lambert@vates.fr, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hey all,

We're looking to develop UEFI Secure Boot support for grub-loaded Xen and
ultimately for XCP-ng (I'm on the XCP-ng team at Vates).

In addition to carrying the chain-of-trust through the entire boot sequence
into dom0, we would also like to build something akin to Linux's Lockdown for
dom0 and its privileged interfaces.

It appears that there are various options and we'd like to discuss them with
the community.

# Option #1: PE/COFF and Shim

Shim installs a verification protocol available to subsequent programs via EFI
boot services.  The protocol is called SHIM_LOCK and it is currently supported
by xen.efi.

Shim requires the payload under verification to be a PE/COFF executable.  In
order to support both shim and maintain the multiboot2 protocol, Daniel Kiper's
patchset [1]  (among other things) incorporates the PE/COFF header
into xen.gz and adds dom0 verification via SHIM_LOCK in
efi_multiboot2().

There appears that some work will be needed on top of this patchset, but not
much as it seems most of the foot work has been done.

AFAIK, the changes needed in GRUB for this approach are already upstream (the
shim_lock module is upstream), and shim would go untouched.

# Option #2: Extended Multiboot2 and Shim

Another approach that could be taken is to embed Xen's signature into a
new multiboot2 header and then modify shim to support it.  This would
arguably be more readable than embedding the PE/COFF header, would add
value to shim, and would fit nicely with the mb2 header code that
already exists in Xen.  The downside being that it would require a shim
fork.  Grub2 would be unchanged.

I'm not familliar with Microsoft's signing process.  I do know they
support template submissions based on shim, and I'm not sure if such a
big change would impact their approval process.

# Option #3: Lean on Grub2's LoadFile2() Verification

Grub2 will provide a LoadFile2() method to subsequent programs that supports
signature verification of arbitrary files.  Linux is moving in the
direction of using LoadFile2() for loading the initrd [2], and Grub2 will
support verifying the signatures of files loaded via LoadFile2().  This is set
for release in GRUB 2.06 sometime in the latter half of 2020.

In Xen, this approach could be used for loading dom0 as well, offering a very
simple verified load interface.

Currently the initrd argument passed from Linux to LoadFile2() is a vendor
media device path GUID [3].

Changes to Xen:
- Xen would need to pass these device paths to Grub
- Xen would be changed to load dom0 with the LoadFile2() interface via boot services

Changes to Grub:
- Xen dom0 kernel/initrd device paths would need to be introduced to Grub

Potential Issues:
- How will Xen handle more boot modules than just a dom0 and dom0
  initrd?
- Would each boot module need a unique vendor guid?
- Would this interfere with the DomB proposal?  I suspect not because
  the DomB proposal suggests launching DomUs from an already booted
  DomB, at which point other means could be used.

We'd just like to get the conversation going on this topic before we
dive too far into implementing something.  Are any of these approaches a
hard no for upstreaming?  Do any stand out as best candidates?  Any
feedback / questions / criticisms would be greatly appreciated.

Thanks,
Bobby Eshleman


# References

1. Daniel Kiper's patchset:
    https://lists.xenproject.org/archives/html/xen-devel/2018-06/msg01292.html
2. Linux loading initrd with LoadFile2():
    https://lkml.org/lkml/2020/2/17/331
3. The vendor media guid for initrd:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/firmware/efi/libstub/efi-stub-helper.c#n311

