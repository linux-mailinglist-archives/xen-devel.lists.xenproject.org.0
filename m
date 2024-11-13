Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B194B9C6DC8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 12:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835424.1251301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBUQ-0001ux-JA; Wed, 13 Nov 2024 11:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835424.1251301; Wed, 13 Nov 2024 11:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBBUQ-0001sR-Ft; Wed, 13 Nov 2024 11:24:50 +0000
Received: by outflank-mailman (input) for mailman id 835424;
 Wed, 13 Nov 2024 11:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbMU=SI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBBUP-0001ng-7b
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 11:24:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2784155-a1b1-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 12:24:45 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa15ede48e0so325617866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 03:24:45 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17662sm868606366b.28.2024.11.13.03.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 03:24:43 -0800 (PST)
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
X-Inumbo-ID: e2784155-a1b1-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUyNzg0MTU1LWExYjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk3MDg1LjQ0ODg3OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731497085; x=1732101885; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q4mVCizlOvPBQZQ6cozrvVSBPNztSfaUP7HZPM2pLdk=;
        b=HbdfmgE6VV+Z1HkEQqQNVs/0trW2VQL/2VXq+b90gJyhSJO6SS2vGvcV0auLmAGLRP
         ls+cWDmcIQQZlwQaBNBhvtn/NdbbTJsFqeWHzq8CPG7+qmi8NGyeqw8NblIbbW6iRb7n
         +axUTxes4newnTAsE4i5Tmpd1JD40iRjBLGrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731497085; x=1732101885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4mVCizlOvPBQZQ6cozrvVSBPNztSfaUP7HZPM2pLdk=;
        b=Tdue/+ZeddLuuXCJmIPbDMMaxV+94QJ3yYOZ1Nhwjuv3bdiAmGbqmYGrr5giw9o2Sy
         JArgGspLbXPuChUgrqPGVMEcDPTUYmc6byBe7zqHQ1BdDOzSvKtsstTxtl/WYWZm5I8D
         bsnQyIVpTOfZf6xaAzn1r0x+aQGMfvGaEzJaR1Fr7e0iqrb8sdPn8j1eGQhl8Wu3/cpo
         t+N/GD7Oz7dmjUV1J2H5M2MNtay1OFrMmsr5QndtZbrZUMW1dTwj84uFzBmEAlpTrUec
         G7LeR+ZSG37hzob6OSEOvsOkbroeZXhHe1YDVXCEUweseEs6xIsindZ707relxO/Qgk0
         +8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXrG65npH5UklHBidA1GpmF+40kyS7uRT+zfhJxoVGKhHIOHasPcCHtiJXChzLnisuQ+cSo62uxScI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRyG2EWBeziJr1jFB7DXPkQhPlo267OFYovTp6ZuVHV/RKq1jM
	cRf8N8E/GPSOzdN9jWol2SVTcqMqIxeS5S5fM1V+1wHPwr85VGZ4T9XonjX8Ezk=
X-Google-Smtp-Source: AGHT+IFo9svr7Xv+7BrNayS5Wn5bHCOmElxghz+Txo5MNEvafGkVNjVXSzClhvNbgNIIDdpV9MxICQ==
X-Received: by 2002:a17:906:d54a:b0:a9a:345a:6873 with SMTP id a640c23a62f3a-aa1f805eeb9mr251541866b.24.1731497084822;
        Wed, 13 Nov 2024 03:24:44 -0800 (PST)
Date: Wed, 13 Nov 2024 12:24:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzSMemXEhJu21Id3@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <6adc29fc-c6a6-460b-b034-62400e8c193b@suse.com>
 <ZzSF4es4NJnd3-JP@macbook>
 <38aa85ae-b398-4d23-82bb-6586457126f2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38aa85ae-b398-4d23-82bb-6586457126f2@suse.com>

On Wed, Nov 13, 2024 at 12:01:23PM +0100, Jan Beulich wrote:
> On 13.11.2024 11:56, Roger Pau Monné wrote:
> > On Wed, Nov 13, 2024 at 11:36:46AM +0100, Jan Beulich wrote:
> >> On 13.11.2024 11:30, Roger Pau Monné wrote:
> >>> On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >>>> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>>>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>>>> and then cause probing failure.
> >>>>>>
> >>>>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>>>> corresponding handler into vpci.
> >>>>>>
> >>>>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>>>
> >>>>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>>>> setting the new size.
> >>>>>
> >>>>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>>>> time ago I've made a patch to add support for it, but due to lack of
> >>>>> hardware on my side to test it I've never submitted it.
> >>>>>
> >>>>> My approach would be to detect the presence of the
> >>>>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>>>> capability is present force the sizing of BARs each time they are
> >>>>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>>>> the capability itself, as resizing can only happen when memory
> >>>>> decoding is not enabled for the device.  It's enough to fetch the size
> >>>>> of the BARs ahead of each enabling of memory decoding.
> >>>>>
> >>>>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>>>> is already an expensive operation, the extra sizing is unlikely to
> >>>>> make much of a difference performance wise.
> >>>>>
> >>>>> I've found the following on my git tree and rebased on top of staging:
> >>>> OK.
> >>>> Do you need me to validate your patch in my environment?
> >>>
> >>> Yes please, I have no way to test it.  Let's see what others think
> >>> about the different approaches.
> >>
> >> I'd certainly prefer your simpler form, if it's safe and fits the needs.
> >>
> >>>> And I have one question: where does your patch do writing the resizing size into hardware?
> >>>
> >>> dom0 has unrestricted access to the resize capability, so the value
> >>> written by dom0 is propagated to the hardware without modification.
> >>>
> >>> I would be wary of exposing the resize capability to untrusted
> >>> domains, as allowing a domU to change the size of BARs can lead to
> >>> overlapping if the hardware domain hasn't accounted for the increase
> >>> in BAR size.
> >>
> >> Question is how the feature is used in practice: If it was a driver to
> >> request the re-size, I'd have a hard time seeing how we could make that
> >> work without intercepting accesses to the capability for DomU-s (implying
> >> to expose it in the first place, of course).
> > 
> > Question is also whether the capability is required for guests, as in
> > OS drivers requesting it to be present for proper operation.
> > 
> > I haven't given much thought about how to expose to domUs.  The
> > current patch doesn't attempt to expose to domUs either, as the
> > capability is not added to the 'supported_caps' array.
> 
> Hmm, I see. Yet then adding support to vPCI, but limited to Dom0, ends up
> odd in two ways: Another aspect that'll need dealing with for DomU-s, and
> the same functionality remaining unavailable (or at least not properly
> available, with all possible side effects) to PV Dom0.

I think resizable BARs should just work for PV dom0, as Xen allows PV
dom0 to map almost all physical memory.  Xen doesn't require knowing
the BAR positions and sizes like it does for PVH dom0.

Note that resizable BAR capability is not exposed to domUs now either
when using QEMU based pci-passthrough.

Thanks, Roger.

