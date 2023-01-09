Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158A66355E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 00:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474131.735089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1fs-0006jC-Jw; Mon, 09 Jan 2023 23:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474131.735089; Mon, 09 Jan 2023 23:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF1fs-0006gw-GD; Mon, 09 Jan 2023 23:35:28 +0000
Received: by outflank-mailman (input) for mailman id 474131;
 Mon, 09 Jan 2023 23:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QidW=5G=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pF1fq-0006gn-Pk
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 23:35:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a99b1e-9076-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 00:35:24 +0100 (CET)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-203-3wPotfuDMTurSReKuHDI0g-1; Mon, 09 Jan 2023 18:35:22 -0500
Received: by mail-qt1-f198.google.com with SMTP id
 e18-20020ac84912000000b003a96d6f436fso4652339qtq.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 15:35:22 -0800 (PST)
Received: from redhat.com ([191.101.160.154]) by smtp.gmail.com with ESMTPSA id
 bp37-20020a05620a45a500b006e99290e83fsm6136992qkb.107.2023.01.09.15.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:35:20 -0800 (PST)
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
X-Inumbo-ID: 49a99b1e-9076-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673307323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uCQhuqCyYYrUwYidZOjnRFW4Stp0dkql6Y3/FGUFmkM=;
	b=eifz0V98wZjFoHIKZt/cOd7cMh8FjXNCD14ijfFm6XNhr5Ja3A3+IsyFWge5clVHheTWYN
	BV1kHpbT3fCs1dq/kE+PrTw3xNFLWxGiGDj0R4Q3/jC/1adRGXaj69o+BAHFxU5id/iGEt
	4Qny/cetFObW9SjCcuqxCzlwLFN7zNE=
X-MC-Unique: 3wPotfuDMTurSReKuHDI0g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCQhuqCyYYrUwYidZOjnRFW4Stp0dkql6Y3/FGUFmkM=;
        b=ssvI4b1mGQgaMRTslBdc3xul5A/okouYC13fWBipQy0FeTHCOvRO8vFZy2539Thv1D
         T7dP7xDkxHdbqwCElUxKxzOQiCOc22/qTok5Vj2cyMOXRt1sYsZQ7N7MBSHvF7n61NWa
         Bmlz93bk8Y3b7wt2OshvhD9ABkX7HYibkT9C/nLLDlgu5cUWUFInYyjdh1rkPI5Bgr+B
         HSLj9bEDd68MN6fLF5hJFB9E6IFicDEqZZbtqnnrEU3n6Cp+9oUEhGpuEieuAKLAvFh0
         OnpD7p3wh+JYuSf4lIw4S2S5G84qRXoSImftZTBaFGfmkbxJ6zvK3m2UvHK1V030S+63
         wL7Q==
X-Gm-Message-State: AFqh2kpnxR2nzRYgSyRNfnLUS3JgxAODeztO6izrVAOicYLn4z8G6yUE
	3Oa2ca8XA7iK/vATrN4mE1MRJKzG70nqgwuc90KoEN+IbZFIAr0xmqxq1McdsS4h94yVVn1sYdt
	qgijwqMxhXr8pAKljGdchFFAVFP8=
X-Received: by 2002:ac8:5e06:0:b0:3ab:5bb4:ae6d with SMTP id h6-20020ac85e06000000b003ab5bb4ae6dmr121013954qtx.43.1673307321689;
        Mon, 09 Jan 2023 15:35:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsxRfx2SIl26nDoOzTKTEQ+9/jl7hcSlDyR1SFYdSQ4Zm7h7aG56hVi/f4qStCQE9iwRXD6Ow==
X-Received: by 2002:ac8:5e06:0:b0:3ab:5bb4:ae6d with SMTP id h6-20020ac85e06000000b003ab5bb4ae6dmr121013936qtx.43.1673307321427;
        Mon, 09 Jan 2023 15:35:21 -0800 (PST)
Date: Mon, 9 Jan 2023 18:35:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230109183413-mutt-send-email-mst@kernel.org>
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
 <20230109172738-mutt-send-email-mst@kernel.org>
 <8c2531a8-ce99-7593-99f8-222076fe6bd6@aol.com>
MIME-Version: 1.0
In-Reply-To: <8c2531a8-ce99-7593-99f8-222076fe6bd6@aol.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 09, 2023 at 06:28:44PM -0500, Chuck Zmudzinski wrote:
> On 1/9/23 5:33 PM, Michael S. Tsirkin wrote:
> > On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
> >> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> >> as noted in docs/igd-assign.txt in the Qemu source code.
> >> 
> >> Currently, when the xl toolstack is used to configure a Xen HVM guest with
> >> Intel IGD passthrough to the guest with the Qemu upstream device model,
> >> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> >> a different slot. This problem often prevents the guest from booting.
> >> 
> >> The only available workaround is not good: Configure Xen HVM guests to use
> >> the old and no longer maintained Qemu traditional device model available
> >> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> >> 
> >> To implement this feature in the Qemu upstream device model for Xen HVM
> >> guests, introduce the following new functions, types, and macros:
> >> 
> >> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> >> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> >> * typedef XenPTQdevRealize function pointer
> >> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> >> * xen_igd_reserve_slot and xen_igd_clear_slot functions
> >> 
> >> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> >> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> >> the xl toolstack with the gfx_passthru option enabled, which sets the
> >> igd-passthru=on option to Qemu for the Xen HVM machine type.
> > 
> > I don't like how slot_reserved_mask is set initially then cleared on
> > device realize.
> > To me this looks like a fragile hack. I suggest one of the following
> > 1. adding a new mask
> > "slot-manual-mask" or some such blocking auto-allocation of a given
> > slot without blocking its use if address is specified on command line.
> > 2. adding a special property that overrides slot_reserved_mask
> > for a given device.
> > 
> > both need changes in pci core but look like something generally
> > useful.
> 
> I was hoping to not need to touch pci core but I understand it would be
> better for this patch to not affect machines that are manually configured
> on the command line.
> 
> However, keep in mind that this patch will only actually reserve the slot
> initially for xen hvm machines (machine type "xenfv") that also are configured
> with the qemu igd-passthru=on option which, AFAIK, only applies to machines
> witn accel=xen. It will not affect kvm users at all. So I don't think this patch
> will break many machines out there that manually specify the pci slots. The
> only machines it could affect are machines configured for igd-passthru on xen.
> This patch also does *not* reserve the slot initially for "xenfv" machines that
> are not configured with igd passthrough which I am sure is the vast majority
> of all the xen virtual machines out in the wild.

I'm just saying that adding a capability that is generally useful
as opposed to xen specific means less technical debt.

-- 
MST


