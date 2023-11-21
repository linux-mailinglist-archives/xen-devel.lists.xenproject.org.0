Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3B7F3163
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 15:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637879.993933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5S0j-0002MM-GI; Tue, 21 Nov 2023 14:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637879.993933; Tue, 21 Nov 2023 14:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5S0j-0002Jk-DY; Tue, 21 Nov 2023 14:45:57 +0000
Received: by outflank-mailman (input) for mailman id 637879;
 Tue, 21 Nov 2023 14:45:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5S0h-0002IR-OK
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 14:45:55 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abeaf724-887c-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 15:45:53 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so29829825e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 06:45:53 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c198800b0040531f5c51asm17594664wmq.5.2023.11.21.06.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 06:45:52 -0800 (PST)
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
X-Inumbo-ID: abeaf724-887c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700577953; x=1701182753; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B10FEUkPquyYJVao+8x8hkDKra7t28rf6e/rn+u3em4=;
        b=JS/X0Id4dPCgP2pqsTq5NjLHGEQw4GORbXa0FcPC69TAp9X7hGEtAnqVu4FLkEtYn5
         UohQE1EPk6PVu3liHLaW3KN++Ch/Kn4Vpz04YXZUURW+kI2aA1t12fHBrGpovG2/VZ+R
         LvQK2QiJHXWDiNoFx9HvZbihBH3N1oijHXjV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700577953; x=1701182753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B10FEUkPquyYJVao+8x8hkDKra7t28rf6e/rn+u3em4=;
        b=IyAGeFXEWDr2pmGQU/3Qdmeh/yQtrbXxnLXT9XPtoge1cHOR/xxNxxjto9qB6jkmZs
         HH72/1HscCtb0B9u0D9s6FWWfH3Q1RMD7dGoa+ELdUlAKS3708ykwP5xHjb8QxqBTg3I
         1/wX0LZb/RnAz0WqNGD68Np4Jy1NLbDnTfrqFjj03JVnKF+Ut7S9ajX1BT9JmqAhmcU6
         6UMwd09431JGrcTIT5pE0l3PfseXhuKYY5YPItwss+PQtoFg6GH+QwYZcHH3tOwItcJ+
         xgJnkl7nfSl6/+o9w9LI+mi67oS1BGlMoyZAnvqwfcMbexx09OSe3S1i0sCkHTlZDjEJ
         iHBg==
X-Gm-Message-State: AOJu0YzW+prkjzkMXyy/V76d9Ndtgd5+VZRAxi3X4uSYWU02DIBYFe0g
	ie3qTDdtz4ruRHrfP9MSYgXRnQ==
X-Google-Smtp-Source: AGHT+IHeGTYD9wX9V3tDIBHZhKzPw27YNUiyY8fM7rY+/Sml4aJ6dmJkIismof+fMFvWgPKcydhx2w==
X-Received: by 2002:a05:600c:19d4:b0:40b:2a85:d7ae with SMTP id u20-20020a05600c19d400b0040b2a85d7aemr1195261wmq.16.1700577953241;
        Tue, 21 Nov 2023 06:45:53 -0800 (PST)
Date: Tue, 21 Nov 2023 15:45:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZVzCn60-qvdRsi3q@macbook.local>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230913143550.14565-2-stewart.hildebrand@amd.com>

On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  
>  /*
>   * Perform a maybe partial write to a register.
> - *
> - * Note that this will only work for simple registers, if Xen needs to
> - * trap accesses to rw1c registers (like the status PCI header register)
> - * the logic in vpci_write will have to be expanded in order to correctly
> - * deal with them.
>   */
>  static void vpci_write_helper(const struct pci_dev *pdev,
>                                const struct vpci_register *r, unsigned int size,
>                                unsigned int offset, uint32_t data)
>  {
> +    uint32_t val = 0;
> +
>      ASSERT(size <= r->size);
>  
> -    if ( size != r->size )
> +    if ( (size != r->size) || r->ro_mask )
>      {
> -        uint32_t val;
> -
>          val = r->read(pdev, r->offset, r->private);
> +        val &= ~r->rw1c_mask;
>          data = merge_result(val, data, size, offset);
>      }
>  
> +    data &= ~(r->rsvdz_mask | r->ro_mask);
> +    data |= val & r->ro_mask;

I've been thinking about this, and the way the ro_mask is implemented
(and the way we want to handle ro bits) is the same behavior as RsvdP.
I would suggest to rename the ro_mask to rsvdp_mask and note
that for resilience reasons we will handle RO bits as RsvdP.

Thanks, Roger.

