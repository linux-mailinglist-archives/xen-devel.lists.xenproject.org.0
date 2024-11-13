Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 524199C6ED0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 13:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835530.1251396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBCFz-00073K-3E; Wed, 13 Nov 2024 12:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835530.1251396; Wed, 13 Nov 2024 12:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBCFz-00070j-0C; Wed, 13 Nov 2024 12:13:59 +0000
Received: by outflank-mailman (input) for mailman id 835530;
 Wed, 13 Nov 2024 12:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbMU=SI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBCFx-00070d-TK
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 12:13:57 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfcad247-a1b8-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 13:13:53 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99f3a5a44cso907539266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 04:13:53 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17b58sm876853466b.25.2024.11.13.04.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:13:52 -0800 (PST)
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
X-Inumbo-ID: bfcad247-a1b8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJmY2FkMjQ3LWExYjgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTAwMDMzLjc0MDc1Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731500033; x=1732104833; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yoZzzpWJuW5xRuOYsYFYc7B5hYqPt3S9jWDS7kvIiuU=;
        b=EHasWULBdraA5P4fPCsxTqQ0Fy1Ltl3cAmGTWgMFndyOGM9TlZEBzrNeckgmIz5aqq
         Vl7Hq1CfdIH1GQLRPmyMTVDUCcaekesud8mCD4NsxjlVeY7z8ObaBLttXreUB0jYtYvh
         LJ+lJbye9FyOYJHlDu8QaZPv3dKuK0aJ2ELaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731500033; x=1732104833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yoZzzpWJuW5xRuOYsYFYc7B5hYqPt3S9jWDS7kvIiuU=;
        b=i8HI1zpDz7VjaZrKUHWmqZIs1XuudhQQgKqJvrrXIZa8N07lDKP6y5oFJ6foJBfiiO
         oNWjx9cok3eTaDM2j49kLrvumh7rX5t0RiZknsDyQ07MA62Ty158EkvQXJlPGIUMp0hg
         SYcNiW7t9/0cA9iGC0aanQYo8FeKc/1dCPt0CVPGyGhS+HcI4FepKxoYQSzpv87GoSx3
         6Y5e5bNaR5gnwhdTR8noQaSTywv9P7bBsEy0SvBzjj8yhgZkv2ovU0xY0bJKdyDkL3nV
         UcLjjrOXE0IDcDvTK2dSgAMZoOww9T5DxYgyVc7TLHng8j+MOWg+GatGBiuxj/yeSGvq
         ObVA==
X-Forwarded-Encrypted: i=1; AJvYcCXVNrsv0hpqdihiZRaxIQRRPEUPe2+7BV+dSJbZ7SAlXJYDrNsrca9xB3lREd+t538V+B3vigHqxM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVBdbeXKL/MjQ4LaWCMeRjd2rLcncHgRPpGVXObjxOheqJXgIy
	jr1fNhhbAaottuOS0Pi26il4RSayiXN2JG2t83VwII2HaJqIOPK+DPTxfG+ZY94=
X-Google-Smtp-Source: AGHT+IHQxfy3noawLZghs3yL5XZ6E1TzHGYVqHB7w9u3ius87uaAJsHIfk6fXQBlUuA60uQwB4HGag==
X-Received: by 2002:a17:907:3e16:b0:a9a:e9c:1d8d with SMTP id a640c23a62f3a-a9eefee4be8mr1871077466b.17.1731500033005;
        Wed, 13 Nov 2024 04:13:53 -0800 (PST)
Date: Wed, 13 Nov 2024 13:13:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Chen, Jiqian" <Jiqian.Chen@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzSX_1pdDYfu3OFH@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <6adc29fc-c6a6-460b-b034-62400e8c193b@suse.com>
 <ZzSF4es4NJnd3-JP@macbook>
 <38aa85ae-b398-4d23-82bb-6586457126f2@suse.com>
 <ZzSMemXEhJu21Id3@macbook>
 <4f75dc1d-a9f9-4ef9-b26a-77668dd6d3f2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f75dc1d-a9f9-4ef9-b26a-77668dd6d3f2@suse.com>

