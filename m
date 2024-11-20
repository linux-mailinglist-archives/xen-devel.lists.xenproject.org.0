Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70769D3647
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 10:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840957.1256478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDgb6-0002bf-Vj; Wed, 20 Nov 2024 09:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840957.1256478; Wed, 20 Nov 2024 09:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDgb6-0002aC-Sp; Wed, 20 Nov 2024 09:02:04 +0000
Received: by outflank-mailman (input) for mailman id 840957;
 Wed, 20 Nov 2024 09:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1p6=SP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDgb5-0002a4-0i
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 09:02:03 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 184bc2dc-a71e-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 10:01:57 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5cffb4d7d9dso242267a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 01:01:57 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e048f12sm742539466b.173.2024.11.20.01.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 01:01:55 -0800 (PST)
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
X-Inumbo-ID: 184bc2dc-a71e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE4NGJjMmRjLWE3MWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDkzMzE3LjIyNTA0NSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732093316; x=1732698116; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/LgngNeKwC27cPz0lxxyz3TNcUMAaxfAOjCXqTyQA3s=;
        b=KtYp0TDftxPXokpsTskVpO1bYxb1VB4Ijp3ph8R1nTOiKZM1vc+DQYEhTpPIgRSU1/
         TbQUFkVpakxP+xYTk9E9WkdoGF05NADv1aQEKnIPWKIctXU/7XacNjpyH0hDaTg+vIVU
         bwERycK0H6FLDft5A9LRSUF3gtsEUet87UaMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093316; x=1732698116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LgngNeKwC27cPz0lxxyz3TNcUMAaxfAOjCXqTyQA3s=;
        b=jx+I/J1aaQpoB+0KOoU9ZfPpva2V/USKEzxpZjw0vuK/kIp2zPoSgxEhD2SfINW0gs
         Km7bjrZ6r2LF90BZOMcfxfIrcj/SnP9XQR8qGjpM6WVIfxPeo9x5Yz/nMWU8g9svzV0q
         jo2i6StjKE6zio3X4mqvmAWFWxAnniYnqy1P+BhTtiQ0bgPY9+az3P8R2RTZgkSGm386
         jnvoINW+OYe2uOkrySMUw85ZI4epcnXWEx2I2o5pJcBFux5I2id/cdXXrvX45ADdHsc1
         nu54JjcUf2ipE6eoVfv9mi/HDG6aVfZW3RfI1lvycr8jS1MUfIKkEm9cFoTynis8gTRq
         rCXQ==
X-Gm-Message-State: AOJu0Yz9Cg/dwAfBIdG3Jsmo+4RLH5O+Q9HC9xXDBuRL40Cwgba8GXi/
	HHbF9FdiFkPyJ5yNcUgTviVQptfWZI5im89uTsnL2P4xOaJNfTxukHV0TE9UBF6mTbNySR+psnX
	B
X-Google-Smtp-Source: AGHT+IEfuvQcE4K1Mu8x7+ZwbXPnwWMt6m0/fi2E+HqN+2mfIAqwjK3HZAU3v9xOE6Os6GfSQSaz8w==
X-Received: by 2002:a17:907:9617:b0:a9e:e1a5:9746 with SMTP id a640c23a62f3a-aa4dd6b3c39mr158358566b.34.1732093316523;
        Wed, 20 Nov 2024 01:01:56 -0800 (PST)
Date: Wed, 20 Nov 2024 10:01:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <Zz2lgkjgRoZ7Sr5Q@macbook>
References: <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook>
 <ZzY1O-zrcWB6Ra3q@macbook>
 <BL1PR12MB5849FC8077C7C6035F1D3E15E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzczqznFbixk3Vfu@macbook>
 <BL1PR12MB5849894360DB8D96073AB21EE7272@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzyIk0KipX8LPZNv@macbook>
 <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849FC514034CDFC2F68BA6FE7212@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Nov 20, 2024 at 03:01:57AM +0000, Chen, Jiqian wrote:
