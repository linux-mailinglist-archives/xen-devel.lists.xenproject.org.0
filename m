Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCB6D68D2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518070.804233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjWy-0003Yh-3d; Tue, 04 Apr 2023 16:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518070.804233; Tue, 04 Apr 2023 16:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjWx-0003Vk-Vz; Tue, 04 Apr 2023 16:29:11 +0000
Received: by outflank-mailman (input) for mailman id 518070;
 Tue, 04 Apr 2023 16:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7Av=73=citrix.com=prvs=45137d3e2=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pjjWx-0003Ve-0a
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:29:11 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d279d7c6-d305-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 18:29:09 +0200 (CEST)
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
X-Inumbo-ID: d279d7c6-d305-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680625749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=muyEy+imng+MiuS0rC7GNqhnQwFZmakSOGOJA1lr+IM=;
  b=EZQUfEaG6DqHe/5dnXKjbQUx7Cl9BPUw6Dy5D0Qf6JeaKkhPJM+sUtF/
   LMb2mCwsSoFuhJYHw/gNTg2OaBR8Adfup2PHb/AXqzscXcPu06ncCTQfJ
   zZROcIDK1a/f9dPDX2dOmsTYLNki0wnpXCipBv/PzHtMj89UZPRCUDMhG
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106727183
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jRNvnK/ES7sHIGEiyo3jDrUDvn6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 jAYWzzVP/aOZDT1KN93Ot6z8BwD75eDyNNkGwZo/H88E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklp9
 MxfJSFcdCvaiuC8/JHkS+Zp3J0KeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0MxhjH/
 D2frz+R7hcyDPnC2x3c3lGVp9CXvT3dYIY+BJn76as/6LGU7jNKU0BHPbehmtGhh1KzQZRfL
 F0Z4QInt610/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMrtYk9RTEs/
 laTmpXiAjkHmLeYU26H/7GY6za7IzEILHQqbDUBCwAC5rHLv4Ubnh/JCNF5H8adh8X4Azjqz
 xiWrSI1gPMYistj6kmg1QmZ2XT2/MGPF1NroFyNBQpJ8z+VeqaCZrzv5EmK980ZIYSTcnrev
 XcBwZG3ubVm4Y62qMCdfAkcNOj3t67baGGH0AIH84oJrGr0pSP6FWxEyHQnfRoybJ5ZEdP8S
 BWL0T698qO/K5dDgUVfR4uqQ/onwqH7fTgOfqCFN4EeCnSdmeLuwc2PWaJz9zq3+KTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6rl0n7j+vEPyTLGd/p1WdiichgtMu5TPj9q
 Y4DZ6NmNT0EOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+H+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQOi1Aswl9S5jbHRE0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:IBAPkahctH3S8mul+LPfnLaXXnBQX9923DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQJVpQRvnlaKdkrNhRotKPTOW81dAQ7sSibcKrwePJ8S6zJ8l6U
 4CSdk1NDSTNykcsS+S2mDRf7kdKZu8gcaVbIzlvhRQpHRRGsRdBnBCe2Sm+yNNJTVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zutsDGj5XvZD8BHloC5BOVhT2lxbbmG1zAty1uHw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69B7icbs0dxKAe2Lk4wwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103LyzA18ULvzleenD/KvdH5bChSMbsOuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBRkFauq3ZKq59Ts5Ufa/pfVFZil/1cwKpnKuZEIMs80vFiLA
 BaNrCe2B+RSyLcU5mWhBgo/DXmZAVIIv7PeDl+hiXS6UkYoJkx9Tpm+CQS801wiK4VWt1K4f
 /JPb9vk6wLRsgKbbhlDONEWsevDHfRKCi8Rl56DG6XYJ3vAUi93KLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwbrBdeV1JNG/xjRSCHlNA6dgv129tx8oPnxVbDrOSqMRBQnlNahuewWBoneV+
 yoMJxbDvf/JS/lGJpP3Qf5R55OQENuGfE9q5I+QRaDs8jLIorluqjSd+vSPqPkFXI+Vmb2Eh
 I4LU3OzQV7nzKWs1PD8WjssinWCzLCFLpLYdnn1vlWzpQRPYtRtQVQgUil56iwWE5/jpA=
X-IronPort-AV: E=Sophos;i="5.98,318,1673931600"; 
   d="scan'208";a="106727183"
Date: Tue, 4 Apr 2023 17:28:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Hoyes <peter.hoyes@arm.com>
CC: <xen-devel@lists.xenproject.org>, <wei.chen@arm.com>,
	<bertrand.marquis@arm.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/xendomains: Only save/restore/migrate if supported
 by xenlight
Message-ID: <fa320fd7-31fa-4e96-a804-172e70ef1c80@perard>
References: <20230322135800.3869458-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230322135800.3869458-1-peter.hoyes@arm.com>

On Wed, Mar 22, 2023 at 01:58:00PM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Saving, restoring and migrating domains are not currently supported on
> arm and arm64 platforms, so xendomains prints the warning:
> 
>   An error occurred while saving domain:
>   command not implemented
> 
> when attempting to run `xendomains stop`. It otherwise continues to shut
> down the domains cleanly, with the unsupported steps skipped.

The patch looks kind of ok, but shouldn't $XENDOMAINS_SAVE be set to an
empty string in the config by the admin instead?

Or is the issue that $XENDOMAINS_SAVE is set by default, even on arm* ?

Maybe it's easier to check that the command is implemented at run time
rather than trying to have a good default value for XENDOMAINS_SAVE at
install/package time.

> Use `xl help` to detect whether save/restore/migrate is supported by the
> platform. If not, do not attempt to run the corresponding command.
> 
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> ---
>  tools/hotplug/Linux/xendomains.in | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/hotplug/Linux/xendomains.in b/tools/hotplug/Linux/xendomains.in
> index 70f4129ef4..bafcb874e1 100644
> --- a/tools/hotplug/Linux/xendomains.in
> +++ b/tools/hotplug/Linux/xendomains.in
> @@ -229,6 +229,15 @@ parseln()
>      [ -n "$name" -a -n "$id" ] && return 0 || return 1
>  }
>  
> +subcmd_supported()
> +{
> +    local output
> +    output=$("$CMD help | grep "^ $1"")
> +    if [ ! "$output" ]; then
> +        return 1
> +    fi

It looks like some quote are in the wrong place. You probably wanted to
write:
    output="$($CMD help | grep "^ $1")"

But I'd like to have this slightly more robust, to match the whole
command, rather than the beginning.
(For example `subcmd_supported "pci"` would reture true even if no "pci"
command exist.)

Something like:
    $CMD help | grep "^ $1\( \|$\)"
To check that the command name is followed by a space or end-of-line
(even if it seems that there's always a space printed.)
A similar pattern is used in "tools/xl/bash-completion", so it should
probably be fine in the future.

Then, we don't really need the "$output" from grep, we could just ask it
if there's a match or not, with --quiet:
    $CMD help | grep -q "^ $1\( \|$\)"

And that would be the whole function. Would that works for you?


The rest of the patch looks fine.

Thanks,

-- 
Anthony PERARD

