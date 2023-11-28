Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A07FBF04
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 17:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643305.1003361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80g7-0005VJ-Bu; Tue, 28 Nov 2023 16:11:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643305.1003361; Tue, 28 Nov 2023 16:11:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r80g7-0005Sh-8y; Tue, 28 Nov 2023 16:11:15 +0000
Received: by outflank-mailman (input) for mailman id 643305;
 Tue, 28 Nov 2023 16:11:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r80g5-0005SY-2w
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 16:11:13 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf690343-8e08-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 17:11:11 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b4e35ecf1so6080675e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 08:11:11 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 bi19-20020a05600c3d9300b0040b3d78e181sm13671018wmb.17.2023.11.28.08.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 08:11:11 -0800 (PST)
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
X-Inumbo-ID: bf690343-8e08-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701187871; x=1701792671; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=axKn9UYjYE96HKh5+QAhbSj0cYjdP+RcJ0ndjMzy5IY=;
        b=ZV05a63GMBM98Q7q4g+www57l3eRH0wgshuuHUQIrrJMvswMQWzw9ogloHDEO+t+jS
         eqawhAiyKhq8KoF3x3DlePQkw9dDqZKsHSZuoVGr83na5PP+JkuVIkROPB7e3zqr8Lfp
         0y6sBtW+OBhb9X6yH2r0FRnNFaNA7pM+xGpO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701187871; x=1701792671;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=axKn9UYjYE96HKh5+QAhbSj0cYjdP+RcJ0ndjMzy5IY=;
        b=Tf8rs2Iz6vc5jGB9Ngd+ZTjTrxd+ME4Z39/AA4x+PJj7P1AChqnk77gt6Wn7f7nvRJ
         ajeYn9M4HiG7FI9jBR3IhP39nPUK2DUfUgiwvo7Bto5yxlvuV9VORcZE9xJ7weFpPOg/
         WxrH4PdCjABnscmy0c7pI5K4T+t/9uTPbO+eyKiziRz1LG9V/TU/75tvamajs1cnrXmm
         rHl5gNeyImmRGIePX6tb0YjZvLCDAx2acLAR60R9ShnemM8dEKofyJ4nKCjZFxdOb43T
         Pdt5WtH9SjDobhEx6V1DM44SE0IYiw4wQ0WeZwkXaLeSgKmUBPNJjGIK39ZSIOYk7J8T
         VZzQ==
X-Gm-Message-State: AOJu0YwaQ+9/0/qGvvx1jKjwDx/mLnhk7PC9kLwC8H68W0KIENHNFkVe
	TuW4ZYNnnBT6QJLyxc9zlCAjUg==
X-Google-Smtp-Source: AGHT+IHtPG2XE8bXWc51rikjkDJPs/7zI162wuP1uWWZLbZLKwuO8t0TdF0oBnfiOSemfY4nONayjw==
X-Received: by 2002:a05:600c:1c17:b0:40b:3f72:de79 with SMTP id j23-20020a05600c1c1700b0040b3f72de79mr6774711wms.5.1701187871309;
        Tue, 28 Nov 2023 08:11:11 -0800 (PST)
Date: Tue, 28 Nov 2023 17:11:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Huang Rui <Ray.Huang@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>
Subject: Re: [RFC XEN PATCH v2 3/3] tools: Add new function to get gsi from
 irq
Message-ID: <ZWYRHqie0oVuawmc@macbook>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-4-Jiqian.Chen@amd.com>
 <ZWX4R9UEE6oXiqaz@macbook>
 <6ee9c6e2-7ebf-42c6-a923-57f9da093160@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ee9c6e2-7ebf-42c6-a923-57f9da093160@suse.com>

On Tue, Nov 28, 2023 at 03:42:31PM +0100, Juergen Gross wrote:
> On 28.11.23 15:25, Roger Pau Monné wrote:
> > On Fri, Nov 24, 2023 at 06:41:36PM +0800, Jiqian Chen wrote:
> > > In PVH dom0, it uses the linux local interrupt mechanism,
> > > when it allocs irq for a gsi, it is dynamic, and follow
> > > the principle of applying first, distributing first. And
> > > if you debug the kernel codes, you will find the irq
> > > number is alloced from small to large, but the applying
> > > gsi number is not, may gsi 38 comes before gsi 28, that
> > > causes the irq number is not equal with the gsi number.
> > > And when we passthrough a device, QEMU will use its gsi
> > > number to do mapping actions, see xen_pt_realize->
> > > xc_physdev_map_pirq, but the gsi number is got from file
> > > /sys/bus/pci/devices/xxxx:xx:xx.x/irq in current code,
> > > so it will fail when mapping.
> > > And in current codes, there is no method to translate
> > > irq to gsi for userspace.
> > 
> > I think it would be cleaner to just introduce a new sysfs node that
> > contains the gsi if a device is using one (much like the irq sysfs
> > node)?
> > 
> > Such ioctl to translate from IRQ to GSI has nothing to do with Xen, so
> > placing it in privcmd does seem quite strange to me.  I understand
> > that for passthrough we need the GSI, but such translation layer from
> > IRQ to GSI is all Linux internal, and it would be much simpler to just
> > expose the GSI in sysfs IMO.
> 
> You are aware that we have a Xen specific variant of acpi_register_gsi()?
> 
> It is the Xen event channel driver being responsible for the GSI<->IRQ
> mapping.

I'm kind of lost, this translation function is specifically needed for
PVH which doesn't use the Xen specific variant of acpi_register_gsi(),
and hence the IRQ <-> GSI relation is whatever the Linux kernel does
on native.

I do understand that on a PV dom0 the proposed sysfs gsi node would
match the irq node, but that doesn't seem like an issue to me.

Note also that PVH doesn't use acpi_register_gsi_xen_hvm() because
XENFEAT_hvm_pirqs feature is not exposed to PVH, so I expect it uses
the x86 acpi_register_gsi_ioapic().

Thanks, Roger.