> On 2024/11/19 20:46, Roger Pau Monné wrote:
> > On Mon, Nov 18, 2024 at 06:06:03AM +0000, Chen, Jiqian wrote:
> >> On 2024/11/15 19:42, Roger Pau Monné wrote:
> >>> On Fri, Nov 15, 2024 at 03:04:22AM +0000, Chen, Jiqian wrote:
> >>>> On 2024/11/15 01:36, Roger Pau Monné wrote:
> >>>>> On Thu, Nov 14, 2024 at 04:52:18PM +0100, Roger Pau Monné wrote:
> >>>>>> On Thu, Nov 14, 2024 at 06:11:46AM +0000, Chen, Jiqian wrote:
> >>>>>>> On 2024/11/13 18:30, Roger Pau Monné wrote:
> >>>>>>>> On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >>>>>>>>> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>>>>>>>>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>>>>>>>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>>>>>>>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>>>>>>>>> and then cause probing failure.
> >>>>>>>>>>>
> >>>>>>>>>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>>>>>>>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>>>>>>>>> corresponding handler into vpci.
> >>>>>>>>>>>
> >>>>>>>>>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>>>>>>>>
> >>>>>>>>>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>>>>>>>>> setting the new size.
> >>>>>>>>>>
> >>>>>>>>>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>>>>>>>>> time ago I've made a patch to add support for it, but due to lack of
> >>>>>>>>>> hardware on my side to test it I've never submitted it.
> >>>>>>>>>>
> >>>>>>>>>> My approach would be to detect the presence of the
> >>>>>>>>>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>>>>>>>>> capability is present force the sizing of BARs each time they are
> >>>>>>>>>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>>>>>>>>> the capability itself, as resizing can only happen when memory
> >>>>>>>>>> decoding is not enabled for the device.  It's enough to fetch the size
> >>>>>>>>>> of the BARs ahead of each enabling of memory decoding.
> >>>>>>>>>>
> >>>>>>>>>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>>>>>>>>> is already an expensive operation, the extra sizing is unlikely to
> >>>>>>>>>> make much of a difference performance wise.
> >>>>>>>>>>
> >>>>>>>>>> I've found the following on my git tree and rebased on top of staging:
> >>>>>>>>> OK.
> >>>>>>>>> Do you need me to validate your patch in my environment?
> >>>>>>>>
> >>>>>>>> Yes please, I have no way to test it.  Let's see what others think
> >>>>>>>> about the different approaches.
> >>>>>>> There are some errors with your method.
> >>>>>>> I attached the dmesg and xl dmesg logs.
> >>>>>>> From the dmesg logs, it seems that 0000:03:00.0 has addresse overlap with 0000:03:00.1
> >>>>>>
> >>>>>> Do you have the output of lspci with the BAR sizes/positions before
> >>>>>> and after the resizing?
> >>>>>>
> >>>>>>>
> >>>>>>> I think there is a place that needs to be modified regarding your method,
> >>>>>>> although this modification does not help with the above-mentioned errors,
> >>>>>>> it is that whether to support resizing is specific to which bar, rather than just determining whether there is a Rebar capability.
> >>>>>>
> >>>>>> Do we really need such fine-grained information?  It should be
> >>>>>> harmless (even if not strictly necessary) to size all BARs on the
> >>>>>> device before enabling memory decoding, even if some of them do not
> >>>>>> support resizing.
> >>>>>>
> >>>>>> I might have to provide a patch with additional messages to see what's
> >>>>>> going on.
> >>>>>
> >>>>> One nit that I've noticed with the patch I gave you previously is that
> >>>>> the check for a size change in modify_bars() should be done ahead of
> >>>>> pci_check_bar(), otherwise the check is possibly using an outdated
> >>>>> size.
> >>>>>
> >>>>> I've also added a debug message to notify when a BAR register is
> >>>>> written and report the new address.  This is done unconditionally, but
> >>>>> if you think it's too chatty you can limit to only printing for the
> >>>>> device that has the ReBAR capability.
> >>>> Errors are the same.
> >>>> Attached the dmesg, xl dmesg, patch and lspci output.
> >>>> I will also continue to debug your method on my side to try to get some findings.
> >>>
> >>> Hello,
> >>>
> >>> I've been looking at the output, and it all seems fine, except the
> >>> 03:00.0 device that becomes broken at some point, note the lspci
> >>> output lists [virtual] next to the resource sizes.  This means reading
> >>> for the registers returned 0, so the position and sizes are provided
> >>> from the internal OS information.
> >>>
> >>> I'm assuming the patch you sent to the list doesn't lead to such errors,
> >> Yes, the method of my patch doesn't lead to any errors.
> >> I attached the dmesg, xl dmesg and lspci logs of my method.
> >>
> >>> in which case I can only guess that fetching the size of the
> >>> BARs in modify_bars() causes issues with the device.
> >>>
> >>> To confirm this, can you try the following patch on top of your original change?  
> >> I tried below patch with my original patch, it didn't cause any errors.
> >> And the lspci showed without the "[virtual]".
> >> So, unfortunately, it is not related to the fetching size of Bars in modify_bars().
> > 
> > I see, I'm at a loss as to what's wrong with my patch.  Do you have
> > any additional patches on Xen when testing your or my approach?
> No, just my patch or your patch, base on upstream codes(kernel branch is linux-next and xen branch is staging).
> 
> > 
> > I sadly don't have any box with a PCI device that exposes the
> > resizable BAR capability, so I'm not able to test or debug this.
> > 
> > I would like to understand why my approach doesn't work, as otherwise
> > I feel like I'm missing how ReBAR is supposed to work.  Anyway, if you
> > can give a try to the diff below, it's the same patch, but with yet
> > even more debug messages added.
> Attached the xl dmesg.
> 
> > 
> > Thanks, and sorry for keeping you testing it.
> That's fine, feel free to send me if you need more test information.
> Actually I am still continuing to debug your patch and also curious about why your patch does not work.
> 
> The only difference between our methods is the timing of updating the size.
> Yours is later than mine because you updated the size when the driver re-enabled memory decoding, while I updated the size in time when driver resize it.

