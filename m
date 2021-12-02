Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D7C466564
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236617.410477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnCM-0004uA-Af; Thu, 02 Dec 2021 14:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236617.410477; Thu, 02 Dec 2021 14:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnCM-0004r9-6C; Thu, 02 Dec 2021 14:36:34 +0000
Received: by outflank-mailman (input) for mailman id 236617;
 Thu, 02 Dec 2021 14:36:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w6ez=QT=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1msnCK-0004r3-PA
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:36:32 +0000
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d94f568-537d-11ec-976b-d102b41d0961;
 Thu, 02 Dec 2021 15:36:31 +0100 (CET)
Received: by mail-wr1-f49.google.com with SMTP id q3so37232873wru.5
 for <xen-devel@lists.xenproject.org>; Thu, 02 Dec 2021 06:36:31 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q4sm2636132wrs.56.2021.12.02.06.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 06:36:29 -0800 (PST)
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
X-Inumbo-ID: 3d94f568-537d-11ec-976b-d102b41d0961
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xh3pKbxTnj8e62DOcRXknPoUROM+BODLvzmQyRbbH8s=;
        b=B46/7L5LrNffEQXoNNpI9oHUBKtMyLXSyOy+PIte9zuDnJ6gmiXZoKWnCaGn+1GrD4
         uP/hneAarwcsryuo/4ZUVGVwxUyh2Q/MFOSxhy5kJiO9DJzqfKRG84qaLu6sbGv5UbR1
         4T6HnVftaguOQfOrDBdNI4PsIkZyPirlNn64g1LGswJCwHZGPBjVJeuqQKOB5Cli9n/K
         PKP0dtEa2t8jSgEIwu4B2BvCVg39AZOhTioozJIi0oOeUqut8fgkIwaV9hvBeym2NFs7
         t7A2AuLUYD1xeSwYHmZOZpW+LVz0xopwaNYF0qER2rOq0SI92Zd1yq9DdFpCD8Nu+w3H
         zxIQ==
X-Gm-Message-State: AOAM531/QsT1tggWPz6+YVUmW6o+8V+apgVRdwNbzWQf9M/+VmQil/Jm
	4RWvykQz3jaRglSlDeD2kQk=
X-Google-Smtp-Source: ABdhPJwNpcGjwNKyiVWqPz1WBsz/Qi/GLv2M+5yPM20JS1pf2ye6xEbrzai84zM0oO2HmmRa7dC8TQ==
X-Received: by 2002:adf:fb0c:: with SMTP id c12mr15988721wrr.614.1638455790749;
        Thu, 02 Dec 2021 06:36:30 -0800 (PST)
Date: Thu, 2 Dec 2021 14:36:28 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	Wei Liu <wei.liu@kernel.org>, x86@kernel.org,
	linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
	ath11k@lists.infradead.org, Juergen Gross <jgross@suse.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch 11/22] x86/hyperv: Refactor hv_msi_domain_free_irqs()
Message-ID: <20211202143628.dgiikgujigylogoz@liuwe-devbox-debian-v2>
References: <20211126222700.862407977@linutronix.de>
 <20211126223824.737214551@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126223824.737214551@linutronix.de>

On Sat, Nov 27, 2021 at 02:18:51AM +0100, Thomas Gleixner wrote:
> No point in looking up things over and over. Just look up the associated
> irq data and work from there.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Wei Liu <wei.liu@kernel.org>

