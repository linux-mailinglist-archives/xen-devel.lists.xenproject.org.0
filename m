Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C139A7F3231
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 16:18:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637899.993974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SWI-0002Tr-Lw; Tue, 21 Nov 2023 15:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637899.993974; Tue, 21 Nov 2023 15:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5SWI-0002Rf-Iy; Tue, 21 Nov 2023 15:18:34 +0000
Received: by outflank-mailman (input) for mailman id 637899;
 Tue, 21 Nov 2023 15:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5SWG-0002QA-WF
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 15:18:33 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39caba02-8881-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 16:18:29 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b2c8e91afso2257695e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 07:18:29 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4a82000000b003196b1bb528sm14644971wrq.64.2023.11.21.07.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 07:18:28 -0800 (PST)
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
X-Inumbo-ID: 39caba02-8881-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700579909; x=1701184709; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IkE+bEYXu7pei1PCewmve9LAmxkfMn4ZZ8ddfsZf94E=;
        b=uKQG8bnvvI+7mqOD4SDugBIzmX2iH3DQt1aRBNOLytYvhHj3+ftkMxn+2YQXj3REjW
         ZN6iSUi7zmIvhI6lEpVwf5rIXBQ9RH8cDVeTnSC8bX1jGRM1QuYoYgnbHyBxtDaFcJhO
         7SRD5QXnOoPQzw1ueZaia2TGkIreDS9dBawxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700579909; x=1701184709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkE+bEYXu7pei1PCewmve9LAmxkfMn4ZZ8ddfsZf94E=;
        b=ChuzMDd/eG5tDkopEsqahgCK9jj/bXSItyCna4l/BG7eAuHKo+9xCD3VSiHd16ionq
         /2mvCBELKKXjv5rpl3NnRuFrN+SjlFQVRW6UnHSQh9ivV+Z7ERycImUmkX3R3PSb/P7E
         f1HlsRxnxZMFD3vm8TnCar1dwTs8lmuevdyPBmGoxPc/3XSpqYDZnHsSAnluZKQEFTQz
         ftSnAwU2JcJiWWyO5sZFLHssRKt2KDRBxKfexsRlJWkP0GTfbVrwS3RaRgVQfvLE1TSw
         2Tkq+onDzTroBB4JBDvG1YLzLKSZPRju6nfhUuK3zozI4Y8hLD6depgKqpA7bnOa1WqF
         S18g==
X-Gm-Message-State: AOJu0YybmdjcuxY2Ic8kUpVSzD64f+IZQQyNQBge3Lx+NvXmvFSfKr1R
	kEBBb1fZujRWFP9HB/1cs67Trg==
X-Google-Smtp-Source: AGHT+IGE6Itrr48Rr0b+EjPW1OlZkovWkHHs3Gbn17g6YkX38NwvKLB7xrYmupZj02OOmiHiEXl8/Q==
X-Received: by 2002:adf:d1eb:0:b0:32f:92f3:dbbb with SMTP id g11-20020adfd1eb000000b0032f92f3dbbbmr8445665wrd.70.1700579909202;
        Tue, 21 Nov 2023 07:18:29 -0800 (PST)
Date: Tue, 21 Nov 2023 16:18:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZVzKROAwS25DMGbb@macbook.local>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
 <ZVzCn60-qvdRsi3q@macbook.local>
 <081547e8-696b-4741-b9b6-bc92c221f01a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <081547e8-696b-4741-b9b6-bc92c221f01a@amd.com>

On Tue, Nov 21, 2023 at 10:03:01AM -0500, Stewart Hildebrand wrote:
> On 11/21/23 09:45, Roger Pau Monné wrote:
> > On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> >> @@ -407,26 +439,25 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>  
> >>  /*
> >>   * Perform a maybe partial write to a register.
> >> - *
> >> - * Note that this will only work for simple registers, if Xen needs to
> >> - * trap accesses to rw1c registers (like the status PCI header register)
> >> - * the logic in vpci_write will have to be expanded in order to correctly
> >> - * deal with them.
> >>   */
> >>  static void vpci_write_helper(const struct pci_dev *pdev,
> >>                                const struct vpci_register *r, unsigned int size,
> >>                                unsigned int offset, uint32_t data)
> >>  {
> >> +    uint32_t val = 0;
> >> +
> >>      ASSERT(size <= r->size);
> >>  
> >> -    if ( size != r->size )
> >> +    if ( (size != r->size) || r->ro_mask )
> >>      {
> >> -        uint32_t val;
> >> -
> >>          val = r->read(pdev, r->offset, r->private);
> >> +        val &= ~r->rw1c_mask;
> >>          data = merge_result(val, data, size, offset);
> >>      }
> >>  
> >> +    data &= ~(r->rsvdz_mask | r->ro_mask);
> >> +    data |= val & r->ro_mask;
> > 
> > I've been thinking about this, and the way the ro_mask is implemented
> > (and the way we want to handle ro bits) is the same behavior as RsvdP.
> > I would suggest to rename the ro_mask to rsvdp_mask and note
> > that for resilience reasons we will handle RO bits as RsvdP.
> 
> But the reads behave differently. RO should return the value, RsvdP should return 0 when read (according to the PCIe Base Spec 4.0).

Hm, right, sorry for the wrong suggestion.  We should force bits to 0
for guests reads, but make sure that for writes the value on the
hardware is preserved.

So we need the separate mask for RsvdP, which will be handled like
ro_mask in vpci_write_helper() and like rsvdz_mask in vpci_read().

Roger.