On Wed, Nov 13, 2024 at 12:29:11PM +0100, Jan Beulich wrote:
> On 13.11.2024 12:24, Roger Pau Monné wrote:
> > On Wed, Nov 13, 2024 at 12:01:23PM +0100, Jan Beulich wrote:
> >> On 13.11.2024 11:56, Roger Pau Monné wrote:
> >>> On Wed, Nov 13, 2024 at 11:36:46AM +0100, Jan Beulich wrote:
> >>>> On 13.11.2024 11:30, Roger Pau Monné wrote:
> >>>>> On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >>>>>> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>>>>>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>>>>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>>>>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>>>>>> and then cause probing failure.
> >>>>>>>>
> >>>>>>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>>>>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>>>>>> corresponding handler into vpci.
> >>>>>>>>
> >>>>>>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>>>>>
> >>>>>>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>>>>>> setting the new size.
> >>>>>>>
> >>>>>>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>>>>>> time ago I've made a patch to add support for it, but due to lack of
> >>>>>>> hardware on my side to test it I've never submitted it.
> >>>>>>>
> >>>>>>> My approach would be to detect the presence of the
> >>>>>>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>>>>>> capability is present force the sizing of BARs each time they are
> >>>>>>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>>>>>> the capability itself, as resizing can only happen when memory
> >>>>>>> decoding is not enabled for the device.  It's enough to fetch the size
> >>>>>>> of the BARs ahead of each enabling of memory decoding.
> >>>>>>>
> >>>>>>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>>>>>> is already an expensive operation, the extra sizing is unlikely to
> >>>>>>> make much of a difference performance wise.
> >>>>>>>
> >>>>>>> I've found the following on my git tree and rebased on top of staging:
> >>>>>> OK.
> >>>>>> Do you need me to validate your patch in my environment?
> >>>>>
> >>>>> Yes please, I have no way to test it.  Let's see what others think
> >>>>> about the different approaches.
> >>>>
> >>>> I'd certainly prefer your simpler form, if it's safe and fits the needs.
> >>>>
> >>>>>> And I have one question: where does your patch do writing the resizing size into hardware?
> >>>>>
> >>>>> dom0 has unrestricted access to the resize capability, so the value
> >>>>> written by dom0 is propagated to the hardware without modification.
> >>>>>
> >>>>> I would be wary of exposing the resize capability to untrusted
> >>>>> domains, as allowing a domU to change the size of BARs can lead to
> >>>>> overlapping if the hardware domain hasn't accounted for the increase
> >>>>> in BAR size.
> >>>>
> >>>> Question is how the feature is used in practice: If it was a driver to
> >>>> request the re-size, I'd have a hard time seeing how we could make that
> >>>> work without intercepting accesses to the capability for DomU-s (implying
> >>>> to expose it in the first place, of course).
> >>>
> >>> Question is also whether the capability is required for guests, as in
> >>> OS drivers requesting it to be present for proper operation.
> >>>
> >>> I haven't given much thought about how to expose to domUs.  The
> >>> current patch doesn't attempt to expose to domUs either, as the
> >>> capability is not added to the 'supported_caps' array.
> >>
> >> Hmm, I see. Yet then adding support to vPCI, but limited to Dom0, ends up
> >> odd in two ways: Another aspect that'll need dealing with for DomU-s, and
> >> the same functionality remaining unavailable (or at least not properly
> >> available, with all possible side effects) to PV Dom0.
> > 
> > I think resizable BARs should just work for PV dom0, as Xen allows PV
> > dom0 to map almost all physical memory.  Xen doesn't require knowing
> > the BAR positions and sizes like it does for PVH dom0.
> 
> Does it really not need to know in any (corner) case? Are there guarantees
> that e.g. MSI-X table or PBA can't move when the size of the BAR covering
> them changes?

Those are the same guarantees that Xen has from a PV dom0 not moving
the position of the BARs after having MSI-X enabled for example.  IOW:
dom0 should set the BAR size before enabling MSI-X, just like it does
for the BAR positions currently.

The specification doesn't mention anything about MSI-X table or PBA
explicitly not changing it's offset if the BAR where it resides is
resized, so I don't think we have any guarantees.  Albeit I would
think it's unexpected for the MSI-X BIR or offset to change as a
result of a BAR resize.

There's an implementation note in the PCI specification that the BAR
should be resized during resource allocation, prior to assigning the
base address to the BAR.

Thanks, Roger.

