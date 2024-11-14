Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034F69C913A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 18:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836750.1252641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBe76-00019l-0R; Thu, 14 Nov 2024 17:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836750.1252641; Thu, 14 Nov 2024 17:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBe75-00017c-TW; Thu, 14 Nov 2024 17:58:39 +0000
Received: by outflank-mailman (input) for mailman id 836750;
 Thu, 14 Nov 2024 17:58:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBe73-00017W-SC
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 17:58:37 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 106d6518-a2b2-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 18:58:33 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5cf896558c4so406628a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 09:58:33 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79bb5e16sm770432a12.52.2024.11.14.09.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 09:58:32 -0800 (PST)
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
X-Inumbo-ID: 106d6518-a2b2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjEwNmQ2NTE4LWEyYjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjA3MTEzLjY5MDY4Nywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731607113; x=1732211913; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dtm1iDI8J3FRIKbZ5/bEpxmTTN5s+Qavrc2qoEa3w5w=;
        b=RnZNQMFhYwS6Yr8aTISni+sub310VWfCS50wvcW4Txxj+GqYdYhj3ilyIueAr2lgGx
         ++Q5oixU8+UacveLn3S5QRzkB1ifxtopp0f46Il3QUYFDCwG6bmJYXD+JmjqQcfQlAEn
         jJQDvPYb2GMGyJ1zLxadIBfrq42/WC09rwxu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731607113; x=1732211913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dtm1iDI8J3FRIKbZ5/bEpxmTTN5s+Qavrc2qoEa3w5w=;
        b=YU/bTNwDp3vbibowJGbvNdNhUYEJtvzxHrX7BkuCkR2Hczp7nYcgnc9Gyd9OkyEuaQ
         DD1+cpF14iA8ygerRl6sXRcHQpHvY0SOr7CtaYF+Qon7hVwacbxjA80Ea2D2h2zwDp8a
         lsFFFm40nux81Mvp7rOB+nwoIbXPNCuiKTlpl6M8bBa7ypOTrlsInCNrfInLjAGUcLGd
         wVFujw0m8w8tGgG0IBjLPLr87bvyK+Z+MkwoSOo26goXJPidhJ6dg4/xZQdslMSfrZ/m
         kJ14hksog9EDQxSe9StmX/+NFhJOvpCRHRK77KQmqLj9lHN8xLBWuaChY7KuHfvxWUWM
         /dOg==
X-Gm-Message-State: AOJu0Yz9xfdJuj0yRIsf5y2OMfuO7W7aLpnx7U9/jNIxrtTbTG3sSe2P
	s0Q9NUgJE8iKxxTn0eZniwDS5QG6zC8cFdirH4xFb5Mxrpa+uyfFal/Pnza/QU4=
X-Google-Smtp-Source: AGHT+IHcrmZBsW2jvJ1ISMAL4CKvGi/PF3YQ/CkMGQqUVgs4AGDzrzuacV9diW5nCNq9tIEKj65HHA==
X-Received: by 2002:a05:6402:26c2:b0:5cf:fa1:892d with SMTP id 4fb4d7f45d1cf-5cf0fa18bf4mr20290622a12.6.1731607112981;
        Thu, 14 Nov 2024 09:58:32 -0800 (PST)
