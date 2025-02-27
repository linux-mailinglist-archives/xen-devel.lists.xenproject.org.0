Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115FCA47B9E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 12:15:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897976.1306582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnbqp-0003d2-DL; Thu, 27 Feb 2025 11:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897976.1306582; Thu, 27 Feb 2025 11:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnbqp-0003bZ-AR; Thu, 27 Feb 2025 11:14:47 +0000
Received: by outflank-mailman (input) for mailman id 897976;
 Thu, 27 Feb 2025 11:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jS7=VS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnbqn-0003bT-Kl
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 11:14:45 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 080fdbf3-f4fc-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 12:14:37 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43b5859d1f1so4289975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2025 03:14:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f75ebsm19652195e9.3.2025.02.27.03.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 03:14:36 -0800 (PST)
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
X-Inumbo-ID: 080fdbf3-f4fc-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740654877; x=1741259677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YUtr95GKWhnzRJsRgiTPYX2+6xyQgl5TEBASs3slYtM=;
        b=HvfJkZnA3RWm7D1lxbx1VRnSfv5bf/cSaIzyanxM/F09Q/Rbx+ZCCfYvJCqHUMyxkb
         HEk0DQsRzP9NyXTe2B/PIF7EQOsLJtQdAdeMPS4Fd0a5lb8tBMaiJ1pY+aYGA6y7dgOM
         cga+arsD+34ABNsd4GpgeK3RuxCTQ7BqBjWro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740654877; x=1741259677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUtr95GKWhnzRJsRgiTPYX2+6xyQgl5TEBASs3slYtM=;
        b=a3x8//zQ4TeSMJsDDLABJR9kMJ+JUnY387m/VBS64551F/zpE8WMulb5Y6VZkNd20J
         VqFQac1aPVz7SiSOaOIfJ3VdxFVfK5zkDw/SibQEmH6MX6PZMnVMUtkj5OiGMqJbxoQS
         stWU8B7OzDFLTeZNIpyNFqUpyZy2Rsz5Gy1k6E78cG59mmDbudL24424kMQsIHjxE6jz
         UeYjcylQ6D9r9+znTboMM8dYlBzDdT6OLwdxOW9HbbYdo0zRArzlQmzJL/nk14EL+/jL
         vsgBlZ7WK2LO3CSQlvIBuz3hD2HNFZjfDBlQ885XvVODKwg2TdV4rjtIxbYQHP3dnYEM
         BwHA==
X-Forwarded-Encrypted: i=1; AJvYcCXqbPmRj87yharG1xlcfu2uW0lUbW1F1ZnIMViiL0DCxupn+eKg0dY5ECfk/wjQ6kymuv55KNyPK7I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yziz6IqIDJo8nGxss965IM3OGclYLeLEgtaDZoRpQmPTOz9IJUQ
	4zjMJCcTgJKFnFx2D6SLThtAEdkB8NexLRbXer6+3iPRVinJQyTD7mti7hgfdNA=
X-Gm-Gg: ASbGncvIzWqDDh4m6rE2CKwXSUyvztOZJWDtFtGMa9o2tIJ5akkw3qRlY4EykgmcwOR
	6GNPJ2MPe1AwPwo0E/5gWknPKwGhI7aYf4xmk0YjaybtpCKNUEaOzZIovv0B0y7b5/NtyNh7nbi
	fIDkdynHq9GrV5d5Ngoc4+t7+VQ4vEE0cDHF0H/M7wPzuxcPDhT1BFZOxG3C/03rrdS7Kp2m4mW
	jgVlbjAsSLycDy8aFvsS/5hsB3IUga6/mHoF63YLSj9ja5RIMNEd572OIbkmHUgSt7WgyMagqAM
	cazlzINspaQqNMSYUXlnoSKHJyNqjV5dKLFGMkPqcXzXWu82uzs62vsFeou42HbODQ==
X-Google-Smtp-Source: AGHT+IHzsX5UNv/6fadEcyGTieb0oJ2e1n9qyCjpagS7wbUWokUb96+amUlwsCFiacXePRZbZWk3WA==
X-Received: by 2002:a05:600c:154e:b0:439:a01d:379c with SMTP id 5b1f17b1804b1-43ab0f285b9mr100543165e9.4.1740654877162;
        Thu, 27 Feb 2025 03:14:37 -0800 (PST)
Message-ID: <017a0d9f-18ea-4fac-8c8e-7dbf61652aed@citrix.com>
Date: Thu, 27 Feb 2025 11:14:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250226211125.43625-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 9:11 pm, Jason Andryuk wrote:
> @@ -316,6 +327,19 @@ static void apply_quirks(struct pci_dev *pdev)
>               * from trying to size the BARs or add handlers to trap accesses.
>               */
>              pdev->ignore_bars = true;
> +
> +    for ( i = 0; i < ARRAY_SIZE(hide_irt); i++)
> +    {
> +        if ( vendor == hide_irt[i].vendor &&
> +             device == hide_irt[i].device )
> +        {
> +            pdev->gvec_as_irte_idx = true;
> +            printk("%pp %04x:%04x quirk gvec as intr remap index\n",
> +                   &pdev->sbdf, hide_irt[i].vendor, hide_irt[i].device);
> +            if ( !amd_iommu_perdev_intremap )
> +                printk("gvec quirk requires per-device intr remap!\n");

(Covering only what others haven't.)

amd_iommu_perdev_intremap is the subject of XSA-36.

Sadly it still exists, and only because Xen does not have a viable
IOMMU-groups model, so can only fix amd_sp5100_erratum28() by turning
disabling the XSA-36 fix and switching back into one fully-shared
interrupt remapping table.

This is of course horrible.  The proper fix is to put the IDE and SATA
controller into the same IOMMU group (force them to be handled as a
unit) at which point *they* can share a intremap table while the rest of
the system uses unique ones.   (Also, disabling the IOMMUs globally
because perdev remapping was disabled and sata combined mode is active,
is a truly unacceptable thing to do.)

Unfortunately, the Intel problems are relevant here.

amd_iommu_perdev_intremap exists because it was trying to copy how Intel
works.  Intel IOMMUs have a single interrupt remapping table shared by
all devices behind it.  Then Intel realised this was a giant security
vulnerability, and introduced the concept of Source ID verification, to
fix a problem which only exists because the remapping table was shared
to begin with.

On AMD, because we have per domain tables, we allocate in order simply
because it's easy.  And yes, we can allocate out-of-order to match other
setups.

But on Intel, you can't.  The table, and therefore the indices in it,
are shared.

In principle, if you only have a single ath11k device behind the IOMMU,
you could shuffle around existing entries to make holes where you want
them, but this can't be done atomically and you risk interfering with an
active device.

You might get somewhere with allocating top-down in the table by default
and leaving the bottom for magic like this?  But then you've still got
to fix the remappable-form problem that Roger pointed out.

~Andrew

