Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A377A46DE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 12:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603877.940992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBQg-0000Of-6V; Mon, 18 Sep 2023 10:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603877.940992; Mon, 18 Sep 2023 10:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBQg-0000Lo-3S; Mon, 18 Sep 2023 10:24:34 +0000
Received: by outflank-mailman (input) for mailman id 603877;
 Mon, 18 Sep 2023 10:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dfG=FC=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qiBQe-0000Lg-1q
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 10:24:32 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ce99fb9-560d-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 12:24:29 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40413ccdd4cso24905005e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 03:24:29 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d4e46000000b003198a9d758dsm12276482wrt.78.2023.09.18.03.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 03:24:28 -0700 (PDT)
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
X-Inumbo-ID: 8ce99fb9-560d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695032669; x=1695637469; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4csCo98SFPF/t8aNOYFxQ/Pn3qJR+7DUcS4URFBx20Q=;
        b=YhlYStCMasCPh6h0ZS0CHRYsqDDnqVH9DM4jVHXSuVbfhu5KjZOFACJJ52WLQ8uLxH
         ZSQZKCNtgmsDYD5XHUmLJz/YGW3fJDHXgTqk7mdEU3Vbxzxg0Py6WcG3vtwcE04rHIGd
         s+p1pV3CW44KoZSao9GOVTy5JgSuUjm0xYkDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695032669; x=1695637469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4csCo98SFPF/t8aNOYFxQ/Pn3qJR+7DUcS4URFBx20Q=;
        b=Ab5VHvSTL7TbZ4hkNEpC3lUix3zN5uR6fjyG6pywnBzx2HH/kqeeGRoJg0BER3FKRU
         fTVqCyKMRlXr+nwJ5DUDdKjg337PbNMRRk0TfsExPpOrwpf6SIqM4dYAM3ZtG/ueil58
         Gbj2pUEV5O5tjcnESKh5JelwxhlwBKCVaMC+mPukDDSqegusynURyOpmpXuUe0XTOCO3
         O/piQ1/VjikvFW7vtJfEdzgRpARD8Hk2roRIQ/f1VjimjyaMxpFK4aCpFENGoc74UsO/
         DZ80fjnlr/RV9Dnv35mDJmEfbwiVfwXPhK+cZDDnHFbFtWGwxTLqWxwblReyXzCZ26qT
         irVg==
X-Gm-Message-State: AOJu0YySipf5jSwQ9IP1x+38ZIvtnzgCl5mYXAAUDs2p0UAk9ElA3Vrv
	pNG/wU1fxdbrVHK4Sw5U4PLm7g==
X-Google-Smtp-Source: AGHT+IFM8npHhSmftG+6Z8+bNStEJKJ4qX8ihyGhVdRes0QfmvLzU4xSlO71AjWVIxSK3GyzuZ1ARg==
X-Received: by 2002:a5d:65cc:0:b0:314:3e96:bd7e with SMTP id e12-20020a5d65cc000000b003143e96bd7emr9414109wrw.4.1695032669017;
        Mon, 18 Sep 2023 03:24:29 -0700 (PDT)
Date: Mon, 18 Sep 2023 11:24:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.18 v2] tools/light: Revoke permissions when a PCI
 detach for HVM domain
Message-ID: <846234c5-c82a-4828-96ab-b41fcc308840@perard>
References: <20230915125204.22719-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915125204.22719-1-julien@xen.org>

On Fri, Sep 15, 2023 at 01:52:04PM +0100, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, libxl will grant IOMEM, I/O port and IRQ permissions when
> a PCI is attached (see pci_add_dm_done()) for all domain types. However,
> the permissions are only revoked for non-HVM domain (see do_pci_remove()).
> 
> This means that HVM domains will be left with extra permissions. While
> this look bad on the paper, the IRQ permissions should be revoked
> when the Device Model call xc_physdev_unmap_pirq() and such domain
> cannot directly mapped I/O port and IOMEM regions. Instead, this has to
> be done by a Device Model.
> 
> The Device Model can only run in dom0 or PV stubdomain (upstream libxl
> doesn't have support for HVM/PVH stubdomain).
> 
> For PV/PVH stubdomain, the permission are properly revoked, so there is
> no security concern.
> 
> This leaves dom0. There are two cases:
>   1) Privileged: Anyone gaining access to the Device Model would already
>      have large control on the host.
>   2) Deprivileged: PCI passthrough require PHYSDEV operations which
>      are not accessible when the Device Model is restricted.
> 
> So overall, it is believed that the extra permissions cannot be exploited.
> 
> Rework the code so the permissions are all removed for HVM domains.
> This needs to happen after the QEMU has detached the device. So
> the revocation is now moved to pci_remove_detached().
> 
> Also add a comment on top of the error message when the PIRQ cannot
> be unbind to explain this could be a spurious error as QEMU may have
> already done it.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
>     Changes since v1:
>         * Move the code to revoke in pci_remove_detached()
>         * Add a comment on top of the PIRQ unbind error path
>         * Use goto to deal with errors.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