Date: Thu, 14 Nov 2024 18:58:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzY6R4o9k8s8TsxH@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Nov 14, 2024 at 06:11:46AM +0000, Chen, Jiqian wrote:
> On 2024/11/13 18:30, Roger Pau Monné wrote:
> > On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> >> On 2024/11/13 17:30, Roger Pau Monné wrote:
> >>> On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >>>> Some devices, like discrete GPU of amd, support resizable bar capability,
> >>>> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >>>> and then cause probing failure.
> >>>>
> >>>> According to PCIe spec, each bar that support resizing has two registers,
> >>>> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >>>> corresponding handler into vpci.
> >>>>
> >>>> PCI_REBAR_CAP is RO, only provide reading.
> >>>>
> >>>> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >>>> setting the new size.
> >>>
> >>> I think the logic to handle resizable BAR could be much simpler.  Some
> >>> time ago I've made a patch to add support for it, but due to lack of
> >>> hardware on my side to test it I've never submitted it.
> >>>
> >>> My approach would be to detect the presence of the
> >>> PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> >>> capability is present force the sizing of BARs each time they are
> >>> mapped in modify_bars().  I don't think we need to trap accesses to
> >>> the capability itself, as resizing can only happen when memory
> >>> decoding is not enabled for the device.  It's enough to fetch the size
> >>> of the BARs ahead of each enabling of memory decoding.
> >>>
> >>> Note that memory decoding implies mapping the BARs into the p2m, which
> >>> is already an expensive operation, the extra sizing is unlikely to
> >>> make much of a difference performance wise.
> >>>
> >>> I've found the following on my git tree and rebased on top of staging:
> >> OK.
> >> Do you need me to validate your patch in my environment?
> > 
> > Yes please, I have no way to test it.  Let's see what others think
> > about the different approaches.
> There are some errors with your method.
> I attached the dmesg and xl dmesg logs.
> From the dmesg logs, it seems that 0000:03:00.0 has addresse overlap with 0000:03:00.1

I'm attempting to go over Linux dmesg, and so far got the following
information about the BAR positions for 0000:03:00.0 and 0000:03:00.1:

[    1.101522] pci 0000:03:00.0: [1002:73ff] type 00 class 0x030000 PCIe Legacy Endpoint
[    1.102416] pci 0000:03:00.0: BAR 0 [mem 0xfc90000000-0xfc9fffffff 64bit pref]
[    1.105592] pci 0000:03:00.0: BAR 2 [mem 0xfca0000000-0xfca01fffff 64bit pref]
[    1.106665] pci 0000:03:00.0: BAR 4 [io  0x2000-0x20ff]
[    1.109858] pci 0000:03:00.0: BAR 5 [mem 0xd0600000-0xd06fffff]
[    1.112962] pci 0000:03:00.0: ROM [mem 0xfffe0000-0xffffffff pref]
[    1.113543] pci 0000:03:00.0: PME# supported from D1 D2 D3hot D3cold
[    1.114031] pci 0000:03:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:01.1 (capable of 252.048 Gb/s with 16.0 GT/s PCIe x16 link)
[    1.115074] pci 0000:03:00.1: [1002:ab28] type 00 class 0x040300 PCIe Legacy Endpoint
[    1.115207] pci 0000:03:00.1: BAR 0 [mem 0xd0700000-0xd0703fff]
[    1.115962] pci 0000:03:00.1: PME# supported from D1 D2 D3hot D3cold
[  120.049678] amdgpu 0000:03:00.0: BAR 2 [mem 0xfca0000000-0xfca01fffff 64bit pref]: releasing
[  120.049682] amdgpu 0000:03:00.0: BAR 0 [mem 0xfc90000000-0xfc9fffffff 64bit pref]: releasing
[  120.049815] amdgpu 0000:03:00.0: BAR 0 [mem 0xa00000000-0xbffffffff 64bit pref]: assigned
[  120.049833] amdgpu 0000:03:00.0: BAR 2 [mem 0x900000000-0x9001fffff 64bit pref]: assigned

So the only BAR from 0000:03:00.1 is always at 0xd0700000-0xd0703fff,
and BARs for 0000:03:00.0 are relocated from:

0xfca0000000-0xfca01fffff -> 0x900000000-0x9001fffff (same size)
0xfc90000000-0xfc9fffffff -> 0xa00000000-0xbffffffff (resized)

So I see no overlap between the BARs of 0000:03:00.0 and 0000:03:00.1,
but maybe I'm missing some position changes, following Linux dmesg is
not easy.

Regards, Roger.

