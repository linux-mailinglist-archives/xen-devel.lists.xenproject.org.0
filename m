Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9BC9C6CE1
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835293.1251151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAdt-0000vz-F0; Wed, 13 Nov 2024 10:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835293.1251151; Wed, 13 Nov 2024 10:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAdt-0000th-Bw; Wed, 13 Nov 2024 10:30:33 +0000
Received: by outflank-mailman (input) for mailman id 835293;
 Wed, 13 Nov 2024 10:30:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbMU=SI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBAds-0000tb-6C
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:30:32 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d5a756e-a1aa-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:30:28 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso1068462866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:30:28 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4e1desm835437166b.81.2024.11.13.02.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 02:30:27 -0800 (PST)
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
X-Inumbo-ID: 4d5a756e-a1aa-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjRkNWE3NTZlLWExYWEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkzODI4Ljc0OTM3Niwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731493828; x=1732098628; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AijoLL8z2s13Q9NAAw4biLzHfg/TjccnSDT1lrR4Pl8=;
        b=B8xvVLkOQchDZqDbBiklHm5vgQE4I7O+db98bjyuAwAOJPdO05IGjQxhUxwzENCmNe
         ef/xGMoZlPHbp1cGxCr3JgynqnQkPGwGhk6C4g2pe3n+V4OOW18clCOVzwBh0HzaaXYH
         9hKl+9LDY9plLlXk4JFaD9ZwHaezmE8g9gh0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731493828; x=1732098628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AijoLL8z2s13Q9NAAw4biLzHfg/TjccnSDT1lrR4Pl8=;
        b=mxWwo9+UZj4Qs8F5r8shX83MOD6I1I0NtgdyiwkEFRcIWuBwIfxoDjEZa2PDRb/7+F
         n8rKGfT5GwnPH2Qinou4WRAZwQxKRy6hmQmr/qjpTy7wAk0p/l3BV6Pj0+S/Q90j9S8V
         tC7ESIlSRo70t+kp2xjKWt5L/1/1N9oMVtFTZXCF/6W18ZlXo1xJAKBFRY3j0AmjpdHM
         ls6CQkStO1O8Fm/f0JRg5nATOTUfDXOHNrASaqmG77Uz/rrctd1MQRkoHLBxduu4H0JW
         aAVJQpGFYXYeDEhioJ4KyvYk6bDsCZjJmPmEj8En1UUwZC9RsKs1u4CKRa6UbTUTQqIQ
         Xbug==
X-Gm-Message-State: AOJu0YwQSzOYMLPD65iVZ/V/aFTUDMJ+QGOHa9SNaL/e4hhL5TmGUqIL
	lt1sCckwmLBxfGTqfJO2OYuJrVyFQgBEZZhW2WsWOzkxejaOUIRmnq3lYZsb37g=
X-Google-Smtp-Source: AGHT+IEivFLBq/eVtE//vJBY65WZ8R0bFnHdGZMztknKEWWLi1zG0RDTDexC5ckS81KCGZmTW3eo4Q==
X-Received: by 2002:a17:907:7f1f:b0:a99:f4be:7a6a with SMTP id a640c23a62f3a-a9eeffdc630mr2049560866b.47.1731493828033;
        Wed, 13 Nov 2024 02:30:28 -0800 (PST)
Date: Wed, 13 Nov 2024 11:30:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <ZzR_wlY0wXjqec8T@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Nov 13, 2024 at 10:00:33AM +0000, Chen, Jiqian wrote:
> On 2024/11/13 17:30, Roger Pau Monné wrote:
> > On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >> Some devices, like discrete GPU of amd, support resizable bar capability,
> >> but vpci of Xen doesn't support this feature, so they fail to resize bars
> >> and then cause probing failure.
> >>
> >> According to PCIe spec, each bar that support resizing has two registers,
> >> PCI_REBAR_CAP and PCI_REBAR_CTRL, so add these two registers and their
> >> corresponding handler into vpci.
> >>
> >> PCI_REBAR_CAP is RO, only provide reading.
> >>
> >> PCI_REBAR_CTRL only has bar size is RW, so add write function to support
> >> setting the new size.
> > 
> > I think the logic to handle resizable BAR could be much simpler.  Some
> > time ago I've made a patch to add support for it, but due to lack of
> > hardware on my side to test it I've never submitted it.
> > 
> > My approach would be to detect the presence of the
> > PCI_EXT_CAP_ID_REBAR capability in init_header(), and if the
> > capability is present force the sizing of BARs each time they are
> > mapped in modify_bars().  I don't think we need to trap accesses to
> > the capability itself, as resizing can only happen when memory
> > decoding is not enabled for the device.  It's enough to fetch the size
> > of the BARs ahead of each enabling of memory decoding.
> > 
> > Note that memory decoding implies mapping the BARs into the p2m, which
> > is already an expensive operation, the extra sizing is unlikely to
> > make much of a difference performance wise.
> > 
> > I've found the following on my git tree and rebased on top of staging:
> OK.
> Do you need me to validate your patch in my environment?

Yes please, I have no way to test it.  Let's see what others think
about the different approaches.

> And I have one question: where does your patch do writing the resizing size into hardware?

dom0 has unrestricted access to the resize capability, so the value
written by dom0 is propagated to the hardware without modification.

I would be wary of exposing the resize capability to untrusted
domains, as allowing a domU to change the size of BARs can lead to
overlapping if the hardware domain hasn't accounted for the increase
in BAR size.

Thanks, Roger.

