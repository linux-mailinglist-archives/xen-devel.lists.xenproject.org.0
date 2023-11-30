Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64667FF44A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:02:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645040.1006816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jUX-0006s9-OQ; Thu, 30 Nov 2023 16:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645040.1006816; Thu, 30 Nov 2023 16:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jUX-0006q8-LV; Thu, 30 Nov 2023 16:02:17 +0000
Received: by outflank-mailman (input) for mailman id 645040;
 Thu, 30 Nov 2023 16:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8jUW-0006q2-BT
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:02:16 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3ca1928-8f99-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:02:14 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32f8441dfb5so773225f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 08:02:14 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 f12-20020adfdb4c000000b00332d3b89561sm1873646wrj.97.2023.11.30.08.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 08:02:13 -0800 (PST)
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
X-Inumbo-ID: d3ca1928-8f99-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701360134; x=1701964934; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8Q31kwOWiBDXnwlbMX0bPU/+i+b5UwJll/wjEONC1U=;
        b=PdQw6BmV4N+ZRrxZ262D/349Mad0uhcBqfqVfEImmhSNgTO8JQf4ie/iw38GpqIBaE
         zDiHl5mTGloxIjEjPCDEd54Z/7gYMxEVQvYgUCLNg4uIqfBZAeLMSz4epywkg4XP6ouq
         kcNC6iPUIil827QcpKgMZm9qFGAMXolt683Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701360134; x=1701964934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8Q31kwOWiBDXnwlbMX0bPU/+i+b5UwJll/wjEONC1U=;
        b=BGOxgJ+T+9LW8Uw+WA8Tebzns/fcwCwlVFwQb5ZCSxfh1yqlAldJJCBjwUXwWbB6jT
         va3BQiEAKR4JJWonwpeDVvQxc+P5ENkSBcU3JaKKGdoGtbVLfnx8oecBWZPBKC5rIKa7
         GZ0V1Bbv3wsNKT547HbJDuiD1gELtdJ+uLse3j0cq+48loBUSfXA35swUzMuhTD41rzb
         pKuTNmy9a9YtISPDLXth3Djmo7hkQL+01HYTIq+x8tC9KzdsoiVu6uXtjn7fUd+76k8n
         U0rsqECp78+fFMQAzdyTnE1b6IzgYzHt0rAfiw4lpI2yJy3fJxxEoRi2bYVdv95nT8/K
         AOSQ==
X-Gm-Message-State: AOJu0YyH/1z5+i97cAAjhuEHEvK5wJgZTalZo/Z5driH9XHueb150yca
	q1CMY4ZBAMoO3CH/uxgZwriQiQ==
X-Google-Smtp-Source: AGHT+IG7CHrQYHgQi9oJz5npE820tArdqo6WytLhF5GonusjbfiVhyI2nc1i0dbHiq1MLAlBCrQniA==
X-Received: by 2002:a5d:458b:0:b0:332:ffaf:d217 with SMTP id p11-20020a5d458b000000b00332ffafd217mr9790796wrq.27.1701360133280;
        Thu, 30 Nov 2023 08:02:13 -0800 (PST)
Date: Thu, 30 Nov 2023 17:02:12 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Juergen Gross <jgross@suse.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Christian Koenig <Christian.Koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v2 2/3] xen/pvh: Unmask irq for passthrough
 device in PVH dom0
Message-ID: <ZWiyBP4Lzz5lXraP@macbook>
References: <20231124103123.3263471-1-Jiqian.Chen@amd.com>
 <20231124103123.3263471-3-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2311291950350.3533093@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2311291950350.3533093@ubuntu-linux-20-04-desktop>

On Wed, Nov 29, 2023 at 07:53:59PM -0800, Stefano Stabellini wrote:
> On Fri, 24 Nov 2023, Jiqian Chen wrote:
> > This patch is to solve two problems we encountered when we try to
> > passthrough a device to hvm domU base on Xen PVH dom0.
> > 
> > First, hvm guest will alloc a pirq and irq for a passthrough device
> > by using gsi, before that, the gsi must first has a mapping in dom0,
> > see Xen code pci_add_dm_done->xc_domain_irq_permission, it will call
> > into Xen and check whether dom0 has the mapping. See
> > XEN_DOMCTL_irq_permission->pirq_access_permitted, "current" is PVH
> > dom0 and it return irq is 0, and then return -EPERM.
> > This is because the passthrough device doesn't do PHYSDEVOP_map_pirq
> > when thay are enabled.
> > 
> > Second, in PVH dom0, the gsi of a passthrough device doesn't get
> > registered, but gsi must be configured for it to be able to be
> > mapped into a domU.
> > 
> > After searching codes, we can find map_pirq and register_gsi will be
> > done in function vioapic_write_redirent->vioapic_hwdom_map_gsi when
> > the gsi(aka ioapic's pin) is unmasked in PVH dom0. So the problems
> > can be conclude to that the gsi of a passthrough device doesn't be
> > unmasked.
> > 
> > To solve the unmaske problem, this patch call the unmask_irq when we
> > assign a device to be passthrough. So that the gsi can get registered
> > and mapped in PVH dom0.
> 
> 
> Roger, this seems to be more of a Xen issue than a Linux issue. Why do
> we need the unmask check in Xen? Couldn't we just do:
> 
> 
> diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> index 4e40d3609a..df262a4a18 100644
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -287,7 +287,7 @@ static void vioapic_write_redirent(
>              hvm_dpci_eoi(d, gsi);
>      }
>  
> -    if ( is_hardware_domain(d) && unmasked )
> +    if ( is_hardware_domain(d) )
>      {
>          /*
>           * NB: don't call vioapic_hwdom_map_gsi while holding hvm.irq_lock

There are some issues with this approach.

mp_register_gsi() will only setup the trigger and polarity of the
IO-APIC pin once, so we do so once the guest unmask the pin in order
to assert that the configuration is the intended one.  A guest is
allowed to write all kind of nonsense stuff to the IO-APIC RTE, but
that doesn't take effect unless the pin is unmasked.

Overall the question would be whether we have any guarantees that
the hardware domain has properly configured the pin, even if it's not
using it itself (as it hasn't been unmasked).

IIRC PCI legacy interrupts are level triggered and low polarity, so we
could configure any pins that are not setup at bind time?

Thanks, Roger.

