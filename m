Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44E9433F4
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 18:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768950.1179853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBxf-0004hu-N2; Wed, 31 Jul 2024 16:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768950.1179853; Wed, 31 Jul 2024 16:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZBxf-0004fE-KC; Wed, 31 Jul 2024 16:13:59 +0000
Received: by outflank-mailman (input) for mailman id 768950;
 Wed, 31 Jul 2024 16:13:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d79+=O7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZBxe-000488-J4
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 16:13:58 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e336ab21-4f57-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 18:13:57 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-44fea2d40adso37014071cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 09:13:57 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44fe8146433sm61422801cf.24.2024.07.31.09.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 09:13:55 -0700 (PDT)
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
X-Inumbo-ID: e336ab21-4f57-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722442436; x=1723047236; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AtWFqaKv1xcsRRHaiwFqHRyFtqixqohERUwesB8CFzk=;
        b=snA6zCoJ1FYFCRbVXnzjPiYmo9RfniRd1K1nkpIiuL909B4jAt/wReP7zO05YB7QJf
         bTthuL0Fdp6lFKj0ntOisYSf9fAr4frwF7dVgERPkzmRY+cVi9oh2vYon1O423a2R+fy
         TACETg+s5t5Tmlh3UbpYHJGLOi2vNGcSXmZHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722442436; x=1723047236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtWFqaKv1xcsRRHaiwFqHRyFtqixqohERUwesB8CFzk=;
        b=u1zOPsoOq0R94N1Eo52kGQtWZr1lnSGtNunB1o5FdpS+eLXTOjMWg5h8y2nwH0czIG
         +cEsg626QYtfEmlIeyQrMy07kgxjdKrAj+A+qFwDLaRIt+xAyH3NhVPdFT+d1e6Tq34C
         hr9P+66eRDqGdtlZNUlITs/k5Wbv1rL1JIqyEMJngOMYZJODLemX/dBLv/09nf0FRcpA
         wF3tho9ZJ3qqefxEDuoXJexuOfWThwUIA00O+txRS1OYPaP1slV7Sd3KzA+8gUMgBWms
         4E1Glme9/JbP4gLG53PR6wKGBgOTtpCMTj41H/+j6u4g6ckgJhUSDgijgouzFhKrIDzs
         IIRg==
X-Gm-Message-State: AOJu0YwHQYHxSiP+ZUg4iM+ZeS8U3CZm7o0csnIrXZXtOuSNWoDfRd1O
	8vhwVV8V6tO6S3DCW2LYuLlxHMwET5pSuwVWXzvkLrf9+bmAI/Nokoppj3/8gwE=
X-Google-Smtp-Source: AGHT+IESVuW14UvxTWDkzria5K6FVn2aX4mM8Afr1v7vKdJIRwwzkhkJNuKtWPL2kWbh3sSaeGiXdw==
X-Received: by 2002:a05:622a:5499:b0:44f:efa3:2a4b with SMTP id d75a77b69052e-45004dacde5mr173168201cf.32.1722442435764;
        Wed, 31 Jul 2024 09:13:55 -0700 (PDT)
Date: Wed, 31 Jul 2024 18:13:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 1/7] xen/pci: Add hypercall to support reset of
 pcidev
Message-ID: <ZqpiulPi3FbdpDoF@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-2-Jiqian.Chen@amd.com>
 <ZqpeiWhuqPXiTeRZ@macbook>
 <23730906-f6c7-4a9a-bb2f-2969625c741e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23730906-f6c7-4a9a-bb2f-2969625c741e@suse.com>

On Wed, Jul 31, 2024 at 05:58:54PM +0200, Jan Beulich wrote:
> On 31.07.2024 17:55, Roger Pau Monné wrote:
> > On Mon, Jul 08, 2024 at 07:41:18PM +0800, Jiqian Chen wrote:
> >> --- a/xen/drivers/vpci/vpci.c
> >> +++ b/xen/drivers/vpci/vpci.c
> >> @@ -172,6 +172,16 @@ int vpci_assign_device(struct pci_dev *pdev)
> >>  
> >>      return rc;
> >>  }
> >> +
> >> +int vpci_reset_device_state(struct pci_dev *pdev,
> >> +                            uint32_t reset_type)
> > 
> > There's probably no use in passing reset_type to
> > vpci_reset_device_state() if it's ignored?
> 
> I consider this forward-looking. It seems rather unlikely that in the
> longer run the reset type doesn't matter.

I'm fine with having it in the hypercall interface, but passing it to
vpci_reset_device_state() can be done once there's a purpose for it,
and it won't change any public facing interface.

Thanks, Roger.

