Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E337425F543
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 10:31:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFCYA-0000r7-Gb; Mon, 07 Sep 2020 08:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b7xj=CQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFCY9-0000r2-2w
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 08:30:53 +0000
X-Inumbo-ID: 29abe61a-85b0-4049-9d0d-517db4511b8f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29abe61a-85b0-4049-9d0d-517db4511b8f;
 Mon, 07 Sep 2020 08:30:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B4E4AF39;
 Mon,  7 Sep 2020 08:30:52 +0000 (UTC)
Subject: Re: [PATCH] EFI: Enable booting unified hypervisor/kernel/initrd
 images
To: Trammell Hudson <hudson@trmm.net>
References: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93bec730-ed74-a21c-0ac4-9ed7349df0d4@suse.com>
Date: Mon, 7 Sep 2020 10:30:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <EGZ7EZE5F-c5YJVD9p0TtccTz06ZsdMcL21-BcB64dk9V3x8eKrB3dSDsLbGL4peCaENcp55uRsnWUONZYvrRaQh0tToALcaHRr-QMYNsH0=@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.08.2020 13:51, Trammell Hudson wrote:
> This patch adds support for bundling the xen.efi hypervisor, the xen.cfg
> configuration file, the Linux kernel and initrd, as well as the XSM, and
> CPU microcode into a single "unified" EFI executable.  The resulting EFI
> executable can be invoked directly from the UEFI Boot Manager, removing
> the need to use a separate loader like grub as well as removing
> dependencies on local filesystem access.
> 
> It is inspired by systemd-boot's unified kernel technique and borrows the
> function to locate PE sections from systemd's LGPL'ed code.  During EFI
> boot, Xen looks at its own loaded image to locate the PE sections for
> the configuration, kernel, etc, which are included after building xen.efi
> using objcopy to add named sections for each input file.  This allows an
> administrator to update the components independently without requiring
> rebuilding xen.
> 
> The unified image can also be signed by sbsigntool for verification
> by UEFI Secure Boot.  If secure boot is enabled, the Xen command line
> arguments are ignored.  Unlike the shim based verification, the signature
> covers the entire Xen+config+kernel+initrd unified file. This also ensures
> that properly configured platforms will measure the entire runtime into
> the TPM for unsealing secrets or remote attestation.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

I realize this patch is now stale, and hence there's little point
looking over it. As indicated elsewhere I don't think the gitlab
model is suitable here, so may I ask that you post an up-to-date
patch to the list again?

Thanks, Jan

