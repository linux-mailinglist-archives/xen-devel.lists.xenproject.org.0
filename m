Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB2962FEFB
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 21:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445902.701315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow8GN-0008Q8-AT; Fri, 18 Nov 2022 20:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445902.701315; Fri, 18 Nov 2022 20:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow8GN-0008Mz-7d; Fri, 18 Nov 2022 20:47:03 +0000
Received: by outflank-mailman (input) for mailman id 445902;
 Fri, 18 Nov 2022 20:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g77P=3S=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ow8GL-0008Mt-NS
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 20:47:01 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25b818c8-6782-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 21:46:59 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id gv23so15895428ejb.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Nov 2022 12:46:59 -0800 (PST)
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
X-Inumbo-ID: 25b818c8-6782-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5mIJKaMx1pQwhku2nm6bI31JWHjArdgLDjzIVWQmzw=;
        b=p6G0G6EmyfrWheZD8YdSOgeWzjDKm8jq9RXjYThdcRilvkW/x7/9i5Iv+x+3+VNTtM
         aYFi5FUuKw4c4HpSqMOp4oyAn9yUVMVpOzIq3W3rN7ZFtwME6UWQP21JxkI4kO0e3V5l
         p/jMO/XmminachraU1I6jznhFkTMgGTCgUKqrSkIgF4zfLxaP1kXDlqfs26JXpqGAh16
         Q9HbkH3+JdCgcPV0kCanVuWpcrquQ61jFWku3miKhdg2Vuxgj1mopqUH9nvBT4F9rpwR
         2h7/eTXetDDT9Okvv92D8PlgXeo82Ni9s+lmuyvyk+btnRv0J5EQNtoGzSWPg493nvJL
         flhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5mIJKaMx1pQwhku2nm6bI31JWHjArdgLDjzIVWQmzw=;
        b=kX3uoxHGxZjy55ByVpkVfrSpvCK4auvERc65p+5sv6xQAQcG9+YABfConnIdFH3JQp
         9rFTydbtNcwWd2G3SvELG4zRT1fipiTo+gb24jTDxzyzuo8wL+f0njbBQCSghn3rwwT3
         HR3WD1VPdtY+AVTOq2YLSwfkK+c7Ryt3YKSquswjl65CfhVT3py868/PxmjDAqHT+qxl
         OF5byDgWPM++2u/Gn7g4iz0mQjg00HJhIWlczJ5t63x+WLo8DybD0oAqfZHBzpBwYpoV
         YRmfrRlcr1sFyQQ/cu4Era8aocKZpYOoCWplZqz4FqVCozyf/gwFDmR0wzPJEENSfkD1
         Nl6A==
X-Gm-Message-State: ANoB5plfO8B2XQUiikawZupMTcsGzIe6jNmHDRBE3A4G+8JvLViLd/nL
	nz3RzjaDzQwnuvuOrALdYodMVrt/i+vxsx4DIKn5UAQksnM=
X-Google-Smtp-Source: AA0mqf5WICxI6NK59qKF2yN268AeQmX+15/dr5sYNyDhDKSnHOrrc88T6Mmb4wPczvMKKxnxv6B9WAiLIRxQLi+WC3g=
X-Received: by 2002:a17:906:65c4:b0:7ad:d250:b907 with SMTP id
 z4-20020a17090665c400b007add250b907mr7182127ejn.737.1668804419101; Fri, 18
 Nov 2022 12:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20221118154931.1928298-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20221118154931.1928298-1-marmarek@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 18 Nov 2022 15:46:47 -0500
Message-ID: <CAKf6xpuCxftyQ+PKN_ffJ0onsSxcT8kVSwkM7Z10pfjqf0XFgA@mail.gmail.com>
Subject: Re: [PATCH v3] xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2022 at 10:50 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> Linux enables MSI-X before disabling INTx, but keeps MSI-X masked until
> the table is filled. Then it disables INTx just before clearing MASKALL
> bit. Currently this approach is rejected by xen-pciback.
> According to the PCIe spec, device cannot use INTx when MSI/MSI-X is
> enabled (in other words: enabling MSI/MSI-X implicitly disables INTx).
>
> Change the logic to consider INTx disabled if MSI/MSI-X is enabled. This
> applies to three places:
>  - checking currently enabled interrupts type,
>  - transition to MSI/MSI-X - where INTx would be implicitly disabled,
>  - clearing INTx disable bit - which can be allowed even if MSI/MSI-X is
>    enabled, as device should consider INTx disabled anyway in that case
>
> Fixes: 5e29500eba2a ("xen-pciback: Allow setting PCI_MSIX_FLAGS_MASKALL t=
oo")
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
> Changes in v3:
>  - allow clearing INTx regardless of MSI/MSI-X state, to be consistent
>    with enabling MSI/MSI-X
> Changes in v2:
>  - restructure the patch to consider not only MASKALL bit, but enabling
>    MSI/MSI-X generally, without explicitly disabling INTx first
> ---

I was trying to test your xen-pciback v3 patch, and I am having
assignment fail consistently now.  It is actually failing to
quarantine to domIO in the first place, which matches the failure from
the other day (when I more carefully read through the logs).  It now
consistently fails to quarantine on every boot unlike the other day
where it happened once.

I added some printks and it 's getting -EBUSY from pdev_msix_assign()
which means pci_reset_msix_state() is failing:
    if ( pci_conf_read16(pdev->sbdf, msix_control_reg(pos)) &
         PCI_MSIX_FLAGS_MASKALL )
        return -EBUSY;

# lspci -vv -s 14.3
...
    Capabilities: [80] MSI-X: Enable- Count=3D16 Masked+
        Vector table: BAR=3D0 offset=3D00002000
        PBA: BAR=3D0 offset=3D00003000

So it looks like MASKALL is set and prevents assignment.

setpci -s 00:14.3 82.W=3Df
cleared that out for me and I could assign the device.

My dom0 boots, it runs flask-label-pci for a set of PCI devices
(including iwlwifi), then xl pci-assignable-add for all PCI devices
which will be passed through, then a little later it boots the
associated domains.  Dom0 does not have a driver for iwlwifi.

I'll have to investigate more to see how MASKALL is getting set.  This
had not been an issue before your recent patches.

Regards,
Jason