Indeed, my last guess is the stale cached size is somehow used in my
approach, and that leads to the failures.  One last (possibly dummy?)
thing to try might be to use your patch to detect writes to the resize
control register, but update the BAR sizes in modify_bars(), while
keeping the traces of when the operations happen.

> I suspect that the driver or hypervisor may have done something in between and read outdated information.
> I am debugging the driver codes.

Thanks for doing this.

I have a couple of side unrelated notes, something I've noticed from
the trace you provided, taking device 0000:03:00.1 as an example:

(XEN) 0000:03:00.1: modify bars cmd: 0 rom_only: 0
(XEN) 0000:03:00.1: write BAR0 val: 0xfffffff0 BAR0 address: 0xfffffff0
(XEN) 0000:03:00.1: write BAR0 val: 0xd0700000 BAR0 address: 0xd0700000
(XEN) 0000:03:00.1: modify bars cmd: 3 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 0 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 3 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 0 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 3 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 0 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 3 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 0 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 3 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 0 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 3 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 0 rom_only: 0
(XEN) 0000:03:00.1: modify bars cmd: 3 rom_only: 0
(XEN) PCI add device 0000:03:00.1

Linux toggles memory decoding individually for sizing each BAR.  This
is very costly when running virtualized (as least on Xen), as toggling
the memory decoding bit implies tearing down or creating p2m mappings
for all the BARs of the device.  It would be much better if Linux
toggled memory decoding, sized all the BARs of the device, and then
enabled memory decoding again.  If done that way you could probably
reduce boot time of Linux PVH dom0 noticeably.

Secondly, the call to "PCI add device" is too late.  It works now
because Xen scans for PCI devices, so those are already known and
setup by Xen.  But if it's a hotplug device (or a device that somehow
is not discovered by Xen at boot), doing the PHYSDEVOP_pci_device_add
hypercall after sizing the device is wrong, the hypercall should be
done ahead of Linux interacting with the device in any meaningful way.
The checks done for device discovery are fine are obviously fine to be
done ahead of the PHYSDEVOP_pci_device_add call.

Thanks, Roger.

