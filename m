Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF451BF0B7
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 09:02:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU3Cg-0004PS-QN; Thu, 30 Apr 2020 07:01:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU3Cf-0004OQ-9V
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 07:01:49 +0000
X-Inumbo-ID: 75143c7c-8ab0-11ea-9a07-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75143c7c-8ab0-11ea-9a07-12813bfff9fa;
 Thu, 30 Apr 2020 07:01:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A60E8AC44;
 Thu, 30 Apr 2020 07:01:45 +0000 (UTC)
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
To: Bobby Eshleman <bobbyeshleman@gmail.com>
References: <20200429225108.GA54201@bobbye-pc>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ebdd7b4a-767b-1b72-a344-78b190f42ceb@suse.com>
Date: Thu, 30 Apr 2020 09:01:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429225108.GA54201@bobbye-pc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 krystian.hebel@3mdeb.com, xen-devel@lists.xenproject.org,
 olivier.lambert@vates.fr, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.2020 00:51, Bobby Eshleman wrote:
> Hey all,
> 
> We're looking to develop UEFI Secure Boot support for grub-loaded Xen and
> ultimately for XCP-ng (I'm on the XCP-ng team at Vates).
> 
> In addition to carrying the chain-of-trust through the entire boot sequence
> into dom0, we would also like to build something akin to Linux's Lockdown for
> dom0 and its privileged interfaces.
> 
> It appears that there are various options and we'd like to discuss them with
> the community.
> 
> # Option #1: PE/COFF and Shim
> 
> Shim installs a verification protocol available to subsequent programs via EFI
> boot services.  The protocol is called SHIM_LOCK and it is currently supported
> by xen.efi.
> 
> Shim requires the payload under verification to be a PE/COFF executable.  In
> order to support both shim and maintain the multiboot2 protocol, Daniel Kiper's
> patchset [1]  (among other things) incorporates the PE/COFF header
> into xen.gz and adds dom0 verification via SHIM_LOCK in
> efi_multiboot2().
> 
> There appears that some work will be needed on top of this patchset, but not
> much as it seems most of the foot work has been done.
> 
> AFAIK, the changes needed in GRUB for this approach are already upstream (the
> shim_lock module is upstream), and shim would go untouched.
> 
> # Option #2: Extended Multiboot2 and Shim
> 
> Another approach that could be taken is to embed Xen's signature into a
> new multiboot2 header and then modify shim to support it.  This would
> arguably be more readable than embedding the PE/COFF header, would add
> value to shim, and would fit nicely with the mb2 header code that
> already exists in Xen.  The downside being that it would require a shim
> fork.  Grub2 would be unchanged.
> 
> I'm not familliar with Microsoft's signing process.  I do know they
> support template submissions based on shim, and I'm not sure if such a
> big change would impact their approval process.
> 
> # Option #3: Lean on Grub2's LoadFile2() Verification
> 
> Grub2 will provide a LoadFile2() method to subsequent programs that supports
> signature verification of arbitrary files.  Linux is moving in the
> direction of using LoadFile2() for loading the initrd [2], and Grub2 will
> support verifying the signatures of files loaded via LoadFile2().  This is set
> for release in GRUB 2.06 sometime in the latter half of 2020.
> 
> In Xen, this approach could be used for loading dom0 as well, offering a very
> simple verified load interface.
> 
> Currently the initrd argument passed from Linux to LoadFile2() is a vendor
> media device path GUID [3].
> 
> Changes to Xen:
> - Xen would need to pass these device paths to Grub
> - Xen would be changed to load dom0 with the LoadFile2() interface via boot services
> 
> Changes to Grub:
> - Xen dom0 kernel/initrd device paths would need to be introduced to Grub
> 
> Potential Issues:
> - How will Xen handle more boot modules than just a dom0 and dom0
>   initrd?
> - Would each boot module need a unique vendor guid?
> - Would this interfere with the DomB proposal?  I suspect not because
>   the DomB proposal suggests launching DomUs from an already booted
>   DomB, at which point other means could be used.
> 
> We'd just like to get the conversation going on this topic before we
> dive too far into implementing something.  Are any of these approaches a
> hard no for upstreaming?  Do any stand out as best candidates?  Any
> feedback / questions / criticisms would be greatly appreciated.

A shim fork doesn't look desirable, which would rule out #2 unless there
is an option there to avoid the fork.

If the potential issues listed for #3 can be suitably addressed, I can't
currently see a reason to prefer either of the two remaining options; I
vaguely recall though that Daniel's change for #1 didn't look overly
appealing, but perhaps this can be taken care of.

Jan

